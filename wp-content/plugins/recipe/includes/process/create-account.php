<?php

function recipe_create_account_function() {
    $output      =  ['status' => 1 ];
    $nonce       = isset($_POST['_wpnonce']) ? $_POST['_wpnonce'] : '' ;

    if( !wp_verify_nonce( $nonce,'recipe_auth') ) {

        $output      =  ['Error' => 'nonce_error' . empty( $_POST['_wpnonce'] ) ];
        wp_send_json($output);

    }

//    if( !isset( $_POST['username'],$_POST['email'],$_POST['pass'],$_POST['confirm_pass']) ){
//        wp_send_json("some fileds are empty");
//    }


    if( empty( $_POST['username'] ) || empty( $_POST['email'] ) || empty( $_POST['pass'] ) || empty( $_POST['confirm_pass']) ) {

        $output      =  'empty_fields';
        wp_send_json($output);
    }



    $name                     =       sanitize_text_field( $_POST['name'] );
    $username                 =       sanitize_text_field( $_POST['username'] );
    $email                    =       sanitize_text_field( $_POST['email'] );
    $pass                     =       sanitize_text_field( $_POST['pass'] );
    $confirm_pass             =       sanitize_text_field( $_POST['confirm_pass'] );

    if( username_exists($username) || email_exists($email) || !is_email($email) || $pass != $confirm_pass)
    {
        if(username_exists($username))
        {
            $output = "username_exists";
            wp_send_json($output);
        }
        if( email_exists($email))
        {
            $output = "email_exists";
            wp_send_json($output);

        }
        if(!is_email($email))
        {
            $output = "email_invalid";
            wp_send_json($output);

        }
        if($pass != $confirm_pass)
        {
            $output = "confirm_pass";
            wp_send_json($output);
        }

    }

    //wp_create_user() , wp_insert_user()

    $user_id                   =        wp_insert_user([
        'user_login'           =>       $username,
        'user_pass'            =>       $pass,
        'user_email'           =>       $name

    ]);

    if(is_wp_error($user_id)) {
        $output      =  ['Error' => 'no4' ];
        wp_send_json($output);
    }


    $user               =     get_user_by('id',$user_id);
    wp_set_current_user($user_id, $user->user_login );
    wp_set_auth_cookie($user_id,false);
    do_action('wp_login',$user->user_login,$user);


    $output['status']                =       2 ;
    wp_send_json($output);


}