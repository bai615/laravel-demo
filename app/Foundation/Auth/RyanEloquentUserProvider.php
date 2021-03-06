<?php

namespace App\Foundation\Auth;

use Illuminate\Auth\EloquentUserProvider;
use Illuminate\Contracts\Auth\Authenticatable;
use Illuminate\Support\Str;


class RyanEloquentUserProvider extends EloquentUserProvider
{
    /**
     * Validate a user against the given credentials.
     *
     * @param  \Illuminate\Contracts\Auth\Authenticatable $user
     * @param  array                                      $credentials
     * @return bool
     */
    public function validateCredentials(Authenticatable $user, array $credentials)
    {
        $plain        = $credentials['password'];
        $authPassword = $user->getAuthPassword();

//        return sha1($authPassword['salt'] . sha1($authPassword['salt'] . sha1($plain))) == $authPassword['password'];
        return $this->hasher->check($plain, $authPassword);
    }
}