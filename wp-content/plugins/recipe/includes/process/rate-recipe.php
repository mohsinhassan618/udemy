<?php


function r_rate_recipe_function (){
    global $wpdb;
    $output           =  array('status'  =>  1);

    $recipe_opts = get_option('r_opts');

    if( !is_user_logged_in() && $recipe_opts['rating_login_required'] == 2 ) {
        wp_send_json($output);
    }



    $post_id          =  absint($_POST['rid']);
    $rating           =  round($_POST['rating'], 1 );
    $user_ip          =  $_SERVER['REMOTE_ADDR'];



    $rating_count           =   $wpdb->get_var(
        "SELECT COUNT(*) FROM `" . $wpdb->prefix . "recipe_ratings`
		WHERE recipe_id='" . $post_id . "' AND user_ip='" . $user_ip . "'"
    );

//    echo "SELECT COUNT(*) FROM `" . $wpdb->prefix . "recipe_ratings`
//		WHERE recipe_id='" . $post_id . "' AND user_ip='" . $user_ip . "'";

        if($rating_count > 0 ){
         wp_send_json($output);
        }

// Insert into database
    $wpdb->insert(
        $wpdb->prefix . "recipe_ratings",
        array(

            'recipe_id'   =>   $post_id,
            'rating'      =>   $rating,
            'user_ip'     =>   $user_ip
        ),

        array( '%d' , '%f' , "%s")

        );

// Update Post Meta
        $recipe_data    = get_post_meta($post_id,'recipe_data', true );
        $recipe_data['rating_count']++;
        $recipe_data['rating'] =  round( $wpdb->get_var(
            "SELECT AVG(`rating`) FROM `" . $wpdb->prefix . "recipe_ratings`
		WHERE recipe_id='" . $post_id . "'"
        ), 1 );

        update_post_meta($post_id, 'recipe_data', $recipe_data );

        do_action("recipe_rated",[
            'post_id'      =>        $post_id,
            'rating'       =>         $rating,
            'user_ip'      =>        $user_ip
            ]);



        

    $output['status']  =  2;
    wp_send_json($output);


}