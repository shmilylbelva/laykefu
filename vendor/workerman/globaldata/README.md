# GlobalData
进程间数据共享组件，用于分布式数据共享。服务端基于[Workerman](https://github.com/walkor/Workerman)。客户端可用于任何PHP项目。

# 服务端
```php
use Workerman\Worker;
require_once __DIR__ . '/../../Workerman/Autoloader.php';
require_once __DIR__ . '/../src/Server.php';

$worker = new GlobalData\Server('127.0.0.1', 2207);

Worker::runAll();
```

# 客户端
```php
require_once __DIR__ . '/../src/Client.php';

$global = new GlobalData\Client('127.0.0.1:2207');

var_export(isset($global->abc));
$global->abc = array(1,2,3);
var_export($global->abc);
unset($global->abc);
var_export($global->abc);
$global->abc = array(1,2,3);
var_export($global->abc);
var_export($global->cas('abc', array(1,2,3), array(5,6,7)));
var_export($global->abc);
```
