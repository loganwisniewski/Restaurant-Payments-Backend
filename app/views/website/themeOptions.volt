{{  form("website/themeOptionsSave/" ~ website_id, "method": "post") }}


<table class="table table-hover">
    <tr>
        <th colspan="2" class="text-center">Theme Options</th>
    </tr>
    {% for website_meta in website_meta_list %}
    <tr>
        <td>{{ text_field(website_meta.website_meta_id ~ "-key" , "value" : website_meta.website_meta_key )  }}</td>
        <td>{{ text_field(website_meta.website_meta_id ~ "-value", "value" : website_meta.website_meta_value)  }}</td>
        <td>{{ link_to("website/themeOptionsDelete/" ~ website_meta.website_meta_id, "Delete") }}</td>
    </tr>
    {% endfor %}
    <tr id="addOptionRow">
        <td>{{ link_to("website/themeOptionsAdd/" ~ website_id, "Add Theme Option") }}</td>
    </tr>
    <tr>
        <td></td>
        <td>{{ submit_button("Save") }}</td>
    </tr>
</table>


{{ end_form }}

{{ key }}
{{ value }}