<?php
use GlobalData\Client;
require_once __DIR__ . '/../src/Client.php';

$global = new Client('127.0.0.1:2207');

echo "\n\nisset(\$global->abc)=";
var_export(isset($global->abc));

echo "\n\n\$global->add('abc', 10)=";
var_export($global->add('abc', 10));
echo "\nnow \$global->abc=";
var_export($global->abc);

echo "\n\n\$global->increment('abc', 2)=";
var_export($global->increment('abc', 2));
echo "\nnow \$global->abc=";
var_export($global->abc);

echo ";\n\nset \$global->abc=";
$global->abc = array(1,2,3);
var_export($global->abc);

echo ";\n\nunset(\$global->abc)\n";
unset($global->abc);
echo "\nnow \$global->abc=";
var_export($global->abc);

echo "\n\nisset(\$global->abc)=";
var_export(isset($global->abc));

echo ";\n\nset \$global->abc=";
$global->abc = array(1,2,3);
var_export($global->abc);

echo ";\n\n\$global->cas('abc', array(1,2,3), array(5,6,7))=";
var_export($global->cas('abc', array(1,2,3), array(5,6,7)));

echo ";\n\nnow \$global->abc=";
var_export($global->abc);
