<?php

namespace App\GraphQL\Mutation;

use App\User;
use Folklore\GraphQL\Support\Mutation;
use GraphQL\Type\Definition\ResolveInfo;
use GraphQL\Type\Definition\Type;
use GraphQL;
use Tymon\JWTAuth\JWTAuth;

class UpdateUserPasswordMutation extends Mutation
{
    protected $attributes = [
        'name' => 'UpdateUserPassword',
        'description' => 'A mutation'
    ];

    public function type()
    {
        return GraphQL::type('User');
    }

    public function args()
    {
        return [
            'id' => ['name' => 'id', 'type' => Type::nonNull(Type::string())],
            'password' => ['name' => 'password', 'type' => Type::nonNull(Type::string())]
        ];
    }

    public function resolve($root, $args, $context, ResolveInfo $info)
    {
        $user = User::find($args['id']);

        if (!$user) {
            return null;
        }

        $user->password = bcrypt($args['password']);
        $user->save();

        return $user;
    }

    // 基于 jwt-auth 实现接口认证
    // 要让该操作认证后才能操作，可以在该方法中重写父类的 authenticate 方法
    /*public function authenticated($root, $args, $context)
    {
        return JWTAuth::parseToken()->authenticate() ? true : false;
    }*/
}
