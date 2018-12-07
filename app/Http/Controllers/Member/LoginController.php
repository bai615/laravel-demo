<?php
namespace App\Http\Controllers\Member;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;

class LoginController extends Controller
{
    use AuthenticatesUsers;

    /**
     * Where to redirect users after login / registration.
     *
     * @var string
     */
    protected $redirectTo = '/member';

    /**
     * 显示后台登录模板
     */
    public function showLoginForm()
    {
        return view('member.login');
    }

    /**
     * 使用 admin guard
     */
    protected function guard()
    {
        return auth()->guard('member');
    }

}