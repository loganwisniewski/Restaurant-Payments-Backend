<div class="row">
    <div class="col-md-4">
        <div class="panel panel-default" onclick="openSelectize()">
            <div class="panel-body">
                <h2>Restaurant Settings</h2>
                <!-- Restaurant Selectize -->
                <div class="selectizeWrap" id="selectizeWrap" style="z-index: 100 !important;">
                    <select id="indexRestaurant" class="restaurantSelectize">
                        {% for rest in restaurants %}
                            <option value="{{ rest.restaurant_id }}">{{ rest.restaurant_name }}</option>
                        {% endfor %}
                    </select>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="panel panel-default" onclick="location.href='{{ url('admin/index') }}'">
            <div class="panel-body">
                <h2>Administrator Settings</h2>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="panel panel-default last" onclick="location.href='{{ url('analytics/index') }}'">
            <div class="panel-body">
                <h2>Live<br /> Analytics</h2>
            </div>
        </div>
    </div>

</div>


<div class="row">
    {% if(user) %}
        <div class="col-md-6">
            <div class="panel panel-default last" onclick="location.href='{{ url('user/edit/' ~ user.user_id) }}'">
                <div class="panel-body">
                    <h2>Settings</h2>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="panel panel-default last" onclick="location.href='{{ url('session/logout') }}'">
                <div class="panel-body">
                    <h2>Sign Out</h2>
                </div>
            </div>
        </div>
    {% endif %}

</div>