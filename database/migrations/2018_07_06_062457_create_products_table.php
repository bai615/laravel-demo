<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->increments('id')->comment('商品ID');
            $table->string('name',100)->comment('商品名称');
            $table->string('summary',2000)->comment('商品简介');
            $table->text('detail')->comment('商品详情');
            $table->integer('status')->comment('状态');
            $table->integer('sort')->comment('排序序号');
            $table->string('remark',500)->comment('备注');
//            $table->dateTime('created_at')->comment('创建时间'); // 系统默认添加此字段，类型：timestamp
//            $table->dateTime('updated_at')->nullable()->comment('最后更新时间'); // 系统默认添加此字段，类型：timestamp
            $table->timestamps(); // 与上面两个字段冲突
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('products');
    }
}
