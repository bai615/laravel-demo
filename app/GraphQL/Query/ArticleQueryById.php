<?php

namespace App\GraphQL\Query;

use App\Article;
use Folklore\GraphQL\Support\Query;
use GraphQL\Type\Definition\ResolveInfo;
use GraphQL\Type\Definition\Type;
use GraphQL;

class ArticleQueryById extends Query
{
    protected $attributes = [
        'name' => 'ArticleQueryById',
        'description' => 'A query'
    ];

    public function type()
    {
        return GraphQL::type('Article');
    }

    public function args()
    {
        return [
            'id' => ['name' => 'id', 'type' => Type::string()],
        ];
    }

    public function resolve($root, $args, $context, ResolveInfo $info)
    {
        if (empty($args['id'])) {
            throw new \InvalidArgumentException('请传入文章ID!');
        }
        return Article::find($args['id']);
    }
}
