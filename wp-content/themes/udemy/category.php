
<?php
get_header();

    ?>
    <!-- Page Title
============================================= -->
    <section id="page-title">
        <div class="container clearfix">
            <h1><?php the_archive_title(); ?></h1>
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

                <!-- Posts
                ============================================= -->
                <div id="posts">

                    <?php

                    if( have_posts() ){
                        while(have_posts()){
                            the_post();


                            get_template_part('partials/post/content-excerpt');


                        }

                    }
                    ?>




                </div><!-- #posts end -->




            <?php get_sidebar(); ?>



        </div>

    </div>

</section><!-- #content end -->

<?php get_footer(); ?>