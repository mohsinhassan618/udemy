<?php
/**
 * Plugin Name: Recipe E-mail Rating
 * Description: This plugin extends the recipe plugin.
 */


add_action('recipe_rated',function ( $arr ){

    $post                =     get_post( $arr['post_id']);
    $user_email          =     get_the_author_meta('user_email',$post->post_author);
    $subject             =     'your recipe has received a new rating';
    $message             =     'Your Recipe ' . $post->post_title . ' has received a new rating of ' . $arr['rating'];

    wp_mail($user_email,$subject,$message);

});