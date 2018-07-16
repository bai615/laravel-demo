@extends('layouts.app')

@section('title', '| Create New Post')

@section('content')
    <div class="row">
        <div class="col-md-8 col-md-offset-2">

            <h1>Create New Post</h1>
            <hr>

            {{-- 使用 Laravel HTML Form Collective 创建表单 --}}
            {{ Form::open(array('route' => 'posts.store')) }}

            <div class="form-group">
                {{ Form::label('title', 'Title') }}
                {{ Form::text('title', null, array('class' => 'form-control')) }}
                <br>

                {{ Form::label('content', 'Post Body') }}
                {{ Form::textarea('content', null, array('class' => 'form-control')) }}
                <br>

                {{ Form::submit('Create Post', array('class' => 'btn btn-success btn-lg btn-block')) }}
                {{ Form::close() }}
            </div>
        </div>
    </div>

@endsection