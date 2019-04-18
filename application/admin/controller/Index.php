<?php
namespace app\admin\controller;

class Index extends Base
{
    // 后台总体框架
    public function index()
    {
        return $this->fetch('/index');
    }

    // 后台默认首页
    public function indexPage()
    {
        $data = db('now_data')->where('id', 1)->find();

        // 生成从 8点 到 22点的时间数组
        $dateLine = array_map(function($vo){
            if($vo < 10){
                return '0' . $vo;
            }else{
                return $vo;
            }
        }, range(8, 22));

        // 初始化数据
        $line = [];
        foreach($dateLine as $key=>$vo){
            $line[$vo] = [
                'is_talking' => 0,
                'in_queue' => 0,
                'success_in' => 0,
                'total_in' => 0
            ];
        }

        $dbData = db('service_data')->where('add_date', date('Y-m-d'))->group('add_hour')->select();

        foreach($line as $key=>$vo){
            foreach($dbData as $k=>$v){
                if($v['add_hour'] == $key){
                    $line[$key]['is_talking'] = $v['is_talking'];
                    $line[$key]['in_queue'] = $v['in_queue'];
                    $line[$key]['success_in'] = $v['success_in'];
                    $line[$key]['total_in'] = $v['total_in'];

                    unset($dbData[$k]);
                    continue;
                }
            }
        }

        $showData = [];
        foreach($line as $key=>$vo){
            $showData['is_talking'][] = $vo['is_talking'];
            $showData['in_queue'][] = $vo['in_queue'];
            $showData['success_in'][] = $vo['success_in'];
            $showData['total_in'][] = $vo['total_in'];
        }

        $this->assign([
            'data' => $data,
            'show_data' => json_encode($showData)
        ]);

        return $this->fetch('index');
    }

    // 清除缓存
    public function clear()
    {
        if (false === removeDir(RUNTIME_PATH)) {
            return json(['code' => -1, 'data' => '', 'msg' => '清除缓存失败']);
        }
        return json(['code' => 1, 'data' => '', 'msg' => '清除缓存成功']);
    }

    // 修改管理员密码
    public function changePassword()
    {
        if(request()->isPost()){

            $param = input('post.');
            $reLogin = false;

            if(empty($param['old_pwd']) && !empty($param['password'])){
                return json(['code' => -2, 'data' => '', 'msg' => '请输入旧密码']);
            }

            if(!empty($param['old_pwd']) && empty($param['password'])){
                return json(['code' => -3, 'data' => '', 'msg' => '请输入新密码']);
            }

            if(!empty($param['old_pwd']) && !empty($param['password'])){

                $userPwd = db('admins')->where('id', cookie('user_id'))->find();
                if(empty($userPwd)){
                    return json(['code' => -4, 'data' => '', 'msg' => '管理员不存在']);
                }

                if(md5($param['old_pwd'] . config('salt')) != $userPwd['password']){
                    return json(['code' => -1, 'data' => '', 'msg' => '旧密码错误']);
                }

                $info['password'] = md5($param['password'] . config('salt'));
                $reLogin = true;
            }

            db('admins')->where('id', cookie('user_id'))->setField('password', $info['password']);

            return json(['code' => 1, 'data' => $reLogin, 'msg' => '修改信息成功']);
        }
    }
}
