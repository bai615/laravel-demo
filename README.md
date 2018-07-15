# laravel-demo

laravel 5.5 demo

Laravel 5.5 是一个 LTS 版本，会提供为期 2 年的 bug 修复和为期 3 年的安全修复支持。


## 安装说明：

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

5、调整 config/database.php 中数据库信息 (此处可以不用修改)

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




##问题记录

```
php artisan jwt:generate
```
如果上述命令执行报错，可以通过这个链接解决:

https://github.com/tymondesigns/jwt-auth/issues/1298

Hi all,
I came upon one issue when I try to run php artisan jwt:generate I get the Reflection Exception saying "[ReflectionException] Method Tymon\JWTAuth\Commands\JWTGenerateCommand::handle() does not exist"

Both Facades and service providers are entered properly and they are valid.

Also for people who have a struggle to make it work I can advise one solution. Go to JWTGenerateCommand.php file located in vendor/tymon/src/Commands and paste this part of code public function handle() { $this->fire(); }

I know this is not an elegant solution, but it works. I hope this might help until official fix arrive.

Have a nice day.
