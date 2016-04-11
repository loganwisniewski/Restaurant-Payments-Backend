<div class="workspace layout-fullwidth">

    {{  form("menu/new/" ~ restaurant_id, "method": "post") }}

    <div class="workspace-head">
        <h2>New Menu<small> - {{ linkto("restaurant/edit/"~ restaurant_id, restaurant_name) }}</small></h2>
        <input type="text" class="form-control" placeholder="Name" name="menu_name">
    </div>

    <div class="workspace-body">
        {{ submit_button("Save") }}
    </div>
</div>
{{ end_form }}