{% for mealParam in mealParams %}
    <?php $param = $mealParam->Param ?>
    <li id="item-{{ mealParam.meal_param_id }}">
        <span class="glyphicon glyphicon-resize-vertical"></span>
        <b>{{ param.param_title }}</b>
        <span class="glyphicon glyphicon-remove pull-right" onclick="excludeParam($('#item-{{ mealParam.meal_param_id }}'))"></span>
    </li>
{% endfor %}