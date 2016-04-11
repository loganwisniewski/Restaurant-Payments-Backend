<div class="workspace-fullwidth">
    {{  form("user/new", "method": "post", "class":"form-group") }}
    <div class="workspace-head">
        <h2>New User<small> - Admin</small></h2>
        <div class="clearfix"></div>
    </div>

    <div class="workspace-body">
        <div class="panel panel-default">
            <div class="panel-heading">
                <span class="pull-right">{{ submit_button("Add") }}</span>
                <div class="clearfix"></div>
            </div>
            <div class="panel-body"><?php $this->flash ?></div>
            <table class="table form-panel">
                <tr>
                    <th>First Name</th>
                    <td>{{ text_field("user_name_first", "class":"form-control") }}</td>
                </tr>
                <tr>
                    <th>Last Name</th>
                    <td>{{ text_field("user_name_last", "class":"form-control") }}</td>
                </tr>
                <tr>
                    <th>Phone</th>
                    <td>{{ text_field("user_phone", "class":"form-control") }}</td>
                </tr>
                <tr>
                    <th>Phone Other</th>
                    <td>{{ text_field("user_phone_other", "class":"form-control") }}</td>
                </tr>
                <tr>
                    <th>Username</th>
                    <td>{{ text_field("user_login", "class":"form-control") }}</td>
                </tr>
                <tr>
                    <th>Password</th>
                    <td>{{ password_field("user_password", "class":"form-control") }}</td>
                </tr>
                <tr>
                    <th>Password Verify</th>
                    <td>{{ password_field("user_password_verify", "class":"form-control") }}</td>
                </tr>
            </table>
            <div class="panel-footer">
                <span class="pull-right">{{ submit_button("Add") }}</span>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    {{ end_form() }}
</div>






