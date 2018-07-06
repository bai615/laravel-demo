<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Phone extends Model
{
    /**
     * 获取拥有该手机的用户（定义相对的关联）
     */
    public function user()
    {
        return $this->belongsTo('App\User');
        /**
         * Eloquent 默认将会尝试通过 Phone 模型的 user_id 去 User 模型查找与之匹配的记录。
         * Eloquent 通过在关联关系方法名后加 _id 后缀来生成默认的外键名。
         * 不过，如果 Phone 模型上的外键不是 user_id，也可以将自定义的键名作为第二个参数传递到 belongsTo 方法
         */
        // return $this->belongsTo('App\User', 'foreign_key');

        // 如果父模型不使用 id 作为主键，或者你希望使用别的数据列来连接子模型，可以将父表自定义键作为第三个参数传递给 belongsTo 方法
        // return $this->belongsTo('App\User', 'foreign_key', 'other_key');
        // return $this->belongsTo('App\User', 'user_id', 'id');
    }
}
