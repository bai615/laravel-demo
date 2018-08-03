<?php

namespace App\Thrift\Services;

use App\Thrift\Example\ExampleIf;

class ExampleService implements ExampleIf
{
    /**
     * @return string
     */
    public function ping()
    {
        return 'ping';
    }

    /**
     * @param string $msg
     *
     * @return string
     */
    public function say($msg)
    {
        return $msg;
    }
}
