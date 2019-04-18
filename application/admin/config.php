<?php
//配置文件
return [

    // 模板参数替换
    'view_replace_str' => [
        '__CSS__' => '/static/admin/css',
        '__JS__'  => '/static/admin/js',
        '__IMG__' => '/static/admin/images',
    ],

    // 客服状态
    'kf_status' => [
        1 => '启用',
        2 => '禁用'
    ],

    // 是否在线
    'online' => [
        1 => '在线',
        2 => '离线'
    ]
];