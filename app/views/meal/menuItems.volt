{% for item in items %}
    <li id="item-{{ item.meal_id }}" {% IF item.meal_type == "category" %}class="category"{% ENDIF %}>
        <span class="glyphicon glyphicon-resize-vertical"></span>
        {{ item.meal_name }}
        {% IF item.meal_type == "meal" %}
        - <small><b>${{ item.meal_price }}</b></small>
        {% ENDIF %}
        <span class="glyphicon glyphicon-remove pull-right" onclick="excludeItem($('#item-{{ item.meal_id }}'))"></span>
    </li>
{% endfor %}