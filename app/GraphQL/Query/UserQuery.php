<?php

namespace App\GraphQL\Query;

use App\User;
use Folklore\GraphQL\Support\Query;
use GraphQL\Type\Definition\ResolveInfo;
use GraphQL\Type\Definition\Type;
use GraphQL;

class UserQuery extends Query
{
    protected $attributes = [
        'name' => 'users',
        'description' => 'A query'
    ];

    public function type()
    {
        return Type::listOf(GraphQL::type('User'));
    }

    public function args()
    {
        return [
            'id' => ['name' => 'id', 'type' => Type::string()],
            'email' => ['name' => 'email', 'type' => Type::string()]
        ];
    }

    public function resolve($root, $args, $context, ResolveInfo $info)
    {
        $fields = $info->getFieldSelection($depth = 3);

        if (isset($args['id'])) {
            return User::where('id', $args['id'])->get();
        } elseif (isset($args['email'])) {
            return User::where('email', $args['email'])->get();
        } else {
            return User::all();
        }

        foreach ($fields as $field => $keys) {
            if ($field === 'comments') {
                $users->with('comments');
            }
        }

        return $users->get();
    }
}
