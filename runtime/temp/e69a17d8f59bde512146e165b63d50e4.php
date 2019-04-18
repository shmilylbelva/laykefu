<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:72:"F:\laragon\www\laykefu\public/../application/index\view\index\index.html";i:1555580246;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>laykefu客服</title>
    <meta name="keywords" content="whisper客服">
    <meta name="description" content="whisper客服">
    <link rel="shortcut icon" href="favicon.ico">
    <link href="http://laykefu.guoshanchina.com/static/customer/css/laykefu.css" rel="stylesheet" type="text/css" />
</head>

<body class="gray-bg">
<!-- 右侧悬浮 -->       
<div class="laykefu-min" data-group="1" id="show-laykefu">咨询客服</div>
<!-- 右侧悬浮 -->

<script src="https://cdn.staticfile.org/jquery/2.1.4/jquery.min.js"></script>
<script src="http://laykefu.guoshanchina.com/static/customer/js/laykefu.js"></script>
<script type="text/javascript">

  laykefu.init({
    group: 1,//客服分组
    // socket: 'www.laykefu.com:7272',//聊天服务器地址
    socket: 'ws.guoshanchina.com',//聊天服务器地址
    face_path:'/static/customer/images/face',//表情包路径
    upload_url:'/index/upload/uploadImg',//图片上传路径
  });

</script>
</body>
</html>