<!DOCTYPE html>
<html <?php language_attributes(); ?> ></html>
<head>

    <meta charset="<?php bloginfo('charset'); ?>" />
    <link rel="icon" type="image/png" href="images/favicon.png">
    <!-- Stylesheets
    ============================================= -->
    <?php wp_head(); ?>

    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Document Title
    ============================================= -->


</head>

<body  <?php body_class('no-transition stretched'); ?>  itemscope itemtype="http://schema.org/WebPage" >
    <?php
     global $redux_demo;
     echo '<pre>';
     print_r($redux_demo);
     echo '</pre>';
    ?>
    

<!-- Document Wrapper
============================================= -->
<div id="wrapper" class="clearfix">
    <!-- Top Bar
        ============================================= -->
    <div id="top-bar" class="dark">

        <div class="container clearfix">

            <div class="col_half nobottommargin">

                <!-- Top Links
                ============================================= -->
                <div class="top-links">
                    <?php
                    if(has_nav_menu('secondary')) {
                        wp_nav_menu(array(
                            'location' => 'secondary',
                            'container' => false,
                            'depth' => 1


                        ));
                    }



                    ?>

                </div><!-- .top-links end -->

            </div>

            <div class="col_half fright col_last nobottommargin">

                <!-- Top Social
                ============================================= -->
                <div id="top-social">
                    <ul>

                        <?php
                            if( get_theme_mod('ju_facebook_handle')){ ?>

                                <li><a href="https://facebook.com/<?php echo get_theme_mod( 'ju_facebook_handle' ); ?>" class="si-facebook"><span class="ts-icon"><i class="icon-facebook"></i></span><span class="ts-text">Facebook</span></a></li>

                        <?php    } ?>


                        <?php
                        if( get_theme_mod('ju_twitter_handle')){ ?>

                            <li><a href="https://twitter.com/<?php echo get_theme_mod( 'ju_twitter_handle' ); ?>" class="si-twitter"><span class="ts-icon"><i class="icon-twitter"></i></span><span class="ts-text">Twitter</span></a></li>

                        <?php    } ?>


                        <?php
                        if( get_theme_mod('ju_instagram_handle')){ ?>

                            <li><a href="https://instagram.com/<?php echo get_theme_mod( 'ju_instagram_handle' ); ?>" class="si-instagram"><span class="ts-icon"><i class="icon-instagram2"></i></span><span class="ts-text">Instagram</span></a></li>

                        <?php    } ?>


                        <?php
                        if( get_theme_mod('ju_phone_number')){ ?>

                            <li><a href="tel:+<?php echo get_theme_mod('ju_phone_number');  ?>" class="si-call"><span class="ts-icon"><i class="icon-call"></i></span><span class="ts-text"><?php echo get_theme_mod('ju_phone_number');  ?></span></a></li>

                        <?php    } ?>



                        <?php
                        if( get_theme_mod('ju_email')){ ?>

                            <li><a href="mailto:<?php echo get_theme_mod('ju_email');  ?>" class="si-email3"><span class="ts-icon"><i class="icon-email3"></i></span><span class="ts-text"><?php echo get_theme_mod('ju_email');  ?></span></a></li>

                        <?php    } ?>








                    </ul>
                </div><!-- #top-social end -->

            </div>

        </div>

    </div><!-- #top-bar end -->

    <!-- Header
    ============================================= -->
    <header id="header" class="sticky-style-2">

        <div class="container clearfix">

            <!-- Logo
            ============================================= -->
            <div id="logo">
                <?php
                if( has_custom_logo() ){

                    the_custom_logo();
                }
                else {?>
                    <a href="<?php home_url('/'); ?>" class="standard-logo" data-dark-logo="images/logo-dark.png"><?php bloginfo('name'); ?></a>

                <?php } ?>


            </div><!-- #logo end -->

            <div class="top-advert">
                <?php
                if(function_exists('quads_ad')){
                    echo quads_ad( array('location' => 'udemy_header') );
                }
                ?>
<!--                <img src="http://via.placeholder.com/729x90" alt="Ad">-->
            </div>

        </div>

        <div id="header-wrap">

            <!-- Primary Navigation
            ============================================= -->
            <nav id="primary-menu" class="style-2">

                <div class="container clearfix">

                    <div id="primary-menu-trigger"><i class="icon-reorder"></i></div>

                    <?php

                    if(has_nav_menu('primary')){
                        wp_nav_menu( array(
                                'location'    => 'primary',
                                'container'   => false,
                                'feedback_cb' => false,
                                'depth'       => 4

                        ));
                    }

                    ?>



                    <!-- Top Cart
                        ============================================= -->
                    <?php if(get_theme_mod('ju_header_show_cart') == 'yes' ){ ?>
                    <div id="top-cart">
                        <a href="#" id="top-cart-trigger"><i class="icon-shopping-cart"></i><span><?php echo WC()->cart->get_cart_contents_count(); ?></span></a>
                        <div class="top-cart-content">
                            <div class="top-cart-title">
                                <h4>Shopping Cart</h4>
                            </div>
                            <div class="top-cart-items">

                                <?php
                                foreach ( WC()->cart->get_cart() as $cart_item_key => $cart_item ) {
                                    $_product   = apply_filters( 'woocommerce_cart_item_product', $cart_item['data'], $cart_item, $cart_item_key );
                                    $product_id = apply_filters( 'woocommerce_cart_item_product_id', $cart_item['product_id'], $cart_item, $cart_item_key );

                                    if ( $_product && $_product->exists() && $cart_item['quantity'] > 0 && apply_filters( 'woocommerce_cart_item_visible', true, $cart_item, $cart_item_key ) ) {
                                        $product_permalink = apply_filters( 'woocommerce_cart_item_permalink', $_product->is_visible() ? $_product->get_permalink( $cart_item ) : '', $cart_item, $cart_item_key );
                                        ?>
                                        <div class="top-cart-item clearfix">
                                            <div class="top-cart-item-image">
                                                <?php
                                                $thumbnail = apply_filters( 'woocommerce_cart_item_thumbnail', $_product->get_image(), $cart_item, $cart_item_key );

                                                if ( ! $product_permalink ) {
                                                echo $thumbnail;
                                                } else {
                                                printf( '<a href="%s">%s</a>', esc_url( $product_permalink ), $thumbnail );
                                                }
                                                ?>
                                            </div>
                                            <div class="top-cart-item-desc">
                                                <a href="#"><?php
                                                    if ( ! $product_permalink ) {
                                                    echo apply_filters( 'woocommerce_cart_item_name', $_product->get_name(), $cart_item, $cart_item_key ) . '&nbsp;';
                                                    } else {
                                                    echo apply_filters( 'woocommerce_cart_item_name', sprintf( '<a href="%s">%s</a>', esc_url( $product_permalink ), $_product->get_name() ), $cart_item, $cart_item_key );
                                                    }

                                                    ?></a>
                                                <span class="top-cart-item-price"><?php
                                                    echo apply_filters( 'woocommerce_cart_item_price', WC()->cart->get_product_price( $_product ), $cart_item, $cart_item_key );
                                                    ?>
                                                </span>
                                                <span class="top-cart-item-quantity"><?php echo $cart_item['quantity'] ?></span>
                                            </div>
                                        </div>
                                        <?php
                                    }
                                }
                                ?>

                            </div>
                            <div class="top-cart-action clearfix">
                                <span class="fleft top-checkout-price"><?php echo WC()->cart->get_cart_total(); ?></span>
                                <a href="<?php echo wc_get_cart_url(); ?>" class="button button-3d button-small nomargin fright">View Cart</a>
                            </div>
                        </div>
                    </div><!-- #top-cart end -->
                    <?php } ?>



                    <!-- Top Search
                    ============================================= -->

                    <?php if(get_theme_mod('ju_header_show_search') == 'yes' ) {?>
                    <div id="top-search">
                        <a href="#" id="top-search-trigger"><i class="icon-search3"></i><i class="icon-line-cross"></i></a>
                        <form action="<?php echo esc_url( home_url( '/' ) ); ?>" method="get">
                            <input type="text" name="q" class="form-control" value="<?php the_search_query(); ?>" placeholder="<?php _e('Type &amp; Hit Enter..','udemy'); ?> ">
                        </form>
                    </div><!-- #top-search end -->

                    <?php }  ?>

                </div>

            </nav><!-- #primary-menu end -->

        </div>

    </header><!-- #header end -->