<?php
ini_set('date.timezone', 'Asia/Shanghai');
/**
 * This file is part of workerman.
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the MIT-LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @author walkor<walkor@workerman.net>
 * @copyright walkor<walkor@workerman.net>
 * @link http://www.workerman.net/
 * @license http://www.opensource.org/licenses/mit-license.php MIT License
 */

/**
 * 用于检测业务代码死循环或者长时间阻塞等问题
 * 如果发现业务卡死，可以将下面declare打开（去掉//注释），并执行php start.php reload
 * 然后观察一段时间workerman.log看是否有process_timeout异常
 */

//declare(ticks=1);
use \GatewayWorker\Lib\Gateway;
use Workerman\Lib\Timer;
use \GatewayWorker\Lib\Db;
use Config\Db as DbConfig;

/**
 * 主逻辑
 * 主要是处理 onConnect onMessage onClose 三个方法
 * onConnect 和 onClose 如果不需要可以不用实现并删除
 */

//如果指定某个域名才能connect，请修改这里
//const HTTP_ORIGIN = '';

class Events
{
    /**
     * 新建一个类的静态成员，用来保存数据库实例
     */
    public static $db = null;
    public static $global = null;
    public static $global_cfg = null;

    /**
     * 进程启动后初始化数据库连接
     */
    public static function onWorkerStart($worker)
    {
        if (empty(self::$db)) {
            self::$db = Db::instance('db');  //数据库链接

        }
        if (empty(self::$global_cfg)) {
            self::$global_cfg = DbConfig::$config;  //分布式数据配置

        }
        if (empty(self::$global)) {
            self::$global = new \GlobalData\Client(self::$global_cfg['globalData']);
            // 客服列表
            if (is_null(self::$global->kfList)) {
                self::$global->kfList = [];
            }
            // 会员列表[动态的，这里面只是目前未被分配的会员信息]
            if (is_null(self::$global->userList)) {
                self::$global->userList = [];
            }
            // 会员以 uid 为key的信息简表,只有在用户退出的时候，才去执行修改
            if (is_null(self::$global->uidSimpleList)) {
                self::$global->uidSimpleList = [];
            }
            // 当天的累积接入值
            $key = date('Ymd') . 'total_in';
            if (is_null(self::$global->$key)) {
                self::$global->$key = 0;

                $oldKey = date('Ymd', strtotime('-1 day')); // 删除前一天的统计值
                unset(self::$global->$oldKey);
                unset($oldKey, $key);
            }
            // 成功接入值
            $key = date('Ymd') . 'success_in';
            if (is_null(self::$global->$key)) {
                self::$global->$key = 0;

                $oldKey = date('Ymd', strtotime('-1 day')); // 删除前一天的统计值
                unset(self::$global->$oldKey);
                unset($oldKey, $key);
            }
        }

        // 定时统计数据
        if (0 === $worker->id) {
            // 1分钟统计一次实时数据
            Timer::add(60 * 1, function () {
                self::writeLog(1);
            });
            // 40分钟写一次当前日期点数的log数据
            Timer::add(60 * 40, function () {
                self::writeLog(2);
            });
        }
    }

    /**
     * 当客户端连接时触发
     * 如果业务不需此回调可以删除onConnect
     *
     * @param int $client_id 连接id
     */
    public static function onConnect($client_id)
    {
        // $client_id->onWebSocketConnect = function($client_id , $http_header)
        // {
        //     // 可以在这里判断连接来源是否合法，不合法就关掉连接
        //     // $_SERVER['HTTP_ORIGIN']标识来自哪个站点的页面发起的websocket链接
        //     if($_SERVER['HTTP_ORIGIN'] != 'http://laykefu.guoshanchina.com')
        //     {
        //         $client_id->close();
        //     }
        //     // onWebSocketConnect 里面$_GET $_SERVER是可用的
        //     // var_dump($_GET, $_SERVER);
        // };
    }

    /**
     * 当客户端发来消息时触发
     * @param int $client_id 连接id
     * @param mixed $message 具体消息
     */
    public static function onMessage($client_id, $message)
    {
        $message = json_decode($message, true);
        switch ($message['type']) {
            // 客服初始化
            case 'init':
                $kfList = self::$global->kfList;
                // 如果该客服未在内存中记录则记录
                if (!isset($kfList[$message['group']]) || !array_key_exists($message['uid'], $kfList[$message['group']])) {

                    do {
                        $newKfList = $kfList;
                        $newKfList[$message['group']][$message['uid']] = [
                            'id' => $message['uid'],
                            'name' => $message['name'],
                            'avatar' => $message['avatar'],
                            'client_id' => $client_id,
                            'task' => 0,
                            'user_info' => []
                        ];
                    } while (!self::$global->cas('kfList', $kfList, $newKfList));
                    unset($newKfList, $kfList);
                } else if (isset($kfList[$message['group']][$message['uid']])) {

                    do {
                        $newKfList = $kfList;
                        $newKfList[$message['group']][$message['uid']]['client_id'] = $client_id;
                    } while (!self::$global->cas('kfList', $kfList, $newKfList));
                    unset($newKfList, $kfList);
                }

                // 绑定 client_id 和 uid
                Gateway::bindUid($client_id, $message['uid']);
                // 客服上线通知在线用户
                $msg = [
                    'message_type' => 'kf_online',
                    'data' => [
                        'kf_name' => $message['name'],
                        'kf_avatar' => $message['avatar'],
                        'kf_id' => $message['uid'],
                        'kf_group' => $message['group'],
                        'time' => date('Y-m-d H:i:s'),
                    ]
                ];
                Gateway::sendToAll(json_encode($msg));
                break;
            // 顾客初始化
            case 'userInit';
                $userList = self::$global->userList;
                // 如果该顾客未在内存中记录则记录
                if (!array_key_exists($message['uid'], $userList)) {
                    do {
                        $NewUserList = $userList;
                        $NewUserList[$message['uid']] = [
                            'id' => $message['uid'],
                            'name' => $message['name'],
                            'avatar' => $message['avatar'],
                            'ip' => isset($_SERVER['REMOTE_ADDR']) ? $_SERVER['REMOTE_ADDR'] : '',
                            'group' => $message['group'],
                            'client_id' => $client_id
                        ];

                    } while (!self::$global->cas('userList', $userList, $NewUserList));
                    unset($NewUserList, $userList);

                    // 维护 UID对应的client_id 数组
                    do {
                        $old = $newList = self::$global->uidSimpleList;
                        $newList[$message['uid']] = [
                            $client_id,
                            $message['group']
                        ];

                    } while (!self::$global->cas('uidSimpleList', $old, $newList));
                    unset($old, $newList);

                    // 写入接入值
                    $key = date('Ymd') . 'total_in';
                    self::$global->$key = 0;
                    do {
                        $oldKey = date('Ymd', strtotime('-1 day')); // 删除前一天的统计值
                        unset(self::$global->$oldKey);
                    } while (!self::$global->increment($key));
                    unset($key);
                }

                // 绑定 client_id 和 uid
                Gateway::bindUid($client_id, $message['uid']);
                print_r('1注册');
                // 尝试分配新会员进入服务
                self::userOnlineTask($client_id, $message['group']);
                break;
            // 聊天
            case 'chatMessage':

                $client = Gateway::getClientIdByUid($message['data']['to_id']);
                if (!empty($client)) {
                    $chat_message = [
                        'message_type' => 'chatMessage',
                        'data' => [
                            'name' => $message['data']['from_name'],
                            'avatar' => $message['data']['from_avatar'],
                            'id' => $message['data']['from_id'],
                            'time' => date('Y-m-d H:i:s'),
                            'content' => htmlspecialchars($message['data']['content']),
                        ]
                    ];
                    Gateway::sendToClient($client['0'], json_encode($chat_message));
                    unset($chat_message);

                    // 聊天信息入库
                    $serviceLog = [
                        'from_id' => $message['data']['from_id'],
                        'from_name' => $message['data']['from_name'],
                        'from_avatar' => $message['data']['from_avatar'],
                        'to_id' => $message['data']['to_id'],
                        'to_name' => $message['data']['to_name'],
                        'content' => $message['data']['content'],
                        'time_line' => time()
                    ];

                    self::$db->insert('ws_chat_log')->cols($serviceLog)->query();
                    unset($serviceLog);
                }
                break;
            // 转接
            case 'changeGroup':
                // 通知客户端转接中
                $simpleList = self::$global->uidSimpleList;

                if (!isset($simpleList[$message['uid']])) { // 客户已经退出
                    return;
                }

                $userClient = $simpleList[$message['uid']]['0'];
                $userGroup = $simpleList[$message['uid']]['1'];  // 会员原来的分组也是客服的分组

                $reLink = [
                    'message_type' => 'relinkMessage'
                ];
                Gateway::sendToClient($userClient, json_encode($reLink));
                unset($reLink);

                // 记录该客服与该会员的服务结束
                self::$db->query("update `ws_service_log` set `end_time` = " . time() . " where `client_id`= '" . $userClient . "'");

                // 从当前客服的服务表中删除这个会员
                $old = $kfList = self::$global->kfList;
                if (!isset($kfList[$userGroup])) {
                    $waitMsg = '暂时没有相关客服上班,请稍后再咨询。';
                    // 逐一通知
                    foreach (self::$global->userList as $vo) {

                        $waitMessage = [
                            'message_type' => 'wait',
                            'data' => [
                                'content' => $waitMsg,
                            ]
                        ];
                        Gateway::sendToClient($userClient, json_encode($waitMessage));
                        unset($waitMessage);
                    }
                    return;
                }
                $myList = $kfList[$userGroup]; // 该客服分组数组
                foreach ($myList as $key => $vo) {
                    if (in_array($userClient, $vo['user_info'])) {

                        // 维护现在的该客服的服务信息
                        $kfList[$userGroup][$key]['task'] -= 1; // 当前服务的人数 -1
                        foreach ($vo['user_info'] as $k => $v) {
                            if ($userClient == $v) {
                                unset($kfList[$userGroup][$key]['user_info'][$k]);
                                break;
                            }
                        }

                        break;
                    }
                }
                while (!self::$global->cas('kfList', $old, $kfList)) {
                }; // 刷新内存中客服的服务列表
                unset($old, $kfList, $myList);

                // 将会员加入队列中
                $userList = self::$global->userList;
                do {
                    $NewUserList = $userList;
                    $NewUserList[$message['uid']] = [
                        'id' => $message['uid'],
                        'name' => $message['name'],
                        'avatar' => $message['avatar'],
                        'ip' => $message['ip'],
                        'group' => $message['group'], // 指定要链接的分组
                        'client_id' => $userClient
                    ];

                } while (!self::$global->cas('userList', $userList, $NewUserList));
                unset($NewUserList, $userList);

                // 执行会员分配通知双方
                self::userOnlineTask($userClient, $message['group']);
                unset($userClient, $userGroup);

                break;
            case 'closeUser':

                $userInfo = self::$global->uidSimpleList;
                if (isset($userInfo[$message['uid']])) {
                    $waitMessage = [
                        'message_type' => 'wait',
                        'data' => [
                            'content' => '暂时没有客服上班,请稍后再咨询。',
                        ]
                    ];
                    Gateway::sendToClient($userInfo[$message['uid']]['0'], json_encode($waitMessage));
                    unset($waitMessage);
                }
                unset($userInfo);
                break;
            case 'ping':
                if (isset($message['data']['l_user_id'])) {
                    $user = self::$db->query("SELECT `status` FROM `ws_users` WHERE `id`={$message['data']['l_user_id']} LIMIT 1");
                    if ($user[0]['status'] == 2) {
                        $waitMessage = [
                            'message_type' => 'close',
                        ];
                        Gateway::sendToClient($userInfo[$message['uid']]['0'], json_encode($waitMessage));
                        unset($waitMessage);
                    }
                }
                break;
        }
    }

    /**
     * 当用户断开连接时触发
     * @param int $client_id 连接id
     *
     * tips: 当服务端主动退出的时候，会出现 exit status 9.原因是：服务端主动断开之后，连接的客户端会走这个方法，而短时间内进程
     * 需要处理这多的逻辑，又有cas操作，导致进程退出会超时，然后会被内核杀死，从而报出错误 9.实际对真正的业务没有任何的影响。
     */
    public static function onClose($client_id)
    {
        $isServiceUserOut = false;
        // 将会员服务信息，从客服的服务列表中移除
        $old = $kfList = self::$global->kfList;
        foreach ($kfList as $k => $v) {
            foreach ($v as $key => $vo) {
                if (in_array($client_id, $vo['user_info'])) {

                    $isServiceUserOut = true;

                    // 根据client id 去更新这个会员离线的一些信息
                    self::$db->query("update `ws_service_log` set `end_time` = " . time() . " where `client_id`= '" . $client_id . "'");

                    // 从会员的内存表中检索出该会员的信息，并更新内存
                    $oldSimple = $simpleList = self::$global->uidSimpleList;
                    $outUser = [];
                    foreach ($simpleList as $u => $c) {
                        if ($c['0'] == $client_id) {
                            $outUser[] = [
                                'user_id' => $u,
                                'group_id' => $c['1']
                            ];
                            unset($simpleList[$u]);
                            break;
                        }
                    }
                    while (!self::$global->cas('uidSimpleList', $oldSimple, $simpleList)) {
                    };
                    unset($oldSimple, $simpleList);

                    //$outUser = self::$db->query("select `user_id`,`group_id` from `ws_service_log` where `client_id`= '" . $client_id . "'");
                    // 通知 客服删除退出的用户
                    if (!empty($outUser)) {
                        $del_message = [
                            'message_type' => 'delUser',
                            'data' => [
                                'id' => $outUser['0']['user_id']
                            ]
                        ];
                        Gateway::sendToClient($vo['client_id'], json_encode($del_message));
                        unset($del_message);

                        // 尝试分配新会员进入服务
                        self::userOfflineTask($outUser['0']['group_id']);
                    }
                    unset($outUser);

                    // 维护现在的该客服的服务信息
                    $kfList[$k][$key]['task'] -= 1; // 当前服务的人数 -1
                    foreach ($vo['user_info'] as $m => $l) {
                        if ($client_id == $l) {
                            unset($kfList[$k][$key]['user_info'][$m]);
                            break;
                        }
                    }

                    // 刷新内存中客服的服务列表
                    while (!self::$global->cas('kfList', $old, $kfList)) {
                    };
                    unset($old, $kfList);

                    break;
                }
            }

            if ($isServiceUserOut) break;
        }


        // 尝试从排队的用户中删除退出的客户端
        if (false == $isServiceUserOut) {
            $old = $userList = self::$global->userList;
            foreach (self::$global->userList as $key => $vo) {
                if ($client_id == $vo['client_id']) {

                    $isServiceUserOut = true;

                    unset($userList[$key]);
                    break;
                }
            }
            while (!self::$global->cas('userList', $old, $userList)) {
            };

            // 从会员的内存表中检索出该会员的信息，并更新内存
            $oldSimple = $simpleList = self::$global->uidSimpleList;
            foreach ($simpleList as $u => $c) {
                if ($c['0'] == $client_id) {
                    unset($simpleList[$u]);
                    break;
                }
            }
            while (!self::$global->cas('uidSimpleList', $oldSimple, $simpleList)) {
            };
            unset($oldSimple, $simpleList);
        }

        // 尝试是否是客服退出
        if (false == $isServiceUserOut) {
            $type = [
                'message_type' => 'kf_offline'
            ];
            $old = $kfList = self::$global->kfList;
            foreach (self::$global->kfList as $k => $v) {
                $type['data']['kf_group'] = $k;
                foreach ($v as $key => $vo) {
                    $type['data']['kf_id'] = $vo['id'];
                    $type['data']['kf_name'] = $vo['name'];
                    foreach ($vo['user_info'] as $userId) {
                        Gateway::sendToClient($userId, json_encode($type));
                    }
                    // 客服服务列表中无数据，才去删除客服内存信息
                    // && (0 == count($vo['user_info']))
                    if ($client_id == $vo['client_id']) {
                        unset($kfList[$k][$key]);
                        break;
                    }
                }
            }

            while (!self::$global->cas('kfList', $old, $kfList)) {
            };
        }
    }


    /**
     * 有人退出
     * @param $group
     */
    private static function userOfflineTask($group)
    {
        // TODO 此处查询最大的可服务人数，后面可以用其他的方式，存储这个数值，让其更高效的访问
        $maxNumber = self::getMaxServiceNum();

        $res = self::assignmentTask(self::$global->kfList, self::$global->userList, $group, $maxNumber);
        unset($maxNumber);

        if (1 == $res['code']) {

            while (!self::$global->cas('kfList', self::$global->kfList, $res['data']['4'])) {
            }; // 更新客服数据
            while (!self::$global->cas('userList', self::$global->userList, $res['data']['5'])) {
            }; // 更新会员数据

            // 通知会员发送信息绑定客服的id
            $noticeUser = [
                'message_type' => 'connect',
                'data' => [
                    'kf_id' => $res['data']['0'],
                    'kf_name' => $res['data']['1']
                ]
            ];
            Gateway::sendToClient($res['data']['3']['client_id'], json_encode($noticeUser));
            unset($noticeUser);

            // 通知客服端绑定会员的信息
            $noticeKf = [
                'message_type' => 'connect',
                'data' => [
                    'user_info' => $res['data']['3']
                ]
            ];
            Gateway::sendToClient($res['data']['2'], json_encode($noticeKf));
            unset($noticeKf);

            // 逐一通知
            $number = 1;
            foreach (self::$global->userList as $vo) {

                $waitMsg = '您前面还有 ' . $number . ' 位会员在等待。';
                $waitMessage = [
                    'message_type' => 'wait',
                    'data' => [
                        'content' => $waitMsg,
                    ]
                ];

                Gateway::sendToClient($vo['client_id'], json_encode($waitMessage));
                $number++;
            }
            unset($waitMessage, $number);

            // 写入接入值
            $key = date('Ymd') . 'success_in';
            self::$global->$key = 0;
            do {
                $oldKey = date('Ymd', strtotime('-1 day')); // 删除前一天的统计值
                unset(self::$global->$oldKey);
            } while (!self::$global->increment($key));
            unset($key);

        } else {

            switch ($res['code']) {

                case -1:
                    $waitMsg = '暂时没有客服上班,请稍后再咨询。';
                    // 逐一通知
                    foreach (self::$global->userList as $vo) {

                        $waitMessage = [
                            'message_type' => 'wait',
                            'data' => [
                                'content' => $waitMsg,
                            ]
                        ];
                        Gateway::sendToClient($vo['client_id'], json_encode($waitMessage));
                    }
                    break;
                case -2:
                    break;
                case -3:
                    break;
                case -4:
                    // 逐一通知
                    $number = 1;
                    foreach (self::$global->userList as $vo) {

                        $waitMsg = '您前面还有 ' . $number . ' 位会员在等待。';
                        $waitMessage = [
                            'message_type' => 'wait',
                            'data' => [
                                'content' => $waitMsg,
                            ]
                        ];

                        Gateway::sendToClient($vo['client_id'], json_encode($waitMessage));
                        $number++;
                    }
                    break;
            }
            unset($waitMessage, $number);
        }
    }

    /**
     * 有人进入执行分配
     * @param $client_id
     * @param $group
     */
    private static function userOnlineTask($client_id, $group)
    {
        // TODO 此处查询最大的可服务人数，后面可以用其他的方式，存储这个数值，让其更高效的访问
        $maxNumber = self::getMaxServiceNum();

        $res = self::assignmentTask(self::$global->kfList, self::$global->userList, $group, $maxNumber);
        unset($maxNumber);

        if (1 == $res['code']) {

            while (!self::$global->cas('kfList', self::$global->kfList, $res['data']['4'])) {
            }; // 更新客服数据
            while (!self::$global->cas('userList', self::$global->userList, $res['data']['5'])) {
            }; // 更新会员数据

            // 通知会员发送信息绑定客服的id
            $noticeUser = [
                'message_type' => 'connect',
                'data' => [
                    'kf_id' => $res['data']['0'],
                    'kf_name' => $res['data']['1']
                ]
            ];
            Gateway::sendToClient($client_id, json_encode($noticeUser));
            unset($noticeUser);

            // 检测是否开启自动应答
            $sayHello = self::$db->query('select `word`,`status` from `ws_reply` where `id` = 1');
            if (!empty($sayHello) && 1 == $sayHello['0']['status']) {

                $hello = [
                    'message_type' => 'helloMessage',
                    'data' => [
                        'name' => $res['data']['1'],
                        'avatar' => '',
                        'id' => $res['data']['0'],
                        'time' => date('Y-m-d H:i:s'),
                        'content' => htmlspecialchars($sayHello['0']['word'])
                    ]
                ];
                Gateway::sendToClient($client_id, json_encode($hello));
                unset($hello);
            }
            unset($sayHello);

            // 通知客服端绑定会员的信息
            $noticeKf = [
                'message_type' => 'connect',
                'data' => [
                    'user_info' => $res['data']['3']
                ]
            ];
            Gateway::sendToClient($res['data']['2'], json_encode($noticeKf));
            unset($noticeKf);

            // 服务信息入库
            $serviceLog = [
                'user_id' => $res['data']['3']['id'],
                'client_id' => $res['data']['3']['client_id'],
                'user_name' => $res['data']['3']['name'],
                'user_ip' => $res['data']['3']['ip'],
                'user_avatar' => $res['data']['3']['avatar'],
                'kf_id' => intval(ltrim($res['data']['0'], 'KF')),
                'start_time' => time(),
                'group_id' => $group,
                'end_time' => 0
            ];

            $init_service_log = [
                'user_id' => $res['data']['3']['id'],
                'kf_id' => intval(ltrim($res['data']['0'], 'KF')),
                'group_id' => $group,
                'end_time' => 0
            ];

            self::$db->delete('ws_service_log')->where($init_service_log)->query();
            unset($init_service_log);
            print_r($serviceLog);
            self::$db->insert('ws_service_log')->cols($serviceLog)->query();
            unset($serviceLog);

            // 写入接入值
            $key = date('Ymd') . 'success_in';
            self::$global->$key = 0;
            do {
                $oldKey = date('Ymd', strtotime('-1 day')); // 删除前一天的统计值
                unset(self::$global->$oldKey);
            } while (!self::$global->increment($key));
            unset($key);

        } else {

            $waitMsg = '';
            switch ($res['code']) {

                case -1:
                    $waitMsg = '暂时没有客服上班,请稍后再咨询。';
                    break;
                case -2:
                    break;
                case -3:
                    break;
                case -4:
                    $number = count(self::$global->userList);
                    $waitMsg = '您前面还有 ' . $number . ' 位会员在等待。';
                    break;
            }

            $waitMessage = [
                'message_type' => 'wait',
                'data' => [
                    'content' => $waitMsg,
                ]
            ];

            Gateway::sendToClient($client_id, json_encode($waitMessage));
            unset($waitMessage);
        }
    }


    /**
     * 给客服分配会员【均分策略】
     * @param $kfList
     * @param $userList
     * @param $group
     * @param $total
     */
    private static function assignmentTask($kfList, $userList, $group, $total)
    {
        // 没有客服上线
        if (empty($kfList) || empty($kfList[$group])) {
            return ['code' => -1];
        }

        // 没有待分配的会员
        if (empty($userList)) {
            return ['code' => -2];
        }

        // 未设置每个客服可以服务多少人
        if (0 == $total) {
            return ['code' => -3];
        }

        // 查看该组的客服是否在线
        if (!isset($kfList[$group])) {
            return ['code' => -1];
        }

        $kf = $kfList[$group];
        $user = array_shift($userList);

        $kf = array_shift($kf);
        $min = $kf['task'];
        $flag = $kf['id'];

        foreach ($kfList[$group] as $key => $vo) {
            if ($vo['task'] < $min) {
                $min = $vo['task'];
                $flag = $key;
            }
        }
        unset($kf);

        // 需要排队了
        if ($kfList[$group][$flag]['task'] == $total) {
            return ['code' => -4];
        }

        $kfList[$group][$flag]['task'] += 1;
        array_push($kfList[$group][$flag]['user_info'], $user['client_id']); // 被分配的用户信息

        return [
            'code' => 1,
            'data' => [
                $kfList[$group][$flag]['id'],
                $kfList[$group][$flag]['name'],
                $kfList[$group][$flag]['client_id'],
                $user,
                $kfList,
                $userList
            ]
        ];
    }

    /**
     * 获取最大的服务人数
     * @return int
     */
    private static function getMaxServiceNum()
    {
        $maxNumber = self::$db->query('select `max_service` from `ws_config` where `id` = 1');
        if (!empty($maxNumber)) {
            $maxNumber = 5;
        } else {
            $maxNumber = $maxNumber['0']['max_service'];
        }

        return $maxNumber;
    }

    /**
     * 将内存中的数据写入统计表
     * @param int $flag
     */
    private static function writeLog($flag = 1)
    {
        // 上午 8点 到 22 点开始统计
        if (date('H') < 8 || date('H') > 22) {
            return;
        }

        // 当前正在接入的人 和 在线客服数
        $kfList = self::$global->kfList;

        $nowTalking = 0;
        $onlineKf = 0;
        if (!empty($kfList)) {

            foreach ($kfList as $key => $vo) {

                $onlineKf += count($vo);
                foreach ($vo as $k => $v) {
                    $nowTalking += count($v['user_info']);
                }
            }
        }

        // 在队列中的用户
        $inQueue = count(self::$global->userList);

        $key = date('Ymd') . 'total_in';
        $key2 = date('Ymd') . 'success_in';
        $param = [
            'is_talking' => $nowTalking,
            'in_queue' => $inQueue,
            'online_kf' => $onlineKf,
            'success_in' => self::$global->$key2,
            'total_in' => self::$global->$key,
            'now_date' => date('Y-m-d')
        ];
        self::$db->update('ws_now_data')->cols($param)->where('id=1')->query();

        if (2 == $flag) {
            $param = [
                'is_talking' => $nowTalking,
                'in_queue' => $inQueue,
                'online_kf' => $onlineKf,
                'success_in' => self::$global->$key2,
                'total_in' => self::$global->$key,
                'add_date' => date('Y-m-d'),
                'add_hour' => date('H'),
                'add_minute' => date('i'),
            ];
            self::$db->insert('ws_service_data')->cols($param)->query();
        }
        unset($kfList, $nowTalking, $inQueue, $onlineKf, $key, $key2, $param);
    }
}
