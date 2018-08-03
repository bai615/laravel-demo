<?php

return [
    'services' => [
        /**
         * The service name
         *
         * `php artisan thrift:server name`
         */
        'example' => [
            /**
             * Default host name
             */
            'host' => 'localhost',

            /**
             * Default port number
             */
            'port' => 8080,

            /**
             * The class that implements the interface defined in the thrift file.
             *
             * Required
             */
            'service' => 'App\Thrift\Services\ExampleService',

            /**
             * The generated class after calling `php artisan thrift:compile example.thrift --namespace=App\Example`
             * e.g. (App\Example\ExampleProcessor)
             *
             * Required in server mode
             */
            'processor' => 'App\Thrift\Example\ExampleProcessor',

            /**
             * The generated class after calling `php artisan thrift:compile example.thrift --namespace=App\Example`
             * e.g. (App\Example\ExampleClient)
             *
             * Required in client mode
             */
            'client' => 'App\Thrift\Example\ExampleClient',
        ],
    ],
];
