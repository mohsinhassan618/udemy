<?php get_header();
                    ?>

                    <section id="content">
                        <div class="content-wrap">
                           <div class="container clearfix">
                                <?php

                    while( have_posts() ){
                        the_post();
                        the_content();
                    }// end While
                ?>
                           </div>
                        </div>
                    </section>


<?php get_footer(); ?>