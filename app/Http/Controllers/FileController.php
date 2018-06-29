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
            /*
             * object(Illuminate\Http\UploadedFile)[491]
                  private 'test' (Symfony\Component\HttpFoundation\File\UploadedFile) => boolean false
                  private 'originalName' (Symfony\Component\HttpFoundation\File\UploadedFile) => string 'QQ截图20180308140459.png' (length=26)
                  private 'mimeType' (Symfony\Component\HttpFoundation\File\UploadedFile) => string 'image/png' (length=9)
                  private 'size' (Symfony\Component\HttpFoundation\File\UploadedFile) => int 139758
                  private 'error' (Symfony\Component\HttpFoundation\File\UploadedFile) => int 0
                  protected 'hashName' => null
                  private 'pathName' (SplFileInfo) => string 'D:\xampp\tmp\php8B52.tmp' (length=24)
                  private 'fileName' (SplFileInfo) => string 'php8B52.tmp' (length=11)
             */
            $extension = $photo->extension();
            var_dump($extension); // png
            var_dump($photo->getExtension()); // tmp
            var_dump($photo->getFilename()); // php8B52.tmp
            var_dump($photo->getSize()); // 139758
            var_dump($photo->getType()); // file
            var_dump($photo->getBasename()); // php8B52.tmp
            var_dump($photo->getFileInfo());
            /*
             * object(SplFileInfo)[498]
                  private 'pathName' => string 'D:\xampp\tmp\php8B52.tmp' (length=24)
                  private 'fileName' => string 'php8B52.tmp' (length=11)
             */
            var_dump($photo->getATime()); // 1530260044
            var_dump($photo->getCTime()); // 1530260044
            var_dump($photo->getClientOriginalName()); // QQ截图20180308140459.png
            var_dump($photo->getClientOriginalExtension()); // png
            var_dump($photo->getClientMimeType()); // image/png
            var_dump($photo->getClientSize()); // 139758
            var_dump($photo->clientExtension()); // png
            var_dump($photo->hashName()); // QRg7tSl4gMM2wV5Kc3LJGunxxj2FSyqr51YxpF3c.png
            var_dump($photo->getRealPath()); // D:\xampp\tmp\phpB362.tmp

            exit;

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