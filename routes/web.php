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

//Route::get('/', function () {
//    return view('welcome');
//});
Route::get('/', function () {
    return view('welcome', ['website' => 'Laravel study']);
});

Route::get('hello', function () {
    return 'Hello, welcome to LaravelAcademy.org';
});

Route::get('/user', 'UserController@index')->middleware('token');

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
