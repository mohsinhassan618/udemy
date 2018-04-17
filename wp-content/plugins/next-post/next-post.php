<?php
/**
 * Plugin Name: Next Post Plugin
 */

add_shortcode("next-post","nextPostCall");
add_action('wp_head','nextPostScript');
add_action('wp_ajax_next_post_ajax','nextPostCall');
add_action('wp_ajax_nopriv_next_post_ajax','nextPostCall');




function nextPostScript(){
    wp_register_script(
            'next_post_script',
            plugin_dir_url(__FILE__) .'/js/next-post.js',
            'jquery'
    );

    wp_enqueue_script('next_post_script');
    wp_localize_script(
            'next_post_script',
            'url_obj',
            array(
                    'ajax_url'                       =>        admin_url('admin-ajax.php')
            )
        );
}


function nextPostCall() {

    if(isset($_POST['pre_post']) && !empty($_POST['pre_post'])){

        $p_id = $_POST['pre_post'];


    }
    else {
        $p_id = '';
    }

    if($p_id != '') {
        $args = array('post_type' => 'post', 'orderby' => 'post_id', 'p' => $p_id, 'order' => 'DESC','post_status' => 'publish');
    }
    else {
        $args = array('post_type' => 'post', 'orderby' => 'post_id', 'order' => 'DESC','post_status' => 'publish');
    }



    $loop = new wp_query($args);

    while($loop->have_posts()) {

        $loop->the_post();
        global $post;
        $post = get_post(get_the_ID());
        $pre_post = get_previous_post();
        $pre_post->ID;


        ob_start();
        ?>
        <style>

        </style>
        <div id="post-wrap">
            <div><?php the_post_thumbnail(); ?></div>
            <h1><?php the_title(); ?></h1>
            <p><?php the_excerpt(); ?></p>
            <div id="<?php echo  $pre_post->ID; ?>" class="pre-post-id" style="display: none;"></div>
            <div id="next-button" onclick="next_post()">Next post</div>
        </div>



<?php
        $result = ob_get_clean();
        break;// loop executed only one time

    }//End While
    wp_reset_postdata();

    if($p_id != ''){

        wp_send_json(array('post_content' => $result));
    }
    else {
        return $result;

    }
}// NextPostCAll function end


