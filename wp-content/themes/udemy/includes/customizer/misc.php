<?php


function ju_misc_customizer_section ($wp_customize) {

    $wp_customize->add_setting( 'ju_header_show_search' ,array(
        'default'    =>     'no',
        'transport'  =>     'postMessage',

    ) );

    $wp_customize->add_setting( 'ju_show_header_popular_post_widget' ,array(
        'default'    =>     false

    ) );

    $wp_customize->add_setting( 'ju_popular_posts_widgets_title' ,array(
        'default'    =>     'Breaking News'

    ) );



    $wp_customize->add_setting( 'ju_header_show_cart' ,array(
        'default'    =>     'yes',
        'transport'  =>     'postMessage',

    ) );

    $wp_customize->add_setting( 'ju_footer_copyright_text' ,array(
        'default'    =>     'Copyrights &copy; 2017 All Rights Reserved by Jasko Koyn Inc.',

    ) );

    $wp_customize->add_setting( 'ju_footer_tos_page' ,array(
        'default'    =>     0,

    ) );


    $wp_customize->add_setting( 'ju_footer_privacy_page' ,array(
        'default'    =>     0,

    ) );




    $wp_customize->add_section('ju_misc_section',array(
        'title'     =>    __('Udemy Misc Settings','udemy'),
        'priority'  =>    30,
        'panel'     =>   'udemy'
    ));



    $wp_customize->add_control( new WP_Customize_Control(
        $wp_customize,'ju_header_show_search_input',
        array(
            'label'    =>   __('Show Search Button in Header','udemy'),
            'section'  =>   'ju_misc_section',
            'settings' =>   'ju_header_show_search',
            'type'     =>   'checkbox',
            'choices'  =>    array(
                'yes'    =>   __('Yes','udemy')
            )
        )
    ));

    $wp_customize->add_control( new WP_Customize_Control(
        $wp_customize,'ju_header_show_cart_input',
        array(
            'label'    =>   __('Show Cart Button in Header','udemy'),
            'section'  =>   'ju_misc_section',
            'settings' =>   'ju_header_show_cart',
            'type'     =>   'checkbox',
            'choices'  =>    array(
                'yes'    =>   __('Yes','udemy')
            )
        )
    ));

    $wp_customize->add_control( new WP_Customize_Control(
        $wp_customize,'ju_footer_copyright_text_input',
        array(
            'label'    =>   __('Copyright Text','udemy'),
            'section'  =>   'ju_misc_section',
            'settings' =>   'ju_footer_copyright_text',
            )
        )
    );

  $wp_customize->add_control( new WP_Customize_Control(
          $wp_customize,'ju_terms_of_service_page_input',
          array(
              'label'    =>   __('TOS Page','udemy'),
              'section'  =>   'ju_misc_section',
              'settings' =>   'ju_footer_tos_page',
              'type'     =>    'dropdown-pages',

          )
      )
  );

$wp_customize->add_control( new WP_Customize_Control(
        $wp_customize,'ju_privacy_policy_page_input',
        array(
            'label'    =>   __('Privacy Policy Page','udemy'),
            'section'  =>   'ju_misc_section',
            'settings' =>   'ju_footer_privacy_page',
            'type'     =>    'dropdown-pages',

        )
    )
);

    $wp_customize->add_control( new WP_Customize_Control(
            $wp_customize,'ju_show_header_popular_post_widget_input',
            array(
                'label'    =>   __('Show Popular Posts','udemy'),
                'section'  =>   'ju_misc_section',
                'settings' =>   'ju_show_header_popular_post_widget',
                'type'     =>    'checkbox',
                'choices'  =>    array(
                    'yes'     =>   __('Yes','udemy')
                 )


            )
        )
    );

    $wp_customize->add_control( new WP_Customize_Control(
            $wp_customize,'ju_popular_posts_widgets_title_input',
            array(
                'label'    =>   __('Popular Posts Title','udemy'),
                'section'  =>   'ju_misc_section',
                'settings' =>   'ju_popular_posts_widgets_title',

                )



        )
    );


}