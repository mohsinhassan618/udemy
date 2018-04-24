<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'udemy');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', '');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         ';9f,%hs;$?%n!Nijl{3R;tJLC*8;jCs&/Oz5#<L3:9=/iN1&xEdC)p8(K9%tP&zq');
define('SECURE_AUTH_KEY',  'VI8-zQp1<~BJr7r?xm!$Wix_7C`U=8r>bXM9[Hoi[RE^NKP2;Vr:7a;,z~|ZxFrq');
define('LOGGED_IN_KEY',    'H#2P#Z MTU_/7r%4I/oM(TcS1&!3,e1-rq.wxaaq;Er)LaF/wEilB.(hl(ZO1a(`');
define('NONCE_KEY',        'yb2E0`c6g#[E64~e^h/NC{ek8Q0k+`ym$uSr8+q9rl_}4}Z/{f%Sl#rG n,dB0%D');
define('AUTH_SALT',        'p`:Qu,JDm&DBe?DjfR//t,J7cIJmyRvoSx3]D~n&~tuURTdQ;&;i@q(wvkZ,QInC');
define('SECURE_AUTH_SALT', '0M?v].HU,DkUCa(Qf;(62A4Im,zG0x_:jPl<MY9g+pR9={QiGC|7s{~yK.(Tc&`c');
define('LOGGED_IN_SALT',   '17;;Os![v#Z|zz*<3+Xfk(MOVv[@%dS{5CJrI87AF60NBg<IMr@[(!p9?>=Y9oq&');
define('NONCE_SALT',       'X8c`)(M1GNL%5xPbe~lo;4] .{#1sW{%=W4Bmc$/eT94+QgW*V2kkr:r;t}9Fho*');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG',false);
define('SAVEQUERIES',true);
//define('MULTISITE', true);



/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
