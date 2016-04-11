/**
 * Created by LoganWisniewski on 6/28/15.
 */

/*
    MenuBuilder Functions
 */
$(document).ready(function() {
    $('#editor').wysiwyg();

    $( "#menu" ).sortable({
        connectWith: "#bench",
        helper: "clone",
        placeholder: "placeholder",
        update : function () {
            saveMenu();
        }
    });

    $( "#params" ).sortable({
        connectWith: "#bench",
        helper: "clone",
        placeholder: "placeholder",
        update : function () {
            saveParams();
        }
    });

    $("#category_name").keyup(function (e) {
        if (e.keyCode == 13) {
            $('#category_button').click();
            $('#category_name').val('');
        }
    });

    $('#restaurantSelectize').selectize({
        items: [getCookie("restaurant_id")],
        placeholder: "Search restaurant",
        allowEmptyOption: true,
        sortField: 'text'
    });

    $('#restaurantSelectize').on("change", function () {
        $restaurant_id = $('select.selectized').val();
        if($restaurant_id != ""){
            document.cookie = "restaurant_id=" + $restaurant_id + "; path=/";
            document.location.href="/WebChef/activity/index/"+$restaurant_id;
        }
    });

    $('#indexRestaurant').selectize({
        placeholder: "Search restaurant",
        items: null,
        allowEmptyOption: true,
        sortField: 'text'
    });

    $('#indexRestaurant').on("change", function () {
        $restaurant_id = $('select.selectized').val();
        if($restaurant_id != ""){
            document.cookie = "restaurant_id=" + $restaurant_id + "; path=/";
            document.location.href="/WebChef/activity/index/"+$restaurant_id;
        }
    });

    $("div.selectize-input").on("click", function(event) {
        return false;
    });

    $(window).focus(function() {
        if($('select.selectized').val() != null && getCookie("restaurant_id") != null) {
            var restaurant_local = $('select.selectized').val();
            var restaurant_cookie = getCookie("restaurant_id");

            if (restaurant_local != restaurant_cookie) {
                $.ajax(
                    {
                        // TODO: change to relative URL
                        url: "/WebChef/restaurant/verifyCookie",
                        type: "POST",
                        data: {restaurant_local: restaurant_local, restaurant_cookie: restaurant_cookie},
                        success: function (data, textStatus, jqXHR) {
                            document.getElementById('verifyContent').innerHTML = data;
                        }
                    });
                $('#verifyRestaurant').modal('show');
            }
            console.log("Local: " + restaurant_local + " - Cookie: " + restaurant_cookie);
        }
    });
});

function openSelectize(){
    $('div.selectize-input').click();
}

function verifyExecute($restaurant_id, $redirect){
    document.cookie = "restaurant_id=" + $restaurant_id + "; path=/";
    if($redirect == true){
        document.location.href="/WebChef/restaurant/edit/"+$restaurant_id;
    } else {
        $('#verifyRestaurant').modal('hide');
    }


}

function getCookie(name) {
    var value = "; " + document.cookie;
    var parts = value.split("; " + name + "=");
    if (parts.length == 2) return parts.pop().split(";").shift();
}

function saveMenu(){
    $.ajax(
        {
            // TODO: change to relative URL
            url : "/WebChef/menu/save",
            type: "POST",
            data : {list: $( "#menu" ).sortable('serialize')},
            error: function(jqXHR, textStatus, errorThrown)
            {
                alert("Failed");
            }
        });

}

function saveParams(){
    $.ajax(
        {
            // TODO: change to relative URL
            url : "/WebChef/meal/paramReorder",
            type: "POST",
            data : {list: $( "#params" ).sortable('serialize')},
            error: function(jqXHR, textStatus, errorThrown)
            {
                alert("Failed");
            },
            success: function(data) {
                console.log(data);
            }
        });

}

function includeMeal(meal_id){

    $.ajax(
        {
            // TODO: change to relative URL
            url : "/WebChef/meal/includeMeal",
            type: "POST",
            data : {meal_id: meal_id},
            success:function(data, textStatus, jqXHR)
            {
                $('#menu').append(data);
                $('#search-'+meal_id).remove();
            },
            error: function(jqXHR, textStatus, errorThrown)
            {
                alert("Failed");
            }
        });
}

function includeParam(meal_id, param_id){

    $.ajax(
        {
            // TODO: change to relative URL
            url : "/WebChef/meal/includeParam",
            type: "POST",
            data : {meal_id: meal_id, param_id: param_id},
            success:function(data, textStatus, jqXHR)
            {
                $('#params').append(data);
                $('#search-'+param_id).remove();
                console.log(data);
            },
            error: function(jqXHR, textStatus, errorThrown)
            {
                alert("Failed");
            }
        });
}

function includeCategory(category_name, menu_id){

    $.ajax(
        {
            // TODO: change to relative URL
            url : "/WebChef/meal/includeCategory",
            type: "POST",
            data : {category_name: category_name, menu_id:menu_id},
            success:function(data, textStatus, jqXHR)
            {
                $('#menu').append(data);
            },
            error: function(jqXHR, textStatus, errorThrown)
            {
                alert("Failed");
            }
        });
}

function excludeItem(element){
    var this_id = element.attr("id");
    var item_id = this_id.split("-")[1];
    $.ajax(
        {
            // TODO: change to relative URL
            url : "/WebChef/meal/excludeItem",
            type: "POST",
            data : {item_id: item_id},
            success:function(data, textStatus, jqXHR)
            {
                $('#'+this_id).remove();
            },
            error: function(jqXHR, textStatus, errorThrown)
            {
                alert("Failed");
            }
        });
    e.preventDefault(); //STOP default action
    e.unbind(); //unbind. to stop multiple form submit.
}

function excludeParam(element){
    var this_id = element.attr("id");
    var item_id = this_id.split("-")[1];
    $.ajax(
        {
            // TODO: change to relative URL
            url : "/WebChef/meal/excludeParam",
            type: "POST",
            data : {item_id: item_id},
            success:function(data, textStatus, jqXHR)
            {
                $('#'+this_id).remove();
            },
            error: function(jqXHR, textStatus, errorThrown)
            {
                alert("Failed");
            }
        });
    e.preventDefault(); //STOP default action
    e.unbind(); //unbind. to stop multiple form submit.
}


function change(){
    $.ajax(
        {
            // TODO: change to relative URL
            url : "/WebChef/index/change",
            type: "POST",
            data : {test: "test"},
            success:function(data, textStatus, jqXHR)
            {
                alert(data);
            },
            error: function(jqXHR, textStatus, errorThrown)
            {
                alert("Failed");
            }
        });
    e.preventDefault(); //STOP default action
    e.unbind(); //unbind. to stop multiple form submit.
}