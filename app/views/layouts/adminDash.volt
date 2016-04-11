<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Phalcon PHP Framework</title>
        {{ assets.outputCss() }}
        {{ assets.outputJs() }}
    </head>

    <body>
        <!-- Top Nav -->
        <nav class="navbar navbar-inverse">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">
                        {% if(show_logo == "true") %}
                            {{ link_to("index/index", image("img/Header-Logo.png", "style":"z-index: 5")) }}
                        {% else %}
                            {{ link_to("index/index", image("img/Header-Logo.png", "style":"z-index: 5; opacity:0;")) }}
                        {% endif %}
                    </a>
                </div>


                <!-- Restaurant Selectize -->
                <div class="navbar-title">
                    <span>Admin</span>
                </div>


                <!-- User Info -->
                <ul class="nav navbar-nav navbar-right">

                    {% if(user) %}
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">{{ user.user_name_first ~ " " ~ user.user_name_last }}<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Settings</a></li>
                                <li><a href="{{ url('session/logout') }}">Sign Out</a></li>
                            </ul>
                        </li>
                    {% else %}
                        <li><a href="{{ url('session/login') }}">Sign In</a></li>
                    {% endif %}
                </ul>

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
                {{ image("img/icons/blank.png") }}
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
                {{ image("img/icons/blank.png") }}
            </div>
            <div class="icon">
                <div class="dropout">
                    {#<ul>
                        {{ linkto("restaurant/edit/"~restaurant_id, "<li>General</li>") }}
                    </ul>#}
                </div>
                {{ image("img/icons/blank.png") }}
            </div>
            <div class="icon">
                <div class="dropout">
                    <ul>
                        {#
                        {{ linkto("restaurant/menus/"~restaurant_id, "<li>All Menus</li>") }}
                        {{ linkto("menu/new/"~restaurant_id, "<li>Add Menu</li>") }}
                        {{ linkto("meal/show/"~restaurant.menu_id, "<li>All Meals</li>") }}
                        {{ linkto("meal/new/"~restaurant.menu_id, "<li>Add Meal</li>") }}#}
                    </ul>
                </div>
                {% if restaurant.menu_id == null %}
                    {{ image("img/icons/blank.png") }}
                {% else %}
                    {{ image("img/icons/blank.png") }}
                {% endif %}
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
                {{ image("img/icons/blank.png") }}
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
                {{ image("img/icons/blank.png") }}
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
                {{ image("img/icons/blank.png") }}
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
                {{ image("img/icons/blank.png") }}
            </div>
        </div>

        <div class="page-body">
            {{ content() }}
        </div>
    </body>
</html>