# laravel-demo

laravel 5.5 demo

Laravel 5.5 是一个 LTS 版本，会提供为期 2 年的 bug 修复和为期 3 年的安全修复支持。


安装说明：

1、下载程序

git clone https://github.com/bai615/laravel-demo.git

cd laravel-demo


2、安装依赖库文件

composer install -vvv 或者 composer update -vvv

3、设置配置文件

cp .env.example .env

vim .env

修改数据库配置项
```
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=database name
DB_USERNAME=user name
DB_PASSWORD=password
```

4、更新数据库

php artisan serve

5、调整 config/database.php 中数据库信息

vim config/database.php

修改数据库配置项
```
'mysql' => [
            'driver' => 'mysql',
            'host' => env('DB_HOST', '127.0.0.1'),
            'port' => env('DB_PORT', '3306'),
            'database' => env('DB_DATABASE', 'database name'),
            'username' => env('DB_USERNAME', 'user name'),
            'password' => env('DB_PASSWORD', 'password'),
            'unix_socket' => env('DB_SOCKET', ''),
            'charset' => 'utf8mb4',
            'collation' => 'utf8mb4_unicode_ci',
            'prefix' => '',
            'strict' => true,
            'engine' => null,
        ],
```

6、运行项目
php artisan serve
