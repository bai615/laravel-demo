<?php

namespace App\Http\Controllers;

use App\Post;
use Illuminate\Http\Request;

class PostController extends Controller
{

    public function __construct() {
//        $this->middleware(['auth', 'clearance'])->except('index', 'show');
    }

    /**
     * 显示文章列表
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // GET http://127.0.0.1:8000/posts
//        echo 'posts-index';

        $posts = Post::orderby('id', 'desc')->paginate(5); //show only 5 items at a time in descending order

        return view('posts.index', compact('posts'));
    }

    /**
     * 显示创建文章表单
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        // GET http://127.0.0.1:8000/posts/create

        return view('posts.create');
    }

    /**
     * 存储新增文章
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //POST http://127.0.0.1:8000/posts

        //验证 title 和 body 字段
        $this->validate($request, [
            'title'=>'required|max:100',
            'content' =>'required',
        ]);

        $title = $request['title'];
        $content = $request['content'];

        $post = Post::create($request->only('title', 'content'));

        // 基于保存结果显示成功消息
        return redirect()->route('posts.index')
            ->with('flash_message', 'Article,
             '. $post->title.' created');
    }

    /**
     * 显示指定资源
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        // GET http://127.0.0.1:8000/posts/1

        $post = Post::findOrFail($id); //通过 id = $id 查找文章

        return view ('posts.show', compact('post'));
    }

    /**
     * 显示编辑文章表单
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        // GET http://127.0.0.1:8000/posts/1/edit

        $post = Post::findOrFail($id);

        return view('posts.edit', compact('post'));
    }

    /**
     * 更新文章
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        // PUT/PATCH http://127.0.0.1:8000/posts/1

        $this->validate($request, [
            'title'=>'required|max:100',
            'content'=>'required',
        ]);

        $post = Post::findOrFail($id);
        $post->title = $request->input('title');
        $post->content = $request->input('content');
        $post->save();

        return redirect()->route('posts.show',
            $post->id)->with('flash_message',
            'Article, '. $post->title.' updated');
    }

    /**
     * 删除文章
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        // DELETE http://127.0.0.1:8000/posts/1

        $post = Post::findOrFail($id);
        $post->delete();

        return redirect()->route('posts.index')
            ->with('flash_message',
                'Article successfully deleted');
    }
}
