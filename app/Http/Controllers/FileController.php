<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Qiniu\Auth;
use Qiniu\Storage\UploadManager;

class FileController extends Controller
{
    public function upload(Request $request)
    {
        if ($request->hasFile('photo') && $request->file('photo')->isValid()) {
            $photo = $request->file('photo');
            var_dump($photo);
            $extension = $photo->extension();

            // 用于签名的公钥和私钥
            $accessKey = 'Access_Key';
            $secretKey = 'Secret_Key';

            // 初始化签权对象
            $auth = new Auth($accessKey, $secretKey);

            $bucket = 'public-images';
            // 生成上传Token
            $token = $auth->uploadToken($bucket);
            var_dump($token);

            // 要上传文件的本地路径
            $filePath = $photo->getPathname(); // D:\xxx\tmp\phpF5BA.tmp
            var_dump($filePath);
            // 上传到七牛后保存的文件名
            $key = 'test.png';
            // 初始化 UploadManager 对象并进行文件的上传。
            $uploadMgr = new UploadManager();
            // 调用 UploadManager 的 putFile 方法进行文件的上传。
            $result = $uploadMgr->putFile($token, $key, $filePath);
            var_dump($result);
            /*
             * array (size=2)
                  0 =>
                    array (size=2)
                      'hash' => string 'Fj_sTbi1B8RNFQjxDjzXY1YvdCBy' (length=28)
                      'key' => string 'test.png' (length=8)
                  1 => null
             */
        }
    }

    public function localUpload(Request $request)
    {
        if ($request->hasFile('photo') && $request->file('photo')->isValid()) {
            $photo = $request->file('photo');
            $extension = $photo->extension();
            $store_result = $photo->store('photo');
//        $store_result = $photo->storeAs('photo','test.jpg');
            $output = [
                'extension' => $extension,
                'store_result' => $store_result
            ];
            var_dump($output);
            exit;
        }
        exit('未获取到上传文件或者上传过程出错');
    }
}