<?php

/*
  Plugin Name: Standupguys Visual Composer Addons
  Plugin URI: https://techtizzy.com/
  Description: Standupguys Addons of Visual Composer for Masonry Grid.
  Author: TechTizzy
  Version: 1.0
  Author URI: https://techtizzy.com/
 */


register_activation_hook(__FILE__, 'standup_plugin_activate');

function standup_plugin_activate() {
    update_option('standup_vc_addons_redirect', true);
    delete_transient('standup_license_activation');
    set_transient("standup_license_activation", true, 60 * 60 * 12);
    $memory = ini_get('memory_limit');
    $allowed_memory = preg_replace("/[^0-9]/", "", $memory) * 1024 * 1024;
    $peak_memory = memory_get_peak_usage(true);
    if ($allowed_memory - $peak_memory <= 14436352) {
        $pre = __('Unfortunately, plugin could not be activated. Not enough memory available.', 'virtualsoft');
        $sub = __('Please contact', 'virtualsoft');
        trigger_error($pre . ' ' . $sub . ' <a href="https://www.presstigers.com/support/">' . __('plugin support', 'virtualsoft') . '</a>.', E_USER_ERROR);
    }

    // theme depend custom row class
    $themes = array(
        'X' => 'x-content-band',
        'HighendWP' => 'vc_row',
        'Vellum' => 'vc_section_wrapper',
        'Curves' => 'default-section',
    );
    $site_theme = wp_get_theme();
    $current_theme = $site_theme->get('Name');
    if (array_key_exists($current_theme, $themes)) {
        if (!get_option('standup_custom_vc_row') || get_option('standup_custom_vc_row') == '')
            update_option('standup_custom_vc_row', $themes[$current_theme]);
    }
}

class standup_VC_Addons {

    var $paths = array();
    var $module_dir;
    var $params_dir;
    var $assets_js;
    var $assets_css;
    var $admin_js;
    var $admin_css;
    var $vc_template_dir;

    function __construct() {
        add_action('init', array($this, 'load_vc_translation'));
        $this->vc_template_dir = plugin_dir_path(__FILE__) . 'vc_templates/';
        $this->module_dir = plugin_dir_path(__FILE__) . 'modules/';
        $this->assets_js = plugins_url('assets/js/', __FILE__);
        $this->assets_css = plugins_url('assets/css/', __FILE__);
        $this->admin_js = plugins_url('admin/vc_extend/js/', __FILE__);
        $this->paths = wp_upload_dir();
        $this->paths['fonts'] = 'smile_fonts';
        $this->paths['fonturl'] = set_url_scheme(trailingslashit($this->paths['baseurl']) . $this->paths['fonts']);
        add_action('after_setup_theme', array($this, 'aio_init'));
        add_action('admin_enqueue_scripts', array($this, 'aio_admin_scripts'));
        add_action('admin_init', array($this, 'toggle_updater'), 1);
        if (!get_option('standup_row')) {
            update_option('standup_row', 'enable');
        }
        if (!get_option('standup_animation')) {
            update_option('standup_animation', 'disable');
        }
    }

// end constructor

    function load_vc_translation() {
        load_plugin_textdomain('standup_vc', FALSE, dirname(plugin_basename(__FILE__)) . '/languages/');
    }

    function aio_init() {
        // activate addons one by one from modules directory
        $standup_modules = get_option('standup_modules');
        $standup_modules[] = 'class_standup_media_gallery';
        

		

        foreach (glob($this->module_dir . "/*.php") as $module) {

            $standup_file = basename($module);
            $standup_fileName = preg_replace('/\\.[^.\\s]{3,4}$/', '', $standup_file);

            if (is_array($standup_modules) && !empty($standup_modules)) {

                if (in_array(strtolower($standup_fileName), $standup_modules)) {
                    //echo $module;
                    require_once($module);
                }
            }
        }
    }

    function aio_admin_scripts($hook) {

        // enqueue css files on backend'
        if ($hook == "post.php" || $hook == "post-new.php" || $hook == "edit.php") {
            $fonts = get_option('smile_fonts');
            if (is_array($fonts)) {
                foreach ($fonts as $font => $info) {
                    if (strpos($info['style'], 'http://') !== false) {
                        wp_enqueue_style('bsf-' . $font, $info['style']);
                    } else {
                        wp_enqueue_style('bsf-' . $font, trailingslashit($this->paths['fonturl']) . $info['style']);
                    }
                }
            }
        }
    }

// end aio_admin_scripts

    function toggle_updater() {
        if (defined('standup_USE_BUILTIN')) {
            update_option('standup_updater', 'disabled');
        } else {
            update_option('standup_updater', 'enabled');
        }

        $modules = array(
            'standup_animation',
        );
        $standup_modules = get_option('standup_modules');
        if (!$standup_modules) {
            update_option('standup_modules', $modules);
        }
    }

}

new standup_VC_Addons;
$standup_modules = get_option('standup_modules');
/*
 * Generate RGB colors from given HEX color
 *
 * @function: standup_hex2rgb()
 * @Package: standup Addons for Visual Compoer
 * @Since: 2.1.0
 * @param: $hex - HEX color value
 * 		  $opecaty - Opacity in float value
 * @returns: value with rgba(r,g,b,opacity);
 */
if (!function_exists('standup_hex2rgb')) {

    function standup_hex2rgb($hex, $opacity = 1) {
        $hex = str_replace("#", "", $hex);
        if (strlen($hex) == 3) {
            $r = hexdec(substr($hex, 0, 1) . substr($hex, 0, 1));
            $g = hexdec(substr($hex, 1, 1) . substr($hex, 1, 1));
            $b = hexdec(substr($hex, 2, 1) . substr($hex, 2, 1));
        } else {
            $r = hexdec(substr($hex, 0, 2));
            $g = hexdec(substr($hex, 2, 2));
            $b = hexdec(substr($hex, 4, 2));
        }
        $rgba = 'rgba(' . $r . ',' . $g . ',' . $b . ',' . $opacity . ')';
        //return implode(",", $rgb); // returns the rgb values separated by commas
        return $rgba; // returns an array with the rgb values
    }

}