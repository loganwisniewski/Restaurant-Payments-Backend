{{  form("website/save/" ~ website.website_id, "method": "post") }}
<table class="table table-hover">
    <tr>
        <th colspan="2" class="text-center">New Website</th>
    </tr>
    <tr>
        <td>Website Name</td>
        <td>{{ text_field("website_name", "value" : website.website_name)  }}</td>
    </tr>
    <tr>
        <td>Status</td>
        <td>{{ text_field("website_status", "value" : website.website_status)  }}</td>
    </tr>
    <tr>
        <td>Template (INT 11)</td>
        <td>{{ text_field("website_template", "value" : website.website_template)  }}</td>
    </tr>
    <tr>
        <td></td>
        <td>{{ submit_button("Save") }}</td>
    </tr>
</table>
{{ link_to("website/show/" ~ restaurant.restaurant_id, "Cancel") }}
{{ end_form }}