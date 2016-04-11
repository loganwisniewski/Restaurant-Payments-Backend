<div class="panel panel-default">
    <div class="panel-heading"></div>
    <div class="panel-body">
        <table>
            {% for user in users %}
                <tr>
                    <th>{{ user.user_name_first }}</th>
                    <td>
                        <small>{{ link_to("user/edit/"~user.user_id, "Edit User", "style":"color:#aaa") }} &nbsp;
                            {{ link_to("user/delete/" ~ user.user_id, "Delete", "style":"color:red") }}</small>
                    </td>
                </tr>
            {% endfor %}
        </table>
    </div>
    <div class="panel-footer"></div>
</div>