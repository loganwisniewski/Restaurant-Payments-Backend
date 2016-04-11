<div class="modal-header">
    <h4 class="modal-title">Choose Which Restaurant</h4>
</div>
<div id="verifyRestaurantBody" class="modal-body">
    <p style="font-size: 40px; font-weight: 100; margin-bottom: -10px">Continue with...</p><br />
    <table align="center">
        <tr>
            <td><small>Keep</small></td>
            <td></td>
            <td><small>Switch to</small></td>
        </tr>
        <tr>
            <td><button class="btn btn-default" onclick="verifyExecute(<?php echo $local->restaurant_id; ?>, false)"><?php echo $local->restaurant_name; ?></button></td>
            <td>&nbsp; or &nbsp;</td>
            <td><button class="btn btn-default" onclick="verifyExecute(<?php echo $cookie->restaurant_id; ?>, true)"><?php echo $cookie->restaurant_name; ?></button></td>
        </tr>
    </table><br />
    <small style="color:red">Any unsaved work will be lost!</small>
</div>
<div class="modal-footer">

</div>