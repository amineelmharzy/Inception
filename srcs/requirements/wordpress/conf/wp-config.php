<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'database_name_here' );

/** Database username */
define( 'DB_USER', 'username_here' );

/** Database password */
define( 'DB_PASSWORD', 'password_here' );

/** Database hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

define('WP_REDIS_HOST', 'redis');

define('WP_REDIS_PORT', 6379);

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'AUzQ5(KPkrn L*#Dvj-2R5lD;-<D@;dax!=-:F-2X*r]*`)[}GA;%A=zY-_VN-LV');
define('SECURE_AUTH_KEY',  'I`aY.nX*GzuPPga6UxaB&@.ns=RE0Dmw@aFK70:Lr@0$mQU#,l|9r-3S|IS1g#tT');
define('LOGGED_IN_KEY',    'nZSfnjca?H0`qn>-:X3:,#mGs:)j_V/p,;!qw(#Sn/?}U/%@*p;c]Es{/t=$QG I');
define('NONCE_KEY',        '8M51<OW^TsH0x/;W5p0i4;>lE9U_18k-6z,MhHt1,.(o Uk&){]|u,I,-4-+Ha)e');
define('AUTH_SALT',        'q!ku*o@@6K(H+),gCY+Oz,]{-dnhQR[d_xL3B{>Sf++PiRDGxK!2W .8X lipCxj');
define('SECURE_AUTH_SALT', 'CBC<]Sc/xyIVU[iwnR-75N4nHv+$V*4*!M;,9@<>9N&}zqSU!@[r9kM<t lcjLq2');
define('LOGGED_IN_SALT',   ',[>S+[Xp*I@Pqj+b|D7x,,Y6#]|j3^-;E8-i^!tGsuKe-A5e-R+DCr/PqN][J~R/');
define('NONCE_SALT',       'f8dMaCMXvB-,2?ai1J| 6^r{;_hYUkv0qNOT4!eR#8vrk|<?**zQ,BC0)l.1M+3j');
define('WP_CACHE_KEY_SALT', 'ael-mhar.42.fr');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
