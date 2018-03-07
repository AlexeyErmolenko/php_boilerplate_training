@extends('layouts.base')

@section('content.base')
    <div class="page-header m-t-1">
        <h1>@yield('main-title')</h1>
    </div>
    @yield('content')
@stop