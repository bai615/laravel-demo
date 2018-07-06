<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Product extends Model
{
    use SoftDeletes;

    //
    /**
     * 表明模型是否应该被打上时间戳
     * @var bool
     */
    public $timestamps = false;

    /**
     * 应该被调整为日期的属性
     * @var array
     */
    protected $dates = ['deleted_at'];
}
