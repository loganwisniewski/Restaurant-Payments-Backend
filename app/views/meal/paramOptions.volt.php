<?php foreach ($paramOptions as $paramOption) { ?>
    <li id="item-<?php echo $paramOption->param_option_id; ?>">
        <span class="glyphicon glyphicon-resize-vertical"></span>
        <?php echo $paramOption->param_option_name; ?>
        - <small><b>$<?php echo $paramOption->param_option_price; ?></b></small>
        <span class="glyphicon glyphicon-remove pull-right" onclick="excludeItem($('#item-<?php echo $paramOption->param_option_id; ?>'))"></span>
    </li>
<?php } ?>