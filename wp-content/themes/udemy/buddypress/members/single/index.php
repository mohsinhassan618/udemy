<?php get_header();
?>


                <?php

                while( have_posts() ){
                    the_post();
                    the_content();
                }// end While
                ?>



<?php get_footer(); ?>