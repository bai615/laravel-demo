@extends('layouts.app')

@section('content')

    <?php
    var_dump($users);

    foreach ($users as $user) {
        echo $user->name;
    }
    ?>

@endsection
