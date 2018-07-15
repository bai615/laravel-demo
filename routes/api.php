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

/*Route::get('articles', function () {
    // If the Content-Type and Accept headers are set to 'application/json',
    // this will return a JSON structure. This will be cleaned up later.
    return \App\Article::all();
});
Route::get('articles/{id}', function ($id) {
    return \App\Article::find($id);
});
Route::post('articles', function (Request $request) {
    return \App\Article::create($request->all());
});
Route::put('article/{id}', function (Request $request, $id) {
    $article = \App\Article::findOrFail($id);
    $article->update($request->all());

    return $article;
});
Route::delete('articles/{id}', function ($id) {
    \App\Article::find($id)->delete();

    return 204;
});*/
Route::get('articles', 'ArticleController@index');
Route::get('articles/{id}','ArticleController@show');
Route::post('articles','ArticleController@store');
Route::put('article/{id}','ArticleController@update');
Route::delete('articles{id}','ArticleController@delete');

// 注册一个路由响应多种 HTTP 请求动作
Route::match(['get', 'post'], 'foo_api', function () {
    return 'This is a request from get or post';
});

// 注册一个路由来响应所有 HTTP 请求动作
Route::any('bar_api', function () {
    return 'This is a request from any HTTP werb';
});

Route::get('/redirect', function () {
    $query = http_build_query([
        'client_id' => '3',
        'redirect_uri' => 'http://demo.laravelblog.com/auth/callback',
        'response_type' => 'code',
        'scope' => '',
    ]);

    return redirect('http://demo.laravelblog.com/oauth/authorize?' . $query);
});