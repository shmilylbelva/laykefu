<?php
/**
 * User: nickbai
 * Date: 2017/10/23 13:33
 * Email: 1902822973@qq.com
 */
namespace app\admin\controller;

class Groups extends Base
{
    // 分组列表
    public function index()
    {
        if(request()->isAjax()){

            $result = db('groups')->select();
            foreach($result as $key=>$vo){
                // 优化显示状态
                if(1 == $vo['status']){
                    $result[$key]['status'] = '<span class="label label-primary">启用</span>';
                }else{
                    $result[$key]['status'] = '<span class="label label-danger">禁用</span>';
                }

                // 优化显示状态
                if(1 == $vo['status']){
                    $result[$key]['status'] = '<span class="label label-primary">启用</span>';
                }else{
                    $result[$key]['status'] = '<span class="label label-danger">禁用</span>';
                }

                // 统计分组人数
                $result[$key]['users_num'] = db('users')->where('group_id', $vo['id'])->count();

                // 生成操作按钮
                $result[$key]['operate'] = $this->makeBtn($vo['id']);
            }

            $return['total'] = db('users')->count();  //总数据
            $return['rows'] = $result;

            return json($return);

        }

        return $this->fetch();
    }

    // 添加分组
    public function addGroup()
    {
        if(request()->isPost()){

            $param = input('post.');

            $has = db('groups')->field('id')->where('name', $param['name'])->find();
            if(!empty($has)){
                return json(['code' => -1, 'data' => '', 'msg' => '该分组已经存在']);
            }

            try{
                db('groups')->insert($param);
            }catch(\Exception $e){
                return json(['code' => -2, 'data' => '', 'msg' => $e->getMessage()]);
            }

            return json(['code' => 1, 'data' => '', 'msg' => '添加分组成功']);
        }

        $this->assign([
            'status' => config('kf_status')
        ]);

        return $this->fetch();
    }

    // 编辑分组
    public function editGroup()
    {
        if(request()->isAjax()){

            $param = input('post.');

            // 检测用户修改的用户名是否重复
            $has = db('groups')->where('name', $param['name'])->where('id', '<>', $param['id'])->find();
            if(!empty($has)){
                return json(['code' => -1, 'data' => '', 'msg' => '该分组已经存在']);
            }

            try{
                db('groups')->where('id', $param['id'])->update($param);
            }catch(\Exception $e){
                return json(['code' => -2, 'data' => '', 'msg' => $e->getMessage()]);
            }

            return json(['code' => 1, 'data' => '', 'msg' => '编辑分组成功']);
        }

        $id = input('param.id/d');
        $info = db('groups')->where('id', $id)->find();

        $this->assign([
            'info' => $info,
            'status' => config('kf_status')
        ]);
        return $this->fetch();
    }

    // 删除分组
    public function delGroup()
    {
        if(request()->isAjax()){
            $id = input('param.id/d');

            // 查询该分组下是否有客服
            $has = db('users')->where('group_id', $id)->count();
            if($has > 0){
                return json(['code' => -2, 'data' => '', 'msg' => '该分组下有客服，不可删除']);
            }

            try{
                db('groups')->where('id', $id)->delete();
            }catch(\Exception $e){
                return json(['code' => -1, 'data' => '', 'msg' => $e->getMessage()]);
            }

            return json(['code' => 1, 'data' => '', 'msg' => '删除分组成功']);
        }
    }

    // 管理组员
    public function manageUser()
    {
        return $this->fetch();
    }

    // 生成按钮
    private function makeBtn($id)
    {
        $operate = '<a href="' . url('groups/editgroup', ['id' => $id]) . '">';
        $operate .= '<button type="button" class="btn btn-primary btn-sm"><i class="fa fa-paste"></i> 编辑</button></a> ';

        $operate .= '<a href="javascript:userGroup(' . $id . ')"><button type="button" class="btn btn-danger btn-sm">';
        $operate .= '<i class="fa fa-trash-o"></i> 删除</button></a> ';

        //$operate .= '<a href="' . url('groups/manageUser') . '">';
        //$operate .= '<button type="button" class="btn btn-info btn-sm"><i class="fa fa-user-plus"></i> 管理组员</button></a>';

        return $operate;
    }
}