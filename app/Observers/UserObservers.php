<?php

namespace App\Observers;

use App\User;

class UserObservers
{
    /**
     * 监听用户创建事件.
     *
     * @param  User $user
     * @return void
     */
    public function created(User $user)
    {
        //
    }

    /**
     * 监听用户删除事件.
     *
     * @param  User $user
     * @return void
     */
    public function deleting(User $user)
    {
        //
    }
}