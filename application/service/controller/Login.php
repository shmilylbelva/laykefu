<?php
namespace app\service\controller;

use think\Controller;

class Login extends Controller
{
    public function index()
    {
        $this->assign([
            'version' => config('version')
        ]);

        return $this->fetch();
    }

    public function doLogin()
    {
        if(request()->isAjax()){

            $userName = input('post.username');
            $password = input('post.password');
			
            $user = db('users')->where('user_name', $userName)->find();
            if(empty($user)){
                return json(['code' => -1, 'data' => '', 'msg' => '客服不存在']);
            }

            if(md5($password . config('salt')) != $user['user_pwd']){
                return json(['code' => -2, 'data' => '', 'msg' => '密码错误']);
            }

            // 设置session标识状态
            cookie('l_user_name', $user['user_name'], config('save_time'));
            cookie('l_user_id', $user['id'], config('save_time'));
            cookie('l_user_avatar', $user['user_avatar'], config('save_time'));

            return json(['code' => 1, 'data' => url('index/index'), 'msg' => '登录成功']);
        }

        $this->error('非法访问');
    }

    public function loginOut()
    {
        cookie('l_user_name', null);
        cookie('l_user_id', null);
        cookie('l_user_avatar', null);

        $this->redirect(url('login/index'));
    }
}