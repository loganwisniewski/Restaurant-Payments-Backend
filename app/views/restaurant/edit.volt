{{  form("restaurant/save/" ~ restaurant.restaurant_id, "method": "post") }}
<div class="workspace layout-sidebar">

    <div class="workspace-head">
        <h2>Restaurant Settings</h2>
    </div>

    <div class="workspace-sidebar">
        <!-- Panel 1 -->
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Status<div class="status {% if restaurant.restaurant_status == "active" %}status-good {% elseif restaurant.restaurant_status == "deactive" %}status-bad{% endif %}"></div></h3>
            </div>
            <div class="panel-body">
                {{ selectStatic(["restaurant_status", ["active":"Active", "deactive":"Deactive"], "class":"form-control", "value":restaurant.restaurant_status]) }}
            </div>
        </div>
    </div>

    {# TODO: Fix HyperLink Dropdown #}
    <div class="workspace-body">

        <div class="panel panel-default">
            <div class="panel-heading">{{ submit_button("Save", "class":"pull-right btn-save") }}<div class="clearfix"></div></div>
            <table class="table form-panel">
                <tr>
                    <th>Name</th>
                    <td>{{ text_field("restaurant_name", "value": restaurant.restaurant_name)  }}</td>
                </tr>
                <tr>
                    <th>Address</th>
                    <td>{{ text_field("restaurant_address", "value": restaurant.restaurant_address)  }}</td>
                </tr>
                <tr>
                    <th>City</th>
                    <td>{{ text_field("restaurant_city", "value": restaurant.restaurant_city)  }}</td>
                </tr>
                <tr>
                    <th>State</th>
                    {% set states = [
                    '':"Choose a State...",
                    'AL':"Alabama",
                    'AK':"Alaska",
                    'AZ':"Arizona",
                    'AR':"Arkansas",
                    'CA':"California",
                    'CO':"Colorado",
                    'CT':"Connecticut",
                    'DE':"Delaware",
                    'DC':"District Of Columbia",
                    'FL':"Florida",
                    'GA':"Georgia",
                    'HI':"Hawaii",
                    'ID':"Idaho",
                    'IL':"Illinois",
                    'IN':"Indiana",
                    'IA':"Iowa",
                    'KS':"Kansas",
                    'KY':"Kentucky",
                    'LA':"Louisiana",
                    'ME':"Maine",
                    'MD':"Maryland",
                    'MA':"Massachusetts",
                    'MI':"Michigan",
                    'MN':"Minnesota",
                    'MS':"Mississippi",
                    'MO':"Missouri",
                    'MT':"Montana",
                    'NE':"Nebraska",
                    'NV':"Nevada",
                    'NH':"New Hampshire",
                    'NJ':"New Jersey",
                    'NM':"New Mexico",
                    'NY':"New York",
                    'NC':"North Carolina",
                    'ND':"North Dakota",
                    'OH':"Ohio",
                    'OK':"Oklahoma",
                    'OR':"Oregon",
                    'PA':"Pennsylvania",
                    'RI':"Rhode Island",
                    'SC':"South Carolina",
                    'SD':"South Dakota",
                    'TN':"Tennessee",
                    'TX':"Texas",
                    'UT':"Utah",
                    'VT':"Vermont",
                    'VA':"Virginia",
                    'WA':"Washington",
                    'WV':"West Virginia",
                    'WI':"Wisconsin",
                    'WY':"Wyoming"] %}
                    <td>{{ selectStatic([
                        "restaurant_state",
                        states,
                        "class":"form-control",
                        "style":"width:161px",
                        "value":restaurant.restaurant_state
                        ])}}</td>
                </tr>
                <tr>
                    <th>Zip</th>
                    <td>{{ text_field("restaurant_zip", "value": restaurant.restaurant_zip)  }}</td>
                </tr>
                <tr>
                    <th>Phone</th>
                    <td>{{ text_field("restaurant_phone", "value": restaurant.restaurant_phone)  }}</td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td>{{ text_field("restaurant_email", "value": restaurant.restaurant_email)  }}</td>
                </tr>
                <tr>
                    <th>Gmt</th>
                    <td>{{ text_field("restaurant_gmt", "value": restaurant.restaurant_gmt)  }}</td>
                </tr>
                <tr>
                    <th>Tax</th>
                    <td>{{ text_field("restaurant_tax", "value": restaurant.restaurant_tax)  }}</td>
                </tr>
                <tr>
                    <th>Cuisine</th>
                    {% set cuisines = [
                    '':"Choose a Cuisine...",
                    'American':"American",
                    'Breakfast':"Breakfast",
                    'Cafe':"Cafe",
                    'Chinese':"Chinese",
                    'Dessert':"Dessert",
                    'Fast Food':"Fast Food",
                    'French':"French",
                    'Indian':"Indian",
                    'Italian':"Italian",
                    'Japanese':"Japanese",
                    'Mexican':"Mexican",
                    'Sandwiches':"Sandwiches",
                    'Seafood':"Seafood",
                    'Thai':"Thai",
                    'Vegetarian':"Vegetarian"] %}
                    <td>{{ selectStatic([
                        "restaurant_cuisine",
                        cuisines,
                        "class":"form-control",
                        "style":"width:161px",
                        "value":restaurant.restaurant_cuisine
                        ])}}</td>
                </tr>
                <tr>
                    <th>Account</th>
                    <td>{{ text_field("account_id", "value": restaurant.account_id)  }}</td>
                </tr>
                <tr>
                    <th>Menu</th>
                    <td>{{ selectStatic(["menu_id", menus, "class":"form-control", "style":"width:161px"])}}</td>
                </tr>
            </table>

            <div class="panel-footer">{{ submit_button("Save", "class":"pull-right btn-save") }}<div class="clearfix"></div></div>

        </div>
    </div>
</div>
{{ end_form }}