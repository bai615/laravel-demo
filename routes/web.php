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


// usage inside a laravel route
Route::get('/image', function()
{
    /*
    $mangager = new \Intervention\Image\ImageManager();

    $image = $mangager->make('foo.jpg')->resize(300,200);

    $image->text('123', 50, 100, function ($font) {
        $font->file(realpath('./fonts/msyh.ttc'));
        $font->size(32);
        $font->color('#212121');
        $font->align('cneter');
        $font->valign('top');
    });

    $image->save('./ok.jpg');

    return 'ok';
    */

    $img = Image::make('foo.jpg')->resize(300, 200);
    return $img->response('jpg');
});


/*
Route::get('/', function (Request $request) {
//    var_dump(storage_path('app/photo/test.jpg')); //D:\workspace\laravel\blog_5.5\storage\app/photo/test.jpg
//    var_dump($request);
    return view('welcome', ['website' => 'Laravel study']);
});
*/

//Route::get('/welcome/{locale}', function ($locale) {
//    App::setLocale($locale);
//    echo __('messages.welcome');
//});

Route::get('child', function () {
    return view('child');
});

Route::get('/user', function () {
//   return new \App\Http\Resources\UserResource(\App\User::find(1));
//    return \App\Http\Resources\UserResource::collection(\App\User::all());
    return new \App\Http\Resources\UserCollection(\App\User::all());
//    return new \App\Http\Resources\UserCollection(\App\User::paginate());
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

Route::get('/','PostController@index')->name('home');

Route::resource('posts', 'PostController');

Route::resource('users', 'UserController');

Route::resource('permissions', 'PermissionController');
Route::resource('roles', 'RoleController');

Route::resource('products', 'ProductController');


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

Route::get('cookie/get', function (Request $request) {
    $cookie = $request->cookie('name');
    dd($cookie);
});

Route::post('file/upload', 'FileController@upload');
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
Auth::routes();

//Route::get('/home', 'HomeController@index')->name('home');

Route::group(['prefix' => 'admin'], function () {
    Route::group(['middleware' => 'auth.admin'], function () {
        Route::get('/', 'Admin\IndexController@index');
    });

    Route::get('login', 'Admin\LoginController@showLoginForm')->name('admin.login');
    Route::post('login', 'Admin\LoginController@login');
    Route::post('logout', 'Admin\LoginController@logout');
});

//Route::get('/auth/callback', function (\Illuminate\Http\Request $request){
//    if ($request->get('code')) {
//        return 'Login Success';
//    } else {
//        return 'Access Denied';
//    }
//});

Route::get('/auth/callback', function (Request $request) {
    $http = new GuzzleHttp\Client;

    // 以下方式都能拿到 code
//    echo $request->get('code');
//    echo "</br>";
//    echo $request->code;

    $response = $http->post('http://demo.laravelblog.com/oauth/token', [
        'form_params' => [
            'grant_type' => 'authorization_code',
            'client_id' => '3',  // your client id
            'client_secret' => 'Suw67fagA8dF8zbKuaoipIWZqPcaqAuSP3ymAT72',   // your client secret
            'redirect_uri' => 'http://demo.laravelblog.com/auth/callback',
            'code' => $request->get('code'),
        ],
    ]);

    return json_decode((string) $response->getBody(), true);
});

// 密码授权客户端
Route::get('/auth/password', function (\Illuminate\Http\Request $request){
    $http = new \GuzzleHttp\Client();

    $response = $http->post('http://demo.laravelblog.com/oauth/token', [
        'form_params' => [
            'grant_type' => 'password',
            'client_id' => '2',
            'client_secret' => 'U3jR2EkiM3LwLKzAjeEnntJG2VaCS7W9cuuTIDay',
            'username' => 'auth01',
            'password' => '1234567890',
            'scope' => '',
        ],
    ]);

    return json_decode((string)$response->getBody(), true);
});
