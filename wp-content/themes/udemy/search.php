
<?php get_header(); ?>
<!-- Page Title
============================================= -->
<section id="page-title">

    <div class="container clearfix">
        <h1><?php _e('Search Results for:','udemy'); ?></h1>
        <?php echo get_search_query(); ?>
    </div>

</section><!-- #page-title end -->

<!-- Content
============================================= -->
<section id="content">

    <div class="content-wrap">


        <div class="container clearfix">

            <!-- Post Content
            ============================================= -->
            <div class="postcontent nobottommargin clearfix">

                <!-- Search Box
    ============================================= -->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><?php _e('What are you searhing for today?','udemy');  ?></h3>
                    </div>
                    <div class="panel-body">
                        <?php get_search_form(); ?>
                    </div>
                </div><!-- Search Box End -->

                <!-- Posts
                ============================================= -->
                <div id="posts">

                    <?php

                    if( have_posts() ){
                        while(have_posts()){
                            the_post();
                            ?>


                            <div class="entry clearfix">

                                <?php
                                if( has_post_thumbnail() ){ ?>
                                    <div class="entry-image">
                                        <a href="<?php the_permalink(); ?>" data-lightbox="image">
                                            <?php the_post_thumbnail('full',array('class' => 'image_fade') ); ?>
                                        </a>
                                    </div>

                                    <?php
                                }
                                ?>

                                <div class="entry-title">
                                    <h2><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h2>
                                </div>
                                <ul class="entry-meta clearfix">
                                    <li><i class="icon-calendar3"></i><?php echo get_the_date(); ?></li>
                                    <li><a href="<?php echo get_author_posts_url( get_the_author_meta('ID') ); ?>"><i class="icon-user"></i><?php the_author(); ?></a></li>
                                    <li><i class="icon-folder-open"></i><?php the_category(' ') ?></li>
                                    <li><a href="<?php the_permalink(); ?>#comments"><i class="icon-comments"></i><?php comments_number('0'); ?> </a></li>
                                </ul>
                                <div class="entry-content">
                                    <p><?php the_excerpt(); ?></p>
                                    <a href="<?php the_permalink(); ?>" class="more-link">Read More</a>
                                </div>
                            </div>


                            <?php

                        }

                    }
                    ?>




                </div><!-- #posts end -->

                <!-- Pagination
                ============================================= -->
                <ul class="pager nomargin">
                    <li class="previous"><?php previous_post_link('&larr; Older'); ?></li>
                    <li class="next"><?php next_post_link('Newer &rarr;'); ?></li>
                </ul><!-- .pager end -->

            </div><!-- .postcontent end -->


            <?php get_sidebar(); ?>



        </div>

    </div>

</section><!-- #content end -->

<?php get_footer(); ?>