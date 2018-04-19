<?php



function ju_register_required_plugins() {
    $plugins = [
        [
            'name'      =>  'AdSense Plugin WP QUADS',
            'slug'      =>  'quick-adsense-reloaded',
            'required'  =>  false,
        ],
        [
            'name'      =>  'BuddyPress',
            'slug'      =>  'buddypress',
            'required'  =>  false,
        ],
        [
            'name'      =>  'Regenerate Thumbnails',
            'slug'      =>  'regenerate-thumbnails',
            'required'  =>  false,
        ],
        [
            'name'      =>  'WooCommerce',
            'slug'      =>  'woocommerce',
            'required'  =>  false,
        ],
        [
            'name'      =>  'WordPress Popular Posts',
            'slug'      =>  'wordpress-popular-posts',
            'required'  =>  false,
        ],
        [
            'name'      =>  'WP Subtitle',
            'slug'      =>  'wp-subtitle',
            'required'  =>  false,
        ],
        [
            'name'      =>  'Recipe',
            'slug'      =>  'recipe',
            'source'    => get_template_directory() . '/plugins/recipe.zip',
            'required'  =>  false,
        ],
    ];
    
    
    $config = [
        'id'            =>  'udemy',
        'menu'          =>  'tgmpa-install-plugins',
        'parent_slug'   =>  'themes.php',
        'capability'    =>  'edit_theme_options',
        'has_notices'   =>  true,
        'dismissable'   =>  true,
    ];
    
    tgmpa($plugins,$config);
    
    
    
    
    
}
