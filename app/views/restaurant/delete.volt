<div class="text-center">
    <h3>Are you sure you want to delete "{{ restaurant.restaurant_name }}"?</h3>
    {{ link_to("restaurant/deleteConfirm/" ~ restaurant.restaurant_id, "Yes", "class":"btn btn-default") }}
    {{ link_to("restaurant/show", "No", "class":"btn btn-default") }}
</div>