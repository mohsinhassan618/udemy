<?php
function ju_xprofile_cover_image($settings = array() ) {
    $settings['width']  = 1920;
    $settings['height'] = 250;

    $theme_handle = 'bp-parent-css'; // bp-child-css
    $settings['theme_handle'] = $theme_handle;
    $settings['callback']  = 'bp_legacy_theme_cover_image';
//    print_r($settings);
//    die('yes');


    return $settings;
}