<?php

function recipe_user_login_function() {


    $output      =  ['status' => 1 ];
    $nonce       = isset($_POST['_wpnonce']) ? $_POST['_wpnonce'] : '' ;

    if( !wp_verify_nonce( $nonce,'recipe_auth') ) {

        $output      =  ['Error' => 'nonce_error' . $_POST['_wpnonce']  ];
        wp_send_json($output);

    }

    if( !isset($_POST['username'],$_POST['pass']) ) {

        $output      =  'empty_fields';
        wp_send_json($output);

    }



    if( empty( $_POST['username'] ) ||  empty( $_POST['pass'] )  ) {

        $output      =  'empty_fields';
        wp_send_json($output);
    }


    $username                 =       sanitize_text_field( $_POST['username'] );
    $pass                     =       sanitize_text_field( $_POST['pass'] );

     $user             =             wp_signon([
             'user_login'         =>        $username,
             'user_password'      =>        $pass,
             'remember'           =>        true
             ], false
     );

     if(is_wp_error($user)){
         wp_send_json($output);
     }

    $output      =  ['status' => 2 ];
     wp_send_json($output);

}

