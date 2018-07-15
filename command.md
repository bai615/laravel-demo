
通过 Composer Create-Project
```
composer create-project --prefer-dist laravel/laravel blog
```
如果要下载安装 Laravel 其他版本应用，比如 5.4 版本，可以使用这个命令：
```
composer create-project --prefer-dist laravel/laravel blog 5.4.*
```
本地开发服务器
```
php artisan serve
```
在 app/Models 目录下创建模型
```
php artisan make:model Models/Test
```
创建模型并生成 migrate 文件
```
php artisan make:model User --migration
php artisan make:model User -m
```
数据库迁移
```
php artisan migrate
```
数据表填充器
```
php artisan make:seeder UsersTableSeeder
```
运行填充器
```
php artisan db:seed
php artisan db:seed --class=UsersTableSeeder
```
重新生成 Composer 的自动加载器：
```
composer dump-autoload
```
回滚并重新运行所有迁移，这在需要完全重建数据库时很有用：
```
php artisan migrate:refresh --seed
```
路由缓存
```
php artisan route:cache
```
移除缓存路由文件
```
php artisan route:clear
```
定义中间件
```
php artisan make:middleware CheckToken
```
快速创建一个控制器
```
php artisan make:controller UserController 
```
资源控制器
```
php artisan make:controller PostController --resource
```
指定资源模型
```
php artisan make:controller PostController --resource --model=Post
```
使用 Artisan 命令 session:table 在数据库中创建 session 表
```
php artisan session:table
php artisan migrate
```
生成迁移
```
php artisan make:migration create_users_table
php artisan make:migration create_users_table --create=users
php artisan make:migration add_votes_to_users_table --table=users
```
运行迁移
```
php artisan migrate
```
在生产环境中强制运行迁移
```
php artisan migrate --force
```
回滚迁移
```
php artisan migrate:rollback
php artisan migrate:rollback --step=5
php artisan migrate:reset
```
在单个命令中回滚 & 迁移
```
php artisan migrate:refresh

// 重建数据库并填充数据...
php artisan migrate:refresh --seed

php artisan migrate:refresh --step=5
```
删除所有表 & 迁移
```
php artisan migrate:fresh

php artisan migrate:fresh --seed
```
生成资源类
```
php artisan make:resource UserResource
php artisan make:resource Users --collection
php artisan make:resource UserCollection
```
快速生成认证所需要的路由和视图
```
php artisan make:auth
```
查看所有可用的 Artisan 命令
```
php artisan list
```
查看帮助界面，只需要在命令前加上 help
```
php artisan help migrate
```
运行 tinker 命令
```
php artisan tinker
```
生成命令
```
php artisan make:command SendEmails
```
生成事件/监听器类
```
// 该命令将会生成罗列在 EventServiceProvider 中的所有事件和监听器。当然，已存在的事件和监听器不会被重复创建
php artisan event:generate
```
生成数据库队列表
```
php artisan queue:table
```
高优先级的任务委派到 high (高优先级)队列，从而让它优先执行
```
php artisan queue:work --queue=high,default
```
生成任务类
```
php artisan make:job ProcessPodcast
```
指定队列任务最大失败次数的一种实现方式是通过 Artisan 命令 --tries 切换：
```
php artisan queue:work --tries=3
```
队列任务最大运行时长（秒）可以通过 Artisan 命令上的 --timeout 开关来指定：
```
php artisan queue:work --timeout=30
```
运行队列进程
```
php artisan queue:work
// 处理单个任务
php artisan queue:work --once
// 指定连接和队列
php artisan queue:work redis --queue=emails
```
重启队列进程:
```
php artisan queue:restart
```
创建通知
```
php artisan make:notification InvoicePaid
// 生成带有相应 Markdown 模板的通知
php artisan make:notification InvoicePaid --markdown=mail.invoice.paid
```
自定义通知模板
```
php artisan vendor:publish --tag=laravel-notifications
```
你可以导出所有 Markdown 通知组件到应用中进行自定义，要导出组件，使用 Artisan 命令 vendor:publish 来发布 laravel-mail 资源标签：
```
php artisan vendor:publish --tag=laravel-mail
```
数据库通知
```
php artisan notifications:table

php artisan migrate
```
创建 & 运行测试
```
// 在 Feature 目录下创建测试类...
php artisan make:test UserTest

// 在 Unit 目录下创建测试类...
php artisan make:test UserTest --unit
```
生成模型工厂
```
php artisan make:factory PostFactory
// 通过给定的模型名称预填充生成的工厂类
php artisan make:factory PostFactory --model=Post
```
编写服务提供者
```
php artisan make:provider RiakServiceProvider
```


## 前端命令
移除前端脚手架代码
```
php artisan preset none
```
使用 React
```
php artisan preset react
```
监控前端资源改变
```
npm run watch
```
你可能会发现文件变更的时候特定环境的 Webpack 不会更新，如果你遇到了这样的问题，可以考虑使用 watch-poll 命令：
```
npm run watch-poll
```