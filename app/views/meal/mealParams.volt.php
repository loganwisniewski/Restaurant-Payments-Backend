<?php foreach ($mealParams as $mealParam) { ?>
    <?php $param = $mealParam->Param ?>
    <li id="item-<?php echo $mealParam->meal_param_id; ?>">
        <span class="glyphicon glyphicon-resize-vertical"></span>
        <b><?php echo $param->param_title; ?></b>
        <span class="glyphicon glyphicon-remove pull-right" onclick="excludeParam($('#item-<?php echo $mealParam->meal_param_id; ?>'))"></span>
    </li>
<?php } ?>