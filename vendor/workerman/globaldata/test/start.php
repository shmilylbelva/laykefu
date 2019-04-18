<?php
use Workerman\Worker;
use GlobalData\Server;
require_once __DIR__ . '/../../Workerman/Autoloader.php';
require_once __DIR__ . '/../src/Server.php';
$worker = new Server();
Worker::runAll();
