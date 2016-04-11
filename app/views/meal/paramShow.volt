<div class="workspace layout-sidebar">

    <div class="workspace-head">
        <h2>All Meal Options<small> - {{ linkto("meal/show/"~restaurant.menu_id , menu_name ~ " Meals") }}</small></h2>
        <button class="btn btn-default">Add Param</button>
    </div>

    <div class="workspace-body">
        <div class="panel panel-default">
            <div class="panel-heading">
                Meal Name
                <span class="pull-right" id="resultsFor">
                                {{  form("meal/paramSave/" ~ param.param_id, "method": "post") }}
                    {% if isPost %}
                        Results for "{{ searchTerm }}"
                    {% endif %}
                    {{ text_field("searchTerm", "style":"margin-left:20px") }}
                    {{ submit_button("Search") }}
                    {{ end_form }}
                </span>
            </div>
            <table class="table table-hover table-list form-panel">
                {% for param in params %}
                    <tr>
                        <th>{{ param.param_title }}</th>
                        <td>
                            <small>{{ link_to("meal/paramEdit/" ~ param.param_id, "Edit", "style":"color: #aaa") }} &nbsp;
                                {{ link_to("meal/paramDelete/" ~ param.param_id, "Delete", "style":"color: red") }}</small>
                        </td>
                    </tr>
                {% else %}
                    <tr>
                        <td class="text-center" colspan="3"><i>no results</i></td>
                    </tr>
                {% endfor %}
            </table>
            <div class="panel-footer"> </div>
        </div>
    </div>
</div>