<?php

namespace App;

use Laravel\Passport\HasApiTokens;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use HasApiTokens, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * 获取关联到用户的手机
     */
    public function phone()
    {
        return $this->hasOne('App\Phone');
        // return $this->hasOne('App\Phone', 'foreign_key');
        // return $this->hasOne('App\Phone', 'foreign_key', 'local_key');
        // return $this->hasOne('App\Phone', 'user_id', 'id');
    }

    public function isAdmin()
    {
        return $this->id == 1 ? true : false;
    }
}
