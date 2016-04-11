<div class="text-center">
    <h3>Are you sure you want to delete "{{ menu.menu_name }}"?</h3>
    {{ link_to("menu/deleteConfirm/" ~ restaurant_id ~ "/" ~ menu.menu_id, "Yes", "class":"btn btn-default") }}
    {{ link_to("restaurant/menus/" ~ restaurant_id, "No", "class":"btn btn-default") }}
</div>