<?php
/**
 * User: nickbai
 * Date: 2017/10/24 10:46
 * Email: 1902822973@qq.com
 */
namespace app\admin\controller;

use think\Controller;

class Login extends Controller
{
    // 登录首页
    public function index()
    {
        $this->assign([
            'version' => config('version')
        ]);

        return $this->fetch();
    }

    // 处理登录
    public function doLogin()
    {
        if(request()->isPost()){

            $userName = input("param.user_name/s");
            $password = input("param.password/s");

            if(empty($userName)){
                return json(['code' => -1, 'data' => '', 'msg' => '用户名不能为空']);
            }

            if(empty($password)){
                return json(['code' => -2, 'data' => '', 'msg' => '密码不能为空']);
            }

            $userInfo = db('admins')->where('user_name', $userName)->find();
            if(empty($userInfo)){
                return json(['code' => -3, 'data' => '', 'msg' => '管理员不存在']);
            }

            if(md5($password . config('salt')) != $userInfo['password']){
                return json(['code' => -4, 'data' => '', 'msg' => '密码错误']);
            }

            if(1 != $userInfo['status']){
                return json(['code' => -5, 'data' => '', 'msg' => '您已被禁用']);
            }

            // 记录管理员状态
            cookie('user_name', $userName, config('save_time'));
            cookie('user_id', $userInfo['id'], config('save_time'));

            // 更新管理员状态
            $param = [
                'last_login_ip' => request()->ip(),
                'last_login_time' => time()
            ];
            db('admins')->where('id', $userInfo['id'])->update($param);

            return json(['code' => 1, 'data' => url('index/index'), 'msg' => '登录成功']);
        }
    }

    public function loginOut()
    {
        cookie('user_name', '');
        cookie('user_id', '');

        $this->redirect(url('login/index'));
    }

}