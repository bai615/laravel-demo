<?php

namespace App\Providers;

use Illuminate\Support\Facades\Blade;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        // 分页器生成的分页链接现在默认使用 Bootstrap 4，要让分页器生成 Bootstrap 3 链接，需要在 AppServiceProvider 的 boot 方法中调用 Paginator::useBootstrapThree 方法
//        Paginator::useBootstrapThree();

        // 在之前版本的 Laravel 中，Blade 不会对 HTML 实体进行双重编码。这并不是底层 htmlspecialchars 函数的默认行为，而且会在渲染内容或传递内联 JSON 内容到 JavaScript 框架时导致预期之外的结果。
        // 在 Laravel 5.6 中，Blade 以及辅助函数 e 默认会对特殊字符进行双重编码，从而与 PHP 底层 htmlspecialchars 函数的默认行为保持一致。如果你想要维持不进行双重编码的旧状，可以使用 Blade::withoutDoubleEncoding 方法
//        Blade::withoutDoubleEncoding();

        Schema::defaultStringLength(191);

        Blade::directive('datetime',function ($expression){
            return "<?php echo date('Y-m-d H:i:s', $expression); ?>";
        });
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}
