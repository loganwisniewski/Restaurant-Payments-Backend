<?php foreach ($items as $item) { ?>
    <li id="item-<?php echo $item->meal_id; ?>" <?php if ($item->meal_type == 'category') { ?>class="category"<?php } ?>>
        <span class="glyphicon glyphicon-resize-vertical"></span>
        <?php echo $item->meal_name; ?>
        <?php if ($item->meal_type == 'meal') { ?>
        - <small><b>$<?php echo $item->meal_price; ?></b></small>
        <?php } ?>
        <span class="glyphicon glyphicon-remove pull-right" onclick="excludeItem($('#item-<?php echo $item->meal_id; ?>'))"></span>
    </li>
<?php } ?>