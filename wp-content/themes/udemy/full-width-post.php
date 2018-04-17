/*
*  Template Name: Full Width Post
*  Template Post Type: post
*/
<?php get_header(); ?>
<!-- Content
============================================= -->
<section id="content">

    <div class="content-wrap">


        <div class="container clearfix">

            <!-- Post Content
            ============================================= -->


                <?php

                if( have_posts() ) {

                    while( have_posts() ){
                        the_post();
                        $author_id = get_the_author_meta('ID');
                        $author_url = get_author_posts_url($author_id);

                        ?>

                        <div class="single-post nobottommargin">

                            <!-- Single Post
                            ============================================= -->
                            <div class="entry clearfix">

                                <!-- Entry Title
                                ============================================= -->
                                <div class="entry-title">
                                    <h2><?php the_title(); ?></h2>
                                </div><!-- .entry-title end -->

                                <!-- Entry Meta
                                ============================================= -->
                                <ul class="entry-meta clearfix">
                                    <li><i class="icon-calendar3"></i><?php echo get_the_date(); ?></li>
                                    <li><a href="<?php echo $auhtor_url; ?>"><i class="icon-user"></i><?php the_author(); ?></a></li>
                                    <li><i class="icon-folder-open"></i><?php the_category(" "); ?></li>
                                    <li><a href="<?php the_permalink(); ?>"><i class="icon-comments"></i><?php comments_number('0'); ?></a></li>
                                </ul><!-- .entry-meta end -->

                                <!-- Entry Image
                                ============================================= -->
                                <?php
                                if( has_post_thumbnail() ){ ?>
                                <div class="entry-image">
                                    <a href="<?php the_permalink(); ?>" data-lightbox="image">
                                        <?php the_post_thumbnail('full' ); ?>
                                    </a>
                                </div>

                                <?php
                                }
                                ?><!-- .entry-image end -->

                                <!-- Entry Content
                                ============================================= -->
                                <div class="entry-content notopmargin">



                                    <?php
                                    the_content();
                                    wp_link_pages(array(
                                        'before'  => '<p class="text-center">' . _('Pages:'),
                                        'after'   =>  '</p>',
                                        'next_or_number'   => 'number'
                                    ));

                                    ?>

                                    <!-- Post Single - Content End -->

                                    <!-- Tag Cloud
                                    ============================================= -->
                                    <div class="tagcloud clearfix bottommargin">
                                        <?php the_tags('',' '); ?>
                                    </div><!-- .tagcloud end -->

                                    <div class="clear"></div>

                                </div>
                            </div><!-- .entry end -->

                            <!-- Post Navigation
                            ============================================= -->
                            <div class="post-navigation clearfix">

                                <div class="col_half nobottommargin">
                                    <?php previous_post_link(); ?>
                                </div>

                                <div class="col_half col_last tright nobottommargin">
                                    <?php next_post_link(); ?>
                                </div>

                            </div><!-- .post-navigation end -->

                            <div class="line"></div>

                            <!-- Post Author Info
                            ============================================= -->

                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Posted by <span><a href="<?php echo $author_url; ?>"><?php the_author(); ?></a></span></h3>
                                </div>
                                <div class="panel-body">
                                    <div class="author-image">
                                        <?php echo get_avatar($author_id,90,'',false,array('class' => 'img-circle')) ?>
                                    </div>
                                    <?php echo nl2br( get_the_author_meta('description') );  ?>
                                </div>
                            </div><!-- Post Single - Author End -->

                            <div class="line"></div>

                            <h4>Related Posts:</h4>




                            <div class="related-posts clearfix">

                                <?php

                                $categories = get_the_category();
                                $rp_query = new WP_Query( array(
                                    'posts_per_page'   =>    2,
                                    'post__not_in'   =>   array($post->ID ),
                                    'cat'           =>   $categories[0]->term_id,
                                ));



                                if( $rp_query->have_posts() ) {
                                    while( $rp_query->have_posts() ){
                                        $rp_query->the_post();


                                        ?>

                                        <div class="mpost clearfix">
                                            <?php
                                            if(has_post_thumbnail()){ ?>

                                                <div class="entry-image">
                                                    <a href="<?php the_permalink(); ?>"><?php the_post_thumbnail(); ?></a>
                                                </div>
                                                <?php
                                            }
                                            ?>

                                            <div class="entry-c">
                                                <div class="entry-title">
                                                    <h4><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h4>
                                                </div>
                                                <ul class="entry-meta clearfix">
                                                    <li><i class="icon-calendar3"></i><?php echo get_the_date(); ?></li>
                                                    <li><a href="<?php the_permalink(); ?>"><i class="icon-comments"></i><?php comments_number('0'); ?></a></li>
                                                </ul>
                                                <div class="entry-content"><?php the_excerpt(); ?></div>
                                            </div>
                                        </div>

                                        <?php

                                    }
                                    wp_reset_postdata();
                                }

                                ?>

                            </div>

                            <?php

                            if( comments_open() || get_comments_number() )
                            {
                                comments_template();

                            }


                            ?>



                        </div>


                        <?php
                    }// end While
                }// End if
                ?>













        </div>

    </div>

</section><!-- #content end -->

<?php get_footer(); ?>