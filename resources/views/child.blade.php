<!-- 存放在 resources/views/child.blade.php -->

@extends('layouts.app')

@section('title', 'Laravel学院')

@section('sidebar')
    @parent
    <p>Laravel学院致力于提供优质Laravel中文学习资源</p>
@endsection

@section('content')
    <p>这里是主体内容，完善中...</p>

    The current UNIX timestamp is {{ time() }}.
@endsection


@component('alert')
@slot('title')
Forbidden
@endslot

You are not allowed to access this resource!
@endcomponent

扩展 Blade - 自定义指令</br>
@datetime(1508888888)
</br>