<?php
namespace app\admin\controller;

use think\Controller;

class Base extends Controller
{
    public function _initialize()
    {
        if(empty(cookie('user_name'))){
            $this->redirect(url('login/index'));
        }

        $this->assign([
            'version' => config('version')
        ]);
    }
}
