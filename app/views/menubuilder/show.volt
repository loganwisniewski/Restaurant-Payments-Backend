<script type="text/javascript" src="/WebChef/public/js/javascript.js"></script>
<button class="btn btn-default" onclick="location.href='/WebChef/restaurant/edit/{{ restaurant_id }}'">Back</button>
<h3 class="text-center">{{ menu_info }}</h3>
<div class="sidebar">
    <div class="panel panel-default">
        <div class="panel-heading">Add Category</div>
        <div class="panel-body">
            {{  form("menubuilder/addCategory/"~ menu_id, "method": "post", "name":"category") }}
                <div class="input-group">
                    <input name="category_name" type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button" onclick="document.forms['category'].submit()"><span class="glyphicon glyphicon-plus" style="padding: 2px 0 4px 0"></span> </button>
                    </span>
                </div>
            {{ end_form() }}
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">Meal Search</div>
        <div class="panel-body">
            <!-- Search Bar -->
            {{  form("menubuilder/show", "method": "post", "name":"search") }}
            <div class="input-group">
                <input name="searchTerm" type="text" class="form-control" placeholder="Search for...">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button" onclick="submit()"><span class="glyphicon glyphicon-search" style="padding: 2px 0 4px 0"></span> </button>
                </span>
            </div>
            {{ end_form() }}

            <!-- Result Area -->
            <div class="meal-results">
                <table class="table table-hover">
                    {% for result in results %}
                        <tr>
                            <td id="{{ result.meal_name }}_{{ result.meal_id }}">{{ result.meal_name }}<span id="addMeal" class="glyphicon glyphicon-plus pull-right" style="font-size:12px; margin-top:3px"></span></td>
                        </tr>
                    {% endfor %}
                </table>
            </div>

        </div>
    </div>
</div>



<!-- MenuBuilder -->
<div class="workspace">
    <div class="panel panel-default">
        <div class="panel-heading">
            <span>Menu</span>
            <button class="pull-right" onclick="saveMenu()">Save</button>
            <button class="glyphicon glyphicon-refresh pull-right" onclick="location.href='show'"></button>
        </div>
        <div class="panel-body">
            <ul id="menu" class="sortable-list">
                {% for meal in meals %}
                    <li id="{{ meal.meal_type ~ "_" ~ meal.meal_id }}" {% IF meal.meal_type == "category" %}class="category"{% ENDIF %}>
                        <span class="glyphicon glyphicon-resize-vertical"></span>
                        {{ meal.meal_name }}
                        <span class="glyphicon glyphicon-remove pull-right" onclick="removeMeal()"></span>
                    </li>
                {% endfor %}
            </ul>
        </div>
    </div>
</div>