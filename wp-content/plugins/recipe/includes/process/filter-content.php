<?php


function r_filter_recipe_content($content)
{

    if (!is_singular('recipe')) {
        return $content;
    }

    global $post, $wpdb;

    $recipe_tpl_res = wp_remote_get(plugins_url('includes/process/recipe-template.php', RECIPE_PLUGIN_URL));
    $recipe_html = wp_remote_retrieve_body($recipe_tpl_res);
//    $recipe_html = file_get_contents('recipe-template.php',true
    $recipe_data = get_post_meta($post->ID, 'recipe_data', true);
    $origin =     wp_get_post_terms($post->ID,"origin");
    $more_info_url   = get_term_meta($origin[0]->term_id,'r_more_info_url',true);
     //return "<pre>" .print_r($recipe_data) . "</pre>";



    $recipe_html = str_replace('INGREDIENTS_PH', $recipe_data['ingredients'], $recipe_html);
    $recipe_html = str_replace('COOKING_TIME_PH', $recipe_data['time'], $recipe_html);
    $recipe_html = str_replace('UTENSILS_PH', $recipe_data['utensils'], $recipe_html);
    $recipe_html = str_replace('LEVEL_PH', $recipe_data['level'], $recipe_html);
    $recipe_html = str_replace('TYPE_PH', $recipe_data['meal_type'], $recipe_html);

    $recipe_html = str_replace('INGREDIENTS_I18N', __('Ingredients', 'recipe'), $recipe_html);
    $recipe_html = str_replace('COOKING_TIME_I18N', __('Cooking Time', 'recipe'), $recipe_html);
    $recipe_html = str_replace('UTENSILS_I18N', __('Utensils', 'recipe'), $recipe_html);
    $recipe_html = str_replace('LEVEL_I18N', __('Level', 'recipe'), $recipe_html);
    $recipe_html = str_replace('TYPE_I18N', __('Meal Type', 'recipe'), $recipe_html);
    $recipe_html = str_replace('RATE_I18N', __('Rating', 'recipe'), $recipe_html);
    $recipe_html = str_replace('RECIPE_ID', $post->ID, $recipe_html);
    $recipe_html = str_replace('RECIPE_RATING', isset($recipe_data['rating']) ? $recipe_data['rating'] : "" , $recipe_html);
    $recipe_html = str_replace('ORIGIN_I18N:', __("Origin:","recipe") , $recipe_html);
    $recipe_html = str_replace('ORIGIN_PH',isset($origin[0]) ? $origin[0]->name : "None", $recipe_html);
    if(!empty($more_info_url)){
        $recipe_html = str_replace(
            'MORE_INFO_URL_PH',
            '<a href="'. $more_info_url . '">More Info </a>',
            $recipe_html

        );
    } else{
        $recipe_html = str_replace(
            'MORE_INFO_URL_PH',
            '',
            $recipe_html

        );
    }


    $user_ip = $_SERVER['REMOTE_ADDR'];


    $rating_count = $wpdb->get_var($wpdb->prepare(
        "SELECT COUNT(*) FROM `" . $wpdb->prefix . "recipe_ratings`
		WHERE recipe_id=%d AND user_ip=%s",
        $post->ID, $user_ip
    ));


    if ($rating_count > 0) {
        $recipe_html = str_replace('READONLY_PLACEHOLDER', 'data-rateit-readonly="true"', $recipe_html);

    } else {
        $recipe_html = str_replace('READONLY_PLACEHOLDER', '', $recipe_html);
    }


    return $recipe_html . $content;

}