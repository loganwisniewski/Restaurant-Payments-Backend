<div class="portal-wrap">

    <div class="portal-heading">
        {{ link_to("index/index",image("img/index_logo.png", "class":"portal-logo")) }}
    </div>


    <div class="portal-body">
        <div class="panel panel-default panel-login">
            {{ form('session/login') }}
            <div class="panel-heading"><p class="panel-title">Login</p></div>
            <div class="panel-body">
                <?php $this->flash->output() ?>
                {{ text_field("user_login", "class":"form-control", "placeholder":"Username") }}
                {{ password_field("user_password", "class":"form-control", "placeholder":"Password") }}
            </div>
            <div class="panel-footer">{{ submit_button("Login", "class":"form-control") }}</div>
            {{ end_form }}
        </div>
    </div>
</div>
