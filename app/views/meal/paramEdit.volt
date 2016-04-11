<div class="workspace layout-sidebar">
    {{  form("meal/paramSave/" ~ param.param_id, "method": "post", "class":"form-group") }}
    <div class="workspace-head">
        <h2>Edit Meal Option<small> - {{ linkto("meal/paramShow/"~restaurant_id, "Meal Options") }}</small></h2>
        <button class="btn btn-default">Add Meal</button>
        <input type="text" class="form-control" name="param_title" value="{{ param.param_title }}" placeholder="Name">
    </div>

    <div class="workspace-sidebar">

    </div>

    {# TODO: Fix HyperLink Dropdown #}
    <div class="workspace-body">
        <div class="panel panel-default">
            <div class="panel-heading">Param Name</div>
            <table class="table table-hover form-panel">
                <tr>
                    <th>Slug</th>
                    <td>{{ text_field("param_slug", "value": param.param_slug)  }}</td>
                </tr>
                <tr>
                    <th>Description</th>
                    <td>{{ text_field("param_description", "value": param.param_description)  }}</td>
                </tr>
                <tr>
                    <th>Option Type</th>
                    <td>{{ select('param_type', ['radio':"Radio Buttons", 'check':"Check Boxes", 'dropdown':"Dropdrown"], 'value': param.param_type,
                        'useEmpty': true, 'emptyText': 'Select option type...') }}</td>
                </tr>
                <tr>
                    <th>Required</th>
                    <td>{{ check_field("param_required", "checked":param.param_required)  }}</td>
                </tr>
            </table>
            <div class="panel-footer">{{ submit_button("Save") }}</div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <span>Options</span>
                <button class="pull-right" onclick="location.href='/WebChef/restaurant/menus/{{ restaurant_id }}'">Done</button>
            </div>
            <div class="panel-body">
                <ul id="menu" class="sortable-list">
                    {{ paramOptions }}
                </ul>
            </div>
        </div>
    </div>
    {{ end_form }}
</div>