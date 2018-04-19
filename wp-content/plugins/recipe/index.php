<?php

/*
 * Plugin Name:  Recipe
 * Description: A simple wordpress plugin that allows users to create recipes and rate those recipes
 * version: 1.0
 * Author: Udemy
 * Author URI: http://udemy.com
 * Text Domain: recipe
 *
 */

// Make sure we don't expose any info if called directly
if ( !function_exists( 'add_action' ) ) {
    die ( 'Hi there!  I\'m just a plugin, not much I can do when called directly.' );

}




// Setup

define('RECIPE_PLUGIN_URL', __FILE__ ); // Define a constant for plugin url


// Includes
include('includes/activate.php');
include('includes/init.php');
include('includes/admin/init.php');
include('includes/process/save-post.php');
include('includes/process/filter-content.php');
include('includes/front/enqueue.php');
include('includes/process/rate-recipe.php');
include( dirname( RECIPE_PLUGIN_URL ) . '/includes/widgets.php' );
include('includes/widgets/daily-recipe.php');
include('includes/cron.php');
include('includes/deactivate.php');
include('includes/shortcode/creator.php');
include('includes/process/submit-user-recipe.php');
include('includes/shortcode/recipe-auth.php');
include('includes/process/create-account.php');
include('includes/process/login.php');
include('includes/admin/dashboard-widget.php');
include ('includes/admin/menus.php');
include ('includes/admin/options-page.php');
include ('includes/process/save-options.php');
include ('includes/admin/origin-fields.php');
include ('includes/textdomian.php');





// Hooks
register_activation_hook(__FILE__, 'r_activate_plugin');
register_deactivation_hook(__FILE__,'r_deactivate_plugin');
add_action('init', 'recipe_init');
add_action('admin_init','recipe_admin_init');// All code for admin hooks are in this function
add_action('save_post_recipe','r_save_post_admin',10,3);
add_action('the_content','r_filter_recipe_content');
add_action('wp_enqueue_scripts','r_enqueue_scripts',100);
add_action('wp_ajax_r_rate_recipe','r_rate_recipe_function'); //https://codex.wordpress.org/Plugin_API/Action_Reference/wp_ajax_(action)
add_action('wp_ajax_nopriv_r_rate_recipe','r_rate_recipe_function');
add_action('widgets_init', 'r_widgets_init');
add_action('r_daily_recipe_hook','r_generate_daily_recipe');
add_action('wp_ajax_r_submit_user_recipe','r_submit_user_recipe_function');
add_action('wp_ajax_nopriv_r_submit_user_recipe','r_submit_user_recipe_function');
add_action('wp_ajax_recipe_create_account','recipe_create_account_function');
add_action('wp_ajax_nopriv_recipe_create_account','recipe_create_account_function');
add_action('wp_ajax_recipe_user_login','recipe_user_login_function');
add_action('wp_ajax_nopriv_recipe_user_login','recipe_user_login_function');
add_action('wp_dashboard_setup','r_add_dashboard_widget');
add_action('admin_menu','r_admin_menus');
add_action('origin_add_form_fields','r_origin_add_form_fields');
add_action('create_origin','r_save_origin_meta');
add_action('origin_edit_form_fields','r_origin_edit_form_fields');
add_action('edited_origin','r_save_origin_meta');
add_action('plugins_loaded','r_load_textdomain');



// Shortcodes

add_shortcode('recipe_creator','r_recipe_creator_shortcode');
add_shortcode('recipe_auth_form',"r_recipe_auth_form_shortcode");
