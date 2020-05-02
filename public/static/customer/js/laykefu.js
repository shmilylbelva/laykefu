/**
 * Created by PhpStorm.
 * User: shmilylbelva
 * Email: 1028604181@qq.com
 * Date: 2019/4/20
 * Time: 4:20 PM
 */
 
;!function(win){
    "use strict";

    var Laykefu = function(){
        this.v = '1.0'; //版本号      
    },kf_id = 0
    ,kf_name = ''
    ,socket = null
    ,uinfo = null //用户信息
    ,time = 0
    ,timer = 0 //通知定时器
    ,config = {
        uid: '',//用户id
        name: '',//用户name
        avatar: '',//用户头像
        group: '',//客服分组
        socket: '',//聊天服务器地址
        face_path: '',//表情地址
        height: '',//窗口高度
        width: '', //窗口宽度 
    },check = function(){
        if('' == config.url || 0 == config.group || '' == config.socket){
            console.log("配置文件错误");
            return false;
        }        
        if (!getCache('laykefu-UserId')) {//是否已分配账号
            config.uid = config.uid || setMember()+parseInt(Math.random() * 40) + 1;
            config.name = config.name || '会员'+config.uid;
            cacheChat({key:"laykefu-UserId",data:[{'userId':config.uid,'name': config.name,'avatar': config.avatar}]});
        }
        if (!getCache('nowMinutes')) {//显示消息时间
            cacheChat({key:"nowMinutes",data:{'now':getMinutes()}}); 
        }        
    },cacheChat = function (obj){
        if(typeof(Storage) !== "undefined"){
            localStorage.setItem(obj.key, JSON.stringify(obj.data));
        }
    },getCache = function (key){
        return JSON.parse(localStorage.getItem(key));
    },register = function(){//注册监听事件
        check();
        $(tpl()).prependTo('body');//插入客服页面
        isMobile();
        isVisible();
	var protocol = location.protocol === 'https:' ? 'wss://' : 'ws://';
	socket = new ReconnectingWebSocket(protocol + config.socket);//创建Socket实例        
	uinfo = getCache('laykefu-UserId');
        socket.onopen = function (res) {
            var login_data = '{"type":"userInit", "uid": "' + uinfo[0].userId + '", "name" : "' + uinfo[0].name + '", "avatar" : "' + config.avatar + '", "group" : "' + config.group + '"}';
            socket.send(login_data);
            ping(30000);
            isLock(false);
        };
        socket.onmessage = function (res) {
            var data = eval("("+res.data+")");
            switch(data['message_type']){
                // 已经被分配了客服
                case 'connect':
                    kf_id = data.data.kf_id;
                    kf_name = data.data.kf_name;
                    showSystem({content: '客服 ' + kf_name + ' 为您服务'});
                    $('#laykefu-title').html('与 ' + kf_name + ' 交流中');
                    showChatLog();
                    break;
                // 排队等待
                case 'wait':
                    isLock(true);
                    // if('暂时没有客服上班,请稍后再咨询。' == data.data.content){
                    //     socket.close();
                    // }
                    $('#laykefu-title').html('暂时没有客服');
                    showSystem(data.data);
                    break;
                // 监测客服上线
                case 'kf_online':
                    if (data.data.kf_group == config.group) {
                        kf_id = data.data.kf_id;
                        kf_name = data.data.kf_name;
                        $('#laykefu-title').html('与 ' + kf_name + ' 交流中');
                        showSystem({content: '客服 ' + kf_name + ' 为您服务'});
                        wordBottom();
                        isLock(false);
                    }
               
                    break;                    
                // 监测客服下线
                case 'kf_offline':
                    if (data.data.kf_group == config.group) {
                        kf_id = data.data.kf_id;
                        kf_name = data.data.kf_name;
                        $('#laykefu-title').html('暂时没有客服');
                        showSystem({content: '客服 ' + kf_name + ' 暂时停止服务'});
                        wordBottom();
                        isLock(true);
                    }
               
                    break;                    
                // 监测聊天数据                
                case 'chatMessage':
                    showMsg(data.data);
                    break;
                // 问候语
                case 'helloMessage':
                    showMsg(data.data);
                    break;
                // 转接
                case 'relinkMessage':
                    $('#laykefu-title').html('正在转接中...');
                    break;
            }            
        };

        socket.onclose = function (err) {
            console.log('连接断开');
        };
    },setMember = function(){
        var d = new Date(new Date());
        return  digit(d.getDate()) + digit(d.getHours()) + digit(d.getMinutes()) + digit(d.getSeconds());        
    },isLock = function(state){
        state?($('#msg-area').attr('readonly', 'readonly')):$('#msg-area').removeAttr('readonly');
    },ping = function(time){
        //每30秒ping服务器
        setInterval(function(){
            socket.send('{"type":"ping"}');
        },time);
    },showTime = function(msg){
        var _html = '<div class="laykefu-chat-time"><span>' + msg.content + '</span></div>';
        $("#laykefu-chat-list ul").append(_html);
    },showSystem = function(msg){
        var _html = '<div class="laykefu-chat-system"><span>' + msg.content + '</span></div>';
        $("#laykefu-chat-list ul").append(_html);
    },showChatLog = function(){// 展示本地聊天缓存
        var chatLog = getCache(kf_id + '-' + uinfo[0].userId);
        if(chatLog == null || chatLog.length == 0){
            return ;
        }
        var _html = '';
        var len = chatLog.length;
        for(var i = 0; i < len; i++){
            var v = chatLog[i];
            if ('time' !== v.type) {
                if ('mine' == v.type) {
                    _html += '<li class="laykefu-chat-mine">';               
                } else {
                    _html += '<li>';               
                }
                _html += '<div class="laykefu-chat-user">';
                _html += '<img src="' + v.avatar + '">'; 
                if ('mine' == v.type) {
                    _html += '<cite>' + v.name + '</cite>';
                } else {
                    _html += '<cite>' + v.name + '</cite>';
                }
                _html += '</div><div class="laykefu-chat-text">' + v.content + '</div>';
                _html += '</li>';
            }else{
                var data = getTimeText(v.time); 
                _html += '<div class="laykefu-chat-system"><span>' + data + '</span></div>';
            }
        }
        $("#laykefu-chat-list ul").append(_html);
        showBigPic();
        // 滚动条自动定位到最底端
        wordBottom();
    },tpl = function(){
        var tpl  = "<div style= 'width:" + config.width + ";display:none;height:"+ config.height+";' class='tpl' id='laykefu'>";
        tpl +=      '<div class="small-chat-box fadeInRight animated">';
        tpl +=          '<div class="heading" draggable="true">';
        tpl +=              '<small class="chat-date pull-right" id="hidden-laykefu">';
        tpl +=              '关闭';
        tpl +=              '</small>';
        tpl +=              '<span id="laykefu-title">与 客服 交流中</span>'
        tpl +=          '</div>';
        tpl +=          '<div class="slimScrollDiv" id="chat-content-box">';
        tpl +=              '<div class="chat-box laykefu-chat-main" id="laykefu-chat-list">';
        tpl +=                  '<ul style="display: block;"></ul>';
        tpl +=              '</div>';
        tpl +=          '</div>';
        tpl +=          '<div class="form-chat">';
        tpl +=              '<textarea class="form-control chat-area" id="msg-area" readonly="readonly"></textarea>';
        tpl +=              '<div class="input-group">';
        tpl +=                  '<span class="icono-smile" id="laykefu-face"></span>';
        tpl +=                  '<span class="icono-image" id="laykefu-up-image"></span>';
        // tpl +=                      '<i class="icono-smile" id="laykefu-face"></i>';
        // tpl +=                      '<i class="icono-image" id="laykefu-up-image"></i>';
        // tpl +=                  '</span>';        
        tpl +=                  '<span class="input-group-btn">';
        tpl +=                      '<button class="btn btn-primary" type="button" id="send">发送</button>';
        tpl +=                  '</span>';
        tpl +=              '</div>';
        tpl +=          '</div>';
        tpl +=          '<div class="bar">';

        tpl +=          '</div>';        
        tpl +=          '<div class="face-box" style="display:none" id="face-box">';
        tpl +=          '</div>';
        tpl +=      '</div>';            
        tpl += '</div>';  
        return tpl;
    },sendMsg = function(sendMsg){// 发送信息
        (typeof($('#msg-area').attr('readonly')) == 'undefined')?isLock(false):isLock(true);
        var msg = (typeof(sendMsg) == 'undefined') ? $('#msg-area').val() : sendMsg;
        if('' == msg) return false;
        var content = replaceContent(msg);    
        var time = getDate();    
        var word = msgFactory(content, 'mine',time,uinfo[0]);
        // 发送消息
        socket.send(JSON.stringify({
            type: 'chatMessage',
            data: {to_id: kf_id, to_name: kf_name, content: msg, from_name: uinfo[0].name,
                from_id: uinfo[0].userId, from_avatar: config.avatar}
        }));
        $("#laykefu-chat-list ul").append(word);
        $('#msg-area').val('');
        // 滚动条自动定位到最底端
        showBigPic();
        wordBottom();
    },showMsg = function(info){// 展示收到的消息
        // 清除系统消息
        $('.laykefu-chat-system').html('');
        clearMsg();//清除已有提醒
        var _html = $('#laykefu-chat-list').html();
        var content = replaceContent(info.content);
        var word = msgFactory(content, 'other',info.time,info);
        $("#laykefu-chat-list ul").append(word);
        if ($('#laykefu').css('display') == 'none') {
            notice(true);
        }
        document.hidden && newMsg();
        showBigPic();
        // 滚动条自动定位到最底端
        wordBottom();
    },msgFactory = function(content, type,time,info) {// 消息体    
        // 储存信息
        var key = kf_id + '-' + uinfo[0].userId;
        if(typeof(Storage) !== "undefined"){
            var localMsg = getCache(key);
            if(localMsg == null || localMsg.length == 0){
                localMsg = [];
            }
            (type == 'mine') && (name = '我');
            if (getCache('nowMinutes').now != getMinutes()) {//消息发送接收时间大于当前记录时间
                var data = {}; 
                data.content = getTimeText(time);
                showSystem(data);
                localMsg.push({type: 'time', time: time,});
                cacheChat({key:"nowMinutes",data:{'now':getMinutes()}});//更新时间
            }
            localMsg.push({type: type, name: name, time: time, content: content,avatar:info.avatar});
            cacheChat({key: key, data: localMsg});
        }        
        var _html = '';
        if ('time' !== type) {
            if ('mine' == type) {
                _html += '<li class="laykefu-chat-mine">';
            } else{
                _html += '<li>';
            }
            _html += '<div class="laykefu-chat-user">';
            _html += '<img src="' + info.avatar + '">';
            if ('mine' == type) {
                _html += '<cite>' + name + '</cite>';
            } else {
                _html += '<cite>' + info.name + '</cite>';
            }
            _html += '</div><div class="laykefu-chat-text">' + content + '</div>';
            _html += '</li>'; 
        }else{
            _html = '<div class="laykefu-chat-system"><span>' + data.content + '</span></div>';            
        }

        return _html;
    },mGetDate = function() {// 获取天数
        return Math.ceil(( new Date() - new Date(new Date().getFullYear().toString()))/(24*60*60*1000))+1;
    },getMinutes = function() {// 获取当前分钟
        var d = new Date(new Date());
        var hour = 60;//1小时
        var day = 24*hour;//1天
        var totalDay = mGetDate()-1;//共多少天
        var totalHour = digit(d.getHours());
        var totalMinutes = digit(d.getMinutes());
        return totalDay*day+totalHour*hour+totalMinutes;
    },getDate = function() {// 获取日期
        var d = new Date(new Date());
        return d.getFullYear() + '-' + digit(d.getMonth() + 1) + '-' + digit(d.getDate())
            + ' ' + digit(d.getHours()) + ':' + digit(d.getMinutes()) + ':' + digit(d.getSeconds());
    },digit = function (num) {//补齐数位
        return num < 10 ? '0' + (num | 0) : num;
    },getTimeText = function (time){// 
        var timeS = time;
        var todayT = ''; //
        var yestodayT = '';
        var d = new Date(new Date());
        var year = '';
        var month = '';
        var day = '';
        var timeCha = getTimeS(timeS);
        timeS = timeS.slice(-8);
        year = time.slice(0,4);
        month = time.slice(5,7);
        day = time.slice(8,10);
        todayT = digit(d.getHours())*60*60*1000 + digit(d.getMinutes())*60*1000 + digit(d.getSeconds())*1000;
        yestodayT = todayT + 24*60*60*1000;
        if(timeCha > yestodayT) {
            if(year < d.getFullYear() ){
                return timeS.slice(0,2)>12?year+'年'+month+'月'+day+'日'+' 下午'+(timeS.slice(0,2)==12 ? 12 : timeS.slice(0,2) - 12)+timeS.slice(2,5):year+'年'+month+'月'+day+'日'+' 上午'+timeS.slice(0,5);
            }else{
                return timeS.slice(0,2)>12?month+'月'+day+'日'+' 下午'+(timeS.slice(0,2)==12 ? 12 : timeS.slice(0,2) - 12)+timeS.slice(2,5):month+'月'+day+'日'+' 上午'+timeS.slice(0,5);
            }
            
        }
        if(timeCha > todayT && timeCha < yestodayT) {
            return '昨天 '+timeS.slice(0,5);
        }
        if(timeCha < todayT) {
            return timeS.slice(0,5);
        }
    },getTimeS = function (argument){// 日期转时间戳
        var timeS = argument;
        timeS = timeS.replace(/[年月]/g,'/').replace(/[日]/,'');
        return new Date().getTime() - new Date(timeS).getTime() - 1000; //有一秒的误差
    },wordBottom = function (){// 对话框定位到最底端
        var ex = $("#laykefu-chat-list");
        ex.scrollTop(ex[0].scrollHeight);
    },replaceContent = function(content) {// 转义聊天内容中的特殊字符
        // 支持的html标签
        var html = function (end) {
            return new RegExp('\\n*\\[' + (end || '') + '(pre|div|span|p|table|thead|th|tbody|tr|td|ul|li|ol|li|dl|dt|dd|h2|h3|h4|h5)([\\s\\S]*?)\\]\\n*', 'g');
        };
        content = (content || '').replace(/&(?!#?[a-zA-Z0-9]+;)/g, '&amp;')
            .replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/'/g, '&#39;').replace(/"/g, '&quot;') // XSS
            .replace(/face\[([^\s\[\]]+?)\]/g, function (face) {  // 转义表情
                var alt = face.replace(/^face/g, '');
                return '<img alt="' + alt + '" title="' + alt + '" src="' + getFaces()[alt] + '">';
            })
            .replace(/img\[([^\s]+?)\]/g, function (img) {  // 转义图片
                return '<img class="laykefu-img" src="' + img.replace(/(^img\[)|(\]$)/g, '') + '" width="100px" height="100%">';
            })
            .replace(/file\([\s\S]+?\)\[[\s\S]*?\]/g, function (str) { // 转义文件
                var href = (str.match(/file\(([\s\S]+?)\)\[/) || [])[1];
                var text = (str.match(/\)\[([\s\S]*?)\]/) || [])[1];
                if (!href) return str;
                return '<a class="laykefu-file" href="' + href + '" download target="_blank"><i class="layui-icon">&#xe61e;</i><cite>' + (text || href) + '</cite></a>';
            }).replace(html(), '\<$1 $2\>').replace(html('/'), '\</$1\>') // 转移HTML代码
            .replace(/\n/g, '<br>') // 转义换行

        return content;
    },showFaces = function(){// 展示表情数据
        if ($('#msg-area').attr('readonly') == 'readonly') return false;
        var _html = '<ul class="layim-face-list">';
        var faces = getFaces();
          for(var key in faces){
            _html += '<li title="'+ key +'"><img src="'+ faces[key] +'"></li>';
          }
        _html += '</ul>';
        document.getElementById('face-box').innerHTML = _html;
    },getFaces = function () {// 表情替换
        var alt = ["[微笑]", "[嘻嘻]", "[哈哈]", "[可爱]", "[可怜]", "[挖鼻]", "[吃惊]", "[害羞]", "[挤眼]", "[闭嘴]", "[鄙视]", "[爱你]", "[泪]", "[偷笑]", "[亲亲]", "[生病]", "[太开心]", "[白眼]", "[右哼哼]", "[左哼哼]", "[嘘]", "[衰]", "[委屈]", "[吐]", "[哈欠]", "[抱抱]", "[怒]", "[疑问]", "[馋嘴]", "[拜拜]", "[思考]", "[汗]", "[困]", "[睡]", "[钱]", "[失望]", "[酷]", "[色]", "[哼]", "[鼓掌]", "[晕]", "[悲伤]", "[抓狂]", "[黑线]", "[阴险]", "[怒骂]", "[互粉]", "[心]", "[伤心]", "[猪头]", "[熊猫]", "[兔子]", "[ok]", "[耶]", "[good]", "[NO]", "[赞]", "[来]", "[弱]", "[草泥马]", "[神马]", "[囧]", "[浮云]", "[给力]", "[围观]", "[威武]", "[奥特曼]", "[礼物]", "[钟]", "[话筒]", "[蜡烛]", "[蛋糕]"], arr = {};
        $.each(alt, function (index, item) {
            arr[item] = config.face_path + index + '.gif';
        });
        return arr;
    },imgClick = function() {
        var _html = '<img src="" alt="" class="laykefu-bigimg" style="display:none; inline;z-index:9999999999"><div class="laykefu-mask" style="display: none;z-index: 9999999;"></div>';
        $('body').append(_html);
        $(".laykefu-mask").click(function() {
            $(".laykefu-bigimg").fadeOut();
            $(".laykefu-mask").fadeOut()
        })       
        if (document.attachEvent) {
            $(".laykefu-bigimg").attachEvent("onmousewheel", scrollFn)
        } else {
            if (document.addEventListener) {
                $('.laykefu-bigimg').on('mousewheel', scrollFn);                
            }
        }
    },scrollFn = function (){// 双击图片
        var ev = window.event;
        var dir = ev.deltaY;
        var width = $(".laykefu-bigimg").width();
        var height = $(".laykefu-bigimg").height();
        if (dir < 0) {
            if (width > ($(window).width())) return
            if (height > ($(window).height())) return
            height += 50;
            width += 50;            
        } else {
            if (width < 150) return
            if (height < 150) return                
            height = height-50;
            width = width-50;
        }
        $(".laykefu-bigimg").css({
            height: height + "px",
            width: width + "px"
        })         
    },showBigPic = function (){// 双击图片
        $(".laykefu-img").click(function() {
            $(".laykefu-bigimg").css({
                height: $(this).height() * 5,
                width: $(this).width() * 5
            });
            $(".laykefu-mask").fadeIn();
            $(".laykefu-bigimg").attr("src", $(this).attr("src")).fadeIn()
        });        
    },uploadImg = function(){
        if ($('#msg-area').attr('readonly') == 'readonly') return false;
        $('#laykefu-up-image').after('<input type="file" id="laykefu-upload" name="file" style="display:none" >');                
        $("#laykefu-upload").click();
        $("#laykefu-upload").change(function (e) {

            var formData = new FormData();
            var file = $("#laykefu-upload")[0].files[0];
                formData.append("file",file); //传给后台的file的key值是可以自己定义的
            filter(file) && $.ajax({
                url: config.upload_url || '',
                type: "post",
                data: formData,
                contentType: false,
                processData: false,
                dataType: 'JSON',
                mimeType: "multipart/form-data",
                success: function (res) {
                    sendMsg('img[' + res.data.src + ']');
                    showBigPic();
                    $("#laykefu-upload").remove();                        
                },
                error: function (data) {
                    console.log(data);
                }
            }); 
        });
       
    },filter = function(obj){
        var imgType = ["image/jpeg","image/png"];
        var filetypes = config.imgType|| imgType;
        var isnext = false;
        for (var i = 0; i < filetypes.length; i++) {
            if (filetypes[i] == obj.type) {
                return true;
            }
        }  
        return false;  
    },isMobile = function (){
        // 是否移动端访问
        if( navigator.userAgent.match(/Android/i)
            || navigator.userAgent.match(/webOS/i)
            || navigator.userAgent.match(/iPhone/i)
            || navigator.userAgent.match(/iPad/i)
            || navigator.userAgent.match(/iPod/i)
            || navigator.userAgent.match(/BlackBerry/i)
            || navigator.userAgent.match(/Windows Phone/i)
        ){
            $("#laykefu").css({'width':'100%','height':'100%','bottom':'0px','right':'0px'});
        }
    },notice = function(state){//新消息红点提示
        state?$('.laykefu-min').append('<i class="laykefu-newMsg"></i>'):$('.laykefu-newMsg').remove();        
    },isMinStatus = function(){//当前窗口是否可见
        //除了Internet Explorer浏览器，其他主流浏览器均支持Window outerHeight 和outerWidth 属性
        if (window.outerWidth != undefined && window.outerHeight != undefined) {
            isMin = window.outerWidth <= 160 && window.outerHeight <= 27;
        } else {
            isMin = window.outerWidth <= 160 && window.outerHeight <= 27;
        }
        //除了Internet Explorer浏览器，其他主流浏览器均支持Window screenY 和screenX 属性
        if (window.screenY != undefined && window.screenX != undefined) {
            isMin = window.screenY < -30000 && window.screenX < -30000;//FF Chrome       
        } else {
            isMin = window.screenTop < -30000 && window.screenLeft < -30000;//IE
        }
        return isMin;
    },isVisible = function(){//当前窗口是否可见
        $(document).on('visibilitychange', function(e) {
            if (e.target.visibilityState === "hidden" && $('.laykefu-newMsg').length >0) {
                newMsg();
            }else{
                clearMsg();
            }
        });
    },newMsg = function(){//消息提醒
        var title = document.title.replace("【　　　】", "").replace("【新消息】", "");  
        // 定时器，设置消息切换频率闪烁效果就此产生  
        timer = setTimeout(function () {  
            time++;  
            newMsg();
            if (time % 2 == 0) {  
                document.title = "【新消息】" + title  
            }  
            else {  
                document.title = "【　　　】" + title  
            };  
        }, 600);  
        return timer;
    },clearMsg = function(){// 清除消息提示
        clearTimeout(timer);  
        document.title = document.title.replace("【　　　】", "").replace("【新消息】", ""); 
    },event = function(){
        // 发送表情
        $('#laykefu-face').click(function(e){
            e.stopPropagation();
            showFaces();
            $(".layim-face-list").find("li").click(function() {
                var content = $(this).attr("title");
                var contentvalue = $("#msg-area").val();
                $("#msg-area").val(contentvalue +'face'+ content);
                $('#face-box').css('display','none'); 
                return false;
            });           
            $('#face-box').css('display','block');                  
        });
        //发送图片
        $("#laykefu-up-image").click(function (e) {               
            uploadImg();
        });        
        // 监听点击旁边关闭表情
        document.addEventListener("click",function(){
            $('#face-box').css('display','none');
        });
        // 点击发送消息
        $('#send').click(function(){
            sendMsg();
        });
        // 监听快捷键发送
        $('#msg-area').on('keydown', function (e) {
            if (e.keyCode != 13) return;
            e.preventDefault();  // 取消事件的默认动作
            sendMsg();
        }); 
        //点击图片事件
        imgClick();
        $("#hidden-laykefu").click(function(){
            $("#laykefu").css('display','none');
            $(".laykefu-min").css('display','block');
        });         
        $(".laykefu-min").click(function(){
            $(".laykefu-min").css('display','none');
            $("#laykefu").css('display','block');
            clearMsg();
            notice(false);
            wordBottom();
        });       
    };

    Laykefu.prototype.init = function(options){  
        options.uid = options.uid || '',//客户id      
        options.name = options.name || '',//客户昵称      
        options.avatar = options.avatar ||'http://img.52z.com/upload/news/image/20180213/20180213062641_35687.jpg',//用户头像
        options.group = options.group,//客服分组
        options.socket = options.socket,//聊天服务器地址
        options.face_path = options.face_path+'/',
        options.uploadUrl = options.uploadUrl || '',
        options.height = options.height || '600px',//窗口高度
        options.width = options.width || '400px', //窗口宽度     
        config = options; 
        register();
        event();
    }
    win.laykefu = new Laykefu();
  
}(window);

