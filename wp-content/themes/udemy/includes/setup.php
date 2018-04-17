<?php


function ju_setup_theme(){


    add_theme_support('post-thumbnails');
    add_theme_support('title-tag');
    add_theme_support('custom-logo');
    add_theme_support('automatic-feed-links');
    add_theme_support('html5',array( 'comment-list', 'comment-form', 'search-form', 'gallery', 'caption' ) );
    add_theme_support( 'woocommerce' );
    add_image_size('ju-post-image','860',575,false);

    $starter_content = array(
        'widgets'    =>   array(
        'ju_sidebar'    =>    array(
            'text_business_info',
            'search',
            'text_about',
        )

        ),

        'attachments'   =>   array(
            'image-about'  =>  array(
                'post-title'   =>  __('About','udemy'),
                'file'         =>  'assets/images/about/1.jpg',
        )

        ),

        'posts'    =>   array(

            'home'       =>   array(
                'thumbnail'   =>   '{{image-about}}',

            ),

            'about' =>   array(
                'thumbnail' =>  '{{image-about}}',
            ),

            'contact' =>  array(
                'thumbnail' =>  '{{image-about}}',
            ),

            'blog'  =>  array(
                'thumbnail' =>  '{{image-about}}',

            ),

            'homepage-section'  =>  array(
                'thumbnail' =>  '{{image-about}}',

            ),
        ),

        'options'   => array(
            "show_on_front"  =>  'page',
            'page_on_front'  =>  '{{home}}',
            'page_for_posts'  =>  '{{blog}}',
        ),


        'theme_mods'  =>  array(
            'ju_facebook_handle'    =>  'udemy',
            'ju_twitter_handle'     =>  'udemy',
            'ju_instagram_handle'   =>  'udemy',
            'ju_email'              =>  'udemy',
            'ju_phone_number'       =>  'udemy',
            'ju_header_show_search' =>  'yes',
            'ju_header_show_cart'   =>  'yes',
        ),

        'nav_menus'  =>  array(

            'primary'  =>  array(
                'name'  =>  __('Primary Menu','udemy'),
                'items'  =>  array(
                    'link_home',//link create a custom link and home is the page new returning link points to home post above
                    'page_about',//about is post id look above
                    'page_blog',
                    'page_contact',
                ),
            ),

            'secondary'  =>  array(
                'name'  =>  __('Secondary Menu', 'Udemy'),
                'items'  =>  array(
                    'link_home',//link create a custom link and home is the page new returning link points to home post above
                    'page_about',//about is post id look above
                    'page_blog',
                    'page_contact',
                ),
            ),



        ),




    );

    add_theme_support('starter-content',$starter_content);
    add_theme_support('post-formats', array('aside','gallery','link','image','quite','video','audio' ) );

    register_nav_menu(
        'primary',
        __('Primary Menu','udemy')

    );

    register_nav_menu(
        'secondary',
        __('Secondary Menu','udemy')

    );


    if (function_exists('quads_register_ad')){
        quads_register_ad( array('location' => 'udemy_header', 'description' => 'Udemy Header position') );

    }



}