<?php
use think\Env;
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

return [
    // +----------------------------------------------------------------------
    // | 应用设置
    // +----------------------------------------------------------------------

    // 当前系统版本
    'version' => Env::get('config.version', 'v1.0.1'),

    // 加密盐
    'salt' => Env::get('config.salt', '~shmilylbelva!@#'),

    // socket server
    'socket' => Env::get('config.socket', '127.0.0.1:7272'),

    // 管理员登录时间
    'save_time' => Env::get('config.save_time', 86400),
    // 应用命名空间
    'app_namespace'          => 'app',
    // 应用调试模式
    'app_debug'              => true,
    // 应用Trace
    'app_trace'              => false,
];
