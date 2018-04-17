<?php
class R_Daily_Recipe_Widget extends WP_Widget
{
    /**
     * Sets up the widgets name etc
     */
    public function __construct() {
        $widget_ops = array(

            'description' => 'Displays a random recipe each day',
        );
        parent::__construct( 'r_daily_recipe_widget', 'Recipe of the day', $widget_ops );
    }



    /**
     * Outputs the options form on admin
     *
     * @param array $instance The widget options
     */
    public function form( $instance ) {
        // outputs the options form on admin

        $default             = array('title' => 'Recipe of the day');
        $instance            = wp_parse_args( (array) $instance, $default);

        ?>

        <p>
            <label for="<?php echo $this->get_field_id('title'); ?>">Title : </label>
            <input type="text" class="widefat"
                   id="<?php echo $this->get_field_id('title'); ?>"
                   name="<?php echo $this->get_field_name('title') ?>"
                   value="<?php echo esc_attr( $instance['title']); ?>"

            >
        </p>


<?php
    }

    /**
     * Processing widget options on save
     *
     * @param array $new_instance The new options
     * @param array $old_instance The previous options
     *
     * @return array
     */
    public function update( $new_instance, $old_instance ) {
        // processes widget options to be saved

        $instance                = [];
        $instance['title']       = strip_tags( $new_instance['title'] );
        return   $instance;

    }


    /**
     * Outputs the content of the widget
     *
     * @param array $args
     * @param array $instance
     */
    public function widget( $args, $instance ) {
        // outputs the content of the widget

        extract($args);// Import array indexes as variables e.g args['before_widget'], args['after_widget']
        extract($instance);// eg. instances['title']

        $title =       apply_filters('widget_title',$title);// apply filter is giving title to filter hooks attached with 'widget_title' eg. add_filter('widget_title','call_back_function');
        //apply_filter is like do_action but for filter hooks

        // these variables are expalin much better on https://codex.wordpress.org/Widgets_API
        // see lec 048 Cron Jobs API
        echo $before_widget;//When you register side bar you give id ,name description and before ,after htmls content
        echo $before_title . $title . $after_title ;// these variables are related to them
        $recipe_id = get_transient('r_daily_recipe');



        ?>
        <?php get_the_title($recipe_id); ?>

        <div  id="oc-portfolio-sidebar" class="owl-carousel carousel-widget"
             data-items="1" data-margin="10" data-loop="true" data-nav="false" data-autoplay="5000">

            <div class="oc-item">
                <div class="iportfolio">
                    <div class="portfolio-image">
                        <a href="<?php echo get_permalink($recipe_id); ?>">
                            <?php echo get_the_post_thumbnail($recipe_id); ?>
                        </a>
                    </div>
                    <div class="portfolio-desc center nobottompadding">
                        <h3><a href="<?php echo get_permalink($recipe_id); ?>"><?php echo get_the_title($recipe_id); ?></a></h3>
                    </div>
                </div>
            </div>

        </div>



<?php
        echo $after_widget;

    }

}