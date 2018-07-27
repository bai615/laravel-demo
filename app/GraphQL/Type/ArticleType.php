<?php

namespace App\GraphQL\Type;

use GraphQL\Type\Definition\Type;
use Folklore\GraphQL\Support\Type as BaseType;
use GraphQL;

class ArticleType extends BaseType
{
    protected $attributes = [
        'name' => 'Article',
        'description' => 'An Article'
    ];

    public function fields()
    {
        return [
            'id' => [
                'type' => Type::nonNull(Type::string()),
                'description' => 'The id of the article'
            ],
            'title' => [
                'type' => Type::nonNull(Type::string()),
                'description' => 'The title of the article'
            ],
            'content' => [
                'type' => Type::nonNull(Type::string()),
                'description' => 'The body of the article'
            ]
        ];
    }

    protected function resolveContentField($root, $args)
    {
        return $root->body;
    }
}
