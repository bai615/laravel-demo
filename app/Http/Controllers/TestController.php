<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class TestController extends Controller
{
    use AuthenticatesUsers;
    use AuthenticatesUsers;

    public function index(Request $request)
    {
//        $result = Auth::loginUsingId(4);
//        //获取这个登录用户的id;
//        dd(auth()->user()->id);
//        var_dump($result);

        /*$request->merge(['password'=>'123456']);
        $credentials = $this->credentials($request);
        $remember    = $request->input('remember', false);
        var_dump($remember);
        var_dump(Auth::attempt($credentials, $remember));
        var_dump($credentials);exit;*/

        $request->merge(['password'=>'123456']);
        $this->validateLogin($request);

        if($this->attemptLogin($request)){
            return $this->sendLoginResponse($request);
        }

//        var_dump($this->guard());
//        var_dump(Auth::guard('new'));


//        var_dump($this->attemptLogin($request));
//        debug_print_backtrace();
//        var_dump(debug_backtrace());
//        var_dump($request);
    }

    /**
     * 使用 admin guard
     */
    public function guard()
    {
        return auth()->guard('member');
    }

    /**
     * Attempt to log the user into the application.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return bool
     */
    /*public function attemptLogin(Request $request)
    {
        return Auth::guard('new')->attempt(
            $this->credentials($request), $request->filled('remember')
        );
    }*/

    /**
     * Send the response after the user was authenticated.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    /*protected function sendLoginResponse(Request $request)
    {
        $request->session()->regenerate();

        $this->clearLoginAttempts($request);

        return $this->authenticated($request, Auth::guard('new')->user())
            ?: redirect()->intended($this->redirectPath());
    }*/
}