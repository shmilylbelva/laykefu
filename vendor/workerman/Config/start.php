<?php
/**
 * run with command
 * php start.php start
 */

ini_set('display_errors', 'on');
ini_set('date.timezone','Asia/Shanghai');
use Workerman\Worker;

if(strpos(strtolower(PHP_OS), 'win') === 0)
{
    exit("start.php not support windows, please use start_for_win.bat\n");
}

// 检查扩展
if(!extension_loaded('pcntl'))
{
    exit("Please install pcntl extension. See http://doc3.workerman.net/appendices/install-extension.html\n");
}

if(!extension_loaded('posix'))
{
    exit("Please install posix extension. See http://doc3.workerman.net/appendices/install-extension.html\n");
}


// 加载所有Applications/*/start.php，以便启动所有服务

require_once './Events/start_register.php';
require_once './Events/start_gataway.php';
require_once './Events/start_bussinessworker.php';
require_once './Events/start_globaldata.php';


// 运行所有服务
Worker::runAll();
