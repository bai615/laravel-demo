<!-- 存放在 resources/views/layouts/app.blade.php -->

<html>
<head>
    <title>应用名称 - @yield('title')</title>
</head>
<body>
@section('sidebar')
    这里是侧边栏
@show

<div class="container">
    @yield('content')
</div>
</body>
</html>