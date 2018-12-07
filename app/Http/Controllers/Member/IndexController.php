<?php

namespace App\Http\Controllers\Member;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

class IndexController extends Controller
{
    /**
     * 显示后台管理模板首页
     */
    public function index()
    {
        return view('member.index');
    }
}