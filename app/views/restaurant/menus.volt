<div class="workspace layout-fullwidth">

    <div class="workspace-head">
        <h2>All Menus</h2>
    </div>


    <div class="workspace-body">

        <div class="panel panel-default">
            <div class="panel-heading">Menu Name</div>
            <table class="table table-hover table-list form-panel">
                {% for menu in menus %}
                    <tr>
                        <th>{{ menu.menu_name }}</th>
                        <td>
                            <small>{{ link_to("meal/show/"~menu.menu_id, "Edit Meals", "style":"color:#aaa") }} &nbsp;
                            {{ link_to("menu/edit/"~menu.menu_id, "Build Menu", "style":"color:rgb(66, 139, 202)") }} &nbsp;
                            {{ link_to("menu/delete/" ~ menu.menu_id, "Delete", "style":"color:red") }}</small>
                        </td>
                    </tr>
                {% else %}
                    <tr>
                        <td class="text-center" colspan="2"><i>no results</i></td>
                    </tr>
                {% endfor %}
            </table>
            <div class="panel-footer">{{ link_to("menu/new/" ~ restaurant.restaurant_id, "New Menu") }}</div>

        </div>

    </div>
</div>
