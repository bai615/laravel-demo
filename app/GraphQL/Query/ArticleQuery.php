<?php

namespace App\GraphQL\Query;

use App\Article;
use Folklore\GraphQL\Support\Query;
use GraphQL\Type\Definition\ResolveInfo;
use GraphQL\Type\Definition\Type;
use GraphQL;

class ArticleQuery extends Query
{
    protected $attributes = [
        'name' => 'articles',
        'description' => 'articles query'
    ];

    public function type()
    {
        return Type::listOf(GraphQL::type('Article'));
    }

    public function args()
    {
        return [
            'id' => ['name' => 'id', 'type' => Type::string()],
            'title' => ['name' => 'title', 'type' => Type::string()],
            'user_id' => ['name' => 'user_id', 'type' => Type::string()]
        ];
    }

    public function resolve($root, $args, $context, ResolveInfo $info)
    {
        $fields = $info->getFieldSelection($depth = 3);

        if (isset($args['id'])) {
            $articles = Article::where('id', $args['id']);
        } elseif (isset($args['title'])) {
            $articles = Article::where('title', 'like', $args['title'] . '%');
        } else {
            $articles = Article::query();
        }

        foreach ($fields as $field => $keys) {
            if ($field === 'author') {
                $articles->with('author');
            }
        }

        return $articles->get();
    }
}
