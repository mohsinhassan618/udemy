<?php

function r_origin_add_form_fields() {
    ?>
    <div class="form-field">
        <label><?php _e('More Info Url','recipe'); ?></label>
        <input name="r_more_info_url"  type="text" >
        <p class="description">
            <?php
            esc_html_e('A Url a user can click to learn more information about this origin',"recipe");
            ?>
        </p>
    </div>
<?php
}

function r_origin_edit_form_fields($term) {
    $url     = get_term_meta($term->term_id,"r_more_info_url",true);

    ?>
    <tr class="form-field">
        <th scope="row">
            <label><?php _e('More Info Url','recipe'); ?></label>
        </th>
        <td>
            <input name="r_more_info_url"  type="text"  value="<?php echo esc_attr($url); ?>">
            <p class="description">
                <?php
                esc_html_e('A Url a user can click to learn more information about this origin',"recipe");
                ?>
            </p>
        </td>
    </tr>
<?php
}

function r_save_origin_meta($term_id) {
    if( !isset($_POST['r_more_info_url']) ) {
        return;
    }

    update_term_meta($term_id,'r_more_info_url',esc_url_raw($_POST['r_more_info_url']));
}