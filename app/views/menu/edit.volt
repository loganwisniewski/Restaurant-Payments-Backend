<div class="workspace layout-sidebar">

    <div class="workspace-head">
        <h2>Edit Menu</h2>
        {{ linkto("menu/new/"~restaurant_id, "<button class='btn btn-default'>Add Menu</button>") }}
        {{  form("menu/edit/"~menu_id, "method": "post", "name":"postData") }}
            <input type="text" name="menu_name" class="form-control" value="{{ menu_name }}">
        {{ end_form() }}
    </div>

    <div class="workspace-sidebar">

        <div class="panel panel-default">
            <div class="panel-heading">Utilities</div>
            <div class="panel-body">
                {{ linkto("meal/new/"~menu_id, "<button class='form-control'>Add Meal</button>") }}
                {{ linkto("meal/show/"~menu_id, "<button class='form-control'>Edit Meals</button>") }}
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">Add Category</div>
            <div class="panel-body">
                <div class="input-group">
                    <input id="category_name" type="text" class="form-control" placeholder="Category Name" autocomplete="off">
                        <span class="input-group-btn">
                            <button id="category_button" class="btn btn-default" type="button" onclick="includeCategory($('#category_name').val(), {{ menu_id }})"><span class="glyphicon glyphicon-plus" style="padding: 2px 0 4px 0"></span></button>
                        </span>
                </div>
            </div>
        </div>


        <div class="panel panel-default">
            <div class="panel-heading">Meal Search</div>
            <div class="panel-body">
                <!-- Search Bar -->
                {{  form("menu/edit/"~menu_id, "method": "post", "name":"search") }}
                <div class="input-group">
                    <input name="searchTerm" type="text" class="form-control" placeholder="Search meals..." autocomplete="off">
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
                                <td id="search-{{ result.meal_id }}">{{ result.meal_name }}<span id="addMeal" class="glyphicon glyphicon-plus pull-right" style="font-size:12px; margin-top:3px" onclick="includeMeal({{ result.meal_id }})"></span></td>
                            </tr>
                        {% endfor %}
                    </table>
                </div>
            </div>
        </div>

    </div>

    <div class="workspace-body">


        <!-- MenuBuilder -->
        <div class="menu-workspace">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <span>Menu</span>
                    <button class="pull-right" onclick="location.href='/WebChef/restaurant/menus/{{ restaurant_id }}'">Done</button>
                </div>
                <div class="panel-body">
                    <ul id="menu" class="sortable-list">
                        {{ menuItems }}
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>