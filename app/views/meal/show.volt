<div class="workspace layout-sidebar">

    <div class="workspace-head">
        <h2>All Meals<small> - {{ linkto("menu/edit/"~menu.menu_id ,menu.menu_name) }}</small></h2>
        <button class="btn btn-default">Add Meal</button>
    </div>

    <div class="workspace-body">
        <div class="panel panel-default">
            <div class="panel-heading">
                Meal Name
                <span class="pull-right" id="resultsFor">
                                {{  form("meal/show/" ~ menu.menu_id, "method": "post") }}
                    {% if isPost %}
                        Results for "{{ searchTerm }}"
                    {% endif %}
                    {{ text_field("searchTerm", "style":"margin-left:20px") }}
                    {{ submit_button("Search") }}
                    {{ end_form }}
                </span>
            </div>
            <table class="table table-hover table-list form-panel">
                {% for meal in meals %}
                    <tr>
                        <th>{{ meal.meal_name }}</th>
                        <td>
                            <small>{{ link_to("meal/edit/" ~ meal.meal_id, "Edit", "style":"color: #aaa") }} &nbsp;
                            {{ link_to("meal/delete/" ~ meal.meal_id, "Delete", "style":"color: red") }}</small>
                        </td>
                    </tr>
                {% else %}
                    <tr>
                        <td class="text-center" colspan="3"><i>no results</i></td>
                    </tr>
                {% endfor %}
            </table>
            <div class="panel-footer"> </div>
        </div>
    </div>
</div>