<?php


function ju_excerpt_length($length) {

    global $is_iphone;

    if( $is_iphone ) {
        return 30;
    }

    if( wp_is_mobile() ) {
        return 20;
    }

    return $length;
}