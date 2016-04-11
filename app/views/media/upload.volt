{{  form("media/uploadExecute/"~restaurant.restaurant_id, "method": "post",  "enctype": "multipart/form-data") }}
<table class="table table-hover">
    <tr>
        <th colspan="2" class="text-center">Upload Media</th>
    </tr>
    <tr>
        <td>Choose File</td>
        <td>{{ file_field("uploadFile")  }}</td>
    </tr>
    <tr>
        <td></td>
        <td>{{ submit_button("Upload") }}</td>
    </tr>
</table>
{{ link_to("restaurant/show/"~restaurant.restaurant_id, "Cancel") }}
{{ end_form }}