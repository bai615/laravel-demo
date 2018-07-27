<?php

namespace App\Http\Controllers\JwtApi;

use App\Http\Controllers\Controller;
use App\Http\Requests\RegisterRequest;
use App\Transformers\UserTransformer;
use App\User;
use Illuminate\Http\Request;
use Tymon\JWTAuth\Facades\JWTAuth;

class AuthController extends Controller
{
    //
    public function register(RegisterRequest $request)
    {
        $user = new User();
        $user->email = $request->email;
        $user->name = $request->name;
//        $user->password = bcrypt($request->password);
        $user->password = $request->password;
        $user->save();
        return response([
            'status' => 'success',
            'data' => $user
        ], 200);
    }

    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');
//        print_r($credentials);
        /**
         * 认证信息格式
         * Array
        (
            [email] => auth01@test.com
            [password] => 1234567890
        )
         */
        if (!$token = JWTAuth::attempt($credentials)) {
            return response([
                'status' => 'error',
                'error' => 'invalid.credentials',
                'msg' => 'Invalid Credentials.'
            ], 400);
        }
        return response(['status' => 'success'])
            ->header('Authorization', $token);
    }

    public function user(Request $request)
    {
        $user = User::find(\Auth::user()->id);
        $user = fractal($user, new UserTransformer())->toArray();
        return response([
            'status' => 'success',
            'data' => $user
        ]);
    }

    public function refresh()
    {
        return response([
            'status' => 'success'
        ]);
    }

    public function logout()
    {
        JWTAuth::invalidate();
        return response([
            'status' => 'success',
            'msg' => 'Logged out Successfully.'
        ], 200);
    }
}
