<?php
/**
 * Created by PhpStorm.
 * User: SNDS
 * Date: 2018/6/27
 * Time: 13:23
 */

namespace App\Http\Controllers;


use App\User;

class UserTestController extends Controller
{
    public function index()
    {
        // http://demo.laravelblog.com/user-test?token=laravelacademy.org

        echo 'user-index';

        $user = User::find(1);
        var_dump($user->name);

//        var_dump($user->phone);
        var_dump($user->phone->name);
    }
}