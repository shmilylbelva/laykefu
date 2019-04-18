<?php
/**
 * User: nickbai
 * Date: 2017/10/23 13:33
 * Email: 1902822973@qq.com
 */
namespace app\admin\controller;

class Admins extends Base
{
    // 管理员列表
    public function index()
    {
        if(request()->isAjax()){

            $param = input('param.');

            $limit = $param['pageSize'];
            $offset = ($param['pageNumber'] - 1) * $limit;

            $where = [];
            if (!empty($param['searchText'])) {
                $where['user_name'] = ['like', '%' . $param['searchText'] . '%'];
            }

            $result = db('admins')->where($where)->limit($offset, $limit)->select();
            foreach($result as $key=>$vo){
                // 优化显示状态
                if(1 == $vo['status']){
                    $result[$key]['status'] = '<span class="label label-primary">启用</span>';
                }else{
                    $result[$key]['status'] = '<span class="label label-danger">禁用</span>';
                }

                // 上次登录时间
                $result[$key]['last_login_time'] = empty($vo['last_login_time']) ? '' : date('Y-m-d H:i:s', $vo['last_login_time']);

                // 生成操作按钮
                if(1 != $vo['id']){
                    $result[$key]['operate'] = $this->makeBtn($vo['id']);
                }
            }

            $return['total'] = db('admins')->where($where)->count();  //总数据
            $return['rows'] = $result;

            return json($return);

        }

        return $this->fetch();
    }

    // 添加管理员
    public function addAdmin()
    {
        if(request()->isPost()){

            $param = input('post.');

            $has = db('admins')->field('id')->where('user_name', $param['user_name'])->find();
            if(!empty($has)){
                return json(['code' => -1, 'data' => '', 'msg' => '该管理员已经存在']);
            }

            $param['password'] = md5($param['password'] . config('salt'));

            try{
                db('admins')->insert($param);
            }catch(\Exception $e){
                return json(['code' => -2, 'data' => '', 'msg' => $e->getMessage()]);
            }

            return json(['code' => 1, 'data' => '', 'msg' => '添加管理员成功']);
        }

        $this->assign([
            'status' => config('kf_status')
        ]);

        return $this->fetch();
    }

    // 编辑管理员
    public function editAdmin()
    {
        if(request()->isAjax()){

            $param = input('post.');

            // 检测用户修改的管理员是否重复
            $has = db('admins')->where('user_name', $param['user_name'])->where('id', '<>', $param['id'])->find();
            if(!empty($has)){
                return json(['code' => -1, 'data' => '', 'msg' => '该管理员已经存在']);
            }

            // 修改用户密码
            if(empty($param['password'])){
                unset($param['password']);
            }else{
                $param['password'] = md5($param['password'] . config('salt'));
            }

            try{
                db('admins')->where('id', $param['id'])->update($param);
            }catch(\Exception $e){
                return json(['code' => -2, 'data' => '', 'msg' => $e->getMessage()]);
            }

            return json(['code' => 1, 'data' => '', 'msg' => '编辑管理员成功']);
        }

        $id = input('param.id/d');
        $info = db('admins')->where('id', $id)->find();

        $this->assign([
            'info' => $info,
            'status' => config('kf_status')
        ]);
        return $this->fetch();
    }

    // 删除管理员
    public function delAdmin()
    {
        if(request()->isAjax()){
            $id = input('param.id/d');

            try{
                db('admins')->where('id', $id)->delete();
            }catch(\Exception $e){
                return json(['code' => -1, 'data' => '', 'msg' => $e->getMessage()]);
            }

            return json(['code' => 1, 'data' => '', 'msg' => '删除客服成功']);
        }
    }

    // 生成按钮
    private function makeBtn($id)
    {
        $operate = '<a href="' . url('admins/editadmin', ['id' => $id]) . '">';
        $operate .= '<button type="button" class="btn btn-primary btn-sm"><i class="fa fa-paste"></i> 编辑</button></a> ';

        $operate .= '<a href="javascript:userDel(' . $id . ')"><button type="button" class="btn btn-danger btn-sm">';
        $operate .= '<i class="fa fa-trash-o"></i> 删除</button></a> ';

        return $operate;
    }
}