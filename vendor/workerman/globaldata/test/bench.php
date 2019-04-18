<?php
use GlobalData\Client;
require_once __DIR__ . '/../src/Client.php';

$global = new Client('127.0.0.1:2207');

$i = $j = 10000;
$t = microtime(true);
while($i--)
{
    $global->a = array(1,3);
}

echo ceil($j/(microtime(true)-$t))."qps\n";
