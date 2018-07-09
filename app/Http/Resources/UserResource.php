<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\Resource;

class UserResource extends Resource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request $request
     * @return array
     */
    public function toArray($request)
    {
//        return parent::toArray($request);

        // {"data":{"id":1,"name":"John","email":"EUZKl5p0Qk@laravel.com","created_at":null,"updated_at":null}}
        return [
            'id' => $this->id,
            'name' => $this->name,
            'email' => $this->email,
            'secret' => $this->when($this->isAdmin(),'secret-value'),
            $this->mergeWhen($this->isAdmin(),[
                'first-secret' => 'value',
                'second-secret' => 'value',
            ]),
//            'created_at' => $this->created_at,
//            'updated_at' => $this->updated_at,
        ];

    }
}
