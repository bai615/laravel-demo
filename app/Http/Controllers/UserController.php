<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        /*
        $users = DB::table('users')->select('name', 'email as user_email')->get();
        var_dump($users);

        $names = DB::table('users')->pluck('name');
        var_dump($names);


        $email = DB::table('users')->where('name', 'John')->value('email');
        var_dump($email);

        $user = DB::table('users')->where('name', 'John')->first();
        var_dump($user);
        echo $user->name;
        echo '</br>';


        $users = DB::table('users')->get();
//        var_dump($users);exit;
        return view('user.index', ['users' => $users]);
        */

        $users = DB::table('users')->paginate(1);
        $users = User::where('id', '>', 1)->paginate(1);
        return view('user.show', ['users' => $users]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        DB::table('users')->get();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\User $user
     * @return \Illuminate\Http\Response
     */
    public function show(User $user)
    {
        //
        $users = DB::table('users')->paginate(15);
        return view('user.show', ['users' => $users]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\User $user
     * @return \Illuminate\Http\Response
     */
    public function edit(User $user)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  \App\User $user
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, User $user)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\User $user
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user)
    {
        //
    }
}
