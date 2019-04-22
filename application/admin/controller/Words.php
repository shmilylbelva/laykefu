<?php
/**
 * User: nickbai
 * Date: 2017/10/23 13:33
 * Email: 1902822973@qq.com
 */
namespace app\admin\controller;

class Words extends Base
{
    // 常用语列表
    public function index()
    {
        if(request()->isAjax()){

            $param = input('param.');

            $limit = $param['pageSize'];
            $offset = ($param['pageNumber'] - 1) * $limit;

            $where = [];
            if (!empty($param['searchText'])) {
                $where['content'] = $param['searchText'];
            }

            $result = db('words')->where($where)->limit($offset, $limit)->select();
            foreach($result as $key=>$vo){
                // 优化显示状态
                if(1 == $vo['status']){
                    $result[$key]['status'] = '<span class="label label-primary">启用</span>';
                }else{
                    $result[$key]['status'] = '<span class="label label-danger">禁用</span>';
                }

                // 生成操作按钮
                $result[$key]['operate'] = $this->makeBtn($vo['id']);
            }

            $return['total'] = db('words')->where($where)->count();  //总数据
            $return['rows'] = $result;

            return json($return);

        }

        return $this->fetch();
    }

    // 添加常用语
    public function addword()
    {
        if(request()->isPost()){

            $param = input('post.');
            $param['content'] = trim($param['content']);

            $has = db('words')->field('id')->where('content', $param['content'])->find();
            if(!empty($has)){
                return json(['code' => -1, 'data' => '', 'msg' => '该常用语已经存在']);
            }

            $param['add_time'] = date('Y-m-d H:i:s');
            try{
                db('words')->insert($param);
            }catch(\Exception $e){
                return json(['code' => -2, 'data' => '', 'msg' => $e->getMessage()]);
            }

            return json(['code' => 1, 'data' => '', 'msg' => '添加常用语成功']);
        }

        $this->assign([
            'status' => config('kf_status')
        ]);

        return $this->fetch('add_word');
    }

    // 编辑常用语
    public function editword()
    {
        if(request()->isAjax()){

            $param = input('post.');
            $param['content'] = trim($param['content']);

            // 检测用户修改的常用语是否重复
            $has = db('words')->where('content', $param['content'])->where('id', '<>', $param['id'])->find();
            if(!empty($has)){
                return json(['code' => -1, 'data' => '', 'msg' => '该常用语已经存在']);
            }

            try{
                db('words')->where('id', $param['id'])->update($param);
            }catch(\Exception $e){
                return json(['code' => -2, 'data' => '', 'msg' => $e->getMessage()]);
            }

            return json(['code' => 1, 'data' => '', 'msg' => '编辑常用语成功']);
        }

        $id = input('param.id/d');
        $info = db('words')->where('id', $id)->find();

        $this->assign([
            'info' => $info,
            'status' => config('kf_status')
        ]);
        return $this->fetch();
    }

    // 删除常用语
    public function delWord()
    {
        if(request()->isAjax()){
            $id = input('param.id/d');

            try{
                db('words')->where('id', $id)->delete();
            }catch(\Exception $e){
                return json(['code' => -1, 'data' => '', 'msg' => $e->getMessage()]);
            }

            return json(['code' => 1, 'data' => '', 'msg' => '删除常用语成功']);
        }
    }

    // 生成按钮
    private function makeBtn($id)
    {
        $operate = '<a href="' . url('words/editword', ['id' => $id]) . '">';
        $operate .= '<button type="button" class="btn btn-primary btn-sm"><i class="fa fa-paste"></i> 编辑</button></a> ';

        $operate .= '<a href="javascript:userDel(' . $id . ')"><button type="button" class="btn btn-danger btn-sm">';
        $operate .= '<i class="fa fa-trash-o"></i> 删除</button></a> ';

        return $operate;
    }
}