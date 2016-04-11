<table class="table table-hover">
    <tr>
        <th>Restaurant Name</th>
        <th>
            <span class="pull-right" id="resultsFor">
                {{  form("restaurant/show", "method": "post") }}
                {% if isPost %}
                    Results for "{{ searchTerm }}"
                {% endif %}
                {{ text_field("searchTerm", "style":"margin-left:20px") }}
                {{ submit_button("Search") }}
                {{ end_form }}
            </span>
        </th>
    </tr>

    {% for restaurant in restaurants %}
        <tr>
            <td>{{ restaurant.restaurant_name }}</td>
            <td>
                <span class="pull-right" style="margin-right: 50px">
                    {{ link_to("restaurant/edit/" ~ restaurant.restaurant_id, "Dashboard") }} -
                    {{ link_to("restaurant/delete/" ~ restaurant.restaurant_id, "Delete") }}
                </span>
            </td>
        </tr>
    {% else %}
        <tr>
            <td class="text-center" colspan="3"><i>no results</i></td>
        </tr>
    {% endfor %}
</table>
{{ link_to("restaurant/new", "New Restaurant") }}
