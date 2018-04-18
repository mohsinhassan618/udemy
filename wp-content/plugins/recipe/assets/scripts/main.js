jQuery(function($){

    $("#recipe_rating").bind("rated", function(){
        $(this).rateit('readonly', true);

        var form                  =  {
            action:                 "r_rate_recipe", //https://codex.wordpress.org/Plugin_API/Action_Reference/wp_ajax_(action)
            rid:                     $(this).data('rid'), // get data attached with data-rid html attribute
            rating:                  $(this).rateit('value')
        };


        //get an object recipe_obj that is given by wp_localize_script function in enqueue file
        $.post( recipe_obj.ajax_url , form , function(data){


        } );
    });


    var featured_frame = wp.media({
            title:             'Select or Upload Media',
            button:             {
                text:           'Use this media'
            },
        multiple:           false
        });




    $("#recipe-img-upload-btn").on('click',function (e) {
        e.preventDefault();
        featured_frame.open();
    });

    featured_frame.on('select',function() {
        var attachment    =     featured_frame.state().get('selection').first().toJSON();
        $("#recipe-img-preview").attr('src',attachment.url);
        $("#r_inputImgID").val(attachment.id);

    });

    $("#recipe-form").on("submit", function(e) {
        e.preventDefault();

        $(this).hide();
        $('#recipe-status').html('<div class="alert alert-info text-center">please wait!</div>');

        //tinymce.get('recipecontenteditor').getContent(

        var form    =    {

            action:         "r_submit_user_recipe",
            // content:         tinymce.activeEditor.getContent(),
            content:        $('#recipecontenteditor').val(),
            title:          $('#r_inputTitle').val(),
            ingredients:    $('#r_inputIngredients').val(),
            time:           $('#r_inputTime').val(),
            utensils:       $('#r_inputUtensils').val(),
            level:          $('#r_inputLevel').val(),
            meal_type:      $('#r_inputMealType').val(),
            attachment_id:  $("#r_inputImgID").val(),
            video_url:      $("#r_inputVideoURL").val()

        };

        $.post(recipe_obj.ajax_url,form,null,"json").always(function(data){
            if(data.status == 2 ) {

                $("#recipe-status").html('<div class="alert alert-success"> Recipe submited successfully!</div>');


            } else {

                $("#recipe-status").html('<div class="alert alert-danger">Unable to submit recipe. Please fill in all fields</div>');
                $("#recipe-form").show();


            }

        })



    });



    $("#register-form").on('submit', function (e) {
        e.preventDefault();

        $('#register-status').html(
            '<div class="alert alert-info">Please wait while your account is being created </div>'
        );
        $(this).hide();


        var form               = {
            action:                "recipe_create_account",
            name:                  $('#register-form-name').val(),
            username:              $('#register-form-username').val(),
            email:                 $('#register-form-email').val(),
            pass:                  $('#register-form-password').val(),
            confirm_pass:          $('#register-form-repassword').val(),
            _wpnonce:              $('#_wpnonce').val()

        };

        console.log(form);

        $.post(recipe_obj.ajax_url,form).always(function(response){

            if(response.status == 2) {
                $('#register-status').html(
                    '<div class="alert alert-success">Account Created! </div>'
                );
                location.href         =   recipe_obj.home_url;
            }
            else
            {
                $('#register-status').html(
                    '<div class="alert alert-danger">' +
                        'Unable to create an account. Please try again with a different username/email.' +

                    '</div>'
                );
                $('#register-form').show();

            }

        });



    });


    $("#login-form").on('submit', function (e) {
        e.preventDefault();

        $('#login-status').html(
            '<div class="alert alert-info">Please wait while we log you in </div>'
        );
        $(this).hide();


        var form               = {
            action:                "recipe_user_login",
            username:              $('#login-form-username').val(),
            pass:                  $('#login-form-password').val(),
            _wpnonce:              $('#_wpnonce').val()

        };

        console.log(form);

        $.post(recipe_obj.ajax_url,form).always(function(response){

            if(response.status == 2) {
                $('#login-status').html(
                    '<div class="alert alert-success">Success! </div>'
                );
                location.href         =   recipe_obj.home_url;
            }
            else
            {
                $('#login-status').html(
                    '<div class="alert alert-danger">' +
                    'Unable to login. Please try again with a different username/email.' +

                    '</div>'
                );
                $('#login-form').show();

            }

        });



    });





});