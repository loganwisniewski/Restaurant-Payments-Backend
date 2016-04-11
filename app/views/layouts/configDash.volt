<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Phalcon PHP Framework</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
        {{ assets.outputCss() }}
        {{ assets.outputJs() }}
    </head>

    <body>
        <!-- Top Nav -->
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="{{ url('index/index') }}">
                        {% if(show_logo == "true") %}
                            {{ image("img/Header-Logo.png", "style":"z-index: 5") }}
                        {% else %}
                            {{ image("img/Header-Logo.png", "style":"z-index: 5; opacity:0") }}
                        {% endif %}
                    </a>
                </div>


                <!-- Restaurant Selectize -->
                <div class="selectizeWrap navbar-text" id="selectizeWrap" style="z-index: 0 !important;">
                    <select id="restaurantSelectize" class="restaurantSelectize">
                        {% for rest in restaurants %}
                            <option value="{{ rest.restaurant_id }}">{{ rest.restaurant_name }}</option>
                        {% endfor %}
                    </select>
                </div>


                <!-- User Info -->
                <ul class="nav navbar-nav navbar-right">

                    {% if(user) %}
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">{{ user.user_name_first ~ " " ~ user.user_name_last }}<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="{{ url('user/edit/' ~ user.user_id) }}">Settings</a></li>
                                <li><a href="{{ url('session/logout') }}">Sign Out</a></li>
                            </ul>
                        </li>
                    {% else %}
                        <li><a href="{{ url('session/login') }}">Sign In</a></li>
                    {% endif %}
                </ul>
            </div>

        </nav>


        <!-- Side Nav -->
        <div class="page-sidebar">
            <div class="icon">
                {#<div class="dropout">#}
                    {#<ul>#}
                        {#{{ linkto("#", "<li>Number 1</li>") }}#}
                        {#{{ linkto("#", "<li>Number 2</li>") }}#}
                        {#{{ linkto("#", "<li>Number 3</li>") }}#}
                        {#{{ linkto("#", "<li>Number 4</li>") }}#}
                    {#</ul>#}
                {#</div>#}
                {{ linkto("activity/index/"~restaurant_id, image("img/icons/activity.png")) }}
            </div>
            <div class="icon">
                {#<div class="dropout">
                    <ul>
                        {{ linkto("#", "<li>Number 1</li>") }}
                        {{ linkto("#", "<li>Number 2</li>") }}
                        {{ linkto("#", "<li>Number 3</li>") }}
                        {{ linkto("#", "<li>Number 4</li>") }}
                    </ul>
                </div>#}
                {{ linkto("#", image("img/icons/contact.png")) }}
            </div>
            <div class="icon">
                <div class="dropout">
                    <ul>
                        {{ linkto("#", "<li>Number 1</li>") }}
                        {{ linkto("#", "<li>Number 2</li>") }}
                        {{ linkto("#", "<li>Number 3</li>") }}
                        {{ linkto("#", "<li>Number 4</li>") }}
                    </ul>
                </div>
                {{ linkto("restaurant/edit/"~restaurant_id, image("img/icons/restaurant.png")) }}
            </div>
            <div class="icon">
                <div class="dropout">
                    <ul>
                        {% if restaurant.menu_id != null %}
                            {{ linkto("menu/edit/"~restaurant.menu_id, "<li class='menu-tab'>"~ menu_name ~"</li>") }}
                        {% endif %}
                        {{ linkto("restaurant/menus/"~restaurant_id, "<li>Menus</li>") }}
                        {{ linkto("meal/show/"~restaurant.menu_id, "<li>Meals</li>") }}
                        {{ linkto("meal/paramShow/"~restaurant_id, "<li>Meal Options</li>") }}
                    </ul>
                </div>
                {% if restaurant.menu_id == null %}
                    {{ image("img/icons/menu.png") }}
                {% else %}
                    {{ linkto("menu/edit/"~restaurant.menu_id, image("img/icons/menu.png")) }}
                {% endif %}
            </div>
            <div class="icon">
                <div class="dropout">
                    <ul>
                        {% if restaurant.website_id != null %}
                            {{ linkto("website/themeOptions/"~restaurant.website_id, "<li>Theme Options</li>") }}
                        {% endif %}
                            {{ linkto("media/index/"~restaurant.restaurant_id, "<li>Media</li>") }}
                            {{ linkto("#", "<li>Number 3</li>") }}
                            {{ linkto("#", "<li>Number 4</li>") }}

                    </ul>
                </div>
                {{ linkto("website/index/"~restaurant_id, image("img/icons/website.png")) }}
            </div>
            <div class="icon">
                {#<div class="dropout">
                    <ul>
                        {{ linkto("#", "<li>Number 1</li>") }}
                        {{ linkto("#", "<li>Number 2</li>") }}
                        {{ linkto("#", "<li>Number 3</li>") }}
                        {{ linkto("#", "<li>Number 4</li>") }}
                    </ul>
                </div>#}
                {{ linkto("notifications/index/"~restaurant_id, image("img/icons/notifications.png")) }}
            </div>
            <div class="icon">
                {#<div class="dropout">
                    <ul>
                        {{ linkto("#", "<li>Number 1</li>") }}
                        {{ linkto("#", "<li>Number 2</li>") }}
                        {{ linkto("#", "<li>Number 3</li>") }}
                        {{ linkto("#", "<li>Number 4</li>") }}
                    </ul>
                </div>#}
                {{ linkto("payment/index/"~restaurant_id, image("img/icons/payment.png")) }}
            </div>
            <div class="icon">
                {#<div class="dropout">
                    <ul>
                        {{ linkto("#", "<li>Number 1</li>") }}
                        {{ linkto("#", "<li>Number 2</li>") }}
                        {{ linkto("#", "<li>Number 3</li>") }}
                        {{ linkto("#", "<li>Number 4</li>") }}
                    </ul>
                </div>#}
                {{ linkto("other/index/"~restaurant_id, image("img/icons/other.png")) }}
            </div>
        </div>

        <div class="page-body">
            <?php $this->flash->output() ?>
            {{ content() }}
        </div>
    </body>
</html>