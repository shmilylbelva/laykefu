<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件
/**
 * 删除目录以及其下的文件
 * @param $directory
 * @return bool
 */
function removeDir($directory)
{
    if (false == is_dir($directory)) {
        return false;
    }

    $handle = opendir($directory);
    while (false !== ($file = readdir($handle))) {
        if ('.' != $file && '..' != $file) {
            is_dir("$directory/$file") ? removeDir("$directory/$file") : @unlink("$directory/$file");
        }
    }

    if (readdir($handle) == false) {
        closedir($handle);
        rmdir($directory);
    }

    return true;
}