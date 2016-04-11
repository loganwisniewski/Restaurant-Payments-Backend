<div class="workspace layout-sidebar">
    {{  form("meal/new/" ~ menu_id, "method": "post", "class":"form-group") }}
    <div class="workspace-head">
        <h2>New Meal<small> - {{ linkto("menu/edit/" ~ menu_id, menu_name) }}</small></h2>
        <input type="text" class="form-control" name="meal_name" value="" placeholder="Name">
    </div>

    <div class="workspace-sidebar">

    </div>

    {# TODO: Fix HyperLink Dropdown #}
    <div class="workspace-body">
        <div class="panel panel-default">
            <div class="panel-heading">
                <span class="pull-right">{{ submit_button("Add") }}</span>
                <div class="clearfix"></div>
            </div>
            <table class="table form-panel">
                <tr>
                    <th>Price</th>
                    <td>{{ text_field("meal_price")  }}</td>
                </tr>
                <tr>
                    <th>Description</th>
                    <td>{{ text_field("meal_description")  }}</td>
                </tr>
            </table>
            <div class="panel-footer">
                <span class="pull-right">{{ submit_button("Add") }}</span>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    {{ end_form }}
</div>