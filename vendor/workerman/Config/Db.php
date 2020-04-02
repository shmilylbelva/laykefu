<?php
namespace Config;

/**
 * mysql配置
 * @author shmilylbelva
 */
$config   = require_once __DIR__.'/../../../application/config.php';
$database = require_once __DIR__.'/../../../application/database.php';

define('DB_HOST',$database['hostname']); //数据库地址
define('DB_USER',$database['username']); //用户名
define('DB_PWD',$database['password']); //数据库密码
define('DB_NAME',$database['database']); //库名
define('INTRANET',$config['intranet']); //内网ip
define('WS_PORT',$config['port']); //内网ip
define('DB_PORT',!empty($database['hostport'])?$database['hostport']:3306); //端口
    /**
     * 数据库的一个实例配置，则使用时像下面这样使用
     * $user_array = Db::instance('db1')->select('name,age')->from('users')->where('age>12')->query();print_r()exit
     * 等价于
     * $user_array = Db::instance('db1')->query('SELECT `name`,`age` FROM `users` WHERE `age`>12');
     * @var array
     */
class Db
{
    public static $db = array(
        'host'    => DB_HOST,
        'user'    => DB_USER,
        'password' =>DB_PWD,
        'dbname'  => DB_NAME,
        'port'    => DB_PORT,
        'charset'    => 'utf8',
    );
    
    public static $config = array(
        'globalData'    => INTRANET.":2207",
    ); 
}

