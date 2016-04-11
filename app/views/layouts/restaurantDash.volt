<h3 class="text-center">{{ restaurant.restaurant_name }}</h3>
<div class="nav-wrap">
    <div id="dashMenu" class="btn-group" role="group" aria-label="...">
        <button type="button" class="btn btn-default" onclick="window.location.href='#'">Contact</button>
        <button type="button" class="btn btn-default" onclick="window.location.href='/WebChef/restaurant/edit/{{ restaurant.restaurant_id }}'">Restaurant</button>
        <button type="button" class="btn btn-default" onclick="window.location.href='/WebChef/restaurant/menus/{{ restaurant.restaurant_id }}'">Menu</button>
        <button type="button" class="btn btn-default" onclick="window.location.href='#'">Site</button>
        <button type="button" class="btn btn-default" onclick="window.location.href='#'">Notifications</button>
        <button type="button" class="btn btn-default" onclick="window.location.href='#'">Payment</button>
        <button type="button" class="btn btn-default" onclick="window.location.href='#'">Tax</button>
        <button type="button" class="btn btn-default" onclick="window.location.href=''">Other</button>
    </div>
</div>

{{ content() }}