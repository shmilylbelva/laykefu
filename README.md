## laykefu
tp5+Gatewayworker搭建的高性能客服系统  

## 接入

1、添加laykefu.css样式文件
```php
    <link href="http://laykefu.guoshanchina.com/static/customer/css/laykefu.css" rel="stylesheet" type="text/css" />
```

2、添加jquery.js和laykefu.js 文件 
```php  
<script src="https://cdn.staticfile.org/jquery/2.1.4/jquery.min.js"></script>
<script src="http://laykefu.guoshanchina.com/static/customer/js/laykefu.js"></script>
```

3、添加html目标代码 id="show-laykefu"
```php
<div class="laykefu-min"  id="show-laykefu">咨询客服</div>
```

4、初始化laykefu
```php
  laykefu.init({
    group: 1,//客服分组
    // socket: 'www.laykefu.com:7272',//聊天服务器地址
    socket: 'ws.guoshanchina.com',//聊天服务器地址
    face_path:'/static/customer/images/face',//表情包路径
    upload_url:'/index/upload/uploadImg',//图片上传路径
  });

```  
## 效果图

