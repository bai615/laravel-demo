<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

use Illuminate\Http\Request;
//use Psr\Http\Message\ServerRequestInterface;

Route::get('/', function (Request $request) {
//    var_dump(storage_path('app/photo/test.jpg')); //D:\workspace\laravel\blog_5.5\storage\app/photo/test.jpg
//    var_dump($request);
    return view('welcome', ['website' => 'Laravel study']);
});

Route::get('child',function (){
    return view('child');
});

//Route::get('/', function (ServerRequestInterface $request) {
//    var_dump($request);
//    return view('welcome', ['website' => 'Laravel study']);
//});

//Route::get('/', function () {
//    return view('welcome');
//});

//Route::get('/', function () {
//    return view('welcome', ['website' => 'Laravel study']);
//});

Route::resource('posts', 'PostController');

Route::resource('users', 'UserController');


Route::get('hello', function () {
    return 'Hello, welcome to LaravelAcademy.org';
});

Route::get('/user-test', 'UserTestController@index')->middleware('token');

// 注册一个路由响应多种 HTTP 请求动作
Route::match(['get', 'post'], 'foo_web', function () {
    return 'This is a request from get or post';
});

// 注册一个路由来响应所有 HTTP 请求动作
Route::any('bar_web', function () {
    return 'This is a request from any HTTP werb';
});

Route::get('form', function () {
    return '<form method="POST" action="/foo_web"' . csrf_field() . '<button type="submit">提交</button></form>';
});

Route::get('member/{id}', function ($id) {
    return 'Member ' . $id;
});

Route::get('posts/{post}/comments/{comment}', function ($postId, $commentId) {
    return $postId . '-' . $commentId;
});

Route::get('/users/{user}', function (App\User $user) {
    dd($user);
});

Route::get('post/{id}', function ($id) {
    return 'post-' . $id;
})->middleware('role:editor');

Route::get('cookie/add', function () {
    $minutes = 24 * 60;
    return response('欢迎来到 Laravel 世界')->cookie('name', '内容', $minutes);
});

Route::get('cookie/get',function (Request $request){
    $cookie = $request->cookie('name');
    dd($cookie);
});

Route::post('file/upload','FileController@upload');
/*
Route::post('file/upload',function (Request $request){
    if($request->hasFile('photo') && $request->file('photo')->isValid()){
        $photo = $request->file('photo');
        $extension = $photo->extension();
        $store_result = $photo->store('photo');
//        $store_result = $photo->storeAs('photo','test.jpg');
        $output = [
            'extension'=>$extension,
            'store_result' =>$store_result
        ];
        var_dump($output);exit;
    }
    exit('未获取到上传文件或者上传过程出错');
});
*/