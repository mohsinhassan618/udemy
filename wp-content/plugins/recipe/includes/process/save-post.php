<?php

function r_save_post_admin ($post_id, $post ,$update) {

    if(!$update ) {
        return;
    }


//    echo '<pre>';
//    print_r($_POST);
//    echo '</pre>';
//    die();

    $recipe_data  = array();
    $recipe_data['ingredients']     =  sanitize_text_field($_POST['r_inputIngredients']);
    $recipe_data['time']            =  sanitize_text_field($_POST['r_inputTime']);
    $recipe_data['utensils']        =  sanitize_text_field($_POST['r_inputUtensils']);
    $recipe_data['level']           =  sanitize_text_field($_POST['r_inputLevel']);
    $recipe_data['meal_type']       =  sanitize_text_field($_POST['r_inputMealType']);


    update_post_meta( $post_id, 'recipe_data' , $recipe_data);


}