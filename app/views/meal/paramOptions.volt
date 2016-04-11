{% for paramOption in paramOptions %}
    <li id="item-{{ paramOption.param_option_id }}">
        <span class="glyphicon glyphicon-resize-vertical"></span>
        {{ paramOption.param_option_name }}
        - <small><b>${{ paramOption.param_option_price }}</b></small>
        <span class="glyphicon glyphicon-remove pull-right" onclick="excludeItem($('#item-{{ paramOption.param_option_id }}'))"></span>
    </li>
{% endfor %}