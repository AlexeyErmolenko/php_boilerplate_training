<!-- Header -->
<header id="page-header" class="header">
    <div class="container">
        <div class="header__inner">
            <div class="logo header__logo">
                <img class="logo__img" src="../assets/img/logo.png">
                <div class="logo__text">{{ config('app.name') }}</div>
            </div>
            <form action="" class="auth auth_open header__auth">
                <a href="#" class="auth__inner" v-on:click.stop.prevent="menuShown = !menuShown">
                    <span class="auth__avatar-wrap">
                        <img src="{{ (Auth::check() ? Auth::user()->photo_url : '') ?? '../assets/img/avatar.png' }}" alt="" class="auth__avatar">
                    </span>
                    <span class="auth__name">{{ Auth::check() ? Auth::user()->full_name : 'Guest' }}</span>
                </a>
                <div class="auth__menu" v-cloak v-show="menuShown">
                    <ul class="auth__list">
                        <li class="auth__item">
                            <a href="{{ route('profile.index') }}" class="auth__link">Account Information</a>
                        <li class="auth__item">
                            <a href="#" class="auth__link">Contact Us</a>
                        <li class="auth__item">
                            <a href="{{ route('logout') }}" class="auth__link">Log Out</a>
                        </li>
                    </ul>
                </div>
            </form>
        </div>
    </div>
</header>
