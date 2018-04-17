<?php

function r_save_options()
{

    if (!current_user_can('update_themes')) {
        wp_die(__('you are not allowed to access this page some custom' , 'recipe'));
    }

    check_admin_referer('r_options_verify');

    $recipe_opts = get_option('r_opts');
    $recipe_opts['rating_login_required'] = $_POST['rating_login_required'];
    $recipe_opts['recipe_submission_login_required'] = $_POST['recipe_submission_login_required'];
    update_option('r_opts', $recipe_opts);
    wp_redirect('admin.php?page=r_plugin_opts&status=1');
}
