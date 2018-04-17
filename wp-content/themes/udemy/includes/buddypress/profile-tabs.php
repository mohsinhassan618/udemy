<?php

if(!function_exists('ju_plugin_activated_check')){
    function ju_plugin_activated_check($plugin_file_name){
        require_once (ABSPATH . '/wp-admin/includes/plugin.php');
        return is_plugin_active($plugin_file_name);
    }
}

function ju_buddypress_profile_tabs () {

    if( !ju_plugin_activated_check('recipe/index.php') );
    global  $bp;

    bp_core_new_nav_item( array(
        'name'             => __('Recipes','udemy'),
        'slug'             => 'recipes',
        'position'         => 100,
        'screen_function'  => 'ju_recent_recipes_tab',
        'show_for_displayed_user' => true,
        'item_css_id'      => 'ju_user_recipes',
        'default_subnav_slug' => 'recipes'
    ) );
}


