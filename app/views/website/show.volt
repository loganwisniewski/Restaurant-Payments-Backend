<div class="workspace layout-fullwidth">

    <div class="workspace-head">
        <h2>All Websites</h2>
    </div>


    <div class="workspace-body">

        <div class="panel panel-default">
            <div class="panel-heading">Menu Name</div>
            <table class="table table-hover table-list form-panel">
                {% for website in websites %}
                    <tr>
                        <th>{{ website.website_name }}</th>
                        <td>
                            <small>{{ link_to("website/edit/" ~ website.website_id, "Edit", "style":"color:#aaa") }} &nbsp;
                                {{ link_to("website/themeOptions/" ~ website.website_id, "Theme Options", "style":"color:rgb(66, 139, 202)") }} &nbsp;
                                {{ link_to("website/delete/" ~ website.website_id, "Delete", "style":"color:red") }}
                            </small>
                        </td>
                    </tr>
                {% else %}
                    <tr>
                        <td class="text-center" colspan="2"><i>no results</i></td>
                    </tr>
                {% endfor %}
            </table>
            <div class="panel-footer">{{ link_to("website/new/" ~ restaurant.restaurant_id, "New Website") }}</div>

        </div>

    </div>
</div>
