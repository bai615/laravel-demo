<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

// 注册一个路由响应多种 HTTP 请求动作
Route::match(['get', 'post'], 'foo_api', function () {
    return 'This is a request from get or post';
});

// 注册一个路由来响应所有 HTTP 请求动作
Route::any('bar_api', function () {
    return 'This is a request from any HTTP werb';
});