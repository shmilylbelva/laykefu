<?php
// 自动加载类
require_once __DIR__ . '/../../../autoload.php';
use \Workerman\Worker;
use \GatewayWorker\BusinessWorker;

// bussinessWorker 进程
$worker = new BusinessWorker();
// worker名称
$worker->name = 'ChatBusinessWorker';
// bussinessWorker进程数量
$worker->count = 4;
// 服务注册地址,请设置成服务器内网ip
$worker->registerAddress = '127.0.0.1:1236';
$worker->eventHandler = 'Events';
// 如果不是在根目录启动，则运行runAll方法
if(!defined('GLOBAL_START'))
{
    Worker::runAll();
}

