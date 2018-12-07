<?php

namespace App\Providers;

use App\Foundation\Auth\RyanEloquentUserProvider;
use Laravel\Passport\Passport;
use Illuminate\Support\Facades\Gate;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        'App\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        // 该方法将会为颁发访问令牌、撤销访问令牌、客户端以及私人访问令牌注册必要的路由
        Passport::routes();

        Passport::tokensExpireIn(now()->addDays(15));

        Passport::refreshTokensExpireIn(now()->addDays(30));

        \Auth::provider('ryan-eloquent', function ($app, $config) {
            return new RyanEloquentUserProvider($this->app['hash'], $config['model']);
        });

    }
}
