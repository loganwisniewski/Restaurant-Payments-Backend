<div class="workspace layout-sidebar">
    {{  form("meal/save/" ~ meal.meal_id, "method": "post", "class":"form-group") }}
    <div class="workspace-head">
        <h2>Edit Meal<small> - {{ linkto("menu/edit/"~menu.menu_id, menu.menu_name) }}</small></h2>
        <button class="btn btn-default">Add Meal</button>
        <input type="text" class="form-control" name="meal_name" value="{{ meal.meal_name }}" placeholder="Name">
    </div>

    <div class="workspace-sidebar">

    </div>

    {# TODO: Fix HyperLink Dropdown #}
    <div class="workspace-body">
        <div class="panel panel-default">
            <div class="panel-heading">Meal Name</div>
            <table class="table table-hover form-panel">
                <tr>
                    <th>Price</th>
                    <td>{{ text_field("meal_price", "value": meal.meal_price)  }}</td>
                </tr>
                <tr>
                    <th>Description</th>
                    <td>{{ text_field("meal_description", "value": meal.meal_description)  }}</td>
                </tr>
            </table>
            <div class="panel-footer">{{ submit_button("Save") }}</div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <span>Options</span>
                <button class="pull-right" onclick="location.href='/WebChef/restaurant/menus/{{ restaurant_id }}'">Done</button>
            </div>
            <div class="panel-body">
                <ul id="params" class="sortable-list">
                    {{ mealParams }}
                </ul>
            </div>
        </div>
        {{ end_form }}

        <div class="panel panel-default">
            <div class="panel-heading">Param Search</div>
            <div class="panel-body">
                <!-- Result Area -->
                <div class="meal-results">
                    <table class="table table-hover">
                        {% for result in results %}
                            <tr>
                                <td id="search-{{ result.param_id }}">{{ result.param_title }}<span id="addOption" class="glyphicon glyphicon-plus pull-right" style="font-size:12px; margin-top:3px" onclick="includeParam({{ meal.meal_id }}, {{ result.param_id }})"></span></td>
                            </tr>
                        {% endfor %}
                    </table>
                </div>
            </div>
        </div>

    </div>


</div>