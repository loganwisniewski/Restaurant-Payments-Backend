{{  form("restaurant/new", "method": "post") }}
<table class="table table-hover">
    <tr>
        <th colspan="2" class="text-center">New Restaurant</th>
    </tr>
    <tr>
        <td>Name</td>
        <td>{{ text_field("restaurant_name")  }}</td>
    </tr>
    <tr>
        <td>Address</td>
        <td>{{ text_field("restaurant_address")  }}</td>
    </tr>
    <tr>
        <td>City</td>
        <td>{{ text_field("restaurant_city")  }}</td>
    </tr>
    <tr>
        <td>State</td>
        <td>{{ text_field("restaurant_state")  }}</td>
    </tr>
    <tr>
        <td>Zip</td>
        <td>{{ text_field("restaurant_zip")  }}</td>
    </tr>
    <tr>
        <td>Phone</td>
        <td>{{ text_field("restaurant_phone")  }}</td>
    </tr>
    <tr>
        <td>Email</td>
        <td>{{ text_field("restaurant_email")  }}</td>
    </tr>
    <tr>
        <td>Gmt</td>
        <td>{{ text_field("restaurant_gmt")  }}</td>
    </tr>
    <tr>
        <td>Tax</td>
        <td>{{ text_field("restaurant_tax")  }}</td>
    </tr>
    <tr>
        <td></td>
        <td>{{ submit_button("Save") }}</td>
    </tr>
</table>
{{ link_to("restaurant/show", "Cancel") }}
{{ end_form }}