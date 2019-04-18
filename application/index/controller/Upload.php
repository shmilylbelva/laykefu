<?php
namespace app\index\controller;

use think\Controller;

class Upload extends Controller
{

    //上传图片
    public function uploadImg()
    {
        $file = request()->file('file');

        $fileInfo = $file->getInfo();
        /*if($fileInfo['size'] > 1024 * 1024 * 2){
            // 上传失败获取错误信息
            return json( ['code' => -2, 'data' => '', 'msg' => '文件超过2M'] );
        }*/

        //检测图片格式
        $ext = explode('.', $fileInfo['name']);
        $ext = array_pop($ext);

        $extArr = explode('|', 'jpg|png|gif|jpeg');
        if(!in_array($ext, $extArr)){
            return json(['code' => -3, 'data' => '', 'msg' => '只能上传jpg|png|gif|jpeg的文件']);
        }

        // 移动到框架应用根目录/public/uploads/ 目录下
        $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
        if($info){
            $src =  '/uploads' . '/' . date('Ymd') . '/' . $info->getFilename();
            return json(['code' => 0, 'data' => ['src' => $src ], 'msg' => '']);
        }else{
            // 上传失败获取错误信息
            return json(['code' => -1, 'data' => '', 'msg' => $file->getError()]);
        }
    }

    //上传文件
    public function uploadFile()
    {
        $file = request()->file('file');

        $fileInfo = $file->getInfo();
        /*if($fileInfo['size'] > 1024*1024*2){
            // 上传失败获取错误信息
            return json( ['code' => -2, 'data' => '', 'msg' => '文件超过2M'] );
        }*/

        // 检测文件格式
        $ext = explode('.', $fileInfo['name']);
        $ext = array_pop($ext);

        $extArr = explode('|', 'zip|rar');
        if(!in_array($ext, $extArr)){
            return json(['code' => -3, 'data' => '', 'msg' => '只能上传zip|rar的文件']);
        }

        // 移动到框架应用根目录/public/uploads/ 目录下
        $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
        if($info){
            $src =  '/uploads' . '/' . date('Ymd') . '/' . $info->getFilename();
            return json(['code' => 0, 'data' => ['src' => $src ], 'msg' => $fileInfo['name']]);
        }else{
            // 上传失败获取错误信息
            return json(['code' => -1, 'data' => '', 'msg' => $file->getError()]);
        }
    }
}