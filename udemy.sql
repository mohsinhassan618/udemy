-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2018 at 11:46 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `udemy`
--

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_activity`
--

CREATE TABLE `wp_bp_activity` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `component` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `primary_link` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `secondary_item_id` bigint(20) DEFAULT NULL,
  `date_recorded` datetime NOT NULL,
  `hide_sitewide` tinyint(1) DEFAULT '0',
  `mptt_left` int(11) NOT NULL DEFAULT '0',
  `mptt_right` int(11) NOT NULL DEFAULT '0',
  `is_spam` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_bp_activity`
--

INSERT INTO `wp_bp_activity` (`id`, `user_id`, `component`, `type`, `action`, `content`, `primary_link`, `item_id`, `secondary_item_id`, `date_recorded`, `hide_sitewide`, `mptt_left`, `mptt_right`, `is_spam`) VALUES
(1, 1, 'members', 'last_activity', '', '', '', 0, NULL, '2018-04-08 12:51:05', 0, 0, 0, 0),
(2, 1, 'profile', 'new_avatar', '<a href=\"http://localhost/udemy/members/mohsin/\">mohsin</a> changed their profile picture', '', 'http://localhost/udemy/members/mohsin/', 0, 0, '2018-02-20 21:38:18', 0, 0, 0, 0),
(3, 1, 'blogs', 'new_blog_post', '<a href=\"http://localhost/udemy/members/mohsin/\">mohsin</a> wrote a new post, <a href=\"http://localhost/udemy/?p=243\">test gallery post</a>', '', 'http://localhost/udemy/?p=243', 1, 243, '2018-03-24 18:01:43', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_activity_meta`
--

CREATE TABLE `wp_bp_activity_meta` (
  `id` bigint(20) NOT NULL,
  `activity_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_bp_activity_meta`
--

INSERT INTO `wp_bp_activity_meta` (`id`, `activity_id`, `meta_key`, `meta_value`) VALUES
(1, 3, 'post_title', 'test gallery post'),
(2, 3, 'post_url', 'http://localhost/udemy/?p=243');

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_friends`
--

CREATE TABLE `wp_bp_friends` (
  `id` bigint(20) NOT NULL,
  `initiator_user_id` bigint(20) NOT NULL,
  `friend_user_id` bigint(20) NOT NULL,
  `is_confirmed` tinyint(1) DEFAULT '0',
  `is_limited` tinyint(1) DEFAULT '0',
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_groups`
--

CREATE TABLE `wp_bp_groups` (
  `id` bigint(20) NOT NULL,
  `creator_id` bigint(20) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  `parent_id` bigint(20) NOT NULL DEFAULT '0',
  `enable_forum` tinyint(1) NOT NULL DEFAULT '1',
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_groups_groupmeta`
--

CREATE TABLE `wp_bp_groups_groupmeta` (
  `id` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_groups_members`
--

CREATE TABLE `wp_bp_groups_members` (
  `id` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `inviter_id` bigint(20) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `is_mod` tinyint(1) NOT NULL DEFAULT '0',
  `user_title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_modified` datetime NOT NULL,
  `comments` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `invite_sent` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_messages_messages`
--

CREATE TABLE `wp_bp_messages_messages` (
  `id` bigint(20) NOT NULL,
  `thread_id` bigint(20) NOT NULL,
  `sender_id` bigint(20) NOT NULL,
  `subject` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_sent` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_messages_meta`
--

CREATE TABLE `wp_bp_messages_meta` (
  `id` bigint(20) NOT NULL,
  `message_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_messages_notices`
--

CREATE TABLE `wp_bp_messages_notices` (
  `id` bigint(20) NOT NULL,
  `subject` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_sent` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_messages_recipients`
--

CREATE TABLE `wp_bp_messages_recipients` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `thread_id` bigint(20) NOT NULL,
  `unread_count` int(10) NOT NULL DEFAULT '0',
  `sender_only` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_notifications`
--

CREATE TABLE `wp_bp_notifications` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `secondary_item_id` bigint(20) DEFAULT NULL,
  `component_name` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `component_action` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_notified` datetime NOT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_notifications_meta`
--

CREATE TABLE `wp_bp_notifications_meta` (
  `id` bigint(20) NOT NULL,
  `notification_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_user_blogs`
--

CREATE TABLE `wp_bp_user_blogs` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `blog_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_bp_user_blogs`
--

INSERT INTO `wp_bp_user_blogs` (`id`, `user_id`, `blog_id`) VALUES
(1, 1, 1),
(2, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_user_blogs_blogmeta`
--

CREATE TABLE `wp_bp_user_blogs_blogmeta` (
  `id` bigint(20) NOT NULL,
  `blog_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_bp_user_blogs_blogmeta`
--

INSERT INTO `wp_bp_user_blogs_blogmeta` (`id`, `blog_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'url', 'http://localhost/udemy'),
(2, 1, 'name', 'Udemy'),
(3, 1, 'description', 'Just another WordPress site'),
(4, 1, 'last_activity', '2018-04-07 21:30:33'),
(5, 1, 'close_comments_for_old_posts', '0'),
(6, 1, 'close_comments_days_old', '14'),
(7, 1, 'thread_comments_depth', '5');

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_xprofile_data`
--

CREATE TABLE `wp_bp_xprofile_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `field_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_bp_xprofile_data`
--

INSERT INTO `wp_bp_xprofile_data` (`id`, `field_id`, `user_id`, `value`, `last_updated`) VALUES
(1, 1, 1, 'mohsin', '2018-02-18 20:18:40'),
(2, 1, 5, 'Dannie', '2018-04-07 21:30:33');

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_xprofile_fields`
--

CREATE TABLE `wp_bp_xprofile_fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_default_option` tinyint(1) NOT NULL DEFAULT '0',
  `field_order` bigint(20) NOT NULL DEFAULT '0',
  `option_order` bigint(20) NOT NULL DEFAULT '0',
  `order_by` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `can_delete` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_bp_xprofile_fields`
--

INSERT INTO `wp_bp_xprofile_fields` (`id`, `group_id`, `parent_id`, `type`, `name`, `description`, `is_required`, `is_default_option`, `field_order`, `option_order`, `order_by`, `can_delete`) VALUES
(1, 1, 0, 'textbox', 'Name', '', 1, 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_xprofile_groups`
--

CREATE TABLE `wp_bp_xprofile_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_order` bigint(20) NOT NULL DEFAULT '0',
  `can_delete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_bp_xprofile_groups`
--

INSERT INTO `wp_bp_xprofile_groups` (`id`, `name`, `description`, `group_order`, `can_delete`) VALUES
(1, 'Base', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_bp_xprofile_meta`
--

CREATE TABLE `wp_bp_xprofile_meta` (
  `id` bigint(20) NOT NULL,
  `object_id` bigint(20) NOT NULL,
  `object_type` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_commentmeta`
--

INSERT INTO `wp_commentmeta` (`meta_id`, `comment_id`, `meta_key`, `meta_value`) VALUES
(1, 3, 'akismet_result', 'false'),
(2, 3, 'akismet_history', 'a:3:{s:4:\"time\";d:1515684823.7370231;s:5:\"event\";s:9:\"check-ham\";s:4:\"user\";s:26:\"mike.jolley@automattic.com\";}'),
(3, 3, 'rating', '4'),
(4, 3, 'verified', '1'),
(5, 3, 'akismet_history', 'a:3:{s:4:\"time\";d:1515685899.27156;s:5:\"event\";s:15:\"status-approved\";s:4:\"user\";s:7:\"ryanr14\";}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2017-08-20 18:56:42', '2017-08-20 18:56:42', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com\">Gravatar</a>.', 0, '1', '', '', 0, 0),
(2, 12, 'mohsin', 'mohsin.hassan618@gmail.com', '', '::1', '2017-08-27 14:29:30', '2017-08-27 14:29:30', 'this is a cooment', 0, '1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36 OPR/47.0.2631.71', '', 0, 1),
(3, 75, 'Mike Jolley', 'mike.jolley@automattic.com', '', '199.66.65.27', '2018-01-11 10:33:43', '2018-01-11 15:33:43', 'It\'s so great to hear some new music from Woo! I couldn\'t bring myself to give it five stars though because... I WANT THE WHOLE ALBUM!', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/udemy', 'yes'),
(2, 'home', 'http://localhost/udemy', 'yes'),
(3, 'blogname', 'Udemy', 'yes'),
(4, 'blogdescription', 'Just another WordPress site', 'yes'),
(5, 'users_can_register', '1', 'yes'),
(6, 'admin_email', 'mohsin.hassan618@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '4', 'yes'),
(13, 'rss_use_excerpt', '1', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '0', 'yes'),
(22, 'posts_per_page', '4', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:219:{s:24:\"^wc-auth/v([1]{1})/(.*)?\";s:63:\"index.php?wc-auth-version=$matches[1]&wc-auth-route=$matches[2]\";s:22:\"^wc-api/v([1-3]{1})/?$\";s:51:\"index.php?wc-api-version=$matches[1]&wc-api-route=/\";s:24:\"^wc-api/v([1-3]{1})(.*)?\";s:61:\"index.php?wc-api-version=$matches[1]&wc-api-route=$matches[2]\";s:7:\"shop/?$\";s:27:\"index.php?post_type=product\";s:37:\"shop/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?post_type=product&feed=$matches[1]\";s:32:\"shop/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?post_type=product&feed=$matches[1]\";s:24:\"shop/page/([0-9]{1,})/?$\";s:45:\"index.php?post_type=product&paged=$matches[1]\";s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:9:\"recipe/?$\";s:26:\"index.php?post_type=recipe\";s:39:\"recipe/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?post_type=recipe&feed=$matches[1]\";s:34:\"recipe/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?post_type=recipe&feed=$matches[1]\";s:26:\"recipe/page/([0-9]{1,})/?$\";s:44:\"index.php?post_type=recipe&paged=$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:32:\"category/(.+?)/wc-api(/(.*))?/?$\";s:54:\"index.php?category_name=$matches[1]&wc-api=$matches[3]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:29:\"tag/([^/]+)/wc-api(/(.*))?/?$\";s:44:\"index.php?tag=$matches[1]&wc-api=$matches[3]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:55:\"product-category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_cat=$matches[1]&feed=$matches[2]\";s:50:\"product-category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_cat=$matches[1]&feed=$matches[2]\";s:31:\"product-category/(.+?)/embed/?$\";s:44:\"index.php?product_cat=$matches[1]&embed=true\";s:43:\"product-category/(.+?)/page/?([0-9]{1,})/?$\";s:51:\"index.php?product_cat=$matches[1]&paged=$matches[2]\";s:25:\"product-category/(.+?)/?$\";s:33:\"index.php?product_cat=$matches[1]\";s:52:\"product-tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_tag=$matches[1]&feed=$matches[2]\";s:47:\"product-tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_tag=$matches[1]&feed=$matches[2]\";s:28:\"product-tag/([^/]+)/embed/?$\";s:44:\"index.php?product_tag=$matches[1]&embed=true\";s:40:\"product-tag/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?product_tag=$matches[1]&paged=$matches[2]\";s:22:\"product-tag/([^/]+)/?$\";s:33:\"index.php?product_tag=$matches[1]\";s:35:\"product/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:45:\"product/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:65:\"product/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"product/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"product/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:41:\"product/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:24:\"product/([^/]+)/embed/?$\";s:40:\"index.php?product=$matches[1]&embed=true\";s:28:\"product/([^/]+)/trackback/?$\";s:34:\"index.php?product=$matches[1]&tb=1\";s:48:\"product/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?product=$matches[1]&feed=$matches[2]\";s:43:\"product/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?product=$matches[1]&feed=$matches[2]\";s:36:\"product/([^/]+)/page/?([0-9]{1,})/?$\";s:47:\"index.php?product=$matches[1]&paged=$matches[2]\";s:43:\"product/([^/]+)/comment-page-([0-9]{1,})/?$\";s:47:\"index.php?product=$matches[1]&cpage=$matches[2]\";s:33:\"product/([^/]+)/wc-api(/(.*))?/?$\";s:48:\"index.php?product=$matches[1]&wc-api=$matches[3]\";s:39:\"product/[^/]+/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:50:\"product/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:32:\"product/([^/]+)(?:/([0-9]+))?/?$\";s:46:\"index.php?product=$matches[1]&page=$matches[2]\";s:24:\"product/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:34:\"product/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:54:\"product/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"product/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"product/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:30:\"product/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:46:\"genre/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?genre=$matches[1]&feed=$matches[2]\";s:41:\"genre/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?genre=$matches[1]&feed=$matches[2]\";s:22:\"genre/([^/]+)/embed/?$\";s:38:\"index.php?genre=$matches[1]&embed=true\";s:34:\"genre/([^/]+)/page/?([0-9]{1,})/?$\";s:45:\"index.php?genre=$matches[1]&paged=$matches[2]\";s:16:\"genre/([^/]+)/?$\";s:27:\"index.php?genre=$matches[1]\";s:55:\"bp_member_type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:53:\"index.php?bp_member_type=$matches[1]&feed=$matches[2]\";s:50:\"bp_member_type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:53:\"index.php?bp_member_type=$matches[1]&feed=$matches[2]\";s:31:\"bp_member_type/([^/]+)/embed/?$\";s:47:\"index.php?bp_member_type=$matches[1]&embed=true\";s:43:\"bp_member_type/([^/]+)/page/?([0-9]{1,})/?$\";s:54:\"index.php?bp_member_type=$matches[1]&paged=$matches[2]\";s:25:\"bp_member_type/([^/]+)/?$\";s:36:\"index.php?bp_member_type=$matches[1]\";s:54:\"bp_group_type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?bp_group_type=$matches[1]&feed=$matches[2]\";s:49:\"bp_group_type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?bp_group_type=$matches[1]&feed=$matches[2]\";s:30:\"bp_group_type/([^/]+)/embed/?$\";s:46:\"index.php?bp_group_type=$matches[1]&embed=true\";s:42:\"bp_group_type/([^/]+)/page/?([0-9]{1,})/?$\";s:53:\"index.php?bp_group_type=$matches[1]&paged=$matches[2]\";s:24:\"bp_group_type/([^/]+)/?$\";s:35:\"index.php?bp_group_type=$matches[1]\";s:33:\"music/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:43:\"music/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:63:\"music/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:58:\"music/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:58:\"music/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:39:\"music/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:22:\"music/([^/]+)/embed/?$\";s:38:\"index.php?music=$matches[1]&embed=true\";s:26:\"music/([^/]+)/trackback/?$\";s:32:\"index.php?music=$matches[1]&tb=1\";s:34:\"music/([^/]+)/page/?([0-9]{1,})/?$\";s:45:\"index.php?music=$matches[1]&paged=$matches[2]\";s:41:\"music/([^/]+)/comment-page-([0-9]{1,})/?$\";s:45:\"index.php?music=$matches[1]&cpage=$matches[2]\";s:31:\"music/([^/]+)/wc-api(/(.*))?/?$\";s:46:\"index.php?music=$matches[1]&wc-api=$matches[3]\";s:37:\"music/[^/]+/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:48:\"music/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:30:\"music/([^/]+)(?:/([0-9]+))?/?$\";s:44:\"index.php?music=$matches[1]&page=$matches[2]\";s:22:\"music/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:32:\"music/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:52:\"music/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:47:\"music/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:47:\"music/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:28:\"music/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:34:\"recipe/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:44:\"recipe/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:64:\"recipe/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"recipe/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"recipe/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:40:\"recipe/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:23:\"recipe/([^/]+)/embed/?$\";s:39:\"index.php?recipe=$matches[1]&embed=true\";s:27:\"recipe/([^/]+)/trackback/?$\";s:33:\"index.php?recipe=$matches[1]&tb=1\";s:47:\"recipe/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:45:\"index.php?recipe=$matches[1]&feed=$matches[2]\";s:42:\"recipe/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:45:\"index.php?recipe=$matches[1]&feed=$matches[2]\";s:35:\"recipe/([^/]+)/page/?([0-9]{1,})/?$\";s:46:\"index.php?recipe=$matches[1]&paged=$matches[2]\";s:42:\"recipe/([^/]+)/comment-page-([0-9]{1,})/?$\";s:46:\"index.php?recipe=$matches[1]&cpage=$matches[2]\";s:32:\"recipe/([^/]+)/wc-api(/(.*))?/?$\";s:47:\"index.php?recipe=$matches[1]&wc-api=$matches[3]\";s:38:\"recipe/[^/]+/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:49:\"recipe/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:31:\"recipe/([^/]+)(?:/([0-9]+))?/?$\";s:45:\"index.php?recipe=$matches[1]&page=$matches[2]\";s:23:\"recipe/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:33:\"recipe/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:53:\"recipe/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:48:\"recipe/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:48:\"recipe/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:29:\"recipe/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:47:\"origin/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:45:\"index.php?origin=$matches[1]&feed=$matches[2]\";s:42:\"origin/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:45:\"index.php?origin=$matches[1]&feed=$matches[2]\";s:23:\"origin/([^/]+)/embed/?$\";s:39:\"index.php?origin=$matches[1]&embed=true\";s:35:\"origin/([^/]+)/page/?([0-9]{1,})/?$\";s:46:\"index.php?origin=$matches[1]&paged=$matches[2]\";s:17:\"origin/([^/]+)/?$\";s:28:\"index.php?origin=$matches[1]\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:17:\"wc-api(/(.*))?/?$\";s:29:\"index.php?&wc-api=$matches[2]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:26:\"comments/wc-api(/(.*))?/?$\";s:29:\"index.php?&wc-api=$matches[2]\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:29:\"search/(.+)/wc-api(/(.*))?/?$\";s:42:\"index.php?s=$matches[1]&wc-api=$matches[3]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:32:\"author/([^/]+)/wc-api(/(.*))?/?$\";s:52:\"index.php?author_name=$matches[1]&wc-api=$matches[3]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:54:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/wc-api(/(.*))?/?$\";s:82:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&wc-api=$matches[5]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:41:\"([0-9]{4})/([0-9]{1,2})/wc-api(/(.*))?/?$\";s:66:\"index.php?year=$matches[1]&monthnum=$matches[2]&wc-api=$matches[4]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:28:\"([0-9]{4})/wc-api(/(.*))?/?$\";s:45:\"index.php?year=$matches[1]&wc-api=$matches[3]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:25:\"(.?.+?)/wc-api(/(.*))?/?$\";s:49:\"index.php?pagename=$matches[1]&wc-api=$matches[3]\";s:28:\"(.?.+?)/order-pay(/(.*))?/?$\";s:52:\"index.php?pagename=$matches[1]&order-pay=$matches[3]\";s:33:\"(.?.+?)/order-received(/(.*))?/?$\";s:57:\"index.php?pagename=$matches[1]&order-received=$matches[3]\";s:25:\"(.?.+?)/orders(/(.*))?/?$\";s:49:\"index.php?pagename=$matches[1]&orders=$matches[3]\";s:29:\"(.?.+?)/view-order(/(.*))?/?$\";s:53:\"index.php?pagename=$matches[1]&view-order=$matches[3]\";s:28:\"(.?.+?)/downloads(/(.*))?/?$\";s:52:\"index.php?pagename=$matches[1]&downloads=$matches[3]\";s:31:\"(.?.+?)/edit-account(/(.*))?/?$\";s:55:\"index.php?pagename=$matches[1]&edit-account=$matches[3]\";s:31:\"(.?.+?)/edit-address(/(.*))?/?$\";s:55:\"index.php?pagename=$matches[1]&edit-address=$matches[3]\";s:34:\"(.?.+?)/payment-methods(/(.*))?/?$\";s:58:\"index.php?pagename=$matches[1]&payment-methods=$matches[3]\";s:32:\"(.?.+?)/lost-password(/(.*))?/?$\";s:56:\"index.php?pagename=$matches[1]&lost-password=$matches[3]\";s:34:\"(.?.+?)/customer-logout(/(.*))?/?$\";s:58:\"index.php?pagename=$matches[1]&customer-logout=$matches[3]\";s:37:\"(.?.+?)/add-payment-method(/(.*))?/?$\";s:61:\"index.php?pagename=$matches[1]&add-payment-method=$matches[3]\";s:40:\"(.?.+?)/delete-payment-method(/(.*))?/?$\";s:64:\"index.php?pagename=$matches[1]&delete-payment-method=$matches[3]\";s:45:\"(.?.+?)/set-default-payment-method(/(.*))?/?$\";s:69:\"index.php?pagename=$matches[1]&set-default-payment-method=$matches[3]\";s:31:\".?.+?/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:42:\".?.+?/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:25:\"([^/]+)/wc-api(/(.*))?/?$\";s:45:\"index.php?name=$matches[1]&wc-api=$matches[3]\";s:31:\"[^/]+/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:42:\"[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:20:{i:0;s:31:\"query-monitor/query-monitor.php\";i:1;s:30:\"advanced-custom-fields/acf.php\";i:2;s:24:\"buddypress/bp-loader.php\";i:3;s:43:\"custom-post-type-ui/custom-post-type-ui.php\";i:4;s:28:\"error-log-monitor/plugin.php\";i:5;s:25:\"fakerpress/fakerpress.php\";i:6;s:23:\"next-post/next-post.php\";i:7;s:49:\"quick-adsense-reloaded/quick-adsense-reloaded.php\";i:8;s:16:\"recipe/index.php\";i:9;s:47:\"show-current-template/show-current-template.php\";i:10;s:27:\"theme-check/theme-check.php\";i:11;s:49:\"woocommerce-email-test/woocommerce-email-test.php\";i:12;s:27:\"woocommerce/woocommerce.php\";i:13;s:45:\"wordpress-admin-style-master/WpAdminStyle.php\";i:14;s:27:\"wordpress-gallery/index.php\";i:15;s:41:\"wordpress-importer/wordpress-importer.php\";i:16;s:51:\"wordpress-popular-posts/wordpress-popular-posts.php\";i:17;s:31:\"wp-log-viewer/wp-log-viewer.php\";i:18;s:42:\"wp-media-javascript-guide-master/index.php\";i:19;s:27:\"wp-subtitle/wp-subtitle.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', 'a:5:{i:0;s:82:\"C:\\xampp\\htdocs\\udemy/wp-content/plugins/woocommerce/templates/archive-product.php\";i:2;s:68:\"C:\\xampp\\htdocs\\udemy/wp-content/plugins/woocommerce/woocommerce.php\";i:3;s:90:\"C:\\xampp\\htdocs\\udemy/wp-content/plugins/quick-adsense-reloaded/quick-adsense-reloaded.php\";i:4;s:68:\"C:\\xampp\\htdocs\\udemy/wp-content/plugins/wp-subtitle/admin/admin.php\";i:5;s:68:\"C:\\xampp\\htdocs\\udemy/wp-content/plugins/wp-subtitle/wp-subtitle.php\";}', 'no'),
(40, 'template', 'udemy', 'yes'),
(41, 'stylesheet', 'udemy', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'recipe author', 'yes'),
(48, 'db_version', '38590', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '1', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'posts', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:3:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}i:3;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'widget_text', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:1:{s:28:\"error-log-monitor/plugin.php\";s:14:\"__return_false\";}', 'no'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '0', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'initial_db_version', '38590', 'yes'),
(92, 'wp_user_roles', 'a:8:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:114:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:18:\"manage_woocommerce\";b:1;s:24:\"view_woocommerce_reports\";b:1;s:12:\"edit_product\";b:1;s:12:\"read_product\";b:1;s:14:\"delete_product\";b:1;s:13:\"edit_products\";b:1;s:20:\"edit_others_products\";b:1;s:16:\"publish_products\";b:1;s:21:\"read_private_products\";b:1;s:15:\"delete_products\";b:1;s:23:\"delete_private_products\";b:1;s:25:\"delete_published_products\";b:1;s:22:\"delete_others_products\";b:1;s:21:\"edit_private_products\";b:1;s:23:\"edit_published_products\";b:1;s:20:\"manage_product_terms\";b:1;s:18:\"edit_product_terms\";b:1;s:20:\"delete_product_terms\";b:1;s:20:\"assign_product_terms\";b:1;s:15:\"edit_shop_order\";b:1;s:15:\"read_shop_order\";b:1;s:17:\"delete_shop_order\";b:1;s:16:\"edit_shop_orders\";b:1;s:23:\"edit_others_shop_orders\";b:1;s:19:\"publish_shop_orders\";b:1;s:24:\"read_private_shop_orders\";b:1;s:18:\"delete_shop_orders\";b:1;s:26:\"delete_private_shop_orders\";b:1;s:28:\"delete_published_shop_orders\";b:1;s:25:\"delete_others_shop_orders\";b:1;s:24:\"edit_private_shop_orders\";b:1;s:26:\"edit_published_shop_orders\";b:1;s:23:\"manage_shop_order_terms\";b:1;s:21:\"edit_shop_order_terms\";b:1;s:23:\"delete_shop_order_terms\";b:1;s:23:\"assign_shop_order_terms\";b:1;s:16:\"edit_shop_coupon\";b:1;s:16:\"read_shop_coupon\";b:1;s:18:\"delete_shop_coupon\";b:1;s:17:\"edit_shop_coupons\";b:1;s:24:\"edit_others_shop_coupons\";b:1;s:20:\"publish_shop_coupons\";b:1;s:25:\"read_private_shop_coupons\";b:1;s:19:\"delete_shop_coupons\";b:1;s:27:\"delete_private_shop_coupons\";b:1;s:29:\"delete_published_shop_coupons\";b:1;s:26:\"delete_others_shop_coupons\";b:1;s:25:\"edit_private_shop_coupons\";b:1;s:27:\"edit_published_shop_coupons\";b:1;s:24:\"manage_shop_coupon_terms\";b:1;s:22:\"edit_shop_coupon_terms\";b:1;s:24:\"delete_shop_coupon_terms\";b:1;s:24:\"assign_shop_coupon_terms\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:13:\"recipe author\";a:2:{s:4:\"name\";s:13:\"Recipe Author\";s:12:\"capabilities\";a:3:{s:4:\"read\";b:1;s:10:\"edit_posts\";b:1;s:12:\"upload_files\";b:1;}}s:8:\"customer\";a:2:{s:4:\"name\";s:8:\"Customer\";s:12:\"capabilities\";a:1:{s:4:\"read\";b:1;}}s:12:\"shop_manager\";a:2:{s:4:\"name\";s:12:\"Shop manager\";s:12:\"capabilities\";a:92:{s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:4:\"read\";b:1;s:18:\"read_private_pages\";b:1;s:18:\"read_private_posts\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_posts\";b:1;s:10:\"edit_pages\";b:1;s:20:\"edit_published_posts\";b:1;s:20:\"edit_published_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"edit_private_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:17:\"edit_others_pages\";b:1;s:13:\"publish_posts\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_posts\";b:1;s:12:\"delete_pages\";b:1;s:20:\"delete_private_pages\";b:1;s:20:\"delete_private_posts\";b:1;s:22:\"delete_published_pages\";b:1;s:22:\"delete_published_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:19:\"delete_others_pages\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:17:\"moderate_comments\";b:1;s:12:\"upload_files\";b:1;s:6:\"export\";b:1;s:6:\"import\";b:1;s:10:\"list_users\";b:1;s:18:\"manage_woocommerce\";b:1;s:24:\"view_woocommerce_reports\";b:1;s:12:\"edit_product\";b:1;s:12:\"read_product\";b:1;s:14:\"delete_product\";b:1;s:13:\"edit_products\";b:1;s:20:\"edit_others_products\";b:1;s:16:\"publish_products\";b:1;s:21:\"read_private_products\";b:1;s:15:\"delete_products\";b:1;s:23:\"delete_private_products\";b:1;s:25:\"delete_published_products\";b:1;s:22:\"delete_others_products\";b:1;s:21:\"edit_private_products\";b:1;s:23:\"edit_published_products\";b:1;s:20:\"manage_product_terms\";b:1;s:18:\"edit_product_terms\";b:1;s:20:\"delete_product_terms\";b:1;s:20:\"assign_product_terms\";b:1;s:15:\"edit_shop_order\";b:1;s:15:\"read_shop_order\";b:1;s:17:\"delete_shop_order\";b:1;s:16:\"edit_shop_orders\";b:1;s:23:\"edit_others_shop_orders\";b:1;s:19:\"publish_shop_orders\";b:1;s:24:\"read_private_shop_orders\";b:1;s:18:\"delete_shop_orders\";b:1;s:26:\"delete_private_shop_orders\";b:1;s:28:\"delete_published_shop_orders\";b:1;s:25:\"delete_others_shop_orders\";b:1;s:24:\"edit_private_shop_orders\";b:1;s:26:\"edit_published_shop_orders\";b:1;s:23:\"manage_shop_order_terms\";b:1;s:21:\"edit_shop_order_terms\";b:1;s:23:\"delete_shop_order_terms\";b:1;s:23:\"assign_shop_order_terms\";b:1;s:16:\"edit_shop_coupon\";b:1;s:16:\"read_shop_coupon\";b:1;s:18:\"delete_shop_coupon\";b:1;s:17:\"edit_shop_coupons\";b:1;s:24:\"edit_others_shop_coupons\";b:1;s:20:\"publish_shop_coupons\";b:1;s:25:\"read_private_shop_coupons\";b:1;s:19:\"delete_shop_coupons\";b:1;s:27:\"delete_private_shop_coupons\";b:1;s:29:\"delete_published_shop_coupons\";b:1;s:26:\"delete_others_shop_coupons\";b:1;s:25:\"edit_private_shop_coupons\";b:1;s:27:\"edit_published_shop_coupons\";b:1;s:24:\"manage_shop_coupon_terms\";b:1;s:22:\"edit_shop_coupon_terms\";b:1;s:24:\"delete_shop_coupon_terms\";b:1;s:24:\"assign_shop_coupon_terms\";b:1;}}}', 'yes'),
(93, 'fresh_site', '0', 'yes'),
(94, 'widget_search', 'a:3:{i:2;a:1:{s:5:\"title\";s:0:\"\";}i:3;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(95, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(96, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(97, 'widget_archives', 'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(98, 'widget_meta', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(99, 'sidebars_widgets', 'a:3:{s:19:\"wp_inactive_widgets\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:10:\"ju_sidebar\";a:4:{i:0;s:23:\"r_daily_recipe_widget-4\";i:1;s:8:\"search-3\";i:2;s:10:\"calendar-2\";i:3;s:12:\"categories-3\";}s:13:\"array_version\";i:3;}', 'yes'),
(100, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(101, 'widget_calendar', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(102, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(103, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(104, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(105, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(106, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'cron', 'a:14:{i:1523826213;a:1:{s:32:\"woocommerce_cancel_unpaid_orders\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}}i:1523834797;a:1:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1523836800;a:1:{s:27:\"woocommerce_scheduled_sales\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1523861803;a:1:{s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1523863714;a:1:{s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1523865893;a:1:{s:28:\"woocommerce_cleanup_sessions\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1523883823;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1523905039;a:1:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1523906571;a:1:{s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1523909093;a:1:{s:30:\"woocommerce_tracker_send_event\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1523909502;a:1:{s:19:\"r_daily_recipe_hook\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1524063306;a:1:{s:18:\"quads_weekly_event\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}i:1525564800;a:1:{s:25:\"woocommerce_geoip_updater\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:7:\"monthly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:2635200;}}}s:7:\"version\";i:2;}', 'yes'),
(108, 'theme_mods_twentyseventeen', 'a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1503395426;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}}}}', 'yes'),
(120, 'can_compress_scripts', '1', 'no'),
(154, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(156, 'auto_core_update_notified', 'a:4:{s:4:\"type\";s:7:\"success\";s:5:\"email\";s:26:\"mohsin.hassan618@gmail.com\";s:7:\"version\";s:5:\"4.9.5\";s:9:\"timestamp\";i:1522828886;}', 'no'),
(157, 'current_theme', 'Udemy', 'yes'),
(158, 'theme_mods_udemy', 'a:16:{i:0;b:0;s:18:\"custom_css_post_id\";i:-1;s:18:\"nav_menu_locations\";a:2:{s:7:\"primary\";i:10;s:9:\"secondary\";i:11;}s:18:\"ju_facebook_handle\";s:16:\"www.facebook.com\";s:17:\"ju_twitter_handle\";s:14:\"www.twiter.com\";s:19:\"ju_instagram_handle\";s:17:\"www.instagram.com\";s:15:\"ju_phone_number\";s:11:\"03075323106\";s:8:\"ju_email\";s:26:\"mohsin.hassan618@gmail.com\";s:21:\"ju_header_show_search\";b:1;s:19:\"ju_header_show_cart\";b:1;s:18:\"ju_footer_tos_page\";s:2:\"45\";s:22:\"ju_footer_privacy_page\";s:2:\"45\";s:24:\"ju_footer_copyright_text\";s:57:\"Copyrights © 2017 All Rights Reserved by Jasko Koyn Inc.\";s:34:\"ju_show_header_popular_post_widget\";b:1;s:30:\"ju_popular_posts_widgets_title\";s:13:\"Breaking News\";s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1519848580;s:4:\"data\";a:3:{s:18:\"orphaned_widgets_1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:19:\"wp_inactive_widgets\";a:0:{}s:10:\"ju_sidebar\";a:4:{i:0;s:23:\"r_daily_recipe_widget-4\";i:1;s:8:\"search-3\";i:2;s:10:\"calendar-2\";i:3;s:12:\"categories-3\";}}}}', 'yes'),
(159, 'theme_switched', '', 'yes'),
(162, 'recently_activated', 'a:0:{}', 'yes'),
(170, 'fakerpress.module_flag.term', 'a:2:{s:8:\"category\";a:3:{i:0;i:2;i:1;i:5;i:2;i:9;}s:8:\"post_tag\";a:5:{i:0;i:3;i:1;i:4;i:2;i:6;i:3;i:7;i:4;i:8;}}', 'yes'),
(178, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}', 'yes'),
(283, 'quads_settings', 'a:16:{s:10:\"post_types\";a:2:{i:0;s:4:\"post\";i:1;s:4:\"page\";}s:10:\"visibility\";a:4:{s:7:\"AppHome\";s:1:\"1\";s:7:\"AppCate\";s:1:\"1\";s:7:\"AppArch\";s:1:\"1\";s:7:\"AppTags\";s:1:\"1\";}s:9:\"quicktags\";a:1:{s:7:\"QckTags\";s:1:\"1\";}s:6:\"maxads\";s:3:\"100\";s:4:\"pos1\";a:1:{s:7:\"BegnRnd\";s:1:\"0\";}s:4:\"pos2\";a:1:{s:7:\"MiddRnd\";s:1:\"0\";}s:4:\"pos3\";a:1:{s:7:\"EndiRnd\";s:1:\"0\";}s:4:\"pos4\";a:1:{s:7:\"MoreRnd\";s:1:\"0\";}s:4:\"pos5\";a:1:{s:7:\"LapaRnd\";s:1:\"0\";}s:4:\"pos6\";a:2:{s:7:\"Par1Rnd\";s:1:\"0\";s:7:\"Par1Nup\";s:1:\"1\";}s:4:\"pos7\";a:2:{s:7:\"Par2Rnd\";s:1:\"0\";s:7:\"Par2Nup\";s:1:\"1\";}s:4:\"pos8\";a:2:{s:7:\"Par3Rnd\";s:1:\"0\";s:7:\"Par3Nup\";s:1:\"1\";}s:4:\"pos9\";a:2:{s:7:\"Img1Rnd\";s:1:\"0\";s:7:\"Img1Nup\";s:1:\"1\";}s:17:\"location_settings\";a:1:{s:12:\"udemy_header\";a:2:{s:6:\"status\";s:1:\"1\";s:2:\"ad\";s:1:\"1\";}}s:3:\"ads\";a:20:{s:3:\"ad1\";a:10:{s:5:\"label\";s:4:\"Ad 1\";s:7:\"ad_type\";s:10:\"plain_text\";s:4:\"code\";s:69:\"<img src=\"http://via.placeholder.com/728x90\" class=\"img-responsive\" >\";s:14:\"g_data_ad_slot\";s:0:\"\";s:16:\"g_data_ad_client\";s:0:\"\";s:12:\"adsense_type\";s:6:\"normal\";s:15:\"g_data_ad_width\";s:0:\"\";s:16:\"g_data_ad_height\";s:0:\"\";s:5:\"align\";s:1:\"3\";s:6:\"margin\";s:1:\"0\";}s:3:\"ad2\";a:10:{s:5:\"label\";s:4:\"Ad 2\";s:7:\"ad_type\";s:10:\"plain_text\";s:4:\"code\";s:0:\"\";s:14:\"g_data_ad_slot\";s:0:\"\";s:16:\"g_data_ad_client\";s:0:\"\";s:12:\"adsense_type\";s:6:\"normal\";s:15:\"g_data_ad_width\";s:0:\"\";s:16:\"g_data_ad_height\";s:0:\"\";s:5:\"align\";s:1:\"3\";s:6:\"margin\";s:1:\"0\";}s:3:\"ad3\";a:10:{s:5:\"label\";s:4:\"Ad 3\";s:7:\"ad_type\";s:10:\"plain_text\";s:4:\"code\";s:0:\"\";s:14:\"g_data_ad_slot\";s:0:\"\";s:16:\"g_data_ad_client\";s:0:\"\";s:12:\"adsense_type\";s:6:\"normal\";s:15:\"g_data_ad_width\";s:0:\"\";s:16:\"g_data_ad_height\";s:0:\"\";s:5:\"align\";s:1:\"3\";s:6:\"margin\";s:1:\"0\";}s:3:\"ad4\";a:10:{s:5:\"label\";s:4:\"Ad 4\";s:7:\"ad_type\";s:10:\"plain_text\";s:4:\"code\";s:0:\"\";s:14:\"g_data_ad_slot\";s:0:\"\";s:16:\"g_data_ad_client\";s:0:\"\";s:12:\"adsense_type\";s:6:\"normal\";s:15:\"g_data_ad_width\";s:0:\"\";s:16:\"g_data_ad_height\";s:0:\"\";s:5:\"align\";s:1:\"3\";s:6:\"margin\";s:1:\"0\";}s:3:\"ad5\";a:10:{s:5:\"label\";s:4:\"Ad 5\";s:7:\"ad_type\";s:10:\"plain_text\";s:4:\"code\";s:0:\"\";s:14:\"g_data_ad_slot\";s:0:\"\";s:16:\"g_data_ad_client\";s:0:\"\";s:12:\"adsense_type\";s:6:\"normal\";s:15:\"g_data_ad_width\";s:0:\"\";s:16:\"g_data_ad_height\";s:0:\"\";s:5:\"align\";s:1:\"3\";s:6:\"margin\";s:1:\"0\";}s:3:\"ad6\";a:10:{s:5:\"label\";s:4:\"Ad 6\";s:7:\"ad_type\";s:10:\"plain_text\";s:4:\"code\";s:0:\"\";s:14:\"g_data_ad_slot\";s:0:\"\";s:16:\"g_data_ad_client\";s:0:\"\";s:12:\"adsense_type\";s:6:\"normal\";s:15:\"g_data_ad_width\";s:0:\"\";s:16:\"g_data_ad_height\";s:0:\"\";s:5:\"align\";s:1:\"3\";s:6:\"margin\";s:1:\"0\";}s:3:\"ad7\";a:10:{s:5:\"label\";s:4:\"Ad 7\";s:7:\"ad_type\";s:10:\"plain_text\";s:4:\"code\";s:0:\"\";s:14:\"g_data_ad_slot\";s:0:\"\";s:16:\"g_data_ad_client\";s:0:\"\";s:12:\"adsense_type\";s:6:\"normal\";s:15:\"g_data_ad_width\";s:0:\"\";s:16:\"g_data_ad_height\";s:0:\"\";s:5:\"align\";s:1:\"3\";s:6:\"margin\";s:1:\"0\";}s:3:\"ad8\";a:10:{s:5:\"label\";s:4:\"Ad 8\";s:7:\"ad_type\";s:10:\"plain_text\";s:4:\"code\";s:0:\"\";s:14:\"g_data_ad_slot\";s:0:\"\";s:16:\"g_data_ad_client\";s:0:\"\";s:12:\"adsense_type\";s:6:\"normal\";s:15:\"g_data_ad_width\";s:0:\"\";s:16:\"g_data_ad_height\";s:0:\"\";s:5:\"align\";s:1:\"3\";s:6:\"margin\";s:1:\"0\";}s:3:\"ad9\";a:10:{s:5:\"label\";s:4:\"Ad 9\";s:7:\"ad_type\";s:10:\"plain_text\";s:4:\"code\";s:0:\"\";s:14:\"g_data_ad_slot\";s:0:\"\";s:16:\"g_data_ad_client\";s:0:\"\";s:12:\"adsense_type\";s:6:\"normal\";s:15:\"g_data_ad_width\";s:0:\"\";s:16:\"g_data_ad_height\";s:0:\"\";s:5:\"align\";s:1:\"3\";s:6:\"margin\";s:1:\"0\";}s:4:\"ad10\";a:10:{s:5:\"label\";s:5:\"Ad 10\";s:7:\"ad_type\";s:10:\"plain_text\";s:4:\"code\";s:0:\"\";s:14:\"g_data_ad_slot\";s:0:\"\";s:16:\"g_data_ad_client\";s:0:\"\";s:12:\"adsense_type\";s:6:\"normal\";s:15:\"g_data_ad_width\";s:0:\"\";s:16:\"g_data_ad_height\";s:0:\"\";s:5:\"align\";s:1:\"3\";s:6:\"margin\";s:1:\"0\";}s:10:\"ad1_widget\";a:9:{s:7:\"ad_type\";s:10:\"plain_text\";s:4:\"code\";s:0:\"\";s:14:\"g_data_ad_slot\";s:0:\"\";s:16:\"g_data_ad_client\";s:0:\"\";s:12:\"adsense_type\";s:6:\"normal\";s:15:\"g_data_ad_width\";s:0:\"\";s:16:\"g_data_ad_height\";s:0:\"\";s:5:\"align\";s:1:\"3\";s:6:\"margin\";s:1:\"0\";}s:10:\"ad2_widget\";a:9:{s:7:\"ad_type\";s:10:\"plain_text\";s:4:\"code\";s:0:\"\";s:14:\"g_data_ad_slot\";s:0:\"\";s:16:\"g_data_ad_client\";s:0:\"\";s:12:\"adsense_type\";s:6:\"normal\";s:15:\"g_data_ad_width\";s:0:\"\";s:16:\"g_data_ad_height\";s:0:\"\";s:5:\"align\";s:1:\"3\";s:6:\"margin\";s:1:\"0\";}s:10:\"ad3_widget\";a:9:{s:7:\"ad_type\";s:10:\"plain_text\";s:4:\"code\";s:0:\"\";s:14:\"g_data_ad_slot\";s:0:\"\";s:16:\"g_data_ad_client\";s:0:\"\";s:12:\"adsense_type\";s:6:\"normal\";s:15:\"g_data_ad_width\";s:0:\"\";s:16:\"g_data_ad_height\";s:0:\"\";s:5:\"align\";s:1:\"3\";s:6:\"margin\";s:1:\"0\";}s:10:\"ad4_widget\";a:9:{s:7:\"ad_type\";s:10:\"plain_text\";s:4:\"code\";s:0:\"\";s:14:\"g_data_ad_slot\";s:0:\"\";s:16:\"g_data_ad_client\";s:0:\"\";s:12:\"adsense_type\";s:6:\"normal\";s:15:\"g_data_ad_width\";s:0:\"\";s:16:\"g_data_ad_height\";s:0:\"\";s:5:\"align\";s:1:\"3\";s:6:\"margin\";s:1:\"0\";}s:10:\"ad5_widget\";a:9:{s:7:\"ad_type\";s:10:\"plain_text\";s:4:\"code\";s:0:\"\";s:14:\"g_data_ad_slot\";s:0:\"\";s:16:\"g_data_ad_client\";s:0:\"\";s:12:\"adsense_type\";s:6:\"normal\";s:15:\"g_data_ad_width\";s:0:\"\";s:16:\"g_data_ad_height\";s:0:\"\";s:5:\"align\";s:1:\"3\";s:6:\"margin\";s:1:\"0\";}s:10:\"ad6_widget\";a:9:{s:7:\"ad_type\";s:10:\"plain_text\";s:4:\"code\";s:0:\"\";s:14:\"g_data_ad_slot\";s:0:\"\";s:16:\"g_data_ad_client\";s:0:\"\";s:12:\"adsense_type\";s:6:\"normal\";s:15:\"g_data_ad_width\";s:0:\"\";s:16:\"g_data_ad_height\";s:0:\"\";s:5:\"align\";s:1:\"3\";s:6:\"margin\";s:1:\"0\";}s:10:\"ad7_widget\";a:9:{s:7:\"ad_type\";s:10:\"plain_text\";s:4:\"code\";s:0:\"\";s:14:\"g_data_ad_slot\";s:0:\"\";s:16:\"g_data_ad_client\";s:0:\"\";s:12:\"adsense_type\";s:6:\"normal\";s:15:\"g_data_ad_width\";s:0:\"\";s:16:\"g_data_ad_height\";s:0:\"\";s:5:\"align\";s:1:\"3\";s:6:\"margin\";s:1:\"0\";}s:10:\"ad8_widget\";a:9:{s:7:\"ad_type\";s:10:\"plain_text\";s:4:\"code\";s:0:\"\";s:14:\"g_data_ad_slot\";s:0:\"\";s:16:\"g_data_ad_client\";s:0:\"\";s:12:\"adsense_type\";s:6:\"normal\";s:15:\"g_data_ad_width\";s:0:\"\";s:16:\"g_data_ad_height\";s:0:\"\";s:5:\"align\";s:1:\"3\";s:6:\"margin\";s:1:\"0\";}s:10:\"ad9_widget\";a:9:{s:7:\"ad_type\";s:10:\"plain_text\";s:4:\"code\";s:0:\"\";s:14:\"g_data_ad_slot\";s:0:\"\";s:16:\"g_data_ad_client\";s:0:\"\";s:12:\"adsense_type\";s:6:\"normal\";s:15:\"g_data_ad_width\";s:0:\"\";s:16:\"g_data_ad_height\";s:0:\"\";s:5:\"align\";s:1:\"3\";s:6:\"margin\";s:1:\"0\";}s:11:\"ad10_widget\";a:9:{s:7:\"ad_type\";s:10:\"plain_text\";s:4:\"code\";s:0:\"\";s:14:\"g_data_ad_slot\";s:0:\"\";s:16:\"g_data_ad_client\";s:0:\"\";s:12:\"adsense_type\";s:6:\"normal\";s:15:\"g_data_ad_width\";s:0:\"\";s:16:\"g_data_ad_height\";s:0:\"\";s:5:\"align\";s:1:\"3\";s:6:\"margin\";s:1:\"0\";}}s:8:\"priority\";s:2:\"20\";}', 'yes'),
(284, 'quads_install_date', '2017-08-30 02:55:06', 'yes'),
(285, 'quads_rating_div', 'yes', 'yes'),
(286, 'quads_show_theme_notice', 'yes', 'yes'),
(290, 'quads_settings_1_5_2', 'a:3:{s:10:\"post_types\";a:2:{i:0;s:4:\"post\";i:1;s:4:\"page\";}s:10:\"visibility\";a:4:{s:7:\"AppHome\";s:1:\"1\";s:7:\"AppCate\";s:1:\"1\";s:7:\"AppArch\";s:1:\"1\";s:7:\"AppTags\";s:1:\"1\";}s:9:\"quicktags\";a:1:{s:7:\"QckTags\";s:1:\"1\";}}', 'yes'),
(291, 'quads_version', '1.7.2', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(469, 'wpp_settings_config', 'a:2:{s:5:\"stats\";a:4:{s:8:\"order_by\";s:5:\"views\";s:5:\"limit\";i:10;s:9:\"post_type\";s:9:\"post,page\";s:9:\"freshness\";b:0;}s:5:\"tools\";a:7:{s:4:\"ajax\";b:0;s:3:\"css\";b:1;s:4:\"link\";a:1:{s:6:\"target\";s:5:\"_self\";}s:9:\"thumbnail\";a:5:{s:6:\"source\";s:8:\"featured\";s:5:\"field\";s:0:\"\";s:6:\"resize\";b:0;s:7:\"default\";s:0:\"\";s:10:\"responsive\";b:0;}s:3:\"log\";a:3:{s:5:\"level\";i:1;s:5:\"limit\";i:0;s:13:\"expires_after\";i:180;}s:5:\"cache\";a:2:{s:6:\"active\";b:0;s:8:\"interval\";a:2:{s:4:\"time\";s:4:\"hour\";s:5:\"value\";i:1;}}s:8:\"sampling\";a:2:{s:6:\"active\";b:0;s:4:\"rate\";i:100;}}}', 'no'),
(470, 'widget_wpp', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(471, 'wpp_ver', '4.0.13', 'no'),
(473, 'wpp_rand', 'b4478261299479546453fff2cbb24efc', 'no'),
(695, 'widget_r_daily_recipe_widget', 'a:2:{i:4;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(1037, 'ws_error_log_monitor_settings', 'a:20:{s:17:\"widget_line_count\";i:20;s:20:\"strip_wordpress_path\";b:0;s:20:\"send_errors_to_email\";a:0:{}s:16:\"email_line_count\";i:100;s:14:\"email_interval\";i:3600;s:25:\"email_last_line_timestamp\";i:0;s:25:\"last_sent_email_timestamp\";i:0;s:16:\"timestamp_format\";s:10:\"M d, H:i:s\";s:10:\"sort_order\";s:13:\"chronological\";s:23:\"extra_filter_line_count\";i:1000;s:20:\"dashboard_log_layout\";s:4:\"list\";s:28:\"enable_log_size_notification\";b:0;s:31:\"log_size_notification_threshold\";i:1048576;s:23:\"log_size_check_interval\";i:3600;s:26:\"log_size_notification_sent\";b:0;s:24:\"dashboard_message_filter\";s:3:\"all\";s:31:\"dashboard_message_filter_groups\";a:6:{i:0;s:5:\"error\";i:1;s:7:\"warning\";i:2;s:6:\"notice\";i:3;s:10:\"deprecated\";i:4;s:16:\"strict standards\";i:5;s:5:\"other\";}s:20:\"email_message_filter\";s:17:\"same_as_dashboard\";s:27:\"email_message_filter_groups\";a:6:{i:0;s:5:\"error\";i:1;s:7:\"warning\";i:2;s:6:\"notice\";i:3;s:10:\"deprecated\";i:4;s:16:\"strict standards\";i:5;s:5:\"other\";}s:16:\"ignored_messages\";a:0:{}}', 'yes'),
(1044, 'quads_show_update_notice', 'no', 'yes'),
(1061, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(1221, 'quads_vi_variant', 'a', 'yes'),
(1222, 'quads_vi_settings', 'O:8:\"stdClass\":3:{s:6:\"status\";s:2:\"ok\";s:5:\"error\";N;s:4:\"data\";O:8:\"stdClass\":10:{s:9:\"signupURL\";s:41:\"https://www.vi.ai/publisher-registration/\";s:12:\"dashboardURL\";s:23:\"https://dashboard.vi.ai\";s:13:\"directSellURL\";s:46:\"https://www.vi.ai/publisher-video-monetization\";s:11:\"demoPageURL\";s:44:\"http://demo.vi.ai/ViewsterBlog_Nintendo.html\";s:8:\"loginAPI\";s:52:\"https://dashboard-api.vidint.net/v1/api/authenticate\";s:10:\"revenueAPI\";s:65:\"https://dashboard-api.vidint.net/v1/api/publishers/report/revenue\";s:8:\"jsTagAPI\";s:55:\"https://dashboard-api.vidint.net/v1/api/inventory/jstag\";s:16:\"iabCategoriesURL\";s:55:\"https://docs.vi.ai/integrations/list-of-iab-categories/\";s:9:\"adsTxtAPI\";s:58:\"https://dashboard-api.vidint.net/v1/api/publishers/ads-txt\";s:9:\"languages\";a:3:{i:0;O:8:\"stdClass\":1:{s:5:\"en-us\";s:7:\"English\";}i:1;O:8:\"stdClass\":1:{s:5:\"de-de\";s:7:\"Deutsch\";}i:2;O:8:\"stdClass\":1:{s:5:\"fr-fr\";s:9:\"Français\";}}}}', 'yes'),
(1258, 'r_opts', 'a:2:{s:21:\"rating_login_required\";i:1;s:32:\"recipe_submission_login_required\";i:1;}', 'yes'),
(1261, 'quads_close_vi_welcome_notice', 'yes', 'yes'),
(1393, '_elementor_installed_time', '1514843626', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1394, 'elementor_remote_info_templates_data', 'a:138:{i:0;a:12:{s:2:\"id\";s:3:\"147\";s:5:\"title\";s:16:\"Homepage – App\";s:9:\"thumbnail\";s:65:\"https://library.elementor.com/wp-content/uploads/2016/08/0004.png\";s:12:\"tmpl_created\";s:10:\"1470829868\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:102:\"https://library.elementor.com/homepage-app/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:18:\"[\"App\",\"Homepage\"]\";s:10:\"menu_order\";s:1:\"2\";s:16:\"popularity_index\";s:1:\"1\";s:11:\"trend_index\";s:1:\"1\";s:6:\"is_pro\";s:1:\"0\";s:17:\"has_page_settings\";s:1:\"0\";}i:1;a:12:{s:2:\"id\";s:4:\"2402\";s:5:\"title\";s:32:\"Homepage &#8211; Interior Design\";s:9:\"thumbnail\";s:69:\"https://library.elementor.com/wp-content/uploads/2017/09/Interior.png\";s:12:\"tmpl_created\";s:10:\"1506441447\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:114:\"https://library.elementor.com/homepage-interior-design/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:193:\"[\"Architecture\",\"building\",\"business\",\"Creative\",\"exterior design\",\"furniture design\",\"Gallery\",\"garden design\",\"house\",\"interior design\",\"landscape design\",\"multipurpose\",\"portfolio\",\"studio\"]\";s:10:\"menu_order\";s:1:\"3\";s:16:\"popularity_index\";s:2:\"41\";s:11:\"trend_index\";s:2:\"39\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:2;a:12:{s:2:\"id\";s:3:\"777\";s:5:\"title\";s:28:\"Homepage &#8211; Coffee Shop\";s:9:\"thumbnail\";s:70:\"https://library.elementor.com/wp-content/uploads/2017/01/rest-home.jpg\";s:12:\"tmpl_created\";s:10:\"1485273092\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:110:\"https://library.elementor.com/homepage-coffee-shop/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:41:\"[\"Coffee\",\"Homepage\",\"Restaurant\",\"Shop\"]\";s:10:\"menu_order\";s:1:\"4\";s:16:\"popularity_index\";s:2:\"38\";s:11:\"trend_index\";s:2:\"41\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:3;a:12:{s:2:\"id\";s:4:\"2404\";s:5:\"title\";s:24:\"Homepage &#8211; Product\";s:9:\"thumbnail\";s:68:\"https://library.elementor.com/wp-content/uploads/2017/09/product.png\";s:12:\"tmpl_created\";s:10:\"1506441452\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:106:\"https://library.elementor.com/homepage-product/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:103:\"[\"business\",\"colorful\",\"ecommerce\",\"flat\",\"mobile\",\"modern\",\"responsive\",\"retina\",\"Shop\",\"woocommerce\"]\";s:10:\"menu_order\";s:1:\"5\";s:16:\"popularity_index\";s:2:\"44\";s:11:\"trend_index\";s:2:\"49\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:4;a:12:{s:2:\"id\";s:3:\"519\";s:5:\"title\";s:20:\"Homepage – Fitness\";s:9:\"thumbnail\";s:65:\"https://library.elementor.com/wp-content/uploads/2016/10/0023.png\";s:12:\"tmpl_created\";s:10:\"1477388808\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:106:\"https://library.elementor.com/homepage-fitness/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:45:\"[\"Fitness\",\"Gym\",\"Health\",\"Homepage\",\"Sport\"]\";s:10:\"menu_order\";s:1:\"6\";s:16:\"popularity_index\";s:1:\"6\";s:11:\"trend_index\";s:1:\"6\";s:6:\"is_pro\";s:1:\"0\";s:17:\"has_page_settings\";s:1:\"0\";}i:5;a:12:{s:2:\"id\";s:3:\"492\";s:5:\"title\";s:21:\"Homepage – Law firm\";s:9:\"thumbnail\";s:65:\"https://library.elementor.com/wp-content/uploads/2016/10/0024.png\";s:12:\"tmpl_created\";s:10:\"1477388365\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:107:\"https://library.elementor.com/homepage-law-firm/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:25:\"[\"Firm\",\"Homepage\",\"Law\"]\";s:10:\"menu_order\";s:1:\"7\";s:16:\"popularity_index\";s:1:\"4\";s:11:\"trend_index\";s:1:\"7\";s:6:\"is_pro\";s:1:\"0\";s:17:\"has_page_settings\";s:1:\"0\";}i:6;a:12:{s:2:\"id\";s:3:\"225\";s:5:\"title\";s:23:\"Homepage – Restaurant\";s:9:\"thumbnail\";s:65:\"https://library.elementor.com/wp-content/uploads/2016/08/0016.png\";s:12:\"tmpl_created\";s:10:\"1470829872\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:109:\"https://library.elementor.com/homepage-restaurant/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:32:\"[\"Food\",\"Homepage\",\"Restaurant\"]\";s:10:\"menu_order\";s:1:\"8\";s:16:\"popularity_index\";s:1:\"2\";s:11:\"trend_index\";s:1:\"3\";s:6:\"is_pro\";s:1:\"0\";s:17:\"has_page_settings\";s:1:\"0\";}i:7;a:12:{s:2:\"id\";s:4:\"3451\";s:5:\"title\";s:39:\"Homepage &#8211; Goodness meal services\";s:9:\"thumbnail\";s:84:\"https://library.elementor.com/wp-content/uploads/2017/11/goodness-featured-image.png\";s:12:\"tmpl_created\";s:10:\"1512054116\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:121:\"https://library.elementor.com/homepage-goodness-meal-services/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:1:\"9\";s:16:\"popularity_index\";s:2:\"71\";s:11:\"trend_index\";s:2:\"60\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:8;a:12:{s:2:\"id\";s:4:\"2152\";s:5:\"title\";s:26:\"Homepage &#8211; Cake Shop\";s:9:\"thumbnail\";s:70:\"https://library.elementor.com/wp-content/uploads/2017/07/cake-home.png\";s:12:\"tmpl_created\";s:10:\"1499774132\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:108:\"https://library.elementor.com/homepage-cake-shop/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:39:\"[\"Cake\",\"Homepage\",\"Restaurant\",\"Shop\"]\";s:10:\"menu_order\";s:2:\"10\";s:16:\"popularity_index\";s:2:\"69\";s:11:\"trend_index\";s:2:\"55\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:9;a:12:{s:2:\"id\";s:4:\"1068\";s:5:\"title\";s:27:\"Homepage &#8211; Copywriter\";s:9:\"thumbnail\";s:71:\"https://library.elementor.com/wp-content/uploads/2017/03/copywriter.png\";s:12:\"tmpl_created\";s:10:\"1488805928\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:109:\"https://library.elementor.com/homepage-copywriter/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:25:\"[\"Copywriter\",\"Homepage\"]\";s:10:\"menu_order\";s:2:\"11\";s:16:\"popularity_index\";s:2:\"42\";s:11:\"trend_index\";s:2:\"48\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:10;a:12:{s:2:\"id\";s:3:\"181\";s:5:\"title\";s:23:\"Homepage &#8211; Agency\";s:9:\"thumbnail\";s:65:\"https://library.elementor.com/wp-content/uploads/2016/08/0019.png\";s:12:\"tmpl_created\";s:10:\"1470826567\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:105:\"https://library.elementor.com/homepage-agency/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:32:\"[\"Agency\",\"Creative\",\"Homepage\"]\";s:10:\"menu_order\";s:2:\"12\";s:16:\"popularity_index\";s:1:\"3\";s:11:\"trend_index\";s:1:\"2\";s:6:\"is_pro\";s:1:\"0\";s:17:\"has_page_settings\";s:1:\"0\";}i:11;a:12:{s:2:\"id\";s:3:\"463\";s:5:\"title\";s:18:\"Homepage – Study\";s:9:\"thumbnail\";s:65:\"https://library.elementor.com/wp-content/uploads/2016/10/0022.png\";s:12:\"tmpl_created\";s:10:\"1477388340\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:104:\"https://library.elementor.com/homepage-study/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:32:\"[\"Education\",\"Homepage\",\"Study\"]\";s:10:\"menu_order\";s:2:\"13\";s:16:\"popularity_index\";s:1:\"7\";s:11:\"trend_index\";s:1:\"5\";s:6:\"is_pro\";s:1:\"0\";s:17:\"has_page_settings\";s:1:\"0\";}i:12;a:12:{s:2:\"id\";s:4:\"2813\";s:5:\"title\";s:32:\"Homepage &#8211; Creative Agency\";s:9:\"thumbnail\";s:90:\"https://library.elementor.com/wp-content/uploads/2017/11/Creative-Agency-–-Home-Page.png\";s:12:\"tmpl_created\";s:10:\"1509615049\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:114:\"https://library.elementor.com/homepage-creative-agency/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:32:\"[\"Agency\",\"Creative\",\"Homepage\"]\";s:10:\"menu_order\";s:2:\"14\";s:16:\"popularity_index\";s:2:\"43\";s:11:\"trend_index\";s:2:\"34\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:13;a:12:{s:2:\"id\";s:3:\"728\";s:5:\"title\";s:33:\"Homepage &#8211; Delivery Company\";s:9:\"thumbnail\";s:87:\"https://library.elementor.com/wp-content/uploads/2017/01/delivery-company-home-page.jpg\";s:12:\"tmpl_created\";s:10:\"1485269993\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:115:\"https://library.elementor.com/homepage-delivery-company/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:23:\"[\"Delivery\",\"Homepage\"]\";s:10:\"menu_order\";s:2:\"15\";s:16:\"popularity_index\";s:2:\"45\";s:11:\"trend_index\";s:2:\"91\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:14;a:12:{s:2:\"id\";s:4:\"2403\";s:5:\"title\";s:29:\"Homepage &#8211; Luxury Hotel\";s:9:\"thumbnail\";s:66:\"https://library.elementor.com/wp-content/uploads/2017/09/Hotel.png\";s:12:\"tmpl_created\";s:10:\"1506441428\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:111:\"https://library.elementor.com/homepage-luxury-hotel/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"16\";s:16:\"popularity_index\";s:2:\"62\";s:11:\"trend_index\";s:2:\"73\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:15;a:12:{s:2:\"id\";s:4:\"1903\";s:5:\"title\";s:20:\"One Page &#8211; Spa\";s:9:\"thumbnail\";s:64:\"https://library.elementor.com/wp-content/uploads/2017/06/spa.png\";s:12:\"tmpl_created\";s:10:\"1496822325\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:102:\"https://library.elementor.com/one-page-spa/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:132:\"[\"beauty\",\"care\",\"girly\",\"hair\",\"Health\",\"hospitality\",\"massage\",\"medical\",\"parlor\",\"physiotherapy\",\"salon\",\"spa\",\"wellness\",\"yoga\"]\";s:10:\"menu_order\";s:2:\"17\";s:16:\"popularity_index\";s:2:\"48\";s:11:\"trend_index\";s:2:\"46\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:16;a:12:{s:2:\"id\";s:4:\"2123\";s:5:\"title\";s:33:\"One Page &#8211; Architect Office\";s:9:\"thumbnail\";s:70:\"https://library.elementor.com/wp-content/uploads/2017/06/architect.png\";s:12:\"tmpl_created\";s:10:\"1499772989\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:115:\"https://library.elementor.com/one-page-architect-office/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"18\";s:16:\"popularity_index\";s:2:\"13\";s:11:\"trend_index\";s:1:\"8\";s:6:\"is_pro\";s:1:\"0\";s:17:\"has_page_settings\";s:1:\"0\";}i:17;a:12:{s:2:\"id\";s:4:\"1888\";s:5:\"title\";s:32:\"One Page &#8211; Creative Meetup\";s:9:\"thumbnail\";s:76:\"https://library.elementor.com/wp-content/uploads/2017/06/creative-meetup.png\";s:12:\"tmpl_created\";s:10:\"1496822319\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:114:\"https://library.elementor.com/one-page-creative-meetup/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"19\";s:16:\"popularity_index\";s:2:\"50\";s:11:\"trend_index\";s:2:\"88\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:18;a:12:{s:2:\"id\";s:4:\"1880\";s:5:\"title\";s:24:\"One Page &#8211; Wedding\";s:9:\"thumbnail\";s:68:\"https://library.elementor.com/wp-content/uploads/2017/06/wedding.png\";s:12:\"tmpl_created\";s:10:\"1496822317\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:106:\"https://library.elementor.com/one-page-wedding/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:82:\"[\"bride\",\"ceremony\",\"cute\",\"event\",\"fancy\",\"girly\",\"groom\",\"guestbook\",\"marriage\"]\";s:10:\"menu_order\";s:2:\"20\";s:16:\"popularity_index\";s:3:\"103\";s:11:\"trend_index\";s:3:\"117\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:19;a:12:{s:2:\"id\";s:4:\"1891\";s:5:\"title\";s:35:\"One Page &#8211; Textile Convention\";s:9:\"thumbnail\";s:75:\"https://library.elementor.com/wp-content/uploads/2017/06/textile-meetup.png\";s:12:\"tmpl_created\";s:10:\"1496822323\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:117:\"https://library.elementor.com/one-page-textile-convention/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"21\";s:16:\"popularity_index\";s:2:\"88\";s:11:\"trend_index\";s:2:\"69\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:20;a:12:{s:2:\"id\";s:4:\"1885\";s:5:\"title\";s:29:\"One Page &#8211; Yacht Rental\";s:9:\"thumbnail\";s:71:\"https://library.elementor.com/wp-content/uploads/2017/06/yacht-home.png\";s:12:\"tmpl_created\";s:10:\"1496822321\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:111:\"https://library.elementor.com/one-page-yacht-rental/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"22\";s:16:\"popularity_index\";s:2:\"47\";s:11:\"trend_index\";s:2:\"47\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:21;a:12:{s:2:\"id\";s:4:\"2723\";s:5:\"title\";s:34:\"Portfolio &#8211; Graphic Designer\";s:9:\"thumbnail\";s:91:\"https://library.elementor.com/wp-content/uploads/2017/11/Graphic-Designer-–-Portfolio.png\";s:12:\"tmpl_created\";s:10:\"1509633883\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:116:\"https://library.elementor.com/portfolio-graphic-designer/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"23\";s:16:\"popularity_index\";s:2:\"56\";s:11:\"trend_index\";s:2:\"44\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:22;a:12:{s:2:\"id\";s:4:\"2145\";s:5:\"title\";s:30:\"About &#8211; Delivery Company\";s:9:\"thumbnail\";s:75:\"https://library.elementor.com/wp-content/uploads/2017/07/delivery-about.png\";s:12:\"tmpl_created\";s:10:\"1499774125\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:112:\"https://library.elementor.com/about-delivery-company/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:10:\"[\"moving\"]\";s:10:\"menu_order\";s:2:\"24\";s:16:\"popularity_index\";s:2:\"80\";s:11:\"trend_index\";s:2:\"89\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:23;a:12:{s:2:\"id\";s:4:\"2155\";s:5:\"title\";s:23:\"About &#8211; Cake Shop\";s:9:\"thumbnail\";s:71:\"https://library.elementor.com/wp-content/uploads/2017/07/cake-about.png\";s:12:\"tmpl_created\";s:10:\"1499774130\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:105:\"https://library.elementor.com/about-cake-shop/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:8:\"[\"Food\"]\";s:10:\"menu_order\";s:2:\"25\";s:16:\"popularity_index\";s:3:\"100\";s:11:\"trend_index\";s:3:\"123\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:24;a:12:{s:2:\"id\";s:4:\"1085\";s:5:\"title\";s:21:\"About &#8211; Startup\";s:9:\"thumbnail\";s:68:\"https://library.elementor.com/wp-content/uploads/2017/03/Startup.png\";s:12:\"tmpl_created\";s:10:\"1488810874\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:103:\"https://library.elementor.com/about-startup/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:19:\"[\"About\",\"Startup\"]\";s:10:\"menu_order\";s:2:\"26\";s:16:\"popularity_index\";s:1:\"5\";s:11:\"trend_index\";s:1:\"4\";s:6:\"is_pro\";s:1:\"0\";s:17:\"has_page_settings\";s:1:\"0\";}i:25;a:12:{s:2:\"id\";s:3:\"143\";s:5:\"title\";s:18:\"About – Personal\";s:9:\"thumbnail\";s:65:\"https://library.elementor.com/wp-content/uploads/2016/08/0010.png\";s:12:\"tmpl_created\";s:10:\"1470820447\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:104:\"https://library.elementor.com/about-personal/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:20:\"[\"About\",\"Personal\"]\";s:10:\"menu_order\";s:2:\"27\";s:16:\"popularity_index\";s:2:\"15\";s:11:\"trend_index\";s:2:\"15\";s:6:\"is_pro\";s:1:\"0\";s:17:\"has_page_settings\";s:1:\"0\";}i:26;a:12:{s:2:\"id\";s:3:\"101\";s:5:\"title\";s:16:\"About &#8211; CV\";s:9:\"thumbnail\";s:65:\"https://library.elementor.com/wp-content/uploads/2016/08/0018.png\";s:12:\"tmpl_created\";s:10:\"1470829785\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:98:\"https://library.elementor.com/about-cv/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:77:\"[\"creative portfolio\",\"Personal\",\"portfolio\",\"professional\",\"resume\",\"vcard\"]\";s:10:\"menu_order\";s:2:\"28\";s:16:\"popularity_index\";s:2:\"21\";s:11:\"trend_index\";s:2:\"21\";s:6:\"is_pro\";s:1:\"0\";s:17:\"has_page_settings\";s:1:\"0\";}i:27;a:12:{s:2:\"id\";s:3:\"140\";s:5:\"title\";s:21:\"About – Art Gallery\";s:9:\"thumbnail\";s:65:\"https://library.elementor.com/wp-content/uploads/2016/08/0009.png\";s:12:\"tmpl_created\";s:10:\"1470820463\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:107:\"https://library.elementor.com/about-art-gallery/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:25:\"[\"About\",\"Art\",\"Gallery\"]\";s:10:\"menu_order\";s:2:\"29\";s:16:\"popularity_index\";s:2:\"12\";s:11:\"trend_index\";s:2:\"10\";s:6:\"is_pro\";s:1:\"0\";s:17:\"has_page_settings\";s:1:\"0\";}i:28;a:12:{s:2:\"id\";s:3:\"213\";s:5:\"title\";s:22:\"About – Architecture\";s:9:\"thumbnail\";s:65:\"https://library.elementor.com/wp-content/uploads/2016/08/0008.png\";s:12:\"tmpl_created\";s:10:\"1470829766\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:108:\"https://library.elementor.com/about-architecture/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:24:\"[\"About\",\"Architecture\"]\";s:10:\"menu_order\";s:2:\"30\";s:16:\"popularity_index\";s:2:\"11\";s:11:\"trend_index\";s:2:\"18\";s:6:\"is_pro\";s:1:\"0\";s:17:\"has_page_settings\";s:1:\"0\";}i:29;a:12:{s:2:\"id\";s:4:\"2802\";s:5:\"title\";s:38:\"Portfolio &#8211; Fashion Photographer\";s:9:\"thumbnail\";s:95:\"https://library.elementor.com/wp-content/uploads/2017/11/Fashion-photographer-–-Portfolio.png\";s:12:\"tmpl_created\";s:10:\"1509615440\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:120:\"https://library.elementor.com/portfolio-fashion-photographer/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"31\";s:16:\"popularity_index\";s:2:\"74\";s:11:\"trend_index\";s:2:\"98\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:30;a:12:{s:2:\"id\";s:4:\"2828\";s:5:\"title\";s:35:\"Landing Page &#8211; Law Convention\";s:9:\"thumbnail\";s:92:\"https://library.elementor.com/wp-content/uploads/2017/11/Law-Convention-–-Landing-Page.png\";s:12:\"tmpl_created\";s:10:\"1509631636\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:117:\"https://library.elementor.com/landing-page-law-convention/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:35:\"[\"Convention\",\"Landing Page\",\"Law\"]\";s:10:\"menu_order\";s:2:\"32\";s:16:\"popularity_index\";s:3:\"105\";s:11:\"trend_index\";s:3:\"101\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:31;a:12:{s:2:\"id\";s:4:\"1461\";s:5:\"title\";s:28:\"Landing Page &#8211; Ebook 1\";s:9:\"thumbnail\";s:81:\"https://library.elementor.com/wp-content/uploads/2017/05/Landing-Page-Ebook-1.png\";s:12:\"tmpl_created\";s:10:\"1494352121\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:110:\"https://library.elementor.com/landing-page-ebook-1/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:127:\"[\"App\",\"author\",\"book\",\"brochure\",\"download\",\"e-book\",\"ebook\",\"marketing\",\"product\",\"publisher\",\"sell online\",\"seo\",\"showcase\"]\";s:10:\"menu_order\";s:2:\"33\";s:16:\"popularity_index\";s:2:\"68\";s:11:\"trend_index\";s:2:\"57\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:32;a:12:{s:2:\"id\";s:4:\"1460\";s:5:\"title\";s:28:\"Landing Page &#8211; Ebook 2\";s:9:\"thumbnail\";s:81:\"https://library.elementor.com/wp-content/uploads/2017/05/Landing-Page-Ebook-2.png\";s:12:\"tmpl_created\";s:10:\"1494352124\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:110:\"https://library.elementor.com/landing-page-ebook-2/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"34\";s:16:\"popularity_index\";s:2:\"65\";s:11:\"trend_index\";s:2:\"63\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:33;a:12:{s:2:\"id\";s:4:\"1459\";s:5:\"title\";s:28:\"Landing Page &#8211; Ebook 3\";s:9:\"thumbnail\";s:81:\"https://library.elementor.com/wp-content/uploads/2017/05/Landing-Page-Ebook-3.png\";s:12:\"tmpl_created\";s:10:\"1494352125\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:110:\"https://library.elementor.com/landing-page-ebook-3/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"35\";s:16:\"popularity_index\";s:2:\"55\";s:11:\"trend_index\";s:2:\"93\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:34;a:12:{s:2:\"id\";s:4:\"1052\";s:5:\"title\";s:33:\"Landing Page &#8211; Mobile App 1\";s:9:\"thumbnail\";s:64:\"https://library.elementor.com/wp-content/uploads/2017/03/app.png\";s:12:\"tmpl_created\";s:10:\"1488810873\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:113:\"https://library.elementor.com/landing-page-mobile-app/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"36\";s:16:\"popularity_index\";s:2:\"18\";s:11:\"trend_index\";s:2:\"17\";s:6:\"is_pro\";s:1:\"0\";s:17:\"has_page_settings\";s:1:\"0\";}i:35;a:12:{s:2:\"id\";s:4:\"1503\";s:5:\"title\";s:33:\"Landing Page &#8211; Mobile App 2\";s:9:\"thumbnail\";s:78:\"https://library.elementor.com/wp-content/uploads/2017/05/Landing-Page-app1.png\";s:12:\"tmpl_created\";s:10:\"1494352113\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:115:\"https://library.elementor.com/landing-page-mobile-app-2/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"37\";s:16:\"popularity_index\";s:2:\"54\";s:11:\"trend_index\";s:2:\"59\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:36;a:12:{s:2:\"id\";s:4:\"1504\";s:5:\"title\";s:33:\"Landing Page &#8211; Mobile App 3\";s:9:\"thumbnail\";s:78:\"https://library.elementor.com/wp-content/uploads/2017/05/Landing-Page-app2.png\";s:12:\"tmpl_created\";s:10:\"1494352112\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:115:\"https://library.elementor.com/landing-page-mobile-app-3/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"38\";s:16:\"popularity_index\";s:2:\"59\";s:11:\"trend_index\";s:2:\"81\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:37;a:12:{s:2:\"id\";s:4:\"1505\";s:5:\"title\";s:33:\"Landing Page &#8211; Mobile App 4\";s:9:\"thumbnail\";s:78:\"https://library.elementor.com/wp-content/uploads/2017/05/Landing-Page-app3.png\";s:12:\"tmpl_created\";s:10:\"1494352110\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:115:\"https://library.elementor.com/landing-page-mobile-app-4/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"39\";s:16:\"popularity_index\";s:2:\"84\";s:11:\"trend_index\";s:3:\"116\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:38;a:12:{s:2:\"id\";s:3:\"726\";s:5:\"title\";s:33:\"Landing Page &#8211; Conference 1\";s:9:\"thumbnail\";s:84:\"https://library.elementor.com/wp-content/uploads/2017/01/convention-landing-page.jpg\";s:12:\"tmpl_created\";s:10:\"1485270062\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:113:\"https://library.elementor.com/landing-page-conference/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"40\";s:16:\"popularity_index\";s:2:\"85\";s:11:\"trend_index\";s:3:\"124\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:39;a:12:{s:2:\"id\";s:4:\"1613\";s:5:\"title\";s:29:\"Landing Page – Conference 2\";s:9:\"thumbnail\";s:109:\"https://library.elementor.com/wp-content/uploads/2017/05/Landing-Page-International-Womens-Day-Conference.png\";s:12:\"tmpl_created\";s:10:\"1494352129\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:115:\"https://library.elementor.com/landing-page-conference-2/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"41\";s:16:\"popularity_index\";s:2:\"99\";s:11:\"trend_index\";s:2:\"95\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:40;a:12:{s:2:\"id\";s:4:\"1612\";s:5:\"title\";s:29:\"Landing Page – Conference 3\";s:9:\"thumbnail\";s:89:\"https://library.elementor.com/wp-content/uploads/2017/05/Landing-Page-Tech-Conference.png\";s:12:\"tmpl_created\";s:10:\"1494352127\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:115:\"https://library.elementor.com/landing-page-conference-3/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"42\";s:16:\"popularity_index\";s:3:\"102\";s:11:\"trend_index\";s:2:\"53\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:41;a:12:{s:2:\"id\";s:4:\"1614\";s:5:\"title\";s:29:\"Landing Page – Conference 4\";s:9:\"thumbnail\";s:99:\"https://library.elementor.com/wp-content/uploads/2017/05/Landing-Page-Sustainability-Conference.png\";s:12:\"tmpl_created\";s:10:\"1494352131\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:115:\"https://library.elementor.com/landing-page-conference-4/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"43\";s:16:\"popularity_index\";s:2:\"73\";s:11:\"trend_index\";s:2:\"97\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:42;a:12:{s:2:\"id\";s:3:\"906\";s:5:\"title\";s:29:\"Landing Page &#8211;  Coacher\";s:9:\"thumbnail\";s:80:\"https://library.elementor.com/wp-content/uploads/2017/02/Landin-Page-Coacher.png\";s:12:\"tmpl_created\";s:10:\"1494352066\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:110:\"https://library.elementor.com/landing-page-coacher/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"44\";s:16:\"popularity_index\";s:2:\"51\";s:11:\"trend_index\";s:2:\"87\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:43;a:12:{s:2:\"id\";s:3:\"955\";s:5:\"title\";s:31:\"Landing Page &#8211; Law Office\";s:9:\"thumbnail\";s:84:\"https://library.elementor.com/wp-content/uploads/2017/02/Landing-Page-Law-Office.png\";s:12:\"tmpl_created\";s:10:\"1494352069\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:113:\"https://library.elementor.com/landing-page-law-office/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:31:\"[\"Landing Page\",\"Law\",\"Office\"]\";s:10:\"menu_order\";s:2:\"45\";s:16:\"popularity_index\";s:2:\"52\";s:11:\"trend_index\";s:2:\"56\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:44;a:12:{s:2:\"id\";s:3:\"879\";s:5:\"title\";s:41:\"Landing Page &#8211; Financial Consultant\";s:9:\"thumbnail\";s:94:\"https://library.elementor.com/wp-content/uploads/2017/02/Landing-Page-Financial-consultant.png\";s:12:\"tmpl_created\";s:10:\"1494352064\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:123:\"https://library.elementor.com/landing-page-financial-consultant/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"46\";s:16:\"popularity_index\";s:2:\"53\";s:11:\"trend_index\";s:2:\"52\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:45;a:12:{s:2:\"id\";s:3:\"926\";s:5:\"title\";s:33:\"Landing Page &#8211; Private Chef\";s:9:\"thumbnail\";s:86:\"https://library.elementor.com/wp-content/uploads/2017/02/Landing-Page-Private-Chef.png\";s:12:\"tmpl_created\";s:10:\"1494352068\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:115:\"https://library.elementor.com/landing-page-private-chef/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"47\";s:16:\"popularity_index\";s:2:\"83\";s:11:\"trend_index\";s:3:\"107\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:46;a:12:{s:2:\"id\";s:3:\"855\";s:5:\"title\";s:37:\"Landing Page &#8211; Personal Trainer\";s:9:\"thumbnail\";s:90:\"https://library.elementor.com/wp-content/uploads/2017/02/Landing-Page-Personal-Trainer.png\";s:12:\"tmpl_created\";s:10:\"1494352061\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:119:\"https://library.elementor.com/landing-page-personal-trainer/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"48\";s:16:\"popularity_index\";s:2:\"75\";s:11:\"trend_index\";s:2:\"83\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:47;a:12:{s:2:\"id\";s:3:\"974\";s:5:\"title\";s:28:\"Landing Page &#8211; Stylist\";s:9:\"thumbnail\";s:81:\"https://library.elementor.com/wp-content/uploads/2017/03/Landing-Page-Stylist.png\";s:12:\"tmpl_created\";s:10:\"1494352071\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:110:\"https://library.elementor.com/landing-page-stylist/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:146:\"[\"cosmetics\",\"fashion\",\"girly\",\"hairdresser\",\"lifestyle\",\"makeup\",\"manicure\",\"pedicure\",\"products\",\"salon\",\"Shop\",\"skincare\",\"stylist\",\"wellness\"]\";s:10:\"menu_order\";s:2:\"49\";s:16:\"popularity_index\";s:2:\"95\";s:11:\"trend_index\";s:3:\"110\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:48;a:12:{s:2:\"id\";s:4:\"1032\";s:5:\"title\";s:27:\"Landing Page &#8211; Agency\";s:9:\"thumbnail\";s:67:\"https://library.elementor.com/wp-content/uploads/2017/03/Agency.png\";s:12:\"tmpl_created\";s:10:\"1488810866\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:109:\"https://library.elementor.com/landing-page-agency/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"50\";s:16:\"popularity_index\";s:2:\"66\";s:11:\"trend_index\";s:2:\"94\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:49;a:12:{s:2:\"id\";s:4:\"1634\";s:5:\"title\";s:33:\"Landing Page &#8211; Chiropractor\";s:9:\"thumbnail\";s:86:\"https://library.elementor.com/wp-content/uploads/2017/05/Landing-Page-Chiropractor.png\";s:12:\"tmpl_created\";s:10:\"1494352119\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:115:\"https://library.elementor.com/landing-page-chiropractor/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"51\";s:16:\"popularity_index\";s:2:\"82\";s:11:\"trend_index\";s:2:\"80\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:50;a:12:{s:2:\"id\";s:3:\"730\";s:5:\"title\";s:24:\"Landing Page &#8211; App\";s:9:\"thumbnail\";s:78:\"https://library.elementor.com/wp-content/uploads/2017/01/app.-landing-page.jpg\";s:12:\"tmpl_created\";s:10:\"1485273430\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:106:\"https://library.elementor.com/landing-page-app/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"52\";s:16:\"popularity_index\";s:2:\"63\";s:11:\"trend_index\";s:3:\"104\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:51;a:12:{s:2:\"id\";s:3:\"643\";s:5:\"title\";s:29:\"Landing Page &#8211; Festival\";s:9:\"thumbnail\";s:69:\"https://library.elementor.com/wp-content/uploads/2016/12/festival.jpg\";s:12:\"tmpl_created\";s:10:\"1481549290\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:111:\"https://library.elementor.com/landing-page-festival/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"53\";s:16:\"popularity_index\";s:2:\"58\";s:11:\"trend_index\";s:3:\"100\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:52;a:12:{s:2:\"id\";s:3:\"487\";s:5:\"title\";s:29:\"Landing Page &#8211; Vacation\";s:9:\"thumbnail\";s:65:\"https://library.elementor.com/wp-content/uploads/2016/10/0021.png\";s:12:\"tmpl_created\";s:10:\"1477388357\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:111:\"https://library.elementor.com/landing-page-vacation/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"54\";s:16:\"popularity_index\";s:2:\"20\";s:11:\"trend_index\";s:2:\"22\";s:6:\"is_pro\";s:1:\"0\";s:17:\"has_page_settings\";s:1:\"0\";}i:53;a:12:{s:2:\"id\";s:3:\"542\";s:5:\"title\";s:28:\"Landing Page &#8211; Wedding\";s:9:\"thumbnail\";s:65:\"https://library.elementor.com/wp-content/uploads/2016/10/0025.png\";s:12:\"tmpl_created\";s:10:\"1477388484\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:110:\"https://library.elementor.com/landing-page-wedding/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"55\";s:16:\"popularity_index\";s:2:\"33\";s:11:\"trend_index\";s:2:\"31\";s:6:\"is_pro\";s:1:\"0\";s:17:\"has_page_settings\";s:1:\"0\";}i:54;a:12:{s:2:\"id\";s:4:\"1187\";s:5:\"title\";s:32:\"Landing Page &#8211; Photography\";s:9:\"thumbnail\";s:66:\"https://library.elementor.com/wp-content/uploads/2017/03/lp1-l.png\";s:12:\"tmpl_created\";s:10:\"1490707385\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:114:\"https://library.elementor.com/landing-page-photography/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"56\";s:16:\"popularity_index\";s:2:\"24\";s:11:\"trend_index\";s:2:\"19\";s:6:\"is_pro\";s:1:\"0\";s:17:\"has_page_settings\";s:1:\"0\";}i:55;a:12:{s:2:\"id\";s:3:\"641\";s:5:\"title\";s:28:\"Landing Page &#8211; Fashion\";s:9:\"thumbnail\";s:81:\"https://library.elementor.com/wp-content/uploads/2016/12/fashion-landing-page.jpg\";s:12:\"tmpl_created\";s:10:\"1481549264\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:110:\"https://library.elementor.com/landing-page-fashion/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"57\";s:16:\"popularity_index\";s:2:\"46\";s:11:\"trend_index\";s:3:\"111\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:56;a:12:{s:2:\"id\";s:3:\"189\";s:5:\"title\";s:30:\"Landing Page &#8211; Tourism 1\";s:9:\"thumbnail\";s:65:\"https://library.elementor.com/wp-content/uploads/2016/08/0005.png\";s:12:\"tmpl_created\";s:10:\"1470820715\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:110:\"https://library.elementor.com/landing-page-tourism/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"58\";s:16:\"popularity_index\";s:1:\"9\";s:11:\"trend_index\";s:1:\"9\";s:6:\"is_pro\";s:1:\"0\";s:17:\"has_page_settings\";s:1:\"0\";}i:57;a:12:{s:2:\"id\";s:4:\"1547\";s:5:\"title\";s:30:\"Landing Page &#8211; Tourism 2\";s:9:\"thumbnail\";s:82:\"https://library.elementor.com/wp-content/uploads/2017/05/Landing-Page-Truism-1.png\";s:12:\"tmpl_created\";s:10:\"1494352115\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:112:\"https://library.elementor.com/landing-page-tourism-2/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"59\";s:16:\"popularity_index\";s:2:\"81\";s:11:\"trend_index\";s:3:\"127\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:58;a:12:{s:2:\"id\";s:4:\"1546\";s:5:\"title\";s:30:\"Landing Page &#8211; Tourism 3\";s:9:\"thumbnail\";s:82:\"https://library.elementor.com/wp-content/uploads/2017/05/Landing-Page-Truism-2.png\";s:12:\"tmpl_created\";s:10:\"1494352116\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:112:\"https://library.elementor.com/landing-page-tourism-3/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"60\";s:16:\"popularity_index\";s:2:\"97\";s:11:\"trend_index\";s:3:\"126\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:59;a:12:{s:2:\"id\";s:4:\"1545\";s:5:\"title\";s:30:\"Landing Page &#8211; Tourism 4\";s:9:\"thumbnail\";s:82:\"https://library.elementor.com/wp-content/uploads/2017/05/Landing-Page-Truism-3.png\";s:12:\"tmpl_created\";s:10:\"1494352118\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:112:\"https://library.elementor.com/landing-page-tourism-4/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"61\";s:16:\"popularity_index\";s:2:\"92\";s:11:\"trend_index\";s:3:\"103\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:60;a:12:{s:2:\"id\";s:4:\"2714\";s:5:\"title\";s:30:\"Landing Page &#8211; Tourism 5\";s:9:\"thumbnail\";s:86:\"https://library.elementor.com/wp-content/uploads/2017/11/Vacation-–-Landing-Page.png\";s:12:\"tmpl_created\";s:10:\"1509631782\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:112:\"https://library.elementor.com/landing-page-tourism-5/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"62\";s:16:\"popularity_index\";s:3:\"115\";s:11:\"trend_index\";s:2:\"62\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:61;a:12:{s:2:\"id\";s:4:\"1190\";s:5:\"title\";s:26:\"Landing Page &#8211; Hotel\";s:9:\"thumbnail\";s:66:\"https://library.elementor.com/wp-content/uploads/2017/03/lp2-l.png\";s:12:\"tmpl_created\";s:10:\"1490707391\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:108:\"https://library.elementor.com/landing-page-hotel/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"63\";s:16:\"popularity_index\";s:2:\"22\";s:11:\"trend_index\";s:2:\"23\";s:6:\"is_pro\";s:1:\"0\";s:17:\"has_page_settings\";s:1:\"0\";}i:62;a:12:{s:2:\"id\";s:3:\"195\";s:5:\"title\";s:28:\"Landing Page &#8211; Product\";s:9:\"thumbnail\";s:65:\"https://library.elementor.com/wp-content/uploads/2016/08/0006.png\";s:12:\"tmpl_created\";s:10:\"1470820765\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:110:\"https://library.elementor.com/landing-page-product/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"64\";s:16:\"popularity_index\";s:2:\"19\";s:11:\"trend_index\";s:2:\"26\";s:6:\"is_pro\";s:1:\"0\";s:17:\"has_page_settings\";s:1:\"0\";}i:63;a:12:{s:2:\"id\";s:3:\"197\";s:5:\"title\";s:34:\"Landing Page &#8211; Real Estate 1\";s:9:\"thumbnail\";s:65:\"https://library.elementor.com/wp-content/uploads/2016/08/0007.png\";s:12:\"tmpl_created\";s:10:\"1470825711\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:114:\"https://library.elementor.com/landing-page-real-estate/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"65\";s:16:\"popularity_index\";s:2:\"35\";s:11:\"trend_index\";s:2:\"37\";s:6:\"is_pro\";s:1:\"0\";s:17:\"has_page_settings\";s:1:\"0\";}i:64;a:12:{s:2:\"id\";s:4:\"1193\";s:5:\"title\";s:34:\"Landing Page &#8211; Real Estate 2\";s:9:\"thumbnail\";s:66:\"https://library.elementor.com/wp-content/uploads/2017/03/lp3-l.png\";s:12:\"tmpl_created\";s:10:\"1490707422\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:116:\"https://library.elementor.com/landing-page-real-estate-2/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"66\";s:16:\"popularity_index\";s:2:\"29\";s:11:\"trend_index\";s:2:\"25\";s:6:\"is_pro\";s:1:\"0\";s:17:\"has_page_settings\";s:1:\"0\";}i:65;a:12:{s:2:\"id\";s:4:\"1415\";s:5:\"title\";s:34:\"Landing Page &#8211; Real Estate 3\";s:9:\"thumbnail\";s:87:\"https://library.elementor.com/wp-content/uploads/2017/05/Landing-Page-Real-Estate-1.png\";s:12:\"tmpl_created\";s:10:\"1494352106\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:116:\"https://library.elementor.com/landing-page-real-estate-3/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"67\";s:16:\"popularity_index\";s:2:\"86\";s:11:\"trend_index\";s:2:\"92\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:66;a:12:{s:2:\"id\";s:4:\"1414\";s:5:\"title\";s:34:\"Landing Page &#8211; Real Estate 4\";s:9:\"thumbnail\";s:87:\"https://library.elementor.com/wp-content/uploads/2017/05/Landing-Page-Real-Estate-2.png\";s:12:\"tmpl_created\";s:10:\"1494352107\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:116:\"https://library.elementor.com/landing-page-real-estate-4/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"68\";s:16:\"popularity_index\";s:3:\"117\";s:11:\"trend_index\";s:3:\"105\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:67;a:12:{s:2:\"id\";s:4:\"1413\";s:5:\"title\";s:34:\"Landing Page &#8211; Real Estate 5\";s:9:\"thumbnail\";s:87:\"https://library.elementor.com/wp-content/uploads/2017/05/Landing-Page-Real-Estate-3.png\";s:12:\"tmpl_created\";s:10:\"1494352109\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:116:\"https://library.elementor.com/landing-page-real-estate-5/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:134:\"[\"agent\",\"business\",\"clean\",\"corporate\",\"flat\",\"google maps\",\"homes\",\"listing\",\"modern\",\"real estate\",\"realestate\",\"realtor\",\"realty\"]\";s:10:\"menu_order\";s:2:\"69\";s:16:\"popularity_index\";s:3:\"110\";s:11:\"trend_index\";s:2:\"85\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:68;a:12:{s:2:\"id\";s:4:\"1573\";s:5:\"title\";s:29:\"Landing Page &#8211; Coupon 1\";s:9:\"thumbnail\";s:70:\"https://library.elementor.com/wp-content/uploads/2017/05/Coupon-02.png\";s:12:\"tmpl_created\";s:10:\"1494352133\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:111:\"https://library.elementor.com/landing-page-coupon-1/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"70\";s:16:\"popularity_index\";s:3:\"114\";s:11:\"trend_index\";s:3:\"129\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:69;a:12:{s:2:\"id\";s:4:\"1572\";s:5:\"title\";s:29:\"Landing Page &#8211; Coupon 2\";s:9:\"thumbnail\";s:70:\"https://library.elementor.com/wp-content/uploads/2017/05/Coupon-03.png\";s:12:\"tmpl_created\";s:10:\"1494352134\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:111:\"https://library.elementor.com/landing-page-coupon-2/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"71\";s:16:\"popularity_index\";s:3:\"123\";s:11:\"trend_index\";s:3:\"128\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:70;a:12:{s:2:\"id\";s:4:\"1570\";s:5:\"title\";s:29:\"Landing Page &#8211; Coupon 3\";s:9:\"thumbnail\";s:70:\"https://library.elementor.com/wp-content/uploads/2017/05/Coupon-01.png\";s:12:\"tmpl_created\";s:10:\"1494352136\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:111:\"https://library.elementor.com/landing-page-coupon-3/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"72\";s:16:\"popularity_index\";s:3:\"131\";s:11:\"trend_index\";s:1:\"0\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:71;a:12:{s:2:\"id\";s:4:\"1571\";s:5:\"title\";s:29:\"Landing Page &#8211; Coupon 4\";s:9:\"thumbnail\";s:70:\"https://library.elementor.com/wp-content/uploads/2017/05/Coupon-04.png\";s:12:\"tmpl_created\";s:10:\"1494352138\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:111:\"https://library.elementor.com/landing-page-coupon-4/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"73\";s:16:\"popularity_index\";s:3:\"120\";s:11:\"trend_index\";s:1:\"0\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:72;a:12:{s:2:\"id\";s:3:\"192\";s:5:\"title\";s:28:\"Landing Page &#8211; Webinar\";s:9:\"thumbnail\";s:65:\"https://library.elementor.com/wp-content/uploads/2016/08/0015.png\";s:12:\"tmpl_created\";s:10:\"1470820734\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:110:\"https://library.elementor.com/landing-page-webinar/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"74\";s:16:\"popularity_index\";s:2:\"28\";s:11:\"trend_index\";s:2:\"36\";s:6:\"is_pro\";s:1:\"0\";s:17:\"has_page_settings\";s:1:\"0\";}i:73;a:12:{s:2:\"id\";s:4:\"2141\";s:5:\"title\";s:32:\"Contact &#8211; Delivery Company\";s:9:\"thumbnail\";s:77:\"https://library.elementor.com/wp-content/uploads/2017/07/delivery-contact.png\";s:12:\"tmpl_created\";s:10:\"1499774122\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:114:\"https://library.elementor.com/contact-delivery-company/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"75\";s:16:\"popularity_index\";s:2:\"78\";s:11:\"trend_index\";s:2:\"71\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:74;a:12:{s:2:\"id\";s:3:\"137\";s:5:\"title\";s:22:\"Contact &#8211; Modern\";s:9:\"thumbnail\";s:65:\"https://library.elementor.com/wp-content/uploads/2016/08/0013.png\";s:12:\"tmpl_created\";s:10:\"1470829828\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:104:\"https://library.elementor.com/contact-modern/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"76\";s:16:\"popularity_index\";s:2:\"25\";s:11:\"trend_index\";s:2:\"24\";s:6:\"is_pro\";s:1:\"0\";s:17:\"has_page_settings\";s:1:\"0\";}i:75;a:12:{s:2:\"id\";s:3:\"256\";s:5:\"title\";s:26:\"Contact &#8211; Restaurant\";s:9:\"thumbnail\";s:65:\"https://library.elementor.com/wp-content/uploads/2016/08/0011.png\";s:12:\"tmpl_created\";s:10:\"1470829796\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:108:\"https://library.elementor.com/contact-restaurant/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"77\";s:16:\"popularity_index\";s:2:\"36\";s:11:\"trend_index\";s:2:\"38\";s:6:\"is_pro\";s:1:\"0\";s:17:\"has_page_settings\";s:1:\"0\";}i:76;a:12:{s:2:\"id\";s:4:\"2150\";s:5:\"title\";s:25:\"Contact &#8211; Cake Shop\";s:9:\"thumbnail\";s:73:\"https://library.elementor.com/wp-content/uploads/2017/07/cake-contact.png\";s:12:\"tmpl_created\";s:10:\"1499774127\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:107:\"https://library.elementor.com/contact-cake-shop/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"78\";s:16:\"popularity_index\";s:2:\"40\";s:11:\"trend_index\";s:2:\"33\";s:6:\"is_pro\";s:1:\"0\";s:17:\"has_page_settings\";s:1:\"0\";}i:77;a:12:{s:2:\"id\";s:3:\"223\";s:5:\"title\";s:17:\"Contact – Hotel\";s:9:\"thumbnail\";s:65:\"https://library.elementor.com/wp-content/uploads/2016/08/0002.png\";s:12:\"tmpl_created\";s:10:\"1470820471\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:103:\"https://library.elementor.com/contact-hotel/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"79\";s:16:\"popularity_index\";s:2:\"37\";s:11:\"trend_index\";s:2:\"40\";s:6:\"is_pro\";s:1:\"0\";s:17:\"has_page_settings\";s:1:\"0\";}i:78;a:12:{s:2:\"id\";s:2:\"24\";s:5:\"title\";s:25:\"Contact &#8211; Corporate\";s:9:\"thumbnail\";s:65:\"https://library.elementor.com/wp-content/uploads/2016/08/0012.png\";s:12:\"tmpl_created\";s:10:\"1470248619\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:107:\"https://library.elementor.com/contact-corporate/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"80\";s:16:\"popularity_index\";s:2:\"10\";s:11:\"trend_index\";s:2:\"12\";s:6:\"is_pro\";s:1:\"0\";s:17:\"has_page_settings\";s:1:\"0\";}i:79;a:12:{s:2:\"id\";s:3:\"184\";s:5:\"title\";s:23:\"Services &#8211; Moving\";s:9:\"thumbnail\";s:65:\"https://library.elementor.com/wp-content/uploads/2016/08/0017.png\";s:12:\"tmpl_created\";s:10:\"1470829889\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:105:\"https://library.elementor.com/services-moving/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"81\";s:16:\"popularity_index\";s:2:\"17\";s:11:\"trend_index\";s:2:\"20\";s:6:\"is_pro\";s:1:\"0\";s:17:\"has_page_settings\";s:1:\"0\";}i:80;a:12:{s:2:\"id\";s:3:\"625\";s:5:\"title\";s:31:\"Services &#8211; Cake Shop Menu\";s:9:\"thumbnail\";s:75:\"https://library.elementor.com/wp-content/uploads/2016/12/cake-shop-menu.jpg\";s:12:\"tmpl_created\";s:10:\"1481549196\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:113:\"https://library.elementor.com/services-cake-shop-menu/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"82\";s:16:\"popularity_index\";s:2:\"93\";s:11:\"trend_index\";s:1:\"0\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:81;a:12:{s:2:\"id\";s:3:\"187\";s:5:\"title\";s:20:\"Services &#8211; Fun\";s:9:\"thumbnail\";s:65:\"https://library.elementor.com/wp-content/uploads/2016/08/0001.png\";s:12:\"tmpl_created\";s:10:\"1470829892\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:102:\"https://library.elementor.com/services-fun/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"83\";s:16:\"popularity_index\";s:2:\"26\";s:11:\"trend_index\";s:2:\"35\";s:6:\"is_pro\";s:1:\"0\";s:17:\"has_page_settings\";s:1:\"0\";}i:82;a:12:{s:2:\"id\";s:3:\"238\";s:5:\"title\";s:27:\"Services &#8211; Consulting\";s:9:\"thumbnail\";s:65:\"https://library.elementor.com/wp-content/uploads/2016/08/0014.png\";s:12:\"tmpl_created\";s:10:\"1470829865\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:109:\"https://library.elementor.com/services-consulting/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"84\";s:16:\"popularity_index\";s:2:\"14\";s:11:\"trend_index\";s:2:\"13\";s:6:\"is_pro\";s:1:\"0\";s:17:\"has_page_settings\";s:1:\"0\";}i:83;a:12:{s:2:\"id\";s:3:\"647\";s:5:\"title\";s:33:\"Services &#8211; Coffee Shop Menu\";s:9:\"thumbnail\";s:76:\"https://library.elementor.com/wp-content/uploads/2016/12/restaurant-menu.jpg\";s:12:\"tmpl_created\";s:10:\"1481549320\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:115:\"https://library.elementor.com/services-coffee-shop-menu/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"85\";s:16:\"popularity_index\";s:2:\"90\";s:11:\"trend_index\";s:3:\"121\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:84;a:12:{s:2:\"id\";s:4:\"2138\";s:5:\"title\";s:33:\"Services &#8211; Delivery Company\";s:9:\"thumbnail\";s:78:\"https://library.elementor.com/wp-content/uploads/2017/07/delivery-services.png\";s:12:\"tmpl_created\";s:10:\"1499774119\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:115:\"https://library.elementor.com/services-delivery-company/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"86\";s:16:\"popularity_index\";s:3:\"101\";s:11:\"trend_index\";s:2:\"70\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:85;a:12:{s:2:\"id\";s:3:\"823\";s:5:\"title\";s:19:\"Pricing &#8211; App\";s:9:\"thumbnail\";s:72:\"https://library.elementor.com/wp-content/uploads/2017/01/pricing-app.jpg\";s:12:\"tmpl_created\";s:10:\"1485272966\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:103:\"https://library.elementor.com/pricing-app-2/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"87\";s:16:\"popularity_index\";s:2:\"67\";s:11:\"trend_index\";s:2:\"79\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:86;a:12:{s:2:\"id\";s:3:\"824\";s:5:\"title\";s:24:\"Pricing &#8211; Software\";s:9:\"thumbnail\";s:77:\"https://library.elementor.com/wp-content/uploads/2017/01/pricing-software.png\";s:12:\"tmpl_created\";s:10:\"1485272900\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:108:\"https://library.elementor.com/pricing-software-2/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"88\";s:16:\"popularity_index\";s:2:\"79\";s:11:\"trend_index\";s:3:\"114\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:87;a:12:{s:2:\"id\";s:3:\"825\";s:5:\"title\";s:24:\"Product &#8211; Speakers\";s:9:\"thumbnail\";s:73:\"https://library.elementor.com/wp-content/uploads/2017/01/product-page.jpg\";s:12:\"tmpl_created\";s:10:\"1485272513\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:106:\"https://library.elementor.com/product-speakers/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"89\";s:16:\"popularity_index\";s:2:\"76\";s:11:\"trend_index\";s:3:\"122\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:88;a:12:{s:2:\"id\";s:3:\"245\";s:5:\"title\";s:21:\"Product &#8211; Clean\";s:9:\"thumbnail\";s:65:\"https://library.elementor.com/wp-content/uploads/2016/08/0020.png\";s:12:\"tmpl_created\";s:10:\"1470829876\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:103:\"https://library.elementor.com/product-clean/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:48:\"[\"fast\",\"minimal\",\"minimalistic\",\"seo\",\"simple\"]\";s:10:\"menu_order\";s:2:\"90\";s:16:\"popularity_index\";s:2:\"30\";s:11:\"trend_index\";s:2:\"28\";s:6:\"is_pro\";s:1:\"0\";s:17:\"has_page_settings\";s:1:\"0\";}i:89;a:12:{s:2:\"id\";s:3:\"150\";s:5:\"title\";s:19:\"Product &#8211; App\";s:9:\"thumbnail\";s:65:\"https://library.elementor.com/wp-content/uploads/2016/08/0003.png\";s:12:\"tmpl_created\";s:10:\"1470829879\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:101:\"https://library.elementor.com/product-app/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"91\";s:16:\"popularity_index\";s:2:\"16\";s:11:\"trend_index\";s:2:\"16\";s:6:\"is_pro\";s:1:\"0\";s:17:\"has_page_settings\";s:1:\"0\";}i:90;a:12:{s:2:\"id\";s:3:\"751\";s:5:\"title\";s:25:\"Homepage &#8211; Interior\";s:9:\"thumbnail\";s:74:\"https://library.elementor.com/wp-content/uploads/2017/01/interior-home.png\";s:12:\"tmpl_created\";s:10:\"1485269743\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:107:\"https://library.elementor.com/homepage-interior/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"92\";s:16:\"popularity_index\";s:2:\"57\";s:11:\"trend_index\";s:2:\"75\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:91;a:12:{s:2:\"id\";s:3:\"753\";s:5:\"title\";s:22:\"About &#8211; Interior\";s:9:\"thumbnail\";s:75:\"https://library.elementor.com/wp-content/uploads/2017/01/Interior-About.png\";s:12:\"tmpl_created\";s:10:\"1485269710\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:104:\"https://library.elementor.com/about-interior/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"93\";s:16:\"popularity_index\";s:2:\"72\";s:11:\"trend_index\";s:3:\"109\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:92;a:12:{s:2:\"id\";s:3:\"754\";s:5:\"title\";s:25:\"Services &#8211; Interior\";s:9:\"thumbnail\";s:78:\"https://library.elementor.com/wp-content/uploads/2017/01/Interior-Services.png\";s:12:\"tmpl_created\";s:10:\"1485269691\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:107:\"https://library.elementor.com/services-interior/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"94\";s:16:\"popularity_index\";s:2:\"87\";s:11:\"trend_index\";s:2:\"78\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:93;a:12:{s:2:\"id\";s:3:\"752\";s:5:\"title\";s:24:\"Contact &#8211; Interior\";s:9:\"thumbnail\";s:77:\"https://library.elementor.com/wp-content/uploads/2017/01/interior-contact.png\";s:12:\"tmpl_created\";s:10:\"1485269737\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:106:\"https://library.elementor.com/contact-interior/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"95\";s:16:\"popularity_index\";s:2:\"77\";s:11:\"trend_index\";s:2:\"67\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:94;a:12:{s:2:\"id\";s:4:\"1075\";s:5:\"title\";s:19:\"Shop &#8211; Sweets\";s:9:\"thumbnail\";s:67:\"https://library.elementor.com/wp-content/uploads/2017/03/Sweets.png\";s:12:\"tmpl_created\";s:10:\"1488810871\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:101:\"https://library.elementor.com/shop-sweets/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:154:\"[\"bakery\",\"beverage\",\"business\",\"cafe\",\"candy bar\",\"catering\",\"delivery service\",\"Food\",\"online shop\",\"pastry\",\"Restaurant\",\"store\",\"sweet shop\",\"sweets\"]\";s:10:\"menu_order\";s:2:\"96\";s:16:\"popularity_index\";s:2:\"31\";s:11:\"trend_index\";s:2:\"29\";s:6:\"is_pro\";s:1:\"0\";s:17:\"has_page_settings\";s:1:\"0\";}i:95;a:12:{s:2:\"id\";s:4:\"1051\";s:5:\"title\";s:24:\"Blog Post &#8211; Launch\";s:9:\"thumbnail\";s:71:\"https://library.elementor.com/wp-content/uploads/2017/03/post-cloud.png\";s:12:\"tmpl_created\";s:10:\"1488810869\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:106:\"https://library.elementor.com/blog-post-launch/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:210:\"[\"Agency\",\"bootstrap\",\"business\",\"corporate\",\"Landing Page\",\"launch\",\"marketing campaign\",\"marketing landing page\",\"marketing template landing page\",\"product launch\",\"software\",\"Startup\",\"startup landing page\"]\";s:10:\"menu_order\";s:2:\"97\";s:16:\"popularity_index\";s:2:\"23\";s:11:\"trend_index\";s:2:\"14\";s:6:\"is_pro\";s:1:\"0\";s:17:\"has_page_settings\";s:1:\"0\";}i:96;a:12:{s:2:\"id\";s:4:\"1245\";s:5:\"title\";s:13:\"Coming Soon 1\";s:9:\"thumbnail\";s:74:\"https://library.elementor.com/wp-content/uploads/2017/03/Coming-Soon-1.png\";s:12:\"tmpl_created\";s:10:\"1491207184\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:103:\"https://library.elementor.com/coming-soon-1/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"98\";s:16:\"popularity_index\";s:2:\"70\";s:11:\"trend_index\";s:2:\"77\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:97;a:12:{s:2:\"id\";s:4:\"1247\";s:5:\"title\";s:13:\"Coming Soon 2\";s:9:\"thumbnail\";s:74:\"https://library.elementor.com/wp-content/uploads/2017/03/Coming-Soon-2.png\";s:12:\"tmpl_created\";s:10:\"1491207138\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:103:\"https://library.elementor.com/coming-soon-2/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:2:\"99\";s:16:\"popularity_index\";s:2:\"27\";s:11:\"trend_index\";s:2:\"27\";s:6:\"is_pro\";s:1:\"0\";s:17:\"has_page_settings\";s:1:\"0\";}i:98;a:12:{s:2:\"id\";s:4:\"1248\";s:5:\"title\";s:13:\"Coming Soon 3\";s:9:\"thumbnail\";s:74:\"https://library.elementor.com/wp-content/uploads/2017/03/Coming-Soon-3.png\";s:12:\"tmpl_created\";s:10:\"1491207050\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:103:\"https://library.elementor.com/coming-soon-3/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:3:\"100\";s:16:\"popularity_index\";s:2:\"89\";s:11:\"trend_index\";s:2:\"96\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:99;a:12:{s:2:\"id\";s:4:\"1249\";s:5:\"title\";s:13:\"Coming Soon 4\";s:9:\"thumbnail\";s:74:\"https://library.elementor.com/wp-content/uploads/2017/03/Coming-Soon-4.png\";s:12:\"tmpl_created\";s:10:\"1491207380\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:103:\"https://library.elementor.com/coming-soon-4/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:3:\"101\";s:16:\"popularity_index\";s:3:\"113\";s:11:\"trend_index\";s:1:\"0\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:100;a:12:{s:2:\"id\";s:4:\"1250\";s:5:\"title\";s:13:\"Coming Soon 5\";s:9:\"thumbnail\";s:74:\"https://library.elementor.com/wp-content/uploads/2017/03/Coming-Soon-5.png\";s:12:\"tmpl_created\";s:10:\"1491207450\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:103:\"https://library.elementor.com/coming-soon-5/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:3:\"102\";s:16:\"popularity_index\";s:2:\"32\";s:11:\"trend_index\";s:2:\"32\";s:6:\"is_pro\";s:1:\"0\";s:17:\"has_page_settings\";s:1:\"0\";}i:101;a:12:{s:2:\"id\";s:4:\"1260\";s:5:\"title\";s:13:\"Coming Soon 6\";s:9:\"thumbnail\";s:74:\"https://library.elementor.com/wp-content/uploads/2017/03/Coming-Soon-6.png\";s:12:\"tmpl_created\";s:10:\"1491207507\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:103:\"https://library.elementor.com/coming-soon-6/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:3:\"103\";s:16:\"popularity_index\";s:3:\"108\";s:11:\"trend_index\";s:3:\"112\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:102;a:12:{s:2:\"id\";s:4:\"1261\";s:5:\"title\";s:13:\"Coming Soon 7\";s:9:\"thumbnail\";s:74:\"https://library.elementor.com/wp-content/uploads/2017/04/Coming-Soon-7.png\";s:12:\"tmpl_created\";s:10:\"1491207584\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:103:\"https://library.elementor.com/coming-soon-7/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:3:\"104\";s:16:\"popularity_index\";s:2:\"34\";s:11:\"trend_index\";s:2:\"30\";s:6:\"is_pro\";s:1:\"0\";s:17:\"has_page_settings\";s:1:\"0\";}i:103;a:12:{s:2:\"id\";s:4:\"1272\";s:5:\"title\";s:13:\"Coming Soon 8\";s:9:\"thumbnail\";s:74:\"https://library.elementor.com/wp-content/uploads/2017/03/Coming-Soon-8.png\";s:12:\"tmpl_created\";s:10:\"1491207674\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:103:\"https://library.elementor.com/coming-soon-8/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:3:\"105\";s:16:\"popularity_index\";s:2:\"61\";s:11:\"trend_index\";s:2:\"82\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:104;a:12:{s:2:\"id\";s:4:\"1279\";s:5:\"title\";s:13:\"Coming Soon 9\";s:9:\"thumbnail\";s:74:\"https://library.elementor.com/wp-content/uploads/2017/03/Coming-Soon-9.png\";s:12:\"tmpl_created\";s:10:\"1491207756\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:103:\"https://library.elementor.com/coming-soon-9/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:3:\"106\";s:16:\"popularity_index\";s:2:\"39\";s:11:\"trend_index\";s:2:\"42\";s:6:\"is_pro\";s:1:\"0\";s:17:\"has_page_settings\";s:1:\"0\";}i:105;a:12:{s:2:\"id\";s:4:\"1745\";s:5:\"title\";s:14:\"Coming Soon 10\";s:9:\"thumbnail\";s:70:\"https://library.elementor.com/wp-content/uploads/2017/05/login-002.png\";s:12:\"tmpl_created\";s:10:\"1494849745\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:104:\"https://library.elementor.com/coming-soon-10/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:3:\"107\";s:16:\"popularity_index\";s:2:\"64\";s:11:\"trend_index\";s:2:\"54\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:106;a:12:{s:2:\"id\";s:4:\"1742\";s:5:\"title\";s:12:\"Login Page 1\";s:9:\"thumbnail\";s:70:\"https://library.elementor.com/wp-content/uploads/2017/05/login-003.png\";s:12:\"tmpl_created\";s:10:\"1494849744\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:100:\"https://library.elementor.com/login-page/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:3:\"108\";s:16:\"popularity_index\";s:2:\"98\";s:11:\"trend_index\";s:3:\"115\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:107;a:12:{s:2:\"id\";s:4:\"1748\";s:5:\"title\";s:12:\"Login Page 2\";s:9:\"thumbnail\";s:70:\"https://library.elementor.com/wp-content/uploads/2017/05/login-001.png\";s:12:\"tmpl_created\";s:10:\"1494849742\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:102:\"https://library.elementor.com/login-page-2/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:3:\"109\";s:16:\"popularity_index\";s:2:\"60\";s:11:\"trend_index\";s:2:\"66\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:108;a:12:{s:2:\"id\";s:4:\"3963\";s:5:\"title\";s:32:\"Restaurant Site &#8211; Homepage\";s:9:\"thumbnail\";s:76:\"https://library.elementor.com/wp-content/uploads/2018/01/R.HomepageThumb.png\";s:12:\"tmpl_created\";s:10:\"1516284821\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:114:\"https://library.elementor.com/restaurant-site-homepage/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:3:\"110\";s:16:\"popularity_index\";s:3:\"126\";s:11:\"trend_index\";s:2:\"51\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:109;a:12:{s:2:\"id\";s:4:\"3969\";s:5:\"title\";s:28:\"Restaurant Site &#8211; Menu\";s:9:\"thumbnail\";s:72:\"https://library.elementor.com/wp-content/uploads/2018/01/R.MenuThumb.png\";s:12:\"tmpl_created\";s:10:\"1516284829\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:110:\"https://library.elementor.com/restaurant-site-menu/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:3:\"111\";s:16:\"popularity_index\";s:3:\"138\";s:11:\"trend_index\";s:3:\"106\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:110;a:12:{s:2:\"id\";s:4:\"3966\";s:5:\"title\";s:29:\"Restaurant Site &#8211; About\";s:9:\"thumbnail\";s:77:\"https://library.elementor.com/wp-content/uploads/2018/01/R.AboutThumb.png.png\";s:12:\"tmpl_created\";s:10:\"1516284839\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:111:\"https://library.elementor.com/restaurant-site-about/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:3:\"112\";s:16:\"popularity_index\";s:3:\"134\";s:11:\"trend_index\";s:2:\"43\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:111;a:12:{s:2:\"id\";s:4:\"3972\";s:5:\"title\";s:31:\"Restaurant Site &#8211; Contact\";s:9:\"thumbnail\";s:75:\"https://library.elementor.com/wp-content/uploads/2018/01/R.ContactThumb.png\";s:12:\"tmpl_created\";s:10:\"1516284847\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:113:\"https://library.elementor.com/restaurant-site-contact/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:3:\"113\";s:16:\"popularity_index\";s:3:\"136\";s:11:\"trend_index\";s:2:\"61\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:112;a:12:{s:2:\"id\";s:4:\"2080\";s:5:\"title\";s:27:\"Ski Resort &#8211; Homepage\";s:9:\"thumbnail\";s:81:\"https://library.elementor.com/wp-content/uploads/2017/10/Ski-Resort-Home-Page.png\";s:12:\"tmpl_created\";s:10:\"1508161124\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:109:\"https://library.elementor.com/ski-resort-homepage/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:3:\"114\";s:16:\"popularity_index\";s:2:\"94\";s:11:\"trend_index\";s:2:\"45\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:113;a:12:{s:2:\"id\";s:4:\"2088\";s:5:\"title\";s:24:\"Ski Resort &#8211; About\";s:9:\"thumbnail\";s:77:\"https://library.elementor.com/wp-content/uploads/2017/10/Ski-Resort-About.png\";s:12:\"tmpl_created\";s:10:\"1508161129\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:106:\"https://library.elementor.com/ski-resort-about/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:3:\"115\";s:16:\"popularity_index\";s:3:\"127\";s:11:\"trend_index\";s:3:\"113\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:114;a:12:{s:2:\"id\";s:4:\"2085\";s:5:\"title\";s:27:\"Ski Resort &#8211; Services\";s:9:\"thumbnail\";s:80:\"https://library.elementor.com/wp-content/uploads/2017/10/Ski-Resort-Services.png\";s:12:\"tmpl_created\";s:10:\"1508161134\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:109:\"https://library.elementor.com/ski-resort-services/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:3:\"116\";s:16:\"popularity_index\";s:3:\"129\";s:11:\"trend_index\";s:2:\"99\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:115;a:12:{s:2:\"id\";s:4:\"2462\";s:5:\"title\";s:19:\"Architect – About\";s:9:\"thumbnail\";s:80:\"https://library.elementor.com/wp-content/uploads/2017/10/architect-–-about.png\";s:12:\"tmpl_created\";s:10:\"1508243317\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:105:\"https://library.elementor.com/architect-about/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:3:\"117\";s:16:\"popularity_index\";s:3:\"116\";s:11:\"trend_index\";s:2:\"68\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:116;a:12:{s:2:\"id\";s:4:\"2362\";s:5:\"title\";s:26:\"Architect &#8211; Projects\";s:9:\"thumbnail\";s:79:\"https://library.elementor.com/wp-content/uploads/2017/10/Architect-Projects.png\";s:12:\"tmpl_created\";s:10:\"1508243335\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:108:\"https://library.elementor.com/architect-projects/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:3:\"118\";s:16:\"popularity_index\";s:3:\"121\";s:11:\"trend_index\";s:2:\"84\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:117;a:12:{s:2:\"id\";s:3:\"614\";s:5:\"title\";s:25:\"Architect &#8211; Contact\";s:9:\"thumbnail\";s:78:\"https://library.elementor.com/wp-content/uploads/2016/12/architect-contact.jpg\";s:12:\"tmpl_created\";s:10:\"1481549169\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:107:\"https://library.elementor.com/architect-contact/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:3:\"119\";s:16:\"popularity_index\";s:2:\"49\";s:11:\"trend_index\";s:2:\"64\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:118;a:12:{s:2:\"id\";s:4:\"2126\";s:5:\"title\";s:37:\"Construction Company &#8211; Homepage\";s:9:\"thumbnail\";s:91:\"https://library.elementor.com/wp-content/uploads/2017/10/Construction-Company-Home-Page.png\";s:12:\"tmpl_created\";s:10:\"1508325849\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:119:\"https://library.elementor.com/construction-company-homepage/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:3:\"120\";s:16:\"popularity_index\";s:2:\"91\";s:11:\"trend_index\";s:2:\"86\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:119;a:12:{s:2:\"id\";s:4:\"2129\";s:5:\"title\";s:34:\"Construction Company &#8211; About\";s:9:\"thumbnail\";s:87:\"https://library.elementor.com/wp-content/uploads/2017/10/Construction-Company-About.png\";s:12:\"tmpl_created\";s:10:\"1508325881\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:116:\"https://library.elementor.com/construction-company-about/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:3:\"121\";s:16:\"popularity_index\";s:3:\"109\";s:11:\"trend_index\";s:2:\"76\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:120;a:12:{s:2:\"id\";s:4:\"2135\";s:5:\"title\";s:36:\"Construction Company &#8211; Contact\";s:9:\"thumbnail\";s:89:\"https://library.elementor.com/wp-content/uploads/2017/10/Construction-Company-Contact.png\";s:12:\"tmpl_created\";s:10:\"1508325922\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:118:\"https://library.elementor.com/construction-company-contact/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:3:\"122\";s:16:\"popularity_index\";s:3:\"112\";s:11:\"trend_index\";s:3:\"108\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:121;a:12:{s:2:\"id\";s:4:\"2094\";s:5:\"title\";s:28:\"Plants Shop &#8211; Homepage\";s:9:\"thumbnail\";s:77:\"https://library.elementor.com/wp-content/uploads/2017/11/Plants-Shop-Home.png\";s:12:\"tmpl_created\";s:10:\"1509621053\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:110:\"https://library.elementor.com/plants-shop-homepage/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:3:\"123\";s:16:\"popularity_index\";s:3:\"111\";s:11:\"trend_index\";s:3:\"102\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:122;a:12:{s:2:\"id\";s:4:\"2120\";s:5:\"title\";s:25:\"Plants Shop &#8211; About\";s:9:\"thumbnail\";s:78:\"https://library.elementor.com/wp-content/uploads/2017/11/Plants-Shop-About.png\";s:12:\"tmpl_created\";s:10:\"1509631820\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:107:\"https://library.elementor.com/plants-shop-about/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:3:\"124\";s:16:\"popularity_index\";s:3:\"104\";s:11:\"trend_index\";s:2:\"72\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"1\";}i:123;a:12:{s:2:\"id\";s:4:\"3619\";s:5:\"title\";s:31:\"Snowboard Site &#8211; Homepage\";s:9:\"thumbnail\";s:65:\"https://library.elementor.com/wp-content/uploads/2017/12/home.png\";s:12:\"tmpl_created\";s:10:\"1513513137\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:113:\"https://library.elementor.com/snowboard-site-homepage/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:3:\"125\";s:16:\"popularity_index\";s:3:\"124\";s:11:\"trend_index\";s:2:\"65\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:124;a:12:{s:2:\"id\";s:4:\"3632\";s:5:\"title\";s:31:\"Snowboard Site &#8211; Services\";s:9:\"thumbnail\";s:62:\"https://library.elementor.com/wp-content/uploads/2017/12/2.png\";s:12:\"tmpl_created\";s:10:\"1513513171\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:113:\"https://library.elementor.com/snowboard-site-services/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:3:\"126\";s:16:\"popularity_index\";s:3:\"125\";s:11:\"trend_index\";s:3:\"130\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:125;a:12:{s:2:\"id\";s:4:\"3626\";s:5:\"title\";s:30:\"Snowboard Site &#8211; Contact\";s:9:\"thumbnail\";s:62:\"https://library.elementor.com/wp-content/uploads/2017/12/3.png\";s:12:\"tmpl_created\";s:10:\"1513513193\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:112:\"https://library.elementor.com/snowboard-site-contact/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:3:\"127\";s:16:\"popularity_index\";s:3:\"118\";s:11:\"trend_index\";s:2:\"58\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:126;a:12:{s:2:\"id\";s:4:\"3153\";s:5:\"title\";s:14:\"Halloween Pack\";s:9:\"thumbnail\";s:70:\"https://library.elementor.com/wp-content/uploads/2017/10/halloween.png\";s:12:\"tmpl_created\";s:10:\"1508950132\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:104:\"https://library.elementor.com/halloween-pack/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:3:\"128\";s:16:\"popularity_index\";s:3:\"122\";s:11:\"trend_index\";s:1:\"0\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:127;a:12:{s:2:\"id\";s:4:\"3338\";s:5:\"title\";s:34:\"Black Friday &#8211; Nature Set​\";s:9:\"thumbnail\";s:75:\"https://library.elementor.com/wp-content/uploads/2017/11/black-friday-1.png\";s:12:\"tmpl_created\";s:10:\"1511203351\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:113:\"https://library.elementor.com/black-friday-nature-set/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:3:\"129\";s:16:\"popularity_index\";s:3:\"119\";s:11:\"trend_index\";s:3:\"125\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:128;a:12:{s:2:\"id\";s:4:\"3339\";s:5:\"title\";s:35:\"Black Friday &#8211; Pop-Styled Set\";s:9:\"thumbnail\";s:75:\"https://library.elementor.com/wp-content/uploads/2017/11/black-friday-2.png\";s:12:\"tmpl_created\";s:10:\"1511203636\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:117:\"https://library.elementor.com/black-friday-pop-styled-set/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:3:\"130\";s:16:\"popularity_index\";s:2:\"96\";s:11:\"trend_index\";s:3:\"118\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"1\";}i:129;a:12:{s:2:\"id\";s:4:\"3335\";s:5:\"title\";s:31:\"Black Friday &#8211; Retail Set\";s:9:\"thumbnail\";s:75:\"https://library.elementor.com/wp-content/uploads/2017/11/black-friday-4.png\";s:12:\"tmpl_created\";s:10:\"1511203246\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:113:\"https://library.elementor.com/black-friday-retail-set/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:3:\"131\";s:16:\"popularity_index\";s:3:\"106\";s:11:\"trend_index\";s:2:\"90\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:130;a:12:{s:2:\"id\";s:4:\"3340\";s:5:\"title\";s:41:\"Black Friday &#8211; Software Product Set\";s:9:\"thumbnail\";s:75:\"https://library.elementor.com/wp-content/uploads/2017/11/black-friday-3.png\";s:12:\"tmpl_created\";s:10:\"1511203713\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:123:\"https://library.elementor.com/black-friday-software-product-set/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:3:\"132\";s:16:\"popularity_index\";s:3:\"107\";s:11:\"trend_index\";s:2:\"74\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:131;a:12:{s:2:\"id\";s:4:\"3517\";s:5:\"title\";s:27:\"Christmas &#8211; Gift Shop\";s:9:\"thumbnail\";s:70:\"https://library.elementor.com/wp-content/uploads/2017/12/XmasThumb.png\";s:12:\"tmpl_created\";s:10:\"1513877937\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:109:\"https://library.elementor.com/christmas-gift-shop/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:3:\"133\";s:16:\"popularity_index\";s:3:\"132\";s:11:\"trend_index\";s:3:\"119\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:132;a:12:{s:2:\"id\";s:4:\"3734\";s:5:\"title\";s:28:\"Christmas &#8211; Car Agency\";s:9:\"thumbnail\";s:73:\"https://library.elementor.com/wp-content/uploads/2017/12/cover-lib-v3.png\";s:12:\"tmpl_created\";s:10:\"1514197794\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:110:\"https://library.elementor.com/christmas-car-agency/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:3:\"134\";s:16:\"popularity_index\";s:3:\"135\";s:11:\"trend_index\";s:1:\"0\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:133;a:12:{s:2:\"id\";s:4:\"3764\";s:5:\"title\";s:33:\"Christmas &#8211; Interior Design\";s:9:\"thumbnail\";s:73:\"https://library.elementor.com/wp-content/uploads/2017/12/cover-lib-v6.png\";s:12:\"tmpl_created\";s:10:\"1514198234\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:115:\"https://library.elementor.com/christmas-interior-design/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:3:\"135\";s:16:\"popularity_index\";s:3:\"137\";s:11:\"trend_index\";s:1:\"0\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:134;a:12:{s:2:\"id\";s:4:\"3565\";s:5:\"title\";s:27:\"Christmas &#8211; Tree Shop\";s:9:\"thumbnail\";s:74:\"https://library.elementor.com/wp-content/uploads/2017/12/XmasTreeThumb.png\";s:12:\"tmpl_created\";s:10:\"1514204382\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:109:\"https://library.elementor.com/christmas-tree-shop/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:3:\"136\";s:16:\"popularity_index\";s:3:\"133\";s:11:\"trend_index\";s:3:\"120\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:135;a:12:{s:2:\"id\";s:4:\"3862\";s:5:\"title\";s:35:\"Christmas &#8211; Design Conference\";s:9:\"thumbnail\";s:63:\"https://library.elementor.com/wp-content/uploads/2017/12/q1.png\";s:12:\"tmpl_created\";s:10:\"1514206745\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:117:\"https://library.elementor.com/christmas-design-conference/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:3:\"137\";s:16:\"popularity_index\";s:3:\"130\";s:11:\"trend_index\";s:3:\"131\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:136;a:12:{s:2:\"id\";s:4:\"3777\";s:5:\"title\";s:39:\"Christmas &#8211; Snowboard Competition\";s:9:\"thumbnail\";s:73:\"https://library.elementor.com/wp-content/uploads/2017/12/cover-lib-v7.png\";s:12:\"tmpl_created\";s:10:\"1514205420\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:121:\"https://library.elementor.com/christmas-snowboard-competition/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:3:\"138\";s:16:\"popularity_index\";s:3:\"128\";s:11:\"trend_index\";s:2:\"50\";s:6:\"is_pro\";s:1:\"1\";s:17:\"has_page_settings\";s:1:\"0\";}i:137;a:12:{s:2:\"id\";s:3:\"420\";s:5:\"title\";s:11:\"Hero UI Kit\";s:9:\"thumbnail\";s:81:\"https://library.elementor.com/wp-content/uploads/2016/09/library-ui-kit-cover.png\";s:12:\"tmpl_created\";s:10:\"1475067229\";s:6:\"author\";s:9:\"Elementor\";s:3:\"url\";s:101:\"https://library.elementor.com/hero-ui-kit/?utm_source=library&utm_medium=wp-dash&utm_campaign=preview\";s:4:\"tags\";s:2:\"[]\";s:10:\"menu_order\";s:3:\"139\";s:16:\"popularity_index\";s:1:\"8\";s:11:\"trend_index\";s:2:\"11\";s:6:\"is_pro\";s:1:\"0\";s:17:\"has_page_settings\";s:1:\"0\";}}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1397, 'elementor_scheme_color', 'a:4:{i:1;s:7:\"#6ec1e4\";i:2;s:7:\"#54595f\";i:3;s:7:\"#7a7a7a\";i:4;s:7:\"#61ce70\";}', 'yes'),
(1398, 'elementor_scheme_typography', 'a:4:{i:1;a:2:{s:11:\"font_family\";s:6:\"Roboto\";s:11:\"font_weight\";s:3:\"600\";}i:2;a:2:{s:11:\"font_family\";s:11:\"Roboto Slab\";s:11:\"font_weight\";s:3:\"400\";}i:3;a:2:{s:11:\"font_family\";s:6:\"Roboto\";s:11:\"font_weight\";s:3:\"400\";}i:4;a:2:{s:11:\"font_family\";s:6:\"Roboto\";s:11:\"font_weight\";s:3:\"500\";}}', 'yes'),
(1399, 'elementor_scheme_color-picker', 'a:8:{i:1;s:7:\"#6ec1e4\";i:2;s:7:\"#54595f\";i:3;s:7:\"#7a7a7a\";i:4;s:7:\"#61ce70\";i:5;s:7:\"#4054b2\";i:6;s:7:\"#23a455\";i:7;s:4:\"#000\";i:8;s:4:\"#fff\";}', 'yes'),
(1616, 'r_notice_data', '\n{\"type\":\"redux-message\",\"title\":\"<strong>The Ultimate Redux Extensions Bundle!<\\/strong><br\\/>\\r\\n\\r\\n\",\"message\":\"Attention Redux Developers!  Due to popular demand, we are extending the availability of the Ultimate Redux Extension Bundle, which includes <strong>all<\\/strong> of our extensions at over 40% off!  Grab you\'re copy today at <a href=\\\"https:\\/\\/reduxframework.com\\/extension\\/ultimate-bundle\\\">https:\\/\\/reduxframework.com\\/extension\\/ultimate-bundle<\\/a>\",\"color\":\"rgba(0,162,227,1)\"}\n', 'yes'),
(1617, 'redux_blast', '1517397880', 'yes'),
(1618, 'redux_version_upgraded_from', '3.6.7.7', 'yes'),
(1621, 'redux_demo', 'a:70:{s:12:\"opt-checkbox\";s:1:\"1\";s:15:\"opt-multi-check\";a:3:{i:1;s:1:\"1\";i:2;s:1:\"0\";i:3;s:1:\"0\";}s:9:\"opt-radio\";s:1:\"2\";s:12:\"opt-sortable\";a:3:{s:8:\"Text One\";s:6:\"Item 1\";s:8:\"Text Two\";s:6:\"Item 2\";s:10:\"Text Three\";s:6:\"Item 3\";}s:18:\"opt-check-sortable\";a:3:{s:3:\"cb1\";b:0;s:3:\"cb2\";b:1;s:3:\"cb3\";b:0;}s:12:\"text-example\";s:12:\"Default Text\";s:17:\"text-example-hint\";s:12:\"Default Text\";s:12:\"opt-textarea\";s:12:\"Default Text\";s:10:\"opt-editor\";s:27:\"Powered by Redux Framework.\";s:15:\"opt-editor-tiny\";s:27:\"Powered by Redux Framework.\";s:18:\"opt-ace-editor-css\";s:29:\"#header{\n   margin: 0 auto;\n}\";s:17:\"opt-ace-editor-js\";s:39:\"jQuery(document).ready(function(){\n\n});\";s:18:\"opt-ace-editor-php\";s:28:\"<?php\n    echo \"PHP String\";\";s:15:\"opt-color-title\";s:7:\"#000000\";s:16:\"opt-color-footer\";s:7:\"#dd9933\";s:16:\"opt-color-header\";a:2:{s:4:\"from\";s:7:\"#1e73be\";s:2:\"to\";s:7:\"#00897e\";}s:14:\"opt-color-rgba\";a:2:{s:5:\"color\";s:7:\"#7e33dd\";s:5:\"alpha\";s:2:\".8\";}s:14:\"opt-link-color\";a:3:{s:7:\"regular\";s:4:\"#aaa\";s:5:\"hover\";s:4:\"#bbb\";s:6:\"active\";s:4:\"#ccc\";}s:17:\"opt-palette-color\";s:3:\"red\";s:17:\"opt-header-border\";a:6:{s:12:\"border-color\";s:7:\"#1e73be\";s:12:\"border-style\";s:5:\"solid\";s:10:\"border-top\";s:3:\"3px\";s:12:\"border-right\";s:3:\"3px\";s:13:\"border-bottom\";s:3:\"3px\";s:11:\"border-left\";s:3:\"3px\";}s:26:\"opt-header-border-expanded\";a:6:{s:12:\"border-color\";s:7:\"#1e73be\";s:12:\"border-style\";s:5:\"solid\";s:10:\"border-top\";s:3:\"3px\";s:12:\"border-right\";s:3:\"3px\";s:13:\"border-bottom\";s:3:\"3px\";s:11:\"border-left\";s:3:\"3px\";}s:14:\"opt-dimensions\";a:2:{s:5:\"width\";i:200;s:6:\"height\";i:100;}s:20:\"opt-dimensions-width\";a:2:{s:5:\"width\";i:200;s:6:\"height\";i:100;}s:11:\"opt-spacing\";a:4:{s:10:\"margin-top\";s:3:\"1px\";s:12:\"margin-right\";s:3:\"2px\";s:13:\"margin-bottom\";s:3:\"3px\";s:11:\"margin-left\";s:3:\"4px\";}s:20:\"opt-spacing-expanded\";a:4:{s:10:\"margin-top\";s:3:\"1px\";s:12:\"margin-right\";s:3:\"2px\";s:13:\"margin-bottom\";s:3:\"3px\";s:11:\"margin-left\";s:3:\"4px\";}s:9:\"opt-media\";a:1:{s:3:\"url\";s:52:\"http://s.wordpress.org/style/images/codeispoetry.png\";}s:14:\"opt-button-set\";s:1:\"2\";s:20:\"opt-button-set-multi\";a:2:{i:0;s:1:\"2\";i:1;s:1:\"3\";}s:9:\"switch-on\";b:1;s:10:\"switch-off\";b:0;s:13:\"switch-parent\";i:0;s:13:\"switch-child1\";b:0;s:13:\"switch-child2\";b:0;s:10:\"opt-select\";s:1:\"2\";s:21:\"opt-select-stylesheet\";s:11:\"default.css\";s:19:\"opt-select-optgroup\";s:1:\"2\";s:16:\"opt-multi-select\";a:2:{i:0;s:1:\"2\";i:1;s:1:\"3\";}s:23:\"opt-image-select-layout\";s:1:\"2\";s:12:\"opt-patterns\";i:0;s:16:\"opt-image-select\";s:1:\"2\";s:11:\"opt-presets\";i:0;s:22:\"opt-select_image-field\";s:97:\"http://localhost/udemy/wp-content/plugins/redux-framework/ReduxCore/../sample/presets/preset2.png\";s:16:\"opt-select-image\";s:101:\"http://localhost/udemy/wp-content/plugins/redux-framework/ReduxCore/../sample/patterns/triangular.png\";s:16:\"opt-slider-label\";i:250;s:15:\"opt-slider-text\";i:75;s:17:\"opt-slider-select\";a:2:{i:1;i:100;i:2;i:300;}s:16:\"opt-slider-float\";d:0.5;s:11:\"opt-spinner\";s:2:\"40\";s:19:\"opt-typography-body\";a:4:{s:5:\"color\";s:7:\"#dd9933\";s:9:\"font-size\";s:4:\"30px\";s:11:\"font-family\";s:26:\"Arial,Helvetica,sans-serif\";s:11:\"font-weight\";s:6:\"Normal\";}s:14:\"opt-typography\";a:6:{s:5:\"color\";s:4:\"#333\";s:10:\"font-style\";s:3:\"700\";s:11:\"font-family\";s:4:\"Abel\";s:6:\"google\";b:1;s:9:\"font-size\";s:4:\"33px\";s:11:\"line-height\";s:4:\"40px\";}s:19:\"opt-homepage-layout\";a:3:{s:7:\"enabled\";a:4:{s:10:\"highlights\";s:10:\"Highlights\";s:6:\"slider\";s:6:\"Slider\";s:10:\"staticpage\";s:11:\"Static Page\";s:8:\"services\";s:8:\"Services\";}s:8:\"disabled\";a:0:{}s:6:\"backup\";a:0:{}}s:21:\"opt-homepage-layout-2\";a:2:{s:8:\"disabled\";a:2:{s:10:\"highlights\";s:10:\"Highlights\";s:6:\"slider\";s:6:\"Slider\";}s:7:\"enabled\";a:2:{s:10:\"staticpage\";s:11:\"Static Page\";s:8:\"services\";s:8:\"Services\";}}s:14:\"opt-text-email\";s:13:\"test@test.com\";s:12:\"opt-text-url\";s:25:\"http://reduxframework.com\";s:16:\"opt-text-numeric\";s:1:\"0\";s:22:\"opt-text-comma-numeric\";s:1:\"0\";s:25:\"opt-text-no-special-chars\";s:1:\"0\";s:20:\"opt-text-str_replace\";s:20:\"This is the default.\";s:21:\"opt-text-preg_replace\";s:1:\"0\";s:24:\"opt-text-custom_validate\";s:1:\"0\";s:20:\"opt-textarea-no-html\";s:27:\"No HTML is allowed in here.\";s:17:\"opt-textarea-html\";s:24:\"HTML is allowed in here.\";s:22:\"opt-textarea-some-html\";s:36:\"<p>Some HTML is allowed in here.</p>\";s:18:\"opt-required-basic\";b:0;s:19:\"opt-required-nested\";b:0;s:29:\"opt-required-nested-buttonset\";s:11:\"button-text\";s:19:\"opt-required-select\";s:10:\"no-sidebar\";s:32:\"opt-required-select-left-sidebar\";s:0:\"\";s:33:\"opt-required-select-right-sidebar\";s:0:\"\";s:19:\"opt-customizer-only\";s:1:\"2\";}', 'yes'),
(1622, 'redux_demo-transients', 'a:2:{s:14:\"changed_values\";a:0:{}s:9:\"last_save\";i:1517397881;}', 'yes'),
(1822, 'WPLANG', '', 'yes'),
(1823, 'new_admin_email', 'mohsin.hassan618@gmail.com', 'yes'),
(1934, 'cptui_new_install', 'false', 'yes'),
(1936, 'cptui_post_types', 'a:1:{s:5:\"music\";a:28:{s:4:\"name\";s:5:\"music\";s:5:\"label\";s:5:\"Music\";s:14:\"singular_label\";s:5:\"Music\";s:11:\"description\";s:0:\"\";s:6:\"public\";s:4:\"true\";s:18:\"publicly_queryable\";s:4:\"true\";s:7:\"show_ui\";s:4:\"true\";s:17:\"show_in_nav_menus\";s:4:\"true\";s:12:\"show_in_rest\";s:5:\"false\";s:9:\"rest_base\";s:0:\"\";s:11:\"has_archive\";s:5:\"false\";s:18:\"has_archive_string\";s:0:\"\";s:19:\"exclude_from_search\";s:5:\"false\";s:15:\"capability_type\";s:4:\"post\";s:12:\"hierarchical\";s:5:\"false\";s:7:\"rewrite\";s:4:\"true\";s:12:\"rewrite_slug\";s:0:\"\";s:17:\"rewrite_withfront\";s:4:\"true\";s:9:\"query_var\";s:4:\"true\";s:14:\"query_var_slug\";s:0:\"\";s:13:\"menu_position\";s:0:\"\";s:12:\"show_in_menu\";s:4:\"true\";s:19:\"show_in_menu_string\";s:0:\"\";s:9:\"menu_icon\";s:0:\"\";s:8:\"supports\";a:3:{i:0;s:5:\"title\";i:1;s:6:\"editor\";i:2;s:9:\"thumbnail\";}s:10:\"taxonomies\";a:0:{}s:6:\"labels\";a:23:{s:9:\"menu_name\";s:0:\"\";s:9:\"all_items\";s:0:\"\";s:7:\"add_new\";s:0:\"\";s:12:\"add_new_item\";s:0:\"\";s:9:\"edit_item\";s:0:\"\";s:8:\"new_item\";s:0:\"\";s:9:\"view_item\";s:0:\"\";s:10:\"view_items\";s:0:\"\";s:12:\"search_items\";s:0:\"\";s:9:\"not_found\";s:0:\"\";s:18:\"not_found_in_trash\";s:0:\"\";s:17:\"parent_item_colon\";s:0:\"\";s:14:\"featured_image\";s:0:\"\";s:18:\"set_featured_image\";s:0:\"\";s:21:\"remove_featured_image\";s:0:\"\";s:18:\"use_featured_image\";s:0:\"\";s:8:\"archives\";s:0:\"\";s:16:\"insert_into_item\";s:0:\"\";s:21:\"uploaded_to_this_item\";s:0:\"\";s:17:\"filter_items_list\";s:0:\"\";s:21:\"items_list_navigation\";s:0:\"\";s:10:\"items_list\";s:0:\"\";s:10:\"attributes\";s:0:\"\";}s:15:\"custom_supports\";s:0:\"\";}}', 'yes'),
(1940, 'cptui_taxonomies', 'a:1:{s:5:\"genre\";a:21:{s:4:\"name\";s:5:\"genre\";s:5:\"label\";s:5:\"Genre\";s:14:\"singular_label\";s:5:\"Genre\";s:11:\"description\";s:0:\"\";s:6:\"public\";s:4:\"true\";s:12:\"hierarchical\";s:5:\"false\";s:7:\"show_ui\";s:4:\"true\";s:12:\"show_in_menu\";s:4:\"true\";s:17:\"show_in_nav_menus\";s:4:\"true\";s:9:\"query_var\";s:4:\"true\";s:14:\"query_var_slug\";s:0:\"\";s:7:\"rewrite\";s:4:\"true\";s:12:\"rewrite_slug\";s:0:\"\";s:17:\"rewrite_withfront\";s:1:\"1\";s:20:\"rewrite_hierarchical\";s:1:\"0\";s:17:\"show_admin_column\";s:5:\"false\";s:12:\"show_in_rest\";s:5:\"false\";s:18:\"show_in_quick_edit\";s:0:\"\";s:9:\"rest_base\";s:0:\"\";s:6:\"labels\";a:18:{s:9:\"menu_name\";s:0:\"\";s:9:\"all_items\";s:0:\"\";s:9:\"edit_item\";s:0:\"\";s:9:\"view_item\";s:0:\"\";s:11:\"update_item\";s:0:\"\";s:12:\"add_new_item\";s:0:\"\";s:13:\"new_item_name\";s:0:\"\";s:11:\"parent_item\";s:0:\"\";s:17:\"parent_item_colon\";s:0:\"\";s:12:\"search_items\";s:0:\"\";s:13:\"popular_items\";s:0:\"\";s:26:\"separate_items_with_commas\";s:0:\"\";s:19:\"add_or_remove_items\";s:0:\"\";s:21:\"choose_from_most_used\";s:0:\"\";s:9:\"not_found\";s:0:\"\";s:8:\"no_terms\";s:0:\"\";s:21:\"items_list_navigation\";s:0:\"\";s:10:\"items_list\";s:0:\"\";}s:12:\"object_types\";a:1:{i:0;s:5:\"music\";}}}', 'yes'),
(1943, 'acf_version', '4.4.12', 'yes'),
(1957, 'bp-deactivated-components', 'a:0:{}', 'yes'),
(1958, 'bb-config-location', 'C:\\xampp\\htdocs\\udemy/bb-config.php', 'yes'),
(1959, 'bp-xprofile-base-group-name', 'Base', 'yes'),
(1960, 'bp-xprofile-fullname-field-name', 'Name', 'yes'),
(1961, 'bp-blogs-first-install', '', 'yes'),
(1962, 'bp-disable-profile-sync', '0', 'yes'),
(1963, 'hide-loggedout-adminbar', '0', 'yes'),
(1964, 'bp-disable-avatar-uploads', '0', 'yes'),
(1965, 'bp-disable-cover-image-uploads', '0', 'yes'),
(1966, 'bp-disable-group-avatar-uploads', '0', 'yes'),
(1967, 'bp-disable-group-cover-image-uploads', '0', 'yes'),
(1968, 'bp-disable-account-deletion', '0', 'yes'),
(1969, 'bp-disable-blogforum-comments', '1', 'yes'),
(1970, '_bp_theme_package_id', 'legacy', 'yes'),
(1971, 'bp-emails-unsubscribe-salt', 'TjpoaSpAfi9jJikrSUlIdFVCZz90My5lKzlkN154fmtLKE5hRCZCT11DI1FfMSpfR1BLP05SNVdKKHNWazlObQ==', 'yes'),
(1972, 'bp_restrict_group_creation', '0', 'yes'),
(1973, '_bp_enable_akismet', '1', 'yes'),
(1974, '_bp_enable_heartbeat_refresh', '1', 'yes'),
(1975, '_bp_force_buddybar', '', 'yes'),
(1976, '_bp_retain_bp_default', '', 'yes'),
(1977, '_bp_ignore_deprecated_code', '1', 'yes'),
(1978, 'widget_bp_core_login_widget', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(1979, 'widget_bp_core_members_widget', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(1980, 'widget_bp_core_whos_online_widget', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(1981, 'widget_bp_core_recently_active_widget', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(1982, 'widget_bp_groups_widget', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(1983, 'widget_bp_messages_sitewide_notices_widget', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(1988, 'bp-active-components', 'a:9:{s:8:\"xprofile\";s:1:\"1\";s:8:\"settings\";s:1:\"1\";s:7:\"friends\";s:1:\"1\";s:8:\"messages\";s:1:\"1\";s:8:\"activity\";s:1:\"1\";s:13:\"notifications\";s:1:\"1\";s:6:\"groups\";s:1:\"1\";s:5:\"blogs\";s:1:\"1\";s:7:\"members\";s:1:\"1\";}', 'yes'),
(1989, 'bp-pages', 'a:5:{s:8:\"activity\";i:167;s:7:\"members\";i:168;s:8:\"register\";i:185;s:8:\"activate\";i:186;s:6:\"groups\";i:187;}', 'yes'),
(1990, '_bp_db_version', '11105', 'yes'),
(1995, 'widget_bp_core_friends_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(1997, '_transient_bp_active_member_count', '1', 'yes'),
(2046, 'bp_disable_blogforum_comments', '1', 'yes'),
(2173, 'woocommerce_store_address', '10-C, Shah Khawar Town,Bhatta Chownk, Lahore', 'yes'),
(2174, 'woocommerce_store_address_2', '', 'yes'),
(2175, 'woocommerce_store_city', 'Lahore', 'yes'),
(2176, 'woocommerce_default_country', 'GB', 'yes'),
(2177, 'woocommerce_store_postcode', '54000', 'yes'),
(2178, 'woocommerce_allowed_countries', 'all', 'yes'),
(2179, 'woocommerce_all_except_countries', '', 'yes'),
(2180, 'woocommerce_specific_allowed_countries', '', 'yes'),
(2181, 'woocommerce_ship_to_countries', '', 'yes'),
(2182, 'woocommerce_specific_ship_to_countries', '', 'yes'),
(2183, 'woocommerce_default_customer_address', 'geolocation', 'yes'),
(2184, 'woocommerce_calc_taxes', 'no', 'yes'),
(2185, 'woocommerce_currency', 'USD', 'yes'),
(2186, 'woocommerce_currency_pos', 'left', 'yes'),
(2187, 'woocommerce_price_thousand_sep', ',', 'yes'),
(2188, 'woocommerce_price_decimal_sep', '.', 'yes'),
(2189, 'woocommerce_price_num_decimals', '2', 'yes'),
(2190, 'woocommerce_shop_page_id', '189', 'yes'),
(2191, 'woocommerce_cart_redirect_after_add', 'no', 'yes'),
(2192, 'woocommerce_enable_ajax_add_to_cart', 'yes', 'yes'),
(2193, 'woocommerce_weight_unit', 'kg', 'yes'),
(2194, 'woocommerce_dimension_unit', 'cm', 'yes'),
(2195, 'woocommerce_enable_reviews', 'yes', 'yes'),
(2196, 'woocommerce_review_rating_verification_label', 'yes', 'no'),
(2197, 'woocommerce_review_rating_verification_required', 'no', 'no'),
(2198, 'woocommerce_enable_review_rating', 'yes', 'yes'),
(2199, 'woocommerce_review_rating_required', 'yes', 'no'),
(2200, 'woocommerce_manage_stock', 'yes', 'yes'),
(2201, 'woocommerce_hold_stock_minutes', '60', 'no'),
(2202, 'woocommerce_notify_low_stock', 'yes', 'no'),
(2203, 'woocommerce_notify_no_stock', 'yes', 'no'),
(2204, 'woocommerce_stock_email_recipient', 'mohsin.hassan618@gmail.com', 'no'),
(2205, 'woocommerce_notify_low_stock_amount', '2', 'no'),
(2206, 'woocommerce_notify_no_stock_amount', '0', 'yes'),
(2207, 'woocommerce_hide_out_of_stock_items', 'no', 'yes'),
(2208, 'woocommerce_stock_format', '', 'yes'),
(2209, 'woocommerce_file_download_method', 'force', 'no'),
(2210, 'woocommerce_downloads_require_login', 'no', 'no'),
(2211, 'woocommerce_downloads_grant_access_after_payment', 'yes', 'no'),
(2212, 'woocommerce_prices_include_tax', 'no', 'yes'),
(2213, 'woocommerce_tax_based_on', 'shipping', 'yes'),
(2214, 'woocommerce_shipping_tax_class', 'inherit', 'yes'),
(2215, 'woocommerce_tax_round_at_subtotal', 'no', 'yes'),
(2216, 'woocommerce_tax_classes', 'Reduced rate\r\nZero rate', 'yes'),
(2217, 'woocommerce_tax_display_shop', 'excl', 'yes'),
(2218, 'woocommerce_tax_display_cart', 'excl', 'no'),
(2219, 'woocommerce_price_display_suffix', '', 'yes'),
(2220, 'woocommerce_tax_total_display', 'itemized', 'no'),
(2221, 'woocommerce_enable_shipping_calc', 'yes', 'no'),
(2222, 'woocommerce_shipping_cost_requires_address', 'no', 'no'),
(2223, 'woocommerce_ship_to_destination', 'billing', 'no'),
(2224, 'woocommerce_shipping_debug_mode', 'no', 'no'),
(2225, 'woocommerce_enable_coupons', 'yes', 'yes'),
(2226, 'woocommerce_calc_discounts_sequentially', 'no', 'no'),
(2227, 'woocommerce_enable_guest_checkout', 'yes', 'no'),
(2228, 'woocommerce_force_ssl_checkout', 'no', 'yes'),
(2229, 'woocommerce_unforce_ssl_checkout', 'no', 'yes'),
(2230, 'woocommerce_cart_page_id', '190', 'yes'),
(2231, 'woocommerce_checkout_page_id', '191', 'yes'),
(2232, 'woocommerce_terms_page_id', '', 'no'),
(2233, 'woocommerce_checkout_pay_endpoint', 'order-pay', 'yes'),
(2234, 'woocommerce_checkout_order_received_endpoint', 'order-received', 'yes'),
(2235, 'woocommerce_myaccount_add_payment_method_endpoint', 'add-payment-method', 'yes'),
(2236, 'woocommerce_myaccount_delete_payment_method_endpoint', 'delete-payment-method', 'yes'),
(2237, 'woocommerce_myaccount_set_default_payment_method_endpoint', 'set-default-payment-method', 'yes'),
(2238, 'woocommerce_myaccount_page_id', '192', 'yes'),
(2239, 'woocommerce_enable_signup_and_login_from_checkout', 'yes', 'no'),
(2240, 'woocommerce_enable_myaccount_registration', 'no', 'no'),
(2241, 'woocommerce_enable_checkout_login_reminder', 'yes', 'no'),
(2242, 'woocommerce_registration_generate_username', 'yes', 'no'),
(2243, 'woocommerce_registration_generate_password', 'no', 'no'),
(2244, 'woocommerce_myaccount_orders_endpoint', 'orders', 'yes'),
(2245, 'woocommerce_myaccount_view_order_endpoint', 'view-order', 'yes'),
(2246, 'woocommerce_myaccount_downloads_endpoint', 'downloads', 'yes'),
(2247, 'woocommerce_myaccount_edit_account_endpoint', 'edit-account', 'yes'),
(2248, 'woocommerce_myaccount_edit_address_endpoint', 'edit-address', 'yes'),
(2249, 'woocommerce_myaccount_payment_methods_endpoint', 'payment-methods', 'yes'),
(2250, 'woocommerce_myaccount_lost_password_endpoint', 'lost-password', 'yes'),
(2251, 'woocommerce_logout_endpoint', 'customer-logout', 'yes'),
(2252, 'woocommerce_email_from_name', 'Udemy', 'no'),
(2253, 'woocommerce_email_from_address', 'mohsin.hassan618@gmail.com', 'no'),
(2254, 'woocommerce_email_header_image', '', 'no'),
(2255, 'woocommerce_email_footer_text', '{site_title}', 'no'),
(2256, 'woocommerce_email_base_color', '#96588a', 'no'),
(2257, 'woocommerce_email_background_color', '#f7f7f7', 'no'),
(2258, 'woocommerce_email_body_background_color', '#ffffff', 'no'),
(2259, 'woocommerce_email_text_color', '#3c3c3c', 'no'),
(2260, 'woocommerce_api_enabled', 'yes', 'yes'),
(2261, 'woocommerce_permalinks', 'a:5:{s:12:\"product_base\";s:7:\"product\";s:13:\"category_base\";s:16:\"product-category\";s:8:\"tag_base\";s:11:\"product-tag\";s:14:\"attribute_base\";s:0:\"\";s:22:\"use_verbose_page_rules\";b:0;}', 'yes'),
(2262, 'current_theme_supports_woocommerce', 'yes', 'yes'),
(2263, 'woocommerce_queue_flush_rewrite_rules', 'no', 'yes'),
(2266, 'default_product_cat', '54', 'yes'),
(2269, 'woocommerce_version', '3.3.3', 'yes'),
(2270, 'woocommerce_db_version', '3.3.3', 'yes'),
(2271, 'woocommerce_admin_notices', 'a:0:{}', 'yes'),
(2272, '_transient_woocommerce_webhook_ids', 'a:0:{}', 'yes'),
(2273, 'widget_woocommerce_widget_cart', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(2274, 'widget_woocommerce_layered_nav_filters', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(2275, 'widget_woocommerce_layered_nav', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(2276, 'widget_woocommerce_price_filter', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(2277, 'widget_woocommerce_product_categories', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(2278, 'widget_woocommerce_product_search', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(2279, 'widget_woocommerce_product_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(2280, 'widget_woocommerce_products', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(2281, 'widget_woocommerce_recently_viewed_products', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(2282, 'widget_woocommerce_top_rated_products', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(2283, 'widget_woocommerce_recent_reviews', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(2284, 'widget_woocommerce_rating_filter', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(2287, 'woocommerce_meta_box_errors', 'a:0:{}', 'yes'),
(2288, 'woocommerce_product_type', 'both', 'yes'),
(2289, 'woocommerce_allow_tracking', 'yes', 'yes'),
(2290, 'woocommerce_tracker_last_send', '1523271710', 'yes'),
(2291, 'woocommerce_stripe_settings', 'a:3:{s:7:\"enabled\";s:2:\"no\";s:14:\"create_account\";b:0;s:5:\"email\";b:0;}', 'yes'),
(2292, 'woocommerce_ppec_paypal_settings', 'a:2:{s:16:\"reroute_requests\";b:0;s:5:\"email\";b:0;}', 'yes'),
(2293, 'woocommerce_cheque_settings', 'a:1:{s:7:\"enabled\";s:2:\"no\";}', 'yes'),
(2294, 'woocommerce_bacs_settings', 'a:1:{s:7:\"enabled\";s:2:\"no\";}', 'yes'),
(2295, 'woocommerce_cod_settings', 'a:1:{s:7:\"enabled\";s:2:\"no\";}', 'yes'),
(2301, '_transient_shipping-transient-version', '1519848578', 'yes'),
(2313, 'theme_mods_storefront', 'a:7:{i:0;b:0;s:18:\"nav_menu_locations\";a:2:{s:7:\"primary\";i:10;s:9:\"secondary\";i:11;}s:17:\"storefront_styles\";s:5060:\"\n			.main-navigation ul li a,\n			.site-title a,\n			ul.menu li a,\n			.site-branding h1 a,\n			.site-footer .storefront-handheld-footer-bar a:not(.button),\n			button.menu-toggle,\n			button.menu-toggle:hover {\n				color: #333333;\n			}\n\n			button.menu-toggle,\n			button.menu-toggle:hover {\n				border-color: #333333;\n			}\n\n			.main-navigation ul li a:hover,\n			.main-navigation ul li:hover > a,\n			.site-title a:hover,\n			a.cart-contents:hover,\n			.site-header-cart .widget_shopping_cart a:hover,\n			.site-header-cart:hover > li > a,\n			.site-header ul.menu li.current-menu-item > a {\n				color: #747474;\n			}\n\n			table th {\n				background-color: #f8f8f8;\n			}\n\n			table tbody td {\n				background-color: #fdfdfd;\n			}\n\n			table tbody tr:nth-child(2n) td,\n			fieldset,\n			fieldset legend {\n				background-color: #fbfbfb;\n			}\n\n			.site-header,\n			.secondary-navigation ul ul,\n			.main-navigation ul.menu > li.menu-item-has-children:after,\n			.secondary-navigation ul.menu ul,\n			.storefront-handheld-footer-bar,\n			.storefront-handheld-footer-bar ul li > a,\n			.storefront-handheld-footer-bar ul li.search .site-search,\n			button.menu-toggle,\n			button.menu-toggle:hover {\n				background-color: #ffffff;\n			}\n\n			p.site-description,\n			.site-header,\n			.storefront-handheld-footer-bar {\n				color: #404040;\n			}\n\n			.storefront-handheld-footer-bar ul li.cart .count,\n			button.menu-toggle:after,\n			button.menu-toggle:before,\n			button.menu-toggle span:before {\n				background-color: #333333;\n			}\n\n			.storefront-handheld-footer-bar ul li.cart .count {\n				color: #ffffff;\n			}\n\n			.storefront-handheld-footer-bar ul li.cart .count {\n				border-color: #ffffff;\n			}\n\n			h1, h2, h3, h4, h5, h6 {\n				color: #333333;\n			}\n\n			.widget h1 {\n				border-bottom-color: #333333;\n			}\n\n			body,\n			.secondary-navigation a,\n			.onsale,\n			.pagination .page-numbers li .page-numbers:not(.current), .woocommerce-pagination .page-numbers li .page-numbers:not(.current) {\n				color: #6d6d6d;\n			}\n\n			.widget-area .widget a,\n			.hentry .entry-header .posted-on a,\n			.hentry .entry-header .byline a {\n				color: #727272;\n			}\n\n			a  {\n				color: #96588a;\n			}\n\n			a:focus,\n			.button:focus,\n			.button.alt:focus,\n			.button.added_to_cart:focus,\n			.button.wc-forward:focus,\n			button:focus,\n			input[type=\"button\"]:focus,\n			input[type=\"reset\"]:focus,\n			input[type=\"submit\"]:focus {\n				outline-color: #96588a;\n			}\n\n			button, input[type=\"button\"], input[type=\"reset\"], input[type=\"submit\"], .button, .added_to_cart, .widget a.button, .site-header-cart .widget_shopping_cart a.button {\n				background-color: #eeeeee;\n				border-color: #eeeeee;\n				color: #333333;\n			}\n\n			button:hover, input[type=\"button\"]:hover, input[type=\"reset\"]:hover, input[type=\"submit\"]:hover, .button:hover, .added_to_cart:hover, .widget a.button:hover, .site-header-cart .widget_shopping_cart a.button:hover {\n				background-color: #d5d5d5;\n				border-color: #d5d5d5;\n				color: #333333;\n			}\n\n			button.alt, input[type=\"button\"].alt, input[type=\"reset\"].alt, input[type=\"submit\"].alt, .button.alt, .added_to_cart.alt, .widget-area .widget a.button.alt, .added_to_cart, .widget a.button.checkout {\n				background-color: #333333;\n				border-color: #333333;\n				color: #ffffff;\n			}\n\n			button.alt:hover, input[type=\"button\"].alt:hover, input[type=\"reset\"].alt:hover, input[type=\"submit\"].alt:hover, .button.alt:hover, .added_to_cart.alt:hover, .widget-area .widget a.button.alt:hover, .added_to_cart:hover, .widget a.button.checkout:hover {\n				background-color: #1a1a1a;\n				border-color: #1a1a1a;\n				color: #ffffff;\n			}\n\n			.pagination .page-numbers li .page-numbers.current, .woocommerce-pagination .page-numbers li .page-numbers.current {\n				background-color: #e6e6e6;\n				color: #636363;\n			}\n\n			#comments .comment-list .comment-content .comment-text {\n				background-color: #f8f8f8;\n			}\n\n			.site-footer {\n				background-color: #f0f0f0;\n				color: #6d6d6d;\n			}\n\n			.site-footer a:not(.button) {\n				color: #333333;\n			}\n\n			.site-footer h1, .site-footer h2, .site-footer h3, .site-footer h4, .site-footer h5, .site-footer h6 {\n				color: #333333;\n			}\n\n			#order_review {\n				background-color: #ffffff;\n			}\n\n			#payment .payment_methods > li .payment_box,\n			#payment .place-order {\n				background-color: #fafafa;\n			}\n\n			#payment .payment_methods > li:not(.woocommerce-notice) {\n				background-color: #f5f5f5;\n			}\n\n			#payment .payment_methods > li:not(.woocommerce-notice):hover {\n				background-color: #f0f0f0;\n			}\n\n			@media screen and ( min-width: 768px ) {\n				.secondary-navigation ul.menu a:hover {\n					color: #595959;\n				}\n\n				.secondary-navigation ul.menu a {\n					color: #404040;\n				}\n\n				.site-header-cart .widget_shopping_cart,\n				.main-navigation ul.menu ul.sub-menu,\n				.main-navigation ul.nav-menu ul.children {\n					background-color: #f0f0f0;\n				}\n\n				.site-header-cart .widget_shopping_cart .buttons,\n				.site-header-cart .widget_shopping_cart .total {\n					background-color: #f5f5f5;\n				}\n\n				.site-header {\n					border-bottom-color: #f0f0f0;\n				}\n			}\";s:29:\"storefront_woocommerce_styles\";s:2283:\"\n			a.cart-contents,\n			.site-header-cart .widget_shopping_cart a {\n				color: #333333;\n			}\n\n			table.cart td.product-remove,\n			table.cart td.actions {\n				border-top-color: #ffffff;\n			}\n\n			.woocommerce-tabs ul.tabs li.active a,\n			ul.products li.product .price,\n			.onsale,\n			.widget_search form:before,\n			.widget_product_search form:before {\n				color: #6d6d6d;\n			}\n\n			.woocommerce-breadcrumb a,\n			a.woocommerce-review-link,\n			.product_meta a {\n				color: #727272;\n			}\n\n			.onsale {\n				border-color: #6d6d6d;\n			}\n\n			.star-rating span:before,\n			.quantity .plus, .quantity .minus,\n			p.stars a:hover:after,\n			p.stars a:after,\n			.star-rating span:before,\n			#payment .payment_methods li input[type=radio]:first-child:checked+label:before {\n				color: #96588a;\n			}\n\n			.widget_price_filter .ui-slider .ui-slider-range,\n			.widget_price_filter .ui-slider .ui-slider-handle {\n				background-color: #96588a;\n			}\n\n			.order_details {\n				background-color: #f8f8f8;\n			}\n\n			.order_details > li {\n				border-bottom: 1px dotted #e3e3e3;\n			}\n\n			.order_details:before,\n			.order_details:after {\n				background: -webkit-linear-gradient(transparent 0,transparent 0),-webkit-linear-gradient(135deg,#f8f8f8 33.33%,transparent 33.33%),-webkit-linear-gradient(45deg,#f8f8f8 33.33%,transparent 33.33%)\n			}\n\n			p.stars a:before,\n			p.stars a:hover~a:before,\n			p.stars.selected a.active~a:before {\n				color: #6d6d6d;\n			}\n\n			p.stars.selected a.active:before,\n			p.stars:hover a:before,\n			p.stars.selected a:not(.active):before,\n			p.stars.selected a.active:before {\n				color: #96588a;\n			}\n\n			.single-product div.product .woocommerce-product-gallery .woocommerce-product-gallery__trigger {\n				background-color: #eeeeee;\n				color: #333333;\n			}\n\n			.single-product div.product .woocommerce-product-gallery .woocommerce-product-gallery__trigger:hover {\n				background-color: #d5d5d5;\n				border-color: #d5d5d5;\n				color: #333333;\n			}\n\n			.button.loading {\n				color: #eeeeee;\n			}\n\n			.button.loading:hover {\n				background-color: #eeeeee;\n			}\n\n			.button.loading:after {\n				color: #333333;\n			}\n\n			@media screen and ( min-width: 768px ) {\n				.site-header-cart .widget_shopping_cart,\n				.site-header .product_list_widget li .quantity {\n					color: #404040;\n				}\n			}\";s:39:\"storefront_woocommerce_extension_styles\";s:0:\"\";s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1519850831;s:4:\"data\";a:7:{s:19:\"wp_inactive_widgets\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-1\";a:4:{i:0;s:23:\"r_daily_recipe_widget-4\";i:1;s:8:\"search-3\";i:2;s:10:\"calendar-2\";i:3;s:12:\"categories-3\";}s:8:\"header-1\";a:0:{}s:8:\"footer-1\";a:0:{}s:8:\"footer-2\";a:0:{}s:8:\"footer-3\";a:0:{}s:8:\"footer-4\";a:0:{}}}}', 'yes'),
(2316, 'storefront_nux_fresh_site', '0', 'yes'),
(2317, 'woocommerce_catalog_rows', '4', 'yes'),
(2318, 'woocommerce_catalog_columns', '3', 'yes'),
(2319, 'woocommerce_maybe_regenerate_images_hash', '991b1ca641921cf0f5baf7a2fe85861b', 'yes'),
(2373, 'storefront_nux_dismissed', '1', 'yes'),
(2374, 'storefront_nux_guided_tour', '1', 'yes'),
(2376, '_transient_product_query-transient-version', '1520105236', 'yes'),
(2381, '_transient_product-transient-version', '1519850682', 'yes'),
(2470, '_transient_wc_attribute_taxonomies', 'a:2:{i:0;O:8:\"stdClass\":6:{s:12:\"attribute_id\";s:1:\"1\";s:14:\"attribute_name\";s:5:\"color\";s:15:\"attribute_label\";s:5:\"color\";s:14:\"attribute_type\";s:6:\"select\";s:17:\"attribute_orderby\";s:10:\"menu_order\";s:16:\"attribute_public\";s:1:\"0\";}i:1;O:8:\"stdClass\":6:{s:12:\"attribute_id\";s:1:\"2\";s:14:\"attribute_name\";s:4:\"size\";s:15:\"attribute_label\";s:4:\"size\";s:14:\"attribute_type\";s:6:\"select\";s:17:\"attribute_orderby\";s:10:\"menu_order\";s:16:\"attribute_public\";s:1:\"0\";}}', 'yes'),
(2475, '_transient_wc_count_comments', 'O:8:\"stdClass\":7:{s:14:\"total_comments\";i:3;s:3:\"all\";i:3;s:8:\"approved\";s:1:\"3\";s:9:\"moderated\";i:0;s:4:\"spam\";i:0;s:5:\"trash\";i:0;s:12:\"post-trashed\";i:0;}', 'yes'),
(2526, 'woocommerce_tracker_ua', 'a:4:{i:0;s:127:\"mozilla/5.0 (windows nt 10.0; wow64) applewebkit/537.36 (khtml, like gecko) chrome/64.0.3282.140 safari/537.36 opr/51.0.2830.34\";i:1;s:127:\"mozilla/5.0 (windows nt 10.0; wow64) applewebkit/537.36 (khtml, like gecko) chrome/64.0.3282.186 safari/537.36 opr/51.0.2830.55\";i:2;s:127:\"mozilla/5.0 (windows nt 10.0; wow64) applewebkit/537.36 (khtml, like gecko) chrome/65.0.3325.181 safari/537.36 opr/52.0.2871.40\";i:3;s:127:\"mozilla/5.0 (windows nt 10.0; wow64) applewebkit/537.36 (khtml, like gecko) chrome/65.0.3325.181 safari/537.36 opr/52.0.2871.64\";}', 'yes'),
(2551, 'category_children', 'a:0:{}', 'yes'),
(2552, 'product_cat_children', 'a:0:{}', 'yes'),
(2564, '_transient_orders-transient-version', '1520107111', 'yes'),
(2565, 'wc_email_test_order_id', '242', 'yes'),
(2729, '_transient_timeout_wc_term_counts', '1524079159', 'no'),
(2730, '_transient_wc_term_counts', 'a:1:{i:66;s:1:\"2\";}', 'no'),
(2922, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.9.5.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.9.5.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-4.9.5-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-4.9.5-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"4.9.5\";s:7:\"version\";s:5:\"4.9.5\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1523793564;s:15:\"version_checked\";s:5:\"4.9.5\";s:12:\"translations\";a:0:{}}', 'no'),
(2945, '_transient_timeout_wc_low_stock_count', '1525615900', 'no'),
(2946, '_transient_wc_low_stock_count', '0', 'no'),
(2947, '_transient_timeout_wc_outofstock_count', '1525615901', 'no'),
(2948, '_transient_wc_outofstock_count', '0', 'no'),
(2950, '_transient_timeout_wc_shipping_method_count_1_1519848578', '1525615905', 'no'),
(2951, '_transient_wc_shipping_method_count_1_1519848578', '0', 'no'),
(2997, 'ghu_update_data', 'a:0:{}', 'yes'),
(2998, 'ghu_last_checked', '1523793588', 'yes'),
(3070, '_transient_timeout_r_daily_recipe', '1523909558', 'no'),
(3071, '_transient_r_daily_recipe', '137', 'no'),
(3076, '_site_transient_update_themes', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1523818629;s:7:\"checked\";a:5:{s:10:\"storefront\";s:5:\"2.2.8\";s:13:\"twentyfifteen\";s:3:\"1.8\";s:15:\"twentyseventeen\";s:3:\"1.3\";s:13:\"twentysixteen\";s:3:\"1.3\";s:5:\"udemy\";s:0:\"\";}s:8:\"response\";a:3:{s:13:\"twentyfifteen\";a:4:{s:5:\"theme\";s:13:\"twentyfifteen\";s:11:\"new_version\";s:3:\"1.9\";s:3:\"url\";s:43:\"https://wordpress.org/themes/twentyfifteen/\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/theme/twentyfifteen.1.9.zip\";}s:15:\"twentyseventeen\";a:4:{s:5:\"theme\";s:15:\"twentyseventeen\";s:11:\"new_version\";s:3:\"1.5\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentyseventeen/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentyseventeen.1.5.zip\";}s:13:\"twentysixteen\";a:4:{s:5:\"theme\";s:13:\"twentysixteen\";s:11:\"new_version\";s:3:\"1.4\";s:3:\"url\";s:43:\"https://wordpress.org/themes/twentysixteen/\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/theme/twentysixteen.1.4.zip\";}}s:12:\"translations\";a:0:{}}', 'no'),
(3077, '_site_transient_update_plugins', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1523820625;s:8:\"response\";a:11:{s:49:\"quick-adsense-reloaded/quick-adsense-reloaded.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:36:\"w.org/plugins/quick-adsense-reloaded\";s:4:\"slug\";s:22:\"quick-adsense-reloaded\";s:6:\"plugin\";s:49:\"quick-adsense-reloaded/quick-adsense-reloaded.php\";s:11:\"new_version\";s:5:\"1.7.6\";s:3:\"url\";s:53:\"https://wordpress.org/plugins/quick-adsense-reloaded/\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/plugin/quick-adsense-reloaded.zip\";s:5:\"icons\";a:1:{s:2:\"1x\";s:75:\"https://ps.w.org/quick-adsense-reloaded/assets/icon-128x128.png?rev=1583603\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:77:\"https://ps.w.org/quick-adsense-reloaded/assets/banner-772x250.png?rev=1583600\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"4.9.5\";s:12:\"requires_php\";N;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:19:\"akismet/akismet.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.0.3\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.0.3.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"4.9.5\";s:12:\"requires_php\";N;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:24:\"buddypress/bp-loader.php\";O:8:\"stdClass\":13:{s:2:\"id\";s:24:\"w.org/plugins/buddypress\";s:4:\"slug\";s:10:\"buddypress\";s:6:\"plugin\";s:24:\"buddypress/bp-loader.php\";s:11:\"new_version\";s:5:\"2.9.4\";s:3:\"url\";s:41:\"https://wordpress.org/plugins/buddypress/\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/plugin/buddypress.2.9.4.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:63:\"https://ps.w.org/buddypress/assets/icon-256x256.png?rev=1309232\";s:2:\"1x\";s:54:\"https://ps.w.org/buddypress/assets/icon.svg?rev=977480\";s:3:\"svg\";s:54:\"https://ps.w.org/buddypress/assets/icon.svg?rev=977480\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:66:\"https://ps.w.org/buddypress/assets/banner-1544x500.png?rev=1854372\";s:2:\"1x\";s:65:\"https://ps.w.org/buddypress/assets/banner-772x250.png?rev=1854372\";}s:11:\"banners_rtl\";a:2:{s:2:\"2x\";s:70:\"https://ps.w.org/buddypress/assets/banner-1544x500-rtl.png?rev=1854372\";s:2:\"1x\";s:69:\"https://ps.w.org/buddypress/assets/banner-772x250-rtl.png?rev=1854372\";}s:14:\"upgrade_notice\";s:64:\"<p>See: https://codex.buddypress.org/releases/version-2-9-4/</p>\";s:6:\"tested\";s:5:\"4.9.5\";s:12:\"requires_php\";N;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:43:\"custom-post-type-ui/custom-post-type-ui.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:33:\"w.org/plugins/custom-post-type-ui\";s:4:\"slug\";s:19:\"custom-post-type-ui\";s:6:\"plugin\";s:43:\"custom-post-type-ui/custom-post-type-ui.php\";s:11:\"new_version\";s:5:\"1.5.7\";s:3:\"url\";s:50:\"https://wordpress.org/plugins/custom-post-type-ui/\";s:7:\"package\";s:68:\"https://downloads.wordpress.org/plugin/custom-post-type-ui.1.5.7.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:72:\"https://ps.w.org/custom-post-type-ui/assets/icon-256x256.png?rev=1069557\";s:2:\"1x\";s:72:\"https://ps.w.org/custom-post-type-ui/assets/icon-128x128.png?rev=1069557\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:75:\"https://ps.w.org/custom-post-type-ui/assets/banner-1544x500.png?rev=1069557\";s:2:\"1x\";s:74:\"https://ps.w.org/custom-post-type-ui/assets/banner-772x250.png?rev=1069557\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"4.9.5\";s:12:\"requires_php\";N;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:23:\"elementor/elementor.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:23:\"w.org/plugins/elementor\";s:4:\"slug\";s:9:\"elementor\";s:6:\"plugin\";s:23:\"elementor/elementor.php\";s:11:\"new_version\";s:5:\"2.0.6\";s:3:\"url\";s:40:\"https://wordpress.org/plugins/elementor/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/elementor.2.0.6.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:62:\"https://ps.w.org/elementor/assets/icon-256x256.png?rev=1427768\";s:2:\"1x\";s:54:\"https://ps.w.org/elementor/assets/icon.svg?rev=1426809\";s:3:\"svg\";s:54:\"https://ps.w.org/elementor/assets/icon.svg?rev=1426809\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:65:\"https://ps.w.org/elementor/assets/banner-1544x500.png?rev=1475479\";s:2:\"1x\";s:64:\"https://ps.w.org/elementor/assets/banner-772x250.png?rev=1475479\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"4.9.5\";s:12:\"requires_php\";N;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:28:\"error-log-monitor/plugin.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:31:\"w.org/plugins/error-log-monitor\";s:4:\"slug\";s:17:\"error-log-monitor\";s:6:\"plugin\";s:28:\"error-log-monitor/plugin.php\";s:11:\"new_version\";s:5:\"1.5.7\";s:3:\"url\";s:48:\"https://wordpress.org/plugins/error-log-monitor/\";s:7:\"package\";s:66:\"https://downloads.wordpress.org/plugin/error-log-monitor.1.5.7.zip\";s:5:\"icons\";a:1:{s:7:\"default\";s:61:\"https://s.w.org/plugins/geopattern-icon/error-log-monitor.svg\";}s:7:\"banners\";a:0:{}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"4.9.5\";s:12:\"requires_php\";N;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:25:\"fakerpress/fakerpress.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:24:\"w.org/plugins/fakerpress\";s:4:\"slug\";s:10:\"fakerpress\";s:6:\"plugin\";s:25:\"fakerpress/fakerpress.php\";s:11:\"new_version\";s:6:\"0.4.11\";s:3:\"url\";s:41:\"https://wordpress.org/plugins/fakerpress/\";s:7:\"package\";s:53:\"https://downloads.wordpress.org/plugin/fakerpress.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:63:\"https://ps.w.org/fakerpress/assets/icon-256x256.png?rev=1846090\";s:2:\"1x\";s:55:\"https://ps.w.org/fakerpress/assets/icon.svg?rev=1846090\";s:3:\"svg\";s:55:\"https://ps.w.org/fakerpress/assets/icon.svg?rev=1846090\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:66:\"https://ps.w.org/fakerpress/assets/banner-1544x500.png?rev=1152002\";s:2:\"1x\";s:65:\"https://ps.w.org/fakerpress/assets/banner-772x250.png?rev=1152002\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"4.9.5\";s:12:\"requires_php\";N;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:31:\"query-monitor/query-monitor.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:27:\"w.org/plugins/query-monitor\";s:4:\"slug\";s:13:\"query-monitor\";s:6:\"plugin\";s:31:\"query-monitor/query-monitor.php\";s:11:\"new_version\";s:5:\"3.0.0\";s:3:\"url\";s:44:\"https://wordpress.org/plugins/query-monitor/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/plugin/query-monitor.3.0.0.zip\";s:5:\"icons\";a:1:{s:7:\"default\";s:64:\"https://s.w.org/plugins/geopattern-icon/query-monitor_525f62.svg\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:69:\"https://ps.w.org/query-monitor/assets/banner-1544x500.png?rev=1629576\";s:2:\"1x\";s:68:\"https://ps.w.org/query-monitor/assets/banner-772x250.png?rev=1731469\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"4.9.5\";s:12:\"requires_php\";N;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:35:\"redux-framework/redux-framework.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:29:\"w.org/plugins/redux-framework\";s:4:\"slug\";s:15:\"redux-framework\";s:6:\"plugin\";s:35:\"redux-framework/redux-framework.php\";s:11:\"new_version\";s:5:\"3.6.8\";s:3:\"url\";s:46:\"https://wordpress.org/plugins/redux-framework/\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/plugin/redux-framework.3.6.8.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:67:\"https://ps.w.org/redux-framework/assets/icon-256x256.png?rev=995554\";s:2:\"1x\";s:59:\"https://ps.w.org/redux-framework/assets/icon.svg?rev=995554\";s:3:\"svg\";s:59:\"https://ps.w.org/redux-framework/assets/icon.svg?rev=995554\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:69:\"https://ps.w.org/redux-framework/assets/banner-772x250.png?rev=793165\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"4.9.5\";s:12:\"requires_php\";N;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:27:\"woocommerce/woocommerce.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:25:\"w.org/plugins/woocommerce\";s:4:\"slug\";s:11:\"woocommerce\";s:6:\"plugin\";s:27:\"woocommerce/woocommerce.php\";s:11:\"new_version\";s:5:\"3.3.5\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/woocommerce/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/woocommerce.3.3.5.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/woocommerce/assets/icon-256x256.png?rev=1440831\";s:2:\"1x\";s:64:\"https://ps.w.org/woocommerce/assets/icon-128x128.png?rev=1440831\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/woocommerce/assets/banner-1544x500.png?rev=1629184\";s:2:\"1x\";s:66:\"https://ps.w.org/woocommerce/assets/banner-772x250.png?rev=1629184\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"4.9.5\";s:12:\"requires_php\";N;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:41:\"wordpress-importer/wordpress-importer.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:32:\"w.org/plugins/wordpress-importer\";s:4:\"slug\";s:18:\"wordpress-importer\";s:6:\"plugin\";s:41:\"wordpress-importer/wordpress-importer.php\";s:11:\"new_version\";s:5:\"0.6.4\";s:3:\"url\";s:49:\"https://wordpress.org/plugins/wordpress-importer/\";s:7:\"package\";s:67:\"https://downloads.wordpress.org/plugin/wordpress-importer.0.6.4.zip\";s:5:\"icons\";a:1:{s:7:\"default\";s:69:\"https://s.w.org/plugins/geopattern-icon/wordpress-importer_5696b3.svg\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:72:\"https://ps.w.org/wordpress-importer/assets/banner-772x250.png?rev=547654\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"4.9.5\";s:12:\"requires_php\";N;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:8:{s:30:\"advanced-custom-fields/acf.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:36:\"w.org/plugins/advanced-custom-fields\";s:4:\"slug\";s:22:\"advanced-custom-fields\";s:6:\"plugin\";s:30:\"advanced-custom-fields/acf.php\";s:11:\"new_version\";s:6:\"4.4.12\";s:3:\"url\";s:53:\"https://wordpress.org/plugins/advanced-custom-fields/\";s:7:\"package\";s:72:\"https://downloads.wordpress.org/plugin/advanced-custom-fields.4.4.12.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:75:\"https://ps.w.org/advanced-custom-fields/assets/icon-256x256.png?rev=1082746\";s:2:\"1x\";s:75:\"https://ps.w.org/advanced-custom-fields/assets/icon-128x128.png?rev=1082746\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:78:\"https://ps.w.org/advanced-custom-fields/assets/banner-1544x500.jpg?rev=1729099\";s:2:\"1x\";s:77:\"https://ps.w.org/advanced-custom-fields/assets/banner-772x250.jpg?rev=1729102\";}s:11:\"banners_rtl\";a:0:{}}s:9:\"hello.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=969907\";s:2:\"1x\";s:63:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=969907\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:65:\"https://ps.w.org/hello-dolly/assets/banner-772x250.png?rev=478342\";}s:11:\"banners_rtl\";a:0:{}}s:47:\"show-current-template/show-current-template.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:35:\"w.org/plugins/show-current-template\";s:4:\"slug\";s:21:\"show-current-template\";s:6:\"plugin\";s:47:\"show-current-template/show-current-template.php\";s:11:\"new_version\";s:5:\"0.3.0\";s:3:\"url\";s:52:\"https://wordpress.org/plugins/show-current-template/\";s:7:\"package\";s:70:\"https://downloads.wordpress.org/plugin/show-current-template.0.3.0.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:73:\"https://ps.w.org/show-current-template/assets/icon-256x256.png?rev=976031\";s:2:\"1x\";s:65:\"https://ps.w.org/show-current-template/assets/icon.svg?rev=976031\";s:3:\"svg\";s:65:\"https://ps.w.org/show-current-template/assets/icon.svg?rev=976031\";}s:7:\"banners\";a:0:{}s:11:\"banners_rtl\";a:0:{}}s:27:\"theme-check/theme-check.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/theme-check\";s:4:\"slug\";s:11:\"theme-check\";s:6:\"plugin\";s:27:\"theme-check/theme-check.php\";s:11:\"new_version\";s:10:\"20160523.1\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/theme-check/\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/plugin/theme-check.20160523.1.zip\";s:5:\"icons\";a:1:{s:2:\"1x\";s:63:\"https://ps.w.org/theme-check/assets/icon-128x128.png?rev=972579\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:66:\"https://ps.w.org/theme-check/assets/banner-1544x500.png?rev=904294\";s:2:\"1x\";s:65:\"https://ps.w.org/theme-check/assets/banner-772x250.png?rev=904294\";}s:11:\"banners_rtl\";a:0:{}}s:49:\"woocommerce-email-test/woocommerce-email-test.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:36:\"w.org/plugins/woocommerce-email-test\";s:4:\"slug\";s:22:\"woocommerce-email-test\";s:6:\"plugin\";s:49:\"woocommerce-email-test/woocommerce-email-test.php\";s:11:\"new_version\";s:4:\"1.10\";s:3:\"url\";s:53:\"https://wordpress.org/plugins/woocommerce-email-test/\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/plugin/woocommerce-email-test.zip\";s:5:\"icons\";a:1:{s:2:\"1x\";s:75:\"https://ps.w.org/woocommerce-email-test/assets/icon-128x128.png?rev=1571010\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:77:\"https://ps.w.org/woocommerce-email-test/assets/banner-772x250.png?rev=1590770\";}s:11:\"banners_rtl\";a:0:{}}s:51:\"wordpress-popular-posts/wordpress-popular-posts.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:37:\"w.org/plugins/wordpress-popular-posts\";s:4:\"slug\";s:23:\"wordpress-popular-posts\";s:6:\"plugin\";s:51:\"wordpress-popular-posts/wordpress-popular-posts.php\";s:11:\"new_version\";s:6:\"4.0.13\";s:3:\"url\";s:54:\"https://wordpress.org/plugins/wordpress-popular-posts/\";s:7:\"package\";s:73:\"https://downloads.wordpress.org/plugin/wordpress-popular-posts.4.0.13.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:76:\"https://ps.w.org/wordpress-popular-posts/assets/icon-256x256.png?rev=1232659\";s:2:\"1x\";s:76:\"https://ps.w.org/wordpress-popular-posts/assets/icon-128x128.png?rev=1232659\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:78:\"https://ps.w.org/wordpress-popular-posts/assets/banner-772x250.png?rev=1130670\";}s:11:\"banners_rtl\";a:0:{}}s:31:\"wp-log-viewer/wp-log-viewer.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:27:\"w.org/plugins/wp-log-viewer\";s:4:\"slug\";s:13:\"wp-log-viewer\";s:6:\"plugin\";s:31:\"wp-log-viewer/wp-log-viewer.php\";s:11:\"new_version\";s:5:\"1.2.1\";s:3:\"url\";s:44:\"https://wordpress.org/plugins/wp-log-viewer/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/plugin/wp-log-viewer.1.2.1.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:66:\"https://ps.w.org/wp-log-viewer/assets/icon-256x256.png?rev=1318896\";s:2:\"1x\";s:66:\"https://ps.w.org/wp-log-viewer/assets/icon-128x128.png?rev=1318896\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:69:\"https://ps.w.org/wp-log-viewer/assets/banner-1544x500.png?rev=1318896\";s:2:\"1x\";s:68:\"https://ps.w.org/wp-log-viewer/assets/banner-772x250.png?rev=1318896\";}s:11:\"banners_rtl\";a:0:{}}s:27:\"wp-subtitle/wp-subtitle.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/wp-subtitle\";s:4:\"slug\";s:11:\"wp-subtitle\";s:6:\"plugin\";s:27:\"wp-subtitle/wp-subtitle.php\";s:11:\"new_version\";s:3:\"3.0\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/wp-subtitle/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/wp-subtitle.3.0.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/wp-subtitle/assets/icon-256x256.png?rev=981565\";s:2:\"1x\";s:63:\"https://ps.w.org/wp-subtitle/assets/icon-128x128.png?rev=981565\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:66:\"https://ps.w.org/wp-subtitle/assets/banner-1544x500.png?rev=981565\";s:2:\"1x\";s:65:\"https://ps.w.org/wp-subtitle/assets/banner-772x250.png?rev=981565\";}s:11:\"banners_rtl\";a:0:{}}}}', 'no'),
(3078, '_site_transient_timeout_browser_12858c4d8a56691c0cd838e23b749350', '1524398398', 'no'),
(3079, '_site_transient_browser_12858c4d8a56691c0cd838e23b749350', 'a:10:{s:4:\"name\";s:5:\"Opera\";s:7:\"version\";s:12:\"52.0.2871.64\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:22:\"https://www.opera.com/\";s:7:\"img_src\";s:42:\"http://s.w.org/images/browsers/opera.png?1\";s:11:\"img_src_ssl\";s:43:\"https://s.w.org/images/browsers/opera.png?1\";s:15:\"current_version\";s:5:\"12.18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(3080, '_transient_timeout_wc_report_sales_by_date', '1523904775', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(3081, '_transient_wc_report_sales_by_date', 'a:24:{s:32:\"e57bcdc27eb7901e390a769099c39b03\";a:0:{}s:32:\"6f0c83db7bb3a66424893a0784d91dc5\";a:0:{}s:32:\"65f2e4812712c03423d7a7e4eaf679b9\";a:0:{}s:32:\"1de139b84ae7693a0669ae633e12118f\";N;s:32:\"cde8e91f2785f16c63d734155e3a0b72\";a:0:{}s:32:\"f54871b7a1498b25bd8320fccec49308\";a:0:{}s:32:\"0e297d35908f2c34955c32b9c0d828ae\";a:0:{}s:32:\"e6545c6b48c049c235ad28bc22d7d76b\";a:0:{}s:32:\"d86aa660ad5a01e815c83c67eb2e07f3\";a:0:{}s:32:\"42d03ccab301db4a6ddc266aab8ceea3\";a:0:{}s:32:\"523c198caa7388cff955ca66a8231a12\";a:0:{}s:32:\"8a65538c3f728b00e0c6b89c58343094\";N;s:32:\"d5ce7a09402dbd4d956eb38b798ccb4b\";a:0:{}s:32:\"7e662a8827e70a50e217ff8009fa0968\";a:0:{}s:32:\"b80b4eacf6477e7fa55a62e51ffc2102\";a:0:{}s:32:\"56ed895abde376c148eba546b153332c\";a:0:{}s:32:\"073e6916474f9b5512de335177867f2f\";a:0:{}s:32:\"d37399d34f75fa2295dbf9fd696c6939\";a:0:{}s:32:\"ef01a573d0407b1f637fb76a2dd9fd26\";a:0:{}s:32:\"71a468d05534f63856ba7ebee04e5bc1\";N;s:32:\"70d6ccdd7ae01ca77aa5644234f4e23a\";a:0:{}s:32:\"fe4ad5205076db8cba47511a4c13d6e1\";a:0:{}s:32:\"27dbb785b766d9a536d82a8cdc2a93f1\";a:0:{}s:32:\"ff146000dfdf517182ab0416c1599952\";a:0:{}}', 'no'),
(3082, '_transient_timeout_wc_admin_report', '1523880000', 'no'),
(3083, '_transient_wc_admin_report', 'a:1:{s:32:\"0f0ec9de5047e6e97bbbe8fa71f51bfb\";a:0:{}}', 'no'),
(3084, '_site_transient_timeout_community-events-7d0a1195c151198eacae373891f7d3ff', '1523836810', 'no'),
(3085, '_site_transient_community-events-7d0a1195c151198eacae373891f7d3ff', 'a:2:{s:8:\"location\";a:3:{s:11:\"description\";s:6:\"Lahore\";s:8:\"latitude\";s:10:\"31.5580000\";s:9:\"longitude\";s:10:\"74.3507100\";}s:6:\"events\";a:1:{i:0;a:7:{s:4:\"type\";s:6:\"meetup\";s:5:\"title\";s:43:\"🎉 WordPress 15th Anniversary Celebration\";s:3:\"url\";s:57:\"https://www.meetup.com/WordPress-Lahore/events/249094455/\";s:6:\"meetup\";s:24:\"WordPress Meetups Lahore\";s:10:\"meetup_url\";s:40:\"https://www.meetup.com/WordPress-Lahore/\";s:4:\"date\";s:19:\"2018-05-26 20:00:00\";s:8:\"location\";a:4:{s:8:\"location\";s:24:\"Lahore, Punjab, Pakistan\";s:7:\"country\";s:2:\"PK\";s:8:\"latitude\";d:31.559999465941999;s:9:\"longitude\";d:74.349998474120994;}}}}', 'no'),
(3088, '_transient_timeout_external_ip_address_::1', '1524404800', 'no'),
(3089, '_transient_external_ip_address_::1', '39.37.176.212', 'no'),
(3096, '_site_transient_timeout_theme_roots', '1523820421', 'no'),
(3097, '_site_transient_theme_roots', 'a:5:{s:10:\"storefront\";s:7:\"/themes\";s:13:\"twentyfifteen\";s:7:\"/themes\";s:15:\"twentyseventeen\";s:7:\"/themes\";s:13:\"twentysixteen\";s:7:\"/themes\";s:5:\"udemy\";s:7:\"/themes\";}', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `wp_popularpostsdata`
--

CREATE TABLE `wp_popularpostsdata` (
  `postid` bigint(20) NOT NULL,
  `day` datetime NOT NULL,
  `last_viewed` datetime NOT NULL,
  `pageviews` bigint(20) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_popularpostsdata`
--

INSERT INTO `wp_popularpostsdata` (`postid`, `day`, `last_viewed`, `pageviews`) VALUES
(4, '2017-12-22 17:38:00', '2017-12-22 17:38:00', 1),
(9, '2017-09-16 11:13:57', '2017-11-24 12:21:26', 3),
(12, '2017-09-16 11:14:05', '2017-11-27 08:09:22', 3),
(17, '2017-09-18 08:40:43', '2017-09-18 08:40:43', 1),
(43, '2017-09-16 11:13:53', '2018-04-07 21:30:48', 10),
(44, '2018-03-03 19:08:40', '2018-03-03 19:08:40', 1),
(45, '2017-09-18 09:20:25', '2017-11-27 08:13:35', 2),
(46, '2018-03-04 14:28:23', '2018-03-04 14:31:03', 5),
(75, '2018-03-19 19:19:20', '2018-03-19 19:19:36', 2),
(137, '2017-09-23 15:30:23', '2018-03-04 10:51:37', 146),
(139, '2017-10-15 17:42:21', '2018-02-12 20:16:20', 117),
(146, '2017-11-17 14:21:55', '2018-02-25 20:24:36', 107),
(151, '2018-01-01 21:54:14', '2018-01-01 21:54:14', 1),
(155, '2018-02-04 15:49:00', '2018-02-05 13:29:10', 104),
(165, '2018-02-18 17:23:48', '2018-02-18 17:29:34', 3),
(167, '2018-02-18 20:18:45', '2018-02-20 20:26:43', 2),
(168, '2018-02-18 20:18:42', '2018-02-25 10:53:09', 7),
(187, '2018-02-18 20:18:48', '2018-02-18 20:18:48', 1),
(190, '2018-03-03 19:43:25', '2018-03-03 19:50:39', 3),
(191, '2018-03-04 10:48:04', '2018-03-04 10:51:39', 3),
(243, '2018-03-24 18:02:05', '2018-04-08 11:05:20', 2);

-- --------------------------------------------------------

--
-- Table structure for table `wp_popularpostssummary`
--

CREATE TABLE `wp_popularpostssummary` (
  `ID` bigint(20) NOT NULL,
  `postid` bigint(20) NOT NULL,
  `pageviews` bigint(20) NOT NULL DEFAULT '1',
  `view_date` date NOT NULL,
  `view_datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_popularpostssummary`
--

INSERT INTO `wp_popularpostssummary` (`ID`, `postid`, `pageviews`, `view_date`, `view_datetime`) VALUES
(1, 43, 2, '2017-09-16', '2017-09-16 13:01:53'),
(2, 9, 1, '2017-09-16', '2017-09-16 11:13:57'),
(3, 12, 1, '2017-09-16', '2017-09-16 11:14:05'),
(4, 43, 2, '2017-09-18', '2017-09-18 10:54:53'),
(5, 17, 1, '2017-09-18', '2017-09-18 08:40:43'),
(6, 45, 1, '2017-09-18', '2017-09-18 09:20:25'),
(8, 12, 1, '2017-09-18', '2017-09-18 10:55:02'),
(9, 137, 6, '2017-09-23', '2017-09-23 19:05:18'),
(10, 43, 1, '2017-09-26', '2017-09-26 19:06:28'),
(11, 137, 8, '2017-09-26', '2017-09-26 19:57:54'),
(12, 137, 6, '2017-09-27', '2017-09-27 06:42:06'),
(13, 137, 4, '2017-09-28', '2017-09-28 19:48:02'),
(14, 137, 23, '2017-09-30', '2017-09-30 19:15:43'),
(15, 137, 47, '2017-10-09', '2017-10-09 18:08:06'),
(16, 137, 1, '2017-10-10', '2017-10-10 12:39:47'),
(17, 137, 14, '2017-10-13', '2017-10-13 20:56:33'),
(18, 139, 5, '2017-10-15', '2017-10-15 19:21:29'),
(19, 139, 24, '2017-10-29', '2017-10-29 19:18:58'),
(20, 139, 24, '2017-10-30', '2017-10-30 20:42:42'),
(21, 137, 1, '2017-11-14', '2017-11-14 20:57:05'),
(22, 139, 1, '2017-11-14', '2017-11-14 20:57:09'),
(23, 146, 3, '2017-11-17', '2017-11-17 15:36:19'),
(24, 9, 2, '2017-11-24', '2017-11-24 12:21:26'),
(26, 139, 2, '2017-11-24', '2017-11-24 16:59:50'),
(27, 146, 43, '2017-11-24', '2017-11-24 17:39:43'),
(28, 146, 9, '2017-11-25', '2017-11-25 20:16:26'),
(29, 146, 46, '2017-11-26', '2017-11-26 16:49:07'),
(30, 146, 3, '2017-11-27', '2017-11-27 20:17:38'),
(31, 12, 1, '2017-11-27', '2017-11-27 08:09:22'),
(32, 45, 1, '2017-11-27', '2017-11-27 08:13:35'),
(33, 139, 2, '2017-11-27', '2017-11-27 20:17:23'),
(36, 137, 4, '2017-11-27', '2017-11-27 20:44:44'),
(37, 137, 1, '2017-12-11', '2017-12-11 19:58:12'),
(38, 137, 1, '2017-12-11', '2017-12-11 20:29:24'),
(39, 137, 1, '2017-12-11', '2017-12-11 20:31:02'),
(40, 4, 1, '2017-12-22', '2017-12-22 17:38:00'),
(41, 139, 1, '2017-12-22', '2017-12-22 17:38:42'),
(42, 139, 1, '2017-12-22', '2017-12-22 17:44:07'),
(43, 137, 1, '2017-12-22', '2017-12-22 17:44:15'),
(44, 137, 1, '2017-12-22', '2017-12-22 17:44:44'),
(45, 139, 1, '2017-12-25', '2017-12-25 16:43:58'),
(46, 139, 1, '2017-12-25', '2017-12-25 16:45:11'),
(47, 139, 1, '2017-12-25', '2017-12-25 16:49:11'),
(48, 139, 1, '2017-12-25', '2017-12-25 16:50:38'),
(49, 139, 1, '2017-12-25', '2017-12-25 16:51:44'),
(50, 139, 1, '2017-12-25', '2017-12-25 16:52:06'),
(51, 139, 1, '2017-12-25', '2017-12-25 17:32:12'),
(52, 139, 1, '2017-12-25', '2017-12-25 17:33:14'),
(53, 139, 1, '2017-12-25', '2017-12-25 17:34:50'),
(54, 139, 1, '2017-12-25', '2017-12-25 17:38:12'),
(55, 139, 1, '2017-12-25', '2017-12-25 17:39:16'),
(56, 139, 1, '2017-12-25', '2017-12-25 17:40:34'),
(57, 137, 1, '2017-12-25', '2017-12-25 17:42:22'),
(58, 139, 1, '2017-12-25', '2017-12-25 17:42:30'),
(59, 139, 1, '2017-12-25', '2017-12-25 17:43:58'),
(60, 139, 1, '2017-12-25', '2017-12-25 17:44:26'),
(61, 139, 1, '2017-12-25', '2017-12-25 17:45:57'),
(62, 139, 1, '2017-12-25', '2017-12-25 17:46:16'),
(63, 139, 1, '2017-12-25', '2017-12-25 17:46:41'),
(64, 139, 1, '2017-12-25', '2017-12-25 17:47:17'),
(65, 139, 1, '2017-12-26', '2017-12-26 08:13:38'),
(66, 139, 1, '2017-12-26', '2017-12-26 08:16:44'),
(67, 139, 1, '2017-12-26', '2017-12-26 08:18:45'),
(68, 139, 1, '2017-12-26', '2017-12-26 08:19:53'),
(69, 139, 1, '2017-12-26', '2017-12-26 08:23:38'),
(70, 139, 1, '2017-12-26', '2017-12-26 08:28:01'),
(71, 139, 1, '2017-12-26', '2017-12-26 08:54:52'),
(72, 139, 1, '2017-12-26', '2017-12-26 13:20:44'),
(73, 139, 1, '2017-12-26', '2017-12-26 13:21:46'),
(74, 139, 1, '2017-12-26', '2017-12-26 13:22:26'),
(75, 139, 1, '2017-12-26', '2017-12-26 13:23:27'),
(76, 139, 1, '2017-12-26', '2017-12-26 20:38:17'),
(77, 139, 1, '2017-12-26', '2017-12-26 20:39:37'),
(78, 139, 1, '2017-12-26', '2017-12-26 20:42:10'),
(79, 139, 1, '2017-12-26', '2017-12-26 20:43:05'),
(80, 151, 1, '2018-01-01', '2018-01-01 21:54:14'),
(81, 146, 1, '2018-01-14', '2018-01-14 16:35:17'),
(82, 139, 1, '2018-01-14', '2018-01-14 16:35:20'),
(83, 139, 1, '2018-01-14', '2018-01-14 16:37:11'),
(84, 43, 1, '2018-02-02', '2018-02-02 20:57:30'),
(85, 155, 1, '2018-02-04', '2018-02-04 15:49:00'),
(86, 155, 1, '2018-02-04', '2018-02-04 15:49:46'),
(87, 155, 1, '2018-02-04', '2018-02-04 15:52:39'),
(88, 155, 1, '2018-02-04', '2018-02-04 16:17:22'),
(89, 155, 1, '2018-02-04', '2018-02-04 16:17:46'),
(90, 155, 1, '2018-02-04', '2018-02-04 16:19:15'),
(91, 155, 1, '2018-02-04', '2018-02-04 16:19:58'),
(92, 155, 1, '2018-02-04', '2018-02-04 16:20:29'),
(93, 155, 1, '2018-02-04', '2018-02-04 16:33:52'),
(94, 155, 1, '2018-02-04', '2018-02-04 16:34:12'),
(95, 155, 1, '2018-02-04', '2018-02-04 16:34:20'),
(96, 155, 1, '2018-02-04', '2018-02-04 16:34:39'),
(97, 155, 1, '2018-02-04', '2018-02-04 19:33:37'),
(98, 155, 1, '2018-02-04', '2018-02-04 19:34:09'),
(99, 155, 1, '2018-02-04', '2018-02-04 19:36:12'),
(100, 155, 1, '2018-02-04', '2018-02-04 19:36:45'),
(101, 155, 1, '2018-02-04', '2018-02-04 19:36:49'),
(102, 155, 1, '2018-02-04', '2018-02-04 19:37:08'),
(103, 155, 1, '2018-02-04', '2018-02-04 19:38:57'),
(104, 155, 1, '2018-02-04', '2018-02-04 19:39:22'),
(105, 155, 1, '2018-02-04', '2018-02-04 19:40:09'),
(106, 155, 1, '2018-02-04', '2018-02-04 19:40:44'),
(107, 155, 1, '2018-02-04', '2018-02-04 19:41:11'),
(108, 155, 1, '2018-02-04', '2018-02-04 19:45:08'),
(109, 155, 1, '2018-02-04', '2018-02-04 19:46:31'),
(110, 155, 1, '2018-02-04', '2018-02-04 19:46:35'),
(111, 155, 1, '2018-02-04', '2018-02-04 19:47:05'),
(112, 155, 1, '2018-02-04', '2018-02-04 19:47:28'),
(113, 155, 1, '2018-02-04', '2018-02-04 20:00:10'),
(114, 155, 1, '2018-02-04', '2018-02-04 20:00:21'),
(115, 155, 1, '2018-02-04', '2018-02-04 20:01:58'),
(116, 155, 1, '2018-02-04', '2018-02-04 20:02:02'),
(117, 155, 1, '2018-02-04', '2018-02-04 20:02:21'),
(118, 155, 1, '2018-02-04', '2018-02-04 20:10:08'),
(119, 155, 1, '2018-02-04', '2018-02-04 20:10:19'),
(120, 155, 1, '2018-02-04', '2018-02-04 20:10:37'),
(121, 155, 1, '2018-02-04', '2018-02-04 20:22:14'),
(122, 155, 1, '2018-02-04', '2018-02-04 20:24:14'),
(123, 155, 1, '2018-02-04', '2018-02-04 20:24:55'),
(124, 155, 1, '2018-02-04', '2018-02-04 20:25:20'),
(125, 155, 1, '2018-02-04', '2018-02-04 20:26:32'),
(126, 155, 1, '2018-02-04', '2018-02-04 20:53:27'),
(127, 155, 1, '2018-02-04', '2018-02-04 20:54:10'),
(128, 155, 1, '2018-02-04', '2018-02-04 20:56:40'),
(129, 155, 1, '2018-02-04', '2018-02-04 20:57:20'),
(130, 155, 1, '2018-02-04', '2018-02-04 21:05:25'),
(131, 155, 1, '2018-02-04', '2018-02-04 21:05:50'),
(132, 155, 1, '2018-02-04', '2018-02-04 21:41:47'),
(133, 155, 1, '2018-02-04', '2018-02-04 21:45:45'),
(134, 155, 1, '2018-02-04', '2018-02-04 21:45:52'),
(135, 155, 1, '2018-02-04', '2018-02-04 22:21:27'),
(136, 155, 1, '2018-02-04', '2018-02-04 22:22:41'),
(137, 155, 1, '2018-02-05', '2018-02-05 08:39:00'),
(138, 155, 1, '2018-02-05', '2018-02-05 08:40:15'),
(139, 155, 1, '2018-02-05', '2018-02-05 08:41:29'),
(140, 155, 1, '2018-02-05', '2018-02-05 08:43:00'),
(141, 155, 1, '2018-02-05', '2018-02-05 08:43:45'),
(142, 155, 1, '2018-02-05', '2018-02-05 08:44:07'),
(143, 155, 1, '2018-02-05', '2018-02-05 08:44:51'),
(144, 155, 1, '2018-02-05', '2018-02-05 08:45:43'),
(145, 155, 1, '2018-02-05', '2018-02-05 08:45:49'),
(146, 155, 1, '2018-02-05', '2018-02-05 08:48:25'),
(147, 155, 1, '2018-02-05', '2018-02-05 08:50:29'),
(148, 155, 1, '2018-02-05', '2018-02-05 08:54:17'),
(149, 155, 1, '2018-02-05', '2018-02-05 08:55:33'),
(150, 155, 1, '2018-02-05', '2018-02-05 08:57:14'),
(151, 155, 1, '2018-02-05', '2018-02-05 09:01:12'),
(152, 155, 1, '2018-02-05', '2018-02-05 09:01:43'),
(153, 155, 1, '2018-02-05', '2018-02-05 09:02:03'),
(154, 155, 1, '2018-02-05', '2018-02-05 09:02:29'),
(155, 155, 1, '2018-02-05', '2018-02-05 09:03:43'),
(156, 155, 1, '2018-02-05', '2018-02-05 09:07:08'),
(157, 155, 1, '2018-02-05', '2018-02-05 09:09:33'),
(158, 155, 1, '2018-02-05', '2018-02-05 09:13:25'),
(159, 155, 1, '2018-02-05', '2018-02-05 09:20:41'),
(160, 155, 1, '2018-02-05', '2018-02-05 09:24:14'),
(161, 155, 1, '2018-02-05', '2018-02-05 09:24:28'),
(162, 155, 1, '2018-02-05', '2018-02-05 09:25:42'),
(163, 155, 1, '2018-02-05', '2018-02-05 09:26:37'),
(164, 155, 1, '2018-02-05', '2018-02-05 09:27:40'),
(165, 155, 1, '2018-02-05', '2018-02-05 09:28:08'),
(166, 155, 1, '2018-02-05', '2018-02-05 09:28:56'),
(167, 155, 1, '2018-02-05', '2018-02-05 09:28:59'),
(168, 155, 1, '2018-02-05', '2018-02-05 09:29:48'),
(169, 155, 1, '2018-02-05', '2018-02-05 09:30:19'),
(170, 155, 1, '2018-02-05', '2018-02-05 09:34:35'),
(171, 155, 1, '2018-02-05', '2018-02-05 09:35:53'),
(172, 155, 1, '2018-02-05', '2018-02-05 09:36:26'),
(173, 155, 1, '2018-02-05', '2018-02-05 09:36:49'),
(174, 155, 1, '2018-02-05', '2018-02-05 09:39:21'),
(175, 155, 1, '2018-02-05', '2018-02-05 09:40:25'),
(176, 155, 1, '2018-02-05', '2018-02-05 09:43:17'),
(177, 155, 1, '2018-02-05', '2018-02-05 09:53:11'),
(178, 155, 1, '2018-02-05', '2018-02-05 09:57:19'),
(179, 155, 1, '2018-02-05', '2018-02-05 10:00:38'),
(180, 155, 1, '2018-02-05', '2018-02-05 10:02:29'),
(181, 155, 1, '2018-02-05', '2018-02-05 10:07:01'),
(182, 155, 1, '2018-02-05', '2018-02-05 10:07:08'),
(183, 155, 1, '2018-02-05', '2018-02-05 10:21:58'),
(184, 155, 1, '2018-02-05', '2018-02-05 11:25:13'),
(185, 155, 1, '2018-02-05', '2018-02-05 11:38:12'),
(186, 155, 1, '2018-02-05', '2018-02-05 11:50:11'),
(187, 155, 1, '2018-02-05', '2018-02-05 12:01:18'),
(188, 155, 1, '2018-02-05', '2018-02-05 13:29:10'),
(189, 139, 1, '2018-02-11', '2018-02-11 10:38:43'),
(190, 139, 1, '2018-02-11', '2018-02-11 10:38:51'),
(191, 139, 1, '2018-02-11', '2018-02-11 10:40:56'),
(192, 139, 1, '2018-02-11', '2018-02-11 10:42:14'),
(193, 139, 1, '2018-02-11', '2018-02-11 10:42:18'),
(194, 139, 1, '2018-02-11', '2018-02-11 10:44:11'),
(195, 139, 1, '2018-02-11', '2018-02-11 10:44:13'),
(196, 139, 1, '2018-02-11', '2018-02-11 10:47:03'),
(197, 139, 1, '2018-02-11', '2018-02-11 10:57:41'),
(198, 139, 1, '2018-02-11', '2018-02-11 10:58:18'),
(199, 139, 1, '2018-02-11', '2018-02-11 11:00:14'),
(200, 139, 1, '2018-02-11', '2018-02-11 11:06:35'),
(201, 139, 1, '2018-02-11', '2018-02-11 11:16:31'),
(202, 139, 1, '2018-02-11', '2018-02-11 12:52:28'),
(203, 139, 1, '2018-02-11', '2018-02-11 12:52:46'),
(204, 139, 1, '2018-02-11', '2018-02-11 13:07:14'),
(205, 139, 1, '2018-02-11', '2018-02-11 13:15:58'),
(206, 139, 1, '2018-02-11', '2018-02-11 13:18:06'),
(207, 139, 1, '2018-02-11', '2018-02-11 13:20:49'),
(208, 139, 1, '2018-02-11', '2018-02-11 13:21:20'),
(209, 139, 1, '2018-02-12', '2018-02-12 20:16:20'),
(210, 137, 1, '2018-02-18', '2018-02-18 14:48:51'),
(211, 137, 1, '2018-02-18', '2018-02-18 14:50:36'),
(212, 137, 1, '2018-02-18', '2018-02-18 14:51:15'),
(213, 137, 1, '2018-02-18', '2018-02-18 14:52:55'),
(214, 137, 1, '2018-02-18', '2018-02-18 14:53:51'),
(215, 137, 1, '2018-02-18', '2018-02-18 14:56:19'),
(216, 137, 1, '2018-02-18', '2018-02-18 14:56:50'),
(217, 137, 1, '2018-02-18', '2018-02-18 14:57:11'),
(218, 137, 1, '2018-02-18', '2018-02-18 15:00:09'),
(219, 137, 1, '2018-02-18', '2018-02-18 15:05:12'),
(220, 137, 1, '2018-02-18', '2018-02-18 15:16:10'),
(221, 137, 1, '2018-02-18', '2018-02-18 15:17:23'),
(222, 137, 1, '2018-02-18', '2018-02-18 15:17:44'),
(223, 137, 1, '2018-02-18', '2018-02-18 15:19:26'),
(224, 137, 1, '2018-02-18', '2018-02-18 15:19:55'),
(225, 137, 1, '2018-02-18', '2018-02-18 15:20:35'),
(226, 137, 1, '2018-02-18', '2018-02-18 15:24:26'),
(227, 137, 1, '2018-02-18', '2018-02-18 15:27:32'),
(228, 137, 1, '2018-02-18', '2018-02-18 15:28:00'),
(229, 137, 1, '2018-02-18', '2018-02-18 15:29:06'),
(230, 137, 1, '2018-02-18', '2018-02-18 15:29:16'),
(231, 137, 1, '2018-02-18', '2018-02-18 15:35:30'),
(232, 137, 1, '2018-02-18', '2018-02-18 15:35:37'),
(233, 137, 1, '2018-02-18', '2018-02-18 15:35:41'),
(234, 137, 1, '2018-02-18', '2018-02-18 15:37:14'),
(235, 165, 1, '2018-02-18', '2018-02-18 17:23:48'),
(236, 165, 1, '2018-02-18', '2018-02-18 17:29:16'),
(237, 165, 1, '2018-02-18', '2018-02-18 17:29:34'),
(238, 168, 1, '2018-02-18', '2018-02-18 20:18:42'),
(239, 167, 1, '2018-02-18', '2018-02-18 20:18:45'),
(240, 187, 1, '2018-02-18', '2018-02-18 20:18:48'),
(241, 168, 1, '2018-02-20', '2018-02-20 20:26:25'),
(242, 167, 1, '2018-02-20', '2018-02-20 20:26:43'),
(243, 168, 1, '2018-02-20', '2018-02-20 20:27:13'),
(244, 168, 1, '2018-02-20', '2018-02-20 20:28:07'),
(245, 168, 1, '2018-02-20', '2018-02-20 20:31:54'),
(246, 168, 1, '2018-02-20', '2018-02-20 20:36:47'),
(247, 168, 1, '2018-02-25', '2018-02-25 10:53:09'),
(248, 146, 1, '2018-02-25', '2018-02-25 20:24:32'),
(249, 146, 1, '2018-02-25', '2018-02-25 20:24:36'),
(250, 44, 1, '2018-03-03', '2018-03-03 19:08:40'),
(251, 190, 1, '2018-03-03', '2018-03-03 19:43:25'),
(252, 190, 1, '2018-03-03', '2018-03-03 19:43:48'),
(253, 190, 1, '2018-03-03', '2018-03-03 19:50:39'),
(254, 191, 1, '2018-03-04', '2018-03-04 10:48:04'),
(255, 191, 1, '2018-03-04', '2018-03-04 10:51:18'),
(256, 137, 1, '2018-03-04', '2018-03-04 10:51:37'),
(257, 191, 1, '2018-03-04', '2018-03-04 10:51:39'),
(258, 46, 1, '2018-03-04', '2018-03-04 14:28:23'),
(259, 46, 1, '2018-03-04', '2018-03-04 14:28:24'),
(260, 46, 1, '2018-03-04', '2018-03-04 14:30:58'),
(261, 46, 1, '2018-03-04', '2018-03-04 14:30:59'),
(262, 46, 1, '2018-03-04', '2018-03-04 14:31:03'),
(263, 75, 1, '2018-03-19', '2018-03-19 19:19:20'),
(264, 75, 1, '2018-03-19', '2018-03-19 19:19:36'),
(265, 243, 1, '2018-03-24', '2018-03-24 18:02:05'),
(266, 43, 1, '2018-04-07', '2018-04-07 21:21:38'),
(267, 43, 1, '2018-04-07', '2018-04-07 21:23:00'),
(268, 43, 1, '2018-04-07', '2018-04-07 21:23:03'),
(269, 43, 1, '2018-04-07', '2018-04-07 21:30:48'),
(270, 243, 1, '2018-04-08', '2018-04-08 11:05:20');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 4, 'fakerpress_flag', '1'),
(3, 5, '_wp_attached_file', '2017/08/fa93663e-f959-36e1-a5f9-45788012d5e1.jpg'),
(4, 5, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:447;s:6:\"height\";i:357;s:4:\"file\";s:48:\"2017/08/fa93663e-f959-36e1-a5f9-45788012d5e1.jpg\";s:5:\"sizes\";a:5:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:48:\"fa93663e-f959-36e1-a5f9-45788012d5e1-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:1;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:48:\"fa93663e-f959-36e1-a5f9-45788012d5e1-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:48:\"fa93663e-f959-36e1-a5f9-45788012d5e1-416x332.jpg\";s:5:\"width\";i:416;s:6:\"height\";i:332;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:48:\"fa93663e-f959-36e1-a5f9-45788012d5e1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:48:\"fa93663e-f959-36e1-a5f9-45788012d5e1-300x240.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:240;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(5, 5, 'fakerpress_flag', '1'),
(6, 6, 'fakerpress_flag', '1'),
(7, 7, 'fakerpress_flag', '1'),
(8, 8, '_wp_attached_file', '2017/08/a5922831-128d-3756-baf6-a945f8d7d164.jpg'),
(9, 8, '_wp_attachment_metadata', 'a:0:{}'),
(10, 8, 'fakerpress_flag', '1'),
(11, 7, '_thumbnail_id', '8'),
(12, 9, 'fakerpress_flag', '1'),
(13, 10, '_wp_attached_file', '2017/08/9e9a0fe7-0766-374f-8f1d-bbcdbb126e47.jpg'),
(14, 10, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1385;s:6:\"height\";i:923;s:4:\"file\";s:48:\"2017/08/9e9a0fe7-0766-374f-8f1d-bbcdbb126e47.jpg\";s:5:\"sizes\";a:7:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:48:\"9e9a0fe7-0766-374f-8f1d-bbcdbb126e47-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:1;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:48:\"9e9a0fe7-0766-374f-8f1d-bbcdbb126e47-600x400.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:400;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:48:\"9e9a0fe7-0766-374f-8f1d-bbcdbb126e47-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:48:\"9e9a0fe7-0766-374f-8f1d-bbcdbb126e47-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:48:\"9e9a0fe7-0766-374f-8f1d-bbcdbb126e47-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:48:\"9e9a0fe7-0766-374f-8f1d-bbcdbb126e47-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:49:\"9e9a0fe7-0766-374f-8f1d-bbcdbb126e47-1024x682.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:682;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(15, 10, 'fakerpress_flag', '1'),
(16, 11, '_wp_attached_file', '2017/08/2c4ded2d-bb5b-3a02-9836-9d00c0dbbae9.jpg'),
(17, 11, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:330;s:6:\"height\";i:264;s:4:\"file\";s:48:\"2017/08/2c4ded2d-bb5b-3a02-9836-9d00c0dbbae9.jpg\";s:5:\"sizes\";a:4:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:48:\"2c4ded2d-bb5b-3a02-9836-9d00c0dbbae9-300x264.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:264;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:1;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:48:\"2c4ded2d-bb5b-3a02-9836-9d00c0dbbae9-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:48:\"2c4ded2d-bb5b-3a02-9836-9d00c0dbbae9-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:48:\"2c4ded2d-bb5b-3a02-9836-9d00c0dbbae9-300x240.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:240;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(18, 11, 'fakerpress_flag', '1'),
(19, 12, 'fakerpress_flag', '1'),
(20, 13, '_wp_attached_file', '2017/08/1c5c199a-cdc4-302d-a739-81679081c457.jpg'),
(21, 13, '_wp_attachment_metadata', 'a:0:{}'),
(22, 13, 'fakerpress_flag', '1'),
(23, 12, '_thumbnail_id', '11'),
(24, 14, '_wp_attached_file', '2017/08/39c0276a-a914-3ce9-9173-5f5cff1fd6e4.jpg'),
(25, 14, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:438;s:6:\"height\";i:350;s:4:\"file\";s:48:\"2017/08/39c0276a-a914-3ce9-9173-5f5cff1fd6e4.jpg\";s:5:\"sizes\";a:5:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:48:\"39c0276a-a914-3ce9-9173-5f5cff1fd6e4-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:1;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:48:\"39c0276a-a914-3ce9-9173-5f5cff1fd6e4-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:48:\"39c0276a-a914-3ce9-9173-5f5cff1fd6e4-416x332.jpg\";s:5:\"width\";i:416;s:6:\"height\";i:332;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:48:\"39c0276a-a914-3ce9-9173-5f5cff1fd6e4-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:48:\"39c0276a-a914-3ce9-9173-5f5cff1fd6e4-300x240.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:240;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(26, 14, 'fakerpress_flag', '1'),
(27, 15, 'fakerpress_flag', '1'),
(28, 16, '_wp_attached_file', '2017/08/f627ad3a-c58f-348e-bf18-4e9b8af5d473.jpg'),
(29, 16, '_wp_attachment_metadata', 'a:0:{}'),
(30, 16, 'fakerpress_flag', '1'),
(31, 15, '_thumbnail_id', '16'),
(32, 17, 'fakerpress_flag', '1'),
(33, 18, '_wp_attached_file', '2017/08/12dc21bf-e899-3031-981d-a430dbd86643.jpg'),
(34, 18, '_wp_attachment_metadata', 'a:0:{}'),
(35, 18, 'fakerpress_flag', '1'),
(36, 17, '_thumbnail_id', '27'),
(37, 19, '_wp_attached_file', '2017/08/6987293f-171e-34f9-bb76-fb885ca74d4a.jpg'),
(38, 19, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1331;s:6:\"height\";i:887;s:4:\"file\";s:48:\"2017/08/6987293f-171e-34f9-bb76-fb885ca74d4a.jpg\";s:5:\"sizes\";a:7:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:48:\"6987293f-171e-34f9-bb76-fb885ca74d4a-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:1;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:48:\"6987293f-171e-34f9-bb76-fb885ca74d4a-600x400.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:400;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:48:\"6987293f-171e-34f9-bb76-fb885ca74d4a-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:48:\"6987293f-171e-34f9-bb76-fb885ca74d4a-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:48:\"6987293f-171e-34f9-bb76-fb885ca74d4a-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:48:\"6987293f-171e-34f9-bb76-fb885ca74d4a-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:49:\"6987293f-171e-34f9-bb76-fb885ca74d4a-1024x682.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:682;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(39, 19, 'fakerpress_flag', '1'),
(40, 20, 'fakerpress_flag', '1'),
(41, 21, '_wp_attached_file', '2017/08/c64aec34-59f1-393a-8132-2208fe5232e8.jpg'),
(42, 21, '_wp_attachment_metadata', 'a:0:{}'),
(43, 21, 'fakerpress_flag', '1'),
(44, 20, '_thumbnail_id', '21'),
(45, 22, 'fakerpress_flag', '1'),
(46, 23, '_wp_attached_file', '2017/08/fe33a210-a67c-31ce-a928-1088e05563c7.jpg'),
(47, 23, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:542;s:6:\"height\";i:433;s:4:\"file\";s:48:\"2017/08/fe33a210-a67c-31ce-a928-1088e05563c7.jpg\";s:5:\"sizes\";a:5:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:48:\"fe33a210-a67c-31ce-a928-1088e05563c7-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:1;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:48:\"fe33a210-a67c-31ce-a928-1088e05563c7-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:48:\"fe33a210-a67c-31ce-a928-1088e05563c7-416x332.jpg\";s:5:\"width\";i:416;s:6:\"height\";i:332;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:48:\"fe33a210-a67c-31ce-a928-1088e05563c7-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:48:\"fe33a210-a67c-31ce-a928-1088e05563c7-300x240.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:240;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(48, 23, 'fakerpress_flag', '1'),
(49, 24, '_wp_attached_file', '2017/08/710ca81b-f6e6-3005-b4d1-0bb09e1e410e.jpg'),
(50, 24, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:354;s:6:\"height\";i:283;s:4:\"file\";s:48:\"2017/08/710ca81b-f6e6-3005-b4d1-0bb09e1e410e.jpg\";s:5:\"sizes\";a:4:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:48:\"710ca81b-f6e6-3005-b4d1-0bb09e1e410e-300x283.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:283;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:1;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:48:\"710ca81b-f6e6-3005-b4d1-0bb09e1e410e-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:48:\"710ca81b-f6e6-3005-b4d1-0bb09e1e410e-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:48:\"710ca81b-f6e6-3005-b4d1-0bb09e1e410e-300x240.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:240;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(51, 24, 'fakerpress_flag', '1'),
(52, 25, 'fakerpress_flag', '1'),
(53, 26, '_wp_attached_file', '2017/08/616c506c-761e-31c7-bc55-1270aef0350b.jpg'),
(54, 26, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:248;s:6:\"height\";i:198;s:4:\"file\";s:48:\"2017/08/616c506c-761e-31c7-bc55-1270aef0350b.jpg\";s:5:\"sizes\";a:2:{s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:48:\"616c506c-761e-31c7-bc55-1270aef0350b-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:48:\"616c506c-761e-31c7-bc55-1270aef0350b-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(55, 26, 'fakerpress_flag', '1'),
(56, 27, '_wp_attached_file', '2017/08/951cf8e4-5320-3ac1-8d12-be5163ca11f9.jpg'),
(57, 27, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1083;s:6:\"height\";i:722;s:4:\"file\";s:48:\"2017/08/951cf8e4-5320-3ac1-8d12-be5163ca11f9.jpg\";s:5:\"sizes\";a:7:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:48:\"951cf8e4-5320-3ac1-8d12-be5163ca11f9-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:1;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:48:\"951cf8e4-5320-3ac1-8d12-be5163ca11f9-600x400.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:400;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:48:\"951cf8e4-5320-3ac1-8d12-be5163ca11f9-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:48:\"951cf8e4-5320-3ac1-8d12-be5163ca11f9-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:48:\"951cf8e4-5320-3ac1-8d12-be5163ca11f9-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:48:\"951cf8e4-5320-3ac1-8d12-be5163ca11f9-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:49:\"951cf8e4-5320-3ac1-8d12-be5163ca11f9-1024x683.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:683;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(58, 27, 'fakerpress_flag', '1'),
(60, 29, '_wp_attached_file', '2017/08/ecba2446-35ba-3165-a635-714973189fe2.jpg'),
(61, 29, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1142;s:6:\"height\";i:761;s:4:\"file\";s:48:\"2017/08/ecba2446-35ba-3165-a635-714973189fe2.jpg\";s:5:\"sizes\";a:7:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:48:\"ecba2446-35ba-3165-a635-714973189fe2-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:1;}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:48:\"ecba2446-35ba-3165-a635-714973189fe2-600x400.jpg\";s:5:\"width\";i:600;s:6:\"height\";i:400;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:48:\"ecba2446-35ba-3165-a635-714973189fe2-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:48:\"ecba2446-35ba-3165-a635-714973189fe2-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:48:\"ecba2446-35ba-3165-a635-714973189fe2-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:48:\"ecba2446-35ba-3165-a635-714973189fe2-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:49:\"ecba2446-35ba-3165-a635-714973189fe2-1024x682.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:682;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(62, 29, 'fakerpress_flag', '1'),
(63, 30, '_wp_attached_file', '2017/08/027fbdd1-09d4-301a-8c8e-ffbe6e101ff0.jpg'),
(64, 30, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:413;s:6:\"height\";i:330;s:4:\"file\";s:48:\"2017/08/027fbdd1-09d4-301a-8c8e-ffbe6e101ff0.jpg\";s:5:\"sizes\";a:4:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:48:\"027fbdd1-09d4-301a-8c8e-ffbe6e101ff0-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:1;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:48:\"027fbdd1-09d4-301a-8c8e-ffbe6e101ff0-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:48:\"027fbdd1-09d4-301a-8c8e-ffbe6e101ff0-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:48:\"027fbdd1-09d4-301a-8c8e-ffbe6e101ff0-300x240.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:240;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(65, 30, 'fakerpress_flag', '1'),
(66, 31, 'fakerpress_flag', '1'),
(67, 32, '_wp_attached_file', '2017/08/f220a7fe-fe94-36dd-b893-1778636c1b93.jpg'),
(68, 32, '_wp_attachment_metadata', 'a:0:{}'),
(69, 32, 'fakerpress_flag', '1'),
(70, 31, '_thumbnail_id', '32'),
(71, 33, '_wp_attached_file', '2017/08/a30af3e0-d1ac-390f-ac26-55ad8fe53a4a.jpg'),
(72, 33, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:218;s:6:\"height\";i:174;s:4:\"file\";s:48:\"2017/08/a30af3e0-d1ac-390f-ac26-55ad8fe53a4a.jpg\";s:5:\"sizes\";a:2:{s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:48:\"a30af3e0-d1ac-390f-ac26-55ad8fe53a4a-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:48:\"a30af3e0-d1ac-390f-ac26-55ad8fe53a4a-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(73, 33, 'fakerpress_flag', '1'),
(74, 34, 'fakerpress_flag', '1'),
(75, 35, 'fakerpress_flag', '1'),
(76, 36, '_wp_attached_file', '2017/08/c0674a2e-871f-3884-9a2a-e40271ce6cd1.jpg'),
(77, 36, '_wp_attachment_metadata', 'a:0:{}'),
(78, 36, 'fakerpress_flag', '1'),
(79, 35, '_thumbnail_id', '36'),
(80, 37, 'fakerpress_flag', '1'),
(81, 38, 'fakerpress_flag', '1'),
(82, 39, '_wp_attached_file', '2017/08/ffa64996-1cf2-3833-a034-0e50abb8e150.jpg'),
(83, 39, '_wp_attachment_metadata', 'a:0:{}'),
(84, 39, 'fakerpress_flag', '1'),
(85, 38, '_thumbnail_id', '39'),
(86, 40, '_wp_attached_file', '2017/08/c8905bda-d959-31fc-8734-91ba8849f523.jpg'),
(87, 40, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:434;s:6:\"height\";i:347;s:4:\"file\";s:48:\"2017/08/c8905bda-d959-31fc-8734-91ba8849f523.jpg\";s:5:\"sizes\";a:5:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:48:\"c8905bda-d959-31fc-8734-91ba8849f523-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:1;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:48:\"c8905bda-d959-31fc-8734-91ba8849f523-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:48:\"c8905bda-d959-31fc-8734-91ba8849f523-416x333.jpg\";s:5:\"width\";i:416;s:6:\"height\";i:333;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:48:\"c8905bda-d959-31fc-8734-91ba8849f523-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:48:\"c8905bda-d959-31fc-8734-91ba8849f523-300x240.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:240;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(88, 40, 'fakerpress_flag', '1'),
(89, 41, 'fakerpress_flag', '1'),
(90, 42, '_wp_attached_file', '2017/08/8bdb5f1c-cd6d-34ad-a270-616b0962b5ad.jpg'),
(91, 42, '_wp_attachment_metadata', 'a:0:{}'),
(92, 42, 'fakerpress_flag', '1'),
(93, 43, 'fakerpress_flag', '1'),
(96, 45, '_edit_lock', '1521887489:1'),
(97, 45, '_edit_last', '1'),
(98, 49, '_menu_item_type', 'custom'),
(99, 49, '_menu_item_menu_item_parent', '0'),
(100, 49, '_menu_item_object_id', '49'),
(101, 49, '_menu_item_object', 'custom'),
(102, 49, '_menu_item_target', ''),
(103, 49, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(104, 49, '_menu_item_xfn', ''),
(105, 49, '_menu_item_url', 'http://localhost/udemy/'),
(107, 50, '_menu_item_type', 'post_type'),
(108, 50, '_menu_item_menu_item_parent', '0'),
(109, 50, '_menu_item_object_id', '45'),
(110, 50, '_menu_item_object', 'page'),
(111, 50, '_menu_item_target', ''),
(112, 50, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(113, 50, '_menu_item_xfn', ''),
(114, 50, '_menu_item_url', ''),
(115, 17, '_edit_lock', '1504092437:1'),
(116, 25, '_edit_lock', '1517832076:1'),
(117, 37, '_edit_lock', '1503514403:1'),
(118, 37, '_edit_last', '1'),
(119, 37, '_thumbnail_id', '27'),
(121, 1, '_edit_lock', '1503514439:1'),
(122, 1, '_edit_last', '1'),
(123, 1, '_thumbnail_id', '23'),
(125, 17, '_edit_last', '1'),
(132, 45, 'wps_subtitle', 'Subtitle Example'),
(133, 58, 'wps_subtitle', 'Subtitle Example'),
(134, 43, '_edit_lock', '1517778229:1'),
(135, 43, '_edit_last', '1'),
(137, 43, '_thumbnail_id', '29'),
(139, 9, '_edit_lock', '1505559829:1'),
(140, 9, '_edit_last', '1'),
(141, 9, '_thumbnail_id', '26'),
(143, 12, '_edit_lock', '1504094459:1'),
(144, 12, '_edit_last', '1'),
(145, 45, '_wp_page_template', 'default'),
(146, 63, '_menu_item_type', 'post_type'),
(147, 63, '_menu_item_menu_item_parent', '0'),
(148, 63, '_menu_item_object_id', '45'),
(149, 63, '_menu_item_object', 'page'),
(150, 63, '_menu_item_target', ''),
(151, 63, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(152, 63, '_menu_item_xfn', ''),
(153, 63, '_menu_item_url', ''),
(155, 64, '_menu_item_type', 'post_type'),
(156, 64, '_menu_item_menu_item_parent', '0'),
(157, 64, '_menu_item_object_id', '2'),
(158, 64, '_menu_item_object', 'page'),
(159, 64, '_menu_item_target', ''),
(160, 64, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(161, 64, '_menu_item_xfn', ''),
(162, 64, '_menu_item_url', ''),
(217, 43, '_wp_page_template', 'default'),
(219, 43, '_quads_config_visibility', 'a:0:{}'),
(221, 43, '_oembed_ab317f856ddd8afd25d35f1f2958494a', '<iframe width=\"500\" height=\"281\" src=\"https://www.youtube.com/embed/MsFdaLIGyas?feature=oembed\" frameborder=\"0\" allowfullscreen></iframe>'),
(222, 43, '_oembed_time_ab317f856ddd8afd25d35f1f2958494a', '1505380848'),
(223, 43, '_oembed_3dee259687bdf06b6b2d5d96158b523f', '{{unknown}}'),
(224, 9, '_wp_page_template', 'default'),
(226, 9, '_quads_config_visibility', 'a:0:{}'),
(227, 9, '_oembed_5cb83caec7cfb4bbc62bf940ad5ce627', '<iframe width=\"500\" height=\"281\" src=\"https://www.youtube.com/embed/zZ_mlaKmUfk?feature=oembed\" frameborder=\"0\" allowfullscreen></iframe>'),
(228, 9, '_oembed_time_5cb83caec7cfb4bbc62bf940ad5ce627', '1505556217'),
(229, 4, '_edit_lock', '1505556326:1'),
(230, 4, '_edit_last', '1'),
(231, 4, '_wp_page_template', 'default'),
(233, 4, '_quads_config_visibility', 'a:0:{}'),
(234, 4, '_oembed_e77f498f2bde4bc44c56bac776ecd5d9', '{{unknown}}'),
(258, 137, '_edit_lock', '1518975295:1'),
(259, 137, '_edit_last', '1'),
(260, 137, 'recipe_data', 'a:7:{s:11:\"ingredients\";s:3:\"one\";s:4:\"time\";s:3:\"two\";s:8:\"utensils\";s:5:\"three\";s:5:\"level\";s:8:\"Beginner\";s:9:\"meal_type\";s:4:\"best\";s:12:\"rating_count\";i:1;s:6:\"rating\";d:4.5;}'),
(261, 137, '_thumbnail_id', '26'),
(262, 139, '_edit_lock', '1509300389:1'),
(263, 139, '_edit_last', '1'),
(264, 139, '_wp_page_template', 'default'),
(265, 139, '_quads_config_visibility', 'a:0:{}'),
(266, 141, '_menu_item_type', 'post_type'),
(267, 141, '_menu_item_menu_item_parent', '0'),
(268, 141, '_menu_item_object_id', '139'),
(269, 141, '_menu_item_object', 'page'),
(270, 141, '_menu_item_target', ''),
(271, 141, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(272, 141, '_menu_item_xfn', ''),
(273, 141, '_menu_item_url', ''),
(275, 142, '_menu_item_type', 'post_type'),
(276, 142, '_menu_item_menu_item_parent', '0'),
(277, 142, '_menu_item_object_id', '139'),
(278, 142, '_menu_item_object', 'page'),
(279, 142, '_menu_item_target', ''),
(280, 142, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(281, 142, '_menu_item_xfn', ''),
(282, 142, '_menu_item_url', ''),
(284, 146, '_edit_lock', '1510936190:1'),
(285, 146, '_edit_last', '1'),
(286, 146, '_wp_page_template', 'full-width.php'),
(287, 146, '_quads_config_visibility', 'a:0:{}'),
(288, 149, '_menu_item_type', 'post_type'),
(289, 149, '_menu_item_menu_item_parent', '0'),
(290, 149, '_menu_item_object_id', '146'),
(291, 149, '_menu_item_object', 'page'),
(292, 149, '_menu_item_target', ''),
(293, 149, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(294, 149, '_menu_item_xfn', ''),
(295, 149, '_menu_item_url', ''),
(296, 151, '_edit_last', '1'),
(297, 151, '_wp_page_template', 'default'),
(298, 151, '_quads_config_visibility', 'a:0:{}'),
(299, 151, '_edit_lock', '1514844000:1'),
(300, 151, '_elementor_edit_mode', 'builder'),
(301, 151, '_elementor_data', '[{\"id\":\"04327ff\",\"elType\":\"section\",\"settings\":{\"background_background\":\"gradient\",\"background_color_b\":\"#5dd123\",\"shape_divider_top\":\"pyramids\",\"shape_divider_top_width\":{\"unit\":\"%\",\"size\":106},\"shape_divider_top_height\":{\"unit\":\"px\",\"size\":20},\"shape_divider_top_flip\":\"yes\",\"shape_divider_top_negative\":\"yes\",\"shape_divider_top_above_content\":\"yes\"},\"elements\":[{\"id\":\"f8f1ffb\",\"elType\":\"column\",\"settings\":{\"_column_size\":100},\"elements\":[{\"id\":\"4c24453\",\"elType\":\"widget\",\"settings\":{\"align\":\"center\",\"gap\":{\"unit\":\"px\",\"size\":14},\"_border_radius\":{\"unit\":\"px\",\"top\":\"69\",\"right\":\"69\",\"bottom\":\"69\",\"left\":\"69\",\"isLinked\":true},\"_box_shadow_box_shadow_type\":\"yes\",\"_box_shadow_box_shadow\":{\"horizontal\":-79,\"vertical\":0,\"blur\":10,\"spread\":-26,\"color\":\"rgba(0,0,0,0.5)\"}},\"elements\":[],\"widgetType\":\"divider\"}],\"isInner\":false}],\"isInner\":false}]'),
(302, 153, '_elementor_edit_mode', 'builder'),
(303, 153, '_elementor_data', '[{\"id\":\"04327ff\",\"elType\":\"section\",\"settings\":{\"background_background\":\"gradient\",\"background_color_b\":\"#5dd123\",\"shape_divider_top\":\"pyramids\",\"shape_divider_top_width\":{\"unit\":\"%\",\"size\":106},\"shape_divider_top_height\":{\"unit\":\"px\",\"size\":20},\"shape_divider_top_flip\":\"yes\",\"shape_divider_top_negative\":\"yes\",\"shape_divider_top_above_content\":\"yes\"},\"elements\":[{\"id\":\"f8f1ffb\",\"elType\":\"column\",\"settings\":{\"_column_size\":100},\"elements\":[{\"id\":\"4c24453\",\"elType\":\"widget\",\"settings\":{\"align\":\"center\",\"gap\":{\"unit\":\"px\",\"size\":14},\"_border_radius\":{\"unit\":\"px\",\"top\":\"69\",\"right\":\"69\",\"bottom\":\"69\",\"left\":\"69\",\"isLinked\":true},\"_box_shadow_box_shadow_type\":\"yes\",\"_box_shadow_box_shadow\":{\"horizontal\":-79,\"vertical\":0,\"blur\":10,\"spread\":-26,\"color\":\"rgba(0,0,0,0.5)\"}},\"elements\":[],\"widgetType\":\"divider\"}],\"isInner\":false}],\"isInner\":false}]'),
(304, 151, '_elementor_version', '0.4'),
(305, 155, '_edit_lock', '1517784068:1'),
(306, 155, '_edit_last', '1'),
(307, 155, '_wp_page_template', 'default'),
(308, 155, '_quads_config_visibility', 'a:0:{}'),
(309, 160, 'recipe_data', 'a:5:{s:11:\"ingredients\";s:11:\"some recipe\";s:4:\"time\";s:11:\"some recipe\";s:8:\"utensils\";s:11:\"some recipe\";s:5:\"level\";s:6:\"Expert\";s:9:\"meal_type\";s:11:\"some recipe\";}'),
(310, 160, '_thumbnail_id', '26'),
(311, 160, '_edit_lock', '1518354891:1'),
(312, 161, 'recipe_data', 'a:5:{s:11:\"ingredients\";s:12:\"some content\";s:4:\"time\";s:12:\"some content\";s:8:\"utensils\";s:12:\"some content\";s:5:\"level\";s:8:\"Beginner\";s:9:\"meal_type\";s:12:\"some content\";}'),
(313, 161, '_thumbnail_id', '26'),
(314, 161, '_edit_lock', '1518381314:1'),
(316, 164, '_edit_lock', '1518975231:1'),
(317, 164, '_edit_last', '1'),
(318, 164, 'field_5a89a8c070374', 'a:11:{s:3:\"key\";s:19:\"field_5a89a8c070374\";s:5:\"label\";s:12:\"Release Date\";s:4:\"name\";s:12:\"release_date\";s:4:\"type\";s:11:\"date_picker\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";s:1:\"0\";s:11:\"date_format\";s:6:\"yymmdd\";s:14:\"display_format\";s:8:\"dd/mm/yy\";s:9:\"first_day\";s:1:\"1\";s:17:\"conditional_logic\";a:3:{s:6:\"status\";s:1:\"0\";s:5:\"rules\";a:1:{i:0;a:2:{s:5:\"field\";s:4:\"null\";s:8:\"operator\";s:2:\"==\";}}s:8:\"allorany\";s:3:\"all\";}s:8:\"order_no\";i:0;}'),
(319, 164, 'field_5a89a91e70375', 'a:14:{s:3:\"key\";s:19:\"field_5a89a91e70375\";s:5:\"label\";s:12:\"Purchase URL\";s:4:\"name\";s:12:\"purchase_url\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";s:1:\"0\";s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:10:\"formatting\";s:4:\"html\";s:9:\"maxlength\";s:0:\"\";s:17:\"conditional_logic\";a:3:{s:6:\"status\";s:1:\"0\";s:5:\"rules\";a:1:{i:0;a:2:{s:5:\"field\";s:4:\"null\";s:8:\"operator\";s:2:\"==\";}}s:8:\"allorany\";s:3:\"all\";}s:8:\"order_no\";i:1;}'),
(320, 164, 'rule', 'a:5:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:5:\"music\";s:8:\"order_no\";i:0;s:8:\"group_no\";i:0;}'),
(321, 164, 'position', 'normal'),
(322, 164, 'layout', 'no_box'),
(323, 164, 'hide_on_screen', ''),
(324, 165, '_edit_lock', '1518971974:1'),
(325, 165, '_edit_last', '1'),
(326, 165, 'release_date', '20180218'),
(327, 165, '_release_date', 'field_5a89a8c070374'),
(328, 165, 'purchase_url', 'www.google.com'),
(329, 165, '_purchase_url', 'field_5a89a91e70375'),
(836, 224, '_menu_item_type', 'post_type'),
(837, 224, '_menu_item_menu_item_parent', '0'),
(838, 224, '_menu_item_object_id', '191'),
(839, 224, '_menu_item_object', 'page'),
(840, 224, '_menu_item_target', ''),
(841, 224, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(842, 224, '_menu_item_xfn', ''),
(843, 224, '_menu_item_url', ''),
(845, 225, '_menu_item_type', 'post_type'),
(846, 225, '_menu_item_menu_item_parent', '0'),
(847, 225, '_menu_item_object_id', '190'),
(848, 225, '_menu_item_object', 'page'),
(849, 225, '_menu_item_target', ''),
(850, 225, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(851, 225, '_menu_item_xfn', ''),
(852, 225, '_menu_item_url', ''),
(854, 226, '_menu_item_type', 'post_type'),
(855, 226, '_menu_item_menu_item_parent', '0'),
(856, 226, '_menu_item_object_id', '189'),
(857, 226, '_menu_item_object', 'page'),
(858, 226, '_menu_item_target', ''),
(859, 226, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(860, 226, '_menu_item_xfn', ''),
(861, 226, '_menu_item_url', ''),
(865, 44, '_wpcom_is_markdown', '1'),
(866, 44, '_sku', 'woo-vneck-tee'),
(867, 44, '_regular_price', ''),
(868, 44, '_sale_price', ''),
(869, 44, '_sale_price_dates_from', ''),
(870, 44, '_sale_price_dates_to', ''),
(871, 44, 'total_sales', '2'),
(872, 44, '_tax_status', 'taxable'),
(873, 44, '_tax_class', ''),
(874, 44, '_manage_stock', 'no'),
(875, 44, '_backorders', 'no'),
(876, 44, '_sold_individually', 'no'),
(877, 44, '_weight', '.5'),
(878, 44, '_length', '24'),
(879, 44, '_width', '1'),
(880, 44, '_height', '2'),
(881, 44, '_upsell_ids', 'a:0:{}'),
(882, 44, '_crosssell_ids', 'a:0:{}'),
(883, 44, '_purchase_note', ''),
(884, 44, '_default_attributes', 'a:0:{}'),
(885, 44, '_virtual', 'no'),
(886, 44, '_downloadable', 'no'),
(887, 44, '_product_image_gallery', '50,51'),
(888, 44, '_download_limit', '0'),
(889, 44, '_download_expiry', '0'),
(890, 44, '_stock', ''),
(891, 44, '_stock_status', 'instock'),
(892, 44, '_wc_average_rating', '0'),
(893, 44, '_wc_rating_count', 'a:0:{}'),
(894, 44, '_wc_review_count', '0'),
(895, 44, '_downloadable_files', 'a:0:{}'),
(896, 44, '_product_attributes', 'a:2:{s:8:\"pa_color\";a:6:{s:4:\"name\";s:8:\"pa_color\";s:5:\"value\";s:0:\"\";s:8:\"position\";i:0;s:10:\"is_visible\";i:1;s:12:\"is_variation\";i:1;s:11:\"is_taxonomy\";i:1;}s:7:\"pa_size\";a:6:{s:4:\"name\";s:7:\"pa_size\";s:5:\"value\";s:0:\"\";s:8:\"position\";i:1;s:10:\"is_visible\";i:1;s:12:\"is_variation\";i:1;s:11:\"is_taxonomy\";i:1;}}'),
(897, 44, '_product_version', '3.3.0'),
(898, 44, '_wp_old_slug', 'import-placeholder-for-woo-vneck-tee'),
(899, 44, '_thumbnail_id', '49'),
(900, 44, '_edit_last', '1'),
(901, 44, '_price', '15'),
(902, 44, '_price', '20'),
(903, 228, '_wpcom_is_markdown', '1'),
(904, 228, '_sku', 'woo-hoodie'),
(905, 228, '_regular_price', ''),
(906, 228, '_sale_price', ''),
(907, 228, '_sale_price_dates_from', ''),
(908, 228, '_sale_price_dates_to', ''),
(909, 228, 'total_sales', '1'),
(910, 228, '_tax_status', 'taxable'),
(911, 228, '_tax_class', ''),
(912, 228, '_manage_stock', 'no'),
(913, 228, '_backorders', 'no'),
(914, 228, '_sold_individually', 'no'),
(915, 228, '_weight', '1.5'),
(916, 228, '_length', '10'),
(917, 228, '_width', '8'),
(918, 228, '_height', '3'),
(919, 228, '_upsell_ids', 'a:0:{}'),
(920, 228, '_crosssell_ids', 'a:0:{}'),
(921, 228, '_purchase_note', ''),
(922, 228, '_default_attributes', 'a:0:{}'),
(923, 228, '_virtual', 'no'),
(924, 228, '_downloadable', 'no'),
(925, 228, '_product_image_gallery', '53,54,55'),
(926, 228, '_download_limit', '0'),
(927, 228, '_download_expiry', '0'),
(928, 228, '_stock', ''),
(929, 228, '_stock_status', 'instock'),
(930, 228, '_wc_average_rating', '0'),
(931, 228, '_wc_rating_count', 'a:0:{}'),
(932, 228, '_wc_review_count', '0'),
(933, 228, '_downloadable_files', 'a:0:{}'),
(934, 228, '_product_attributes', 'a:2:{s:8:\"pa_color\";a:6:{s:4:\"name\";s:8:\"pa_color\";s:5:\"value\";s:0:\"\";s:8:\"position\";i:0;s:10:\"is_visible\";i:1;s:12:\"is_variation\";i:1;s:11:\"is_taxonomy\";i:1;}s:4:\"logo\";a:6:{s:4:\"name\";s:4:\"Logo\";s:5:\"value\";s:8:\"Yes | No\";s:8:\"position\";i:1;s:10:\"is_visible\";i:1;s:12:\"is_variation\";i:1;s:11:\"is_taxonomy\";i:0;}}'),
(935, 228, '_product_version', '3.3.0'),
(936, 228, '_wp_old_slug', 'import-placeholder-for-woo-hoodie'),
(937, 228, '_thumbnail_id', '52'),
(938, 228, '_price', '42'),
(939, 228, '_price', '45'),
(940, 228, '_edit_last', '1'),
(941, 46, '_wpcom_is_markdown', '1'),
(942, 46, '_sku', 'woo-hoodie-with-logo'),
(943, 46, '_regular_price', '45'),
(944, 46, '_sale_price', ''),
(945, 46, '_sale_price_dates_from', ''),
(946, 46, '_sale_price_dates_to', ''),
(947, 46, 'total_sales', '3'),
(948, 46, '_tax_status', 'taxable'),
(949, 46, '_tax_class', ''),
(950, 46, '_manage_stock', 'no'),
(951, 46, '_backorders', 'no'),
(952, 46, '_sold_individually', 'no'),
(953, 46, '_weight', '2'),
(954, 46, '_length', '10'),
(955, 46, '_width', '6'),
(956, 46, '_height', '3'),
(957, 46, '_upsell_ids', 'a:0:{}'),
(958, 46, '_crosssell_ids', 'a:0:{}'),
(959, 46, '_purchase_note', ''),
(960, 46, '_default_attributes', 'a:0:{}'),
(961, 46, '_virtual', 'no'),
(962, 46, '_downloadable', 'no'),
(963, 46, '_product_image_gallery', ''),
(964, 46, '_download_limit', '0'),
(965, 46, '_download_expiry', '0'),
(966, 46, '_stock', ''),
(967, 46, '_stock_status', 'instock'),
(968, 46, '_wc_average_rating', '0'),
(969, 46, '_wc_rating_count', 'a:0:{}'),
(970, 46, '_wc_review_count', '0'),
(971, 46, '_downloadable_files', 'a:0:{}'),
(972, 46, '_product_attributes', 'a:1:{s:8:\"pa_color\";a:6:{s:4:\"name\";s:8:\"pa_color\";s:5:\"value\";s:0:\"\";s:8:\"position\";i:0;s:10:\"is_visible\";i:1;s:12:\"is_variation\";i:0;s:11:\"is_taxonomy\";i:1;}}'),
(973, 46, '_product_version', '3.3.0'),
(974, 46, '_price', '45'),
(975, 46, '_wp_old_slug', 'import-placeholder-for-woo-hoodie-with-logo'),
(976, 46, '_thumbnail_id', '55'),
(977, 46, '_edit_last', '1'),
(978, 47, '_wpcom_is_markdown', '1'),
(979, 47, '_sku', 'woo-tshirt'),
(980, 47, '_regular_price', '18'),
(981, 47, '_sale_price', ''),
(982, 47, '_sale_price_dates_from', ''),
(983, 47, '_sale_price_dates_to', ''),
(984, 47, 'total_sales', '1'),
(985, 47, '_tax_status', 'taxable'),
(986, 47, '_tax_class', ''),
(987, 47, '_manage_stock', 'no'),
(988, 47, '_backorders', 'no'),
(989, 47, '_sold_individually', 'no'),
(990, 47, '_weight', '.8'),
(991, 47, '_length', '8'),
(992, 47, '_width', '6'),
(993, 47, '_height', '1'),
(994, 47, '_upsell_ids', 'a:0:{}'),
(995, 47, '_crosssell_ids', 'a:0:{}'),
(996, 47, '_purchase_note', ''),
(997, 47, '_default_attributes', 'a:0:{}'),
(998, 47, '_virtual', 'no'),
(999, 47, '_downloadable', 'no'),
(1000, 47, '_product_image_gallery', ''),
(1001, 47, '_download_limit', '0'),
(1002, 47, '_download_expiry', '0'),
(1003, 47, '_stock', ''),
(1004, 47, '_stock_status', 'instock'),
(1005, 47, '_wc_average_rating', '0'),
(1006, 47, '_wc_rating_count', 'a:0:{}'),
(1007, 47, '_wc_review_count', '0'),
(1008, 47, '_downloadable_files', 'a:0:{}'),
(1009, 47, '_product_attributes', 'a:1:{s:8:\"pa_color\";a:6:{s:4:\"name\";s:8:\"pa_color\";s:5:\"value\";s:0:\"\";s:8:\"position\";i:0;s:10:\"is_visible\";i:1;s:12:\"is_variation\";i:0;s:11:\"is_taxonomy\";i:1;}}'),
(1010, 47, '_product_version', '3.3.0'),
(1011, 47, '_price', '18'),
(1012, 47, '_wp_old_slug', 'import-placeholder-for-woo-tshirt'),
(1013, 47, '_thumbnail_id', '71'),
(1014, 47, '_edit_last', '1'),
(1015, 229, '_wpcom_is_markdown', '1'),
(1016, 229, '_sku', 'woo-beanie'),
(1017, 229, '_regular_price', '20'),
(1018, 229, '_sale_price', '18'),
(1019, 229, '_sale_price_dates_from', ''),
(1020, 229, '_sale_price_dates_to', ''),
(1021, 229, 'total_sales', '2'),
(1022, 229, '_tax_status', 'taxable'),
(1023, 229, '_tax_class', ''),
(1024, 229, '_manage_stock', 'no'),
(1025, 229, '_backorders', 'no'),
(1026, 229, '_sold_individually', 'no'),
(1027, 229, '_weight', '.2'),
(1028, 229, '_length', '4'),
(1029, 229, '_width', '5'),
(1030, 229, '_height', '.5'),
(1031, 229, '_upsell_ids', 'a:0:{}'),
(1032, 229, '_crosssell_ids', 'a:0:{}'),
(1033, 229, '_purchase_note', ''),
(1034, 229, '_default_attributes', 'a:0:{}'),
(1035, 229, '_virtual', 'no'),
(1036, 229, '_downloadable', 'no'),
(1037, 229, '_product_image_gallery', ''),
(1038, 229, '_download_limit', '0'),
(1039, 229, '_download_expiry', '0'),
(1040, 229, '_stock', ''),
(1041, 229, '_stock_status', 'instock'),
(1042, 229, '_wc_average_rating', '0'),
(1043, 229, '_wc_rating_count', 'a:0:{}'),
(1044, 229, '_wc_review_count', '0'),
(1045, 229, '_downloadable_files', 'a:0:{}'),
(1046, 229, '_product_attributes', 'a:1:{s:8:\"pa_color\";a:6:{s:4:\"name\";s:8:\"pa_color\";s:5:\"value\";s:0:\"\";s:8:\"position\";i:0;s:10:\"is_visible\";i:1;s:12:\"is_variation\";i:0;s:11:\"is_taxonomy\";i:1;}}'),
(1047, 229, '_product_version', '3.3.0'),
(1048, 229, '_price', '18'),
(1049, 229, '_wp_old_slug', 'import-placeholder-for-woo-beanie'),
(1050, 229, '_thumbnail_id', '56'),
(1051, 229, '_edit_last', '1'),
(1052, 230, '_wpcom_is_markdown', '1'),
(1053, 230, '_sku', 'woo-belt'),
(1054, 230, '_regular_price', '65'),
(1055, 230, '_sale_price', '55'),
(1056, 230, '_sale_price_dates_from', ''),
(1057, 230, '_sale_price_dates_to', ''),
(1058, 230, 'total_sales', '3'),
(1059, 230, '_tax_status', 'taxable'),
(1060, 230, '_tax_class', ''),
(1061, 230, '_manage_stock', 'no'),
(1062, 230, '_backorders', 'no'),
(1063, 230, '_sold_individually', 'no'),
(1064, 230, '_weight', '1.2'),
(1065, 230, '_length', '12'),
(1066, 230, '_width', '2'),
(1067, 230, '_height', '1.5'),
(1068, 230, '_upsell_ids', 'a:0:{}'),
(1069, 230, '_crosssell_ids', 'a:0:{}'),
(1070, 230, '_purchase_note', ''),
(1071, 230, '_default_attributes', 'a:0:{}'),
(1072, 230, '_virtual', 'no'),
(1073, 230, '_downloadable', 'no'),
(1074, 230, '_product_image_gallery', ''),
(1075, 230, '_download_limit', '0'),
(1076, 230, '_download_expiry', '0'),
(1077, 230, '_thumbnail_id', '57'),
(1078, 230, '_stock', ''),
(1079, 230, '_stock_status', 'instock'),
(1080, 230, '_wc_average_rating', '0'),
(1081, 230, '_wc_rating_count', 'a:0:{}'),
(1082, 230, '_wc_review_count', '0'),
(1083, 230, '_downloadable_files', 'a:0:{}'),
(1084, 230, '_product_attributes', 'a:0:{}'),
(1085, 230, '_product_version', '3.3.0'),
(1086, 230, '_price', '55'),
(1087, 230, '_edit_last', '1'),
(1088, 231, '_wpcom_is_markdown', '1'),
(1089, 231, '_sku', 'woo-cap'),
(1090, 231, '_regular_price', '18'),
(1091, 231, '_sale_price', '16'),
(1092, 231, '_sale_price_dates_from', ''),
(1093, 231, '_sale_price_dates_to', ''),
(1094, 231, 'total_sales', '4'),
(1095, 231, '_tax_status', 'taxable'),
(1096, 231, '_tax_class', ''),
(1097, 231, '_manage_stock', 'no'),
(1098, 231, '_backorders', 'no'),
(1099, 231, '_sold_individually', 'no'),
(1100, 231, '_weight', '0.6'),
(1101, 231, '_length', '8'),
(1102, 231, '_width', '6.5'),
(1103, 231, '_height', '4'),
(1104, 231, '_upsell_ids', 'a:0:{}'),
(1105, 231, '_crosssell_ids', 'a:0:{}'),
(1106, 231, '_purchase_note', ''),
(1107, 231, '_default_attributes', 'a:0:{}'),
(1108, 231, '_virtual', 'no'),
(1109, 231, '_downloadable', 'no'),
(1110, 231, '_product_image_gallery', ''),
(1111, 231, '_download_limit', '0'),
(1112, 231, '_download_expiry', '0'),
(1113, 231, '_thumbnail_id', '59'),
(1114, 231, '_stock', ''),
(1115, 231, '_stock_status', 'instock'),
(1116, 231, '_wc_average_rating', '0'),
(1117, 231, '_wc_rating_count', 'a:0:{}'),
(1118, 231, '_wc_review_count', '0'),
(1119, 231, '_downloadable_files', 'a:0:{}'),
(1120, 231, '_product_attributes', 'a:1:{s:8:\"pa_color\";a:6:{s:4:\"name\";s:8:\"pa_color\";s:5:\"value\";s:0:\"\";s:8:\"position\";i:0;s:10:\"is_visible\";i:1;s:12:\"is_variation\";i:0;s:11:\"is_taxonomy\";i:1;}}'),
(1121, 231, '_product_version', '3.3.0'),
(1122, 231, '_price', '16'),
(1123, 231, '_edit_last', '1'),
(1124, 232, '_wpcom_is_markdown', '1'),
(1125, 232, '_sku', 'woo-sunglasses'),
(1126, 232, '_regular_price', '90'),
(1127, 232, '_sale_price', ''),
(1128, 232, '_sale_price_dates_from', ''),
(1129, 232, '_sale_price_dates_to', ''),
(1130, 232, 'total_sales', '0'),
(1131, 232, '_tax_status', 'taxable'),
(1132, 232, '_tax_class', ''),
(1133, 232, '_manage_stock', 'no'),
(1134, 232, '_backorders', 'no'),
(1135, 232, '_sold_individually', 'no'),
(1136, 232, '_weight', '.2'),
(1137, 232, '_length', '4'),
(1138, 232, '_width', '1.4'),
(1139, 232, '_height', '1'),
(1140, 232, '_upsell_ids', 'a:0:{}'),
(1141, 232, '_crosssell_ids', 'a:0:{}'),
(1142, 232, '_purchase_note', ''),
(1143, 232, '_default_attributes', 'a:0:{}'),
(1144, 232, '_virtual', 'no'),
(1145, 232, '_downloadable', 'no'),
(1146, 232, '_product_image_gallery', ''),
(1147, 232, '_download_limit', '0'),
(1148, 232, '_download_expiry', '0'),
(1149, 232, '_thumbnail_id', '61'),
(1150, 232, '_stock', ''),
(1151, 232, '_stock_status', 'instock'),
(1152, 232, '_wc_average_rating', '0'),
(1153, 232, '_wc_rating_count', 'a:0:{}'),
(1154, 232, '_wc_review_count', '0'),
(1155, 232, '_downloadable_files', 'a:0:{}'),
(1156, 232, '_product_attributes', 'a:0:{}'),
(1157, 232, '_product_version', '3.3.0'),
(1158, 232, '_price', '90'),
(1159, 232, '_edit_last', '1'),
(1160, 233, '_wpcom_is_markdown', '1'),
(1161, 233, '_sku', 'woo-hoodie-with-pocket'),
(1162, 233, '_regular_price', '45'),
(1163, 233, '_sale_price', '35'),
(1164, 233, '_sale_price_dates_from', ''),
(1165, 233, '_sale_price_dates_to', ''),
(1166, 233, 'total_sales', '0'),
(1167, 233, '_tax_status', 'taxable'),
(1168, 233, '_tax_class', ''),
(1169, 233, '_manage_stock', 'no'),
(1170, 233, '_backorders', 'no'),
(1171, 233, '_sold_individually', 'no'),
(1172, 233, '_weight', '3'),
(1173, 233, '_length', '10'),
(1174, 233, '_width', '8'),
(1175, 233, '_height', '2'),
(1176, 233, '_upsell_ids', 'a:0:{}'),
(1177, 233, '_crosssell_ids', 'a:0:{}'),
(1178, 233, '_purchase_note', ''),
(1179, 233, '_default_attributes', 'a:0:{}'),
(1180, 233, '_virtual', 'no'),
(1181, 233, '_downloadable', 'no'),
(1182, 233, '_product_image_gallery', ''),
(1183, 233, '_download_limit', '0'),
(1184, 233, '_download_expiry', '0'),
(1185, 233, '_thumbnail_id', '63'),
(1186, 233, '_stock', ''),
(1187, 233, '_stock_status', 'instock'),
(1188, 233, '_wc_average_rating', '0'),
(1189, 233, '_wc_rating_count', 'a:0:{}'),
(1190, 233, '_wc_review_count', '0'),
(1191, 233, '_downloadable_files', 'a:0:{}'),
(1192, 233, '_product_attributes', 'a:1:{s:8:\"pa_color\";a:6:{s:4:\"name\";s:8:\"pa_color\";s:5:\"value\";s:0:\"\";s:8:\"position\";i:0;s:10:\"is_visible\";i:1;s:12:\"is_variation\";i:0;s:11:\"is_taxonomy\";i:1;}}'),
(1193, 233, '_product_version', '3.3.0'),
(1194, 233, '_price', '35'),
(1195, 233, '_edit_last', '1'),
(1196, 66, '_wpcom_is_markdown', '1'),
(1197, 66, '_sku', 'woo-hoodie-with-zipper'),
(1198, 66, '_regular_price', '45'),
(1199, 66, '_sale_price', ''),
(1200, 66, '_sale_price_dates_from', ''),
(1201, 66, '_sale_price_dates_to', ''),
(1202, 66, 'total_sales', '1'),
(1203, 66, '_tax_status', 'taxable'),
(1204, 66, '_tax_class', ''),
(1205, 66, '_manage_stock', 'no'),
(1206, 66, '_backorders', 'no'),
(1207, 66, '_sold_individually', 'no'),
(1208, 66, '_weight', '2'),
(1209, 66, '_length', '8'),
(1210, 66, '_width', '6'),
(1211, 66, '_height', '2'),
(1212, 66, '_upsell_ids', 'a:0:{}'),
(1213, 66, '_crosssell_ids', 'a:0:{}'),
(1214, 66, '_purchase_note', ''),
(1215, 66, '_default_attributes', 'a:0:{}'),
(1216, 66, '_virtual', 'no'),
(1217, 66, '_downloadable', 'no'),
(1218, 66, '_product_image_gallery', ''),
(1219, 66, '_download_limit', '0'),
(1220, 66, '_download_expiry', '0'),
(1221, 66, '_thumbnail_id', '65'),
(1222, 66, '_stock', ''),
(1223, 66, '_stock_status', 'instock'),
(1224, 66, '_wc_average_rating', '0'),
(1225, 66, '_wc_rating_count', 'a:0:{}'),
(1226, 66, '_wc_review_count', '0'),
(1227, 66, '_downloadable_files', 'a:0:{}'),
(1228, 66, '_product_attributes', 'a:0:{}'),
(1229, 66, '_product_version', '3.3.0'),
(1230, 66, '_price', '45'),
(1231, 66, '_edit_last', '1'),
(1232, 68, '_wpcom_is_markdown', '1'),
(1233, 68, '_sku', 'woo-long-sleeve-tee'),
(1234, 68, '_regular_price', '25'),
(1235, 68, '_sale_price', ''),
(1236, 68, '_sale_price_dates_from', ''),
(1237, 68, '_sale_price_dates_to', ''),
(1238, 68, 'total_sales', '0'),
(1239, 68, '_tax_status', 'taxable'),
(1240, 68, '_tax_class', ''),
(1241, 68, '_manage_stock', 'no'),
(1242, 68, '_backorders', 'no'),
(1243, 68, '_sold_individually', 'no'),
(1244, 68, '_weight', '1'),
(1245, 68, '_length', '7'),
(1246, 68, '_width', '5'),
(1247, 68, '_height', '1'),
(1248, 68, '_upsell_ids', 'a:0:{}'),
(1249, 68, '_crosssell_ids', 'a:0:{}'),
(1250, 68, '_purchase_note', ''),
(1251, 68, '_default_attributes', 'a:0:{}'),
(1252, 68, '_virtual', 'no'),
(1253, 68, '_downloadable', 'no'),
(1254, 68, '_product_image_gallery', ''),
(1255, 68, '_download_limit', '0'),
(1256, 68, '_download_expiry', '0'),
(1257, 68, '_thumbnail_id', '67'),
(1258, 68, '_stock', ''),
(1259, 68, '_stock_status', 'instock'),
(1260, 68, '_wc_average_rating', '0'),
(1261, 68, '_wc_rating_count', 'a:0:{}'),
(1262, 68, '_wc_review_count', '0'),
(1263, 68, '_downloadable_files', 'a:0:{}'),
(1264, 68, '_product_attributes', 'a:1:{s:8:\"pa_color\";a:6:{s:4:\"name\";s:8:\"pa_color\";s:5:\"value\";s:0:\"\";s:8:\"position\";i:0;s:10:\"is_visible\";i:1;s:12:\"is_variation\";i:0;s:11:\"is_taxonomy\";i:1;}}'),
(1265, 68, '_product_version', '3.3.0'),
(1266, 68, '_price', '25'),
(1267, 68, '_edit_last', '1'),
(1268, 70, '_wpcom_is_markdown', '1'),
(1269, 70, '_sku', 'woo-polo'),
(1270, 70, '_regular_price', '20'),
(1271, 70, '_sale_price', ''),
(1272, 70, '_sale_price_dates_from', ''),
(1273, 70, '_sale_price_dates_to', ''),
(1274, 70, 'total_sales', '0'),
(1275, 70, '_tax_status', 'taxable'),
(1276, 70, '_tax_class', ''),
(1277, 70, '_manage_stock', 'no'),
(1278, 70, '_backorders', 'no'),
(1279, 70, '_sold_individually', 'no'),
(1280, 70, '_weight', '.8'),
(1281, 70, '_length', '6'),
(1282, 70, '_width', '5'),
(1283, 70, '_height', '1'),
(1284, 70, '_upsell_ids', 'a:0:{}'),
(1285, 70, '_crosssell_ids', 'a:0:{}'),
(1286, 70, '_purchase_note', ''),
(1287, 70, '_default_attributes', 'a:0:{}'),
(1288, 70, '_virtual', 'no'),
(1289, 70, '_downloadable', 'no'),
(1290, 70, '_product_image_gallery', ''),
(1291, 70, '_download_limit', '0'),
(1292, 70, '_download_expiry', '0'),
(1293, 70, '_thumbnail_id', '69'),
(1294, 70, '_stock', ''),
(1295, 70, '_stock_status', 'instock'),
(1296, 70, '_wc_average_rating', '0'),
(1297, 70, '_wc_rating_count', 'a:0:{}'),
(1298, 70, '_wc_review_count', '0'),
(1299, 70, '_downloadable_files', 'a:0:{}'),
(1300, 70, '_product_attributes', 'a:1:{s:8:\"pa_color\";a:6:{s:4:\"name\";s:8:\"pa_color\";s:5:\"value\";s:0:\"\";s:8:\"position\";i:0;s:10:\"is_visible\";i:1;s:12:\"is_variation\";i:0;s:11:\"is_taxonomy\";i:1;}}'),
(1301, 70, '_product_version', '3.3.0'),
(1302, 70, '_price', '20'),
(1303, 70, '_edit_last', '1'),
(1304, 73, '_wpcom_is_markdown', '1');
INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1305, 73, '_sku', 'woo-album'),
(1306, 73, '_regular_price', '15'),
(1307, 73, '_sale_price', ''),
(1308, 73, '_sale_price_dates_from', ''),
(1309, 73, '_sale_price_dates_to', ''),
(1310, 73, 'total_sales', '0'),
(1311, 73, '_tax_status', 'taxable'),
(1312, 73, '_tax_class', ''),
(1313, 73, '_manage_stock', 'no'),
(1314, 73, '_backorders', 'no'),
(1315, 73, '_sold_individually', 'no'),
(1316, 73, '_weight', ''),
(1317, 73, '_length', ''),
(1318, 73, '_width', ''),
(1319, 73, '_height', ''),
(1320, 73, '_upsell_ids', 'a:0:{}'),
(1321, 73, '_crosssell_ids', 'a:0:{}'),
(1322, 73, '_purchase_note', ''),
(1323, 73, '_default_attributes', 'a:0:{}'),
(1324, 73, '_virtual', 'yes'),
(1325, 73, '_downloadable', 'yes'),
(1326, 73, '_product_image_gallery', ''),
(1327, 73, '_download_limit', '1'),
(1328, 73, '_download_expiry', '1'),
(1329, 73, '_thumbnail_id', '72'),
(1330, 73, '_stock', ''),
(1331, 73, '_stock_status', 'instock'),
(1332, 73, '_wc_average_rating', '0'),
(1333, 73, '_wc_rating_count', 'a:0:{}'),
(1334, 73, '_wc_review_count', '0'),
(1335, 73, '_downloadable_files', 'a:2:{s:36:\"44d39352-bab5-4882-89fc-507d860f1033\";a:3:{s:2:\"id\";s:36:\"44d39352-bab5-4882-89fc-507d860f1033\";s:4:\"name\";s:8:\"Single 1\";s:4:\"file\";s:85:\"https://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2017/08/single.jpg\";}s:36:\"2a7174e2-79ab-4521-b715-a54178e6f9cf\";a:3:{s:2:\"id\";s:36:\"2a7174e2-79ab-4521-b715-a54178e6f9cf\";s:4:\"name\";s:8:\"Single 2\";s:4:\"file\";s:84:\"https://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2017/08/album.jpg\";}}'),
(1336, 73, '_product_attributes', 'a:0:{}'),
(1337, 73, '_product_version', '3.3.0'),
(1338, 73, '_price', '15'),
(1339, 75, '_wpcom_is_markdown', '1'),
(1340, 75, '_sku', 'woo-single'),
(1341, 75, '_regular_price', '3'),
(1342, 75, '_sale_price', '2'),
(1343, 75, '_sale_price_dates_from', ''),
(1344, 75, '_sale_price_dates_to', ''),
(1345, 75, 'total_sales', '2'),
(1346, 75, '_tax_status', 'taxable'),
(1347, 75, '_tax_class', ''),
(1348, 75, '_manage_stock', 'no'),
(1349, 75, '_backorders', 'no'),
(1350, 75, '_sold_individually', 'no'),
(1351, 75, '_weight', ''),
(1352, 75, '_length', ''),
(1353, 75, '_width', ''),
(1354, 75, '_height', ''),
(1355, 75, '_upsell_ids', 'a:0:{}'),
(1356, 75, '_crosssell_ids', 'a:0:{}'),
(1357, 75, '_purchase_note', ''),
(1358, 75, '_default_attributes', 'a:0:{}'),
(1359, 75, '_virtual', 'yes'),
(1360, 75, '_downloadable', 'yes'),
(1361, 75, '_product_image_gallery', ''),
(1362, 75, '_download_limit', '1'),
(1363, 75, '_download_expiry', '1'),
(1364, 75, '_thumbnail_id', '74'),
(1365, 75, '_stock', ''),
(1366, 75, '_stock_status', 'instock'),
(1367, 75, '_wc_average_rating', '4.00'),
(1368, 75, '_wc_rating_count', 'a:1:{i:4;i:1;}'),
(1369, 75, '_wc_review_count', '1'),
(1370, 75, '_downloadable_files', 'a:1:{s:36:\"20166d16-7418-4c74-87ea-9bd521985cd7\";a:3:{s:2:\"id\";s:36:\"20166d16-7418-4c74-87ea-9bd521985cd7\";s:4:\"name\";s:6:\"Single\";s:4:\"file\";s:85:\"https://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2017/08/single.jpg\";}}'),
(1371, 75, '_product_attributes', 'a:0:{}'),
(1372, 75, '_product_version', '3.3.0'),
(1373, 75, '_price', '2'),
(1374, 83, '_wpcom_is_markdown', '1'),
(1375, 83, '_sku', 'Woo-tshirt-logo'),
(1376, 83, '_regular_price', '18'),
(1377, 83, '_sale_price', ''),
(1378, 83, '_sale_price_dates_from', ''),
(1379, 83, '_sale_price_dates_to', ''),
(1380, 83, 'total_sales', '1'),
(1381, 83, '_tax_status', 'taxable'),
(1382, 83, '_tax_class', ''),
(1383, 83, '_manage_stock', 'no'),
(1384, 83, '_backorders', 'no'),
(1385, 83, '_sold_individually', 'no'),
(1386, 83, '_weight', '.5'),
(1387, 83, '_length', '10'),
(1388, 83, '_width', '12'),
(1389, 83, '_height', '.5'),
(1390, 83, '_upsell_ids', 'a:0:{}'),
(1391, 83, '_crosssell_ids', 'a:0:{}'),
(1392, 83, '_purchase_note', ''),
(1393, 83, '_default_attributes', 'a:0:{}'),
(1394, 83, '_virtual', 'no'),
(1395, 83, '_downloadable', 'no'),
(1396, 83, '_product_image_gallery', ''),
(1397, 83, '_download_limit', '0'),
(1398, 83, '_download_expiry', '0'),
(1399, 83, '_thumbnail_id', '82'),
(1400, 83, '_stock', ''),
(1401, 83, '_stock_status', 'instock'),
(1402, 83, '_wc_average_rating', '0'),
(1403, 83, '_wc_rating_count', 'a:0:{}'),
(1404, 83, '_wc_review_count', '0'),
(1405, 83, '_downloadable_files', 'a:0:{}'),
(1406, 83, '_product_attributes', 'a:1:{s:8:\"pa_color\";a:6:{s:4:\"name\";s:8:\"pa_color\";s:5:\"value\";s:0:\"\";s:8:\"position\";i:0;s:10:\"is_visible\";i:1;s:12:\"is_variation\";i:0;s:11:\"is_taxonomy\";i:1;}}'),
(1407, 83, '_product_version', '3.3.0'),
(1408, 83, '_price', '18'),
(1409, 83, '_edit_last', '1'),
(1410, 85, '_wpcom_is_markdown', '1'),
(1411, 85, '_sku', 'Woo-beanie-logo'),
(1412, 85, '_regular_price', '20'),
(1413, 85, '_sale_price', '18'),
(1414, 85, '_sale_price_dates_from', ''),
(1415, 85, '_sale_price_dates_to', ''),
(1416, 85, 'total_sales', '0'),
(1417, 85, '_tax_status', 'taxable'),
(1418, 85, '_tax_class', ''),
(1419, 85, '_manage_stock', 'no'),
(1420, 85, '_backorders', 'no'),
(1421, 85, '_sold_individually', 'no'),
(1422, 85, '_weight', '.2'),
(1423, 85, '_length', '6'),
(1424, 85, '_width', '4'),
(1425, 85, '_height', '1'),
(1426, 85, '_upsell_ids', 'a:0:{}'),
(1427, 85, '_crosssell_ids', 'a:0:{}'),
(1428, 85, '_purchase_note', ''),
(1429, 85, '_default_attributes', 'a:0:{}'),
(1430, 85, '_virtual', 'no'),
(1431, 85, '_downloadable', 'no'),
(1432, 85, '_product_image_gallery', ''),
(1433, 85, '_download_limit', '0'),
(1434, 85, '_download_expiry', '0'),
(1435, 85, '_thumbnail_id', '84'),
(1436, 85, '_stock', ''),
(1437, 85, '_stock_status', 'instock'),
(1438, 85, '_wc_average_rating', '0'),
(1439, 85, '_wc_rating_count', 'a:0:{}'),
(1440, 85, '_wc_review_count', '0'),
(1441, 85, '_downloadable_files', 'a:0:{}'),
(1442, 85, '_product_attributes', 'a:1:{s:8:\"pa_color\";a:6:{s:4:\"name\";s:8:\"pa_color\";s:5:\"value\";s:0:\"\";s:8:\"position\";i:0;s:10:\"is_visible\";i:1;s:12:\"is_variation\";i:0;s:11:\"is_taxonomy\";i:1;}}'),
(1443, 85, '_product_version', '3.3.0'),
(1444, 85, '_price', '18'),
(1445, 85, '_edit_last', '1'),
(1446, 87, '_wpcom_is_markdown', '1'),
(1447, 87, '_children', 'a:3:{i:0;i:46;i:1;i:47;i:2;i:48;}'),
(1448, 87, '_sku', 'logo-collection'),
(1449, 87, '_regular_price', ''),
(1450, 87, '_sale_price', ''),
(1451, 87, '_sale_price_dates_from', ''),
(1452, 87, '_sale_price_dates_to', ''),
(1453, 87, 'total_sales', '0'),
(1454, 87, '_tax_status', 'taxable'),
(1455, 87, '_tax_class', ''),
(1456, 87, '_manage_stock', 'no'),
(1457, 87, '_backorders', 'no'),
(1458, 87, '_sold_individually', 'no'),
(1459, 87, '_weight', ''),
(1460, 87, '_length', ''),
(1461, 87, '_width', ''),
(1462, 87, '_height', ''),
(1463, 87, '_upsell_ids', 'a:0:{}'),
(1464, 87, '_crosssell_ids', 'a:0:{}'),
(1465, 87, '_purchase_note', ''),
(1466, 87, '_default_attributes', 'a:0:{}'),
(1467, 87, '_virtual', 'no'),
(1468, 87, '_downloadable', 'no'),
(1469, 87, '_product_image_gallery', '84,82,55'),
(1470, 87, '_download_limit', '0'),
(1471, 87, '_download_expiry', '0'),
(1472, 87, '_thumbnail_id', '86'),
(1473, 87, '_stock', ''),
(1474, 87, '_stock_status', 'instock'),
(1475, 87, '_wc_average_rating', '0'),
(1476, 87, '_wc_rating_count', 'a:0:{}'),
(1477, 87, '_wc_review_count', '0'),
(1478, 87, '_downloadable_files', 'a:0:{}'),
(1479, 87, '_product_attributes', 'a:0:{}'),
(1480, 87, '_product_version', '3.3.0'),
(1481, 87, '_price', ''),
(1482, 87, '_price', ''),
(1483, 87, '_edit_last', '1'),
(1484, 89, '_wpcom_is_markdown', '1'),
(1485, 89, '_sku', 'wp-pennant'),
(1486, 89, '_regular_price', '11.05'),
(1487, 89, '_sale_price', ''),
(1488, 89, '_sale_price_dates_from', ''),
(1489, 89, '_sale_price_dates_to', ''),
(1490, 89, 'total_sales', '0'),
(1491, 89, '_tax_status', 'taxable'),
(1492, 89, '_tax_class', ''),
(1493, 89, '_manage_stock', 'no'),
(1494, 89, '_backorders', 'no'),
(1495, 89, '_sold_individually', 'no'),
(1496, 89, '_weight', ''),
(1497, 89, '_length', ''),
(1498, 89, '_width', ''),
(1499, 89, '_height', ''),
(1500, 89, '_upsell_ids', 'a:0:{}'),
(1501, 89, '_crosssell_ids', 'a:0:{}'),
(1502, 89, '_purchase_note', ''),
(1503, 89, '_default_attributes', 'a:0:{}'),
(1504, 89, '_virtual', 'no'),
(1505, 89, '_downloadable', 'no'),
(1506, 89, '_product_image_gallery', ''),
(1507, 89, '_download_limit', '0'),
(1508, 89, '_download_expiry', '0'),
(1509, 89, '_thumbnail_id', '88'),
(1510, 89, '_stock', ''),
(1511, 89, '_stock_status', 'instock'),
(1512, 89, '_wc_average_rating', '0'),
(1513, 89, '_wc_rating_count', 'a:0:{}'),
(1514, 89, '_wc_review_count', '0'),
(1515, 89, '_product_url', 'https://mercantile.wordpress.org/product/wordpress-pennant/'),
(1516, 89, '_button_text', 'Buy on the WordPress swag store!'),
(1517, 89, '_downloadable_files', 'a:0:{}'),
(1518, 89, '_product_attributes', 'a:0:{}'),
(1519, 89, '_product_version', '3.3.0'),
(1520, 89, '_price', '11.05'),
(1521, 89, '_edit_last', '1'),
(1522, 189, '_edit_lock', '1519851219:1'),
(1545, 44, '_wpcom_is_markdown', '1'),
(1546, 44, '_sku', 'woo-vneck-tee'),
(1547, 44, '_regular_price', ''),
(1548, 44, '_sale_price', ''),
(1549, 44, '_sale_price_dates_from', ''),
(1550, 44, '_sale_price_dates_to', ''),
(1551, 44, 'total_sales', '2'),
(1552, 44, '_tax_status', 'taxable'),
(1553, 44, '_tax_class', ''),
(1554, 44, '_manage_stock', 'no'),
(1555, 44, '_backorders', 'no'),
(1556, 44, '_sold_individually', 'no'),
(1557, 44, '_weight', '.5'),
(1558, 44, '_length', '24'),
(1559, 44, '_width', '1'),
(1560, 44, '_height', '2'),
(1561, 44, '_upsell_ids', 'a:0:{}'),
(1562, 44, '_crosssell_ids', 'a:0:{}'),
(1563, 44, '_purchase_note', ''),
(1564, 44, '_default_attributes', 'a:0:{}'),
(1565, 44, '_virtual', 'no'),
(1566, 44, '_downloadable', 'no'),
(1567, 44, '_product_image_gallery', '50,51'),
(1568, 44, '_download_limit', '0'),
(1569, 44, '_download_expiry', '0'),
(1570, 44, '_stock', ''),
(1571, 44, '_stock_status', 'instock'),
(1572, 44, '_wc_average_rating', '0'),
(1573, 44, '_wc_rating_count', 'a:0:{}'),
(1574, 44, '_wc_review_count', '0'),
(1575, 44, '_downloadable_files', 'a:0:{}'),
(1576, 44, '_product_attributes', 'a:2:{s:8:\"pa_color\";a:6:{s:4:\"name\";s:8:\"pa_color\";s:5:\"value\";s:0:\"\";s:8:\"position\";i:0;s:10:\"is_visible\";i:1;s:12:\"is_variation\";i:1;s:11:\"is_taxonomy\";i:1;}s:7:\"pa_size\";a:6:{s:4:\"name\";s:7:\"pa_size\";s:5:\"value\";s:0:\"\";s:8:\"position\";i:1;s:10:\"is_visible\";i:1;s:12:\"is_variation\";i:1;s:11:\"is_taxonomy\";i:1;}}'),
(1577, 44, '_product_version', '3.3.0'),
(1578, 44, '_wp_old_slug', 'import-placeholder-for-woo-vneck-tee'),
(1579, 44, '_thumbnail_id', '49'),
(1580, 44, '_edit_last', '7'),
(1581, 44, '_price', '15'),
(1582, 44, '_price', '20'),
(1583, 228, '_wpcom_is_markdown', '1'),
(1584, 228, '_sku', 'woo-hoodie'),
(1585, 228, '_regular_price', ''),
(1586, 228, '_sale_price', ''),
(1587, 228, '_sale_price_dates_from', ''),
(1588, 228, '_sale_price_dates_to', ''),
(1589, 228, 'total_sales', '1'),
(1590, 228, '_tax_status', 'taxable'),
(1591, 228, '_tax_class', ''),
(1592, 228, '_manage_stock', 'no'),
(1593, 228, '_backorders', 'no'),
(1594, 228, '_sold_individually', 'no'),
(1595, 228, '_weight', '1.5'),
(1596, 228, '_length', '10'),
(1597, 228, '_width', '8'),
(1598, 228, '_height', '3'),
(1599, 228, '_upsell_ids', 'a:0:{}'),
(1600, 228, '_crosssell_ids', 'a:0:{}'),
(1601, 228, '_purchase_note', ''),
(1602, 228, '_default_attributes', 'a:0:{}'),
(1603, 228, '_virtual', 'no'),
(1604, 228, '_downloadable', 'no'),
(1605, 228, '_product_image_gallery', '53,54,55'),
(1606, 228, '_download_limit', '0'),
(1607, 228, '_download_expiry', '0'),
(1608, 228, '_stock', ''),
(1609, 228, '_stock_status', 'instock'),
(1610, 228, '_wc_average_rating', '0'),
(1611, 228, '_wc_rating_count', 'a:0:{}'),
(1612, 228, '_wc_review_count', '0'),
(1613, 228, '_downloadable_files', 'a:0:{}'),
(1614, 228, '_product_attributes', 'a:2:{s:8:\"pa_color\";a:6:{s:4:\"name\";s:8:\"pa_color\";s:5:\"value\";s:0:\"\";s:8:\"position\";i:0;s:10:\"is_visible\";i:1;s:12:\"is_variation\";i:1;s:11:\"is_taxonomy\";i:1;}s:4:\"logo\";a:6:{s:4:\"name\";s:4:\"Logo\";s:5:\"value\";s:8:\"Yes | No\";s:8:\"position\";i:1;s:10:\"is_visible\";i:1;s:12:\"is_variation\";i:1;s:11:\"is_taxonomy\";i:0;}}'),
(1615, 228, '_product_version', '3.3.0'),
(1616, 228, '_wp_old_slug', 'import-placeholder-for-woo-hoodie'),
(1617, 228, '_thumbnail_id', '52'),
(1618, 228, '_price', '42'),
(1619, 228, '_price', '45'),
(1620, 228, '_edit_last', '7'),
(1621, 46, '_wpcom_is_markdown', '1'),
(1622, 46, '_sku', 'woo-hoodie-with-logo'),
(1623, 46, '_regular_price', '45'),
(1624, 46, '_sale_price', ''),
(1625, 46, '_sale_price_dates_from', ''),
(1626, 46, '_sale_price_dates_to', ''),
(1627, 46, 'total_sales', '3'),
(1628, 46, '_tax_status', 'taxable'),
(1629, 46, '_tax_class', ''),
(1630, 46, '_manage_stock', 'no'),
(1631, 46, '_backorders', 'no'),
(1632, 46, '_sold_individually', 'no'),
(1633, 46, '_weight', '2'),
(1634, 46, '_length', '10'),
(1635, 46, '_width', '6'),
(1636, 46, '_height', '3'),
(1637, 46, '_upsell_ids', 'a:0:{}'),
(1638, 46, '_crosssell_ids', 'a:0:{}'),
(1639, 46, '_purchase_note', ''),
(1640, 46, '_default_attributes', 'a:0:{}'),
(1641, 46, '_virtual', 'no'),
(1642, 46, '_downloadable', 'no'),
(1643, 46, '_product_image_gallery', ''),
(1644, 46, '_download_limit', '0'),
(1645, 46, '_download_expiry', '0'),
(1646, 46, '_stock', ''),
(1647, 46, '_stock_status', 'instock'),
(1648, 46, '_wc_average_rating', '0'),
(1649, 46, '_wc_rating_count', 'a:0:{}'),
(1650, 46, '_wc_review_count', '0'),
(1651, 46, '_downloadable_files', 'a:0:{}'),
(1652, 46, '_product_attributes', 'a:1:{s:8:\"pa_color\";a:6:{s:4:\"name\";s:8:\"pa_color\";s:5:\"value\";s:0:\"\";s:8:\"position\";i:0;s:10:\"is_visible\";i:1;s:12:\"is_variation\";i:0;s:11:\"is_taxonomy\";i:1;}}'),
(1653, 46, '_product_version', '3.3.0'),
(1654, 46, '_price', '45'),
(1655, 46, '_wp_old_slug', 'import-placeholder-for-woo-hoodie-with-logo'),
(1656, 46, '_thumbnail_id', '55'),
(1657, 46, '_edit_last', '7'),
(1658, 47, '_wpcom_is_markdown', '1'),
(1659, 47, '_sku', 'woo-tshirt'),
(1660, 47, '_regular_price', '18'),
(1661, 47, '_sale_price', ''),
(1662, 47, '_sale_price_dates_from', ''),
(1663, 47, '_sale_price_dates_to', ''),
(1664, 47, 'total_sales', '1'),
(1665, 47, '_tax_status', 'taxable'),
(1666, 47, '_tax_class', ''),
(1667, 47, '_manage_stock', 'no'),
(1668, 47, '_backorders', 'no'),
(1669, 47, '_sold_individually', 'no'),
(1670, 47, '_weight', '.8'),
(1671, 47, '_length', '8'),
(1672, 47, '_width', '6'),
(1673, 47, '_height', '1'),
(1674, 47, '_upsell_ids', 'a:0:{}'),
(1675, 47, '_crosssell_ids', 'a:0:{}'),
(1676, 47, '_purchase_note', ''),
(1677, 47, '_default_attributes', 'a:0:{}'),
(1678, 47, '_virtual', 'no'),
(1679, 47, '_downloadable', 'no'),
(1680, 47, '_product_image_gallery', ''),
(1681, 47, '_download_limit', '0'),
(1682, 47, '_download_expiry', '0'),
(1683, 47, '_stock', ''),
(1684, 47, '_stock_status', 'instock'),
(1685, 47, '_wc_average_rating', '0'),
(1686, 47, '_wc_rating_count', 'a:0:{}'),
(1687, 47, '_wc_review_count', '0'),
(1688, 47, '_downloadable_files', 'a:0:{}'),
(1689, 47, '_product_attributes', 'a:1:{s:8:\"pa_color\";a:6:{s:4:\"name\";s:8:\"pa_color\";s:5:\"value\";s:0:\"\";s:8:\"position\";i:0;s:10:\"is_visible\";i:1;s:12:\"is_variation\";i:0;s:11:\"is_taxonomy\";i:1;}}'),
(1690, 47, '_product_version', '3.3.0'),
(1691, 47, '_price', '18'),
(1692, 47, '_wp_old_slug', 'import-placeholder-for-woo-tshirt'),
(1693, 47, '_thumbnail_id', '71'),
(1694, 47, '_edit_last', '7'),
(1695, 229, '_wpcom_is_markdown', '1'),
(1696, 229, '_sku', 'woo-beanie'),
(1697, 229, '_regular_price', '20'),
(1698, 229, '_sale_price', '18'),
(1699, 229, '_sale_price_dates_from', ''),
(1700, 229, '_sale_price_dates_to', ''),
(1701, 229, 'total_sales', '2'),
(1702, 229, '_tax_status', 'taxable'),
(1703, 229, '_tax_class', ''),
(1704, 229, '_manage_stock', 'no'),
(1705, 229, '_backorders', 'no'),
(1706, 229, '_sold_individually', 'no'),
(1707, 229, '_weight', '.2'),
(1708, 229, '_length', '4'),
(1709, 229, '_width', '5'),
(1710, 229, '_height', '.5'),
(1711, 229, '_upsell_ids', 'a:0:{}'),
(1712, 229, '_crosssell_ids', 'a:0:{}'),
(1713, 229, '_purchase_note', ''),
(1714, 229, '_default_attributes', 'a:0:{}'),
(1715, 229, '_virtual', 'no'),
(1716, 229, '_downloadable', 'no'),
(1717, 229, '_product_image_gallery', ''),
(1718, 229, '_download_limit', '0'),
(1719, 229, '_download_expiry', '0'),
(1720, 229, '_stock', ''),
(1721, 229, '_stock_status', 'instock'),
(1722, 229, '_wc_average_rating', '0'),
(1723, 229, '_wc_rating_count', 'a:0:{}'),
(1724, 229, '_wc_review_count', '0'),
(1725, 229, '_downloadable_files', 'a:0:{}'),
(1726, 229, '_product_attributes', 'a:1:{s:8:\"pa_color\";a:6:{s:4:\"name\";s:8:\"pa_color\";s:5:\"value\";s:0:\"\";s:8:\"position\";i:0;s:10:\"is_visible\";i:1;s:12:\"is_variation\";i:0;s:11:\"is_taxonomy\";i:1;}}'),
(1727, 229, '_product_version', '3.3.0'),
(1728, 229, '_price', '18'),
(1729, 229, '_wp_old_slug', 'import-placeholder-for-woo-beanie'),
(1730, 229, '_thumbnail_id', '56'),
(1731, 229, '_edit_last', '7'),
(1732, 230, '_wpcom_is_markdown', '1'),
(1733, 230, '_sku', 'woo-belt'),
(1734, 230, '_regular_price', '65'),
(1735, 230, '_sale_price', '55'),
(1736, 230, '_sale_price_dates_from', ''),
(1737, 230, '_sale_price_dates_to', ''),
(1738, 230, 'total_sales', '3'),
(1739, 230, '_tax_status', 'taxable'),
(1740, 230, '_tax_class', ''),
(1741, 230, '_manage_stock', 'no'),
(1742, 230, '_backorders', 'no'),
(1743, 230, '_sold_individually', 'no'),
(1744, 230, '_weight', '1.2'),
(1745, 230, '_length', '12'),
(1746, 230, '_width', '2'),
(1747, 230, '_height', '1.5'),
(1748, 230, '_upsell_ids', 'a:0:{}'),
(1749, 230, '_crosssell_ids', 'a:0:{}'),
(1750, 230, '_purchase_note', ''),
(1751, 230, '_default_attributes', 'a:0:{}'),
(1752, 230, '_virtual', 'no'),
(1753, 230, '_downloadable', 'no'),
(1754, 230, '_product_image_gallery', ''),
(1755, 230, '_download_limit', '0'),
(1756, 230, '_download_expiry', '0'),
(1757, 230, '_thumbnail_id', '57'),
(1758, 230, '_stock', ''),
(1759, 230, '_stock_status', 'instock'),
(1760, 230, '_wc_average_rating', '0'),
(1761, 230, '_wc_rating_count', 'a:0:{}'),
(1762, 230, '_wc_review_count', '0'),
(1763, 230, '_downloadable_files', 'a:0:{}'),
(1764, 230, '_product_attributes', 'a:0:{}'),
(1765, 230, '_product_version', '3.3.0'),
(1766, 230, '_price', '55'),
(1767, 230, '_edit_last', '7'),
(1768, 231, '_wpcom_is_markdown', '1'),
(1769, 231, '_sku', 'woo-cap'),
(1770, 231, '_regular_price', '18'),
(1771, 231, '_sale_price', '16'),
(1772, 231, '_sale_price_dates_from', ''),
(1773, 231, '_sale_price_dates_to', ''),
(1774, 231, 'total_sales', '4'),
(1775, 231, '_tax_status', 'taxable'),
(1776, 231, '_tax_class', ''),
(1777, 231, '_manage_stock', 'no'),
(1778, 231, '_backorders', 'no'),
(1779, 231, '_sold_individually', 'no'),
(1780, 231, '_weight', '0.6'),
(1781, 231, '_length', '8'),
(1782, 231, '_width', '6.5'),
(1783, 231, '_height', '4'),
(1784, 231, '_upsell_ids', 'a:0:{}'),
(1785, 231, '_crosssell_ids', 'a:0:{}'),
(1786, 231, '_purchase_note', ''),
(1787, 231, '_default_attributes', 'a:0:{}'),
(1788, 231, '_virtual', 'no'),
(1789, 231, '_downloadable', 'no'),
(1790, 231, '_product_image_gallery', ''),
(1791, 231, '_download_limit', '0'),
(1792, 231, '_download_expiry', '0'),
(1793, 231, '_thumbnail_id', '59'),
(1794, 231, '_stock', ''),
(1795, 231, '_stock_status', 'instock'),
(1796, 231, '_wc_average_rating', '0'),
(1797, 231, '_wc_rating_count', 'a:0:{}'),
(1798, 231, '_wc_review_count', '0'),
(1799, 231, '_downloadable_files', 'a:0:{}'),
(1800, 231, '_product_attributes', 'a:1:{s:8:\"pa_color\";a:6:{s:4:\"name\";s:8:\"pa_color\";s:5:\"value\";s:0:\"\";s:8:\"position\";i:0;s:10:\"is_visible\";i:1;s:12:\"is_variation\";i:0;s:11:\"is_taxonomy\";i:1;}}'),
(1801, 231, '_product_version', '3.3.0'),
(1802, 231, '_price', '16'),
(1803, 231, '_edit_last', '7'),
(1804, 232, '_wpcom_is_markdown', '1'),
(1805, 232, '_sku', 'woo-sunglasses'),
(1806, 232, '_regular_price', '90'),
(1807, 232, '_sale_price', ''),
(1808, 232, '_sale_price_dates_from', ''),
(1809, 232, '_sale_price_dates_to', ''),
(1810, 232, 'total_sales', '0'),
(1811, 232, '_tax_status', 'taxable'),
(1812, 232, '_tax_class', ''),
(1813, 232, '_manage_stock', 'no'),
(1814, 232, '_backorders', 'no'),
(1815, 232, '_sold_individually', 'no'),
(1816, 232, '_weight', '.2'),
(1817, 232, '_length', '4'),
(1818, 232, '_width', '1.4'),
(1819, 232, '_height', '1'),
(1820, 232, '_upsell_ids', 'a:0:{}'),
(1821, 232, '_crosssell_ids', 'a:0:{}'),
(1822, 232, '_purchase_note', ''),
(1823, 232, '_default_attributes', 'a:0:{}'),
(1824, 232, '_virtual', 'no'),
(1825, 232, '_downloadable', 'no'),
(1826, 232, '_product_image_gallery', ''),
(1827, 232, '_download_limit', '0'),
(1828, 232, '_download_expiry', '0'),
(1829, 232, '_thumbnail_id', '61'),
(1830, 232, '_stock', ''),
(1831, 232, '_stock_status', 'instock'),
(1832, 232, '_wc_average_rating', '0'),
(1833, 232, '_wc_rating_count', 'a:0:{}'),
(1834, 232, '_wc_review_count', '0'),
(1835, 232, '_downloadable_files', 'a:0:{}'),
(1836, 232, '_product_attributes', 'a:0:{}'),
(1837, 232, '_product_version', '3.3.0'),
(1838, 232, '_price', '90'),
(1839, 232, '_edit_last', '7'),
(1840, 233, '_wpcom_is_markdown', '1'),
(1841, 233, '_sku', 'woo-hoodie-with-pocket'),
(1842, 233, '_regular_price', '45'),
(1843, 233, '_sale_price', '35'),
(1844, 233, '_sale_price_dates_from', ''),
(1845, 233, '_sale_price_dates_to', ''),
(1846, 233, 'total_sales', '0'),
(1847, 233, '_tax_status', 'taxable'),
(1848, 233, '_tax_class', ''),
(1849, 233, '_manage_stock', 'no'),
(1850, 233, '_backorders', 'no'),
(1851, 233, '_sold_individually', 'no'),
(1852, 233, '_weight', '3'),
(1853, 233, '_length', '10'),
(1854, 233, '_width', '8'),
(1855, 233, '_height', '2'),
(1856, 233, '_upsell_ids', 'a:0:{}'),
(1857, 233, '_crosssell_ids', 'a:0:{}'),
(1858, 233, '_purchase_note', ''),
(1859, 233, '_default_attributes', 'a:0:{}'),
(1860, 233, '_virtual', 'no'),
(1861, 233, '_downloadable', 'no'),
(1862, 233, '_product_image_gallery', ''),
(1863, 233, '_download_limit', '0'),
(1864, 233, '_download_expiry', '0'),
(1865, 233, '_thumbnail_id', '63'),
(1866, 233, '_stock', ''),
(1867, 233, '_stock_status', 'instock'),
(1868, 233, '_wc_average_rating', '0'),
(1869, 233, '_wc_rating_count', 'a:0:{}'),
(1870, 233, '_wc_review_count', '0'),
(1871, 233, '_downloadable_files', 'a:0:{}'),
(1872, 233, '_product_attributes', 'a:1:{s:8:\"pa_color\";a:6:{s:4:\"name\";s:8:\"pa_color\";s:5:\"value\";s:0:\"\";s:8:\"position\";i:0;s:10:\"is_visible\";i:1;s:12:\"is_variation\";i:0;s:11:\"is_taxonomy\";i:1;}}'),
(1873, 233, '_product_version', '3.3.0'),
(1874, 233, '_price', '35'),
(1875, 233, '_edit_last', '7'),
(1876, 66, '_wpcom_is_markdown', '1'),
(1877, 66, '_sku', 'woo-hoodie-with-zipper'),
(1878, 66, '_regular_price', '45'),
(1879, 66, '_sale_price', ''),
(1880, 66, '_sale_price_dates_from', ''),
(1881, 66, '_sale_price_dates_to', ''),
(1882, 66, 'total_sales', '1'),
(1883, 66, '_tax_status', 'taxable'),
(1884, 66, '_tax_class', ''),
(1885, 66, '_manage_stock', 'no'),
(1886, 66, '_backorders', 'no'),
(1887, 66, '_sold_individually', 'no'),
(1888, 66, '_weight', '2'),
(1889, 66, '_length', '8'),
(1890, 66, '_width', '6'),
(1891, 66, '_height', '2'),
(1892, 66, '_upsell_ids', 'a:0:{}'),
(1893, 66, '_crosssell_ids', 'a:0:{}'),
(1894, 66, '_purchase_note', ''),
(1895, 66, '_default_attributes', 'a:0:{}'),
(1896, 66, '_virtual', 'no'),
(1897, 66, '_downloadable', 'no'),
(1898, 66, '_product_image_gallery', ''),
(1899, 66, '_download_limit', '0'),
(1900, 66, '_download_expiry', '0'),
(1901, 66, '_thumbnail_id', '65'),
(1902, 66, '_stock', ''),
(1903, 66, '_stock_status', 'instock'),
(1904, 66, '_wc_average_rating', '0'),
(1905, 66, '_wc_rating_count', 'a:0:{}'),
(1906, 66, '_wc_review_count', '0'),
(1907, 66, '_downloadable_files', 'a:0:{}'),
(1908, 66, '_product_attributes', 'a:0:{}'),
(1909, 66, '_product_version', '3.3.0'),
(1910, 66, '_price', '45'),
(1911, 66, '_edit_last', '7'),
(1912, 68, '_wpcom_is_markdown', '1'),
(1913, 68, '_sku', 'woo-long-sleeve-tee'),
(1914, 68, '_regular_price', '25'),
(1915, 68, '_sale_price', ''),
(1916, 68, '_sale_price_dates_from', ''),
(1917, 68, '_sale_price_dates_to', ''),
(1918, 68, 'total_sales', '0'),
(1919, 68, '_tax_status', 'taxable'),
(1920, 68, '_tax_class', ''),
(1921, 68, '_manage_stock', 'no'),
(1922, 68, '_backorders', 'no'),
(1923, 68, '_sold_individually', 'no'),
(1924, 68, '_weight', '1'),
(1925, 68, '_length', '7'),
(1926, 68, '_width', '5'),
(1927, 68, '_height', '1'),
(1928, 68, '_upsell_ids', 'a:0:{}'),
(1929, 68, '_crosssell_ids', 'a:0:{}'),
(1930, 68, '_purchase_note', ''),
(1931, 68, '_default_attributes', 'a:0:{}'),
(1932, 68, '_virtual', 'no'),
(1933, 68, '_downloadable', 'no'),
(1934, 68, '_product_image_gallery', ''),
(1935, 68, '_download_limit', '0'),
(1936, 68, '_download_expiry', '0'),
(1937, 68, '_thumbnail_id', '67'),
(1938, 68, '_stock', ''),
(1939, 68, '_stock_status', 'instock'),
(1940, 68, '_wc_average_rating', '0'),
(1941, 68, '_wc_rating_count', 'a:0:{}'),
(1942, 68, '_wc_review_count', '0'),
(1943, 68, '_downloadable_files', 'a:0:{}'),
(1944, 68, '_product_attributes', 'a:1:{s:8:\"pa_color\";a:6:{s:4:\"name\";s:8:\"pa_color\";s:5:\"value\";s:0:\"\";s:8:\"position\";i:0;s:10:\"is_visible\";i:1;s:12:\"is_variation\";i:0;s:11:\"is_taxonomy\";i:1;}}'),
(1945, 68, '_product_version', '3.3.0'),
(1946, 68, '_price', '25'),
(1947, 68, '_edit_last', '7'),
(1948, 70, '_wpcom_is_markdown', '1'),
(1949, 70, '_sku', 'woo-polo'),
(1950, 70, '_regular_price', '20'),
(1951, 70, '_sale_price', ''),
(1952, 70, '_sale_price_dates_from', ''),
(1953, 70, '_sale_price_dates_to', ''),
(1954, 70, 'total_sales', '0'),
(1955, 70, '_tax_status', 'taxable'),
(1956, 70, '_tax_class', ''),
(1957, 70, '_manage_stock', 'no'),
(1958, 70, '_backorders', 'no'),
(1959, 70, '_sold_individually', 'no'),
(1960, 70, '_weight', '.8'),
(1961, 70, '_length', '6'),
(1962, 70, '_width', '5'),
(1963, 70, '_height', '1'),
(1964, 70, '_upsell_ids', 'a:0:{}'),
(1965, 70, '_crosssell_ids', 'a:0:{}'),
(1966, 70, '_purchase_note', ''),
(1967, 70, '_default_attributes', 'a:0:{}'),
(1968, 70, '_virtual', 'no'),
(1969, 70, '_downloadable', 'no'),
(1970, 70, '_product_image_gallery', ''),
(1971, 70, '_download_limit', '0'),
(1972, 70, '_download_expiry', '0'),
(1973, 70, '_thumbnail_id', '69'),
(1974, 70, '_stock', ''),
(1975, 70, '_stock_status', 'instock'),
(1976, 70, '_wc_average_rating', '0'),
(1977, 70, '_wc_rating_count', 'a:0:{}'),
(1978, 70, '_wc_review_count', '0'),
(1979, 70, '_downloadable_files', 'a:0:{}'),
(1980, 70, '_product_attributes', 'a:1:{s:8:\"pa_color\";a:6:{s:4:\"name\";s:8:\"pa_color\";s:5:\"value\";s:0:\"\";s:8:\"position\";i:0;s:10:\"is_visible\";i:1;s:12:\"is_variation\";i:0;s:11:\"is_taxonomy\";i:1;}}'),
(1981, 70, '_product_version', '3.3.0'),
(1982, 70, '_price', '20'),
(1983, 70, '_edit_last', '7'),
(1984, 73, '_wpcom_is_markdown', '1'),
(1985, 73, '_sku', 'woo-album'),
(1986, 73, '_regular_price', '15'),
(1987, 73, '_sale_price', ''),
(1988, 73, '_sale_price_dates_from', ''),
(1989, 73, '_sale_price_dates_to', ''),
(1990, 73, 'total_sales', '0'),
(1991, 73, '_tax_status', 'taxable'),
(1992, 73, '_tax_class', ''),
(1993, 73, '_manage_stock', 'no'),
(1994, 73, '_backorders', 'no'),
(1995, 73, '_sold_individually', 'no'),
(1996, 73, '_weight', ''),
(1997, 73, '_length', ''),
(1998, 73, '_width', ''),
(1999, 73, '_height', ''),
(2000, 73, '_upsell_ids', 'a:0:{}'),
(2001, 73, '_crosssell_ids', 'a:0:{}'),
(2002, 73, '_purchase_note', ''),
(2003, 73, '_default_attributes', 'a:0:{}'),
(2004, 73, '_virtual', 'yes'),
(2005, 73, '_downloadable', 'yes'),
(2006, 73, '_product_image_gallery', ''),
(2007, 73, '_download_limit', '1'),
(2008, 73, '_download_expiry', '1'),
(2009, 73, '_thumbnail_id', '72'),
(2010, 73, '_stock', ''),
(2011, 73, '_stock_status', 'instock'),
(2012, 73, '_wc_average_rating', '0'),
(2013, 73, '_wc_rating_count', 'a:0:{}'),
(2014, 73, '_wc_review_count', '0'),
(2015, 73, '_downloadable_files', 'a:2:{s:36:\"44d39352-bab5-4882-89fc-507d860f1033\";a:3:{s:2:\"id\";s:36:\"44d39352-bab5-4882-89fc-507d860f1033\";s:4:\"name\";s:8:\"Single 1\";s:4:\"file\";s:85:\"https://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2017/08/single.jpg\";}s:36:\"2a7174e2-79ab-4521-b715-a54178e6f9cf\";a:3:{s:2:\"id\";s:36:\"2a7174e2-79ab-4521-b715-a54178e6f9cf\";s:4:\"name\";s:8:\"Single 2\";s:4:\"file\";s:84:\"https://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2017/08/album.jpg\";}}'),
(2016, 73, '_product_attributes', 'a:0:{}'),
(2017, 73, '_product_version', '3.3.0'),
(2018, 73, '_price', '15'),
(2019, 75, '_wpcom_is_markdown', '1'),
(2020, 75, '_sku', 'woo-single'),
(2021, 75, '_regular_price', '3'),
(2022, 75, '_sale_price', '2'),
(2023, 75, '_sale_price_dates_from', ''),
(2024, 75, '_sale_price_dates_to', ''),
(2025, 75, 'total_sales', '2'),
(2026, 75, '_tax_status', 'taxable'),
(2027, 75, '_tax_class', ''),
(2028, 75, '_manage_stock', 'no'),
(2029, 75, '_backorders', 'no'),
(2030, 75, '_sold_individually', 'no'),
(2031, 75, '_weight', ''),
(2032, 75, '_length', ''),
(2033, 75, '_width', ''),
(2034, 75, '_height', ''),
(2035, 75, '_upsell_ids', 'a:0:{}'),
(2036, 75, '_crosssell_ids', 'a:0:{}'),
(2037, 75, '_purchase_note', ''),
(2038, 75, '_default_attributes', 'a:0:{}'),
(2039, 75, '_virtual', 'yes'),
(2040, 75, '_downloadable', 'yes'),
(2041, 75, '_product_image_gallery', ''),
(2042, 75, '_download_limit', '1'),
(2043, 75, '_download_expiry', '1'),
(2044, 75, '_thumbnail_id', '74'),
(2045, 75, '_stock', ''),
(2046, 75, '_stock_status', 'instock'),
(2047, 75, '_wc_average_rating', '4.00'),
(2048, 75, '_wc_rating_count', 'a:1:{i:4;i:1;}'),
(2049, 75, '_wc_review_count', '1'),
(2050, 75, '_downloadable_files', 'a:1:{s:36:\"20166d16-7418-4c74-87ea-9bd521985cd7\";a:3:{s:2:\"id\";s:36:\"20166d16-7418-4c74-87ea-9bd521985cd7\";s:4:\"name\";s:6:\"Single\";s:4:\"file\";s:85:\"https://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2017/08/single.jpg\";}}'),
(2051, 75, '_product_attributes', 'a:0:{}'),
(2052, 75, '_product_version', '3.3.0'),
(2053, 75, '_price', '2'),
(2054, 83, '_wpcom_is_markdown', '1'),
(2055, 83, '_sku', 'Woo-tshirt-logo'),
(2056, 83, '_regular_price', '18'),
(2057, 83, '_sale_price', ''),
(2058, 83, '_sale_price_dates_from', ''),
(2059, 83, '_sale_price_dates_to', ''),
(2060, 83, 'total_sales', '1'),
(2061, 83, '_tax_status', 'taxable'),
(2062, 83, '_tax_class', ''),
(2063, 83, '_manage_stock', 'no'),
(2064, 83, '_backorders', 'no'),
(2065, 83, '_sold_individually', 'no'),
(2066, 83, '_weight', '.5'),
(2067, 83, '_length', '10'),
(2068, 83, '_width', '12'),
(2069, 83, '_height', '.5'),
(2070, 83, '_upsell_ids', 'a:0:{}'),
(2071, 83, '_crosssell_ids', 'a:0:{}'),
(2072, 83, '_purchase_note', ''),
(2073, 83, '_default_attributes', 'a:0:{}'),
(2074, 83, '_virtual', 'no'),
(2075, 83, '_downloadable', 'no'),
(2076, 83, '_product_image_gallery', ''),
(2077, 83, '_download_limit', '0'),
(2078, 83, '_download_expiry', '0'),
(2079, 83, '_thumbnail_id', '82'),
(2080, 83, '_stock', ''),
(2081, 83, '_stock_status', 'instock'),
(2082, 83, '_wc_average_rating', '0'),
(2083, 83, '_wc_rating_count', 'a:0:{}'),
(2084, 83, '_wc_review_count', '0'),
(2085, 83, '_downloadable_files', 'a:0:{}'),
(2086, 83, '_product_attributes', 'a:1:{s:8:\"pa_color\";a:6:{s:4:\"name\";s:8:\"pa_color\";s:5:\"value\";s:0:\"\";s:8:\"position\";i:0;s:10:\"is_visible\";i:1;s:12:\"is_variation\";i:0;s:11:\"is_taxonomy\";i:1;}}'),
(2087, 83, '_product_version', '3.3.0'),
(2088, 83, '_price', '18'),
(2089, 83, '_edit_last', '7'),
(2090, 85, '_wpcom_is_markdown', '1'),
(2091, 85, '_sku', 'Woo-beanie-logo'),
(2092, 85, '_regular_price', '20'),
(2093, 85, '_sale_price', '18'),
(2094, 85, '_sale_price_dates_from', ''),
(2095, 85, '_sale_price_dates_to', ''),
(2096, 85, 'total_sales', '0'),
(2097, 85, '_tax_status', 'taxable'),
(2098, 85, '_tax_class', ''),
(2099, 85, '_manage_stock', 'no'),
(2100, 85, '_backorders', 'no'),
(2101, 85, '_sold_individually', 'no'),
(2102, 85, '_weight', '.2'),
(2103, 85, '_length', '6'),
(2104, 85, '_width', '4'),
(2105, 85, '_height', '1'),
(2106, 85, '_upsell_ids', 'a:0:{}'),
(2107, 85, '_crosssell_ids', 'a:0:{}'),
(2108, 85, '_purchase_note', ''),
(2109, 85, '_default_attributes', 'a:0:{}'),
(2110, 85, '_virtual', 'no'),
(2111, 85, '_downloadable', 'no'),
(2112, 85, '_product_image_gallery', ''),
(2113, 85, '_download_limit', '0'),
(2114, 85, '_download_expiry', '0'),
(2115, 85, '_thumbnail_id', '84'),
(2116, 85, '_stock', ''),
(2117, 85, '_stock_status', 'instock'),
(2118, 85, '_wc_average_rating', '0'),
(2119, 85, '_wc_rating_count', 'a:0:{}'),
(2120, 85, '_wc_review_count', '0'),
(2121, 85, '_downloadable_files', 'a:0:{}'),
(2122, 85, '_product_attributes', 'a:1:{s:8:\"pa_color\";a:6:{s:4:\"name\";s:8:\"pa_color\";s:5:\"value\";s:0:\"\";s:8:\"position\";i:0;s:10:\"is_visible\";i:1;s:12:\"is_variation\";i:0;s:11:\"is_taxonomy\";i:1;}}'),
(2123, 85, '_product_version', '3.3.0'),
(2124, 85, '_price', '18'),
(2125, 85, '_edit_last', '7'),
(2126, 87, '_wpcom_is_markdown', '1'),
(2127, 87, '_children', 'a:3:{i:0;i:46;i:1;i:47;i:2;i:48;}'),
(2128, 87, '_sku', 'logo-collection'),
(2129, 87, '_regular_price', ''),
(2130, 87, '_sale_price', ''),
(2131, 87, '_sale_price_dates_from', ''),
(2132, 87, '_sale_price_dates_to', ''),
(2133, 87, 'total_sales', '0'),
(2134, 87, '_tax_status', 'taxable'),
(2135, 87, '_tax_class', ''),
(2136, 87, '_manage_stock', 'no'),
(2137, 87, '_backorders', 'no'),
(2138, 87, '_sold_individually', 'no'),
(2139, 87, '_weight', ''),
(2140, 87, '_length', ''),
(2141, 87, '_width', ''),
(2142, 87, '_height', ''),
(2143, 87, '_upsell_ids', 'a:0:{}'),
(2144, 87, '_crosssell_ids', 'a:0:{}'),
(2145, 87, '_purchase_note', ''),
(2146, 87, '_default_attributes', 'a:0:{}'),
(2147, 87, '_virtual', 'no'),
(2148, 87, '_downloadable', 'no'),
(2149, 87, '_product_image_gallery', '84,82,55'),
(2150, 87, '_download_limit', '0'),
(2151, 87, '_download_expiry', '0'),
(2152, 87, '_thumbnail_id', '86'),
(2153, 87, '_stock', ''),
(2154, 87, '_stock_status', 'instock'),
(2155, 87, '_wc_average_rating', '0'),
(2156, 87, '_wc_rating_count', 'a:0:{}'),
(2157, 87, '_wc_review_count', '0'),
(2158, 87, '_downloadable_files', 'a:0:{}'),
(2159, 87, '_product_attributes', 'a:0:{}'),
(2160, 87, '_product_version', '3.3.0'),
(2161, 87, '_price', ''),
(2162, 87, '_price', ''),
(2163, 87, '_edit_last', '7'),
(2164, 89, '_wpcom_is_markdown', '1'),
(2165, 89, '_sku', 'wp-pennant'),
(2166, 89, '_regular_price', '11.05'),
(2167, 89, '_sale_price', ''),
(2168, 89, '_sale_price_dates_from', ''),
(2169, 89, '_sale_price_dates_to', ''),
(2170, 89, 'total_sales', '0'),
(2171, 89, '_tax_status', 'taxable'),
(2172, 89, '_tax_class', ''),
(2173, 89, '_manage_stock', 'no'),
(2174, 89, '_backorders', 'no'),
(2175, 89, '_sold_individually', 'no'),
(2176, 89, '_weight', ''),
(2177, 89, '_length', ''),
(2178, 89, '_width', ''),
(2179, 89, '_height', ''),
(2180, 89, '_upsell_ids', 'a:0:{}'),
(2181, 89, '_crosssell_ids', 'a:0:{}'),
(2182, 89, '_purchase_note', ''),
(2183, 89, '_default_attributes', 'a:0:{}'),
(2184, 89, '_virtual', 'no'),
(2185, 89, '_downloadable', 'no'),
(2186, 89, '_product_image_gallery', ''),
(2187, 89, '_download_limit', '0'),
(2188, 89, '_download_expiry', '0'),
(2189, 89, '_thumbnail_id', '88'),
(2190, 89, '_stock', ''),
(2191, 89, '_stock_status', 'instock'),
(2192, 89, '_wc_average_rating', '0'),
(2193, 89, '_wc_rating_count', 'a:0:{}'),
(2194, 89, '_wc_review_count', '0'),
(2195, 89, '_product_url', 'https://mercantile.wordpress.org/product/wordpress-pennant/'),
(2196, 89, '_button_text', 'Buy on the WordPress swag store!'),
(2197, 89, '_downloadable_files', 'a:0:{}'),
(2198, 89, '_product_attributes', 'a:0:{}'),
(2199, 89, '_product_version', '3.3.0'),
(2200, 89, '_price', '11.05'),
(2201, 89, '_edit_last', '7'),
(2210, 236, '_edit_lock', '1521312183:1'),
(2211, 236, '_edit_last', '1'),
(2212, 236, '_wp_page_template', 'default'),
(2213, 237, '_', 'field_5aad53ca0a12e'),
(2214, 236, '_quads_config_visibility', 'a:0:{}'),
(2215, 236, '_', 'field_5aad53ca0a12e'),
(2216, 238, '_', 'field_5aad53ca0a12e'),
(2217, 45, '_quads_config_visibility', 'a:0:{}'),
(2218, 238, 'wps_subtitle', 'Subtitle Example'),
(2219, 45, '_', 'field_5aad53ca0a12e'),
(2223, 2, '_edit_lock', '1522186372:1'),
(2224, 243, '_edit_lock', '1521991651:1'),
(2225, 243, '_edit_last', '1'),
(2226, 243, '_wp_page_template', 'default'),
(2228, 243, '_quads_config_visibility', 'a:0:{}'),
(2229, 243, '_post-metabox_sortable_wordpress_gallery', '23,26,29,19'),
(2230, 186, '_edit_lock', '1523030983:1');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2017-08-20 18:56:42', '2017-08-20 18:56:42', 'Welcome to WordPress. This is your first post. Edit or delete it, then start writing!', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2017-08-23 18:56:18', '2017-08-23 18:56:18', '', 0, 'http://localhost/udemy/?p=1', 0, 'post', '', 1),
(2, 1, '2017-08-20 18:56:42', '2017-08-20 18:56:42', 'This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href=\"http://localhost/udemy/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!', 'Sample Page', '', 'publish', 'closed', 'open', '', 'sample-page', '', '', '2017-08-20 18:56:42', '2017-08-20 18:56:42', '', 0, 'http://localhost/udemy/?page_id=2', 0, 'page', '', 0),
(4, 5, '2017-08-25 18:26:31', '2017-08-25 18:26:31', '\r\n<h2>Voluptatum repudiandae a dolores perspiciatis expedita quia est. Accusantium fugiat asperiores expedita ut omnis officia non</h2>\r\n\r\n<hr />\r\n\r\n<h6>Et quia est possimus est non natus</h6>\r\n<ol>\r\n 	<li>Excepturi eaque</li>\r\n 	<li>Nihil soluta ut deleniti quam</li>\r\n 	<li>Velit autem et earum officia</li>\r\n</ol>\r\n\r\n<hr />\r\n\r\n<!--more-->\r\n<h5>Et voluptate aut ullam aut. Aut est tempore rerum eius et voluptas rerum aut. Dolor commodi tempora exercitationem enim</h5>\r\n<blockquote>Voluptatum sit quibusdam fugit sunt quia. Eveniet iure et excepturi voluptatem. Facere suscipit asperiores cumque quia iusto rerum. Tempore et eos vitae. Ad dicta nemo et non sint. Occaecati molestiae et facilis illo ratione voluptatum voluptatibus. Atque corrupti quibusdam enim <a title=\"Delectus.\" href=\"http://www.hoppe.com/\">nesciunt</a> Aut sed ut adipisci quis saepe. voluptatem architecto minus porro et. Quaerat distinctio dolores hic dolor eaque. quisquam quos dignissimos dolor odio. doloremque voluptatem omnis dolores qui rerum. aperiam dolor omnis odio aspernatur dolor molestias. quod sunt sapiente rem. suscipit ut eligendi totam Possimus necessitatibus maxime nulla et quia. voluptate asperiores doloremque Officia corporis rerum dolor et et. Id velit eos dolores odit unde dignissimos. Quae enim enim quisquam dolores Et accusantium quis omnis dolor sint voluptate. Sint expedita quibusdam cumque sint harum optio. Quasi ab itaque. Harum qui dolores dolorum quia. laboriosam id vel optio cupiditate. consequuntur possimus omnis et omnis eaque. Sunt ducimus sit <a title=\"Delectus itaque illum.\" href=\"https://www.zemlak.com/consequatur-sit-rem-accusantium-autem-quos\">nemo. Commodi ducimus possimus rem</a> ullam cumque Facilis labore ut ea vel quia dicta quidem. ratione enim occaecati vero inventore iure. Labore odio rem quo Vero quaerat enim distinctio dolore vel Distinctio ratione quaerat rerum sit. Omnis nisi ducimus rerum repellat vel et.</blockquote>', 'Omnis asperiores voluptatem suscipit ut nisi', 'Sapiente nam est beatae ipsa dolor iusto ea similique et nobis aut voluptas minus sunt quia repudiandae officiis eius et labore eligendi iusto molestias voluptatem a natus aut non voluptatem aliquam porro quis voluptate officiis et magnam sed ad officia nihil molestias voluptas.', 'publish', 'open', 'open', '', 'omnis-asperiores-voluptatem-suscipit-ut-nisi', '', '', '2017-09-16 10:07:39', '2017-09-16 10:07:39', '', 0, 'http://localhost/udemy/?p=4', 0, 'post', '', 0),
(5, 1, '2017-08-22 12:59:26', '2017-08-22 12:59:26', '', '', '', 'inherit', 'open', 'closed', '', '5', '', '', '2017-08-22 12:59:26', '2017-08-22 12:59:26', '', 0, 'http://localhost/udemy/wp-content/uploads/2017/08/fa93663e-f959-36e1-a5f9-45788012d5e1.jpg', 0, 'attachment', 'image/jpeg', 0),
(6, 5, '2017-08-24 11:14:50', '2017-08-24 11:14:50', '<hr>\n<ol><li>Consequatur adipisci consequuntur enim et</li><li>Et adipisci tempora et sequi</li><li>Voluptatem saepe</li><li>Ducimus</li><li>Porro eum eius</li></ol>\n<hr>\n<img src=\"http://localhost/udemy/wp-content/uploads/2017/08/fa93663e-f959-36e1-a5f9-45788012d5e1.jpg\">\n<hr>\n<!--more-->\n<h1>Dolorum laborum sit ea. Sint culpa harum aliquam a sed voluptatem expedita. Dolor quo occaecati in distinctio voluptates sit nihil quia</h1>\n<ul><li>Eaque qui nisi debitis sint</li><li>Quia harum et ut non dicta ipsa</li><li>Doloribus a odit</li><li>Inventore ad quaerat ratione omnis a</li></ul>\n<blockquote>Quos doloremque et et sint pariatur. Necessitatibus provident repellat ut quam vitae omnis. officia eligendi sed <a title=\"Cupiditate repellendus laudantium.\" href=\"https://www.torp.com/eveniet-minus-deserunt-porro-inventore\">cum nam reiciendis. Sint numquam consequuntur et</a> placeat quo. Ipsa ut veniam mollitia nesciunt <a title=\"Laudantium soluta sed enim non sapiente.\" href=\"http://thompson.net/animi-vero-occaecati-quo-ullam-ducimus-eius-corrupti\">Similique</a> eos eum occaecati. Accusamus ut necessitatibus ea. <a title=\"Reprehenderit corrupti veritatis similique sit.\" href=\"http://www.rice.com/\">qui officia dolores cum rerum</a> Ad consequatur odio quidem fuga. Nisi aliquam architecto qui et. Et consectetur laborum rerum laudantium. ex adipisci adipisci et nihil. Sit tempore <a title=\"Quod nihil aut.\" href=\"http://www.wilderman.info/ut-accusamus-id-magnam-quod-architecto-corrupti-sed-sed\">animi non minus illum exercitationem odit.</a> <a title=\"Incidunt ut facere laborum omnis.\" href=\"http://www.von.com/\">veniam est enim blanditiis</a> natus totam Doloribus minima molestias labore dicta magni. Esse sequi dolor repellat tenetur non <a title=\"Voluptatem impedit cum.\" href=\"http://www.thompson.com/\">Est</a> voluptas qui <a title=\"Possimus saepe beatae.\" href=\"http://www.wuckert.com/porro-illum-ut-et-error-odit\">est officia dolorem. Vel</a> consequatur est Atque maxime alias fugiat nesciunt. Ab omnis neque vel quam ipsam. Nemo et placeat <a title=\"Dolores explicabo.\" href=\"http://www.huels.com/optio-molestiae-explicabo-ratione-consequuntur-magni-maiores-nesciunt\">Non nisi</a> qui et repellendus nobis. Voluptatibus quis laborum.</blockquote>\n<h6>Illum voluptatem explicabo eos aut. Quia cumque impedit sequi repellendus eum. Eos quis perspiciatis voluptatibus perspiciatis laborum eos odit</h6>\n<blockquote>Iure impedit animi officia. Repudiandae eos <a title=\"Enim quia sit ipsa temporibus.\" href=\"http://www.boyer.com/nihil-voluptatem-est-mollitia-enim.html\">sit quibusdam debitis sequi aut. Perferendis vel non laudantium</a> <a title=\"Iure sed sit voluptate dolorum omnis facilis.\" href=\"http://kilback.net/repellendus-sed-nihil-deserunt-qui.html\">maxime</a> eius.</blockquote>\n<ul><li>Libero quasi quis ducimus</li></ul>\n<blockquote>Veniam exercitationem nam facilis repellat commodi dolores. Dolores mollitia ad molestias corrupti autem doloremque eos sed. Dolor dolorum perspiciatis possimus totam et.</blockquote>\n<p>Ea molestiae aut ut. Quia enim ut voluptas laudantium nulla. Voluptatem adipisci eius id at dicta consequatur aspernatur. Beatae atque nemo aut neque. Sit sit ipsum mollitia et ut ea suscipit. Doloremque itaque facere et optio dolores. Enim nesciunt assumenda voluptatibus voluptatem quod deleniti consequatur quasi. Velit qui ab totam earum quo. Repudiandae blanditiis possimus quo hic tempore neque corporis quod. Et vel ipsam aut et quo. Distinctio id ipsum omnis nobis ab blanditiis. In et dolor quis qui aut. Cupiditate laudantium dolor veritatis dolores et laudantium. Quo ab aliquam fuga explicabo in officia. Possimus quod modi et autem aut. Quia exercitationem fugit doloremque aliquid corporis. Et sint distinctio aut voluptatem quos accusantium. Iure iste quas et vel consequatur velit. Enim dolore reiciendis assumenda deleniti id. Quae neque sint quod molestias sit ipsam. Est tempora ea commodi. Non minima magnam dolores ratione. Vero possimus autem maxime sed cupiditate. Maxime voluptas tempore tenetur sunt sunt aut incidunt. Placeat delectus dolorem recusandae et ea id eos.</p>', 'Fuga voluptatum est ut', 'Cum officiis placeat aliquam itaque quae harum est maiores aut ipsa et dolorem sint quaerat aut in earum ut non consectetur porro qui provident quia a harum recusandae modi placeat commodi illum eum at.\n\nConsequatur iste architecto et itaque facere aliquid vitae aliquam aut consequatur optio et eveniet sed sit sit ut asperiores iusto eius ut eos modi et sequi explicabo sint dolorem pariatur debitis molestiae officia sapiente repellendus illo corporis quia animi dignissimos soluta incidunt debitis.', 'publish', 'open', 'closed', '', 'fuga-voluptatum-est-ut', '', '', '2017-08-24 11:14:50', '2017-08-24 11:14:50', '', 0, 'http://localhost/udemy/?p=6', 0, 'post', '', 0),
(7, 2, '2017-08-13 16:36:03', '2017-08-13 16:36:03', '<blockquote>Est voluptas aut necessitatibus. Nisi vitae quia. Itaque eveniet ut harum. Sapiente velit quia reiciendis occaecati voluptas omnis. maxime <a title=\"Quo aspernatur.\" href=\"https://hettinger.com/odit-nostrum-exercitationem-beatae-expedita-sequi-occaecati-nulla-voluptatum.html\">neque nostrum accusamus magnam.</a> porro cum neque sed. <a title=\"Placeat minima.\" href=\"http://bins.com/iste-facere-labore-sequi-eum-impedit-sit\">optio</a> excepturi nihil. sed est est quia est rerum. possimus dolorem soluta et molestiae Molestiae et voluptates animi voluptas praesentium. Aspernatur quod nostrum. Qui pariatur quo aut et fugit. Et voluptatum <a title=\"Et placeat sed.\" href=\"https://www.funk.com/voluptas-sint-ut-iure-accusantium-et\">est. Voluptatem veritatis aut quia qui</a> qui. Veniam itaque placeat itaque reprehenderit dolores. Alias similique dolores soluta rerum sed. velit iure veritatis. <a title=\"Consequatur quia.\" href=\"http://www.dickens.com/provident-velit-voluptatem-omnis-sit-consectetur-quis-qui.html\">rerum hic sapiente et</a> eius velit. Hic repellendus tenetur vel optio dolor quia. Rem deserunt non ut. Consequatur quia consequuntur aut quasi. animi ex possimus in et <a title=\"Suscipit qui temporibus alias.\" href=\"http://www.marquardt.com/fugit-ipsum-suscipit-voluptatem-repudiandae-voluptatem\">Quas dolorum aut voluptas maxime. Tempora consequatur</a> enim incidunt est provident in qui. voluptas ex porro cumque atque officia velit odio. Et enim quidem asperiores culpa Voluptatem repudiandae ratione et <a title=\"Minima repudiandae eum.\" href=\"http://yost.com/nihil-velit-nisi-velit-aliquam-perspiciatis-earum-est\">ut minus ut. Exercitationem exercitationem suscipit et.</a> cupiditate enim accusamus quas est <a title=\"Sint necessitatibus ab quibusdam dignissimos.\" href=\"http://walker.com/doloremque-ipsum-error-exercitationem-qui-consectetur.html\">tempora. Nesciunt et esse et odit.</a> soluta omnis dolores. voluptates molestiae iure reprehenderit ut. Omnis quisquam rem ullam recusandae placeat quis. Necessitatibus nihil porro <a title=\"Ea omnis.\" href=\"http://tremblay.info/\">ipsum amet ipsam</a> Dolorum accusantium a nobis harum hic aperiam Voluptatem facilis id quae. Deserunt perspiciatis ipsa veniam. Labore exercitationem eaque assumenda. Repellat labore velit enim a fuga minima. ut quas unde voluptatem quaerat neque. Qui soluta natus nam <a title=\"Quia fuga.\" href=\"http://www.nitzsche.com/reprehenderit-dolor-in-repellat\">Illo nam fugit mollitia et</a> rem id. quae doloribus quaerat exercitationem.</blockquote>\n<img alt=\"Aut reiciendis sed consequatur omnis aperiam\">\n<p><a title=\"Nemo eligendi et asperiores.\" href=\"http://www.harber.com/dolorem-et-aliquid-molestiae.html\">Quasi provident corporis dolores veritatis</a> suscipit. Voluptatum necessitatibus voluptatem. Sint aut et ratione amet facere numquam. Qui maiores expedita consequuntur veritatis. Adipisci dolore praesentium voluptates ut dicta neque possimus. corrupti quo odit quibusdam Iure reiciendis fuga tenetur id ab veritatis.</p>\n<h3>Magni culpa aut sed tempora doloremque suscipit. Atque et error velit similique aut facere corporis nobis. Corrupti consequatur nemo quas cumque sit magni</h3>\n<hr>\n<!--more-->\n<img class=\"alignleft\" alt=\"Et earum mollitia repellat\">\n<p>Quam assumenda illo reprehenderit et vel eos illum. Animi inventore voluptatem quo voluptas. Necessitatibus nobis mollitia voluptate voluptatem. Ducimus et ea necessitatibus dicta itaque qui. Perferendis error repellat labore cupiditate consequatur labore. Atque aut repellendus dignissimos qui et. Cupiditate veniam illum reiciendis non consectetur autem et. Veritatis tempore aut est fugiat. Fugit amet corrupti odio et voluptatibus laudantium qui. Fugit ut provident incidunt qui. Fugiat quas veniam magni sit qui. Consequatur pariatur minus dolores nisi. Sint et voluptatem est et voluptatem dolorum laboriosam. Aut ab facilis dolores quaerat fugiat aut eveniet. Id suscipit laboriosam molestias non quis. Quod vel quia velit. Repellat aliquid est occaecati praesentium. Recusandae a odit qui doloremque itaque minus ut. Rerum est quas omnis neque sed qui. Nemo magnam deleniti hic qui. Et atque facilis eos. Aut amet exercitationem totam similique rerum quia. Labore aut aut molestias laboriosam exercitationem. Hic doloribus consequatur quia est temporibus. Et adipisci totam est cupiditate quo repellat. Dolores enim nobis veritatis corrupti ullam dolores et. Harum sed natus dolorem enim vero voluptas qui labore. Magni aut dolores aut voluptatem itaque. Aut maxime aliquid incidunt ex adipisci aut officia. Est et blanditiis ut. Alias voluptatem sequi consequatur et. Velit sit qui nihil rem placeat eos. Doloremque corrupti eveniet voluptates nihil. Nobis voluptatum magni consequuntur eaque veritatis dicta quaerat. Quidem maxime dolores facilis dolorum est. Soluta eligendi est impedit odio esse quod ut. Eveniet aut quaerat laboriosam esse modi vel. Voluptatem adipisci ab similique et rerum aut itaque. Et illo eius omnis et asperiores repudiandae sed. Accusamus officia voluptas veniam eius qui. Quidem aperiam molestias ab similique asperiores nobis sint dolore. Dicta nisi qui nam qui ut.</p>\n<h5>Quod aut distinctio qui. Expedita quos quo autem. Omnis fugit consequuntur nemo quae voluptatem. Omnis non fugiat eaque eaque</h5>\n<ul><li>Nisi</li><li>Quod quod rem voluptate</li><li>Deserunt architecto delectus ipsum accusamus</li></ul>\n<p>Sit velit tenetur provident consequatur molestiae. Quas earum vel voluptatem possimus. Aspernatur ad eum non aliquid libero expedita aliquam. Quia qui distinctio dolor vel excepturi similique. Dolore aut explicabo excepturi excepturi. Nisi officia sit architecto dolorum corrupti soluta consequatur. Nisi consequatur sed reprehenderit voluptatem velit id odio. Ducimus dolorum quod incidunt hic eos aut. Id quam quaerat voluptas commodi. Facilis sunt iure illo aperiam error vero recusandae. Perspiciatis dolor odit eveniet harum necessitatibus. Sed illum est veniam ut dolores consequatur dolores. Ipsum itaque voluptas rem et et dignissimos. Iusto recusandae incidunt recusandae similique exercitationem dolorum. Odit rerum aspernatur tempore aut blanditiis placeat sed a. Incidunt iste deleniti pariatur aut sed. Et mollitia voluptatem cum voluptatem aliquam ratione quibusdam. Nisi vitae odit nam eos sunt. Eaque aperiam sed aperiam enim earum. Ex dolor perspiciatis nulla esse. Ea natus ea odio dolore laboriosam. Consequatur corrupti nobis vel accusamus officiis. Neque qui quia est veniam consequatur voluptas rem. Dolorem dolorem libero in molestiae sit eaque. Asperiores dolorem officiis iure enim velit dolores repudiandae. A sed expedita sapiente et id. Nulla dolores mollitia sed libero. Necessitatibus repellendus numquam dolorem provident aut labore inventore eligendi. Et autem repellendus voluptatem quo hic sapiente commodi corrupti. Eligendi natus corporis iste dignissimos et rerum. Delectus eum velit sit. Eos quos et esse maxime veniam dignissimos. Eveniet temporibus ut ut ea. Vel voluptatem eos laboriosam ut. Impedit nobis blanditiis laboriosam quas commodi similique. Odit blanditiis odit dicta rerum atque. Illum quia maxime nihil reprehenderit corrupti qui. Maxime ut laboriosam perferendis eum ratione. Recusandae et laboriosam unde porro voluptas.</p>\n<img alt=\"Voluptatem in\">\n<ul><li>Eaque nemo fugiat soluta</li><li>Voluptatem aut ex est</li><li>Quod numquam et ex laudantium iure quod</li><li>Commodi sint id impedit</li><li>Veritatis facilis et quia</li><li>Consequatur autem</li><li>Dolorem quia maxime</li><li>Ea soluta iusto voluptatem</li></ul>\n<h6>Placeat laborum nulla occaecati nam. Asperiores sed architecto velit sunt beatae. Omnis aut nesciunt ullam facere ipsa maxime. Qui occaecati ex itaque iusto nobis</h6>\n<ol><li>Corrupti illum quo qui neque</li><li>Minima ea officia iure</li><li>Eligendi laudantium</li><li>Labore explicabo laboriosam eaque eos</li><li>Et repudiandae sit iste cumque quisquam</li></ol>', 'Voluptatem quidem iure impedit rerum et quisquam', '', 'publish', 'open', 'closed', '', 'voluptatem-quidem-iure-impedit-rerum-et-quisquam', '', '', '2017-08-13 16:36:03', '2017-08-13 16:36:03', '', 0, 'http://localhost/udemy/2017/08/13/voluptatem-quidem-iure-impedit-rerum-et-quisquam/', 0, 'post', '', 0),
(8, 1, '2017-08-22 12:59:50', '2017-08-22 12:59:50', '', '', '', 'inherit', 'open', 'closed', '', '8', '', '', '2017-08-22 12:59:50', '2017-08-22 12:59:50', '', 7, 'http://localhost/udemy/wp-content/uploads/2017/08/a5922831-128d-3756-baf6-a945f8d7d164.jpg', 0, 'attachment', 'image/jpeg', 0),
(9, 2, '2017-08-27 08:29:11', '2017-08-27 08:29:11', 'https://www.youtube.com/watch?v=zZ_mlaKmUfk\r\n<a title=\"Quidem.\" href=\"https://www.dibbert.com/magnam-quo-fugit-ex-tempora-sed-aut-ut-est\">Expedita rerum voluptas amet et</a> <a title=\"Aspernatur.\" href=\"http://www.block.org/\">quo aspernatur</a> Est sunt <a title=\"Sed vel dignissimos ea repudiandae omnis ut.\" href=\"http://sipes.org/quo-eaque-consectetur-est-autem-illum-consectetur-odit\">ipsam. Nam</a> <a title=\"Voluptates est fugiat.\" href=\"http://www.ryan.biz/labore-consequatur-distinctio-maiores-aut-earum.html\">corrupti rerum. Quia commodi id quia</a> <a title=\"Reiciendis deserunt ducimus sed vel.\" href=\"https://www.dare.com/enim-molestiae-earum-cupiditate-facilis\">debitis expedita quidem. Quia</a> <a title=\"Voluptate quibusdam illo consequatur.\" href=\"http://hirthe.biz/\">cumque ut.</a> <a title=\"Provident itaque dolorem est doloremque minus natus recusandae ea.\" href=\"http://www.hettinger.info/quam-fuga-qui-molestiae-ut\">recusandae facilis quas molestias maxime</a> <a title=\"Iste.\" href=\"http://www.bergstrom.com/molestiae-ut-voluptates-nihil-saepe\">est. Aut iusto asperiores</a> <a title=\"Quo aut velit.\" href=\"http://boyer.biz/dignissimos-id-facilis-molestiae\">aperiam et qui non molestiae.</a>\r\n<h5>Aut minus sequi sequi totam similique tempora</h5>\r\n<ul>\r\n 	<li>Nihil deleniti</li>\r\n 	<li>Iste error excepturi sint voluptatibus velit</li>\r\n</ul>\r\n<h2>Tempora similique perferendis itaque est nisi et. Nostrum quisquam quas ut ad possimus quibusdam aut. Et id doloribus eveniet itaque</h2>\r\n<!--more-->\r\n<ul>\r\n 	<li>Qui et et</li>\r\n 	<li>Et corporis quia rem quia</li>\r\n 	<li>Voluptate nulla temporibus modi veniam</li>\r\n 	<li>Aut consequatur aut rem</li>\r\n 	<li>Et illum sequi et eius</li>\r\n 	<li>Rem quam incidunt et</li>\r\n 	<li>Odio minus sequi ipsam voluptatibus</li>\r\n 	<li>Laborum ab aut perspiciatis</li>\r\n</ul>\r\n<h3>Quod officia in qui vel qui ipsum. Nam libero voluptatem officia officiis</h3>\r\n<ol>\r\n 	<li>Quia assumenda dolores ut sunt quis</li>\r\n 	<li>Facilis odio maxime facilis nihil</li>\r\n 	<li>Aut aut eveniet libero nihil modi tempora eius rerum</li>\r\n 	<li>Sit aut dolor</li>\r\n 	<li>Saepe deserunt pariatur deserunt id</li>\r\n 	<li>Sit dicta</li>\r\n 	<li>Architecto</li>\r\n 	<li>Corporis qui</li>\r\n</ol>\r\nQuo aliquid adipisci laudantium <a title=\"Ipsa et laboriosam veritatis et.\" href=\"http://www.volkman.com/temporibus-voluptatem-hic-quia-rerum-quod-nihil-totam\">ut esse facilis</a> Itaque minima nesciunt impedit modi. Placeat perferendis nisi animi. Modi non et amet aliquid. Ipsum enim est vel rerum. Et odio in amet. Tempora asperiores tempora tenetur. Consequatur illo ipsum error nobis Illum voluptatem nulla iste. Nisi reprehenderit laboriosam provident enim Quam ratione at est aut. Et ut <a title=\"Asperiores vel doloribus.\" href=\"http://dubuque.com/aspernatur-atque-perferendis-officia-vero-magni-id.html\">Beatae debitis</a> rem vel alias A ut nisi est soluta est. Iure eligendi <a title=\"Illum consequatur veniam ullam recusandae ullam libero.\" href=\"http://bednar.info/porro-delectus-ea-qui-et-commodi-optio-iure.html\">molestiae earum libero natus debitis. Laudantium ut modi</a> et qui facere Dolores id eaque dolorem. Nesciunt voluptatem sed. <a title=\"Veritatis delectus.\" href=\"http://rau.net/eum-ut-nisi-eos-voluptas-neque-animi-sapiente.html\">quasi deserunt enim</a> sit alias. Quod laborum itaque assumenda debitis. aut libero rerum veritatis rerum ut. sed consequatur libero assumenda quam Voluptate aliquid porro deleniti ut et distinctio consequuntur. Voluptatem aut et qui molestias. praesentium ut aut ea.\r\n\r\nVero cum dolor distinctio <a title=\"Quia ut nesciunt aut molestiae pariatur amet.\" href=\"http://www.rogahn.info/ipsa-est-ut-quidem-voluptatibus.html\">inventore enim. Quae quam iusto odit vel et odio</a> <a title=\"Omnis reprehenderit.\" href=\"http://www.zieme.com/placeat-quos-quasi-voluptatum-eos-voluptas.html\">necessitatibus. Voluptates</a> qui atque doloremque esse.', 'Aliquam qui laudantium exercitationem', 'Quo asperiores sit expedita ea tempora beatae vel dolor omnis magni quia odio quos soluta labore neque est fugiat blanditiis ipsa rerum corrupti autem autem ab numquam enim nam accusamus ipsam voluptatibus sit animi enim doloribus impedit deserunt magni molestiae odio ipsam fugiat quaerat eveniet expedita quam alias ut sunt qui fugiat natus possimus aut voluptas recusandae sint.\r\n\r\nUt et qui placeat et qui voluptas in nihil architecto et ducimus quo eum dolorem nostrum quo soluta minima dicta autem voluptatem provident impedit repellat quae ex maxime nisi sed consectetur laborum nostrum maxime odio culpa suscipit accusamus molestias est amet deserunt necessitatibus sed est iure sapiente eius ipsa quo veritatis debitis sit accusamus et hic ut recusandae dolore ad quibusdam ut suscipit eos amet ipsa quae nobis dignissimos quo qui dolor est optio inventore aliquam qui quisquam vero deleniti.', 'publish', 'open', 'open', '', 'aliquam-qui-laudantium-exercitationem', '', '', '2017-09-16 10:32:10', '2017-09-16 10:32:10', '', 0, 'http://localhost/udemy/?p=9', 0, 'post', '', 0),
(10, 1, '2017-08-22 12:59:59', '2017-08-22 12:59:59', '', '', '', 'inherit', 'open', 'closed', '', '10', '', '', '2017-08-22 12:59:59', '2017-08-22 12:59:59', '', 0, 'http://localhost/udemy/wp-content/uploads/2017/08/9e9a0fe7-0766-374f-8f1d-bbcdbb126e47.jpg', 0, 'attachment', 'image/jpeg', 0),
(11, 1, '2017-08-22 13:00:01', '2017-08-22 13:00:01', '', '', '', 'inherit', 'open', 'closed', '', '11', '', '', '2017-08-22 13:00:01', '2017-08-22 13:00:01', '', 0, 'http://localhost/udemy/wp-content/uploads/2017/08/2c4ded2d-bb5b-3a02-9836-9d00c0dbbae9.jpg', 0, 'attachment', 'image/jpeg', 0),
(12, 1, '2017-08-25 20:13:04', '2017-08-25 20:13:04', 'Excepturi eligendi quos nisi occaecati Illum ullam fugiat dolor corporis explicabo. Sint ea non. ut tempora suscipit. consequatur et id ut. Vel ea in ea. Dolores et voluptatem praesentium. Maiores dignissimos magni Illo reiciendis qui dolorem. Explicabo ipsa ut rem ipsam Amet praesentium nemo minus enim sed architecto. voluptatibus dignissimos cum. Omnis quo modi mollitia. et vero quia voluptatem. Tempore nihil <a title=\"Quia occaecati est officia.\" href=\"https://jast.net/possimus-aut-modi-nihil-commodi-et-eius.html\">non</a> Omnis labore velit velit enim aut omnis. Autem et sint atque qui sit sapiente. quia ex dolores Voluptatem quia eum consectetur. Ad non nam nihil dolorem optio. Cupiditate animi necessitatibus molestiae aut. Excepturi animi velit reiciendis molestias. ipsam sed minus minus eos Dolor odit et sint et eligendi. Perferendis atque eligendi ad dicta. Ipsa exercitationem et consequatur explicabo.\r\n<h5>Vel ab corporis eum. Omnis minima non sit libero et. Dolores hic qui non cum eligendi doloribus</h5>\r\n<blockquote>Sint debitis laborum incidunt quam officiis facere. Modi id velit explicabo pariatur. Quisquam asperiores qui quas. magni ab sed <a title=\"Inventore velit dicta.\" href=\"https://lehner.net/error-nostrum-aut-saepe.html\">voluptatibus adipisci</a> Vel sunt reiciendis dolores possimus <a title=\"Quos autem deserunt.\" href=\"http://www.connelly.com/facere-aspernatur-earum-ex-possimus-commodi-explicabo\">qui. Tempora</a> et sint soluta. Et nobis ut id autem aut eos non. Rerum eius tempore harum et ex. aut accusamus possimus qui. Quis quia quia dolor voluptatum porro rem. cumque aliquam similique quod optio sit. Earum quia et at aliquam. Nam sint nihil rerum blanditiis earum dolorum. Aperiam rem quos accusamus quaerat quisquam. aliquam aliquam dignissimos voluptatum hic. Quis rerum necessitatibus occaecati unde. facilis officiis quo sequi facilis molestiae. Quia harum fuga sed. Et <a title=\"Consequuntur rem quo.\" href=\"http://www.hills.com/ullam-qui-necessitatibus-sit-voluptatem\">maxime sapiente qui.</a></blockquote>\r\n<h4>Laborum vitae repudiandae rem provident dolorem ut mollitia. Est eos consectetur delectus illo optio deserunt aut</h4>\r\n<!--more-->\r\n<img src=\"http://localhost/udemy/wp-content/uploads/2017/08/9e9a0fe7-0766-374f-8f1d-bbcdbb126e47.jpg\" alt=\"Ducimus ipsa consequatur quod atque voluptas impedit quae\" />\r\n<h2>Est sed occaecati quasi qui. Vel aliquid et vel beatae</h2>\r\n<img class=\"aligncenter\" src=\"http://localhost/udemy/wp-content/uploads/2017/08/2c4ded2d-bb5b-3a02-9836-9d00c0dbbae9.jpg\" alt=\"Odit fuga fugit nam et\" />', 'Consequuntur aut sapiente quam officia', '', 'publish', 'open', 'closed', '', 'consequuntur-aut-sapiente-quam-officia', '', '', '2017-08-30 11:29:01', '2017-08-30 11:29:01', '', 0, 'http://localhost/udemy/?p=12', 0, 'post', '', 1),
(13, 1, '2017-08-22 13:00:04', '2017-08-22 13:00:04', '', '', '', 'inherit', 'open', 'closed', '', '13', '', '', '2017-08-22 13:00:04', '2017-08-22 13:00:04', '', 12, 'http://localhost/udemy/wp-content/uploads/2017/08/1c5c199a-cdc4-302d-a739-81679081c457.jpg', 0, 'attachment', 'image/jpeg', 0),
(14, 1, '2017-08-22 13:00:05', '2017-08-22 13:00:05', '', '', '', 'inherit', 'open', 'closed', '', '14', '', '', '2017-08-22 13:00:05', '2017-08-22 13:00:05', '', 0, 'http://localhost/udemy/wp-content/uploads/2017/08/39c0276a-a914-3ce9-9173-5f5cff1fd6e4.jpg', 0, 'attachment', 'image/jpeg', 0),
(15, 3, '2017-08-18 03:41:38', '2017-08-18 03:41:38', '<h3>Vero autem vitae autem sed. Recusandae est aut provident est consequatur dicta commodi. Dolores necessitatibus in voluptatem unde molestias et delectus</h3>\n<ul><li>Libero sed non ipsum saepe</li><li>In corporis amet</li><li>Rerum magnam eius est et</li><li>Facere</li><li>Autem enim saepe et</li><li>Voluptatem itaque totam dicta error</li></ul>\n<hr>\n<h2>Pariatur numquam consequatur maxime architecto consequatur eos sunt. Laborum illo eaque reiciendis et esse omnis consequatur. Quidem quas et et modi provident numquam est</h2>\n<ol><li>Pariatur vitae</li></ol>\n<p>Et aut voluptatem aut incidunt a omnis deleniti. totam deserunt at. aliquid doloremque commodi nulla deleniti Rerum et consequatur quam veritatis amet vitae. <a title=\"Voluptatem modi expedita non et.\" href=\"https://gottlieb.com/expedita-qui-distinctio-et-beatae-cumque.html\">aut voluptatem similique</a> velit dolorem Vel quod cum a suscipit optio Fuga ut sint possimus eum distinctio Quis tempora non est. cumque labore aliquid rerum consequatur est in. dolore recusandae eos aut. Quae sapiente facilis est fuga dolores. animi quibusdam aut eveniet. Repellendus vero cupiditate. Architecto nihil dolor quis eos Ipsa ducimus possimus a corporis voluptatum Dolores magni repellat ipsam rem qui. Perferendis illo aut quas laboriosam doloribus inventore Et ipsum consequatur quia qui. aut veritatis pariatur. Dolorem ut nihil ut. Id veniam nulla atque exercitationem magni Esse odit ullam aut dolores eos nisi. quas quis quo est labore libero Quidem sunt et eius et dignissimos libero. est perspiciatis voluptatibus Reiciendis non repellendus adipisci Suscipit consequatur eos magni voluptates et ipsa nulla. Aperiam aut corporis provident. laborum eligendi omnis et. Mollitia et exercitationem cupiditate doloremque non. Dignissimos recusandae voluptatem explicabo deleniti odit. Omnis magni molestiae deserunt. Molestias illum dolores nobis qui mollitia est Qui fuga labore aut odit. incidunt pariatur quis. Iusto modi veritatis molestias quisquam qui ea Qui officia nihil aspernatur sed provident labore illum. Illum eum iste quaerat. Dolor cum tenetur harum aut</p>\n<!--more-->\n<h2>Placeat neque rerum rerum. Voluptates quo corporis totam quia. Sed fugiat quia adipisci eligendi. Non non natus exercitationem aliquid</h2>\n<ol><li>Dolorem eius quam maxime tempora</li><li>Id ut dicta molestiae</li><li>Quos molestiae</li><li>Quo voluptates placeat similique nam</li></ol>\n<img src=\"http://localhost/udemy/wp-content/uploads/2017/08/39c0276a-a914-3ce9-9173-5f5cff1fd6e4.jpg\">\n<h2>Eaque laboriosam explicabo dolorum quam. Vel et hic et porro in. Recusandae ea dignissimos quia ducimus. Exercitationem eius unde ea</h2>\n<ul><li>Eaque culpa</li></ul>\n<h6>Nostrum et repellat facere dolore</h6>\n<img alt=\"Corrupti sequi\">\n<h2>Dolor quae perspiciatis consequatur quis nihil beatae. Error dignissimos enim aut natus ullam ab. Delectus vel tempora facilis qui</h2>\n<hr>\n<p>Aut sit quis odit <a title=\"Et suscipit minima dolore deleniti illo.\" href=\"http://maggio.com/iste-ex-hic-sit.html\">Eaque voluptatum quod inventore voluptas et</a> consequuntur. Odio dicta aliquam asperiores. Soluta quos consequatur accusamus tenetur Porro id aut consectetur dignissimos. Eos sequi consectetur libero veritatis. similique vitae minus ut. Autem explicabo neque laudantium qui blanditiis aut. iste sed ut veniam delectus hic. perspiciatis quaerat dicta reiciendis nesciunt quas.</p>\n<h6>Enim magnam sapiente similique sint rerum</h6>\n<p>Facere temporibus eos consectetur nisi explicabo asperiores blanditiis. Provident possimus sed ad quia. Quis ut quis illum ut qui. Delectus ut minus nemo accusantium magnam natus omnis. Fugiat quibusdam repellendus quisquam ut et ea repudiandae ducimus. Vero minima veniam non et libero dolorem. In voluptas praesentium non itaque vel possimus dicta. Quae alias repudiandae eum vero praesentium. Non et ipsum rerum est accusamus animi ut. Ipsum distinctio quisquam nobis maxime. Laboriosam aliquid quod architecto. Debitis vitae repellendus eum et nulla culpa. Odit ut adipisci consequuntur tempore in quis. Fugit magni rerum distinctio nesciunt laboriosam dolore soluta. Expedita voluptatem occaecati accusantium vero. Natus voluptas et quo mollitia ea quae. Officiis dolores optio placeat qui est.</p>\n<h1>Expedita iste quis provident harum ut. Soluta beatae rerum placeat. Et ut est sunt</h1>\n<blockquote>Quia vel quo necessitatibus distinctio laboriosam ut. Aliquid dolorum sint dolores praesentium corporis minus quis. Asperiores nostrum libero quae corrupti. Hic possimus perferendis voluptatem quae et alias qui et. Omnis quia accusamus facere est iste amet non. Qui quidem quam exercitationem soluta rem repellat corporis. Sint at debitis molestiae sit pariatur perferendis. Non at commodi aut. Explicabo voluptatem debitis facere quos fugit esse eveniet. Dolorem omnis rerum praesentium culpa. Dolorem laboriosam odio eaque dolore eum culpa quis. Minima explicabo molestiae facere sit natus ex. Quasi eius veritatis provident. Vero vel distinctio aut omnis amet illo. Eum qui nihil a enim similique rerum. Alias non eaque quas dolores quasi sint est qui. Nesciunt aut dolorem est iure asperiores. Aut rerum vitae rem aut aut autem consectetur. Iusto sed sed ea alias nobis maxime. Culpa quaerat eaque et aut. Eligendi provident quam vitae. Vero quam nihil asperiores vel perspiciatis. Molestiae aut sit deserunt id ut. Eaque impedit ut sequi quasi amet. Vitae tempora minima qui tenetur. Tempora non quia cupiditate qui ea. Aut voluptatem quae odit et officia consequuntur. Et qui voluptatibus consequatur quibusdam qui eum commodi. Ad est asperiores facere. Consequatur quibusdam qui optio eum soluta distinctio omnis consequuntur. Ipsam id rerum pariatur in magni reiciendis. In voluptates accusantium placeat atque et. Ipsa aut nihil sit nihil. Error voluptatem sit eum quasi sequi consequatur. Commodi aut vitae rem minus quisquam fugiat quas voluptatum. Ut sint officia dolore dolor nisi voluptate facilis. Sint suscipit et expedita commodi. Aut officia numquam optio. Ullam architecto nihil omnis iusto voluptatem. Assumenda optio deleniti molestiae sed. Veniam sunt quaerat odit excepturi perspiciatis vel. Expedita quo qui possimus. Ad ab deleniti consequatur. Voluptas pariatur placeat eos quia officia. Nam a repudiandae vel fuga porro aut qui.</blockquote>', 'Dolorem et odit velit suscipit aspernatur itaque', 'Maiores laborum magnam accusamus cupiditate in maiores accusantium ipsa recusandae dolorem laborum et vitae quos soluta sunt rerum dicta aut nihil voluptate aut quo asperiores ipsa eligendi aspernatur dolorem officia iste id velit provident sapiente vitae quam aut natus hic et quibusdam.\n\nEligendi asperiores et et est fuga nihil nihil vitae dolorem voluptatem corporis cupiditate impedit itaque qui qui quibusdam harum id iusto eos in totam aperiam et a voluptatem eos ipsam aut molestiae laboriosam aut sunt ullam mollitia autem.\n\nDoloribus tempore sapiente corrupti aut expedita dicta deserunt pariatur at omnis cupiditate ea voluptate molestiae repudiandae optio omnis eius vel temporibus reprehenderit cumque est natus ea et vel est et eos et aperiam dicta adipisci et animi repellendus sed ut esse reiciendis natus iusto corporis ut officiis non explicabo.', 'publish', 'open', 'closed', '', 'dolorem-et-odit-velit-suscipit-aspernatur-itaque', '', '', '2017-08-18 03:41:38', '2017-08-18 03:41:38', '', 0, 'http://localhost/udemy/2017/08/18/dolorem-et-odit-velit-suscipit-aspernatur-itaque/', 0, 'post', '', 0),
(16, 1, '2017-08-22 13:00:12', '2017-08-22 13:00:12', '', '', '', 'inherit', 'open', 'closed', '', '16', '', '', '2017-08-22 13:00:12', '2017-08-22 13:00:12', '', 15, 'http://localhost/udemy/wp-content/uploads/2017/08/f627ad3a-c58f-348e-bf18-4e9b8af5d473.jpg', 0, 'attachment', 'image/jpeg', 0),
(17, 3, '2017-08-23 02:19:48', '2017-08-23 02:19:48', '<h6>Est quibusdam quo qui eum. Quaerat eius delectus ut. Deserunt unde ullam nobis occaecati voluptatem facilis ut dicta</h6>\r\nQuam maiores non sit ratione nemo nam. Neque vel dolorem consequatur quo qui. Corporis et sed culpa adipisci quam. unde dolores culpa explicabo. Ut ut <a title=\"Reiciendis sit dolor et fugiat est.\" href=\"http://www.lowe.com/temporibus-itaque-at-corrupti-et-voluptas\">consequuntur</a> praesentium Quisquam dolorem sit consectetur corrupti optio eum. est voluptas officiis sint quo.\r\n\r\nAd at assumenda mollitia quaerat. Nisi enim aut <a title=\"Ipsum odio.\" href=\"https://reichel.com/qui-optio-velit-ea-eos-corrupti-eveniet-repudiandae.html\">quos sed voluptatum. Tempore</a> <a title=\"Fugiat sit iure esse omnis.\" href=\"http://donnelly.net/commodi-corrupti-accusamus-soluta-dolor-facere\">deleniti accusantium sint quasi consequatur.</a> consequuntur quam delectus pariatur. Ullam non eum autem <a title=\"Earum libero velit aut.\" href=\"http://barton.com/fugiat-rerum-sunt-commodi-quam\">quo</a> Non quam et alias. Itaque pariatur quae ut nobis recusandae molestiae. Provident distinctio inventore minima amet ratione <a title=\"Vitae architecto architecto minus veritatis sint.\" href=\"http://leannon.biz/quia-et-et-officia-sunt\">Quis cumque maiores</a> totam <a title=\"Ipsa ipsam quo deleniti consequatur nisi quis.\" href=\"http://kihn.com/quasi-sunt-laborum-rerum-officia-recusandae-est.html\">Reiciendis omnis</a> quod numquam dolorem quae ea. est eligendi modi <a title=\"Magni tempora.\" href=\"http://doyle.com/voluptas-ducimus-non-quis-qui-quia-similique\">repudiandae quod. Dolorem iste non earum mollitia</a> animi. Rerum expedita dignissimos <a title=\"In eos consequatur non quia quia aut explicabo eum nemo.\" href=\"http://www.beahan.info/\">aut suscipit laudantium voluptas</a> Nesciunt eligendi voluptas voluptatem similique nulla distinctio. eligendi laboriosam et Eveniet <a title=\"Accusamus vero animi recusandae dolor voluptatum ad iste est delectus.\" href=\"http://www.rice.com/\">est rem odit</a> Ut ut perferendis aut voluptatibus nihil. <a title=\"Dolorem distinctio tenetur.\" href=\"http://batz.com/nulla-labore-impedit-porro-quos-perspiciatis-totam\">non</a> vero quidem. Nam quidem ipsam harum suscipit eos eum. asperiores mollitia adipisci excepturi ad. Enim officia Odio excepturi sit voluptatum non Ut aut quo placeat eligendi cupiditate et. Laborum delectus totam temporibus. Quis doloremque deserunt sapiente\r\n\r\n<!--more-->\r\n<!--nextpage-->\r\n<blockquote>Officia iure quia ad sit Nostrum ea consequatur ut voluptate temporibus. Omnis esse magni ex optio voluptatum <a title=\"Aliquam exercitationem accusamus earum.\" href=\"https://www.walter.net/rerum-excepturi-rerum-ut-repellat-voluptatem-necessitatibus-corrupti-vero\">et. Minus sit</a> ex dolorum. Dolorem et excepturi amet Eum id sit amet eveniet autem. Qui ea possimus amet in <a title=\"Quia non et id exercitationem.\" href=\"http://pouros.net/velit-atque-corrupti-suscipit-ut.html\">Sequi</a> accusantium aut quia voluptates omnis quia. Aut laborum voluptatem esse quia <a title=\"Iste.\" href=\"http://conn.net/et-et-distinctio-dolore-quibusdam\">Maiores suscipit quia ut excepturi</a> repellat. Adipisci dolorum molestiae omnis quis in blanditiis ratione. est aut <a title=\"Ut fugit nisi.\" href=\"http://www.torp.org/neque-sint-aut-nulla-at\">soluta labore</a> Libero est autem aut voluptas. nam quod nisi minima maxime</blockquote>\r\n<ul>\r\n 	<li>Eius delectus odio aut sit</li>\r\n 	<li>Ad ducimus</li>\r\n 	<li>Voluptas esse</li>\r\n 	<li>Quam quos debitis unde dolorem</li>\r\n 	<li>Voluptatibus non a</li>\r\n 	<li>Qui magnam error non at</li>\r\n 	<li>Repellat soluta ut</li>\r\n</ul>\r\n<h6>Laborum et laborum sit suscipit dolorem vitae</h6>\r\nConsequatur est rerum perspiciatis aut asperiores. Tempora maiores maxime maiores praesentium accusamus dolores. Sit eos et voluptatem assumenda quasi qui. Et necessitatibus aspernatur voluptatem fugiat quia qui. Aut ut dolores optio sed aut sit quas. Repudiandae error quasi inventore et sit qui est aliquid. Sapiente id omnis culpa optio. Laboriosam velit doloremque ullam est sed. Rem fugiat voluptatum modi nemo. Eius veniam nulla delectus possimus iste ad dolorem. Voluptatum repellendus vitae molestiae aliquid. Voluptatem ullam quia beatae qui omnis. Molestiae sint earum sapiente perspiciatis. Vel molestias nihil et. Totam nemo laboriosam quia alias quia veniam. Qui consequuntur impedit perspiciatis neque. Id rerum similique nam aperiam deserunt soluta nam. Et necessitatibus deserunt modi perferendis cumque voluptas fuga. Accusamus sunt accusamus aperiam incidunt qui consequuntur. Voluptas nostrum repudiandae tempora rerum quo. Et repellat vel neque aut ea.\r\n\r\n<img class=\"alignleft\" />', 'Saepe minus molestiae aut qui qui', 'Explicabo ea hic illo facere molestiae eius illo labore voluptatem est nesciunt assumenda hic odit qui iste est earum enim ex soluta quibusdam dolorum enim aliquam autem saepe ut consequatur nulla magnam dolor.\r\n\r\nMinima tempora recusandae distinctio rem et omnis architecto quia doloremque culpa error ea excepturi non impedit modi dicta quaerat illo voluptatem impedit recusandae ducimus incidunt aut eveniet voluptatibus et enim et est impedit repellendus ipsam cupiditate exercitationem sed ut magnam veniam consequatur dolor odio sit voluptatem voluptatum consequatur ut est impedit et.\r\n\r\nNatus inventore quas aperiam sed qui quis aut voluptatum voluptas aut rerum libero est molestiae sint occaecati omnis ducimus distinctio nemo sequi natus voluptatum aperiam quis ut explicabo.\r\n\r\nOmnis quos eum reprehenderit molestiae aut dolore non amet voluptate provident eos nulla suscipit ratione nihil maiores vitae dolor vel consequatur assumenda voluptatem est voluptatem fugiat aliquid molestiae voluptates aut omnis voluptatem labore velit delectus omnis aut eaque aspernatur officiis incidunt nostrum qui labore et sint libero esse amet nulla totam libero est quas dolor modi qui et maiores rem.', 'publish', 'open', 'closed', '', 'saepe-minus-molestiae-aut-qui-qui', '', '', '2017-08-30 11:29:32', '2017-08-30 11:29:32', '', 0, 'http://localhost/udemy/?p=17', 0, 'post', '', 0),
(18, 1, '2017-08-22 13:00:19', '2017-08-22 13:00:19', '', '', '', 'inherit', 'open', 'closed', '', '18', '', '', '2017-08-22 13:00:19', '2017-08-22 13:00:19', '', 17, 'http://localhost/udemy/wp-content/uploads/2017/08/12dc21bf-e899-3031-981d-a430dbd86643.jpg', 0, 'attachment', 'image/jpeg', 0),
(19, 1, '2017-08-22 13:00:23', '2017-08-22 13:00:23', '', '', '', 'inherit', 'open', 'closed', '', '19', '', '', '2018-03-17 18:08:16', '2018-03-17 18:08:16', '', 236, 'http://localhost/udemy/wp-content/uploads/2017/08/6987293f-171e-34f9-bb76-fb885ca74d4a.jpg', 0, 'attachment', 'image/jpeg', 0),
(20, 1, '2017-08-17 21:57:52', '2017-08-17 21:57:52', '<blockquote>Harum sequi magni eligendi voluptatem qui <a title=\"Et.\" href=\"https://www.metz.info/et-culpa-cumque-ut-ipsa\"><a title=\"Tempore ad dicta maxime qui voluptate.\" href=\"http://www.toy.net/laudantium-recusandae-doloribus-quia\">Ullam qui iusto unde sunt</a></a> <a title=\"Ad laudantium vel rem.\" href=\"https://www.herman.info/est-sint-excepturi-saepe\">quasi ipsam</a> Repellat rem pariatur vel corrupti.</blockquote>\n<ol><li>Aliquid vel aperiam</li><li>Aut modi consectetur enim</li><li>Voluptatem et est illo</li><li>Ipsum possimus aliquam esse ut ullam</li><li>Itaque natus ipsam excepturi culpa et</li></ol>\n<blockquote>Magnam assumenda in est expedita esse. Quisquam odit amet voluptatibus ut ullam et <a title=\"Hic similique eligendi nisi.\" href=\"http://www.schoen.net/libero-harum-dolores-quis-neque-vero-deserunt.html\">Quasi</a> omnis quia itaque. <a title=\"Aut quisquam veniam a consequuntur.\" href=\"http://farrell.com/ad-fugiat-est-et-quas-quidem\">omnis dolorum</a> omnis numquam odit. eos quaerat neque error quasi. Necessitatibus hic qui molestiae fugit <a title=\"Corporis ipsa.\" href=\"https://pfeffer.com/nostrum-et-optio-voluptas-est-nobis-consectetur-maiores-distinctio.html\">possimus. Rerum sed non</a> voluptatibus non. Porro aut dolorem <a title=\"Sed harum.\" href=\"http://www.ledner.com/libero-aut-ea-consectetur-aut-nostrum-at-adipisci-rerum\">autem autem. Ex</a> veritatis commodi quo et Qui eos blanditiis rerum nisi. Porro esse quas. Vel est sint minus necessitatibus inventore. et recusandae repellendus a. Rerum omnis corrupti est minima <a title=\"Ut culpa harum ratione.\" href=\"https://www.nolan.com/quia-similique-quasi-ipsa\">rerum. Dolorem voluptatem amet</a> ab quam natus. Dolorem aspernatur aut <a title=\"Est.\" href=\"https://herman.com/in-et-architecto-voluptatem-molestiae-eos-nisi-impedit.html\">non labore</a> reprehenderit. maiores dolor ullam architecto animi qui ducimus libero.</blockquote>\n<img alt=\"Odit neque\" src=\"http://localhost/udemy/wp-content/uploads/2017/08/6987293f-171e-34f9-bb76-fb885ca74d4a.jpg\">\n<!--more-->\n<ul><li>Aut ab autem ut qui</li><li>Natus nisi voluptatem vel impedit est</li><li>Fugiat debitis eum eius sapiente est</li><li>Dolores consequatur aut enim a</li><li>Aperiam aut porro explicabo ad laudantium</li><li>Rerum veniam ipsam enim in</li><li>Ea dolor cum omnis id at</li><li>Officiis error</li></ul>\n<p>Nisi architecto quo. commodi est quia eius et natus error. dolor molestias assumenda. Dolor architecto aliquam illum nesciunt eligendi <a title=\"Autem voluptatem.\" href=\"https://www.marvin.info/ut-quo-nihil-deleniti-rerum\">sequi.</a> est et unde sapiente reiciendis. quasi dolores in aperiam iste in quia. Voluptatibus possimus <a title=\"Eos assumenda natus ut qui voluptas.\" href=\"http://www.terry.com/nihil-praesentium-sit-eius-eum-nihil-hic.html\">aut tempora</a> Aut est nostrum occaecati ut dicta saepe tempora. Alias accusantium iure. Eos sed quasi quasi. Repellat asperiores exercitationem sed. Provident praesentium recusandae rerum. Incidunt exercitationem quis sit. Sit qui autem ducimus architecto dolor ut sint. Velit quia eius assumenda ipsum. Soluta et accusamus porro quas.</p>\n<img class=\"alignleft\">\n<h3>Quibusdam eum vel culpa cumque repellat. Esse asperiores ratione inventore exercitationem quia expedita omnis cum. Nam excepturi quam doloremque laudantium</h3>\n<blockquote>Voluptas molestiae beatae numquam quisquam autem quia. Eveniet ut labore tenetur laboriosam et. Exercitationem aperiam aut laborum at facilis natus facere. Magnam consectetur ratione neque omnis. Non qui minus eaque vel nisi quo aut voluptate. Rerum aliquid illo nobis suscipit voluptatem ut id.</blockquote>\n<h1>Est odio repellat neque odit. Quis in aut quia accusantium. Hic et sit et quia esse quasi voluptatem</h1>\n<ol><li>Deserunt vel qui rerum ducimus</li><li>Suscipit omnis aut voluptate atque et qui eos</li><li>Ex soluta et earum at</li><li>Qui sint nemo quasi assumenda nemo</li><li>Quia reprehenderit dolor modi in</li><li>Quia</li><li>Et non aut est consectetur est</li><li>Molestiae</li></ol>\n<ul><li>Aut ea quod delectus iure</li><li>Ducimus omnis ut nihil</li><li>Rerum sapiente enim porro voluptatibus aut</li></ul>', 'Rerum quia et distinctio maiores id', 'Corporis voluptas aliquid odit possimus molestias similique voluptas eaque optio qui maiores expedita sint et voluptatem sequi explicabo laboriosam laudantium et harum sed corrupti excepturi aut quo temporibus debitis illum quae repudiandae aperiam repellendus ducimus voluptate quaerat quod consectetur animi corporis cum earum dolor facere quo omnis sequi consequatur iure voluptate deleniti consequuntur cum sit velit nobis hic modi voluptates reiciendis sunt deserunt est ab aut ut modi est pariatur nostrum et autem qui ut voluptas iusto et placeat consequuntur ad maxime non quidem id ab error molestiae qui ut voluptatem dolor quasi.\n\nMinima esse rerum animi consequatur numquam adipisci laborum nihil voluptatem repudiandae officiis odit quis rerum dolores quisquam fugit velit unde pariatur doloremque rerum adipisci dicta explicabo quam et earum pariatur recusandae repellendus inventore autem aliquid sequi amet optio architecto laborum a ut quibusdam id aut magni repudiandae alias placeat necessitatibus numquam dicta ipsa cupiditate possimus qui sint iure rerum earum repellat consequatur similique accusantium autem officia harum.\n\nEligendi quidem tempore repellat accusamus officia iusto aut totam delectus consectetur maxime nostrum asperiores excepturi optio exercitationem minus sequi suscipit alias ut hic qui aliquid facere quod nisi et et corrupti et esse asperiores molestiae ratione laborum voluptas ipsum vel fugiat aut ducimus aut sed provident atque ipsam doloremque eum tempora numquam eos molestias labore quae id consequatur distinctio in rerum excepturi perferendis culpa qui est in porro aliquam omnis repellendus repudiandae et totam deserunt omnis atque excepturi vero autem quo atque sint provident non consequuntur eligendi qui exercitationem alias.\n\nNihil dolores dolorum cum et est recusandae rerum et provident voluptas perferendis et iusto est repellendus perferendis reprehenderit libero aspernatur blanditiis eos ut nemo voluptatem voluptatibus minima veritatis explicabo alias laudantium at delectus occaecati iure ratione non asperiores facere ut in asperiores minus debitis esse saepe sed cumque totam ratione et rerum magnam quae placeat et quos dolor nobis ullam qui doloribus harum dolorem ad ab ab rem rerum recusandae et expedita eveniet possimus minima cumque harum cumque ducimus hic non eaque.', 'publish', 'open', 'closed', '', 'rerum-quia-et-distinctio-maiores-id', '', '', '2017-08-17 21:57:52', '2017-08-17 21:57:52', '', 0, 'http://localhost/udemy/2017/08/17/rerum-quia-et-distinctio-maiores-id/', 0, 'post', '', 0),
(21, 1, '2017-08-22 13:00:31', '2017-08-22 13:00:31', '', '', '', 'inherit', 'open', 'closed', '', '21', '', '', '2017-08-22 13:00:31', '2017-08-22 13:00:31', '', 20, 'http://localhost/udemy/wp-content/uploads/2017/08/c64aec34-59f1-393a-8132-2208fe5232e8.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(22, 1, '2017-08-02 23:50:49', '2017-08-02 23:50:49', '<h6>Expedita ipsa eum totam sit sapiente et. Et hic aut ullam. Nobis iste sed expedita dicta sequi natus</h6>\n<p>Totam a aliquam sapiente corrupti. qui ipsum tenetur aut. Sit quod voluptates minus. Repudiandae ut nemo nemo <a title=\"Vero aut voluptatibus.\" href=\"http://www.reinger.com/quis-sed-cumque-nulla-ipsam-dolor-et\">Id nesciunt recusandae sed qui qui</a> Expedita dolorem qui dignissimos blanditiis eveniet <a title=\"Inventore doloribus aut et non beatae delectus accusantium.\" href=\"http://cummings.com/id-est-aperiam-voluptatem-odio-quo-illum\">ducimus. Molestiae</a> error deleniti quibusdam. Nemo iste ex quia vero. amet quo et. Tempore qui excepturi ut. Consequatur omnis dignissimos sint officiis quos consequuntur. Tenetur aperiam delectus dolor. quis ex et qui voluptates. Sit voluptatem a commodi maiores illo optio. At necessitatibus aut vel optio tenetur. Voluptatem autem expedita culpa blanditiis. Eum voluptate quas qui repellendus officia <a title=\"Cupiditate tenetur in minus.\" href=\"https://www.kiehn.com/reiciendis-qui-quo-quidem-quia-veritatis-expedita-explicabo\">sint. Ex rerum quia ut non</a> magnam quam. Officia porro aut quidem neque iusto molestiae. quam consequatur pariatur Voluptates ratione vero excepturi laboriosam. Harum non accusamus facere autem <a title=\"In voluptas.\" href=\"http://stroman.com/quasi-et-sint-enim-ipsum-officia-architecto-et.html\">et. Rerum quis cupiditate vero illum</a> accusantium quod. Laborum voluptatum eligendi.</p>\n<ul><li>Omnis et non quo quo</li><li>Et sunt quo sed quasi</li><li>Ratione minima sint et</li><li>Et veritatis corrupti et aliquam est quia</li><li>Voluptas nostrum alias nihil</li></ul>\n<h2>Eos et ea nesciunt sint consequuntur eos libero. Non ullam nobis excepturi aut sit aut illo inventore. Sequi exercitationem qui dignissimos quia ullam sunt</h2>\n<p>Est possimus iure sint. Rerum dolor aut officia eveniet perferendis iste sit.</p>\n<h3>Quae repudiandae dolor suscipit qui illum hic qui. Doloremque sunt facere asperiores aut eaque. Excepturi reprehenderit et error perspiciatis omnis et id</h3>\n<blockquote>Voluptatem aliquid esse omnis quaerat quae veniam. dolor soluta sit. Quas quidem et tenetur rerum quos. Voluptas et nihil ut autem cumque consequatur. Tempora quia rerum quasi. Ipsa architecto alias quas. Consequuntur a soluta ipsa corrupti et qui. beatae enim laboriosam Occaecati beatae quo optio voluptates explicabo repudiandae Vel ipsum veniam porro eius <a title=\"Voluptatum saepe numquam qui praesentium dolor voluptate et et necessitatibus veritatis eos ullam.\" href=\"http://www.kreiger.com/minima-sunt-ratione-et-porro-voluptatem-non-dolorem\">tenetur at. Debitis voluptatem dignissimos quod veritatis. Aut</a> nostrum sint voluptas debitis. Eaque ex <a title=\"Aut quod voluptas ea.\" href=\"https://www.quigley.com/dolores-non-hic-repellendus-repudiandae-vel\">aliquid adipisci. Quam error sit adipisci</a> libero adipisci Et modi id. optio est Illo earum quia facere at possimus Labore est aliquam. Harum non consequuntur. Assumenda consequuntur perferendis facilis soluta culpa quidem.</blockquote>\n<p>At accusamus sed voluptatem expedita nobis. Repellendus aut sed quidem. Dolor et quae facilis id Aut exercitationem repellat <a title=\"Nostrum voluptatem.\" href=\"http://www.welch.com/\">qui</a> error soluta. Qui explicabo minus eos eum provident. quia eos doloribus. Est eos ad animi Veniam maiores explicabo pariatur cupiditate qui <a title=\"Id eius velit vero corrupti blanditiis molestias.\" href=\"http://murray.com/autem-sapiente-doloremque-et-culpa\">adipisci omnis. Eaque quia ipsum sint non odit</a> quibusdam.</p>', 'Quidem fugit labore exercitationem exercitationem', 'Eius nemo et ab facilis aut corporis maiores aperiam eveniet pariatur quia dolore qui dicta quasi commodi cupiditate voluptas voluptatem odit cupiditate quia quae quam dolores excepturi qui fuga provident est aliquam sed delectus deserunt ducimus aut et nam qui ipsa quaerat natus odit dolor modi omnis voluptatem est laudantium voluptatem nam voluptates culpa consequatur maxime ex et qui ut omnis et.\n\nCulpa aut qui earum et ad nemo quis labore sed aut molestias ipsum sed aut facilis iure aut cumque impedit est maxime qui doloribus molestiae quisquam commodi natus cum aut voluptas aut deserunt ut beatae iste quibusdam quia natus laudantium.', 'publish', 'open', 'open', '', 'quidem-fugit-labore-exercitationem-exercitationem', '', '', '2017-08-02 23:50:49', '2017-08-02 23:50:49', '', 0, 'http://localhost/udemy/2017/08/02/quidem-fugit-labore-exercitationem-exercitationem/', 0, 'post', '', 0),
(23, 1, '2017-08-22 13:00:38', '2017-08-22 13:00:38', '', '', '', 'inherit', 'open', 'closed', '', '23', '', '', '2018-03-17 18:41:23', '2018-03-17 18:41:23', '', 236, 'http://localhost/udemy/wp-content/uploads/2017/08/fe33a210-a67c-31ce-a928-1088e05563c7.jpg', 0, 'attachment', 'image/jpeg', 0),
(24, 1, '2017-08-22 13:00:44', '2017-08-22 13:00:44', '', '', '', 'inherit', 'open', 'closed', '', '24', '', '', '2017-08-22 13:00:44', '2017-08-22 13:00:44', '', 0, 'http://localhost/udemy/wp-content/uploads/2017/08/710ca81b-f6e6-3005-b4d1-0bb09e1e410e.jpg', 0, 'attachment', 'image/jpeg', 0),
(25, 5, '2017-08-17 15:20:43', '2017-08-17 15:20:43', '<ul><li>Earum vel</li><li>Inventore consectetur non veniam est et nemo</li></ul>\n<hr>\n<h6>Ipsa sed cum cum quisquam saepe est. Sed iure saepe totam dolor odio quos. Et consequatur nesciunt cumque deleniti. Adipisci autem ad quia id eos eum</h6>\n<!--more-->\n<img alt=\"Distinctio alias quaerat non tempore enim molestias repellat quod aut voluptatem\" src=\"http://localhost/udemy/wp-content/uploads/2017/08/fe33a210-a67c-31ce-a928-1088e05563c7.jpg\">\n<h3>Occaecati et cum non dolorum in est ut. Dolor enim odio perspiciatis natus quae minus. Accusamus ex illum eos quia</h3>\n<img class=\"aligncenter\" alt=\"Esse possimus facere impedit rem\">\n<p>Vitae fugiat voluptas dolores Rerum quisquam ut <a title=\"Earum quae.\" href=\"https://turcotte.com/voluptatum-velit-voluptatem-et-quaerat-ab-quia-debitis-aut.html\">consequatur nemo. In</a> dolorem debitis Nemo deleniti qui minus et quam rerum. Dignissimos quia rem quod quam cum aut Corrupti molestiae tenetur ab ipsam consequatur voluptatem molestiae. expedita ea autem deleniti. Rem voluptas quia <a title=\"Est minus dolores sapiente.\" href=\"http://www.oconnell.com/at-aut-reprehenderit-voluptas-consequatur\">voluptas sunt. Officia</a> nesciunt delectus aliquid sit. Itaque reprehenderit numquam quo tempora. iste dolores omnis magni nemo Explicabo eaque ut aut autem ut. Ut fuga occaecati dignissimos repudiandae. Consectetur saepe pariatur voluptates totam doloribus. necessitatibus quibusdam nostrum consequatur provident. <a title=\"Saepe cumque sed consequatur sunt odio.\" href=\"http://murray.com/adipisci-vero-eveniet-fugit-consequatur-modi-voluptate\">sunt quae illo reiciendis quia. Minima</a> aut optio. Laboriosam accusamus dignissimos doloribus Voluptatem doloremque aperiam et. Voluptatem mollitia eligendi itaque dolores sit dolore blanditiis. voluptatem eveniet ad dignissimos explicabo minima voluptatem. Officia ipsa deleniti error reiciendis consectetur ut. Optio non quo id molestiae. Vel quam aut ratione quas exercitationem. Dolore a occaecati ratione libero exercitationem. Reprehenderit eius nobis ex <a title=\"Sunt in.\" href=\"http://johnson.com/\">Omnis nemo sed velit dolor</a> et neque. Velit dignissimos natus ea Atque fugit et et qui. fuga nostrum est accusantium delectus totam. neque praesentium voluptatem quidem Est amet corrupti sint aperiam voluptates Veritatis consequatur nam dicta ut laborum Dolores nemo harum aspernatur aperiam quia At velit quod rerum laudantium laudantium <a title=\"Maxime.\" href=\"http://www.schimmel.biz/nihil-dolores-natus-enim-eligendi-molestiae\">eligendi. Porro neque</a> cum adipisci sequi. doloribus et quis molestias deleniti iste officiis.</p>\n<h2>Distinctio harum pariatur pariatur unde optio et</h2>\n<blockquote>Minus aliquid fuga nisi non. Perferendis aut dolores nam consequatur voluptates maxime. Eveniet iure et modi eos ex adipisci voluptas neque. Sed qui suscipit quis minima sed iusto excepturi. Est alias possimus non voluptatem quos. Qui non odio harum veniam architecto omnis et. Et dicta quae porro quis quis ea. Officia reprehenderit non ipsum ut. Nihil molestias illo optio et eveniet. Odio repudiandae possimus rerum sunt libero fuga repellendus sequi. Hic nihil minus molestiae exercitationem qui. Qui doloremque doloremque in esse. Eos molestias sunt nulla. Hic sed aspernatur provident nulla iure et. Eum non iusto perferendis ipsa reiciendis culpa dolore. Vel officia sed minus repellendus assumenda magni corrupti. Sapiente tempora exercitationem occaecati repudiandae expedita soluta. Placeat et unde dicta sint rerum. Nihil sunt excepturi molestias nihil placeat totam est. Voluptatum velit voluptatem soluta vel et rerum. Repudiandae in quidem earum nulla. Autem ducimus blanditiis dignissimos vel ipsum. Recusandae dolorem autem repudiandae rerum. Officia nihil et eius commodi cumque optio. Quod perspiciatis incidunt tempore mollitia accusamus qui unde. Ut quas rerum ab quaerat ipsam sit. Natus ex dolorem qui et aliquam in alias. Quibusdam qui eos et cumque doloribus aut. Voluptatem ab laboriosam consequatur quam rem adipisci ipsum. Velit voluptas ea illum cum qui aperiam. Veritatis deleniti et debitis aut. Ipsa vero quia atque aut quam cupiditate. Assumenda eos voluptas et quae corrupti. Commodi molestiae consequatur ad totam in sint minima. Ad amet et laboriosam at quidem explicabo. Ab vitae mollitia est officiis doloribus omnis. Impedit velit minus nostrum quaerat quo. Rem asperiores sit deserunt rerum est. Sapiente voluptas et earum repellendus aliquam officia. Quae ut quis sint harum voluptas. Est rerum repellendus doloribus error est et. Minus soluta ad et blanditiis ad aut quae. Quibusdam molestiae et veniam.</blockquote>\n<blockquote>Hic aut facilis qui in ratione repellendus. Velit in beatae praesentium qui quod ut consectetur. Nesciunt neque voluptates nostrum molestiae et minus. Omnis qui et omnis quidem et. Officiis et voluptatem et veritatis. Inventore rem inventore et laboriosam. Assumenda eos esse quis sed repellendus sed corporis. Excepturi magni beatae assumenda quo alias numquam. Adipisci quo officiis minima consequatur sequi. Ut quidem repellendus quibusdam dignissimos tenetur et. Ducimus laborum et aut harum id eius ut. Enim qui magni cupiditate magnam. Soluta quia recusandae et dolorum. Aspernatur eveniet ullam cumque eligendi aut impedit asperiores ut. Sint error nobis assumenda accusantium. Omnis maiores alias modi quia beatae soluta molestias. Iusto eligendi delectus atque nesciunt doloremque culpa. Suscipit et autem mollitia a voluptates officiis. Aut occaecati qui in incidunt itaque aut odio. Odit vel vitae sed modi voluptas quaerat odit. Consequuntur dolorem suscipit non cum. Occaecati quo molestiae dicta molestiae non quia. Ad minima reiciendis aut voluptatem ut voluptatem. Eveniet dolorem illum optio qui temporibus fugit incidunt est. Doloremque et ducimus sed aperiam aliquid vel in. Aut itaque eos inventore aspernatur velit quis aut. Quod dignissimos accusamus magnam vel doloremque. Quisquam aliquam consequatur cum numquam qui impedit reiciendis in. Consequatur soluta est nulla possimus omnis nobis. Similique commodi aliquid blanditiis est quo voluptas perferendis. Iusto suscipit quibusdam rem quia. Porro qui repellendus deleniti velit ullam magni eveniet. Ratione soluta sunt nemo ut. Maiores vel officiis neque non autem. Sit aut quaerat repellendus voluptatibus sit esse voluptas. Ex molestias error rem ipsam est dicta eveniet quisquam.</blockquote>\n<ul><li>Ut est porro voluptates nulla</li><li>Sunt id</li><li>Veniam ipsa minus vel earum</li></ul>\n<h6>Quas soluta veniam ab porro sit. Quos voluptate quia cupiditate aliquam earum ex</h6>\n<img class=\"alignright\" alt=\"Deserunt voluptatum inventore maiores ut in cum ipsa\" src=\"http://localhost/udemy/wp-content/uploads/2017/08/710ca81b-f6e6-3005-b4d1-0bb09e1e410e.jpg\">\n<img alt=\"Ratione odio sit eos vel voluptatum nostrum porro omnis magni\">\n<img class=\"alignright\" alt=\"Consequatur assumenda sequi est labore dicta perspiciatis\">\n<hr>', 'Officiis voluptas ut maxime facere ut', '', 'publish', 'open', 'closed', '', 'officiis-voluptas-ut-maxime-facere-ut', '', '', '2017-08-17 15:20:43', '2017-08-17 15:20:43', '', 0, 'http://localhost/udemy/2017/08/17/officiis-voluptas-ut-maxime-facere-ut/', 0, 'post', '', 0),
(26, 1, '2017-08-22 13:01:07', '2017-08-22 13:01:07', '', '', '', 'inherit', 'open', 'closed', '', '26', '', '', '2017-08-22 13:01:07', '2017-08-22 13:01:07', '', 0, 'http://localhost/udemy/wp-content/uploads/2017/08/616c506c-761e-31c7-bc55-1270aef0350b.jpg', 0, 'attachment', 'image/jpeg', 0),
(27, 1, '2017-08-22 13:01:12', '2017-08-22 13:01:12', '', '', '', 'inherit', 'open', 'closed', '', '27', '', '', '2017-08-22 13:01:12', '2017-08-22 13:01:12', '', 0, 'http://localhost/udemy/wp-content/uploads/2017/08/951cf8e4-5320-3ac1-8d12-be5163ca11f9.jpg', 0, 'attachment', 'image/jpeg', 0),
(29, 1, '2017-08-22 13:01:23', '2017-08-22 13:01:23', '', '', '', 'inherit', 'open', 'closed', '', '29', '', '', '2018-03-17 18:08:07', '2018-03-17 18:08:07', '', 236, 'http://localhost/udemy/wp-content/uploads/2017/08/ecba2446-35ba-3165-a635-714973189fe2.jpg', 0, 'attachment', 'image/jpeg', 0),
(30, 1, '2017-08-22 13:01:30', '2017-08-22 13:01:30', '', '', '', 'inherit', 'open', 'closed', '', '30', '', '', '2017-08-22 13:01:30', '2017-08-22 13:01:30', '', 0, 'http://localhost/udemy/wp-content/uploads/2017/08/027fbdd1-09d4-301a-8c8e-ffbe6e101ff0.jpg', 0, 'attachment', 'image/jpeg', 0),
(31, 1, '2017-08-16 05:40:45', '2017-08-16 05:40:45', '<h1>Qui omnis facere repellendus distinctio possimus qui ut architecto</h1>\n<blockquote>Esse voluptatem occaecati tenetur quaerat architecto reiciendis Nam minus officiis rerum odio. Libero dolorem libero asperiores et <a title=\"In autem qui vel et architecto.\" href=\"http://www.bechtelar.com/\">voluptatem. Expedita in id</a> aut. Earum ratione sed consequatur sunt enim. reiciendis incidunt quam repellat. Eos quasi et excepturi quisquam id. Perspiciatis odio aut vel perferendis voluptatem. Nostrum assumenda eum magni. Vel ipsam inventore officia qui Fugit qui repellendus eos. Suscipit molestiae atque similique debitis quae ullam et. Veritatis totam quod quo ratione architecto cupiditate. exercitationem fugit temporibus rerum recusandae quo. Sit nobis asperiores. Possimus qui nihil odio. Nesciunt possimus repudiandae quisquam voluptatem Itaque sed consequatur ut. Et nisi quaerat. Veniam laboriosam pariatur nobis <a title=\"Inventore atque provident delectus fuga necessitatibus recusandae.\" href=\"https://botsford.com/sed-omnis-aut-modi-consequuntur-facere-aut-neque-omnis.html\">voluptatem. Quo facilis labore</a> Rem voluptas quia Voluptatum voluptate sunt. Vel praesentium mollitia voluptatibus minus aliquam. officia saepe recusandae reiciendis unde. Cumque exercitationem id nesciunt dolor similique. Error rerum est itaque assumenda. Eveniet veritatis quaerat ipsum sint vel. reprehenderit quis delectus sit. <a title=\"Aut consectetur.\" href=\"http://www.keebler.biz/quo-velit-dignissimos-quam-ducimus-sit-quos.html\">sed</a> mollitia illum error ut. Cum dolorem nam quis magnam exercitationem. Recusandae dignissimos harum pariatur ullam fugiat exercitationem. Eligendi porro dignissimos ullam quos reiciendis. Numquam aspernatur mollitia <a title=\"Quos quod quo minima natus voluptas temporibus cumque consectetur aut.\" href=\"http://www.reilly.biz/ut-dicta-tempora-et-dolorem\">nihil velit labore.</a> beatae non excepturi atque. Natus error a. Itaque facilis quia voluptatem optio quos rerum Blanditiis quasi laboriosam est. Officiis ut totam laudantium facilis expedita sit omnis Iure sit necessitatibus tenetur dolorem Quidem pariatur est aliquid sequi repellat voluptas.</blockquote>\n<h3>In et et quis non quia sequi eaque. Minus soluta eius natus. In suscipit est repellendus voluptas</h3>\n<ul><li>Deserunt quis commodi qui</li><li>Rem illo rerum harum ipsum qui porro</li><li>Aut qui aliquam</li><li>Eius dolor adipisci magnam voluptatum</li><li>Et numquam repudiandae dolores</li></ul>\n<h3>Illum cum quibusdam expedita ut veritatis cumque voluptatem. Vitae ratione quia consequatur nihil dolore. Magnam voluptate sequi et rerum</h3>\n<!--more-->\n<blockquote>Officiis omnis assumenda assumenda est itaque Provident sunt harum. voluptatibus ut. Non voluptatem labore. Ratione ea libero velit sequi. Omnis ducimus saepe sit nam dolore et illum. Cum nesciunt animi temporibus molestiae voluptatem Error ipsam officiis ad. Nemo sit amet <a title=\"Odio eligendi.\" href=\"http://www.ondricka.com/\">ad aut ut. Quia</a> rerum libero officia dolorem Beatae <a title=\"Ullam.\" href=\"http://harber.com/\">laboriosam</a> Deleniti expedita odit totam dolor aut. Omnis quis autem necessitatibus voluptates illum Minus commodi in architecto ipsum temporibus. Dicta molestiae eligendi quos delectus explicabo. In temporibus assumenda Et ut modi. Ut esse nostrum nemo <a title=\"Optio dolorem sed praesentium rerum rem consequuntur.\" href=\"http://prohaska.com/qui-tempore-voluptas-est-rem-non-aut\">labore. Laudantium error</a> commodi cupiditate iste officia. porro exercitationem consequatur Dolor quia exercitationem quasi corporis facere nulla. et deserunt voluptatum. Reiciendis quae cupiditate aut nobis et. Velit dolor id asperiores mollitia temporibus. Quo in doloremque quia</blockquote>\n<ul><li>Explicabo et consequatur repellat consequatur</li><li>Quis aut error ipsa</li><li>Sed nostrum optio aut placeat</li><li>Vel aut velit fuga</li><li>Officiis omnis dolore voluptatum</li><li>Est enim animi molestiae aut eum aut</li><li>Ab numquam</li></ul>\n<img src=\"http://localhost/udemy/wp-content/uploads/2017/08/ecba2446-35ba-3165-a635-714973189fe2.jpg\">\n<h3>Sunt nesciunt voluptas ullam veniam. Veritatis minus quibusdam aperiam perferendis magni ullam. Fugiat at ut sed nemo est</h3>\n<img class=\"alignleft\" alt=\"Dolores culpa quibusdam itaque aut et pariatur ipsam necessitatibus\">\n<ul><li>Commodi qui itaque debitis vel ipsa</li><li>Qui consequuntur in rem provident</li></ul>\n<h4>Occaecati dolorum cupiditate cum amet expedita. Omnis quis ut velit in natus suscipit animi</h4>\n<ul><li>Vel ut ratione qui non</li><li>Nemo qui quisquam sunt et</li><li>Accusantium quia dolores esse autem</li><li>Tenetur ad pariatur quo et enim ipsum</li><li>Nobis aspernatur asperiores nulla dignissimos</li></ul>\n<h5>In sint laboriosam et qui doloribus itaque. Molestias soluta quae repellat totam adipisci</h5>\n<img class=\"alignleft\" alt=\"Quis quis eius accusantium molestiae autem at sapiente minus\" src=\"http://localhost/udemy/wp-content/uploads/2017/08/027fbdd1-09d4-301a-8c8e-ffbe6e101ff0.jpg\">\n<h4>At unde aut eius voluptas rerum distinctio dolores. Dolores numquam voluptatem eius perferendis sit. Velit numquam est ut</h4>\n<ol><li>Laudantium</li><li>Sequi aut rerum vel occaecati optio unde</li><li>Vel velit quos et unde</li><li>Quia autem ducimus aut</li></ol>\n<blockquote>Laborum non voluptatem et neque vel. Illum laborum voluptate iste tenetur. Officia voluptatum error. Quas qui eveniet. Soluta doloribus eligendi Ullam ad qui aut ea voluptatibus fugiat perferendis. Quasi voluptatum sapiente nihil Necessitatibus facilis delectus quis reprehenderit Dolores nihil qui aspernatur non quis. Tempore dolorem quod dignissimos illo voluptate exercitationem Error ut voluptates inventore non. Neque dignissimos qui commodi dolores eveniet. Voluptatem nostrum nobis quod et error sit. aut animi repellendus sequi. Itaque est explicabo qui dolore omnis dolorum. Qui et facere aliquid omnis. temporibus assumenda molestiae inventore qui. quasi dolores Odio est harum et aliquid sequi deleniti ipsum Iusto quia unde cum eveniet non. Labore quasi et maiores itaque. Cum dolorem quia et consequatur at. Quo ut aut a quam fugit sint. Odio id illo voluptas velit ut qui. consequuntur iste amet et repudiandae At quis itaque labore. Incidunt iste id voluptatem quae recusandae. Sequi et autem dolorem rem cum. Eveniet dolores totam laudantium velit ut. Laboriosam et sapiente dolor. Et dignissimos asperiores et. nemo repellat deserunt quae. Maxime facere ad quam repellendus laboriosam sequi. Quasi qui est unde. id molestiae veritatis temporibus architecto. odio nisi maxime ex. Consequatur quis minus eligendi natus dicta. Aut nihil <a title=\"Nisi aliquam voluptas quod.\" href=\"http://www.eichmann.org/quia-tenetur-accusamus-reprehenderit-dolor\">iste dolores aspernatur dignissimos.</a></blockquote>\n<h1>Exercitationem praesentium animi ea quod voluptatibus. Et possimus natus suscipit repellat consequatur. Ex harum praesentium laudantium sunt qui velit alias</h1>\n<p>Rerum et quod autem ut. Facere fugiat sunt et quis velit eveniet. Vitae officia minus nam qui quasi. Ipsa eum est accusamus et maxime ut error. Cumque eveniet inventore labore optio molestiae. Voluptates laborum impedit et. Sapiente recusandae dolorem veniam qui voluptatibus voluptatum iste. Voluptas quae aut quia qui dicta non. Reiciendis sunt voluptatem ipsa et natus repellendus alias. Atque aut omnis et dolores numquam dolor. Exercitationem sit unde aut quis earum esse quod. Tempore et pariatur molestiae corrupti occaecati cupiditate. Et et maxime officiis reiciendis rem nemo qui dolorem. Placeat nihil nisi quas odit quam nihil repudiandae. Perspiciatis mollitia qui aspernatur id. Dignissimos neque voluptas est illum accusamus id et odio. Tenetur reprehenderit nihil voluptatem iste sit. Porro sed vel aut quibusdam delectus consequuntur. Quia dignissimos nostrum ut unde corrupti dolores. Voluptate consequatur atque molestias expedita assumenda rem. Recusandae deserunt sint temporibus nobis laboriosam minus dolorum maiores. Odio qui porro incidunt itaque.</p>\n<h5>Rerum quo voluptatibus dolores aspernatur est iure labore. Sunt exercitationem molestiae sed. Voluptas ab minus dolorum adipisci sequi dolor repudiandae aperiam</h5>\n<ul><li>Quisquam optio minus ratione in deleniti</li><li>Laborum eum tenetur id</li><li>Quidem</li></ul>\n<ol><li>Sed quis ea consequatur rerum ullam</li><li>Rerum soluta sit delectus aut</li><li>Voluptas facere</li><li>Pariatur et optio beatae sint</li><li>Voluptatem quidem eligendi repudiandae repellendus</li><li>Labore et explicabo sint laboriosam</li><li>Quia sunt ut amet odit et</li></ol>', 'Sit sit enim facilis iste', 'Qui sapiente consequatur adipisci porro numquam ut voluptatum repudiandae quia delectus occaecati fugit dignissimos voluptates aperiam sequi ex natus nobis atque harum accusantium qui doloribus et unde laboriosam deserunt ullam enim doloremque et consequatur ratione et sequi perspiciatis consequuntur reprehenderit temporibus excepturi ut pariatur amet eos eum alias nobis molestiae rem corrupti possimus consequuntur consequatur non enim commodi sunt numquam omnis eum provident autem nisi.', 'publish', 'open', 'closed', '', 'sit-sit-enim-facilis-iste', '', '', '2017-08-16 05:40:45', '2017-08-16 05:40:45', '', 0, 'http://localhost/udemy/2017/08/16/sit-sit-enim-facilis-iste/', 0, 'post', '', 0),
(32, 1, '2017-08-22 13:01:32', '2017-08-22 13:01:32', '', '', '', 'inherit', 'open', 'closed', '', '32', '', '', '2017-08-22 13:01:32', '2017-08-22 13:01:32', '', 31, 'http://localhost/udemy/wp-content/uploads/2017/08/f220a7fe-fe94-36dd-b893-1778636c1b93.jpg', 0, 'attachment', 'image/jpeg', 0),
(33, 1, '2017-08-22 13:01:34', '2017-08-22 13:01:34', '', '', '', 'inherit', 'open', 'closed', '', '33', '', '', '2017-08-22 13:01:34', '2017-08-22 13:01:34', '', 0, 'http://localhost/udemy/wp-content/uploads/2017/08/a30af3e0-d1ac-390f-ac26-55ad8fe53a4a.jpg', 0, 'attachment', 'image/jpeg', 0),
(34, 3, '2017-08-17 10:50:06', '2017-08-17 10:50:06', '<h6>Ab facere quae eveniet consequatur molestiae voluptatem</h6>\n<ol><li>Velit dolorem dolorem quo vel voluptatum</li><li>Minus vitae ut aliquam ut ut</li></ol>\n<h4>Cum aut sed debitis sequi minima aliquam et molestias. Nam vel et odio molestiae</h4>\n<!--more-->\n<blockquote>Quia et ut fugit. Vero assumenda quos sunt eius facilis Pariatur aliquam expedita est aut magnam. Impedit magni cum ut. Itaque voluptates autem blanditiis dolorem. delectus quis saepe Doloremque eum ut et facere ad eveniet. dolores nulla consequatur vel non facere voluptas. <a title=\"Culpa eos a.\" href=\"http://nader.net/sapiente-perferendis-nihil-dignissimos-eaque-soluta-officia-necessitatibus.html\">assumenda dolor illum</a> non illum corrupti eos. incidunt ut beatae aut itaque. quia voluptas in mollitia corrupti. Rem nihil tenetur consequuntur. Alias labore excepturi laborum ab dolor aperiam ea. Numquam atque illum molestiae voluptatem. Itaque quia est eaque. Et ipsam possimus atque ut laborum labore. Aspernatur eius itaque dolores corrupti. A <a title=\"Placeat et hic culpa illo.\" href=\"http://effertz.com/\">rem esse</a> reiciendis. Nisi quasi tempora. Eos <a title=\"Sit ut voluptatem eos placeat.\" href=\"http://www.schmidt.biz/\">facilis</a> aut quidem ullam ut assumenda. Aliquam in dolorem Et distinctio quia quia ut debitis. Minima in molestiae aut. Asperiores facilis aut harum. Autem praesentium aut quos. Nemo alias <a title=\"Omnis unde velit harum rerum eligendi.\" href=\"http://auer.com/sed-ea-ullam-exercitationem-autem-perferendis-delectus-voluptatem.html\">facilis sunt distinctio temporibus vero libero. Ut aut</a> temporibus rerum qui. Aut voluptatem aut placeat repellat voluptatem laborum. Voluptatum odio magni aut cupiditate aut. Dolor magnam et repudiandae in est perspiciatis. Quo distinctio illum et neque. tempora ipsum omnis quia amet aspernatur. quam et illo dolores.</blockquote>\n<h5>Iure et voluptates ipsa accusantium repudiandae dicta dolorem</h5>\n<p>Unde et repudiandae fugit delectus non reiciendis fuga. Voluptatum fugiat dolorem incidunt est. Id nihil nesciunt consequatur harum expedita enim adipisci. Non quia molestias quaerat veniam in distinctio molestias dolorem. Dolores doloribus ad fugit fuga. Dignissimos quae accusamus ipsum maiores et hic eum vero. Ea et pariatur dolor sed quia. Quis dolores est pariatur laboriosam totam. Quod ab omnis earum et qui commodi. Quis et aut rem. Eius eveniet soluta rem exercitationem nesciunt aut. Sequi totam mollitia quas mollitia est qui qui. Nihil dolorem et dolores voluptates praesentium repellendus aut. Dignissimos suscipit iusto eligendi veniam.</p>\n<img class=\"alignright\" src=\"http://localhost/udemy/wp-content/uploads/2017/08/a30af3e0-d1ac-390f-ac26-55ad8fe53a4a.jpg\">\n<img class=\"alignleft\" alt=\"Quae id\">', 'Accusamus ipsa blanditiis nostrum eum aliquid quo', 'Sunt quaerat aut sint nemo alias quia sunt provident a quod veritatis nemo et sit dolorum ducimus enim maiores cumque sed et sed rem maiores ea quia totam sint nisi amet animi facilis blanditiis tempora quaerat voluptatem sequi.\n\nFuga vero incidunt culpa repellat voluptas harum quae ut perspiciatis ea esse sit sequi nobis laudantium iste ea debitis est assumenda qui neque molestiae nobis incidunt molestias et id ullam sequi temporibus dolores est et saepe quisquam exercitationem non autem odit ea doloremque placeat veritatis quisquam delectus ex deserunt atque mollitia soluta quam ipsum ut molestias quibusdam similique facere maiores est et sit repellat dignissimos aut sint voluptatem ullam voluptatem ratione et eos sunt quibusdam fugiat nemo deleniti consequatur cum.', 'publish', 'open', 'open', '', 'accusamus-ipsa-blanditiis-nostrum-eum-aliquid-quo', '', '', '2017-08-17 10:50:06', '2017-08-17 10:50:06', '', 0, 'http://localhost/udemy/2017/08/17/accusamus-ipsa-blanditiis-nostrum-eum-aliquid-quo/', 0, 'post', '', 0),
(35, 3, '2017-08-22 10:13:16', '2017-08-22 10:13:16', '<p>Ducimus voluptatem error quidem exercitationem. Tempore labore pariatur doloribus. Culpa corporis quam voluptatem necessitatibus libero. dignissimos sint odio iste nulla voluptatem. Officiis neque ex Reiciendis sunt eveniet non. asperiores dicta et non iure placeat. Aut aperiam omnis est. Harum qui eaque est Eius dolorem culpa odio odio Sit laboriosam eius Et rerum non maxime non. Placeat voluptatem adipisci aspernatur sequi. sed et molestias Dicta soluta quasi dolores suscipit eligendi quo. Quo porro nemo at animi. <a title=\"Sint est impedit aut similique molestias quibusdam voluptatibus beatae.\" href=\"http://www.grady.com/ad-ut-est-sint-aperiam\">nam</a> doloribus voluptatum et voluptatem. Nam sint voluptas expedita quidem. Asperiores eveniet aut assumenda. Repudiandae culpa quis rerum nihil. Molestiae illo facere. Quisquam aut iste nostrum. et voluptatem itaque. Pariatur ratione et quos optio culpa Dolores molestias vel ut vel qui est Ea aut dolorem laborum. Fugiat sequi eligendi deserunt cum. Ab at consectetur vel doloribus. occaecati voluptatem facere voluptatum maiores ad reiciendis. Debitis temporibus ut et perspiciatis doloribus. beatae expedita ipsa aut doloremque ut est.</p>\n<ul><li>Iste perferendis autem tempore quos</li><li>Quas dolores tempore reiciendis vel quos dolorum suscipit</li><li>Eligendi quod</li></ul>\n<h3>Sunt doloribus ex consequuntur et itaque. Ut corrupti voluptatem ut tempore eos. Porro ea alias fuga quod aliquam</h3>\n<p>Aperiam quia et ipsum <a title=\"Delectus consequatur aut assumenda.\" href=\"http://www.casper.org/rerum-quod-cumque-laudantium-ducimus\">laboriosam. Excepturi</a> <a title=\"Et aut dolore.\" href=\"http://turcotte.com/suscipit-laborum-voluptate-autem-esse-odio-porro.html\"><a title=\"Aut veritatis dolores iure odit aut.\" href=\"https://www.gusikowski.com/est-itaque-qui-eum-modi-ratione-harum\">qui</a></a> <a title=\"Doloribus nobis.\" href=\"http://adams.com/est-enim-architecto-suscipit-quia-dolore.html\">ut qui</a> <a title=\"Tempora praesentium tenetur.\" href=\"http://fay.com/\">sint. Illo officiis alias</a> <a title=\"Sapiente incidunt maiores dolore repellat.\" href=\"http://beier.biz/\">voluptatem. Assumenda officiis</a> dolores aut vitae in porro. Omnis nemo <a title=\"Quia enim pariatur doloremque ut.\" href=\"http://kassulke.com/\"><a title=\"Ea nulla corporis.\" href=\"http://ondricka.com/\">adipisci non aut tenetur laudantium. Est</a></a> in nobis aut. Optio qui quas dignissimos.</p>\n<h1>Qui veritatis rem tempora possimus enim</h1>\n<ul><li>Veritatis delectus</li><li>Quia quo nam nulla aut nihil</li><li>Nihil ad odio tempore qui</li><li>Sit eos qui sit officia</li><li>Ut excepturi molestiae sit sunt debitis</li></ul>\n<hr>\n<!--more-->\n<hr>\n<h5>Ducimus qui temporibus nihil reprehenderit sint ut. Ut atque eligendi voluptas quia</h5>\n<ul><li>Minus dolor non soluta iste</li><li>Et quae et a laborum</li><li>Id quidem et aut sit</li></ul>\n<hr>\n<h3>Ullam fuga nulla omnis veritatis. Quia id nam aliquid ipsam fugiat quia a. Est veritatis delectus blanditiis consequatur</h3>\n<blockquote>Ea eos et <a title=\"Fuga enim minus consequuntur.\" href=\"http://www.koch.com/\">velit quia doloribus reprehenderit eaque. Reprehenderit illum quasi</a> nostrum autem. Temporibus pariatur sed maxime. Voluptas accusamus molestias ducimus necessitatibus. Excepturi voluptatem sit dolorem. Fugit tenetur temporibus assumenda accusamus omnis. Eos atque eos itaque iste reprehenderit non <a title=\"Qui.\" href=\"http://baumbach.com/aut-reprehenderit-tempora-porro-et\">Aliquam</a> in vel sit dolorem. Et facere magni dolor. Molestias sapiente numquam fuga error. Cum corrupti aut blanditiis eligendi explicabo. distinctio est ad laborum perferendis esse. <a title=\"Est ut culpa minima atque.\" href=\"http://www.wisozk.com/nostrum-aspernatur-rerum-accusantium-beatae-nemo.html\">perspiciatis unde blanditiis</a> quisquam ab Quisquam dicta omnis ipsam deleniti vero. Beatae blanditiis necessitatibus voluptate vel inventore occaecati. Nihil omnis soluta iusto. Facilis exercitationem adipisci et iste amet dolorem. <a title=\"Nihil corrupti libero possimus dolorem reiciendis.\" href=\"https://www.west.info/similique-minus-fugiat-dolorum-beatae-magni\">deserunt deserunt libero eaque unde. Nihil et qui</a> consequatur. Non atque sapiente iste est autem eligendi. autem vero aut distinctio perspiciatis. Dolor veritatis id provident odio inventore. Sed et dolorem inventore. Incidunt consequatur rerum totam necessitatibus Eum aliquam a et.</blockquote>\n<img class=\"alignleft\" src=\"http://localhost/udemy/wp-content/uploads/2017/08/fa93663e-f959-36e1-a5f9-45788012d5e1.jpg\">\n<blockquote>Quod perferendis quae et. Voluptates eum adipisci architecto <a title=\"Illum hic.\" href=\"http://jaskolski.net/in-hic-aut-maxime-dolor-asperiores-molestiae-eos-debitis.html\">Amet nostrum</a> consequatur inventore accusantium cumque labore. corporis velit et repellat et. Quia eligendi rerum dicta consequatur officiis. voluptatum molestiae voluptatum ullam. Aut nihil harum quos. Et quas aperiam nulla accusantium. Aperiam quae et saepe accusantium non officia. voluptatem optio et consequatur Et est cum nihil est aut. Quod quisquam Temporibus itaque optio placeat labore id consequatur sint. dolores ex accusamus earum earum</blockquote>', 'Voluptatum provident dolores et', 'Et sit quia assumenda deleniti officiis molestiae ut voluptatibus dolores explicabo impedit nemo ut velit soluta inventore non excepturi magni incidunt natus in et molestiae distinctio reiciendis laborum placeat error soluta quis et quis cumque perferendis quod tempora ratione aspernatur distinctio quam qui delectus laudantium odit odit nostrum incidunt eius consequatur culpa assumenda veniam dolorum voluptatum consequuntur sit autem dolorum sunt quo molestiae voluptatem eos suscipit maxime fugit corporis id distinctio et facilis alias nostrum excepturi molestiae.\n\nFugit enim vel est a totam sit ducimus quam corrupti et ipsam dolore esse vel id quia sint dolorem et et rerum sed amet quo velit ut aspernatur quia minus ex quas ab aut aliquid reiciendis itaque tenetur sint vel ut vel dolores esse exercitationem facilis et est est omnis atque eum est ut dolorem laborum corrupti inventore voluptas ut voluptatem voluptas praesentium et porro doloremque assumenda velit mollitia tenetur doloremque optio debitis enim in corporis et dicta repudiandae ullam necessitatibus iste non ut tenetur error deleniti omnis et.\n\nQui a praesentium vel magnam sit facilis quae vel qui perspiciatis praesentium consectetur recusandae rerum qui provident officia accusantium ea ut voluptatum non ut voluptate quos necessitatibus asperiores molestiae totam et numquam fuga aut aspernatur repudiandae voluptatem omnis et architecto qui quasi nesciunt exercitationem nam dignissimos rerum maxime voluptatem error nemo rem maiores consequuntur voluptatibus nesciunt vitae qui alias qui accusantium laudantium id repellat pariatur repellat.', 'publish', 'open', 'open', '', 'voluptatum-provident-dolores-et', '', '', '2017-08-22 10:13:16', '2017-08-22 10:13:16', '', 0, 'http://localhost/udemy/2017/08/22/voluptatum-provident-dolores-et/', 0, 'post', '', 0),
(36, 1, '2017-08-22 13:01:47', '2017-08-22 13:01:47', '', '', '', 'inherit', 'open', 'closed', '', '36', '', '', '2017-08-22 13:01:47', '2017-08-22 13:01:47', '', 35, 'http://localhost/udemy/wp-content/uploads/2017/08/c0674a2e-871f-3884-9a2a-e40271ce6cd1.jpg', 0, 'attachment', 'image/jpeg', 0),
(37, 4, '2017-08-19 22:13:09', '2017-08-19 22:13:09', '<blockquote>Nihil ut odit vel fuga. Animi delectus omnis voluptas adipisci voluptas. Quisquam occaecati doloremque corporis. Officiis laboriosam excepturi quia excepturi. Enim unde sit qui perspiciatis rerum. aut alias odit voluptas tempore. Perferendis quo omnis eligendi nihil excepturi. Quis optio sit quidem Qui impedit deserunt qui Non cum eos accusantium et et <a title=\"Voluptas labore et facilis.\" href=\"http://www.murray.com/\">in. Eveniet molestias</a> id et. Enim temporibus est beatae eum rerum dolores. Ea accusantium et natus <a title=\"Eaque ut quidem nemo.\" href=\"https://www.bogan.org/illum-aut-vitae-vero-voluptatibus-rerum-corporis-qui\">vel quae. Dolorum delectus</a> et qui vitae blanditiis. Optio aut error vero molestias autem omnis. Dolor architecto quos soluta voluptas. vitae eos voluptatem voluptatibus et. Reiciendis ex maiores Rerum sequi eum harum quo sint culpa cumque. esse sint dicta vitae rerum laboriosam. Totam et dicta necessitatibus ea. Qui dolor quibusdam fugit expedita. consequatur optio perferendis. tempora incidunt voluptatem non reprehenderit.</blockquote>\r\n<h4>Aliquam reiciendis non atque ut. Fugiat aut nesciunt illum harum tempora. Ut voluptates officiis excepturi aliquid</h4>\r\n<!--more-->\r\n\r\n<a title=\"Distinctio et aliquid ipsam.\" href=\"http://www.nolan.org/\">Earum ipsa sint sed aut</a> doloribus. Iste mollitia qui sunt Porro ut vel aut accusamus rerum aperiam in. voluptatem veniam voluptatum id quidem. In est sunt sunt molestias provident eius\r\n<h6>Eum aut ab asperiores neque eaque qui numquam est. Illo sunt iste ut magnam eum. Ipsum quo et molestias ullam dicta omnis earum voluptas</h6>\r\nNumquam et incidunt aspernatur sequi hic. Vel autem et accusamus sunt architecto <a title=\"Perspiciatis maxime aut.\" href=\"http://beahan.com/qui-eveniet-minus-laboriosam-qui.html\">Quis voluptatem</a> maxime voluptatem molestias sunt Aut voluptatem excepturi iusto Voluptatum earum harum et. Et temporibus enim dolores eos harum. sunt consectetur ad. Sequi et officiis ullam quia aut soluta. quia aut dolores error ex. Ea voluptas commodi explicabo adipisci vitae nihil. Optio error ea. Exercitationem quo vitae aut ullam. Dolores iure minima dolore nostrum. quas iusto. Eos adipisci voluptate inventore et. id doloribus consequatur voluptates. Inventore distinctio sed ratione <a title=\"Qui neque quaerat facere aliquam maxime sed labore est.\" href=\"http://www.wiegand.com/\">Doloremque nisi dolorum nulla debitis ut cum</a> Dignissimos eveniet vel molestiae porro consequatur Aut et cum neque quis non. Molestias non iste distinctio libero A ea deleniti aut quasi dolor. Consequuntur voluptatem officia enim consequuntur possimus Illo pariatur enim eos nostrum dolorum. Fugiat similique', 'Reprehenderit et aut magni', 'Itaque officia sequi quo labore rem et non enim rerum consectetur eos mollitia repudiandae necessitatibus ut reprehenderit vitae blanditiis odit beatae est voluptatibus eos perspiciatis quia quia eaque ipsa a vel voluptatem dolores est adipisci rerum ut amet non commodi quia quasi saepe impedit voluptate quod placeat ea ex nesciunt aut aut.\r\n\r\nUt at explicabo eius aliquid quod suscipit sit vero quia et est ipsa adipisci magni sint ea eum voluptatem alias ut alias modi vel velit fuga doloribus non sint tempora beatae dolores porro error iure qui quis assumenda voluptatem non numquam iure dolores provident quos ea fugit dicta vel et omnis aut dolor tenetur aut ut ducimus qui id non ullam possimus suscipit esse unde deleniti sint perspiciatis ut labore fugiat debitis aut sed perferendis possimus sed cumque aspernatur sed.\r\n\r\nCorporis saepe ratione qui repudiandae reprehenderit qui eos quas qui ut in reprehenderit rerum iusto aut quo blanditiis id quod ut error similique autem sed in dignissimos assumenda ratione voluptates nam recusandae omnis velit exercitationem doloribus odit magnam molestiae aliquid laudantium nesciunt eveniet modi omnis.\r\n\r\nQuae et eius mollitia molestias velit libero numquam sapiente consequuntur esse officia sint quia eaque quo id eos quas velit doloremque distinctio sequi odit atque eum architecto facere ratione amet sit in et doloribus velit non voluptatem nemo qui ut quam voluptatem alias cumque et eum atque quisquam provident sit iure delectus.', 'publish', 'open', 'open', '', 'reprehenderit-et-aut-magni', '', '', '2017-08-23 18:55:29', '2017-08-23 18:55:29', '', 0, 'http://localhost/udemy/2017/08/19/reprehenderit-et-aut-magni/', 0, 'post', '', 0),
(38, 4, '2017-08-07 00:13:55', '2017-08-07 00:13:55', '<p>Provident et dolore asperiores nihil eveniet modi. Id facilis voluptas qui et. Ratione iste voluptas harum culpa quasi rerum. Quibusdam nemo inventore magnam distinctio modi accusantium inventore. Aliquam delectus saepe deserunt iste optio. Ipsa molestiae neque blanditiis adipisci. Et dolorem nemo nostrum at nobis. Voluptatem quibusdam quaerat qui corrupti quis repellat asperiores. Dignissimos reprehenderit ut nemo nihil velit ab. Adipisci quos quis aperiam voluptatem repellat voluptatibus. Voluptates aut quas dolorem sequi aut molestiae maiores. Mollitia sed enim et necessitatibus eligendi. Non sed dolorem veniam. Accusantium neque et cumque ea autem dicta. Consectetur cum exercitationem dolorum. Modi et et illum impedit aliquid blanditiis. Sapiente temporibus quibusdam ducimus atque consequatur. Dolores veniam eligendi quibusdam ut molestias molestiae est quia.</p>\n<h1>Dolor est quae enim dolor magni doloremque sit adipisci. Et qui natus molestiae quas ratione. Sunt omnis consequatur non et qui</h1>\n<p>Rerum pariatur non ut ratione vel. Ipsam non pariatur nulla voluptate iste animi necessitatibus fuga. Exercitationem libero perspiciatis assumenda consectetur laudantium doloremque. Id sed excepturi libero magnam suscipit cum. Et quo quia eligendi qui architecto quo. Sunt et est ullam enim eligendi fugit perspiciatis.</p>\n<h5>Unde sed rerum nam omnis animi ut minus. Quidem numquam rerum alias</h5>\n<p>Voluptas reiciendis sed rerum occaecati. Autem sit <a title=\"Quibusdam iste.\" href=\"http://www.ward.com/et-assumenda-repellat-explicabo-id-quas\">inventore</a> Doloribus voluptatem sunt in Enim occaecati quo quo optio et. Animi et quisquam Unde aut eum harum dicta <a title=\"Sint quia ut.\" href=\"http://bartoletti.com/architecto-et-porro-voluptatem-dignissimos-aliquid.html\">quia iusto.</a> <a title=\"Similique explicabo est tenetur.\" href=\"http://www.goldner.org/eligendi-odio-fugit-libero-iste-quaerat-incidunt-ut-sit\">aut ut et</a> cupiditate voluptates eveniet. Quibusdam eum quisquam voluptatem. sequi repellat consequatur qui ut. omnis minus</p>\n<img alt=\"Repellendus dignissimos dolorum et repellendus possimus\" src=\"http://localhost/udemy/wp-content/uploads/2017/08/fe33a210-a67c-31ce-a928-1088e05563c7.jpg\">\n<!--more-->\n<h4>At omnis voluptatem eum assumenda quia</h4>\n<ol><li>Eveniet</li><li>Ut est doloremque quos</li><li>Voluptatem ut aut quaerat vero nostrum</li></ol>\n<h1>Architecto cupiditate eos ullam sit ipsa voluptatem. Et ut accusamus labore est enim dolorem. Vitae nemo tenetur enim accusantium ad ad</h1>\n<p>Repellat numquam in occaecati atque non. Animi exercitationem nam temporibus et atque illum. Cumque fugiat at error neque non quia. Occaecati quis dolor corporis error. In fugiat assumenda enim et. Labore facere natus officiis reprehenderit animi. Commodi veritatis temporibus rerum fuga et. Et sed quas sapiente vero. Nihil et aspernatur eligendi. Debitis itaque vero nihil fuga pariatur totam fugit. Molestiae in vero dolor. Sequi enim et earum tempora quis deleniti neque. Eius eos quam rerum animi. Dicta cum est laudantium sed sed. Corporis quidem sint inventore ullam non. Amet ab et veritatis molestiae. Et repellat incidunt et aspernatur. Ad dolore ut et eum natus. Perferendis natus magnam unde veniam fuga vitae aliquam. Ipsa eveniet qui soluta eaque asperiores commodi quisquam. Ut voluptatem officia similique ab sint. Quidem sit doloremque accusamus minima. Laboriosam qui voluptatem dolor vitae perferendis in deserunt est. Possimus odit et excepturi distinctio. Qui fugit rerum id porro est inventore. Voluptate earum delectus hic itaque odit ut. Ullam eos occaecati dolorem neque qui quaerat voluptas. A quibusdam quo eius velit reiciendis cupiditate sit. Ut atque ratione voluptatem deleniti distinctio saepe ipsum voluptatem. Error hic illo commodi qui inventore sit. Sequi aut placeat temporibus quaerat. Amet fugiat voluptas sit ad sed sint. Voluptatem laboriosam totam repellat repudiandae dolores sunt ut. Tempore voluptatem cumque consectetur consequatur nostrum suscipit. Blanditiis facere provident quos laudantium omnis. Labore quis aliquid dolorem eum. Quidem et voluptates sequi molestiae consectetur. Omnis quod libero culpa fuga sit debitis qui. Est provident pariatur asperiores modi vero. Deleniti et voluptas deleniti iste molestiae. Quidem quia doloremque repellat asperiores possimus aut. Temporibus vitae illo officia sit. Quae autem aliquid saepe molestias. Suscipit est eveniet suscipit esse voluptatem voluptatem porro. Similique fuga quos est sequi maxime. Voluptatem totam ea adipisci sed repellat. Delectus alias ut quasi numquam reiciendis. Facere optio praesentium veritatis nemo voluptatem perspiciatis dolorum sed. Minus sed aspernatur aut corrupti excepturi et. Et est libero aut ut quam.</p>\n<h2>Quo cum atque necessitatibus sint rerum laboriosam veniam</h2>\n<blockquote>Deserunt voluptas maxime et sapiente quia. <a title=\"Voluptatum nesciunt dolore repudiandae quo nostrum.\" href=\"http://www.kuvalis.org/expedita-omnis-rerum-dolores\">voluptatem enim ducimus</a> Hic in voluptates <a title=\"Vero nesciunt id in.\" href=\"http://www.reilly.com/in-voluptatem-provident-dignissimos-ad-earum-necessitatibus-excepturi.html\">est eligendi. Aut dolores non qui.</a> ducimus nihil saepe Perferendis quam non <a title=\"Autem distinctio.\" href=\"http://prohaska.com/\">dolores dolorum ea. Voluptate</a> laborum recusandae at voluptatem eligendi officiis. Qui quasi libero maiores odit Eum expedita et qui libero et eaque quidem. tempore fugiat eligendi error <a title=\"Dignissimos dolor.\" href=\"http://www.west.com/qui-sed-et-cum\">tempore. Dolor voluptatem possimus quos dolores iste autem quis</a> <a title=\"Similique labore ea laborum.\" href=\"http://kautzer.com/nulla-dolores-vel-maiores-ut-error-libero-repellat\">Odit id aliquid iste quo. Cum</a> ex et recusandae Quo assumenda ut perspiciatis praesentium Sit et corporis quam ipsum.</blockquote>', 'Et maiores accusantium error animi', 'Eius harum et autem deleniti minima quidem ut velit omnis sequi aut assumenda asperiores enim ut qui ut aperiam vel tempora ipsa minima dignissimos aut repellendus ut debitis nisi consequatur corporis dolore corporis nostrum libero et.\n\nDicta facere et tempora tempora nihil a veniam asperiores facere iusto magni similique molestiae sit dignissimos neque molestiae sit nostrum vero est velit soluta eaque iusto doloribus dolorem nisi laudantium inventore quidem iusto non esse hic harum impedit quam officiis aut at provident.', 'publish', 'open', 'open', '', 'et-maiores-accusantium-error-animi', '', '', '2017-08-07 00:13:55', '2017-08-07 00:13:55', '', 0, 'http://localhost/udemy/2017/08/07/et-maiores-accusantium-error-animi/', 0, 'post', '', 0),
(39, 1, '2017-08-22 13:01:57', '2017-08-22 13:01:57', '', '', '', 'inherit', 'open', 'closed', '', '39', '', '', '2017-08-22 13:01:57', '2017-08-22 13:01:57', '', 38, 'http://localhost/udemy/wp-content/uploads/2017/08/ffa64996-1cf2-3833-a034-0e50abb8e150.jpg', 0, 'attachment', 'image/jpeg', 0),
(40, 1, '2017-08-22 13:01:58', '2017-08-22 13:01:58', '', '', '', 'inherit', 'open', 'closed', '', '40', '', '', '2017-08-22 13:01:58', '2017-08-22 13:01:58', '', 0, 'http://localhost/udemy/wp-content/uploads/2017/08/c8905bda-d959-31fc-8734-91ba8849f523.jpg', 0, 'attachment', 'image/jpeg', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(41, 2, '2017-08-08 16:24:18', '2017-08-08 16:24:18', '<h6>Libero non nihil eum eaque. Sed doloremque quae labore. Consequatur modi excepturi laborum nostrum</h6>\n<blockquote>Blanditiis libero voluptatum qui occaecati ea. <a title=\"Enim qui sint.\" href=\"http://huel.com/nam-vel-sit-tempore-nesciunt.html\">porro aut aut explicabo</a> dignissimos in enim. tempore ut dignissimos porro dolorem. Repellat in iure error Possimus optio deleniti libero voluptas et recusandae. Quia eveniet alias modi minus. Temporibus quisquam vitae est. facilis quidem doloribus ipsum in laudantium quia. Magnam nostrum eveniet reprehenderit aut et. Omnis maxime provident assumenda Et perspiciatis dignissimos delectus omnis sapiente et Quaerat quia labore molestias quia in. Ad magnam necessitatibus est Consectetur explicabo laudantium id ut. Et et quia iusto accusamus odio nemo quae. Nulla harum facilis non eligendi dolor. provident ipsa dolorem reiciendis ut nesciunt nemo. qui velit mollitia. Error pariatur quae id cumque nam. facilis quia itaque corrupti consectetur Expedita consequatur ullam reiciendis voluptatem atque consequatur. Modi omnis dignissimos <a title=\"Consequatur ut et.\" href=\"http://www.deckow.info/natus-expedita-totam-omnis-consectetur-quae\">Facere nisi dolores veniam ut neque iste molestiae</a> Expedita quo numquam. Blanditiis voluptate molestias reiciendis est. Nulla magni tenetur nemo adipisci culpa assumenda</blockquote>\n<ul><li>Commodi ex accusamus culpa</li><li>Ut doloribus maiores in</li><li>Fugit</li><li>Expedita omnis</li><li>Neque ut blanditiis</li><li>Laborum illo quisquam ut id omnis</li><li>Atque dolor nemo illo cum</li></ul>\n<h4>Molestias sit commodi vitae veritatis quae</h4>\n<ul><li>Velit consequatur sunt</li><li>Qui unde dolores aperiam non ducimus</li><li>Vel quod autem corrupti</li></ul>\n<!--more-->\n<blockquote>Harum a sint reprehenderit saepe ut voluptatem. Dolore facere consequuntur quia rem. Est non excepturi laboriosam ut labore natus autem qui. Assumenda magnam quia tempore numquam repudiandae. Reprehenderit iste dolor nihil labore. Qui sed ad quibusdam culpa sed aspernatur. Totam in nostrum iure vero. Et sequi vero atque dolor molestiae eveniet cupiditate. Deserunt doloribus dolor autem. Sed voluptatibus eos est magni quo consequuntur quam enim. Praesentium illo eum ullam et laudantium sint voluptas.</blockquote>\n<hr>\n<h1>Rerum sint rerum et assumenda ducimus aut distinctio. Sequi quia exercitationem odit. Laudantium est et aut sunt. Laudantium aut et omnis in culpa voluptas</h1>\n<img class=\"alignright\" alt=\"Culpa est\" src=\"http://localhost/udemy/wp-content/uploads/2017/08/c8905bda-d959-31fc-8734-91ba8849f523.jpg\">\n<h3>Aut culpa dolor omnis dolor autem. Accusamus vel eum ut enim ut. Rerum enim ad fugit doloribus quo ut est</h3>\n<img alt=\"Omnis sint ut nihil aperiam\" src=\"http://localhost/udemy/wp-content/uploads/2017/08/616c506c-761e-31c7-bc55-1270aef0350b.jpg\">\n<h1>Natus eum sed qui nulla aut error. Odio velit non et provident tempora</h1>\n<img class=\"alignright\" src=\"http://localhost/udemy/wp-content/uploads/2017/08/710ca81b-f6e6-3005-b4d1-0bb09e1e410e.jpg\">\n<h2>Qui excepturi distinctio et voluptas</h2>\n<ul><li>Placeat quia in ipsa rerum neque</li><li>Laboriosam mollitia tempora nisi consequatur et</li><li>Quo qui rerum nam illo voluptatem</li><li>Earum et suscipit eveniet qui nihil</li></ul>\n<p><a title=\"Sint iusto dolor voluptas.\" href=\"http://leannon.com/vel-maxime-magnam-voluptatum.html\">Rerum quia amet modi</a> <a title=\"Et illo vel quia nisi.\" href=\"http://marvin.org/\">molestiae expedita ea. Temporibus labore ut</a> vero minus. Sapiente mollitia dignissimos <a title=\"Dolore possimus.\" href=\"http://www.white.com/\"><a title=\"Aut quisquam aut suscipit dolor optio dolorem possimus enim error.\" href=\"http://www.predovic.com/est-maxime-non-eos-optio-delectus-est.html\">aut. Atque aut</a></a> <a title=\"Et nam corrupti natus id.\" href=\"http://www.konopelski.biz/nostrum-velit-commodi-excepturi-dolor-molestiae-non-quam.html\">nihil</a> reiciendis. Sunt a repudiandae aliquid alias.</p>', 'Natus magni deserunt beatae recusandae autem', 'Magnam ducimus sapiente perspiciatis quia est ut minima dolores ipsam rerum dicta beatae eos velit et est expedita laudantium vitae aspernatur animi illo ab ut nobis tenetur nihil soluta esse sed beatae officiis incidunt consequatur voluptatum quibusdam vitae numquam ullam minus assumenda omnis eum porro molestiae nisi soluta voluptatem autem doloribus et qui illum deserunt aut non excepturi quis voluptatibus ut quo accusantium et ipsum reprehenderit sit consequatur ex deserunt eaque sunt autem voluptatem velit numquam veritatis libero et voluptas perferendis et.\n\nCulpa deserunt quasi voluptas earum explicabo eos sunt aut ut velit mollitia nostrum totam sit omnis assumenda voluptatibus iste beatae adipisci culpa eaque commodi facere facilis ut deleniti incidunt cum deleniti amet dolores animi nam qui est quo quod voluptas ut adipisci et quia ut est.\n\nImpedit natus saepe quisquam est sit illo alias corporis omnis at quas et quia quis neque debitis explicabo itaque sapiente nemo deleniti et dolores beatae rerum incidunt aut qui quia sint voluptas omnis dolorem et ea laudantium mollitia nulla sint vel numquam impedit consequuntur rerum earum rerum sed temporibus totam sint nihil est et minima similique qui rem nulla officiis modi molestiae perferendis unde accusantium et pariatur inventore aut quam optio dolorum dolorem assumenda voluptas est quasi quis quas itaque qui magni eius minus sit reprehenderit nisi rerum odit esse unde assumenda sunt voluptas.\n\nInventore adipisci magnam iure ab excepturi in vero quod ut corporis in autem fugit dolore quisquam consequatur soluta et natus natus est consequatur culpa aut vitae aut omnis aut culpa distinctio animi ducimus beatae recusandae qui nobis unde magnam quas sit magnam minima iure vel ut cupiditate tempora et assumenda quos enim hic perferendis rerum in facere qui aspernatur error et cupiditate quae ullam voluptas est neque veritatis autem aliquam dolorem ut vero quis qui corrupti expedita est perferendis earum suscipit recusandae atque expedita quaerat occaecati sunt et nulla dolorem alias est incidunt sed sed qui aut vitae atque voluptates esse in voluptatem laborum.', 'publish', 'open', 'closed', '', 'natus-magni-deserunt-beatae-recusandae-autem', '', '', '2017-08-08 16:24:18', '2017-08-08 16:24:18', '', 0, 'http://localhost/udemy/2017/08/08/natus-magni-deserunt-beatae-recusandae-autem/', 0, 'post', '', 0),
(42, 1, '2017-08-22 13:02:08', '2017-08-22 13:02:08', '', '', '', 'inherit', 'open', 'closed', '', '42', '', '', '2017-08-22 13:02:08', '2017-08-22 13:02:08', '', 0, 'http://localhost/udemy/wp-content/uploads/2017/08/8bdb5f1c-cd6d-34ad-a270-616b0962b5ad.jpg', 0, 'attachment', 'image/jpeg', 0),
(43, 5, '2017-08-28 00:40:00', '2017-08-28 00:40:00', '[gallery ids=\"29,27,19,26,23,10,11\"]\r\nNon voluptatem enim id consectetur distinctio. Enim corporis impedit corporis earum magnam. Soluta nisi et eos qui. Est modi tempore est ut dicta.\r\n\r\n<img src=\"http://localhost/udemy/wp-content/uploads/2017/08/8bdb5f1c-cd6d-34ad-a270-616b0962b5ad.jpg\" />\r\n\r\nTotam ipsam quia explicabo ab et nisi. Consequatur et vero <a title=\"Neque tenetur est.\" href=\"http://dickinson.com/vel-possimus-quos-dolores\">quas</a> enim. Dignissimos <a title=\"Magni ut placeat quisquam harum.\" href=\"http://auer.com/hic-vel-molestias-eveniet-occaecati\">rerum culpa autem autem. Similique</a> rerum odit vero dolor quo. Numquam repellat et cumque eum. Ea nobis sequi tempora ipsa. molestias unde minus et quia sint. ea doloremque vel quo asperiores. Ipsum provident vitae <a title=\"Ducimus similique quas eveniet.\" href=\"http://brekke.com/\">laborum dolores rerum ipsum. Accusamus</a> eaque sit reprehenderit. Explicabo autem vitae dolores et Assumenda dicta excepturi voluptatem <a title=\"Consequuntur et omnis voluptas.\" href=\"http://www.muller.com/natus-velit-omnis-sed-animi-vitae\">Blanditiis autem officia</a> facilis. <a title=\"Nihil aliquid velit.\" href=\"http://www.watsica.com/eveniet-omnis-nobis-ipsam-itaque-et-et-iste\">non natus est error. Error</a> eligendi quod. cupiditate asperiores sint exercitationem eos. Nostrum aut quis labore ex dolor. Praesentium consequuntur nemo aspernatur id et. Laudantium est praesentium deserunt dolorum in laborum.\r\n<h2>Odit autem numquam id quis architecto. Deleniti ex iure odio sed impedit rem. Molestias vel molestias totam nemo dicta labore</h2>\r\n<blockquote><a title=\"Vel cumque sed.\" href=\"http://www.bailey.biz/consequatur-autem-mollitia-reprehenderit-amet-a-voluptatum.html\">Distinctio molestiae magnam eos nobis</a> Incidunt minima voluptatem quis omnis qui rerum. Blanditiis quis quo ea modi ipsum. qui maxime voluptatibus eos quos laboriosam. Nam officia ducimus asperiores. aut molestiae aut rerum Vitae itaque rerum beatae. Reiciendis explicabo maiores minus est. Debitis odio perferendis vero. perspiciatis est culpa nobis Vel omnis quidem officiis. Quis ut autem repellendus fugit consequuntur. Dolores officia dignissimos voluptate Enim dolores distinctio eaque accusamus qui inventore. Ea perspiciatis dignissimos labore ut alias. Consequatur nemo omnis repellat consequatur voluptas. inventore qui expedita. aliquid soluta atque dignissimos. rerum perspiciatis adipisci rerum soluta. Possimus quia repudiandae aut. esse id ullam enim sed sint. Maxime unde quae Odit eum voluptate cupiditate ea tenetur Accusantium voluptatem quas in pariatur. Non consequatur <a title=\"Laborum ut quisquam.\" href=\"https://www.hauck.com/molestiae-saepe-nihil-similique-ea-blanditiis-vitae-temporibus-earum\">ut</a> enim.</blockquote>\r\nOmnis quaerat a laudantium Voluptas asperiores dolores et velit voluptas Ut distinctio nam corrupti sint voluptatem quo. Consequuntur aut fugiat ullam. Voluptas laborum sunt est et sapiente et. officia pariatur voluptates quo incidunt. Laboriosam voluptas enim at voluptas Porro dolore cum officiis iusto. eum cupiditate nemo et ut sapiente quidem. autem et nulla et Explicabo enim sapiente repellat laborum voluptates. magni minus doloremque numquam saepe. Earum eaque necessitatibus veritatis magni est Quia maxime magni optio atque amet velit doloremque. Repellat quos maxime adipisci nobis ullam. voluptatem iusto autem laboriosam nisi alias. Reprehenderit reiciendis aut est Et iusto est commodi <a title=\"Ratione ea.\" href=\"http://www.spencer.com/\">et.</a> eum blanditiis dolorem Sed earum aliquam excepturi Iusto quam at ad et voluptates. Autem dolor in. laboriosam consequatur qui non a. Amet voluptas consequatur id commodi consequuntur beatae. Nihil et ab Omnis id aliquid Omnis rerum quae illo enim cupiditate. omnis sequi. Libero excepturi veritatis quia suscipit ut. Deserunt velit quo Atque veniam et repellat architecto. totam itaque fugiat quibusdam. Dignissimos numquam quos dolore. Nobis minima repudiandae ut at. Omnis qui illum illum. Nihil et ut. Qui dignissimos facilis sit consequatur. eligendi laborum architecto dolores. tempora in itaque cupiditate. Qui sint consequatur tenetur ipsum. Accusamus quia quam et consequuntur neque quisquam. Ipsum autem esse consequuntur dolor commodi rerum. animi voluptatum et blanditiis rerum voluptatem. Neque error est quia possimus voluptas. Est debitis voluptatibus fugiat. Quos dignissimos omnis explicabo vero aspernatur.\r\n<h6>Distinctio consequatur exercitationem et vel aut animi dolorem quam. Laboriosam pariatur deserunt harum</h6>\r\n<ol>\r\n 	<li>Rerum ratione placeat et</li>\r\n 	<li>Sit sapiente consequatur cum</li>\r\n 	<li>Est enim saepe libero vero</li>\r\n 	<li>Unde aut</li>\r\n 	<li>Dolore sed quos sit omnis quibusdam qui</li>\r\n</ol>\r\n<!--more-->\r\n<blockquote>Est quas accusantium exercitationem sed Beatae dicta sint rerum corporis magnam voluptatum. Quia error eius ut facere. Reiciendis voluptate non enim quia a. <a title=\"Qui porro ut aut dignissimos.\" href=\"http://hackett.com/sunt-nemo-dolorum-nobis-dolorum-unde-consequatur\">sunt</a> qui vel quos. Enim non sapiente impedit. Quas voluptates quam. vitae et maiores iure adipisci sed. Aut veritatis corrupti occaecati consequuntur. Iusto necessitatibus ullam aut officia. ipsam ullam enim aspernatur Earum natus corporis alias qui id nihil. Enim praesentium sit repudiandae a. nobis rerum repudiandae cumque at ullam possimus. Provident saepe soluta dolore Deserunt vero voluptatem fuga. Cupiditate neque minus harum molestiae beatae. Id ratione veritatis libero eligendi sed. Explicabo quasi eos adipisci. quidem consequuntur omnis quam eligendi non facilis. Dolorum pariatur aut quis laborum impedit atque. Qui hic id sapiente doloremque commodi quisquam. Aut voluptatem illum velit perferendis id Occaecati quam dolore vel vitae et voluptatum dolor. Earum ullam et quasi.</blockquote>\r\n\r\n<hr />\r\n\r\nTempora laudantium quo officia aperiam. Dolorem cum quas vitae. Debitis maxime animi minima reprehenderit eos consectetur. Eaque explicabo saepe pariatur nobis. Iure consequatur perferendis consequatur ducimus tempora excepturi. Accusantium corporis rerum excepturi aut alias. Dolores impedit alias facere ut eius. Impedit aut impedit atque. Non laudantium et illo quam molestiae enim vel. Sint cupiditate ullam ipsum et. Suscipit ullam nihil excepturi facere eveniet nobis. Ipsa libero placeat sunt autem. Assumenda doloribus id nam qui magnam. Nihil voluptate sit ullam. Rerum qui quo magni corrupti. Est porro est iure consequatur perferendis nihil dolorem. Vel facere qui aut suscipit. Enim et dolores doloremque quia. Eos iure aut inventore. Minus libero inventore laboriosam sequi qui. Animi facere officiis voluptates architecto magni odio. Perspiciatis autem corrupti sapiente aliquam reprehenderit delectus labore. Voluptatem suscipit quos aut voluptas odio atque harum. Aut iure quis quo est velit. Sunt recusandae ipsum quidem neque nihil in. Illo ut sint rem est. Quis et quam id voluptatibus labore. Sunt ea similique illum. Illum aut praesentium dolorem dolores aliquid quis ipsam necessitatibus.\r\n<h4>Eius aperiam odio exercitationem voluptate vel officia. Inventore doloribus deleniti totam qui ullam dolor. Dignissimos nulla ullam nesciunt et libero</h4>\r\n<ul>\r\n 	<li>Sint quis similique laboriosam</li>\r\n 	<li>Voluptates magni et deserunt voluptate enim</li>\r\n 	<li>Iste eius quo ipsa mollitia</li>\r\n 	<li>Non officia in magnam repellat</li>\r\n</ul>\r\n<h5>Excepturi qui tenetur praesentium sit quo. Quia ab magnam voluptatem harum quia dolores. Adipisci quaerat est quis quam qui similique</h5>\r\n<blockquote><a title=\"Et et quia officiis.\" href=\"http://www.herzog.com/non-voluptas-ut-expedita-illo-possimus\">Repellendus asperiores earum eligendi sed.</a> est qui eveniet inventore delectus Vel iste qui optio ratione Alias <a title=\"Earum libero.\" href=\"http://watsica.org/\">ut aspernatur quia</a> quia. Debitis placeat ipsa itaque natus alias. placeat rerum ad voluptatem. Reiciendis quas est dolores. Magni <a title=\"Repellendus eaque ad ipsum.\" href=\"http://www.wintheiser.com/\">rerum quaerat.</a> at dolor suscipit eos. Doloribus perferendis voluptas debitis ut. Exercitationem sit id voluptas Eos quis sit id temporibus. Debitis <a title=\"Quia ratione omnis cupiditate et.\" href=\"http://www.altenwerth.org/\">at nihil cum qui necessitatibus. Sequi voluptatem</a> cumque aut quos omnis omnis <a title=\"Quo tempora nam.\" href=\"https://www.blick.biz/sapiente-tenetur-vel-veniam-quos-dolorum\">Ipsam aut tenetur reiciendis</a></blockquote>\r\n<h4>Asperiores ut ut eligendi est totam quia</h4>\r\n<ol>\r\n 	<li>Est architecto quam ut</li>\r\n 	<li>Vel ut impedit placeat</li>\r\n 	<li>Minima ea nostrum optio</li>\r\n 	<li>Sint et nisi ut sed ipsa nemo</li>\r\n 	<li>Et veniam fugiat aut nesciunt maiores non</li>\r\n 	<li>Aut et nihil sit alias</li>\r\n 	<li>Vero labore id amet nesciunt</li>\r\n</ol>', 'Dolor veritatis veniam quos', '', 'publish', 'open', 'open', '', 'dolor-veritatis-veniam-quos', '', '', '2018-02-04 20:57:12', '2018-02-04 20:57:12', '', 0, 'http://localhost/udemy/?p=43', 0, 'post', '', 0),
(44, 1, '2017-12-15 03:56:33', '2017-12-15 03:56:33', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'V-Neck T-Shirt', 'This is a variable product.', 'publish', 'open', 'closed', '', 'v-neck-t-shirt', '', '', '2017-12-15 03:56:33', '2017-12-15 03:56:33', '', 0, 'https://woocommercecore.mystagingwebsite.com/?product=import-placeholder-for-woo-vneck-tee', 0, 'product', '', 0),
(45, 1, '2017-08-22 13:04:02', '2017-08-22 13:04:02', 'This is about us page.', 'About US', '', 'publish', 'closed', 'closed', '', 'about-us', '', '', '2018-03-23 19:29:47', '2018-03-23 19:29:47', '', 0, 'http://localhost/udemy/?page_id=45', 0, 'page', '', 0),
(46, 1, '2017-12-15 03:56:34', '2017-12-15 03:56:34', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Hoodie with Logo', 'This is a simple product.', 'publish', 'open', 'closed', '', 'hoodie-with-logo', '', '', '2017-12-15 03:56:34', '2017-12-15 03:56:34', '', 0, 'https://woocommercecore.mystagingwebsite.com/?product=import-placeholder-for-woo-hoodie-with-logo', 0, 'product', '', 0),
(47, 1, '2017-12-15 03:56:34', '2017-12-15 03:56:34', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'T-Shirt', 'This is a simple product.', 'publish', 'open', 'closed', '', 't-shirt', '', '', '2017-12-15 03:56:34', '2017-12-15 03:56:34', '', 0, 'https://woocommercecore.mystagingwebsite.com/?product=import-placeholder-for-woo-tshirt', 0, 'product', '', 0),
(48, 1, '2017-08-22 13:04:02', '2017-08-22 13:04:02', 'This is about us page.', 'About US', '', 'inherit', 'closed', 'closed', '', '45-revision-v1', '', '', '2017-08-22 13:04:02', '2017-08-22 13:04:02', '', 45, 'http://localhost/udemy/2017/08/22/45-revision-v1/', 0, 'revision', '', 0),
(49, 1, '2017-08-22 19:30:10', '2017-08-22 19:30:10', '', 'Home', '', 'publish', 'closed', 'closed', '', 'home', '', '', '2018-02-28 20:47:56', '2018-02-28 20:47:56', '', 0, 'http://localhost/udemy/?p=49', 1, 'nav_menu_item', '', 0),
(50, 1, '2017-08-22 19:30:10', '2017-08-22 19:30:10', ' ', '', '', 'publish', 'closed', 'closed', '', '50', '', '', '2018-02-28 20:47:56', '2018-02-28 20:47:56', '', 0, 'http://localhost/udemy/?p=50', 2, 'nav_menu_item', '', 0),
(51, 1, '2017-08-23 18:55:29', '2017-08-23 18:55:29', '<blockquote>Nihil ut odit vel fuga. Animi delectus omnis voluptas adipisci voluptas. Quisquam occaecati doloremque corporis. Officiis laboriosam excepturi quia excepturi. Enim unde sit qui perspiciatis rerum. aut alias odit voluptas tempore. Perferendis quo omnis eligendi nihil excepturi. Quis optio sit quidem Qui impedit deserunt qui Non cum eos accusantium et et <a title=\"Voluptas labore et facilis.\" href=\"http://www.murray.com/\">in. Eveniet molestias</a> id et. Enim temporibus est beatae eum rerum dolores. Ea accusantium et natus <a title=\"Eaque ut quidem nemo.\" href=\"https://www.bogan.org/illum-aut-vitae-vero-voluptatibus-rerum-corporis-qui\">vel quae. Dolorum delectus</a> et qui vitae blanditiis. Optio aut error vero molestias autem omnis. Dolor architecto quos soluta voluptas. vitae eos voluptatem voluptatibus et. Reiciendis ex maiores Rerum sequi eum harum quo sint culpa cumque. esse sint dicta vitae rerum laboriosam. Totam et dicta necessitatibus ea. Qui dolor quibusdam fugit expedita. consequatur optio perferendis. tempora incidunt voluptatem non reprehenderit.</blockquote>\r\n<h4>Aliquam reiciendis non atque ut. Fugiat aut nesciunt illum harum tempora. Ut voluptates officiis excepturi aliquid</h4>\r\n<!--more-->\r\n\r\n<a title=\"Distinctio et aliquid ipsam.\" href=\"http://www.nolan.org/\">Earum ipsa sint sed aut</a> doloribus. Iste mollitia qui sunt Porro ut vel aut accusamus rerum aperiam in. voluptatem veniam voluptatum id quidem. In est sunt sunt molestias provident eius\r\n<h6>Eum aut ab asperiores neque eaque qui numquam est. Illo sunt iste ut magnam eum. Ipsum quo et molestias ullam dicta omnis earum voluptas</h6>\r\nNumquam et incidunt aspernatur sequi hic. Vel autem et accusamus sunt architecto <a title=\"Perspiciatis maxime aut.\" href=\"http://beahan.com/qui-eveniet-minus-laboriosam-qui.html\">Quis voluptatem</a> maxime voluptatem molestias sunt Aut voluptatem excepturi iusto Voluptatum earum harum et. Et temporibus enim dolores eos harum. sunt consectetur ad. Sequi et officiis ullam quia aut soluta. quia aut dolores error ex. Ea voluptas commodi explicabo adipisci vitae nihil. Optio error ea. Exercitationem quo vitae aut ullam. Dolores iure minima dolore nostrum. quas iusto. Eos adipisci voluptate inventore et. id doloribus consequatur voluptates. Inventore distinctio sed ratione <a title=\"Qui neque quaerat facere aliquam maxime sed labore est.\" href=\"http://www.wiegand.com/\">Doloremque nisi dolorum nulla debitis ut cum</a> Dignissimos eveniet vel molestiae porro consequatur Aut et cum neque quis non. Molestias non iste distinctio libero A ea deleniti aut quasi dolor. Consequuntur voluptatem officia enim consequuntur possimus Illo pariatur enim eos nostrum dolorum. Fugiat similique', 'Reprehenderit et aut magni', 'Itaque officia sequi quo labore rem et non enim rerum consectetur eos mollitia repudiandae necessitatibus ut reprehenderit vitae blanditiis odit beatae est voluptatibus eos perspiciatis quia quia eaque ipsa a vel voluptatem dolores est adipisci rerum ut amet non commodi quia quasi saepe impedit voluptate quod placeat ea ex nesciunt aut aut.\r\n\r\nUt at explicabo eius aliquid quod suscipit sit vero quia et est ipsa adipisci magni sint ea eum voluptatem alias ut alias modi vel velit fuga doloribus non sint tempora beatae dolores porro error iure qui quis assumenda voluptatem non numquam iure dolores provident quos ea fugit dicta vel et omnis aut dolor tenetur aut ut ducimus qui id non ullam possimus suscipit esse unde deleniti sint perspiciatis ut labore fugiat debitis aut sed perferendis possimus sed cumque aspernatur sed.\r\n\r\nCorporis saepe ratione qui repudiandae reprehenderit qui eos quas qui ut in reprehenderit rerum iusto aut quo blanditiis id quod ut error similique autem sed in dignissimos assumenda ratione voluptates nam recusandae omnis velit exercitationem doloribus odit magnam molestiae aliquid laudantium nesciunt eveniet modi omnis.\r\n\r\nQuae et eius mollitia molestias velit libero numquam sapiente consequuntur esse officia sint quia eaque quo id eos quas velit doloremque distinctio sequi odit atque eum architecto facere ratione amet sit in et doloribus velit non voluptatem nemo qui ut quam voluptatem alias cumque et eum atque quisquam provident sit iure delectus.', 'inherit', 'closed', 'closed', '', '37-revision-v1', '', '', '2017-08-23 18:55:29', '2017-08-23 18:55:29', '', 37, 'http://localhost/udemy/2017/08/23/37-revision-v1/', 0, 'revision', '', 0),
(52, 1, '2017-08-23 18:56:09', '2017-08-23 18:56:09', 'Welcome to WordPress. This is your first post. Edit or delete it, then start writing!', 'Hello world!', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2017-08-23 18:56:09', '2017-08-23 18:56:09', '', 1, 'http://localhost/udemy/2017/08/23/1-revision-v1/', 0, 'revision', '', 0),
(53, 1, '2017-08-24 16:37:58', '2017-08-24 16:37:58', '<h6>Est quibusdam quo qui eum. Quaerat eius delectus ut. Deserunt unde ullam nobis occaecati voluptatem facilis ut dicta</h6>\r\nQuam maiores non sit ratione nemo nam. Neque vel dolorem consequatur quo qui. Corporis et sed culpa adipisci quam. unde dolores culpa explicabo. Ut ut <a title=\"Reiciendis sit dolor et fugiat est.\" href=\"http://www.lowe.com/temporibus-itaque-at-corrupti-et-voluptas\">consequuntur</a> praesentium Quisquam dolorem sit consectetur corrupti optio eum. est voluptas officiis sint quo.\r\n\r\nAd at assumenda mollitia quaerat. Nisi enim aut <a title=\"Ipsum odio.\" href=\"https://reichel.com/qui-optio-velit-ea-eos-corrupti-eveniet-repudiandae.html\">quos sed voluptatum. Tempore</a> <a title=\"Fugiat sit iure esse omnis.\" href=\"http://donnelly.net/commodi-corrupti-accusamus-soluta-dolor-facere\">deleniti accusantium sint quasi consequatur.</a> consequuntur quam delectus pariatur. Ullam non eum autem <a title=\"Earum libero velit aut.\" href=\"http://barton.com/fugiat-rerum-sunt-commodi-quam\">quo</a> Non quam et alias. Itaque pariatur quae ut nobis recusandae molestiae. Provident distinctio inventore minima amet ratione <a title=\"Vitae architecto architecto minus veritatis sint.\" href=\"http://leannon.biz/quia-et-et-officia-sunt\">Quis cumque maiores</a> totam <a title=\"Ipsa ipsam quo deleniti consequatur nisi quis.\" href=\"http://kihn.com/quasi-sunt-laborum-rerum-officia-recusandae-est.html\">Reiciendis omnis</a> quod numquam dolorem quae ea. est eligendi modi <a title=\"Magni tempora.\" href=\"http://doyle.com/voluptas-ducimus-non-quis-qui-quia-similique\">repudiandae quod. Dolorem iste non earum mollitia</a> animi. Rerum expedita dignissimos <a title=\"In eos consequatur non quia quia aut explicabo eum nemo.\" href=\"http://www.beahan.info/\">aut suscipit laudantium voluptas</a> Nesciunt eligendi voluptas voluptatem similique nulla distinctio. eligendi laboriosam et Eveniet <a title=\"Accusamus vero animi recusandae dolor voluptatum ad iste est delectus.\" href=\"http://www.rice.com/\">est rem odit</a> Ut ut perferendis aut voluptatibus nihil. <a title=\"Dolorem distinctio tenetur.\" href=\"http://batz.com/nulla-labore-impedit-porro-quos-perspiciatis-totam\">non</a> vero quidem. Nam quidem ipsam harum suscipit eos eum. asperiores mollitia adipisci excepturi ad. Enim officia Odio excepturi sit voluptatum non Ut aut quo placeat eligendi cupiditate et. Laborum delectus totam temporibus. Quis doloremque deserunt sapiente\r\n\r\n<!--more-->\r\n<!-- nextpage -->\r\n<blockquote>Officia iure quia ad sit Nostrum ea consequatur ut voluptate temporibus. Omnis esse magni ex optio voluptatum <a title=\"Aliquam exercitationem accusamus earum.\" href=\"https://www.walter.net/rerum-excepturi-rerum-ut-repellat-voluptatem-necessitatibus-corrupti-vero\">et. Minus sit</a> ex dolorum. Dolorem et excepturi amet Eum id sit amet eveniet autem. Qui ea possimus amet in <a title=\"Quia non et id exercitationem.\" href=\"http://pouros.net/velit-atque-corrupti-suscipit-ut.html\">Sequi</a> accusantium aut quia voluptates omnis quia. Aut laborum voluptatem esse quia <a title=\"Iste.\" href=\"http://conn.net/et-et-distinctio-dolore-quibusdam\">Maiores suscipit quia ut excepturi</a> repellat. Adipisci dolorum molestiae omnis quis in blanditiis ratione. est aut <a title=\"Ut fugit nisi.\" href=\"http://www.torp.org/neque-sint-aut-nulla-at\">soluta labore</a> Libero est autem aut voluptas. nam quod nisi minima maxime</blockquote>\r\n<ul>\r\n 	<li>Eius delectus odio aut sit</li>\r\n 	<li>Ad ducimus</li>\r\n 	<li>Voluptas esse</li>\r\n 	<li>Quam quos debitis unde dolorem</li>\r\n 	<li>Voluptatibus non a</li>\r\n 	<li>Qui magnam error non at</li>\r\n 	<li>Repellat soluta ut</li>\r\n</ul>\r\n<h6>Laborum et laborum sit suscipit dolorem vitae</h6>\r\nConsequatur est rerum perspiciatis aut asperiores. Tempora maiores maxime maiores praesentium accusamus dolores. Sit eos et voluptatem assumenda quasi qui. Et necessitatibus aspernatur voluptatem fugiat quia qui. Aut ut dolores optio sed aut sit quas. Repudiandae error quasi inventore et sit qui est aliquid. Sapiente id omnis culpa optio. Laboriosam velit doloremque ullam est sed. Rem fugiat voluptatum modi nemo. Eius veniam nulla delectus possimus iste ad dolorem. Voluptatum repellendus vitae molestiae aliquid. Voluptatem ullam quia beatae qui omnis. Molestiae sint earum sapiente perspiciatis. Vel molestias nihil et. Totam nemo laboriosam quia alias quia veniam. Qui consequuntur impedit perspiciatis neque. Id rerum similique nam aperiam deserunt soluta nam. Et necessitatibus deserunt modi perferendis cumque voluptas fuga. Accusamus sunt accusamus aperiam incidunt qui consequuntur. Voluptas nostrum repudiandae tempora rerum quo. Et repellat vel neque aut ea.\r\n\r\n<img class=\"alignleft\" />', 'Saepe minus molestiae aut qui qui', 'Explicabo ea hic illo facere molestiae eius illo labore voluptatem est nesciunt assumenda hic odit qui iste est earum enim ex soluta quibusdam dolorum enim aliquam autem saepe ut consequatur nulla magnam dolor.\r\n\r\nMinima tempora recusandae distinctio rem et omnis architecto quia doloremque culpa error ea excepturi non impedit modi dicta quaerat illo voluptatem impedit recusandae ducimus incidunt aut eveniet voluptatibus et enim et est impedit repellendus ipsam cupiditate exercitationem sed ut magnam veniam consequatur dolor odio sit voluptatem voluptatum consequatur ut est impedit et.\r\n\r\nNatus inventore quas aperiam sed qui quis aut voluptatum voluptas aut rerum libero est molestiae sint occaecati omnis ducimus distinctio nemo sequi natus voluptatum aperiam quis ut explicabo.\r\n\r\nOmnis quos eum reprehenderit molestiae aut dolore non amet voluptate provident eos nulla suscipit ratione nihil maiores vitae dolor vel consequatur assumenda voluptatem est voluptatem fugiat aliquid molestiae voluptates aut omnis voluptatem labore velit delectus omnis aut eaque aspernatur officiis incidunt nostrum qui labore et sint libero esse amet nulla totam libero est quas dolor modi qui et maiores rem.', 'inherit', 'closed', 'closed', '', '17-revision-v1', '', '', '2017-08-24 16:37:58', '2017-08-24 16:37:58', '', 17, 'http://localhost/udemy/2017/08/24/17-revision-v1/', 0, 'revision', '', 0),
(54, 1, '2017-08-24 16:43:23', '2017-08-24 16:43:23', '<h6>Est quibusdam quo qui eum. Quaerat eius delectus ut. Deserunt unde ullam nobis occaecati voluptatem facilis ut dicta</h6>\r\nQuam maiores non sit ratione nemo nam. Neque vel dolorem consequatur quo qui. Corporis et sed culpa adipisci quam. unde dolores culpa explicabo. Ut ut <a title=\"Reiciendis sit dolor et fugiat est.\" href=\"http://www.lowe.com/temporibus-itaque-at-corrupti-et-voluptas\">consequuntur</a> praesentium Quisquam dolorem sit consectetur corrupti optio eum. est voluptas officiis sint quo.\r\n\r\nAd at assumenda mollitia quaerat. Nisi enim aut <a title=\"Ipsum odio.\" href=\"https://reichel.com/qui-optio-velit-ea-eos-corrupti-eveniet-repudiandae.html\">quos sed voluptatum. Tempore</a> <a title=\"Fugiat sit iure esse omnis.\" href=\"http://donnelly.net/commodi-corrupti-accusamus-soluta-dolor-facere\">deleniti accusantium sint quasi consequatur.</a> consequuntur quam delectus pariatur. Ullam non eum autem <a title=\"Earum libero velit aut.\" href=\"http://barton.com/fugiat-rerum-sunt-commodi-quam\">quo</a> Non quam et alias. Itaque pariatur quae ut nobis recusandae molestiae. Provident distinctio inventore minima amet ratione <a title=\"Vitae architecto architecto minus veritatis sint.\" href=\"http://leannon.biz/quia-et-et-officia-sunt\">Quis cumque maiores</a> totam <a title=\"Ipsa ipsam quo deleniti consequatur nisi quis.\" href=\"http://kihn.com/quasi-sunt-laborum-rerum-officia-recusandae-est.html\">Reiciendis omnis</a> quod numquam dolorem quae ea. est eligendi modi <a title=\"Magni tempora.\" href=\"http://doyle.com/voluptas-ducimus-non-quis-qui-quia-similique\">repudiandae quod. Dolorem iste non earum mollitia</a> animi. Rerum expedita dignissimos <a title=\"In eos consequatur non quia quia aut explicabo eum nemo.\" href=\"http://www.beahan.info/\">aut suscipit laudantium voluptas</a> Nesciunt eligendi voluptas voluptatem similique nulla distinctio. eligendi laboriosam et Eveniet <a title=\"Accusamus vero animi recusandae dolor voluptatum ad iste est delectus.\" href=\"http://www.rice.com/\">est rem odit</a> Ut ut perferendis aut voluptatibus nihil. <a title=\"Dolorem distinctio tenetur.\" href=\"http://batz.com/nulla-labore-impedit-porro-quos-perspiciatis-totam\">non</a> vero quidem. Nam quidem ipsam harum suscipit eos eum. asperiores mollitia adipisci excepturi ad. Enim officia Odio excepturi sit voluptatum non Ut aut quo placeat eligendi cupiditate et. Laborum delectus totam temporibus. Quis doloremque deserunt sapiente\r\n\r\n<!--more-->\r\n<!--nextpage-->\r\n<blockquote>Officia iure quia ad sit Nostrum ea consequatur ut voluptate temporibus. Omnis esse magni ex optio voluptatum <a title=\"Aliquam exercitationem accusamus earum.\" href=\"https://www.walter.net/rerum-excepturi-rerum-ut-repellat-voluptatem-necessitatibus-corrupti-vero\">et. Minus sit</a> ex dolorum. Dolorem et excepturi amet Eum id sit amet eveniet autem. Qui ea possimus amet in <a title=\"Quia non et id exercitationem.\" href=\"http://pouros.net/velit-atque-corrupti-suscipit-ut.html\">Sequi</a> accusantium aut quia voluptates omnis quia. Aut laborum voluptatem esse quia <a title=\"Iste.\" href=\"http://conn.net/et-et-distinctio-dolore-quibusdam\">Maiores suscipit quia ut excepturi</a> repellat. Adipisci dolorum molestiae omnis quis in blanditiis ratione. est aut <a title=\"Ut fugit nisi.\" href=\"http://www.torp.org/neque-sint-aut-nulla-at\">soluta labore</a> Libero est autem aut voluptas. nam quod nisi minima maxime</blockquote>\r\n<ul>\r\n 	<li>Eius delectus odio aut sit</li>\r\n 	<li>Ad ducimus</li>\r\n 	<li>Voluptas esse</li>\r\n 	<li>Quam quos debitis unde dolorem</li>\r\n 	<li>Voluptatibus non a</li>\r\n 	<li>Qui magnam error non at</li>\r\n 	<li>Repellat soluta ut</li>\r\n</ul>\r\n<h6>Laborum et laborum sit suscipit dolorem vitae</h6>\r\nConsequatur est rerum perspiciatis aut asperiores. Tempora maiores maxime maiores praesentium accusamus dolores. Sit eos et voluptatem assumenda quasi qui. Et necessitatibus aspernatur voluptatem fugiat quia qui. Aut ut dolores optio sed aut sit quas. Repudiandae error quasi inventore et sit qui est aliquid. Sapiente id omnis culpa optio. Laboriosam velit doloremque ullam est sed. Rem fugiat voluptatum modi nemo. Eius veniam nulla delectus possimus iste ad dolorem. Voluptatum repellendus vitae molestiae aliquid. Voluptatem ullam quia beatae qui omnis. Molestiae sint earum sapiente perspiciatis. Vel molestias nihil et. Totam nemo laboriosam quia alias quia veniam. Qui consequuntur impedit perspiciatis neque. Id rerum similique nam aperiam deserunt soluta nam. Et necessitatibus deserunt modi perferendis cumque voluptas fuga. Accusamus sunt accusamus aperiam incidunt qui consequuntur. Voluptas nostrum repudiandae tempora rerum quo. Et repellat vel neque aut ea.\r\n\r\n<img class=\"alignleft\" />', 'Saepe minus molestiae aut qui qui', 'Explicabo ea hic illo facere molestiae eius illo labore voluptatem est nesciunt assumenda hic odit qui iste est earum enim ex soluta quibusdam dolorum enim aliquam autem saepe ut consequatur nulla magnam dolor.\r\n\r\nMinima tempora recusandae distinctio rem et omnis architecto quia doloremque culpa error ea excepturi non impedit modi dicta quaerat illo voluptatem impedit recusandae ducimus incidunt aut eveniet voluptatibus et enim et est impedit repellendus ipsam cupiditate exercitationem sed ut magnam veniam consequatur dolor odio sit voluptatem voluptatum consequatur ut est impedit et.\r\n\r\nNatus inventore quas aperiam sed qui quis aut voluptatum voluptas aut rerum libero est molestiae sint occaecati omnis ducimus distinctio nemo sequi natus voluptatum aperiam quis ut explicabo.\r\n\r\nOmnis quos eum reprehenderit molestiae aut dolore non amet voluptate provident eos nulla suscipit ratione nihil maiores vitae dolor vel consequatur assumenda voluptatem est voluptatem fugiat aliquid molestiae voluptates aut omnis voluptatem labore velit delectus omnis aut eaque aspernatur officiis incidunt nostrum qui labore et sint libero esse amet nulla totam libero est quas dolor modi qui et maiores rem.', 'inherit', 'closed', 'closed', '', '17-revision-v1', '', '', '2017-08-24 16:43:23', '2017-08-24 16:43:23', '', 17, 'http://localhost/udemy/2017/08/24/17-revision-v1/', 0, 'revision', '', 0),
(58, 1, '2017-08-30 08:50:16', '2017-08-30 08:50:16', 'This is about us page.', 'About US', '', 'inherit', 'closed', 'closed', '', '45-revision-v1', '', '', '2017-08-30 08:50:16', '2017-08-30 08:50:16', '', 45, 'http://localhost/udemy/2017/08/30/45-revision-v1/', 0, 'revision', '', 0),
(59, 1, '2017-08-30 11:03:55', '2017-08-30 11:03:55', 'Non voluptatem enim id consectetur distinctio. Enim corporis impedit corporis earum magnam. Soluta nisi et eos qui. Est modi tempore est ut dicta.\r\n\r\n<img src=\"http://localhost/udemy/wp-content/uploads/2017/08/8bdb5f1c-cd6d-34ad-a270-616b0962b5ad.jpg\" />\r\n\r\nTotam ipsam quia explicabo ab et nisi. Consequatur et vero <a title=\"Neque tenetur est.\" href=\"http://dickinson.com/vel-possimus-quos-dolores\">quas</a> enim. Dignissimos <a title=\"Magni ut placeat quisquam harum.\" href=\"http://auer.com/hic-vel-molestias-eveniet-occaecati\">rerum culpa autem autem. Similique</a> rerum odit vero dolor quo. Numquam repellat et cumque eum. Ea nobis sequi tempora ipsa. molestias unde minus et quia sint. ea doloremque vel quo asperiores. Ipsum provident vitae <a title=\"Ducimus similique quas eveniet.\" href=\"http://brekke.com/\">laborum dolores rerum ipsum. Accusamus</a> eaque sit reprehenderit. Explicabo autem vitae dolores et Assumenda dicta excepturi voluptatem <a title=\"Consequuntur et omnis voluptas.\" href=\"http://www.muller.com/natus-velit-omnis-sed-animi-vitae\">Blanditiis autem officia</a> facilis. <a title=\"Nihil aliquid velit.\" href=\"http://www.watsica.com/eveniet-omnis-nobis-ipsam-itaque-et-et-iste\">non natus est error. Error</a> eligendi quod. cupiditate asperiores sint exercitationem eos. Nostrum aut quis labore ex dolor. Praesentium consequuntur nemo aspernatur id et. Laudantium est praesentium deserunt dolorum in laborum.\r\n<h2>Odit autem numquam id quis architecto. Deleniti ex iure odio sed impedit rem. Molestias vel molestias totam nemo dicta labore</h2>\r\n<blockquote><a title=\"Vel cumque sed.\" href=\"http://www.bailey.biz/consequatur-autem-mollitia-reprehenderit-amet-a-voluptatum.html\">Distinctio molestiae magnam eos nobis</a> Incidunt minima voluptatem quis omnis qui rerum. Blanditiis quis quo ea modi ipsum. qui maxime voluptatibus eos quos laboriosam. Nam officia ducimus asperiores. aut molestiae aut rerum Vitae itaque rerum beatae. Reiciendis explicabo maiores minus est. Debitis odio perferendis vero. perspiciatis est culpa nobis Vel omnis quidem officiis. Quis ut autem repellendus fugit consequuntur. Dolores officia dignissimos voluptate Enim dolores distinctio eaque accusamus qui inventore. Ea perspiciatis dignissimos labore ut alias. Consequatur nemo omnis repellat consequatur voluptas. inventore qui expedita. aliquid soluta atque dignissimos. rerum perspiciatis adipisci rerum soluta. Possimus quia repudiandae aut. esse id ullam enim sed sint. Maxime unde quae Odit eum voluptate cupiditate ea tenetur Accusantium voluptatem quas in pariatur. Non consequatur <a title=\"Laborum ut quisquam.\" href=\"https://www.hauck.com/molestiae-saepe-nihil-similique-ea-blanditiis-vitae-temporibus-earum\">ut</a> enim.</blockquote>\r\nOmnis quaerat a laudantium Voluptas asperiores dolores et velit voluptas Ut distinctio nam corrupti sint voluptatem quo. Consequuntur aut fugiat ullam. Voluptas laborum sunt est et sapiente et. officia pariatur voluptates quo incidunt. Laboriosam voluptas enim at voluptas Porro dolore cum officiis iusto. eum cupiditate nemo et ut sapiente quidem. autem et nulla et Explicabo enim sapiente repellat laborum voluptates. magni minus doloremque numquam saepe. Earum eaque necessitatibus veritatis magni est Quia maxime magni optio atque amet velit doloremque. Repellat quos maxime adipisci nobis ullam. voluptatem iusto autem laboriosam nisi alias. Reprehenderit reiciendis aut est Et iusto est commodi <a title=\"Ratione ea.\" href=\"http://www.spencer.com/\">et.</a> eum blanditiis dolorem Sed earum aliquam excepturi Iusto quam at ad et voluptates. Autem dolor in. laboriosam consequatur qui non a. Amet voluptas consequatur id commodi consequuntur beatae. Nihil et ab Omnis id aliquid Omnis rerum quae illo enim cupiditate. omnis sequi. Libero excepturi veritatis quia suscipit ut. Deserunt velit quo Atque veniam et repellat architecto. totam itaque fugiat quibusdam. Dignissimos numquam quos dolore. Nobis minima repudiandae ut at. Omnis qui illum illum. Nihil et ut. Qui dignissimos facilis sit consequatur. eligendi laborum architecto dolores. tempora in itaque cupiditate. Qui sint consequatur tenetur ipsum. Accusamus quia quam et consequuntur neque quisquam. Ipsum autem esse consequuntur dolor commodi rerum. animi voluptatum et blanditiis rerum voluptatem. Neque error est quia possimus voluptas. Est debitis voluptatibus fugiat. Quos dignissimos omnis explicabo vero aspernatur.\r\n<h6>Distinctio consequatur exercitationem et vel aut animi dolorem quam. Laboriosam pariatur deserunt harum</h6>\r\n<ol>\r\n 	<li>Rerum ratione placeat et</li>\r\n 	<li>Sit sapiente consequatur cum</li>\r\n 	<li>Est enim saepe libero vero</li>\r\n 	<li>Unde aut</li>\r\n 	<li>Dolore sed quos sit omnis quibusdam qui</li>\r\n</ol>\r\n<!--more-->\r\n<blockquote>Est quas accusantium exercitationem sed Beatae dicta sint rerum corporis magnam voluptatum. Quia error eius ut facere. Reiciendis voluptate non enim quia a. <a title=\"Qui porro ut aut dignissimos.\" href=\"http://hackett.com/sunt-nemo-dolorum-nobis-dolorum-unde-consequatur\">sunt</a> qui vel quos. Enim non sapiente impedit. Quas voluptates quam. vitae et maiores iure adipisci sed. Aut veritatis corrupti occaecati consequuntur. Iusto necessitatibus ullam aut officia. ipsam ullam enim aspernatur Earum natus corporis alias qui id nihil. Enim praesentium sit repudiandae a. nobis rerum repudiandae cumque at ullam possimus. Provident saepe soluta dolore Deserunt vero voluptatem fuga. Cupiditate neque minus harum molestiae beatae. Id ratione veritatis libero eligendi sed. Explicabo quasi eos adipisci. quidem consequuntur omnis quam eligendi non facilis. Dolorum pariatur aut quis laborum impedit atque. Qui hic id sapiente doloremque commodi quisquam. Aut voluptatem illum velit perferendis id Occaecati quam dolore vel vitae et voluptatum dolor. Earum ullam et quasi.</blockquote>\r\n\r\n<hr />\r\n\r\nTempora laudantium quo officia aperiam. Dolorem cum quas vitae. Debitis maxime animi minima reprehenderit eos consectetur. Eaque explicabo saepe pariatur nobis. Iure consequatur perferendis consequatur ducimus tempora excepturi. Accusantium corporis rerum excepturi aut alias. Dolores impedit alias facere ut eius. Impedit aut impedit atque. Non laudantium et illo quam molestiae enim vel. Sint cupiditate ullam ipsum et. Suscipit ullam nihil excepturi facere eveniet nobis. Ipsa libero placeat sunt autem. Assumenda doloribus id nam qui magnam. Nihil voluptate sit ullam. Rerum qui quo magni corrupti. Est porro est iure consequatur perferendis nihil dolorem. Vel facere qui aut suscipit. Enim et dolores doloremque quia. Eos iure aut inventore. Minus libero inventore laboriosam sequi qui. Animi facere officiis voluptates architecto magni odio. Perspiciatis autem corrupti sapiente aliquam reprehenderit delectus labore. Voluptatem suscipit quos aut voluptas odio atque harum. Aut iure quis quo est velit. Sunt recusandae ipsum quidem neque nihil in. Illo ut sint rem est. Quis et quam id voluptatibus labore. Sunt ea similique illum. Illum aut praesentium dolorem dolores aliquid quis ipsam necessitatibus.\r\n<h4>Eius aperiam odio exercitationem voluptate vel officia. Inventore doloribus deleniti totam qui ullam dolor. Dignissimos nulla ullam nesciunt et libero</h4>\r\n<ul>\r\n 	<li>Sint quis similique laboriosam</li>\r\n 	<li>Voluptates magni et deserunt voluptate enim</li>\r\n 	<li>Iste eius quo ipsa mollitia</li>\r\n 	<li>Non officia in magnam repellat</li>\r\n</ul>\r\n<h5>Excepturi qui tenetur praesentium sit quo. Quia ab magnam voluptatem harum quia dolores. Adipisci quaerat est quis quam qui similique</h5>\r\n<blockquote><a title=\"Et et quia officiis.\" href=\"http://www.herzog.com/non-voluptas-ut-expedita-illo-possimus\">Repellendus asperiores earum eligendi sed.</a> est qui eveniet inventore delectus Vel iste qui optio ratione Alias <a title=\"Earum libero.\" href=\"http://watsica.org/\">ut aspernatur quia</a> quia. Debitis placeat ipsa itaque natus alias. placeat rerum ad voluptatem. Reiciendis quas est dolores. Magni <a title=\"Repellendus eaque ad ipsum.\" href=\"http://www.wintheiser.com/\">rerum quaerat.</a> at dolor suscipit eos. Doloribus perferendis voluptas debitis ut. Exercitationem sit id voluptas Eos quis sit id temporibus. Debitis <a title=\"Quia ratione omnis cupiditate et.\" href=\"http://www.altenwerth.org/\">at nihil cum qui necessitatibus. Sequi voluptatem</a> cumque aut quos omnis omnis <a title=\"Quo tempora nam.\" href=\"https://www.blick.biz/sapiente-tenetur-vel-veniam-quos-dolorum\">Ipsam aut tenetur reiciendis</a></blockquote>\r\n<h4>Asperiores ut ut eligendi est totam quia</h4>\r\n<ol>\r\n 	<li>Est architecto quam ut</li>\r\n 	<li>Vel ut impedit placeat</li>\r\n 	<li>Minima ea nostrum optio</li>\r\n 	<li>Sint et nisi ut sed ipsa nemo</li>\r\n 	<li>Et veniam fugiat aut nesciunt maiores non</li>\r\n 	<li>Aut et nihil sit alias</li>\r\n 	<li>Vero labore id amet nesciunt</li>\r\n</ol>', 'Dolor veritatis veniam quos', '', 'inherit', 'closed', 'closed', '', '43-revision-v1', '', '', '2017-08-30 11:03:55', '2017-08-30 11:03:55', '', 43, 'http://localhost/udemy/2017/08/30/43-revision-v1/', 0, 'revision', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(60, 1, '2017-08-30 11:11:44', '2017-08-30 11:11:44', '<a title=\"Quidem.\" href=\"https://www.dibbert.com/magnam-quo-fugit-ex-tempora-sed-aut-ut-est\">Expedita rerum voluptas amet et</a> <a title=\"Aspernatur.\" href=\"http://www.block.org/\">quo aspernatur</a> Est sunt <a title=\"Sed vel dignissimos ea repudiandae omnis ut.\" href=\"http://sipes.org/quo-eaque-consectetur-est-autem-illum-consectetur-odit\">ipsam. Nam</a> <a title=\"Voluptates est fugiat.\" href=\"http://www.ryan.biz/labore-consequatur-distinctio-maiores-aut-earum.html\">corrupti rerum. Quia commodi id quia</a> <a title=\"Reiciendis deserunt ducimus sed vel.\" href=\"https://www.dare.com/enim-molestiae-earum-cupiditate-facilis\">debitis expedita quidem. Quia</a> <a title=\"Voluptate quibusdam illo consequatur.\" href=\"http://hirthe.biz/\">cumque ut.</a> <a title=\"Provident itaque dolorem est doloremque minus natus recusandae ea.\" href=\"http://www.hettinger.info/quam-fuga-qui-molestiae-ut\">recusandae facilis quas molestias maxime</a> <a title=\"Iste.\" href=\"http://www.bergstrom.com/molestiae-ut-voluptates-nihil-saepe\">est. Aut iusto asperiores</a> <a title=\"Quo aut velit.\" href=\"http://boyer.biz/dignissimos-id-facilis-molestiae\">aperiam et qui non molestiae.</a>\r\n<h5>Aut minus sequi sequi totam similique tempora</h5>\r\n<ul>\r\n 	<li>Nihil deleniti</li>\r\n 	<li>Iste error excepturi sint voluptatibus velit</li>\r\n</ul>\r\n<h2>Tempora similique perferendis itaque est nisi et. Nostrum quisquam quas ut ad possimus quibusdam aut. Et id doloribus eveniet itaque</h2>\r\n<!--more-->\r\n<ul>\r\n 	<li>Qui et et</li>\r\n 	<li>Et corporis quia rem quia</li>\r\n 	<li>Voluptate nulla temporibus modi veniam</li>\r\n 	<li>Aut consequatur aut rem</li>\r\n 	<li>Et illum sequi et eius</li>\r\n 	<li>Rem quam incidunt et</li>\r\n 	<li>Odio minus sequi ipsam voluptatibus</li>\r\n 	<li>Laborum ab aut perspiciatis</li>\r\n</ul>\r\n<h3>Quod officia in qui vel qui ipsum. Nam libero voluptatem officia officiis</h3>\r\n<ol>\r\n 	<li>Quia assumenda dolores ut sunt quis</li>\r\n 	<li>Facilis odio maxime facilis nihil</li>\r\n 	<li>Aut aut eveniet libero nihil modi tempora eius rerum</li>\r\n 	<li>Sit aut dolor</li>\r\n 	<li>Saepe deserunt pariatur deserunt id</li>\r\n 	<li>Sit dicta</li>\r\n 	<li>Architecto</li>\r\n 	<li>Corporis qui</li>\r\n</ol>\r\nQuo aliquid adipisci laudantium <a title=\"Ipsa et laboriosam veritatis et.\" href=\"http://www.volkman.com/temporibus-voluptatem-hic-quia-rerum-quod-nihil-totam\">ut esse facilis</a> Itaque minima nesciunt impedit modi. Placeat perferendis nisi animi. Modi non et amet aliquid. Ipsum enim est vel rerum. Et odio in amet. Tempora asperiores tempora tenetur. Consequatur illo ipsum error nobis Illum voluptatem nulla iste. Nisi reprehenderit laboriosam provident enim Quam ratione at est aut. Et ut <a title=\"Asperiores vel doloribus.\" href=\"http://dubuque.com/aspernatur-atque-perferendis-officia-vero-magni-id.html\">Beatae debitis</a> rem vel alias A ut nisi est soluta est. Iure eligendi <a title=\"Illum consequatur veniam ullam recusandae ullam libero.\" href=\"http://bednar.info/porro-delectus-ea-qui-et-commodi-optio-iure.html\">molestiae earum libero natus debitis. Laudantium ut modi</a> et qui facere Dolores id eaque dolorem. Nesciunt voluptatem sed. <a title=\"Veritatis delectus.\" href=\"http://rau.net/eum-ut-nisi-eos-voluptas-neque-animi-sapiente.html\">quasi deserunt enim</a> sit alias. Quod laborum itaque assumenda debitis. aut libero rerum veritatis rerum ut. sed consequatur libero assumenda quam Voluptate aliquid porro deleniti ut et distinctio consequuntur. Voluptatem aut et qui molestias. praesentium ut aut ea.\r\n\r\nVero cum dolor distinctio <a title=\"Quia ut nesciunt aut molestiae pariatur amet.\" href=\"http://www.rogahn.info/ipsa-est-ut-quidem-voluptatibus.html\">inventore enim. Quae quam iusto odit vel et odio</a> <a title=\"Omnis reprehenderit.\" href=\"http://www.zieme.com/placeat-quos-quasi-voluptatum-eos-voluptas.html\">necessitatibus. Voluptates</a> qui atque doloremque esse.', 'Aliquam qui laudantium exercitationem', 'Quo asperiores sit expedita ea tempora beatae vel dolor omnis magni quia odio quos soluta labore neque est fugiat blanditiis ipsa rerum corrupti autem autem ab numquam enim nam accusamus ipsam voluptatibus sit animi enim doloribus impedit deserunt magni molestiae odio ipsam fugiat quaerat eveniet expedita quam alias ut sunt qui fugiat natus possimus aut voluptas recusandae sint.\r\n\r\nUt et qui placeat et qui voluptas in nihil architecto et ducimus quo eum dolorem nostrum quo soluta minima dicta autem voluptatem provident impedit repellat quae ex maxime nisi sed consectetur laborum nostrum maxime odio culpa suscipit accusamus molestias est amet deserunt necessitatibus sed est iure sapiente eius ipsa quo veritatis debitis sit accusamus et hic ut recusandae dolore ad quibusdam ut suscipit eos amet ipsa quae nobis dignissimos quo qui dolor est optio inventore aliquam qui quisquam vero deleniti.', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2017-08-30 11:11:44', '2017-08-30 11:11:44', '', 9, 'http://localhost/udemy/2017/08/30/9-revision-v1/', 0, 'revision', '', 0),
(61, 1, '2017-08-30 11:29:01', '2017-08-30 11:29:01', 'Excepturi eligendi quos nisi occaecati Illum ullam fugiat dolor corporis explicabo. Sint ea non. ut tempora suscipit. consequatur et id ut. Vel ea in ea. Dolores et voluptatem praesentium. Maiores dignissimos magni Illo reiciendis qui dolorem. Explicabo ipsa ut rem ipsam Amet praesentium nemo minus enim sed architecto. voluptatibus dignissimos cum. Omnis quo modi mollitia. et vero quia voluptatem. Tempore nihil <a title=\"Quia occaecati est officia.\" href=\"https://jast.net/possimus-aut-modi-nihil-commodi-et-eius.html\">non</a> Omnis labore velit velit enim aut omnis. Autem et sint atque qui sit sapiente. quia ex dolores Voluptatem quia eum consectetur. Ad non nam nihil dolorem optio. Cupiditate animi necessitatibus molestiae aut. Excepturi animi velit reiciendis molestias. ipsam sed minus minus eos Dolor odit et sint et eligendi. Perferendis atque eligendi ad dicta. Ipsa exercitationem et consequatur explicabo.\r\n<h5>Vel ab corporis eum. Omnis minima non sit libero et. Dolores hic qui non cum eligendi doloribus</h5>\r\n<blockquote>Sint debitis laborum incidunt quam officiis facere. Modi id velit explicabo pariatur. Quisquam asperiores qui quas. magni ab sed <a title=\"Inventore velit dicta.\" href=\"https://lehner.net/error-nostrum-aut-saepe.html\">voluptatibus adipisci</a> Vel sunt reiciendis dolores possimus <a title=\"Quos autem deserunt.\" href=\"http://www.connelly.com/facere-aspernatur-earum-ex-possimus-commodi-explicabo\">qui. Tempora</a> et sint soluta. Et nobis ut id autem aut eos non. Rerum eius tempore harum et ex. aut accusamus possimus qui. Quis quia quia dolor voluptatum porro rem. cumque aliquam similique quod optio sit. Earum quia et at aliquam. Nam sint nihil rerum blanditiis earum dolorum. Aperiam rem quos accusamus quaerat quisquam. aliquam aliquam dignissimos voluptatum hic. Quis rerum necessitatibus occaecati unde. facilis officiis quo sequi facilis molestiae. Quia harum fuga sed. Et <a title=\"Consequuntur rem quo.\" href=\"http://www.hills.com/ullam-qui-necessitatibus-sit-voluptatem\">maxime sapiente qui.</a></blockquote>\r\n<h4>Laborum vitae repudiandae rem provident dolorem ut mollitia. Est eos consectetur delectus illo optio deserunt aut</h4>\r\n<!--more-->\r\n<img src=\"http://localhost/udemy/wp-content/uploads/2017/08/9e9a0fe7-0766-374f-8f1d-bbcdbb126e47.jpg\" alt=\"Ducimus ipsa consequatur quod atque voluptas impedit quae\" />\r\n<h2>Est sed occaecati quasi qui. Vel aliquid et vel beatae</h2>\r\n<img class=\"aligncenter\" src=\"http://localhost/udemy/wp-content/uploads/2017/08/2c4ded2d-bb5b-3a02-9836-9d00c0dbbae9.jpg\" alt=\"Odit fuga fugit nam et\" />', 'Consequuntur aut sapiente quam officia', '', 'inherit', 'closed', 'closed', '', '12-revision-v1', '', '', '2017-08-30 11:29:01', '2017-08-30 11:29:01', '', 12, 'http://localhost/udemy/2017/08/30/12-revision-v1/', 0, 'revision', '', 0),
(62, 1, '2017-08-30 12:03:18', '2017-08-30 12:03:18', 'Excepturi eligendi quos nisi occaecati Illum ullam fugiat dolor corporis explicabo. Sint ea non. ut tempora suscipit. consequatur et id ut. Vel ea in ea. Dolores et voluptatem praesentium. Maiores dignissimos magni Illo reiciendis qui dolorem. Explicabo ipsa ut rem ipsam Amet praesentium nemo minus enim sed architecto. voluptatibus dignissimos cum. Omnis quo modi mollitia. et vero quia voluptatem. Tempore nihil <a title=\"Quia occaecati est officia.\" href=\"https://jast.net/possimus-aut-modi-nihil-commodi-et-eius.html\">non</a> Omnis labore velit velit enim aut omnis. Autem et sint atque qui sit sapiente. quia ex dolores Voluptatem quia eum consectetur. Ad non nam nihil dolorem optio. Cupiditate animi necessitatibus molestiae aut. Excepturi animi velit reiciendis molestias. ipsam sed minus minus eos Dolor odit et sint et eligendi. Perferendis atque eligendi ad dicta. Ipsa exercitationem et consequatur explicabo.\n<h5>Vel ab corporis eum. Omnis minima non sit libero et. Dolores hic qui non cum eligendi doloribus</h5>\n<blockquote>Sint debitis laborum incidunt quam officiis facere. Modi id velit explicabo pariatur. Quisquam asperiores qui quas. magni ab sed <a title=\"Inventore velit dicta.\" href=\"https://lehner.net/error-nostrum-aut-saepe.html\">voluptatibus adipisci</a> Vel sunt reiciendis dolores possimus <a title=\"Quos autem deserunt.\" href=\"http://www.connelly.com/facere-aspernatur-earum-ex-possimus-commodi-explicabo\">qui. Tempora</a> et sint soluta. Et nobis ut id autem aut eos non. Rerum eius tempore harum et ex. aut accusamus possimus qui. Quis quia quia dolor voluptatum porro rem. cumque aliquam similique quod optio sit. Earum quia et at aliquam. Nam sint nihil rerum blanditiis earum dolorum. Aperiam rem quos accusamus quaerat quisquam. aliquam aliquam dignissimos voluptatum hic. Quis rerum necessitatibus occaecati unde. facilis officiis quo sequi facilis molestiae. Quia harum fuga sed. Et <a title=\"Consequuntur rem quo.\" href=\"http://www.hills.com/ullam-qui-necessitatibus-sit-voluptatem\">maxime sapiente qui.</a></blockquote>\n<h4>Laborum vitae repudiandae rem provident dolorem ut mollitia. Est eos consectetur delectus illo optio deserunt aut</h4>\n<!--more-->\n<img src=\"http://localhost/udemy/wp-content/uploads/2017/08/9e9a0fe7-0766-374f-8f1d-bbcdbb126e47.jpg\" alt=\"Ducimus ipsa consequatur quod atque voluptas impedit quae\" />\n<h2>Est sed occaecati quasi qui. Vel aliquid et vel beatae</h2>\n<img class=\"aligncenter\" src=\"http://localhost/udemy/wp-content/uploads/2017/08/2c4ded2d-bb5b-3a02-9836-9d00c0dbbae9.jpg\" alt=\"Odit fuga fugit nam et\" />', 'Consequuntur aut sapiente quam officia', '', 'inherit', 'closed', 'closed', '', '12-autosave-v1', '', '', '2017-08-30 12:03:18', '2017-08-30 12:03:18', '', 12, 'http://localhost/udemy/2017/08/30/12-autosave-v1/', 0, 'revision', '', 0),
(63, 1, '2017-08-30 14:51:03', '2017-08-30 14:51:03', ' ', '', '', 'publish', 'closed', 'closed', '', '63', '', '', '2017-10-15 17:41:32', '2017-10-15 17:41:32', '', 0, 'http://localhost/udemy/?p=63', 1, 'nav_menu_item', '', 0),
(64, 1, '2017-08-30 14:51:04', '2017-08-30 14:51:04', ' ', '', '', 'publish', 'closed', 'closed', '', '64', '', '', '2017-10-15 17:41:33', '2017-10-15 17:41:33', '', 0, 'http://localhost/udemy/?p=64', 2, 'nav_menu_item', '', 0),
(66, 1, '2017-12-15 03:56:45', '2017-12-15 03:56:45', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Hoodie with Zipper', 'This is a simple product.', 'publish', 'open', 'closed', '', 'hoodie-with-zipper', '', '', '2017-12-15 03:56:45', '2017-12-15 03:56:45', '', 0, 'https://woocommercecore.mystagingwebsite.com/?product=hoodie-with-zipper', 0, 'product', '', 0),
(68, 1, '2017-12-15 03:56:46', '2017-12-15 03:56:46', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Long Sleeve Tee', 'This is a simple product.', 'publish', 'open', 'closed', '', 'long-sleeve-tee', '', '', '2017-12-15 03:56:46', '2017-12-15 03:56:46', '', 0, 'https://woocommercecore.mystagingwebsite.com/?product=long-sleeve-tee', 0, 'product', '', 0),
(70, 1, '2017-12-15 03:56:47', '2017-12-15 03:56:47', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Polo', 'This is a simple product.', 'publish', 'open', 'closed', '', 'polo', '', '', '2017-12-15 03:56:47', '2017-12-15 03:56:47', '', 0, 'https://woocommercecore.mystagingwebsite.com/?product=polo', 0, 'product', '', 0),
(73, 1, '2017-12-15 03:56:49', '2017-12-15 03:56:49', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis orci ac odio dictum tincidunt. Donec ut metus leo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed luctus, dui eu sagittis sodales, nulla nibh sagittis augue, vel porttitor diam enim non metus. Vestibulum aliquam augue neque. Phasellus tincidunt odio eget ullamcorper efficitur. Cras placerat ut turpis pellentesque vulputate. Nam sed consequat tortor. Curabitur finibus sapien dolor. Ut eleifend tellus nec erat pulvinar dignissim. Nam non arcu purus. Vivamus et massa massa.', 'Album', 'This is a simple, virtual product.', 'publish', 'open', 'closed', '', 'album', '', '', '2017-12-15 03:56:49', '2017-12-15 03:56:49', '', 0, 'https://woocommercecore.mystagingwebsite.com/?product=album', 0, 'product', '', 0),
(75, 1, '2017-12-15 03:56:49', '2017-12-15 03:56:49', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis orci ac odio dictum tincidunt. Donec ut metus leo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed luctus, dui eu sagittis sodales, nulla nibh sagittis augue, vel porttitor diam enim non metus. Vestibulum aliquam augue neque. Phasellus tincidunt odio eget ullamcorper efficitur. Cras placerat ut turpis pellentesque vulputate. Nam sed consequat tortor. Curabitur finibus sapien dolor. Ut eleifend tellus nec erat pulvinar dignissim. Nam non arcu purus. Vivamus et massa massa.', 'Single', 'This is a simple, virtual product.', 'publish', 'open', 'closed', '', 'single', '', '', '2017-12-15 03:56:49', '2017-12-15 03:56:49', '', 0, 'https://woocommercecore.mystagingwebsite.com/?product=single', 0, 'product', '', 1),
(83, 1, '2017-12-15 03:56:52', '2017-12-15 03:56:52', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'T-Shirt with Logo', 'This is a simple product.', 'publish', 'open', 'closed', '', 't-shirt-with-logo', '', '', '2017-12-15 03:56:52', '2017-12-15 03:56:52', '', 0, 'https://woocommercecore.mystagingwebsite.com/?product=t-shirt-with-logo', 0, 'product', '', 0),
(85, 1, '2017-12-15 03:56:53', '2017-12-15 03:56:53', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Beanie with Logo', 'This is a simple product.', 'publish', 'open', 'closed', '', 'beanie-with-logo', '', '', '2017-12-15 03:56:53', '2017-12-15 03:56:53', '', 0, 'https://woocommercecore.mystagingwebsite.com/?product=beanie-with-logo', 0, 'product', '', 0),
(87, 1, '2017-12-15 03:56:54', '2017-12-15 03:56:54', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Logo Collection', 'This is a grouped product.', 'publish', 'open', 'closed', '', 'logo-collection', '', '', '2017-12-15 03:56:54', '2017-12-15 03:56:54', '', 0, 'https://woocommercecore.mystagingwebsite.com/?product=logo-collection', 0, 'product', '', 0),
(89, 1, '2017-12-15 03:57:20', '2017-12-15 03:57:20', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'WordPress Pennant', 'This is an external product.', 'publish', 'open', 'closed', '', 'wordpress-pennant', '', '', '2017-12-15 03:57:20', '2017-12-15 03:57:20', '', 0, 'https://woocommercecore.mystagingwebsite.com/?product=wordpress-pennant', 0, 'product', '', 0),
(97, 1, '2017-09-14 09:20:34', '2017-09-14 09:20:34', 'https://www.youtube.com/watch?v=MsFdaLIGyas\nNon voluptatem enim id consectetur distinctio. Enim corporis impedit corporis earum magnam. Soluta nisi et eos qui. Est modi tempore est ut dicta.\n\n<img src=\"http://localhost/udemy/wp-content/uploads/2017/08/8bdb5f1c-cd6d-34ad-a270-616b0962b5ad.jpg\" />\n\nTotam ipsam quia explicabo ab et nisi. Consequatur et vero <a title=\"Neque tenetur est.\" href=\"http://dickinson.com/vel-possimus-quos-dolores\">quas</a> enim. Dignissimos <a title=\"Magni ut placeat quisquam harum.\" href=\"http://auer.com/hic-vel-molestias-eveniet-occaecati\">rerum culpa autem autem. Similique</a> rerum odit vero dolor quo. Numquam repellat et cumque eum. Ea nobis sequi tempora ipsa. molestias unde minus et quia sint. ea doloremque vel quo asperiores. Ipsum provident vitae <a title=\"Ducimus similique quas eveniet.\" href=\"http://brekke.com/\">laborum dolores rerum ipsum. Accusamus</a> eaque sit reprehenderit. Explicabo autem vitae dolores et Assumenda dicta excepturi voluptatem <a title=\"Consequuntur et omnis voluptas.\" href=\"http://www.muller.com/natus-velit-omnis-sed-animi-vitae\">Blanditiis autem officia</a> facilis. <a title=\"Nihil aliquid velit.\" href=\"http://www.watsica.com/eveniet-omnis-nobis-ipsam-itaque-et-et-iste\">non natus est error. Error</a> eligendi quod. cupiditate asperiores sint exercitationem eos. Nostrum aut quis labore ex dolor. Praesentium consequuntur nemo aspernatur id et. Laudantium est praesentium deserunt dolorum in laborum.\n<h2>Odit autem numquam id quis architecto. Deleniti ex iure odio sed impedit rem. Molestias vel molestias totam nemo dicta labore</h2>\n<blockquote><a title=\"Vel cumque sed.\" href=\"http://www.bailey.biz/consequatur-autem-mollitia-reprehenderit-amet-a-voluptatum.html\">Distinctio molestiae magnam eos nobis</a> Incidunt minima voluptatem quis omnis qui rerum. Blanditiis quis quo ea modi ipsum. qui maxime voluptatibus eos quos laboriosam. Nam officia ducimus asperiores. aut molestiae aut rerum Vitae itaque rerum beatae. Reiciendis explicabo maiores minus est. Debitis odio perferendis vero. perspiciatis est culpa nobis Vel omnis quidem officiis. Quis ut autem repellendus fugit consequuntur. Dolores officia dignissimos voluptate Enim dolores distinctio eaque accusamus qui inventore. Ea perspiciatis dignissimos labore ut alias. Consequatur nemo omnis repellat consequatur voluptas. inventore qui expedita. aliquid soluta atque dignissimos. rerum perspiciatis adipisci rerum soluta. Possimus quia repudiandae aut. esse id ullam enim sed sint. Maxime unde quae Odit eum voluptate cupiditate ea tenetur Accusantium voluptatem quas in pariatur. Non consequatur <a title=\"Laborum ut quisquam.\" href=\"https://www.hauck.com/molestiae-saepe-nihil-similique-ea-blanditiis-vitae-temporibus-earum\">ut</a> enim.\n\n[gallery size=\"large\" ids=\"23,26,10,27,29,11\"]</blockquote>\nOmnis quaerat a laudantium Voluptas asperiores dolores et velit voluptas Ut distinctio nam corrupti sint voluptatem quo. Consequuntur aut fugiat ullam. Voluptas laborum sunt est et sapiente et. officia pariatur voluptates quo incidunt. Laboriosam voluptas enim at voluptas Porro dolore cum officiis iusto. eum cupiditate nemo et ut sapiente quidem. autem et nulla et Explicabo enim sapiente repellat laborum voluptates. magni minus doloremque numquam saepe. Earum eaque necessitatibus veritatis magni est Quia maxime magni optio atque amet velit doloremque. Repellat quos maxime adipisci nobis ullam. voluptatem iusto autem laboriosam nisi alias. Reprehenderit reiciendis aut est Et iusto est commodi <a title=\"Ratione ea.\" href=\"http://www.spencer.com/\">et.</a> eum blanditiis dolorem Sed earum aliquam excepturi Iusto quam at ad et voluptates. Autem dolor in. laboriosam consequatur qui non a. Amet voluptas consequatur id commodi consequuntur beatae. Nihil et ab Omnis id aliquid Omnis rerum quae illo enim cupiditate. omnis sequi. Libero excepturi veritatis quia suscipit ut. Deserunt velit quo Atque veniam et repellat architecto. totam itaque fugiat quibusdam. Dignissimos numquam quos dolore. Nobis minima repudiandae ut at. Omnis qui illum illum. Nihil et ut. Qui dignissimos facilis sit consequatur. eligendi laborum architecto dolores. tempora in itaque cupiditate. Qui sint consequatur tenetur ipsum. Accusamus quia quam et consequuntur neque quisquam. Ipsum autem esse consequuntur dolor commodi rerum. animi voluptatum et blanditiis rerum voluptatem. Neque error est quia possimus voluptas. Est debitis voluptatibus fugiat. Quos dignissimos omnis explicabo vero aspernatur.\n<h6>Distinctio consequatur exercitationem et vel aut animi dolorem quam. Laboriosam pariatur deserunt harum</h6>\n<ol>\n 	<li>Rerum ratione placeat et</li>\n 	<li>Sit sapiente consequatur cum</li>\n 	<li>Est enim saepe libero vero</li>\n 	<li>Unde aut</li>\n 	<li>Dolore sed quos sit omnis quibusdam qui</li>\n</ol>\n<!--more-->\n<blockquote>Est quas accusantium exercitationem sed Beatae dicta sint rerum corporis magnam voluptatum. Quia error eius ut facere. Reiciendis voluptate non enim quia a. <a title=\"Qui porro ut aut dignissimos.\" href=\"http://hackett.com/sunt-nemo-dolorum-nobis-dolorum-unde-consequatur\">sunt</a> qui vel quos. Enim non sapiente impedit. Quas voluptates quam. vitae et maiores iure adipisci sed. Aut veritatis corrupti occaecati consequuntur. Iusto necessitatibus ullam aut officia. ipsam ullam enim aspernatur Earum natus corporis alias qui id nihil. Enim praesentium sit repudiandae a. nobis rerum repudiandae cumque at ullam possimus. Provident saepe soluta dolore Deserunt vero voluptatem fuga. Cupiditate neque minus harum molestiae beatae. Id ratione veritatis libero eligendi sed. Explicabo quasi eos adipisci. quidem consequuntur omnis quam eligendi non facilis. Dolorum pariatur aut quis laborum impedit atque. Qui hic id sapiente doloremque commodi quisquam. Aut voluptatem illum velit perferendis id Occaecati quam dolore vel vitae et voluptatum dolor. Earum ullam et quasi.</blockquote>\n\n<hr />\n\nTempora laudantium quo officia aperiam. Dolorem cum quas vitae. Debitis maxime animi minima reprehenderit eos consectetur. Eaque explicabo saepe pariatur nobis. Iure consequatur perferendis consequatur ducimus tempora excepturi. Accusantium corporis rerum excepturi aut alias. Dolores impedit alias facere ut eius. Impedit aut impedit atque. Non laudantium et illo quam molestiae enim vel. Sint cupiditate ullam ipsum et. Suscipit ullam nihil excepturi facere eveniet nobis. Ipsa libero placeat sunt autem. Assumenda doloribus id nam qui magnam. Nihil voluptate sit ullam. Rerum qui quo magni corrupti. Est porro est iure consequatur perferendis nihil dolorem. Vel facere qui aut suscipit. Enim et dolores doloremque quia. Eos iure aut inventore. Minus libero inventore laboriosam sequi qui. Animi facere officiis voluptates architecto magni odio. Perspiciatis autem corrupti sapiente aliquam reprehenderit delectus labore. Voluptatem suscipit quos aut voluptas odio atque harum. Aut iure quis quo est velit. Sunt recusandae ipsum quidem neque nihil in. Illo ut sint rem est. Quis et quam id voluptatibus labore. Sunt ea similique illum. Illum aut praesentium dolorem dolores aliquid quis ipsam necessitatibus.\n<h4>Eius aperiam odio exercitationem voluptate vel officia. Inventore doloribus deleniti totam qui ullam dolor. Dignissimos nulla ullam nesciunt et libero</h4>\n<ul>\n 	<li>Sint quis similique laboriosam</li>\n 	<li>Voluptates magni et deserunt voluptate enim</li>\n 	<li>Iste eius quo ipsa mollitia</li>\n 	<li>Non officia in magnam repellat</li>\n</ul>\n<h5>Excepturi qui tenetur praesentium sit quo. Quia ab magnam voluptatem harum quia dolores. Adipisci quaerat est quis quam qui similique</h5>\n<blockquote><a title=\"Et et quia officiis.\" href=\"http://www.herzog.com/non-voluptas-ut-expedita-illo-possimus\">Repellendus asperiores earum eligendi sed.</a> est qui eveniet inventore delectus Vel iste qui optio ratione Alias <a title=\"Earum libero.\" href=\"http://watsica.org/\">ut aspernatur quia</a> quia. Debitis placeat ipsa itaque natus alias. placeat rerum ad voluptatem. Reiciendis quas est dolores. Magni <a title=\"Repellendus eaque ad ipsum.\" href=\"http://www.wintheiser.com/\">rerum quaerat.</a> at dolor suscipit eos. Doloribus perferendis voluptas debitis ut. Exercitationem sit id voluptas Eos quis sit id temporibus. Debitis <a title=\"Quia ratione omnis cupiditate et.\" href=\"http://www.altenwerth.org/\">at nihil cum qui necessitatibus. Sequi voluptatem</a> cumque aut quos omnis omnis <a title=\"Quo tempora nam.\" href=\"https://www.blick.biz/sapiente-tenetur-vel-veniam-quos-dolorum\">Ipsam aut tenetur reiciendis</a></blockquote>\n<h4>Asperiores ut ut eligendi est totam quia</h4>\n<ol>\n 	<li>Est architecto quam ut</li>\n 	<li>Vel ut impedit placeat</li>\n 	<li>Minima ea nostrum optio</li>\n 	<li>Sint et nisi ut sed ipsa nemo</li>\n 	<li>Et veniam fugiat aut nesciunt maiores non</li>\n 	<li>Aut et nihil sit alias</li>\n 	<li>Vero labore id amet nesciunt</li>\n</ol>', 'Dolor veritatis veniam quos', '', 'inherit', 'closed', 'closed', '', '43-autosave-v1', '', '', '2017-09-14 09:20:34', '2017-09-14 09:20:34', '', 43, 'http://localhost/udemy/2017/09/14/43-autosave-v1/', 0, 'revision', '', 0),
(98, 1, '2017-09-14 08:26:12', '2017-09-14 08:26:12', 'Non voluptatem enim id consectetur distinctio. Enim corporis impedit corporis earum magnam. Soluta nisi et eos qui. Est modi tempore est ut dicta.\r\n\r\n<img src=\"http://localhost/udemy/wp-content/uploads/2017/08/8bdb5f1c-cd6d-34ad-a270-616b0962b5ad.jpg\" />\r\n\r\nTotam ipsam quia explicabo ab et nisi. Consequatur et vero <a title=\"Neque tenetur est.\" href=\"http://dickinson.com/vel-possimus-quos-dolores\">quas</a> enim. Dignissimos <a title=\"Magni ut placeat quisquam harum.\" href=\"http://auer.com/hic-vel-molestias-eveniet-occaecati\">rerum culpa autem autem. Similique</a> rerum odit vero dolor quo. Numquam repellat et cumque eum. Ea nobis sequi tempora ipsa. molestias unde minus et quia sint. ea doloremque vel quo asperiores. Ipsum provident vitae <a title=\"Ducimus similique quas eveniet.\" href=\"http://brekke.com/\">laborum dolores rerum ipsum. Accusamus</a> eaque sit reprehenderit. Explicabo autem vitae dolores et Assumenda dicta excepturi voluptatem <a title=\"Consequuntur et omnis voluptas.\" href=\"http://www.muller.com/natus-velit-omnis-sed-animi-vitae\">Blanditiis autem officia</a> facilis. <a title=\"Nihil aliquid velit.\" href=\"http://www.watsica.com/eveniet-omnis-nobis-ipsam-itaque-et-et-iste\">non natus est error. Error</a> eligendi quod. cupiditate asperiores sint exercitationem eos. Nostrum aut quis labore ex dolor. Praesentium consequuntur nemo aspernatur id et. Laudantium est praesentium deserunt dolorum in laborum.\r\n<h2>Odit autem numquam id quis architecto. Deleniti ex iure odio sed impedit rem. Molestias vel molestias totam nemo dicta labore</h2>\r\n<blockquote><a title=\"Vel cumque sed.\" href=\"http://www.bailey.biz/consequatur-autem-mollitia-reprehenderit-amet-a-voluptatum.html\">Distinctio molestiae magnam eos nobis</a> Incidunt minima voluptatem quis omnis qui rerum. Blanditiis quis quo ea modi ipsum. qui maxime voluptatibus eos quos laboriosam. Nam officia ducimus asperiores. aut molestiae aut rerum Vitae itaque rerum beatae. Reiciendis explicabo maiores minus est. Debitis odio perferendis vero. perspiciatis est culpa nobis Vel omnis quidem officiis. Quis ut autem repellendus fugit consequuntur. Dolores officia dignissimos voluptate Enim dolores distinctio eaque accusamus qui inventore. Ea perspiciatis dignissimos labore ut alias. Consequatur nemo omnis repellat consequatur voluptas. inventore qui expedita. aliquid soluta atque dignissimos. rerum perspiciatis adipisci rerum soluta. Possimus quia repudiandae aut. esse id ullam enim sed sint. Maxime unde quae Odit eum voluptate cupiditate ea tenetur Accusantium voluptatem quas in pariatur. Non consequatur <a title=\"Laborum ut quisquam.\" href=\"https://www.hauck.com/molestiae-saepe-nihil-similique-ea-blanditiis-vitae-temporibus-earum\">ut</a> enim.\r\n\r\n[gallery size=\"large\" ids=\"23,26,10,27,29,11\"]</blockquote>\r\nOmnis quaerat a laudantium Voluptas asperiores dolores et velit voluptas Ut distinctio nam corrupti sint voluptatem quo. Consequuntur aut fugiat ullam. Voluptas laborum sunt est et sapiente et. officia pariatur voluptates quo incidunt. Laboriosam voluptas enim at voluptas Porro dolore cum officiis iusto. eum cupiditate nemo et ut sapiente quidem. autem et nulla et Explicabo enim sapiente repellat laborum voluptates. magni minus doloremque numquam saepe. Earum eaque necessitatibus veritatis magni est Quia maxime magni optio atque amet velit doloremque. Repellat quos maxime adipisci nobis ullam. voluptatem iusto autem laboriosam nisi alias. Reprehenderit reiciendis aut est Et iusto est commodi <a title=\"Ratione ea.\" href=\"http://www.spencer.com/\">et.</a> eum blanditiis dolorem Sed earum aliquam excepturi Iusto quam at ad et voluptates. Autem dolor in. laboriosam consequatur qui non a. Amet voluptas consequatur id commodi consequuntur beatae. Nihil et ab Omnis id aliquid Omnis rerum quae illo enim cupiditate. omnis sequi. Libero excepturi veritatis quia suscipit ut. Deserunt velit quo Atque veniam et repellat architecto. totam itaque fugiat quibusdam. Dignissimos numquam quos dolore. Nobis minima repudiandae ut at. Omnis qui illum illum. Nihil et ut. Qui dignissimos facilis sit consequatur. eligendi laborum architecto dolores. tempora in itaque cupiditate. Qui sint consequatur tenetur ipsum. Accusamus quia quam et consequuntur neque quisquam. Ipsum autem esse consequuntur dolor commodi rerum. animi voluptatum et blanditiis rerum voluptatem. Neque error est quia possimus voluptas. Est debitis voluptatibus fugiat. Quos dignissimos omnis explicabo vero aspernatur.\r\n<h6>Distinctio consequatur exercitationem et vel aut animi dolorem quam. Laboriosam pariatur deserunt harum</h6>\r\n<ol>\r\n 	<li>Rerum ratione placeat et</li>\r\n 	<li>Sit sapiente consequatur cum</li>\r\n 	<li>Est enim saepe libero vero</li>\r\n 	<li>Unde aut</li>\r\n 	<li>Dolore sed quos sit omnis quibusdam qui</li>\r\n</ol>\r\n<!--more-->\r\n<blockquote>Est quas accusantium exercitationem sed Beatae dicta sint rerum corporis magnam voluptatum. Quia error eius ut facere. Reiciendis voluptate non enim quia a. <a title=\"Qui porro ut aut dignissimos.\" href=\"http://hackett.com/sunt-nemo-dolorum-nobis-dolorum-unde-consequatur\">sunt</a> qui vel quos. Enim non sapiente impedit. Quas voluptates quam. vitae et maiores iure adipisci sed. Aut veritatis corrupti occaecati consequuntur. Iusto necessitatibus ullam aut officia. ipsam ullam enim aspernatur Earum natus corporis alias qui id nihil. Enim praesentium sit repudiandae a. nobis rerum repudiandae cumque at ullam possimus. Provident saepe soluta dolore Deserunt vero voluptatem fuga. Cupiditate neque minus harum molestiae beatae. Id ratione veritatis libero eligendi sed. Explicabo quasi eos adipisci. quidem consequuntur omnis quam eligendi non facilis. Dolorum pariatur aut quis laborum impedit atque. Qui hic id sapiente doloremque commodi quisquam. Aut voluptatem illum velit perferendis id Occaecati quam dolore vel vitae et voluptatum dolor. Earum ullam et quasi.</blockquote>\r\n\r\n<hr />\r\n\r\nTempora laudantium quo officia aperiam. Dolorem cum quas vitae. Debitis maxime animi minima reprehenderit eos consectetur. Eaque explicabo saepe pariatur nobis. Iure consequatur perferendis consequatur ducimus tempora excepturi. Accusantium corporis rerum excepturi aut alias. Dolores impedit alias facere ut eius. Impedit aut impedit atque. Non laudantium et illo quam molestiae enim vel. Sint cupiditate ullam ipsum et. Suscipit ullam nihil excepturi facere eveniet nobis. Ipsa libero placeat sunt autem. Assumenda doloribus id nam qui magnam. Nihil voluptate sit ullam. Rerum qui quo magni corrupti. Est porro est iure consequatur perferendis nihil dolorem. Vel facere qui aut suscipit. Enim et dolores doloremque quia. Eos iure aut inventore. Minus libero inventore laboriosam sequi qui. Animi facere officiis voluptates architecto magni odio. Perspiciatis autem corrupti sapiente aliquam reprehenderit delectus labore. Voluptatem suscipit quos aut voluptas odio atque harum. Aut iure quis quo est velit. Sunt recusandae ipsum quidem neque nihil in. Illo ut sint rem est. Quis et quam id voluptatibus labore. Sunt ea similique illum. Illum aut praesentium dolorem dolores aliquid quis ipsam necessitatibus.\r\n<h4>Eius aperiam odio exercitationem voluptate vel officia. Inventore doloribus deleniti totam qui ullam dolor. Dignissimos nulla ullam nesciunt et libero</h4>\r\n<ul>\r\n 	<li>Sint quis similique laboriosam</li>\r\n 	<li>Voluptates magni et deserunt voluptate enim</li>\r\n 	<li>Iste eius quo ipsa mollitia</li>\r\n 	<li>Non officia in magnam repellat</li>\r\n</ul>\r\n<h5>Excepturi qui tenetur praesentium sit quo. Quia ab magnam voluptatem harum quia dolores. Adipisci quaerat est quis quam qui similique</h5>\r\n<blockquote><a title=\"Et et quia officiis.\" href=\"http://www.herzog.com/non-voluptas-ut-expedita-illo-possimus\">Repellendus asperiores earum eligendi sed.</a> est qui eveniet inventore delectus Vel iste qui optio ratione Alias <a title=\"Earum libero.\" href=\"http://watsica.org/\">ut aspernatur quia</a> quia. Debitis placeat ipsa itaque natus alias. placeat rerum ad voluptatem. Reiciendis quas est dolores. Magni <a title=\"Repellendus eaque ad ipsum.\" href=\"http://www.wintheiser.com/\">rerum quaerat.</a> at dolor suscipit eos. Doloribus perferendis voluptas debitis ut. Exercitationem sit id voluptas Eos quis sit id temporibus. Debitis <a title=\"Quia ratione omnis cupiditate et.\" href=\"http://www.altenwerth.org/\">at nihil cum qui necessitatibus. Sequi voluptatem</a> cumque aut quos omnis omnis <a title=\"Quo tempora nam.\" href=\"https://www.blick.biz/sapiente-tenetur-vel-veniam-quos-dolorum\">Ipsam aut tenetur reiciendis</a></blockquote>\r\n<h4>Asperiores ut ut eligendi est totam quia</h4>\r\n<ol>\r\n 	<li>Est architecto quam ut</li>\r\n 	<li>Vel ut impedit placeat</li>\r\n 	<li>Minima ea nostrum optio</li>\r\n 	<li>Sint et nisi ut sed ipsa nemo</li>\r\n 	<li>Et veniam fugiat aut nesciunt maiores non</li>\r\n 	<li>Aut et nihil sit alias</li>\r\n 	<li>Vero labore id amet nesciunt</li>\r\n</ol>', 'Dolor veritatis veniam quos', '', 'inherit', 'closed', 'closed', '', '43-revision-v1', '', '', '2017-09-14 08:26:12', '2017-09-14 08:26:12', '', 43, 'http://localhost/udemy/2017/09/14/43-revision-v1/', 0, 'revision', '', 0),
(99, 1, '2017-09-14 09:20:42', '2017-09-14 09:20:42', 'https://www.youtube.com/watch?v=MsFdaLIGyas\r\nNon voluptatem enim id consectetur distinctio. Enim corporis impedit corporis earum magnam. Soluta nisi et eos qui. Est modi tempore est ut dicta.\r\n\r\n<img src=\"http://localhost/udemy/wp-content/uploads/2017/08/8bdb5f1c-cd6d-34ad-a270-616b0962b5ad.jpg\" />\r\n\r\nTotam ipsam quia explicabo ab et nisi. Consequatur et vero <a title=\"Neque tenetur est.\" href=\"http://dickinson.com/vel-possimus-quos-dolores\">quas</a> enim. Dignissimos <a title=\"Magni ut placeat quisquam harum.\" href=\"http://auer.com/hic-vel-molestias-eveniet-occaecati\">rerum culpa autem autem. Similique</a> rerum odit vero dolor quo. Numquam repellat et cumque eum. Ea nobis sequi tempora ipsa. molestias unde minus et quia sint. ea doloremque vel quo asperiores. Ipsum provident vitae <a title=\"Ducimus similique quas eveniet.\" href=\"http://brekke.com/\">laborum dolores rerum ipsum. Accusamus</a> eaque sit reprehenderit. Explicabo autem vitae dolores et Assumenda dicta excepturi voluptatem <a title=\"Consequuntur et omnis voluptas.\" href=\"http://www.muller.com/natus-velit-omnis-sed-animi-vitae\">Blanditiis autem officia</a> facilis. <a title=\"Nihil aliquid velit.\" href=\"http://www.watsica.com/eveniet-omnis-nobis-ipsam-itaque-et-et-iste\">non natus est error. Error</a> eligendi quod. cupiditate asperiores sint exercitationem eos. Nostrum aut quis labore ex dolor. Praesentium consequuntur nemo aspernatur id et. Laudantium est praesentium deserunt dolorum in laborum.\r\n<h2>Odit autem numquam id quis architecto. Deleniti ex iure odio sed impedit rem. Molestias vel molestias totam nemo dicta labore</h2>\r\n<blockquote><a title=\"Vel cumque sed.\" href=\"http://www.bailey.biz/consequatur-autem-mollitia-reprehenderit-amet-a-voluptatum.html\">Distinctio molestiae magnam eos nobis</a> Incidunt minima voluptatem quis omnis qui rerum. Blanditiis quis quo ea modi ipsum. qui maxime voluptatibus eos quos laboriosam. Nam officia ducimus asperiores. aut molestiae aut rerum Vitae itaque rerum beatae. Reiciendis explicabo maiores minus est. Debitis odio perferendis vero. perspiciatis est culpa nobis Vel omnis quidem officiis. Quis ut autem repellendus fugit consequuntur. Dolores officia dignissimos voluptate Enim dolores distinctio eaque accusamus qui inventore. Ea perspiciatis dignissimos labore ut alias. Consequatur nemo omnis repellat consequatur voluptas. inventore qui expedita. aliquid soluta atque dignissimos. rerum perspiciatis adipisci rerum soluta. Possimus quia repudiandae aut. esse id ullam enim sed sint. Maxime unde quae Odit eum voluptate cupiditate ea tenetur Accusantium voluptatem quas in pariatur. Non consequatur <a title=\"Laborum ut quisquam.\" href=\"https://www.hauck.com/molestiae-saepe-nihil-similique-ea-blanditiis-vitae-temporibus-earum\">ut</a> enim.</blockquote>\r\nOmnis quaerat a laudantium Voluptas asperiores dolores et velit voluptas Ut distinctio nam corrupti sint voluptatem quo. Consequuntur aut fugiat ullam. Voluptas laborum sunt est et sapiente et. officia pariatur voluptates quo incidunt. Laboriosam voluptas enim at voluptas Porro dolore cum officiis iusto. eum cupiditate nemo et ut sapiente quidem. autem et nulla et Explicabo enim sapiente repellat laborum voluptates. magni minus doloremque numquam saepe. Earum eaque necessitatibus veritatis magni est Quia maxime magni optio atque amet velit doloremque. Repellat quos maxime adipisci nobis ullam. voluptatem iusto autem laboriosam nisi alias. Reprehenderit reiciendis aut est Et iusto est commodi <a title=\"Ratione ea.\" href=\"http://www.spencer.com/\">et.</a> eum blanditiis dolorem Sed earum aliquam excepturi Iusto quam at ad et voluptates. Autem dolor in. laboriosam consequatur qui non a. Amet voluptas consequatur id commodi consequuntur beatae. Nihil et ab Omnis id aliquid Omnis rerum quae illo enim cupiditate. omnis sequi. Libero excepturi veritatis quia suscipit ut. Deserunt velit quo Atque veniam et repellat architecto. totam itaque fugiat quibusdam. Dignissimos numquam quos dolore. Nobis minima repudiandae ut at. Omnis qui illum illum. Nihil et ut. Qui dignissimos facilis sit consequatur. eligendi laborum architecto dolores. tempora in itaque cupiditate. Qui sint consequatur tenetur ipsum. Accusamus quia quam et consequuntur neque quisquam. Ipsum autem esse consequuntur dolor commodi rerum. animi voluptatum et blanditiis rerum voluptatem. Neque error est quia possimus voluptas. Est debitis voluptatibus fugiat. Quos dignissimos omnis explicabo vero aspernatur.\r\n<h6>Distinctio consequatur exercitationem et vel aut animi dolorem quam. Laboriosam pariatur deserunt harum</h6>\r\n<ol>\r\n 	<li>Rerum ratione placeat et</li>\r\n 	<li>Sit sapiente consequatur cum</li>\r\n 	<li>Est enim saepe libero vero</li>\r\n 	<li>Unde aut</li>\r\n 	<li>Dolore sed quos sit omnis quibusdam qui</li>\r\n</ol>\r\n<!--more-->\r\n<blockquote>Est quas accusantium exercitationem sed Beatae dicta sint rerum corporis magnam voluptatum. Quia error eius ut facere. Reiciendis voluptate non enim quia a. <a title=\"Qui porro ut aut dignissimos.\" href=\"http://hackett.com/sunt-nemo-dolorum-nobis-dolorum-unde-consequatur\">sunt</a> qui vel quos. Enim non sapiente impedit. Quas voluptates quam. vitae et maiores iure adipisci sed. Aut veritatis corrupti occaecati consequuntur. Iusto necessitatibus ullam aut officia. ipsam ullam enim aspernatur Earum natus corporis alias qui id nihil. Enim praesentium sit repudiandae a. nobis rerum repudiandae cumque at ullam possimus. Provident saepe soluta dolore Deserunt vero voluptatem fuga. Cupiditate neque minus harum molestiae beatae. Id ratione veritatis libero eligendi sed. Explicabo quasi eos adipisci. quidem consequuntur omnis quam eligendi non facilis. Dolorum pariatur aut quis laborum impedit atque. Qui hic id sapiente doloremque commodi quisquam. Aut voluptatem illum velit perferendis id Occaecati quam dolore vel vitae et voluptatum dolor. Earum ullam et quasi.</blockquote>\r\n\r\n<hr />\r\n\r\nTempora laudantium quo officia aperiam. Dolorem cum quas vitae. Debitis maxime animi minima reprehenderit eos consectetur. Eaque explicabo saepe pariatur nobis. Iure consequatur perferendis consequatur ducimus tempora excepturi. Accusantium corporis rerum excepturi aut alias. Dolores impedit alias facere ut eius. Impedit aut impedit atque. Non laudantium et illo quam molestiae enim vel. Sint cupiditate ullam ipsum et. Suscipit ullam nihil excepturi facere eveniet nobis. Ipsa libero placeat sunt autem. Assumenda doloribus id nam qui magnam. Nihil voluptate sit ullam. Rerum qui quo magni corrupti. Est porro est iure consequatur perferendis nihil dolorem. Vel facere qui aut suscipit. Enim et dolores doloremque quia. Eos iure aut inventore. Minus libero inventore laboriosam sequi qui. Animi facere officiis voluptates architecto magni odio. Perspiciatis autem corrupti sapiente aliquam reprehenderit delectus labore. Voluptatem suscipit quos aut voluptas odio atque harum. Aut iure quis quo est velit. Sunt recusandae ipsum quidem neque nihil in. Illo ut sint rem est. Quis et quam id voluptatibus labore. Sunt ea similique illum. Illum aut praesentium dolorem dolores aliquid quis ipsam necessitatibus.\r\n<h4>Eius aperiam odio exercitationem voluptate vel officia. Inventore doloribus deleniti totam qui ullam dolor. Dignissimos nulla ullam nesciunt et libero</h4>\r\n<ul>\r\n 	<li>Sint quis similique laboriosam</li>\r\n 	<li>Voluptates magni et deserunt voluptate enim</li>\r\n 	<li>Iste eius quo ipsa mollitia</li>\r\n 	<li>Non officia in magnam repellat</li>\r\n</ul>\r\n<h5>Excepturi qui tenetur praesentium sit quo. Quia ab magnam voluptatem harum quia dolores. Adipisci quaerat est quis quam qui similique</h5>\r\n<blockquote><a title=\"Et et quia officiis.\" href=\"http://www.herzog.com/non-voluptas-ut-expedita-illo-possimus\">Repellendus asperiores earum eligendi sed.</a> est qui eveniet inventore delectus Vel iste qui optio ratione Alias <a title=\"Earum libero.\" href=\"http://watsica.org/\">ut aspernatur quia</a> quia. Debitis placeat ipsa itaque natus alias. placeat rerum ad voluptatem. Reiciendis quas est dolores. Magni <a title=\"Repellendus eaque ad ipsum.\" href=\"http://www.wintheiser.com/\">rerum quaerat.</a> at dolor suscipit eos. Doloribus perferendis voluptas debitis ut. Exercitationem sit id voluptas Eos quis sit id temporibus. Debitis <a title=\"Quia ratione omnis cupiditate et.\" href=\"http://www.altenwerth.org/\">at nihil cum qui necessitatibus. Sequi voluptatem</a> cumque aut quos omnis omnis <a title=\"Quo tempora nam.\" href=\"https://www.blick.biz/sapiente-tenetur-vel-veniam-quos-dolorum\">Ipsam aut tenetur reiciendis</a></blockquote>\r\n<h4>Asperiores ut ut eligendi est totam quia</h4>\r\n<ol>\r\n 	<li>Est architecto quam ut</li>\r\n 	<li>Vel ut impedit placeat</li>\r\n 	<li>Minima ea nostrum optio</li>\r\n 	<li>Sint et nisi ut sed ipsa nemo</li>\r\n 	<li>Et veniam fugiat aut nesciunt maiores non</li>\r\n 	<li>Aut et nihil sit alias</li>\r\n 	<li>Vero labore id amet nesciunt</li>\r\n</ol>', 'Dolor veritatis veniam quos', '', 'inherit', 'closed', 'closed', '', '43-revision-v1', '', '', '2017-09-14 09:20:42', '2017-09-14 09:20:42', '', 43, 'http://localhost/udemy/2017/09/14/43-revision-v1/', 0, 'revision', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(100, 1, '2017-09-14 09:23:43', '2017-09-14 09:23:43', 'https://www.youtube.com/watch?v=MsFdaLIGyas/\r\n\r\nNon voluptatem enim id consectetur distinctio. Enim corporis impedit corporis earum magnam. Soluta nisi et eos qui. Est modi tempore est ut dicta.\r\n\r\n<img src=\"http://localhost/udemy/wp-content/uploads/2017/08/8bdb5f1c-cd6d-34ad-a270-616b0962b5ad.jpg\" />\r\n\r\nTotam ipsam quia explicabo ab et nisi. Consequatur et vero <a title=\"Neque tenetur est.\" href=\"http://dickinson.com/vel-possimus-quos-dolores\">quas</a> enim. Dignissimos <a title=\"Magni ut placeat quisquam harum.\" href=\"http://auer.com/hic-vel-molestias-eveniet-occaecati\">rerum culpa autem autem. Similique</a> rerum odit vero dolor quo. Numquam repellat et cumque eum. Ea nobis sequi tempora ipsa. molestias unde minus et quia sint. ea doloremque vel quo asperiores. Ipsum provident vitae <a title=\"Ducimus similique quas eveniet.\" href=\"http://brekke.com/\">laborum dolores rerum ipsum. Accusamus</a> eaque sit reprehenderit. Explicabo autem vitae dolores et Assumenda dicta excepturi voluptatem <a title=\"Consequuntur et omnis voluptas.\" href=\"http://www.muller.com/natus-velit-omnis-sed-animi-vitae\">Blanditiis autem officia</a> facilis. <a title=\"Nihil aliquid velit.\" href=\"http://www.watsica.com/eveniet-omnis-nobis-ipsam-itaque-et-et-iste\">non natus est error. Error</a> eligendi quod. cupiditate asperiores sint exercitationem eos. Nostrum aut quis labore ex dolor. Praesentium consequuntur nemo aspernatur id et. Laudantium est praesentium deserunt dolorum in laborum.\r\n<h2>Odit autem numquam id quis architecto. Deleniti ex iure odio sed impedit rem. Molestias vel molestias totam nemo dicta labore</h2>\r\n<blockquote><a title=\"Vel cumque sed.\" href=\"http://www.bailey.biz/consequatur-autem-mollitia-reprehenderit-amet-a-voluptatum.html\">Distinctio molestiae magnam eos nobis</a> Incidunt minima voluptatem quis omnis qui rerum. Blanditiis quis quo ea modi ipsum. qui maxime voluptatibus eos quos laboriosam. Nam officia ducimus asperiores. aut molestiae aut rerum Vitae itaque rerum beatae. Reiciendis explicabo maiores minus est. Debitis odio perferendis vero. perspiciatis est culpa nobis Vel omnis quidem officiis. Quis ut autem repellendus fugit consequuntur. Dolores officia dignissimos voluptate Enim dolores distinctio eaque accusamus qui inventore. Ea perspiciatis dignissimos labore ut alias. Consequatur nemo omnis repellat consequatur voluptas. inventore qui expedita. aliquid soluta atque dignissimos. rerum perspiciatis adipisci rerum soluta. Possimus quia repudiandae aut. esse id ullam enim sed sint. Maxime unde quae Odit eum voluptate cupiditate ea tenetur Accusantium voluptatem quas in pariatur. Non consequatur <a title=\"Laborum ut quisquam.\" href=\"https://www.hauck.com/molestiae-saepe-nihil-similique-ea-blanditiis-vitae-temporibus-earum\">ut</a> enim.</blockquote>\r\nOmnis quaerat a laudantium Voluptas asperiores dolores et velit voluptas Ut distinctio nam corrupti sint voluptatem quo. Consequuntur aut fugiat ullam. Voluptas laborum sunt est et sapiente et. officia pariatur voluptates quo incidunt. Laboriosam voluptas enim at voluptas Porro dolore cum officiis iusto. eum cupiditate nemo et ut sapiente quidem. autem et nulla et Explicabo enim sapiente repellat laborum voluptates. magni minus doloremque numquam saepe. Earum eaque necessitatibus veritatis magni est Quia maxime magni optio atque amet velit doloremque. Repellat quos maxime adipisci nobis ullam. voluptatem iusto autem laboriosam nisi alias. Reprehenderit reiciendis aut est Et iusto est commodi <a title=\"Ratione ea.\" href=\"http://www.spencer.com/\">et.</a> eum blanditiis dolorem Sed earum aliquam excepturi Iusto quam at ad et voluptates. Autem dolor in. laboriosam consequatur qui non a. Amet voluptas consequatur id commodi consequuntur beatae. Nihil et ab Omnis id aliquid Omnis rerum quae illo enim cupiditate. omnis sequi. Libero excepturi veritatis quia suscipit ut. Deserunt velit quo Atque veniam et repellat architecto. totam itaque fugiat quibusdam. Dignissimos numquam quos dolore. Nobis minima repudiandae ut at. Omnis qui illum illum. Nihil et ut. Qui dignissimos facilis sit consequatur. eligendi laborum architecto dolores. tempora in itaque cupiditate. Qui sint consequatur tenetur ipsum. Accusamus quia quam et consequuntur neque quisquam. Ipsum autem esse consequuntur dolor commodi rerum. animi voluptatum et blanditiis rerum voluptatem. Neque error est quia possimus voluptas. Est debitis voluptatibus fugiat. Quos dignissimos omnis explicabo vero aspernatur.\r\n<h6>Distinctio consequatur exercitationem et vel aut animi dolorem quam. Laboriosam pariatur deserunt harum</h6>\r\n<ol>\r\n 	<li>Rerum ratione placeat et</li>\r\n 	<li>Sit sapiente consequatur cum</li>\r\n 	<li>Est enim saepe libero vero</li>\r\n 	<li>Unde aut</li>\r\n 	<li>Dolore sed quos sit omnis quibusdam qui</li>\r\n</ol>\r\n<!--more-->\r\n<blockquote>Est quas accusantium exercitationem sed Beatae dicta sint rerum corporis magnam voluptatum. Quia error eius ut facere. Reiciendis voluptate non enim quia a. <a title=\"Qui porro ut aut dignissimos.\" href=\"http://hackett.com/sunt-nemo-dolorum-nobis-dolorum-unde-consequatur\">sunt</a> qui vel quos. Enim non sapiente impedit. Quas voluptates quam. vitae et maiores iure adipisci sed. Aut veritatis corrupti occaecati consequuntur. Iusto necessitatibus ullam aut officia. ipsam ullam enim aspernatur Earum natus corporis alias qui id nihil. Enim praesentium sit repudiandae a. nobis rerum repudiandae cumque at ullam possimus. Provident saepe soluta dolore Deserunt vero voluptatem fuga. Cupiditate neque minus harum molestiae beatae. Id ratione veritatis libero eligendi sed. Explicabo quasi eos adipisci. quidem consequuntur omnis quam eligendi non facilis. Dolorum pariatur aut quis laborum impedit atque. Qui hic id sapiente doloremque commodi quisquam. Aut voluptatem illum velit perferendis id Occaecati quam dolore vel vitae et voluptatum dolor. Earum ullam et quasi.</blockquote>\r\n\r\n<hr />\r\n\r\nTempora laudantium quo officia aperiam. Dolorem cum quas vitae. Debitis maxime animi minima reprehenderit eos consectetur. Eaque explicabo saepe pariatur nobis. Iure consequatur perferendis consequatur ducimus tempora excepturi. Accusantium corporis rerum excepturi aut alias. Dolores impedit alias facere ut eius. Impedit aut impedit atque. Non laudantium et illo quam molestiae enim vel. Sint cupiditate ullam ipsum et. Suscipit ullam nihil excepturi facere eveniet nobis. Ipsa libero placeat sunt autem. Assumenda doloribus id nam qui magnam. Nihil voluptate sit ullam. Rerum qui quo magni corrupti. Est porro est iure consequatur perferendis nihil dolorem. Vel facere qui aut suscipit. Enim et dolores doloremque quia. Eos iure aut inventore. Minus libero inventore laboriosam sequi qui. Animi facere officiis voluptates architecto magni odio. Perspiciatis autem corrupti sapiente aliquam reprehenderit delectus labore. Voluptatem suscipit quos aut voluptas odio atque harum. Aut iure quis quo est velit. Sunt recusandae ipsum quidem neque nihil in. Illo ut sint rem est. Quis et quam id voluptatibus labore. Sunt ea similique illum. Illum aut praesentium dolorem dolores aliquid quis ipsam necessitatibus.\r\n<h4>Eius aperiam odio exercitationem voluptate vel officia. Inventore doloribus deleniti totam qui ullam dolor. Dignissimos nulla ullam nesciunt et libero</h4>\r\n<ul>\r\n 	<li>Sint quis similique laboriosam</li>\r\n 	<li>Voluptates magni et deserunt voluptate enim</li>\r\n 	<li>Iste eius quo ipsa mollitia</li>\r\n 	<li>Non officia in magnam repellat</li>\r\n</ul>\r\n<h5>Excepturi qui tenetur praesentium sit quo. Quia ab magnam voluptatem harum quia dolores. Adipisci quaerat est quis quam qui similique</h5>\r\n<blockquote><a title=\"Et et quia officiis.\" href=\"http://www.herzog.com/non-voluptas-ut-expedita-illo-possimus\">Repellendus asperiores earum eligendi sed.</a> est qui eveniet inventore delectus Vel iste qui optio ratione Alias <a title=\"Earum libero.\" href=\"http://watsica.org/\">ut aspernatur quia</a> quia. Debitis placeat ipsa itaque natus alias. placeat rerum ad voluptatem. Reiciendis quas est dolores. Magni <a title=\"Repellendus eaque ad ipsum.\" href=\"http://www.wintheiser.com/\">rerum quaerat.</a> at dolor suscipit eos. Doloribus perferendis voluptas debitis ut. Exercitationem sit id voluptas Eos quis sit id temporibus. Debitis <a title=\"Quia ratione omnis cupiditate et.\" href=\"http://www.altenwerth.org/\">at nihil cum qui necessitatibus. Sequi voluptatem</a> cumque aut quos omnis omnis <a title=\"Quo tempora nam.\" href=\"https://www.blick.biz/sapiente-tenetur-vel-veniam-quos-dolorum\">Ipsam aut tenetur reiciendis</a></blockquote>\r\n<h4>Asperiores ut ut eligendi est totam quia</h4>\r\n<ol>\r\n 	<li>Est architecto quam ut</li>\r\n 	<li>Vel ut impedit placeat</li>\r\n 	<li>Minima ea nostrum optio</li>\r\n 	<li>Sint et nisi ut sed ipsa nemo</li>\r\n 	<li>Et veniam fugiat aut nesciunt maiores non</li>\r\n 	<li>Aut et nihil sit alias</li>\r\n 	<li>Vero labore id amet nesciunt</li>\r\n</ol>', 'Dolor veritatis veniam quos', '', 'inherit', 'closed', 'closed', '', '43-revision-v1', '', '', '2017-09-14 09:23:43', '2017-09-14 09:23:43', '', 43, 'http://localhost/udemy/2017/09/14/43-revision-v1/', 0, 'revision', '', 0),
(101, 1, '2017-09-16 10:03:29', '2017-09-16 10:03:29', 'https://www.youtube.com/watch?v=zZ_mlaKmUfk\r\n<a title=\"Quidem.\" href=\"https://www.dibbert.com/magnam-quo-fugit-ex-tempora-sed-aut-ut-est\">Expedita rerum voluptas amet et</a> <a title=\"Aspernatur.\" href=\"http://www.block.org/\">quo aspernatur</a> Est sunt <a title=\"Sed vel dignissimos ea repudiandae omnis ut.\" href=\"http://sipes.org/quo-eaque-consectetur-est-autem-illum-consectetur-odit\">ipsam. Nam</a> <a title=\"Voluptates est fugiat.\" href=\"http://www.ryan.biz/labore-consequatur-distinctio-maiores-aut-earum.html\">corrupti rerum. Quia commodi id quia</a> <a title=\"Reiciendis deserunt ducimus sed vel.\" href=\"https://www.dare.com/enim-molestiae-earum-cupiditate-facilis\">debitis expedita quidem. Quia</a> <a title=\"Voluptate quibusdam illo consequatur.\" href=\"http://hirthe.biz/\">cumque ut.</a> <a title=\"Provident itaque dolorem est doloremque minus natus recusandae ea.\" href=\"http://www.hettinger.info/quam-fuga-qui-molestiae-ut\">recusandae facilis quas molestias maxime</a> <a title=\"Iste.\" href=\"http://www.bergstrom.com/molestiae-ut-voluptates-nihil-saepe\">est. Aut iusto asperiores</a> <a title=\"Quo aut velit.\" href=\"http://boyer.biz/dignissimos-id-facilis-molestiae\">aperiam et qui non molestiae.</a>\r\n<h5>Aut minus sequi sequi totam similique tempora</h5>\r\n<ul>\r\n 	<li>Nihil deleniti</li>\r\n 	<li>Iste error excepturi sint voluptatibus velit</li>\r\n</ul>\r\n<h2>Tempora similique perferendis itaque est nisi et. Nostrum quisquam quas ut ad possimus quibusdam aut. Et id doloribus eveniet itaque</h2>\r\n<!--more-->\r\n<ul>\r\n 	<li>Qui et et</li>\r\n 	<li>Et corporis quia rem quia</li>\r\n 	<li>Voluptate nulla temporibus modi veniam</li>\r\n 	<li>Aut consequatur aut rem</li>\r\n 	<li>Et illum sequi et eius</li>\r\n 	<li>Rem quam incidunt et</li>\r\n 	<li>Odio minus sequi ipsam voluptatibus</li>\r\n 	<li>Laborum ab aut perspiciatis</li>\r\n</ul>\r\n<h3>Quod officia in qui vel qui ipsum. Nam libero voluptatem officia officiis</h3>\r\n<ol>\r\n 	<li>Quia assumenda dolores ut sunt quis</li>\r\n 	<li>Facilis odio maxime facilis nihil</li>\r\n 	<li>Aut aut eveniet libero nihil modi tempora eius rerum</li>\r\n 	<li>Sit aut dolor</li>\r\n 	<li>Saepe deserunt pariatur deserunt id</li>\r\n 	<li>Sit dicta</li>\r\n 	<li>Architecto</li>\r\n 	<li>Corporis qui</li>\r\n</ol>\r\nQuo aliquid adipisci laudantium <a title=\"Ipsa et laboriosam veritatis et.\" href=\"http://www.volkman.com/temporibus-voluptatem-hic-quia-rerum-quod-nihil-totam\">ut esse facilis</a> Itaque minima nesciunt impedit modi. Placeat perferendis nisi animi. Modi non et amet aliquid. Ipsum enim est vel rerum. Et odio in amet. Tempora asperiores tempora tenetur. Consequatur illo ipsum error nobis Illum voluptatem nulla iste. Nisi reprehenderit laboriosam provident enim Quam ratione at est aut. Et ut <a title=\"Asperiores vel doloribus.\" href=\"http://dubuque.com/aspernatur-atque-perferendis-officia-vero-magni-id.html\">Beatae debitis</a> rem vel alias A ut nisi est soluta est. Iure eligendi <a title=\"Illum consequatur veniam ullam recusandae ullam libero.\" href=\"http://bednar.info/porro-delectus-ea-qui-et-commodi-optio-iure.html\">molestiae earum libero natus debitis. Laudantium ut modi</a> et qui facere Dolores id eaque dolorem. Nesciunt voluptatem sed. <a title=\"Veritatis delectus.\" href=\"http://rau.net/eum-ut-nisi-eos-voluptas-neque-animi-sapiente.html\">quasi deserunt enim</a> sit alias. Quod laborum itaque assumenda debitis. aut libero rerum veritatis rerum ut. sed consequatur libero assumenda quam Voluptate aliquid porro deleniti ut et distinctio consequuntur. Voluptatem aut et qui molestias. praesentium ut aut ea.\r\n\r\nVero cum dolor distinctio <a title=\"Quia ut nesciunt aut molestiae pariatur amet.\" href=\"http://www.rogahn.info/ipsa-est-ut-quidem-voluptatibus.html\">inventore enim. Quae quam iusto odit vel et odio</a> <a title=\"Omnis reprehenderit.\" href=\"http://www.zieme.com/placeat-quos-quasi-voluptatum-eos-voluptas.html\">necessitatibus. Voluptates</a> qui atque doloremque esse.', 'Aliquam qui laudantium exercitationem', 'Quo asperiores sit expedita ea tempora beatae vel dolor omnis magni quia odio quos soluta labore neque est fugiat blanditiis ipsa rerum corrupti autem autem ab numquam enim nam accusamus ipsam voluptatibus sit animi enim doloribus impedit deserunt magni molestiae odio ipsam fugiat quaerat eveniet expedita quam alias ut sunt qui fugiat natus possimus aut voluptas recusandae sint.\r\n\r\nUt et qui placeat et qui voluptas in nihil architecto et ducimus quo eum dolorem nostrum quo soluta minima dicta autem voluptatem provident impedit repellat quae ex maxime nisi sed consectetur laborum nostrum maxime odio culpa suscipit accusamus molestias est amet deserunt necessitatibus sed est iure sapiente eius ipsa quo veritatis debitis sit accusamus et hic ut recusandae dolore ad quibusdam ut suscipit eos amet ipsa quae nobis dignissimos quo qui dolor est optio inventore aliquam qui quisquam vero deleniti.', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2017-09-16 10:03:29', '2017-09-16 10:03:29', '', 9, 'http://localhost/udemy/2017/09/16/9-revision-v1/', 0, 'revision', '', 0),
(102, 1, '2017-09-16 10:06:21', '2017-09-16 10:06:21', 'https://soundcloud.com/elif-kaya/sean-bay-vs-mehdi-mouelhi-feat\r\n<h2>Voluptatum repudiandae a dolores perspiciatis expedita quia est. Accusantium fugiat asperiores expedita ut omnis officia non</h2>\r\n\r\n<hr />\r\n\r\n<h6>Et quia est possimus est non natus</h6>\r\n<ol>\r\n 	<li>Excepturi eaque</li>\r\n 	<li>Nihil soluta ut deleniti quam</li>\r\n 	<li>Velit autem et earum officia</li>\r\n</ol>\r\n\r\n<hr />\r\n\r\n<!--more-->\r\n<h5>Et voluptate aut ullam aut. Aut est tempore rerum eius et voluptas rerum aut. Dolor commodi tempora exercitationem enim</h5>\r\n<blockquote>Voluptatum sit quibusdam fugit sunt quia. Eveniet iure et excepturi voluptatem. Facere suscipit asperiores cumque quia iusto rerum. Tempore et eos vitae. Ad dicta nemo et non sint. Occaecati molestiae et facilis illo ratione voluptatum voluptatibus. Atque corrupti quibusdam enim <a title=\"Delectus.\" href=\"http://www.hoppe.com/\">nesciunt</a> Aut sed ut adipisci quis saepe. voluptatem architecto minus porro et. Quaerat distinctio dolores hic dolor eaque. quisquam quos dignissimos dolor odio. doloremque voluptatem omnis dolores qui rerum. aperiam dolor omnis odio aspernatur dolor molestias. quod sunt sapiente rem. suscipit ut eligendi totam Possimus necessitatibus maxime nulla et quia. voluptate asperiores doloremque Officia corporis rerum dolor et et. Id velit eos dolores odit unde dignissimos. Quae enim enim quisquam dolores Et accusantium quis omnis dolor sint voluptate. Sint expedita quibusdam cumque sint harum optio. Quasi ab itaque. Harum qui dolores dolorum quia. laboriosam id vel optio cupiditate. consequuntur possimus omnis et omnis eaque. Sunt ducimus sit <a title=\"Delectus itaque illum.\" href=\"https://www.zemlak.com/consequatur-sit-rem-accusantium-autem-quos\">nemo. Commodi ducimus possimus rem</a> ullam cumque Facilis labore ut ea vel quia dicta quidem. ratione enim occaecati vero inventore iure. Labore odio rem quo Vero quaerat enim distinctio dolore vel Distinctio ratione quaerat rerum sit. Omnis nisi ducimus rerum repellat vel et.</blockquote>', 'Omnis asperiores voluptatem suscipit ut nisi', 'Sapiente nam est beatae ipsa dolor iusto ea similique et nobis aut voluptas minus sunt quia repudiandae officiis eius et labore eligendi iusto molestias voluptatem a natus aut non voluptatem aliquam porro quis voluptate officiis et magnam sed ad officia nihil molestias voluptas.', 'inherit', 'closed', 'closed', '', '4-revision-v1', '', '', '2017-09-16 10:06:21', '2017-09-16 10:06:21', '', 4, 'http://localhost/udemy/2017/09/16/4-revision-v1/', 0, 'revision', '', 0),
(103, 1, '2017-09-16 10:07:39', '2017-09-16 10:07:39', '\r\n<h2>Voluptatum repudiandae a dolores perspiciatis expedita quia est. Accusantium fugiat asperiores expedita ut omnis officia non</h2>\r\n\r\n<hr />\r\n\r\n<h6>Et quia est possimus est non natus</h6>\r\n<ol>\r\n 	<li>Excepturi eaque</li>\r\n 	<li>Nihil soluta ut deleniti quam</li>\r\n 	<li>Velit autem et earum officia</li>\r\n</ol>\r\n\r\n<hr />\r\n\r\n<!--more-->\r\n<h5>Et voluptate aut ullam aut. Aut est tempore rerum eius et voluptas rerum aut. Dolor commodi tempora exercitationem enim</h5>\r\n<blockquote>Voluptatum sit quibusdam fugit sunt quia. Eveniet iure et excepturi voluptatem. Facere suscipit asperiores cumque quia iusto rerum. Tempore et eos vitae. Ad dicta nemo et non sint. Occaecati molestiae et facilis illo ratione voluptatum voluptatibus. Atque corrupti quibusdam enim <a title=\"Delectus.\" href=\"http://www.hoppe.com/\">nesciunt</a> Aut sed ut adipisci quis saepe. voluptatem architecto minus porro et. Quaerat distinctio dolores hic dolor eaque. quisquam quos dignissimos dolor odio. doloremque voluptatem omnis dolores qui rerum. aperiam dolor omnis odio aspernatur dolor molestias. quod sunt sapiente rem. suscipit ut eligendi totam Possimus necessitatibus maxime nulla et quia. voluptate asperiores doloremque Officia corporis rerum dolor et et. Id velit eos dolores odit unde dignissimos. Quae enim enim quisquam dolores Et accusantium quis omnis dolor sint voluptate. Sint expedita quibusdam cumque sint harum optio. Quasi ab itaque. Harum qui dolores dolorum quia. laboriosam id vel optio cupiditate. consequuntur possimus omnis et omnis eaque. Sunt ducimus sit <a title=\"Delectus itaque illum.\" href=\"https://www.zemlak.com/consequatur-sit-rem-accusantium-autem-quos\">nemo. Commodi ducimus possimus rem</a> ullam cumque Facilis labore ut ea vel quia dicta quidem. ratione enim occaecati vero inventore iure. Labore odio rem quo Vero quaerat enim distinctio dolore vel Distinctio ratione quaerat rerum sit. Omnis nisi ducimus rerum repellat vel et.</blockquote>', 'Omnis asperiores voluptatem suscipit ut nisi', 'Sapiente nam est beatae ipsa dolor iusto ea similique et nobis aut voluptas minus sunt quia repudiandae officiis eius et labore eligendi iusto molestias voluptatem a natus aut non voluptatem aliquam porro quis voluptate officiis et magnam sed ad officia nihil molestias voluptas.', 'inherit', 'closed', 'closed', '', '4-revision-v1', '', '', '2017-09-16 10:07:39', '2017-09-16 10:07:39', '', 4, 'http://localhost/udemy/2017/09/16/4-revision-v1/', 0, 'revision', '', 0),
(104, 1, '2017-09-16 10:09:56', '2017-09-16 10:09:56', '\r\n\r\nNon voluptatem enim id consectetur distinctio. Enim corporis impedit corporis earum magnam. Soluta nisi et eos qui. Est modi tempore est ut dicta.\r\n\r\n<img src=\"http://localhost/udemy/wp-content/uploads/2017/08/8bdb5f1c-cd6d-34ad-a270-616b0962b5ad.jpg\" />\r\n\r\nTotam ipsam quia explicabo ab et nisi. Consequatur et vero <a title=\"Neque tenetur est.\" href=\"http://dickinson.com/vel-possimus-quos-dolores\">quas</a> enim. Dignissimos <a title=\"Magni ut placeat quisquam harum.\" href=\"http://auer.com/hic-vel-molestias-eveniet-occaecati\">rerum culpa autem autem. Similique</a> rerum odit vero dolor quo. Numquam repellat et cumque eum. Ea nobis sequi tempora ipsa. molestias unde minus et quia sint. ea doloremque vel quo asperiores. Ipsum provident vitae <a title=\"Ducimus similique quas eveniet.\" href=\"http://brekke.com/\">laborum dolores rerum ipsum. Accusamus</a> eaque sit reprehenderit. Explicabo autem vitae dolores et Assumenda dicta excepturi voluptatem <a title=\"Consequuntur et omnis voluptas.\" href=\"http://www.muller.com/natus-velit-omnis-sed-animi-vitae\">Blanditiis autem officia</a> facilis. <a title=\"Nihil aliquid velit.\" href=\"http://www.watsica.com/eveniet-omnis-nobis-ipsam-itaque-et-et-iste\">non natus est error. Error</a> eligendi quod. cupiditate asperiores sint exercitationem eos. Nostrum aut quis labore ex dolor. Praesentium consequuntur nemo aspernatur id et. Laudantium est praesentium deserunt dolorum in laborum.\r\n<h2>Odit autem numquam id quis architecto. Deleniti ex iure odio sed impedit rem. Molestias vel molestias totam nemo dicta labore</h2>\r\n<blockquote><a title=\"Vel cumque sed.\" href=\"http://www.bailey.biz/consequatur-autem-mollitia-reprehenderit-amet-a-voluptatum.html\">Distinctio molestiae magnam eos nobis</a> Incidunt minima voluptatem quis omnis qui rerum. Blanditiis quis quo ea modi ipsum. qui maxime voluptatibus eos quos laboriosam. Nam officia ducimus asperiores. aut molestiae aut rerum Vitae itaque rerum beatae. Reiciendis explicabo maiores minus est. Debitis odio perferendis vero. perspiciatis est culpa nobis Vel omnis quidem officiis. Quis ut autem repellendus fugit consequuntur. Dolores officia dignissimos voluptate Enim dolores distinctio eaque accusamus qui inventore. Ea perspiciatis dignissimos labore ut alias. Consequatur nemo omnis repellat consequatur voluptas. inventore qui expedita. aliquid soluta atque dignissimos. rerum perspiciatis adipisci rerum soluta. Possimus quia repudiandae aut. esse id ullam enim sed sint. Maxime unde quae Odit eum voluptate cupiditate ea tenetur Accusantium voluptatem quas in pariatur. Non consequatur <a title=\"Laborum ut quisquam.\" href=\"https://www.hauck.com/molestiae-saepe-nihil-similique-ea-blanditiis-vitae-temporibus-earum\">ut</a> enim.</blockquote>\r\nOmnis quaerat a laudantium Voluptas asperiores dolores et velit voluptas Ut distinctio nam corrupti sint voluptatem quo. Consequuntur aut fugiat ullam. Voluptas laborum sunt est et sapiente et. officia pariatur voluptates quo incidunt. Laboriosam voluptas enim at voluptas Porro dolore cum officiis iusto. eum cupiditate nemo et ut sapiente quidem. autem et nulla et Explicabo enim sapiente repellat laborum voluptates. magni minus doloremque numquam saepe. Earum eaque necessitatibus veritatis magni est Quia maxime magni optio atque amet velit doloremque. Repellat quos maxime adipisci nobis ullam. voluptatem iusto autem laboriosam nisi alias. Reprehenderit reiciendis aut est Et iusto est commodi <a title=\"Ratione ea.\" href=\"http://www.spencer.com/\">et.</a> eum blanditiis dolorem Sed earum aliquam excepturi Iusto quam at ad et voluptates. Autem dolor in. laboriosam consequatur qui non a. Amet voluptas consequatur id commodi consequuntur beatae. Nihil et ab Omnis id aliquid Omnis rerum quae illo enim cupiditate. omnis sequi. Libero excepturi veritatis quia suscipit ut. Deserunt velit quo Atque veniam et repellat architecto. totam itaque fugiat quibusdam. Dignissimos numquam quos dolore. Nobis minima repudiandae ut at. Omnis qui illum illum. Nihil et ut. Qui dignissimos facilis sit consequatur. eligendi laborum architecto dolores. tempora in itaque cupiditate. Qui sint consequatur tenetur ipsum. Accusamus quia quam et consequuntur neque quisquam. Ipsum autem esse consequuntur dolor commodi rerum. animi voluptatum et blanditiis rerum voluptatem. Neque error est quia possimus voluptas. Est debitis voluptatibus fugiat. Quos dignissimos omnis explicabo vero aspernatur.\r\n<h6>Distinctio consequatur exercitationem et vel aut animi dolorem quam. Laboriosam pariatur deserunt harum</h6>\r\n<ol>\r\n 	<li>Rerum ratione placeat et</li>\r\n 	<li>Sit sapiente consequatur cum</li>\r\n 	<li>Est enim saepe libero vero</li>\r\n 	<li>Unde aut</li>\r\n 	<li>Dolore sed quos sit omnis quibusdam qui</li>\r\n</ol>\r\n<!--more-->\r\n<blockquote>Est quas accusantium exercitationem sed Beatae dicta sint rerum corporis magnam voluptatum. Quia error eius ut facere. Reiciendis voluptate non enim quia a. <a title=\"Qui porro ut aut dignissimos.\" href=\"http://hackett.com/sunt-nemo-dolorum-nobis-dolorum-unde-consequatur\">sunt</a> qui vel quos. Enim non sapiente impedit. Quas voluptates quam. vitae et maiores iure adipisci sed. Aut veritatis corrupti occaecati consequuntur. Iusto necessitatibus ullam aut officia. ipsam ullam enim aspernatur Earum natus corporis alias qui id nihil. Enim praesentium sit repudiandae a. nobis rerum repudiandae cumque at ullam possimus. Provident saepe soluta dolore Deserunt vero voluptatem fuga. Cupiditate neque minus harum molestiae beatae. Id ratione veritatis libero eligendi sed. Explicabo quasi eos adipisci. quidem consequuntur omnis quam eligendi non facilis. Dolorum pariatur aut quis laborum impedit atque. Qui hic id sapiente doloremque commodi quisquam. Aut voluptatem illum velit perferendis id Occaecati quam dolore vel vitae et voluptatum dolor. Earum ullam et quasi.</blockquote>\r\n\r\n<hr />\r\n\r\nTempora laudantium quo officia aperiam. Dolorem cum quas vitae. Debitis maxime animi minima reprehenderit eos consectetur. Eaque explicabo saepe pariatur nobis. Iure consequatur perferendis consequatur ducimus tempora excepturi. Accusantium corporis rerum excepturi aut alias. Dolores impedit alias facere ut eius. Impedit aut impedit atque. Non laudantium et illo quam molestiae enim vel. Sint cupiditate ullam ipsum et. Suscipit ullam nihil excepturi facere eveniet nobis. Ipsa libero placeat sunt autem. Assumenda doloribus id nam qui magnam. Nihil voluptate sit ullam. Rerum qui quo magni corrupti. Est porro est iure consequatur perferendis nihil dolorem. Vel facere qui aut suscipit. Enim et dolores doloremque quia. Eos iure aut inventore. Minus libero inventore laboriosam sequi qui. Animi facere officiis voluptates architecto magni odio. Perspiciatis autem corrupti sapiente aliquam reprehenderit delectus labore. Voluptatem suscipit quos aut voluptas odio atque harum. Aut iure quis quo est velit. Sunt recusandae ipsum quidem neque nihil in. Illo ut sint rem est. Quis et quam id voluptatibus labore. Sunt ea similique illum. Illum aut praesentium dolorem dolores aliquid quis ipsam necessitatibus.\r\n<h4>Eius aperiam odio exercitationem voluptate vel officia. Inventore doloribus deleniti totam qui ullam dolor. Dignissimos nulla ullam nesciunt et libero</h4>\r\n<ul>\r\n 	<li>Sint quis similique laboriosam</li>\r\n 	<li>Voluptates magni et deserunt voluptate enim</li>\r\n 	<li>Iste eius quo ipsa mollitia</li>\r\n 	<li>Non officia in magnam repellat</li>\r\n</ul>\r\n<h5>Excepturi qui tenetur praesentium sit quo. Quia ab magnam voluptatem harum quia dolores. Adipisci quaerat est quis quam qui similique</h5>\r\n<blockquote><a title=\"Et et quia officiis.\" href=\"http://www.herzog.com/non-voluptas-ut-expedita-illo-possimus\">Repellendus asperiores earum eligendi sed.</a> est qui eveniet inventore delectus Vel iste qui optio ratione Alias <a title=\"Earum libero.\" href=\"http://watsica.org/\">ut aspernatur quia</a> quia. Debitis placeat ipsa itaque natus alias. placeat rerum ad voluptatem. Reiciendis quas est dolores. Magni <a title=\"Repellendus eaque ad ipsum.\" href=\"http://www.wintheiser.com/\">rerum quaerat.</a> at dolor suscipit eos. Doloribus perferendis voluptas debitis ut. Exercitationem sit id voluptas Eos quis sit id temporibus. Debitis <a title=\"Quia ratione omnis cupiditate et.\" href=\"http://www.altenwerth.org/\">at nihil cum qui necessitatibus. Sequi voluptatem</a> cumque aut quos omnis omnis <a title=\"Quo tempora nam.\" href=\"https://www.blick.biz/sapiente-tenetur-vel-veniam-quos-dolorum\">Ipsam aut tenetur reiciendis</a></blockquote>\r\n<h4>Asperiores ut ut eligendi est totam quia</h4>\r\n<ol>\r\n 	<li>Est architecto quam ut</li>\r\n 	<li>Vel ut impedit placeat</li>\r\n 	<li>Minima ea nostrum optio</li>\r\n 	<li>Sint et nisi ut sed ipsa nemo</li>\r\n 	<li>Et veniam fugiat aut nesciunt maiores non</li>\r\n 	<li>Aut et nihil sit alias</li>\r\n 	<li>Vero labore id amet nesciunt</li>\r\n</ol>', 'Dolor veritatis veniam quos', '', 'inherit', 'closed', 'closed', '', '43-revision-v1', '', '', '2017-09-16 10:09:56', '2017-09-16 10:09:56', '', 43, 'http://localhost/udemy/2017/09/16/43-revision-v1/', 0, 'revision', '', 0),
(105, 1, '2017-09-16 10:41:37', '2017-09-16 10:41:37', '[gallery ids=\"29,27,19,26,23,10,11\"]\r\nNon voluptatem enim id consectetur distinctio. Enim corporis impedit corporis earum magnam. Soluta nisi et eos qui. Est modi tempore est ut dicta.\r\n\r\n<img src=\"http://localhost/udemy/wp-content/uploads/2017/08/8bdb5f1c-cd6d-34ad-a270-616b0962b5ad.jpg\" />\r\n\r\nTotam ipsam quia explicabo ab et nisi. Consequatur et vero <a title=\"Neque tenetur est.\" href=\"http://dickinson.com/vel-possimus-quos-dolores\">quas</a> enim. Dignissimos <a title=\"Magni ut placeat quisquam harum.\" href=\"http://auer.com/hic-vel-molestias-eveniet-occaecati\">rerum culpa autem autem. Similique</a> rerum odit vero dolor quo. Numquam repellat et cumque eum. Ea nobis sequi tempora ipsa. molestias unde minus et quia sint. ea doloremque vel quo asperiores. Ipsum provident vitae <a title=\"Ducimus similique quas eveniet.\" href=\"http://brekke.com/\">laborum dolores rerum ipsum. Accusamus</a> eaque sit reprehenderit. Explicabo autem vitae dolores et Assumenda dicta excepturi voluptatem <a title=\"Consequuntur et omnis voluptas.\" href=\"http://www.muller.com/natus-velit-omnis-sed-animi-vitae\">Blanditiis autem officia</a> facilis. <a title=\"Nihil aliquid velit.\" href=\"http://www.watsica.com/eveniet-omnis-nobis-ipsam-itaque-et-et-iste\">non natus est error. Error</a> eligendi quod. cupiditate asperiores sint exercitationem eos. Nostrum aut quis labore ex dolor. Praesentium consequuntur nemo aspernatur id et. Laudantium est praesentium deserunt dolorum in laborum.\r\n<h2>Odit autem numquam id quis architecto. Deleniti ex iure odio sed impedit rem. Molestias vel molestias totam nemo dicta labore</h2>\r\n<blockquote><a title=\"Vel cumque sed.\" href=\"http://www.bailey.biz/consequatur-autem-mollitia-reprehenderit-amet-a-voluptatum.html\">Distinctio molestiae magnam eos nobis</a> Incidunt minima voluptatem quis omnis qui rerum. Blanditiis quis quo ea modi ipsum. qui maxime voluptatibus eos quos laboriosam. Nam officia ducimus asperiores. aut molestiae aut rerum Vitae itaque rerum beatae. Reiciendis explicabo maiores minus est. Debitis odio perferendis vero. perspiciatis est culpa nobis Vel omnis quidem officiis. Quis ut autem repellendus fugit consequuntur. Dolores officia dignissimos voluptate Enim dolores distinctio eaque accusamus qui inventore. Ea perspiciatis dignissimos labore ut alias. Consequatur nemo omnis repellat consequatur voluptas. inventore qui expedita. aliquid soluta atque dignissimos. rerum perspiciatis adipisci rerum soluta. Possimus quia repudiandae aut. esse id ullam enim sed sint. Maxime unde quae Odit eum voluptate cupiditate ea tenetur Accusantium voluptatem quas in pariatur. Non consequatur <a title=\"Laborum ut quisquam.\" href=\"https://www.hauck.com/molestiae-saepe-nihil-similique-ea-blanditiis-vitae-temporibus-earum\">ut</a> enim.</blockquote>\r\nOmnis quaerat a laudantium Voluptas asperiores dolores et velit voluptas Ut distinctio nam corrupti sint voluptatem quo. Consequuntur aut fugiat ullam. Voluptas laborum sunt est et sapiente et. officia pariatur voluptates quo incidunt. Laboriosam voluptas enim at voluptas Porro dolore cum officiis iusto. eum cupiditate nemo et ut sapiente quidem. autem et nulla et Explicabo enim sapiente repellat laborum voluptates. magni minus doloremque numquam saepe. Earum eaque necessitatibus veritatis magni est Quia maxime magni optio atque amet velit doloremque. Repellat quos maxime adipisci nobis ullam. voluptatem iusto autem laboriosam nisi alias. Reprehenderit reiciendis aut est Et iusto est commodi <a title=\"Ratione ea.\" href=\"http://www.spencer.com/\">et.</a> eum blanditiis dolorem Sed earum aliquam excepturi Iusto quam at ad et voluptates. Autem dolor in. laboriosam consequatur qui non a. Amet voluptas consequatur id commodi consequuntur beatae. Nihil et ab Omnis id aliquid Omnis rerum quae illo enim cupiditate. omnis sequi. Libero excepturi veritatis quia suscipit ut. Deserunt velit quo Atque veniam et repellat architecto. totam itaque fugiat quibusdam. Dignissimos numquam quos dolore. Nobis minima repudiandae ut at. Omnis qui illum illum. Nihil et ut. Qui dignissimos facilis sit consequatur. eligendi laborum architecto dolores. tempora in itaque cupiditate. Qui sint consequatur tenetur ipsum. Accusamus quia quam et consequuntur neque quisquam. Ipsum autem esse consequuntur dolor commodi rerum. animi voluptatum et blanditiis rerum voluptatem. Neque error est quia possimus voluptas. Est debitis voluptatibus fugiat. Quos dignissimos omnis explicabo vero aspernatur.\r\n<h6>Distinctio consequatur exercitationem et vel aut animi dolorem quam. Laboriosam pariatur deserunt harum</h6>\r\n<ol>\r\n 	<li>Rerum ratione placeat et</li>\r\n 	<li>Sit sapiente consequatur cum</li>\r\n 	<li>Est enim saepe libero vero</li>\r\n 	<li>Unde aut</li>\r\n 	<li>Dolore sed quos sit omnis quibusdam qui</li>\r\n</ol>\r\n<!--more-->\r\n<blockquote>Est quas accusantium exercitationem sed Beatae dicta sint rerum corporis magnam voluptatum. Quia error eius ut facere. Reiciendis voluptate non enim quia a. <a title=\"Qui porro ut aut dignissimos.\" href=\"http://hackett.com/sunt-nemo-dolorum-nobis-dolorum-unde-consequatur\">sunt</a> qui vel quos. Enim non sapiente impedit. Quas voluptates quam. vitae et maiores iure adipisci sed. Aut veritatis corrupti occaecati consequuntur. Iusto necessitatibus ullam aut officia. ipsam ullam enim aspernatur Earum natus corporis alias qui id nihil. Enim praesentium sit repudiandae a. nobis rerum repudiandae cumque at ullam possimus. Provident saepe soluta dolore Deserunt vero voluptatem fuga. Cupiditate neque minus harum molestiae beatae. Id ratione veritatis libero eligendi sed. Explicabo quasi eos adipisci. quidem consequuntur omnis quam eligendi non facilis. Dolorum pariatur aut quis laborum impedit atque. Qui hic id sapiente doloremque commodi quisquam. Aut voluptatem illum velit perferendis id Occaecati quam dolore vel vitae et voluptatum dolor. Earum ullam et quasi.</blockquote>\r\n\r\n<hr />\r\n\r\nTempora laudantium quo officia aperiam. Dolorem cum quas vitae. Debitis maxime animi minima reprehenderit eos consectetur. Eaque explicabo saepe pariatur nobis. Iure consequatur perferendis consequatur ducimus tempora excepturi. Accusantium corporis rerum excepturi aut alias. Dolores impedit alias facere ut eius. Impedit aut impedit atque. Non laudantium et illo quam molestiae enim vel. Sint cupiditate ullam ipsum et. Suscipit ullam nihil excepturi facere eveniet nobis. Ipsa libero placeat sunt autem. Assumenda doloribus id nam qui magnam. Nihil voluptate sit ullam. Rerum qui quo magni corrupti. Est porro est iure consequatur perferendis nihil dolorem. Vel facere qui aut suscipit. Enim et dolores doloremque quia. Eos iure aut inventore. Minus libero inventore laboriosam sequi qui. Animi facere officiis voluptates architecto magni odio. Perspiciatis autem corrupti sapiente aliquam reprehenderit delectus labore. Voluptatem suscipit quos aut voluptas odio atque harum. Aut iure quis quo est velit. Sunt recusandae ipsum quidem neque nihil in. Illo ut sint rem est. Quis et quam id voluptatibus labore. Sunt ea similique illum. Illum aut praesentium dolorem dolores aliquid quis ipsam necessitatibus.\r\n<h4>Eius aperiam odio exercitationem voluptate vel officia. Inventore doloribus deleniti totam qui ullam dolor. Dignissimos nulla ullam nesciunt et libero</h4>\r\n<ul>\r\n 	<li>Sint quis similique laboriosam</li>\r\n 	<li>Voluptates magni et deserunt voluptate enim</li>\r\n 	<li>Iste eius quo ipsa mollitia</li>\r\n 	<li>Non officia in magnam repellat</li>\r\n</ul>\r\n<h5>Excepturi qui tenetur praesentium sit quo. Quia ab magnam voluptatem harum quia dolores. Adipisci quaerat est quis quam qui similique</h5>\r\n<blockquote><a title=\"Et et quia officiis.\" href=\"http://www.herzog.com/non-voluptas-ut-expedita-illo-possimus\">Repellendus asperiores earum eligendi sed.</a> est qui eveniet inventore delectus Vel iste qui optio ratione Alias <a title=\"Earum libero.\" href=\"http://watsica.org/\">ut aspernatur quia</a> quia. Debitis placeat ipsa itaque natus alias. placeat rerum ad voluptatem. Reiciendis quas est dolores. Magni <a title=\"Repellendus eaque ad ipsum.\" href=\"http://www.wintheiser.com/\">rerum quaerat.</a> at dolor suscipit eos. Doloribus perferendis voluptas debitis ut. Exercitationem sit id voluptas Eos quis sit id temporibus. Debitis <a title=\"Quia ratione omnis cupiditate et.\" href=\"http://www.altenwerth.org/\">at nihil cum qui necessitatibus. Sequi voluptatem</a> cumque aut quos omnis omnis <a title=\"Quo tempora nam.\" href=\"https://www.blick.biz/sapiente-tenetur-vel-veniam-quos-dolorum\">Ipsam aut tenetur reiciendis</a></blockquote>\r\n<h4>Asperiores ut ut eligendi est totam quia</h4>\r\n<ol>\r\n 	<li>Est architecto quam ut</li>\r\n 	<li>Vel ut impedit placeat</li>\r\n 	<li>Minima ea nostrum optio</li>\r\n 	<li>Sint et nisi ut sed ipsa nemo</li>\r\n 	<li>Et veniam fugiat aut nesciunt maiores non</li>\r\n 	<li>Aut et nihil sit alias</li>\r\n 	<li>Vero labore id amet nesciunt</li>\r\n</ol>', 'Dolor veritatis veniam quos', '', 'inherit', 'closed', 'closed', '', '43-revision-v1', '', '', '2017-09-16 10:41:37', '2017-09-16 10:41:37', '', 43, 'http://localhost/udemy/2017/09/16/43-revision-v1/', 0, 'revision', '', 0),
(137, 1, '2017-09-22 10:08:51', '2017-09-22 10:08:51', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ornare odio vel iaculis porttitor. Nullam vestibulum congue egestas. Cras id feugiat diam. Ut non cursus arcu. Vivamus porta nibh lacus, vitae tincidunt ipsum rhoncus eu. Mauris faucibus felis ac diam volutpat, sit amet aliquet neque porttitor. Integer lacinia est convallis est fermentum, sit amet mollis sem semper. Donec at mi dui. Maecenas quis tortor augue. Suspendisse dapibus mi quis eros ornare, quis vestibulum leo malesuada.\r\n\r\nNulla blandit rutrum justo vel interdum. Integer hendrerit tellus nulla, ac porta ex fringilla sed. Fusce vitae augue est. Duis ut leo nisl. Proin euismod venenatis ex, eget pulvinar lectus blandit in. Maecenas at quam dignissim, pretium sem in, pellentesque magna. Quisque nec odio quam. Nulla dictum mollis nunc, ut tincidunt enim pretium sit amet. Maecenas non felis metus. Suspendisse id hendrerit dolor, gravida convallis neque. Fusce nec placerat lectus. Mauris vel nisl ac ipsum maximus scelerisque. Aliquam malesuada sollicitudin ornare. Nam iaculis sodales ligula at fringilla. Vivamus sagittis purus at felis hendrerit, a porta ipsum sagittis.', 'Cake', '', 'publish', 'closed', 'closed', '', 'cake', '', '', '2018-02-18 14:59:52', '2018-02-18 14:59:52', '', 0, 'http://localhost/udemy/?post_type=recipe&#038;p=137', 0, 'recipe', '', 0),
(139, 1, '2017-10-15 17:41:19', '2017-10-15 17:41:19', '[recipe_creator]', 'submit recipe', '', 'publish', 'closed', 'closed', '', 'submit-recipe', '', '', '2017-10-15 17:41:19', '2017-10-15 17:41:19', '', 0, 'http://localhost/udemy/?page_id=139', 0, 'page', '', 0),
(140, 1, '2017-10-15 17:41:19', '2017-10-15 17:41:19', '[recipe_creator]', 'submit recipe', '', 'inherit', 'closed', 'closed', '', '139-revision-v1', '', '', '2017-10-15 17:41:19', '2017-10-15 17:41:19', '', 139, 'http://localhost/udemy/139-revision-v1/', 0, 'revision', '', 0),
(141, 1, '2017-10-15 17:41:33', '2017-10-15 17:41:33', ' ', '', '', 'publish', 'closed', 'closed', '', '141', '', '', '2017-10-15 17:41:33', '2017-10-15 17:41:33', '', 0, 'http://localhost/udemy/?p=141', 3, 'nav_menu_item', '', 0),
(142, 1, '2017-10-15 17:42:11', '2017-10-15 17:42:11', ' ', '', '', 'publish', 'closed', 'closed', '', '142', '', '', '2018-02-28 20:47:56', '2018-02-28 20:47:56', '', 0, 'http://localhost/udemy/?p=142', 3, 'nav_menu_item', '', 0),
(146, 1, '2017-11-17 14:21:45', '2017-11-17 14:21:45', '[recipe_auth_form]', 'My Account', '', 'publish', 'closed', 'closed', '', 'my-account', '', '', '2017-11-17 14:23:42', '2017-11-17 14:23:42', '', 0, 'http://localhost/udemy/?page_id=146', 0, 'page', '', 0),
(147, 1, '2017-11-17 14:21:45', '2017-11-17 14:21:45', '[recipe_auth_form]', 'My Account', '', 'inherit', 'closed', 'closed', '', '146-revision-v1', '', '', '2017-11-17 14:21:45', '2017-11-17 14:21:45', '', 146, 'http://localhost/udemy/146-revision-v1/', 0, 'revision', '', 0),
(149, 1, '2017-11-24 12:56:34', '2017-11-24 12:56:34', ' ', '', '', 'publish', 'closed', 'closed', '', '149', '', '', '2018-02-28 20:47:57', '2018-02-28 20:47:57', '', 0, 'http://localhost/udemy/?p=149', 4, 'nav_menu_item', '', 0),
(151, 1, '2018-01-01 21:54:03', '2018-01-01 21:54:03', '\n		', 'test', '', 'publish', 'closed', 'closed', '', 'test', '', '', '2018-01-01 21:59:46', '2018-01-01 21:59:46', '', 0, 'http://localhost/udemy/?page_id=151', 0, 'page', '', 0),
(152, 1, '2018-01-01 21:54:03', '2018-01-01 21:54:03', '', 'test', '', 'inherit', 'closed', 'closed', '', '151-revision-v1', '', '', '2018-01-01 21:54:03', '2018-01-01 21:54:03', '', 151, 'http://localhost/udemy/151-revision-v1/', 0, 'revision', '', 0),
(153, 1, '2018-01-01 21:59:46', '2018-01-01 21:59:46', '\n		', 'test', '', 'inherit', 'closed', 'closed', '', '151-revision-v1', '', '', '2018-01-01 21:59:46', '2018-01-01 21:59:46', '', 151, 'http://localhost/udemy/151-revision-v1/', 0, 'revision', '', 0),
(155, 1, '2018-02-04 15:48:51', '2018-02-04 15:48:51', '<h1>page content</h1>\r\n\r\n[next-post]', 'testpage', '', 'publish', 'closed', 'closed', '', 'testpage', '', '', '2018-02-04 20:56:55', '2018-02-04 20:56:55', '', 0, 'http://localhost/udemy/?page_id=155', 0, 'page', '', 0),
(156, 1, '2018-02-04 15:48:51', '2018-02-04 15:48:51', '[next-post]', 'testpage', '', 'inherit', 'closed', 'closed', '', '155-revision-v1', '', '', '2018-02-04 15:48:51', '2018-02-04 15:48:51', '', 155, 'http://localhost/udemy/155-revision-v1/', 0, 'revision', '', 0),
(157, 1, '2018-02-04 19:35:42', '2018-02-04 19:35:42', '&nbsp;\n\n&nbsp;\n\n[next-post]', 'testpage', '', 'inherit', 'closed', 'closed', '', '155-autosave-v1', '', '', '2018-02-04 19:35:42', '2018-02-04 19:35:42', '', 155, 'http://localhost/udemy/155-autosave-v1/', 0, 'revision', '', 0),
(158, 1, '2018-02-04 19:36:03', '2018-02-04 19:36:03', '<h1>page content</h1>\r\n\r\n[next-post]', 'testpage', '', 'inherit', 'closed', 'closed', '', '155-revision-v1', '', '', '2018-02-04 19:36:03', '2018-02-04 19:36:03', '', 155, 'http://localhost/udemy/155-revision-v1/', 0, 'revision', '', 0),
(160, 1, '2018-02-11 12:53:18', '0000-00-00 00:00:00', 'some recipe', 'some recipe', '', 'pending', 'closed', 'closed', '', 'some-recipe', '', '', '2018-02-11 12:53:18', '0000-00-00 00:00:00', '', 0, 'http://localhost/udemy/?post_type=recipe&p=160', 0, 'recipe', '', 0),
(161, 1, '2018-02-11 13:17:07', '0000-00-00 00:00:00', 'hello yes <img src=\"http://localhost/udemy/wp-content/uploads/2017/08/616c506c-761e-31c7-bc55-1270aef0350b.jpg\" alt=\"\" width=\"248\" height=\"198\" class=\"alignnone size-full wp-image-26\" />', 'some title', '', 'pending', 'closed', 'closed', '', 'some-title', '', '', '2018-02-11 13:17:07', '0000-00-00 00:00:00', '', 0, 'http://localhost/udemy/?post_type=recipe&p=161', 0, 'recipe', '', 0),
(162, 1, '2018-02-11 13:19:52', '2018-02-11 13:19:52', 'hello yes\n\n&nbsp;\n\n&nbsp;\n\n<img class=\"alignnone size-full wp-image-26\" src=\"http://localhost/udemy/wp-content/uploads/2017/08/616c506c-761e-31c7-bc55-1270aef0350b.jpg\" alt=\"\" width=\"248\" height=\"198\" />', 'some title', '', 'inherit', 'closed', 'closed', '', '161-autosave-v1', '', '', '2018-02-11 13:19:52', '2018-02-11 13:19:52', '', 161, 'http://localhost/udemy/161-autosave-v1/', 0, 'revision', '', 0),
(164, 1, '2018-02-18 16:26:57', '2018-02-18 16:26:57', '', 'Music Options', '', 'publish', 'closed', 'closed', '', 'acf_music-options', '', '', '2018-02-18 16:26:57', '2018-02-18 16:26:57', '', 0, 'http://localhost/udemy/?post_type=acf&#038;p=164', 0, 'acf', '', 0),
(165, 1, '2018-02-18 16:27:57', '2018-02-18 16:27:57', 'My Music', 'My Music', '', 'publish', 'closed', 'closed', '', 'my-music', '', '', '2018-02-18 16:27:57', '2018-02-18 16:27:57', '', 0, 'http://localhost/udemy/?post_type=music&#038;p=165', 0, 'music', '', 0),
(167, 1, '2018-02-18 19:55:33', '2018-02-18 19:55:33', '', 'Activity', '', 'publish', 'closed', 'closed', '', 'activity', '', '', '2018-02-18 19:55:33', '2018-02-18 19:55:33', '', 0, 'http://localhost/udemy/activity/', 0, 'page', '', 0),
(168, 1, '2018-02-18 19:55:34', '2018-02-18 19:55:34', '', 'Members', '', 'publish', 'closed', 'closed', '', 'members', '', '', '2018-02-18 19:55:34', '2018-02-18 19:55:34', '', 0, 'http://localhost/udemy/members/', 0, 'page', '', 0),
(169, 1, '2018-02-18 19:55:34', '2018-02-18 19:55:34', '{{poster.name}} replied to one of your updates:\n\n<blockquote>&quot;{{usermessage}}&quot;</blockquote>\n\n<a href=\"{{{thread.url}}}\">Go to the discussion</a> to reply or catch up on the conversation.', '[{{{site.name}}}] {{poster.name}} replied to one of your updates', '{{poster.name}} replied to one of your updates:\n\n\"{{usermessage}}\"\n\nGo to the discussion to reply or catch up on the conversation: {{{thread.url}}}', 'publish', 'closed', 'closed', '', 'site-name-poster-name-replied-to-one-of-your-updates', '', '', '2018-02-18 19:55:34', '2018-02-18 19:55:34', '', 0, 'http://localhost/udemy/?post_type=bp-email&p=169', 0, 'bp-email', '', 0),
(170, 1, '2018-02-18 19:55:34', '2018-02-18 19:55:34', '{{poster.name}} replied to one of your comments:\n\n<blockquote>&quot;{{usermessage}}&quot;</blockquote>\n\n<a href=\"{{{thread.url}}}\">Go to the discussion</a> to reply or catch up on the conversation.', '[{{{site.name}}}] {{poster.name}} replied to one of your comments', '{{poster.name}} replied to one of your comments:\n\n\"{{usermessage}}\"\n\nGo to the discussion to reply or catch up on the conversation: {{{thread.url}}}', 'publish', 'closed', 'closed', '', 'site-name-poster-name-replied-to-one-of-your-comments', '', '', '2018-02-18 19:55:34', '2018-02-18 19:55:34', '', 0, 'http://localhost/udemy/?post_type=bp-email&p=170', 0, 'bp-email', '', 0),
(171, 1, '2018-02-18 19:55:35', '2018-02-18 19:55:35', '{{poster.name}} mentioned you in a status update:\n\n<blockquote>&quot;{{usermessage}}&quot;</blockquote>\n\n<a href=\"{{{mentioned.url}}}\">Go to the discussion</a> to reply or catch up on the conversation.', '[{{{site.name}}}] {{poster.name}} mentioned you in a status update', '{{poster.name}} mentioned you in a status update:\n\n\"{{usermessage}}\"\n\nGo to the discussion to reply or catch up on the conversation: {{{mentioned.url}}}', 'publish', 'closed', 'closed', '', 'site-name-poster-name-mentioned-you-in-a-status-update', '', '', '2018-02-18 19:55:35', '2018-02-18 19:55:35', '', 0, 'http://localhost/udemy/?post_type=bp-email&p=171', 0, 'bp-email', '', 0),
(172, 1, '2018-02-18 19:55:35', '2018-02-18 19:55:35', '{{poster.name}} mentioned you in the group \"{{group.name}}\":\n\n<blockquote>&quot;{{usermessage}}&quot;</blockquote>\n\n<a href=\"{{{mentioned.url}}}\">Go to the discussion</a> to reply or catch up on the conversation.', '[{{{site.name}}}] {{poster.name}} mentioned you in an update', '{{poster.name}} mentioned you in the group \"{{group.name}}\":\n\n\"{{usermessage}}\"\n\nGo to the discussion to reply or catch up on the conversation: {{{mentioned.url}}}', 'publish', 'closed', 'closed', '', 'site-name-poster-name-mentioned-you-in-an-update', '', '', '2018-02-18 19:55:35', '2018-02-18 19:55:35', '', 0, 'http://localhost/udemy/?post_type=bp-email&p=172', 0, 'bp-email', '', 0),
(173, 1, '2018-02-18 19:55:36', '2018-02-18 19:55:36', 'Thanks for registering!\n\nTo complete the activation of your account, go to the following link: <a href=\"{{{activate.url}}}\">{{{activate.url}}}</a>', '[{{{site.name}}}] Activate your account', 'Thanks for registering!\n\nTo complete the activation of your account, go to the following link: {{{activate.url}}}', 'publish', 'closed', 'closed', '', 'site-name-activate-your-account', '', '', '2018-02-18 19:55:36', '2018-02-18 19:55:36', '', 0, 'http://localhost/udemy/?post_type=bp-email&p=173', 0, 'bp-email', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(174, 1, '2018-02-18 19:55:36', '2018-02-18 19:55:36', 'Thanks for registering!\n\nTo complete the activation of your account and site, go to the following link: <a href=\"{{{activate-site.url}}}\">{{{activate-site.url}}}</a>.\n\nAfter you activate, you can visit your site at <a href=\"{{{user-site.url}}}\">{{{user-site.url}}}</a>.', '[{{{site.name}}}] Activate {{{user-site.url}}}', 'Thanks for registering!\n\nTo complete the activation of your account and site, go to the following link: {{{activate-site.url}}}\n\nAfter you activate, you can visit your site at {{{user-site.url}}}.', 'publish', 'closed', 'closed', '', 'site-name-activate-user-site-url', '', '', '2018-02-18 19:55:36', '2018-02-18 19:55:36', '', 0, 'http://localhost/udemy/?post_type=bp-email&p=174', 0, 'bp-email', '', 0),
(175, 1, '2018-02-18 19:55:37', '2018-02-18 19:55:37', '<a href=\"{{{initiator.url}}}\">{{initiator.name}}</a> wants to add you as a friend.\n\nTo accept this request and manage all of your pending requests, visit: <a href=\"{{{friend-requests.url}}}\">{{{friend-requests.url}}}</a>', '[{{{site.name}}}] New friendship request from {{initiator.name}}', '{{initiator.name}} wants to add you as a friend.\n\nTo accept this request and manage all of your pending requests, visit: {{{friend-requests.url}}}\n\nTo view {{initiator.name}}\'s profile, visit: {{{initiator.url}}}', 'publish', 'closed', 'closed', '', 'site-name-new-friendship-request-from-initiator-name', '', '', '2018-02-18 19:55:37', '2018-02-18 19:55:37', '', 0, 'http://localhost/udemy/?post_type=bp-email&p=175', 0, 'bp-email', '', 0),
(176, 1, '2018-02-18 19:55:37', '2018-02-18 19:55:37', '<a href=\"{{{friendship.url}}}\">{{friend.name}}</a> accepted your friend request.', '[{{{site.name}}}] {{friend.name}} accepted your friendship request', '{{friend.name}} accepted your friend request.\n\nTo learn more about them, visit their profile: {{{friendship.url}}}', 'publish', 'closed', 'closed', '', 'site-name-friend-name-accepted-your-friendship-request', '', '', '2018-02-18 19:55:37', '2018-02-18 19:55:37', '', 0, 'http://localhost/udemy/?post_type=bp-email&p=176', 0, 'bp-email', '', 0),
(177, 1, '2018-02-18 19:55:38', '2018-02-18 19:55:38', 'Group details for the group &quot;<a href=\"{{{group.url}}}\">{{group.name}}</a>&quot; were updated:\n<blockquote>{{changed_text}}</blockquote>', '[{{{site.name}}}] Group details updated', 'Group details for the group \"{{group.name}}\" were updated:\n\n{{changed_text}}\n\nTo view the group, visit: {{{group.url}}}', 'publish', 'closed', 'closed', '', 'site-name-group-details-updated', '', '', '2018-02-18 19:55:38', '2018-02-18 19:55:38', '', 0, 'http://localhost/udemy/?post_type=bp-email&p=177', 0, 'bp-email', '', 0),
(178, 1, '2018-02-18 19:55:40', '2018-02-18 19:55:40', '<a href=\"{{{inviter.url}}}\">{{inviter.name}}</a> has invited you to join the group: &quot;{{group.name}}&quot;.\n<a href=\"{{{invites.url}}}\">Go here to accept your invitation</a> or <a href=\"{{{group.url}}}\">visit the group</a> to learn more.', '[{{{site.name}}}] You have an invitation to the group: \"{{group.name}}\"', '{{inviter.name}} has invited you to join the group: \"{{group.name}}\".\n\nTo accept your invitation, visit: {{{invites.url}}}\n\nTo learn more about the group, visit: {{{group.url}}}.\nTo view {{inviter.name}}\'s profile, visit: {{{inviter.url}}}', 'publish', 'closed', 'closed', '', 'site-name-you-have-an-invitation-to-the-group-group-name', '', '', '2018-02-18 19:55:40', '2018-02-18 19:55:40', '', 0, 'http://localhost/udemy/?post_type=bp-email&p=178', 0, 'bp-email', '', 0),
(179, 1, '2018-02-18 19:55:40', '2018-02-18 19:55:40', 'You have been promoted to <b>{{promoted_to}}</b> in the group &quot;<a href=\"{{{group.url}}}\">{{group.name}}</a>&quot;.', '[{{{site.name}}}] You have been promoted in the group: \"{{group.name}}\"', 'You have been promoted to {{promoted_to}} in the group: \"{{group.name}}\".\n\nTo visit the group, go to: {{{group.url}}}', 'publish', 'closed', 'closed', '', 'site-name-you-have-been-promoted-in-the-group-group-name', '', '', '2018-02-18 19:55:40', '2018-02-18 19:55:40', '', 0, 'http://localhost/udemy/?post_type=bp-email&p=179', 0, 'bp-email', '', 0),
(180, 1, '2018-02-18 19:55:41', '2018-02-18 19:55:41', '<a href=\"{{{profile.url}}}\">{{requesting-user.name}}</a> wants to join the group &quot;{{group.name}}&quot;. As you are an administrator of this group, you must either accept or reject the membership request.\n\n<a href=\"{{{group-requests.url}}}\">Go here to manage this</a> and all other pending requests.', '[{{{site.name}}}] Membership request for group: {{group.name}}', '{{requesting-user.name}} wants to join the group \"{{group.name}}\". As you are the administrator of this group, you must either accept or reject the membership request.\n\nTo manage this and all other pending requests, visit: {{{group-requests.url}}}\n\nTo view {{requesting-user.name}}\'s profile, visit: {{{profile.url}}}', 'publish', 'closed', 'closed', '', 'site-name-membership-request-for-group-group-name', '', '', '2018-02-18 19:55:41', '2018-02-18 19:55:41', '', 0, 'http://localhost/udemy/?post_type=bp-email&p=180', 0, 'bp-email', '', 0),
(181, 1, '2018-02-18 19:55:41', '2018-02-18 19:55:41', '{{sender.name}} sent you a new message: &quot;{{usersubject}}&quot;\n\n<blockquote>&quot;{{usermessage}}&quot;</blockquote>\n\n<a href=\"{{{message.url}}}\">Go to the discussion</a> to reply or catch up on the conversation.', '[{{{site.name}}}] New message from {{sender.name}}', '{{sender.name}} sent you a new message: \"{{usersubject}}\"\n\n\"{{usermessage}}\"\n\nGo to the discussion to reply or catch up on the conversation: {{{message.url}}}', 'publish', 'closed', 'closed', '', 'site-name-new-message-from-sender-name', '', '', '2018-02-18 19:55:41', '2018-02-18 19:55:41', '', 0, 'http://localhost/udemy/?post_type=bp-email&p=181', 0, 'bp-email', '', 0),
(182, 1, '2018-02-18 19:55:41', '2018-02-18 19:55:41', 'You recently changed the email address associated with your account on {{site.name}} to {{user.email}}. If this is correct, <a href=\"{{{verify.url}}}\">go here to confirm the change</a>.\n\nOtherwise, you can safely ignore and delete this email if you have changed your mind, or if you think you have received this email in error.', '[{{{site.name}}}] Verify your new email address', 'You recently changed the email address associated with your account on {{site.name}} to {{user.email}}. If this is correct, go to the following link to confirm the change: {{{verify.url}}}\n\nOtherwise, you can safely ignore and delete this email if you have changed your mind, or if you think you have received this email in error.', 'publish', 'closed', 'closed', '', 'site-name-verify-your-new-email-address', '', '', '2018-02-18 19:55:41', '2018-02-18 19:55:41', '', 0, 'http://localhost/udemy/?post_type=bp-email&p=182', 0, 'bp-email', '', 0),
(183, 1, '2018-02-18 19:55:42', '2018-02-18 19:55:42', 'Your membership request for the group &quot;<a href=\"{{{group.url}}}\">{{group.name}}</a>&quot; has been accepted.', '[{{{site.name}}}] Membership request for group \"{{group.name}}\" accepted', 'Your membership request for the group \"{{group.name}}\" has been accepted.\n\nTo view the group, visit: {{{group.url}}}', 'publish', 'closed', 'closed', '', 'site-name-membership-request-for-group-group-name-accepted', '', '', '2018-02-18 19:55:42', '2018-02-18 19:55:42', '', 0, 'http://localhost/udemy/?post_type=bp-email&p=183', 0, 'bp-email', '', 0),
(184, 1, '2018-02-18 19:55:42', '2018-02-18 19:55:42', 'Your membership request for the group &quot;<a href=\"{{{group.url}}}\">{{group.name}}</a>&quot; has been rejected.', '[{{{site.name}}}] Membership request for group \"{{group.name}}\" rejected', 'Your membership request for the group \"{{group.name}}\" has been rejected.\n\nTo request membership again, visit: {{{group.url}}}', 'publish', 'closed', 'closed', '', 'site-name-membership-request-for-group-group-name-rejected', '', '', '2018-02-18 19:55:42', '2018-02-18 19:55:42', '', 0, 'http://localhost/udemy/?post_type=bp-email&p=184', 0, 'bp-email', '', 0),
(185, 1, '2018-02-18 20:05:06', '2018-02-18 20:05:06', '', 'Register', '', 'publish', 'closed', 'closed', '', 'register', '', '', '2018-02-18 20:05:06', '2018-02-18 20:05:06', '', 0, 'http://localhost/udemy/register/', 0, 'page', '', 0),
(186, 1, '2018-02-18 20:05:06', '2018-02-18 20:05:06', '', 'Activate', '', 'publish', 'closed', 'closed', '', 'activate', '', '', '2018-02-18 20:05:06', '2018-02-18 20:05:06', '', 0, 'http://localhost/udemy/activate/', 0, 'page', '', 0),
(187, 1, '2018-02-18 20:07:03', '2018-02-18 20:07:03', '', 'Groups', '', 'publish', 'closed', 'closed', '', 'groups', '', '', '2018-02-18 20:07:03', '2018-02-18 20:07:03', '', 0, 'http://localhost/udemy/groups/', 0, 'page', '', 0),
(189, 1, '2018-02-28 20:07:47', '2018-02-28 20:07:47', '', 'Shop', '', 'publish', 'closed', 'closed', '', 'shop', '', '', '2018-02-28 20:07:47', '2018-02-28 20:07:47', '', 0, 'http://localhost/udemy/shop/', 0, 'page', '', 0),
(190, 1, '2018-02-28 20:07:47', '2018-02-28 20:07:47', '[woocommerce_cart]', 'Cart', '', 'publish', 'closed', 'closed', '', 'cart', '', '', '2018-02-28 20:07:47', '2018-02-28 20:07:47', '', 0, 'http://localhost/udemy/cart/', 0, 'page', '', 0),
(191, 1, '2018-02-28 20:07:47', '2018-02-28 20:07:47', '[woocommerce_checkout]', 'Checkout', '', 'publish', 'closed', 'closed', '', 'checkout', '', '', '2018-02-28 20:07:47', '2018-02-28 20:07:47', '', 0, 'http://localhost/udemy/checkout/', 0, 'page', '', 0),
(192, 1, '2018-02-28 20:07:47', '2018-02-28 20:07:47', '[woocommerce_my_account]', 'My account', '', 'publish', 'closed', 'closed', '', 'my-account-2', '', '', '2018-02-28 20:07:47', '2018-02-28 20:07:47', '', 0, 'http://localhost/udemy/my-account-2/', 0, 'page', '', 0),
(224, 1, '2018-02-28 20:47:57', '2018-02-28 20:47:57', ' ', '', '', 'publish', 'closed', 'closed', '', '224', '', '', '2018-02-28 20:47:57', '2018-02-28 20:47:57', '', 0, 'http://localhost/udemy/?p=224', 5, 'nav_menu_item', '', 0),
(225, 1, '2018-02-28 20:47:57', '2018-02-28 20:47:57', ' ', '', '', 'publish', 'closed', 'closed', '', '225', '', '', '2018-02-28 20:47:57', '2018-02-28 20:47:57', '', 0, 'http://localhost/udemy/?p=225', 6, 'nav_menu_item', '', 0),
(226, 1, '2018-02-28 20:47:57', '2018-02-28 20:47:57', ' ', '', '', 'publish', 'closed', 'closed', '', '226', '', '', '2018-02-28 20:47:57', '2018-02-28 20:47:57', '', 0, 'http://localhost/udemy/?p=226', 7, 'nav_menu_item', '', 0),
(228, 1, '2017-12-15 03:56:34', '2017-12-15 03:56:34', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Hoodie', 'This is a variable product.', 'publish', 'open', 'closed', '', 'hoodie', '', '', '2017-12-15 03:56:34', '2017-12-15 03:56:34', '', 0, 'https://woocommercecore.mystagingwebsite.com/?product=import-placeholder-for-woo-hoodie', 0, 'product', '', 0),
(229, 1, '2017-12-15 03:56:34', '2017-12-15 03:56:34', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Beanie', 'This is a simple product.', 'publish', 'open', 'closed', '', 'beanie', '', '', '2017-12-15 03:56:34', '2017-12-15 03:56:34', '', 0, 'https://woocommercecore.mystagingwebsite.com/?product=import-placeholder-for-woo-beanie', 0, 'product', '', 0),
(230, 1, '2017-12-15 03:56:41', '2017-12-15 03:56:41', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Belt', 'This is a simple product.', 'publish', 'open', 'closed', '', 'belt', '', '', '2017-12-15 03:56:41', '2017-12-15 03:56:41', '', 0, 'https://woocommercecore.mystagingwebsite.com/?product=belt', 0, 'product', '', 0),
(231, 1, '2017-12-15 03:56:42', '2017-12-15 03:56:42', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Cap', 'This is a simple product.', 'publish', 'open', 'closed', '', 'cap', '', '', '2017-12-15 03:56:42', '2017-12-15 03:56:42', '', 0, 'https://woocommercecore.mystagingwebsite.com/?product=cap', 0, 'product', '', 0),
(232, 1, '2017-12-15 03:56:43', '2017-12-15 03:56:43', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Sunglasses', 'This is a simple product.', 'publish', 'open', 'closed', '', 'sunglasses', '', '', '2017-12-15 03:56:43', '2017-12-15 03:56:43', '', 0, 'https://woocommercecore.mystagingwebsite.com/?product=sunglasses', 0, 'product', '', 0),
(233, 1, '2017-12-15 03:56:45', '2017-12-15 03:56:45', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Hoodie with Pocket', 'This is a simple product.', 'publish', 'open', 'closed', '', 'hoodie-with-pocket', '', '', '2017-12-15 03:56:45', '2017-12-15 03:56:45', '', 0, 'https://woocommercecore.mystagingwebsite.com/?product=hoodie-with-pocket', 0, 'product', '', 0),
(236, 1, '2018-03-17 18:08:28', '2018-03-17 18:08:28', '', 'test page', '', 'publish', 'closed', 'closed', '', 'test-page', '', '', '2018-03-17 18:08:28', '2018-03-17 18:08:28', '', 0, 'http://localhost/udemy/?page_id=236', 0, 'page', '', 0),
(237, 1, '2018-03-17 18:08:28', '2018-03-17 18:08:28', '', 'test page', '', 'inherit', 'closed', 'closed', '', '236-revision-v1', '', '', '2018-03-17 18:08:28', '2018-03-17 18:08:28', '', 236, 'http://localhost/udemy/236-revision-v1/', 0, 'revision', '', 0),
(238, 1, '2018-03-23 19:26:29', '2018-03-23 19:26:29', 'This is about us page.', 'About US', '', 'inherit', 'closed', 'closed', '', '45-revision-v1', '', '', '2018-03-23 19:26:29', '2018-03-23 19:26:29', '', 45, 'http://localhost/udemy/45-revision-v1/', 0, 'revision', '', 0),
(239, 1, '2018-03-24 09:07:46', '2018-03-24 09:07:46', '8888This is about us page.', 'About US', '', 'inherit', 'closed', 'closed', '', '45-autosave-v1', '', '', '2018-03-24 09:07:46', '2018-03-24 09:07:46', '', 45, 'http://localhost/udemy/45-autosave-v1/', 0, 'revision', '', 0),
(243, 1, '2018-03-24 18:01:43', '2018-03-24 18:01:43', '', 'test gallery post', '', 'publish', 'open', 'open', '', 'test-gallery-post', '', '', '2018-03-24 18:01:43', '2018-03-24 18:01:43', '', 0, 'http://localhost/udemy/?p=243', 0, 'post', '', 0),
(244, 1, '2018-03-24 18:01:43', '2018-03-24 18:01:43', '', 'test gallery post', '', 'inherit', 'closed', 'closed', '', '243-revision-v1', '', '', '2018-03-24 18:01:43', '2018-03-24 18:01:43', '', 243, 'http://localhost/udemy/243-revision-v1/', 0, 'revision', '', 0),
(246, 1, '2018-04-06 14:20:28', '2018-04-06 14:20:28', '', 'Activate', '', 'inherit', 'closed', 'closed', '', '186-autosave-v1', '', '', '2018-04-06 14:20:28', '2018-04-06 14:20:28', '', 186, 'http://localhost/udemy/186-autosave-v1/', 0, 'revision', '', 0),
(247, 1, '2018-04-15 12:00:00', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2018-04-15 12:00:00', '0000-00-00 00:00:00', '', 0, 'http://localhost/udemy/?p=247', 0, 'post', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_recipe_ratings`
--

CREATE TABLE `wp_recipe_ratings` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `recipe_id` bigint(20) UNSIGNED NOT NULL,
  `rating` float(3,2) UNSIGNED NOT NULL,
  `user_ip` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_recipe_ratings`
--

INSERT INTO `wp_recipe_ratings` (`ID`, `recipe_id`, `rating`, `user_ip`) VALUES
(15, 137, 4.50, '::1');

-- --------------------------------------------------------

--
-- Table structure for table `wp_signups`
--

CREATE TABLE `wp_signups` (
  `signup_id` bigint(20) NOT NULL,
  `domain` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `activation_key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `meta` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_termmeta`
--

INSERT INTO `wp_termmeta` (`meta_id`, `term_id`, `meta_key`, `meta_value`) VALUES
(1, 24, 'r_more_info_url', 'http://alskjdfm'),
(2, 55, 'thumbnail_id', '206'),
(3, 55, 'product_count_product_cat', '5'),
(4, 56, 'thumbnail_id', '208'),
(5, 56, 'product_count_product_cat', '3'),
(6, 57, 'thumbnail_id', '207'),
(7, 57, 'product_count_product_cat', '5'),
(8, 66, 'order', '0'),
(9, 67, 'order', '0'),
(10, 68, 'order', '0'),
(11, 66, 'product_count_product_cat', '2'),
(12, 67, 'product_count_product_cat', '1'),
(13, 68, 'product_count_product_cat', '1');

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'Quis harum earum', 'quis-harum-earum', 0),
(3, 'Ullam nemo id ipsam', 'ullam-nemo-id-ipsam', 0),
(4, 'Ut dolores iusto voluptatibus', 'ut-dolores-iusto-voluptatibus', 0),
(5, 'Qui ipsum incidunt necessitatibus fugiat', 'qui-ipsum-incidunt-necessitatibus-fugiat', 0),
(6, 'Deserunt accusamus nesciunt', 'deserunt-accusamus-nesciunt', 0),
(7, 'Odio expedita quis maiores', 'odio-expedita-quis-maiores', 0),
(8, 'Sint laboriosam quis quam', 'sint-laboriosam-quis-quam', 0),
(9, 'Soluta voluptatibus cumque', 'soluta-voluptatibus-cumque', 0),
(10, 'Primary Menu', 'primary-menu', 0),
(11, 'Secondary Menu', 'secondary-menu', 0),
(12, 'post-format-gallery', 'post-format-gallery', 0),
(13, 'post-format-video', 'post-format-video', 0),
(14, 'post-format-audio', 'post-format-audio', 0),
(15, 'Custom', 'custom', 0),
(16, 'test', 'test', 0),
(24, 'lahore', 'lahore', 0),
(25, 'activity-comment', 'activity-comment', 0),
(26, 'activity-comment-author', 'activity-comment-author', 0),
(27, 'activity-at-message', 'activity-at-message', 0),
(28, 'groups-at-message', 'groups-at-message', 0),
(29, 'core-user-registration', 'core-user-registration', 0),
(30, 'core-user-registration-with-blog', 'core-user-registration-with-blog', 0),
(31, 'friends-request', 'friends-request', 0),
(32, 'friends-request-accepted', 'friends-request-accepted', 0),
(33, 'groups-details-updated', 'groups-details-updated', 0),
(34, 'groups-invitation', 'groups-invitation', 0),
(35, 'groups-member-promoted', 'groups-member-promoted', 0),
(36, 'groups-membership-request', 'groups-membership-request', 0),
(37, 'messages-unread', 'messages-unread', 0),
(38, 'settings-verify-email-change', 'settings-verify-email-change', 0),
(39, 'groups-membership-request-accepted', 'groups-membership-request-accepted', 0),
(40, 'groups-membership-request-rejected', 'groups-membership-request-rejected', 0),
(41, 'simple', 'simple', 0),
(42, 'grouped', 'grouped', 0),
(43, 'variable', 'variable', 0),
(44, 'external', 'external', 0),
(45, 'exclude-from-search', 'exclude-from-search', 0),
(46, 'exclude-from-catalog', 'exclude-from-catalog', 0),
(47, 'featured', 'featured', 0),
(48, 'outofstock', 'outofstock', 0),
(49, 'rated-1', 'rated-1', 0),
(50, 'rated-2', 'rated-2', 0),
(51, 'rated-3', 'rated-3', 0),
(52, 'rated-4', 'rated-4', 0),
(53, 'rated-5', 'rated-5', 0),
(54, 'Uncategorized', 'uncategorized', 0),
(55, 'Accessories', 'accessories', 0),
(56, 'Hoodies', 'hoodies', 0),
(57, 'Tshirts', 'tshirts', 0),
(58, 'Blue', 'blue', 0),
(59, 'Green', 'green', 0),
(60, 'Large', 'large', 0),
(61, 'Medium', 'medium', 0),
(62, 'Red', 'red', 0),
(63, 'Small', 'small', 0),
(64, 'Gray', 'gray', 0),
(65, 'Yellow', 'yellow', 0),
(66, 'Music', 'music', 0),
(67, 'Clothing', 'clothing', 0),
(68, 'Decor', 'decor', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(1, 2, 0),
(1, 5, 0),
(1, 9, 0),
(4, 2, 0),
(4, 9, 0),
(6, 3, 0),
(6, 6, 0),
(7, 5, 0),
(9, 1, 0),
(9, 2, 0),
(9, 5, 0),
(9, 7, 0),
(9, 8, 0),
(9, 13, 0),
(12, 2, 0),
(12, 4, 0),
(12, 6, 0),
(12, 7, 0),
(15, 4, 0),
(17, 4, 0),
(17, 5, 0),
(22, 1, 0),
(22, 2, 0),
(22, 4, 0),
(22, 6, 0),
(22, 9, 0),
(25, 6, 0),
(25, 7, 0),
(25, 8, 0),
(31, 8, 0),
(34, 1, 0),
(34, 2, 0),
(34, 6, 0),
(34, 8, 0),
(35, 4, 0),
(35, 7, 0),
(37, 4, 0),
(37, 6, 0),
(37, 8, 0),
(37, 9, 0),
(38, 1, 0),
(38, 2, 0),
(38, 3, 0),
(38, 5, 0),
(41, 4, 0),
(41, 6, 0),
(43, 2, 0),
(43, 4, 0),
(43, 5, 0),
(43, 6, 0),
(43, 7, 0),
(43, 9, 0),
(43, 12, 0),
(44, 43, 0),
(44, 47, 0),
(44, 57, 0),
(44, 58, 0),
(44, 59, 0),
(44, 60, 0),
(44, 61, 0),
(44, 62, 0),
(44, 63, 0),
(46, 41, 0),
(46, 56, 0),
(46, 58, 0),
(47, 41, 0),
(47, 57, 0),
(47, 64, 0),
(49, 10, 0),
(50, 10, 0),
(63, 11, 0),
(64, 11, 0),
(66, 41, 0),
(66, 47, 0),
(66, 56, 0),
(68, 41, 0),
(68, 57, 0),
(68, 59, 0),
(70, 41, 0),
(70, 57, 0),
(70, 58, 0),
(73, 41, 0),
(73, 66, 0),
(75, 41, 0),
(75, 52, 0),
(75, 66, 0),
(83, 41, 0),
(83, 57, 0),
(83, 64, 0),
(85, 41, 0),
(85, 55, 0),
(85, 62, 0),
(87, 42, 0),
(87, 67, 0),
(89, 44, 0),
(89, 68, 0),
(137, 5, 0),
(137, 16, 0),
(137, 24, 0),
(141, 11, 0),
(142, 10, 0),
(149, 10, 0),
(169, 25, 0),
(170, 26, 0),
(171, 27, 0),
(172, 28, 0),
(173, 29, 0),
(174, 30, 0),
(175, 31, 0),
(176, 32, 0),
(177, 33, 0),
(178, 34, 0),
(179, 35, 0),
(180, 36, 0),
(181, 37, 0),
(182, 38, 0),
(183, 39, 0),
(184, 40, 0),
(224, 10, 0),
(225, 10, 0),
(226, 10, 0),
(228, 43, 0),
(228, 56, 0),
(228, 58, 0),
(228, 59, 0),
(228, 62, 0),
(229, 41, 0),
(229, 55, 0),
(229, 62, 0),
(230, 41, 0),
(230, 55, 0),
(231, 41, 0),
(231, 47, 0),
(231, 55, 0),
(231, 65, 0),
(232, 41, 0),
(232, 47, 0),
(232, 55, 0),
(233, 41, 0),
(233, 45, 0),
(233, 46, 0),
(233, 47, 0),
(233, 56, 0),
(233, 64, 0),
(243, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 6),
(2, 2, 'category', 'Neque velit neque voluptates et ipsum', 0, 8),
(3, 3, 'post_tag', 'Ab dolorum omnis repellat ipsam et exercitationem sed nulla eligendi atque ab facilis ad magnam et praesentium est sunt voluptatum commodi assumenda consequatur ut quae', 0, 2),
(4, 4, 'post_tag', 'Facilis sunt sed exercitationem vitae autem voluptatem ut non eveniet voluptatem molestiae occaecati voluptas', 0, 8),
(5, 5, 'category', 'Et velit ipsam exercitationem reprehenderit architecto ducimus', 0, 7),
(6, 6, 'post_tag', 'Asperiores culpa quam et natus aut natus autem qui', 0, 8),
(7, 7, 'post_tag', 'Accusamus aut quia deserunt sint nesciunt quam qui omnis corrupti commodi repellat esse dolore itaque fugit', 0, 5),
(8, 8, 'post_tag', 'Eum numquam voluptatibus sapiente non autem eum sit corrupti et et esse repellat voluptatem dolorum ex sunt quia ut iste magnam aliquam fuga temporibus eveniet velit quidem non tempora laudantium dolorem unde aut corrupti', 0, 5),
(9, 9, 'category', 'Quae voluptatem qui velit veritatis soluta quas possimus repellendus aspernatur voluptatem voluptate quia dolorem voluptatem suscipit nihil ullam voluptatem et omnis nesciunt nihil sapiente consequatur reprehenderit harum dolores et corrupti veritatis', 0, 5),
(10, 10, 'nav_menu', '', 0, 7),
(11, 11, 'nav_menu', '', 0, 3),
(12, 12, 'post_format', '', 0, 1),
(13, 13, 'post_format', '', 0, 1),
(14, 14, 'post_format', '', 0, 0),
(15, 15, 'category', '', 0, 0),
(16, 16, 'post_tag', '', 0, 1),
(24, 24, 'origin', 'lahore', 0, 1),
(25, 25, 'bp-email-type', 'A member has replied to an activity update that the recipient posted.', 0, 1),
(26, 26, 'bp-email-type', 'A member has replied to a comment on an activity update that the recipient posted.', 0, 1),
(27, 27, 'bp-email-type', 'Recipient was mentioned in an activity update.', 0, 1),
(28, 28, 'bp-email-type', 'Recipient was mentioned in a group activity update.', 0, 1),
(29, 29, 'bp-email-type', 'Recipient has registered for an account.', 0, 1),
(30, 30, 'bp-email-type', 'Recipient has registered for an account and site.', 0, 1),
(31, 31, 'bp-email-type', 'A member has sent a friend request to the recipient.', 0, 1),
(32, 32, 'bp-email-type', 'Recipient has had a friend request accepted by a member.', 0, 1),
(33, 33, 'bp-email-type', 'A group\'s details were updated.', 0, 1),
(34, 34, 'bp-email-type', 'A member has sent a group invitation to the recipient.', 0, 1),
(35, 35, 'bp-email-type', 'Recipient\'s status within a group has changed.', 0, 1),
(36, 36, 'bp-email-type', 'A member has requested permission to join a group.', 0, 1),
(37, 37, 'bp-email-type', 'Recipient has received a private message.', 0, 1),
(38, 38, 'bp-email-type', 'Recipient has changed their email address.', 0, 1),
(39, 39, 'bp-email-type', 'Recipient had requested to join a group, which was accepted.', 0, 1),
(40, 40, 'bp-email-type', 'Recipient had requested to join a group, which was rejected.', 0, 1),
(41, 41, 'product_type', '', 0, 14),
(42, 42, 'product_type', '', 0, 1),
(43, 43, 'product_type', '', 0, 2),
(44, 44, 'product_type', '', 0, 1),
(45, 45, 'product_visibility', '', 0, 1),
(46, 46, 'product_visibility', '', 0, 1),
(47, 47, 'product_visibility', '', 0, 5),
(48, 48, 'product_visibility', '', 0, 0),
(49, 49, 'product_visibility', '', 0, 0),
(50, 50, 'product_visibility', '', 0, 0),
(51, 51, 'product_visibility', '', 0, 0),
(52, 52, 'product_visibility', '', 0, 1),
(53, 53, 'product_visibility', '', 0, 0),
(54, 54, 'product_cat', '', 0, 0),
(55, 55, 'product_cat', 'A short category description', 0, 5),
(56, 56, 'product_cat', 'A short category description', 0, 4),
(57, 57, 'product_cat', 'A short category description', 0, 5),
(58, 58, 'pa_color', '', 0, 4),
(59, 59, 'pa_color', '', 0, 3),
(60, 60, 'pa_size', '', 0, 1),
(61, 61, 'pa_size', '', 0, 1),
(62, 62, 'pa_color', '', 0, 4),
(63, 63, 'pa_size', '', 0, 1),
(64, 64, 'pa_color', '', 0, 3),
(65, 65, 'pa_color', '', 0, 1),
(66, 66, 'product_cat', '', 0, 2),
(67, 67, 'product_cat', '', 0, 1),
(68, 68, 'product_cat', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'mohsin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'true'),
(10, 1, 'locale', ''),
(11, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(12, 1, 'wp_user_level', '10'),
(13, 1, 'dismissed_wp_pointers', 'wps_subtitle_field_to_top,plugin_editor_notice'),
(14, 1, 'show_welcome_panel', '0'),
(16, 1, 'wp_dashboard_quick_press_last_post_id', '247'),
(17, 1, 'community-events-location', 'a:4:{s:11:\"description\";s:6:\"Lahore\";s:8:\"latitude\";s:10:\"31.5580000\";s:9:\"longitude\";s:10:\"74.3507100\";s:7:\"country\";s:2:\"PK\";}'),
(18, 2, 'nickname', 'marvin04'),
(19, 2, 'first_name', 'Sabryna'),
(20, 2, 'last_name', 'Price'),
(21, 2, 'description', 'Repudiandae aut maiores dolores et ad. Et est ut aut maxime pariatur ullam non et. Impedit veritatis est error similique.\r\n\r\nEt voluptates quasi facere doloribus exercitationem. Cum alias commodi labore unde dolore corporis. Rerum sit eos rerum est consequuntur atque minima.\r\n\r\nOmnis accusamus quis nihil laboriosam ut aut. At beatae saepe ratione sequi aut nihil. Sed et et unde enim qui consectetur itaque. Voluptatem sed iusto rerum iste earum optio.\r\n\r\nVoluptates rem non ab eligendi et perferendis numquam dolores. Unde non et corporis cupiditate temporibus id perspiciatis. Iure debitis est atque a reprehenderit sed. Nulla et doloremque velit magni.\r\n\r\nVoluptatem itaque et tempora magnam. Nulla voluptates voluptatem voluptas et quia minus doloremque animi. Laboriosam atque neque sint. Tenetur delectus aut doloremque at enim ducimus voluptatem. Et officiis at quisquam ex commodi voluptatem quas.'),
(22, 2, 'rich_editing', 'true'),
(23, 2, 'comment_shortcuts', 'false'),
(24, 2, 'admin_color', 'fresh'),
(25, 2, 'use_ssl', '0'),
(26, 2, 'show_admin_bar_front', 'true'),
(27, 2, 'locale', ''),
(28, 2, 'wp_capabilities', 'a:1:{s:6:\"author\";b:1;}'),
(29, 2, 'wp_user_level', '2'),
(30, 2, 'dismissed_wp_pointers', ''),
(31, 2, 'fakerpress_flag', '1'),
(32, 3, 'nickname', 'flavie.wunsch'),
(33, 3, 'first_name', 'Rogers'),
(34, 3, 'last_name', 'Schowalter'),
(35, 3, 'description', 'Natus explicabo ab officiis vel. Tempora quia in consequatur eum explicabo quis ipsam enim. Ut iste consectetur voluptatem porro velit.'),
(36, 3, 'rich_editing', 'true'),
(37, 3, 'comment_shortcuts', 'false'),
(38, 3, 'admin_color', 'fresh'),
(39, 3, 'use_ssl', '0'),
(40, 3, 'show_admin_bar_front', 'true'),
(41, 3, 'locale', ''),
(42, 3, 'wp_capabilities', 'a:1:{s:6:\"author\";b:1;}'),
(43, 3, 'wp_user_level', '2'),
(44, 3, 'dismissed_wp_pointers', ''),
(45, 3, 'fakerpress_flag', '1'),
(46, 4, 'nickname', 'brandy11'),
(47, 4, 'first_name', 'Macy'),
(48, 4, 'last_name', 'Hermiston'),
(49, 4, 'description', 'Placeat omnis omnis ipsum. Nobis voluptas deleniti soluta ipsam quidem neque. Vitae quam sint veritatis unde.\r\n\r\nHarum voluptatum possimus eos voluptatum numquam. Nihil placeat iste impedit dolor. Enim eos iusto aperiam ducimus. Eos possimus nemo a cum sequi perspiciatis.\r\n\r\nIllo omnis quia rerum consequatur amet. Quis dolorum voluptas et necessitatibus ab repudiandae neque. Id consequatur dolorem illum consequatur sed eius. Sunt dicta odit porro sed aspernatur nisi.\r\n\r\nSunt quo et culpa quos et. Eius necessitatibus quos at quisquam. Et aut reprehenderit veritatis ducimus. Consequatur tenetur iusto corporis rerum voluptate.\r\n\r\nSit et ducimus et aut sit autem. Ab reiciendis dolorem ex quae odio est. Et repudiandae cupiditate aut ut ut mollitia.'),
(50, 4, 'rich_editing', 'true'),
(51, 4, 'comment_shortcuts', 'false'),
(52, 4, 'admin_color', 'fresh'),
(53, 4, 'use_ssl', '0'),
(54, 4, 'show_admin_bar_front', 'true'),
(55, 4, 'locale', ''),
(56, 4, 'wp_capabilities', 'a:1:{s:6:\"author\";b:1;}'),
(57, 4, 'wp_user_level', '2'),
(58, 4, 'dismissed_wp_pointers', ''),
(59, 4, 'fakerpress_flag', '1'),
(60, 5, 'nickname', 'tavares.kutch'),
(61, 5, 'first_name', 'Jaida'),
(62, 5, 'last_name', 'Kub'),
(63, 5, 'description', 'Eos quasi mollitia ut voluptate. Placeat recusandae nulla iste dolores voluptatum. Et dolor animi rerum doloremque. Eius delectus non ipsum culpa accusamus. Itaque voluptatum rerum sequi ratione facilis.\r\n\r\nCorrupti et saepe quidem dolorum libero autem ut quaerat. Consequatur quia velit illo itaque sit qui. Corporis debitis qui vel provident sequi sint harum. Minus qui velit in voluptas aut. Vel nihil ea voluptates consequatur.\r\n\r\nLaborum ab quo laborum aliquid autem dicta qui. Natus nihil sit praesentium corrupti consectetur voluptatem.'),
(64, 5, 'rich_editing', 'true'),
(65, 5, 'comment_shortcuts', 'false'),
(66, 5, 'admin_color', 'fresh'),
(67, 5, 'use_ssl', '0'),
(68, 5, 'show_admin_bar_front', 'true'),
(69, 5, 'locale', ''),
(70, 5, 'wp_capabilities', 'a:1:{s:6:\"author\";b:1;}'),
(71, 5, 'wp_user_level', '2'),
(72, 5, 'dismissed_wp_pointers', ''),
(73, 5, 'fakerpress_flag', '1'),
(74, 1, 'managenav-menuscolumnshidden', 'a:3:{i:0;s:11:\"link-target\";i:1;s:3:\"xfn\";i:2;s:11:\"description\";}'),
(75, 1, 'metaboxhidden_nav-menus', 'a:1:{i:0;s:12:\"add-post_tag\";}'),
(76, 1, 'nav_menu_recently_edited', '10'),
(77, 1, 'wp_user-settings', 'libraryContent=browse&editor=tinymce'),
(78, 1, 'wp_user-settings-time', '1518355031'),
(80, 1, 'closedpostboxes_dashboard', 'a:9:{i:0;s:18:\"dashboard_activity\";i:1;s:19:\"dashboard_right_now\";i:2;s:11:\"wplv-widget\";i:3;s:36:\"woocommerce_dashboard_recent_reviews\";i:4;s:28:\"woocommerce_dashboard_status\";i:5;s:21:\"dashboard_quick_press\";i:6;s:17:\"dashboard_primary\";i:7;s:16:\"ws_php_error_log\";i:8;s:29:\"r_latest_recipe_rating_widget\";}'),
(81, 1, 'metaboxhidden_dashboard', 'a:0:{}'),
(82, 1, 'closedpostboxes_recipe', 'a:0:{}'),
(83, 1, 'metaboxhidden_recipe', 'a:1:{i:0;s:7:\"slugdiv\";}'),
(84, 1, 'meta-box-order_recipe', 'a:3:{s:4:\"side\";s:51:\"submitdiv,categorydiv,tagsdiv-post_tag,postimagediv\";s:6:\"normal\";s:37:\"r_recipe_options_mb,slugdiv,authordiv\";s:8:\"advanced\";s:0:\"\";}'),
(85, 1, 'screen_layout_recipe', '2'),
(86, 1, 'meta-box-order_dashboard', 'a:4:{s:6:\"normal\";s:50:\"dashboard_activity,dashboard_right_now,wplv-widget\";s:4:\"side\";s:39:\"dashboard_quick_press,dashboard_primary\";s:7:\"column3\";s:16:\"ws_php_error_log\";s:7:\"column4\";s:29:\"r_latest_recipe_rating_widget\";}'),
(88, 1, '_wplv_settings', 'a:7:{s:4:\"view\";s:4:\"list\";s:4:\"sort\";s:6:\"newest\";s:5:\"query\";s:0:\"\";s:7:\"legends\";s:0:\"\";s:12:\"fold_sidebar\";i:1;s:17:\"truncate_download\";i:1;s:13:\"custom_errors\";s:0:\"\";}'),
(89, 6, 'nickname', 'laskdmflsad'),
(90, 6, 'first_name', ''),
(91, 6, 'last_name', ''),
(92, 6, 'description', ''),
(93, 6, 'rich_editing', 'true'),
(94, 6, 'syntax_highlighting', 'true'),
(95, 6, 'comment_shortcuts', 'false'),
(96, 6, 'admin_color', 'fresh'),
(97, 6, 'use_ssl', '0'),
(98, 6, 'show_admin_bar_front', 'true'),
(99, 6, 'locale', ''),
(100, 6, 'wp_capabilities', 'a:1:{s:10:\"subscriber\";b:1;}'),
(101, 6, 'wp_user_level', '0'),
(102, 6, 'dismissed_wp_pointers', ''),
(104, 6, 'community-events-location', 'a:1:{s:2:\"ip\";s:2:\"::\";}'),
(105, 6, 'closedpostboxes_dashboard', 'a:0:{}'),
(106, 6, 'metaboxhidden_dashboard', 'a:0:{}'),
(107, 7, 'nickname', 'admin'),
(108, 7, 'first_name', ''),
(109, 7, 'last_name', ''),
(110, 7, 'description', ''),
(111, 7, 'rich_editing', 'true'),
(112, 7, 'syntax_highlighting', 'true'),
(113, 7, 'comment_shortcuts', 'false'),
(114, 7, 'admin_color', 'fresh'),
(115, 7, 'use_ssl', '0'),
(116, 7, 'show_admin_bar_front', 'true'),
(117, 7, 'locale', ''),
(118, 7, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(119, 7, 'wp_user_level', '10'),
(120, 7, 'dismissed_wp_pointers', ''),
(121, 1, 'syntax_highlighting', 'true'),
(122, 7, 'session_tokens', 'a:1:{s:64:\"66d0dfd6367bce5265a1d02e17348cd8012ce052c81b9b65e9272f6152339ba1\";a:4:{s:10:\"expiration\";i:1513612419;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:126:\"Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36 OPR/49.0.2725.47\";s:5:\"login\";i:1513439619;}}'),
(123, 7, 'wp_dashboard_quick_press_last_post_id', '152'),
(124, 7, 'community-events-location', 'a:1:{s:2:\"ip\";s:2:\"::\";}'),
(126, 1, 'session_tokens', 'a:1:{s:64:\"e1bdb473c418c01c4b8c838ccbccee13eeea74bc9936243aa9819c1c981ad9a1\";a:4:{s:10:\"expiration\";i:1523966386;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:127:\"Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36 OPR/52.0.2871.64\";s:5:\"login\";i:1523793586;}}'),
(127, 1, 'wp_r_tru_u_x', 'a:2:{s:2:\"id\";s:0:\"\";s:7:\"expires\";i:86400;}'),
(128, 1, 'last_activity', '2018-04-08 12:51:05'),
(129, 1, '_woocommerce_persistent_cart_1', 'a:1:{s:4:\"cart\";a:2:{s:32:\"d9d4f495e875a2e075a1a4a6e1b9770f\";a:10:{s:3:\"key\";s:32:\"d9d4f495e875a2e075a1a4a6e1b9770f\";s:10:\"product_id\";i:46;s:12:\"variation_id\";i:0;s:9:\"variation\";a:0:{}s:8:\"quantity\";i:1;s:13:\"line_tax_data\";a:2:{s:8:\"subtotal\";a:0:{}s:5:\"total\";a:0:{}}s:13:\"line_subtotal\";d:45;s:17:\"line_subtotal_tax\";i:0;s:10:\"line_total\";d:45;s:8:\"line_tax\";i:0;}s:32:\"67c6a1e7ce56d3d6fa748ab6d9af3fd7\";a:10:{s:3:\"key\";s:32:\"67c6a1e7ce56d3d6fa748ab6d9af3fd7\";s:10:\"product_id\";i:47;s:12:\"variation_id\";i:0;s:9:\"variation\";a:0:{}s:8:\"quantity\";i:1;s:13:\"line_tax_data\";a:2:{s:8:\"subtotal\";a:0:{}s:5:\"total\";a:0:{}}s:13:\"line_subtotal\";d:18;s:17:\"line_subtotal_tax\";i:0;s:10:\"line_total\";d:18;s:8:\"line_tax\";i:0;}}}'),
(130, 1, 'dismissed_no_shipping_methods_notice', '1'),
(131, 1, 'closedpostboxes_page', 'a:0:{}'),
(132, 1, 'metaboxhidden_page', 'a:5:{i:0;s:7:\"acf_164\";i:1;s:10:\"postcustom\";i:2;s:16:\"commentstatusdiv\";i:3;s:7:\"slugdiv\";i:4;s:9:\"authordiv\";}'),
(133, 1, 'meta-box-order_page', 'a:4:{s:15:\"acf_after_title\";s:0:\"\";s:4:\"side\";s:36:\"submitdiv,pageparentdiv,postimagediv\";s:6:\"normal\";s:78:\"acf_164,post-metabox,postcustom,commentstatusdiv,slugdiv,authordiv,commentsdiv\";s:8:\"advanced\";s:14:\"quads_meta_box\";}'),
(134, 1, 'screen_layout_page', '2'),
(135, 1, 'closedpostboxes_post', 'a:0:{}'),
(136, 1, 'metaboxhidden_post', 'a:8:{i:0;s:7:\"acf_164\";i:1;s:11:\"postexcerpt\";i:2;s:13:\"trackbacksdiv\";i:3;s:10:\"postcustom\";i:4;s:16:\"commentstatusdiv\";i:5;s:11:\"commentsdiv\";i:6;s:7:\"slugdiv\";i:7;s:9:\"authordiv\";}'),
(137, 5, 'billing_first_name', 'Jaida'),
(138, 5, 'billing_last_name', 'Kub'),
(139, 5, 'billing_company', ''),
(140, 5, 'billing_address_1', ''),
(141, 5, 'billing_address_2', ''),
(142, 5, 'billing_city', ''),
(143, 5, 'billing_postcode', ''),
(144, 5, 'billing_country', ''),
(145, 5, 'billing_state', ''),
(146, 5, 'billing_phone', ''),
(147, 5, 'billing_email', 'gcrona@example.net'),
(148, 5, 'shipping_first_name', ''),
(149, 5, 'shipping_last_name', ''),
(150, 5, 'shipping_company', ''),
(151, 5, 'shipping_address_1', ''),
(152, 5, 'shipping_address_2', ''),
(153, 5, 'shipping_city', ''),
(154, 5, 'shipping_postcode', ''),
(155, 5, 'shipping_country', ''),
(156, 5, 'shipping_state', ''),
(157, 5, 'syntax_highlighting', 'true'),
(158, 5, 'last_update', '1523136633'),
(159, 5, 'ju_twitter', 'udemy');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'mohsin', '$P$BHQGX.y4pmbPJtElxhBfxVMvWk8J6g0', 'mohsin', 'mohsin.hassan618@gmail.com', '', '2017-08-20 18:56:40', '', 0, 'mohsin'),
(2, 'langosh.geovany', '$P$Bi.ix1sdMSraZbihjBPy2Y8A2uleGV.', 'claud37', 'sabrina.waters@example.org', 'http://denesik.info/quia-doloribus-ab-veritatis-rem.html', '2017-08-22 03:39:07', '', 0, 'Darrel'),
(3, 'wiza.jillian', '$P$BByQ1E/q53Jx7j8HFHWqzfRcCgB2AD0', 'herbert84', 'dorothy.christiansen@example.org', 'https://tremblay.com/ut-et-illum-blanditiis-alias-labore-sapiente-aliquam.html', '2017-08-21 23:25:24', '', 0, 'Layne'),
(4, 'kaitlin96', '$P$BeKi.EiAZAqDWkJ1NZxeyAwGtI3mt2.', 'grant-edna', 'harber.nigel@example.com', 'http://robel.com/est-accusantium-eligendi-ut-illum-quibusdam.html', '2017-08-21 00:19:08', '', 0, 'Mylene'),
(5, 'jerry81', '$P$Bhb8YfH0BTq1OHE4hnD9M1bcZegTGg1', 'volkman-bianka', 'gcrona@example.net', 'https://www.stracke.com/officiis-neque-ut-veniam-fuga-est-nemo-sint', '2017-08-21 04:41:23', '', 0, 'Dannie'),
(6, 'laskdmflsad', '$P$BWtMyobt2fs.LgZDb98bxAHwV.u1EL0', 'laskdmflsad', '', '', '2017-11-26 14:04:50', '', 0, 'laskdmflsad'),
(7, 'admin', '$P$BAMR2.wT2/SEpXmowp4OAwFboCoIWT0', 'admin', 'admin@admin.com', '', '2017-11-30 09:49:25', '', 0, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `wp_wc_download_log`
--

CREATE TABLE `wp_wc_download_log` (
  `download_log_id` bigint(20) UNSIGNED NOT NULL,
  `timestamp` datetime NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_ip_address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_wc_webhooks`
--

CREATE TABLE `wp_wc_webhooks` (
  `webhook_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `topic` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `api_version` smallint(4) NOT NULL,
  `failure_count` smallint(10) NOT NULL DEFAULT '0',
  `pending_delivery` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_api_keys`
--

CREATE TABLE `wp_woocommerce_api_keys` (
  `key_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consumer_key` char(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consumer_secret` char(43) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nonces` longtext COLLATE utf8mb4_unicode_ci,
  `truncated_key` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_access` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_attribute_taxonomies`
--

CREATE TABLE `wp_woocommerce_attribute_taxonomies` (
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_label` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_orderby` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_public` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_woocommerce_attribute_taxonomies`
--

INSERT INTO `wp_woocommerce_attribute_taxonomies` (`attribute_id`, `attribute_name`, `attribute_label`, `attribute_type`, `attribute_orderby`, `attribute_public`) VALUES
(1, 'color', 'color', 'select', 'menu_order', 0),
(2, 'size', 'size', 'select', 'menu_order', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_downloadable_product_permissions`
--

CREATE TABLE `wp_woocommerce_downloadable_product_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `download_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `order_key` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `downloads_remaining` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_granted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access_expires` datetime DEFAULT NULL,
  `download_count` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_log`
--

CREATE TABLE `wp_woocommerce_log` (
  `log_id` bigint(20) UNSIGNED NOT NULL,
  `timestamp` datetime NOT NULL,
  `level` smallint(4) NOT NULL,
  `source` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `context` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_order_itemmeta`
--

CREATE TABLE `wp_woocommerce_order_itemmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_order_items`
--

CREATE TABLE `wp_woocommerce_order_items` (
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `order_item_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_item_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `order_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_payment_tokenmeta`
--

CREATE TABLE `wp_woocommerce_payment_tokenmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `payment_token_id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_payment_tokens`
--

CREATE TABLE `wp_woocommerce_payment_tokens` (
  `token_id` bigint(20) UNSIGNED NOT NULL,
  `gateway_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_sessions`
--

CREATE TABLE `wp_woocommerce_sessions` (
  `session_id` bigint(20) UNSIGNED NOT NULL,
  `session_key` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_expiry` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wp_woocommerce_sessions`
--

INSERT INTO `wp_woocommerce_sessions` (`session_id`, `session_key`, `session_value`, `session_expiry`) VALUES
(3, '1', 'a:7:{s:4:\"cart\";s:702:\"a:2:{s:32:\"d9d4f495e875a2e075a1a4a6e1b9770f\";a:10:{s:3:\"key\";s:32:\"d9d4f495e875a2e075a1a4a6e1b9770f\";s:10:\"product_id\";i:46;s:12:\"variation_id\";i:0;s:9:\"variation\";a:0:{}s:8:\"quantity\";i:1;s:13:\"line_tax_data\";a:2:{s:8:\"subtotal\";a:0:{}s:5:\"total\";a:0:{}}s:13:\"line_subtotal\";d:45;s:17:\"line_subtotal_tax\";i:0;s:10:\"line_total\";d:45;s:8:\"line_tax\";i:0;}s:32:\"67c6a1e7ce56d3d6fa748ab6d9af3fd7\";a:10:{s:3:\"key\";s:32:\"67c6a1e7ce56d3d6fa748ab6d9af3fd7\";s:10:\"product_id\";i:47;s:12:\"variation_id\";i:0;s:9:\"variation\";a:0:{}s:8:\"quantity\";i:1;s:13:\"line_tax_data\";a:2:{s:8:\"subtotal\";a:0:{}s:5:\"total\";a:0:{}}s:13:\"line_subtotal\";d:18;s:17:\"line_subtotal_tax\";i:0;s:10:\"line_total\";d:18;s:8:\"line_tax\";i:0;}}\";s:11:\"cart_totals\";s:405:\"a:15:{s:8:\"subtotal\";s:5:\"63.00\";s:12:\"subtotal_tax\";d:0;s:14:\"shipping_total\";s:4:\"0.00\";s:12:\"shipping_tax\";d:0;s:14:\"shipping_taxes\";a:0:{}s:14:\"discount_total\";d:0;s:12:\"discount_tax\";d:0;s:19:\"cart_contents_total\";s:5:\"63.00\";s:17:\"cart_contents_tax\";d:0;s:19:\"cart_contents_taxes\";a:0:{}s:9:\"fee_total\";s:4:\"0.00\";s:7:\"fee_tax\";d:0;s:9:\"fee_taxes\";a:0:{}s:5:\"total\";s:5:\"63.00\";s:9:\"total_tax\";d:0;}\";s:15:\"applied_coupons\";s:6:\"a:0:{}\";s:22:\"coupon_discount_totals\";s:6:\"a:0:{}\";s:26:\"coupon_discount_tax_totals\";s:6:\"a:0:{}\";s:21:\"removed_cart_contents\";s:6:\"a:0:{}\";s:8:\"customer\";s:714:\"a:26:{s:2:\"id\";s:1:\"1\";s:13:\"date_modified\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:4:\"city\";s:0:\"\";s:9:\"address_1\";s:0:\"\";s:7:\"address\";s:0:\"\";s:9:\"address_2\";s:0:\"\";s:5:\"state\";s:0:\"\";s:7:\"country\";s:2:\"PK\";s:17:\"shipping_postcode\";s:0:\"\";s:13:\"shipping_city\";s:0:\"\";s:18:\"shipping_address_1\";s:0:\"\";s:16:\"shipping_address\";s:0:\"\";s:18:\"shipping_address_2\";s:0:\"\";s:14:\"shipping_state\";s:0:\"\";s:16:\"shipping_country\";s:2:\"PK\";s:13:\"is_vat_exempt\";s:0:\"\";s:19:\"calculated_shipping\";s:0:\"\";s:10:\"first_name\";s:0:\"\";s:9:\"last_name\";s:0:\"\";s:7:\"company\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:5:\"email\";s:26:\"mohsin.hassan618@gmail.com\";s:19:\"shipping_first_name\";s:0:\"\";s:18:\"shipping_last_name\";s:0:\"\";s:16:\"shipping_company\";s:0:\"\";}\";}', 1523966408);

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_shipping_zones`
--

CREATE TABLE `wp_woocommerce_shipping_zones` (
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `zone_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zone_order` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_shipping_zone_locations`
--

CREATE TABLE `wp_woocommerce_shipping_zone_locations` (
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `location_code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_shipping_zone_methods`
--

CREATE TABLE `wp_woocommerce_shipping_zone_methods` (
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `instance_id` bigint(20) UNSIGNED NOT NULL,
  `method_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_order` bigint(20) UNSIGNED NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_tax_rates`
--

CREATE TABLE `wp_woocommerce_tax_rates` (
  `tax_rate_id` bigint(20) UNSIGNED NOT NULL,
  `tax_rate_country` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_state` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_priority` bigint(20) UNSIGNED NOT NULL,
  `tax_rate_compound` int(1) NOT NULL DEFAULT '0',
  `tax_rate_shipping` int(1) NOT NULL DEFAULT '1',
  `tax_rate_order` bigint(20) UNSIGNED NOT NULL,
  `tax_rate_class` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_tax_rate_locations`
--

CREATE TABLE `wp_woocommerce_tax_rate_locations` (
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `location_code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_rate_id` bigint(20) UNSIGNED NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wp_bp_activity`
--
ALTER TABLE `wp_bp_activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date_recorded` (`date_recorded`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `secondary_item_id` (`secondary_item_id`),
  ADD KEY `component` (`component`),
  ADD KEY `type` (`type`),
  ADD KEY `mptt_left` (`mptt_left`),
  ADD KEY `mptt_right` (`mptt_right`),
  ADD KEY `hide_sitewide` (`hide_sitewide`),
  ADD KEY `is_spam` (`is_spam`);

--
-- Indexes for table `wp_bp_activity_meta`
--
ALTER TABLE `wp_bp_activity_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_id` (`activity_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_bp_friends`
--
ALTER TABLE `wp_bp_friends`
  ADD PRIMARY KEY (`id`),
  ADD KEY `initiator_user_id` (`initiator_user_id`),
  ADD KEY `friend_user_id` (`friend_user_id`);

--
-- Indexes for table `wp_bp_groups`
--
ALTER TABLE `wp_bp_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `creator_id` (`creator_id`),
  ADD KEY `status` (`status`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `wp_bp_groups_groupmeta`
--
ALTER TABLE `wp_bp_groups_groupmeta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_bp_groups_members`
--
ALTER TABLE `wp_bp_groups_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `is_admin` (`is_admin`),
  ADD KEY `is_mod` (`is_mod`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `inviter_id` (`inviter_id`),
  ADD KEY `is_confirmed` (`is_confirmed`);

--
-- Indexes for table `wp_bp_messages_messages`
--
ALTER TABLE `wp_bp_messages_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `thread_id` (`thread_id`);

--
-- Indexes for table `wp_bp_messages_meta`
--
ALTER TABLE `wp_bp_messages_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message_id` (`message_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_bp_messages_notices`
--
ALTER TABLE `wp_bp_messages_notices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_active` (`is_active`);

--
-- Indexes for table `wp_bp_messages_recipients`
--
ALTER TABLE `wp_bp_messages_recipients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `thread_id` (`thread_id`),
  ADD KEY `is_deleted` (`is_deleted`),
  ADD KEY `sender_only` (`sender_only`),
  ADD KEY `unread_count` (`unread_count`);

--
-- Indexes for table `wp_bp_notifications`
--
ALTER TABLE `wp_bp_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `secondary_item_id` (`secondary_item_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `is_new` (`is_new`),
  ADD KEY `component_name` (`component_name`),
  ADD KEY `component_action` (`component_action`),
  ADD KEY `useritem` (`user_id`,`is_new`);

--
-- Indexes for table `wp_bp_notifications_meta`
--
ALTER TABLE `wp_bp_notifications_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_id` (`notification_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_bp_user_blogs`
--
ALTER TABLE `wp_bp_user_blogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `blog_id` (`blog_id`);

--
-- Indexes for table `wp_bp_user_blogs_blogmeta`
--
ALTER TABLE `wp_bp_user_blogs_blogmeta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_id` (`blog_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_bp_xprofile_data`
--
ALTER TABLE `wp_bp_xprofile_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `field_id` (`field_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `wp_bp_xprofile_fields`
--
ALTER TABLE `wp_bp_xprofile_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `field_order` (`field_order`),
  ADD KEY `can_delete` (`can_delete`),
  ADD KEY `is_required` (`is_required`);

--
-- Indexes for table `wp_bp_xprofile_groups`
--
ALTER TABLE `wp_bp_xprofile_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `can_delete` (`can_delete`);

--
-- Indexes for table `wp_bp_xprofile_meta`
--
ALTER TABLE `wp_bp_xprofile_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `object_id` (`object_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10)),
  ADD KEY `woo_idx_comment_type` (`comment_type`);

--
-- Indexes for table `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indexes for table `wp_popularpostsdata`
--
ALTER TABLE `wp_popularpostsdata`
  ADD PRIMARY KEY (`postid`);

--
-- Indexes for table `wp_popularpostssummary`
--
ALTER TABLE `wp_popularpostssummary`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `postid` (`postid`),
  ADD KEY `view_date` (`view_date`),
  ADD KEY `view_datetime` (`view_datetime`);

--
-- Indexes for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `wp_recipe_ratings`
--
ALTER TABLE `wp_recipe_ratings`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `wp_signups`
--
ALTER TABLE `wp_signups`
  ADD PRIMARY KEY (`signup_id`),
  ADD KEY `activation_key` (`activation_key`),
  ADD KEY `user_email` (`user_email`),
  ADD KEY `user_login_email` (`user_login`,`user_email`),
  ADD KEY `domain_path` (`domain`(140),`path`(51));

--
-- Indexes for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- Indexes for table `wp_wc_download_log`
--
ALTER TABLE `wp_wc_download_log`
  ADD PRIMARY KEY (`download_log_id`),
  ADD KEY `permission_id` (`permission_id`),
  ADD KEY `timestamp` (`timestamp`);

--
-- Indexes for table `wp_wc_webhooks`
--
ALTER TABLE `wp_wc_webhooks`
  ADD PRIMARY KEY (`webhook_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `wp_woocommerce_api_keys`
--
ALTER TABLE `wp_woocommerce_api_keys`
  ADD PRIMARY KEY (`key_id`),
  ADD KEY `consumer_key` (`consumer_key`),
  ADD KEY `consumer_secret` (`consumer_secret`);

--
-- Indexes for table `wp_woocommerce_attribute_taxonomies`
--
ALTER TABLE `wp_woocommerce_attribute_taxonomies`
  ADD PRIMARY KEY (`attribute_id`),
  ADD KEY `attribute_name` (`attribute_name`(20));

--
-- Indexes for table `wp_woocommerce_downloadable_product_permissions`
--
ALTER TABLE `wp_woocommerce_downloadable_product_permissions`
  ADD PRIMARY KEY (`permission_id`),
  ADD KEY `download_order_key_product` (`product_id`,`order_id`,`order_key`(16),`download_id`),
  ADD KEY `download_order_product` (`download_id`,`order_id`,`product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `wp_woocommerce_log`
--
ALTER TABLE `wp_woocommerce_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `level` (`level`);

--
-- Indexes for table `wp_woocommerce_order_itemmeta`
--
ALTER TABLE `wp_woocommerce_order_itemmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `order_item_id` (`order_item_id`),
  ADD KEY `meta_key` (`meta_key`(32));

--
-- Indexes for table `wp_woocommerce_order_items`
--
ALTER TABLE `wp_woocommerce_order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `wp_woocommerce_payment_tokenmeta`
--
ALTER TABLE `wp_woocommerce_payment_tokenmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `payment_token_id` (`payment_token_id`),
  ADD KEY `meta_key` (`meta_key`(32));

--
-- Indexes for table `wp_woocommerce_payment_tokens`
--
ALTER TABLE `wp_woocommerce_payment_tokens`
  ADD PRIMARY KEY (`token_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `wp_woocommerce_sessions`
--
ALTER TABLE `wp_woocommerce_sessions`
  ADD PRIMARY KEY (`session_key`),
  ADD UNIQUE KEY `session_id` (`session_id`);

--
-- Indexes for table `wp_woocommerce_shipping_zones`
--
ALTER TABLE `wp_woocommerce_shipping_zones`
  ADD PRIMARY KEY (`zone_id`);

--
-- Indexes for table `wp_woocommerce_shipping_zone_locations`
--
ALTER TABLE `wp_woocommerce_shipping_zone_locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `location_type_code` (`location_type`(10),`location_code`(20));

--
-- Indexes for table `wp_woocommerce_shipping_zone_methods`
--
ALTER TABLE `wp_woocommerce_shipping_zone_methods`
  ADD PRIMARY KEY (`instance_id`);

--
-- Indexes for table `wp_woocommerce_tax_rates`
--
ALTER TABLE `wp_woocommerce_tax_rates`
  ADD PRIMARY KEY (`tax_rate_id`),
  ADD KEY `tax_rate_country` (`tax_rate_country`),
  ADD KEY `tax_rate_state` (`tax_rate_state`(2)),
  ADD KEY `tax_rate_class` (`tax_rate_class`(10)),
  ADD KEY `tax_rate_priority` (`tax_rate_priority`);

--
-- Indexes for table `wp_woocommerce_tax_rate_locations`
--
ALTER TABLE `wp_woocommerce_tax_rate_locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `tax_rate_id` (`tax_rate_id`),
  ADD KEY `location_type_code` (`location_type`(10),`location_code`(20));

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wp_bp_activity`
--
ALTER TABLE `wp_bp_activity`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `wp_bp_activity_meta`
--
ALTER TABLE `wp_bp_activity_meta`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `wp_bp_friends`
--
ALTER TABLE `wp_bp_friends`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_bp_groups`
--
ALTER TABLE `wp_bp_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_bp_groups_groupmeta`
--
ALTER TABLE `wp_bp_groups_groupmeta`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_bp_groups_members`
--
ALTER TABLE `wp_bp_groups_members`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_bp_messages_messages`
--
ALTER TABLE `wp_bp_messages_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_bp_messages_meta`
--
ALTER TABLE `wp_bp_messages_meta`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_bp_messages_notices`
--
ALTER TABLE `wp_bp_messages_notices`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_bp_messages_recipients`
--
ALTER TABLE `wp_bp_messages_recipients`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_bp_notifications`
--
ALTER TABLE `wp_bp_notifications`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_bp_notifications_meta`
--
ALTER TABLE `wp_bp_notifications_meta`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_bp_user_blogs`
--
ALTER TABLE `wp_bp_user_blogs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `wp_bp_user_blogs_blogmeta`
--
ALTER TABLE `wp_bp_user_blogs_blogmeta`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `wp_bp_xprofile_data`
--
ALTER TABLE `wp_bp_xprofile_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `wp_bp_xprofile_fields`
--
ALTER TABLE `wp_bp_xprofile_fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wp_bp_xprofile_groups`
--
ALTER TABLE `wp_bp_xprofile_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wp_bp_xprofile_meta`
--
ALTER TABLE `wp_bp_xprofile_meta`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3098;
--
-- AUTO_INCREMENT for table `wp_popularpostssummary`
--
ALTER TABLE `wp_popularpostssummary`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=271;
--
-- AUTO_INCREMENT for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2231;
--
-- AUTO_INCREMENT for table `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=248;
--
-- AUTO_INCREMENT for table `wp_recipe_ratings`
--
ALTER TABLE `wp_recipe_ratings`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `wp_signups`
--
ALTER TABLE `wp_signups`
  MODIFY `signup_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;
--
-- AUTO_INCREMENT for table `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `wp_wc_download_log`
--
ALTER TABLE `wp_wc_download_log`
  MODIFY `download_log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_wc_webhooks`
--
ALTER TABLE `wp_wc_webhooks`
  MODIFY `webhook_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_woocommerce_api_keys`
--
ALTER TABLE `wp_woocommerce_api_keys`
  MODIFY `key_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_woocommerce_attribute_taxonomies`
--
ALTER TABLE `wp_woocommerce_attribute_taxonomies`
  MODIFY `attribute_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `wp_woocommerce_downloadable_product_permissions`
--
ALTER TABLE `wp_woocommerce_downloadable_product_permissions`
  MODIFY `permission_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_woocommerce_log`
--
ALTER TABLE `wp_woocommerce_log`
  MODIFY `log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_woocommerce_order_itemmeta`
--
ALTER TABLE `wp_woocommerce_order_itemmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_woocommerce_order_items`
--
ALTER TABLE `wp_woocommerce_order_items`
  MODIFY `order_item_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_woocommerce_payment_tokenmeta`
--
ALTER TABLE `wp_woocommerce_payment_tokenmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_woocommerce_payment_tokens`
--
ALTER TABLE `wp_woocommerce_payment_tokens`
  MODIFY `token_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_woocommerce_sessions`
--
ALTER TABLE `wp_woocommerce_sessions`
  MODIFY `session_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `wp_woocommerce_shipping_zones`
--
ALTER TABLE `wp_woocommerce_shipping_zones`
  MODIFY `zone_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_woocommerce_shipping_zone_locations`
--
ALTER TABLE `wp_woocommerce_shipping_zone_locations`
  MODIFY `location_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_woocommerce_shipping_zone_methods`
--
ALTER TABLE `wp_woocommerce_shipping_zone_methods`
  MODIFY `instance_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_woocommerce_tax_rates`
--
ALTER TABLE `wp_woocommerce_tax_rates`
  MODIFY `tax_rate_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_woocommerce_tax_rate_locations`
--
ALTER TABLE `wp_woocommerce_tax_rate_locations`
  MODIFY `location_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
