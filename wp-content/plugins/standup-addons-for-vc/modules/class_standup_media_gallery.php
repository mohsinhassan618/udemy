<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of standup_mansory_grid This class is used to initiate and render about addons in VC panel.
 * @package ptvs-addons-for-vc
 * @author presstigers
 * @since       1.0
 * Text Domain: js_composer
 */
if (!class_exists("standup_mansory_grid")) {
   
    class standup_mansory_grid {
        
        /**
         * Initialize the class and set its properties
         */
        function __construct() {
            add_action("init", array($this, "standup_mansory_grid_box_init"));
            add_shortcode('standup_mansory_grid_box', array($this, 'standup_mansory_grid_box_shortcode'));
        }
        
        public function standup_mansory_grid_box_init(){
            if (function_exists("vc_map")) {
                vc_map(array(
                "name" => __("Standupguys Gallery", 'js_composer'),
                "description" => __("Display image gallery grid on Home page", 'js_composer'),
                "base" => "standup_mansory_grid_box",
                "class" => "",

                "category" => __("Standupguys",'js_composer'),
                "params" => array(
                    array(
                      "type" => "textfield",
                      "holder" => "div",
                      "class" => "",
                      "heading" => __("Title", 'js_composer'),
                      "param_name" => "standup_mansory_grid_title",
                      "description" => __("Enter Title for the about.", 'js_composer'),
                      "not_empty" => false
                    ),
                    array(
                        "type" => "param_group",						 
                        "holder" => "div",
                        "param_name" => "standupset",
                        "params" => array(			
                            array(
                              "type" => "attach_image",
                              "holder" => "div",
                              "class" => "",
                              "heading" => __("Image", 'js_composer'),
                              "param_name" => "standup_mansory_grid_image",
                              "description" => __("Select Image Here", 'js_composer'),
                            ),
                            array(
                              "type" => "textfield",
                              "holder" => "div",
                              "class" => "",
                              "heading" => __("Image Title", 'js_composer'),
                              "param_name" => "standup_mansory_grid_image_title",
                              "value" => '',
                              "description" => __("Write the image title", 'js_composer'),
                            ),
                            array(
                              "type" => "vc_link",
                              "holder" => "div",
                              "class" => "",
                              "heading" => __("Link", 'js_composer'),
                              "param_name" => "standup_mansory_grid_link",
                              "description" => __("Select page here", 'js_composer'),
                              "group" => 'Button Setings'
                            ),
                        )
                    ),

                    array(
                            'type' => 'textfield',
                            'heading' => __( 'Extra class name', 'js_composer' ),
                            'param_name' => 'el_class',
                            'description' => __( 'Style particular content element differently - add a class name and refer to it in custom CSS.', 'js_composer' )
                    )
                   )
                ));
            }
        }
        
        /**
        * Render About on page
        * @param type $attr
        * @param type $content
        * @return type $output HTML of about widget 
        */
       public function standup_mansory_grid_box_shortcode($atts, $content = null){

           extract( shortcode_atts( array(
               'standup_mansory_grid_title' => '',
               'el_class' => '',
           ), $atts ) );
		   
                   $custom_masonry_class = $el_class? $el_class : '';
		   $standupguys = array();
			if (isset($atts['standupset'])) {
				$standupguys = vc_param_group_parse_atts($atts['standupset']);
			}
                        $dir = plugin_dir_url();
                        wp_enqueue_script( 'masonary-grid-script', $dir.'standup-addons-for-vc/assets/js/masonry.pkgd.min.js', array( 'jquery' ), true );
                        wp_enqueue_script( 'imagesloaded-grid-script', $dir.'standup-addons-for-vc/assets/js/imagesloaded.pkgd.min.js', array( 'jquery' ), true );
                        wp_enqueue_script( 'vc-custom-masonary-script', $dir.'standup-addons-for-vc/assets/js/masonry-addon.js', array( 'jquery' ), true );
                        wp_enqueue_style( 'vc-custom-masonary-style', $dir.'standup-addons-for-vc/assets/css/masonry-addon.css' );
		$output = '<div class="'.$custom_masonry_class.'">';
                                if( isset($standup_mansory_grid_title) && !empty($standup_mansory_grid_title) ) {
                                    $output .= '<h2 class="pt-custom-masonry-grid-title">'.$standup_mansory_grid_title.'</h2>';
                                }
                                   $output .= '<div class="pt-custom-masonry-grid">
                                                <div class="pt-custom-masonry-grid-sizer"></div>';
			foreach($standupguys as $key => $standupset_value){			//echo '<pre>';			//print_r($standupset_value);						
			$standup_mansory_grid_link = isset($standupset_value['standup_mansory_grid_link']) ? $standupset_value['standup_mansory_grid_link'] : '';
			
			$standup_mansory_grid_image = isset($standupset_value['standup_mansory_grid_image']) ? $standupset_value['standup_mansory_grid_image'] : '';
			
			$standup_mansory_grid_image_title = isset($standupset_value['standup_mansory_grid_image_title']) ? $standupset_value['standup_mansory_grid_image_title'] : '';
			
			
			$link = vc_build_link( $standup_mansory_grid_link );
			$a_href = $link['url'];
			$a_title = $link['title']? $link['title']:$standup_mansory_grid_image_title;
			$a_target = $link['target'];
			
			$standup_img_id_image = preg_replace( '/[^\d]/', '', $standup_mansory_grid_image );
			$standup_image_about = wpb_getImageBySize( array( 'attach_id' => $standup_img_id_image, 'thumb_size' => 'full', 'class' => 'vc_single_image-img' ) );
			
			$final_image =  $standup_image_about['p_img_large'][0];
			
			
                        $output .= '<div class="pt-custom-masonry-grid-item">
                                        <a class="pt-custom-masonry-item-link" href="'.$a_href.'">
                                            <figure>
                                                <img src="'.$final_image.'" class="vc_grid_single_img" alt="'.$a_title.'">
                                                <div class="pt-custom-masonry-item-caption">'.$standup_mansory_grid_image_title.'</div>
                                            </figure>
                                        </a>
                                    </div>';
				
			}	
			$output .= '</div>';
                        $output .= '</div>';
			
			
			
			
					
					
           return $output; 

       }
    }
    
    new standup_mansory_grid;
    if (class_exists('WPBakeryShortCode')) {

        class WPBakeryShortCode_standup_mansory_grid_Box extends WPBakeryShortCode {
            
        }

    }
}
