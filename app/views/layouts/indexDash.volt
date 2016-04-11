<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
    <title>Phalcon PHP Framework</title>
    {{ assets.outputCss() }}
    {{ assets.outputJs() }}
</head>

<body>
<div class="index-wrap">
    {% if(user) %}
        <span class="index-user-info">{{ user.user_name_first ~ " " ~ user.user_name_last }}</span>
    {% else %}
        <span class="index-user-info"><a href="{{ url('session/login') }}">Sign In</a></span>
    {% endif %}
    <div class="index-header">
        {% if(show_logo == "true") %}
            {{ image("img/index_logo.png", "class":"portal-logo") }}
        {% else %}
            {{ image("img/index_logo.png", "class":"portal-logo", "style":"opacity:0") }}
        {% endif %}
    </div>
    <div class="index-body">{{ content() }}</div>
    <div class="index-footer"><small>Web Chef | All Rights Reserved &copy; 2015</small></div>
</div>
</body>
</html>