{{  form("admin/save", "method": "post") }}


<table class="table table-hover">
    <tr>
        <th colspan="2" class="text-center">Settings</th>
    </tr>
    <tr>
        <td>Show Logo?</td>
        <td>
            {% if(show_logo == "true") %}
                {{ check_field("show_logo", "value":"true", "checked":"")  }}
            {% else %}
                {{ check_field("show_logo", "value":"true")  }}
            {% endif %}
        </td>
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


{{ end_form }}