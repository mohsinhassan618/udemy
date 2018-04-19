<?php



// Setup



// Includes
include( get_template_directory() . '/includes/front/enqueue.php');
include( get_template_directory() . '/includes/setup.php');
include( get_template_directory() . '/includes/widgets.php');
include( get_template_directory() . '/includes/theme-customizer.php');
include( get_template_directory() . '/includes/customizer/social.php');
include( get_template_directory() . '/includes/customizer/misc.php');
include( get_template_directory() . '/includes/customizer/enqueue.php');
include (get_template_directory() . '/includes/buddypress/cover-image.php');
include (get_template_directory() . '/includes/buddypress/profile-tabs.php');
include (get_template_directory() . '/includes/buddypress/profile-posts.php');
include (get_template_directory() . '/includes/woocommerce/checkout-fields.php');
include (get_template_directory() . '/includes/mobile.php');
include (get_template_directory() . '/includes/admin/author-fields.php');
include (get_template_directory() . '/includes/avatar.php');
include (get_template_directory() . '/includes/home-query.php');
require_once get_template_directory() . '/includes/libs/class-tgm-plugin-activation.php';
include (get_template_directory() . '/includes/register-plugins.php');


// Hooks
add_action('wp_enqueue_scripts','ju_enqueue');
add_action('after_setup_theme','ju_setup_theme');
add_action('widgets_init','ju_widgets');
add_action('customize_register', 'ju_customize_register');
add_action('customize_preview_init','ju_customize_preview_init');
add_action('bp_before_xprofile_cover_image_settings_parse_args','ju_xprofile_cover_image');
add_action('bp_before_groups_cover_image_settings_parse_args','ju_xprofile_cover_image');
add_action('bp_setup_nav','ju_buddypress_profile_tabs');
remove_action( 'woocommerce_sidebar', 'woocommerce_get_sidebar', 10 );// To remove an action Priority must be same
add_filter('woocommerce_billing_fields','ju_wc_billing_fields');
add_filter('woocommerce_billing_fields','ju_wc_shipping_fields');
remove_action('woocommerce_before_shop_loop','woocommerce_catalog_ordering',30);// To remove an action Priority must be same
add_action("excerpt_more","__return_false");
add_filter("excerpt_length","ju_excerpt_length",999);
add_action('show_user_profile', 'ju_custom_user_profile_fields' );
add_action('edit_user_profile', 'ju_custom_user_profile_fields');
add_action('personal_options_update','ju_save_extra_profile_fields');
add_action('edit_user_profile_update','ju_save_extra_profile_fields');
add_filter('avatar_defaults','ju_new_avatar');
add_action('pre_get_posts','ju_modify_homepage_query');
add_action( 'tgmpa_register', 'ju_register_required_plugins' );


// Shortcodes