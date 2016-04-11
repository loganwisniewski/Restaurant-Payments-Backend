<div class="text-center">
    <h3>Are you sure you want to delete "{{ website.website_name }}"?</h3>
    {{ link_to("website/deleteConfirm/" ~ restaurant_id ~ "/" ~ website.website_id, "Yes", "class":"btn btn-default") }}
    {{ link_to("website/show/" ~ restaurant_id, "No", "class":"btn btn-default") }}
</div>