/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50137
 Source Host           : localhost
 Source Database       : teambox2

 Target Server Type    : MySQL
 Target Server Version : 50137
 File Encoding         : utf-8

 Date: 03/29/2012 20:57:02 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `activities`
-- ----------------------------
DROP TABLE IF EXISTS `activities`;
CREATE TABLE `activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `target_type` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `comment_target_type` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `comment_target_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `last_activity_id` int(11) DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_activities_on_created_at` (`created_at`),
  KEY `index_activities_on_project_id` (`project_id`),
  KEY `index_activities_on_target_type` (`target_type`),
  KEY `index_activities_on_target_id` (`target_id`),
  KEY `index_activities_on_deleted` (`deleted`),
  KEY `index_activities_on_last_activity_id` (`last_activity_id`),
  KEY `index_activities_on_comment_target_type` (`comment_target_type`),
  KEY `index_activities_on_comment_target_id` (`comment_target_id`),
  KEY `index_activities_on_is_private` (`is_private`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `addresses`
-- ----------------------------
DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_id` int(11) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `account_type` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `announcements`
-- ----------------------------
DROP TABLE IF EXISTS `announcements`;
CREATE TABLE `announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `app_links`
-- ----------------------------
DROP TABLE IF EXISTS `app_links`;
CREATE TABLE `app_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `app_user_id` varchar(255) DEFAULT NULL,
  `custom_attributes` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `credentials` text,
  PRIMARY KEY (`id`),
  KEY `index_app_links_on_user_id` (`user_id`),
  KEY `index_app_links_on_provider_and_app_user_id` (`provider`,`app_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `cards`
-- ----------------------------
DROP TABLE IF EXISTS `cards`;
CREATE TABLE `cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `public` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `client_applications`
-- ----------------------------
DROP TABLE IF EXISTS `client_applications`;
CREATE TABLE `client_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `support_url` varchar(255) DEFAULT NULL,
  `callback_url` varchar(255) DEFAULT NULL,
  `key` varchar(40) DEFAULT NULL,
  `secret` varchar(40) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_client_applications_on_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `comments`
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_id` int(11) DEFAULT NULL,
  `target_type` varchar(255) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `body` text,
  `body_html` text,
  `hours` float DEFAULT NULL,
  `billable` tinyint(1) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `previous_status` int(11) DEFAULT NULL,
  `assigned_id` int(11) DEFAULT NULL,
  `previous_assigned_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `due_on` date DEFAULT NULL,
  `previous_due_on` date DEFAULT NULL,
  `uploads_count` int(11) DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `urgent` tinyint(1) NOT NULL DEFAULT '0',
  `previous_urgent` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_comments_on_target_type_and_target_id_and_user_id` (`target_type`,`target_id`,`user_id`),
  KEY `index_comments_on_deleted` (`deleted`),
  KEY `index_comments_on_project_id` (`project_id`),
  KEY `index_comments_on_created_at` (`created_at`),
  KEY `index_comments_on_hours` (`hours`),
  KEY `index_comments_on_is_private` (`is_private`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `comments_read`
-- ----------------------------
DROP TABLE IF EXISTS `comments_read`;
CREATE TABLE `comments_read` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_id` int(11) DEFAULT NULL,
  `target_type` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `last_read_comment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_read_on_target_type_and_target_id_and_user_id` (`target_type`,`target_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `conversations`
-- ----------------------------
DROP TABLE IF EXISTS `conversations`;
CREATE TABLE `conversations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `last_comment_id` int(11) DEFAULT NULL,
  `comments_count` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `simple` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `converted_to` int(11) DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_conversations_on_project_id` (`project_id`),
  KEY `index_conversations_on_deleted` (`deleted`),
  KEY `index_conversations_on_is_private` (`is_private`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `dividers`
-- ----------------------------
DROP TABLE IF EXISTS `dividers`;
CREATE TABLE `dividers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_dividers_on_page_id` (`page_id`),
  KEY `index_dividers_on_deleted` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `email_addresses`
-- ----------------------------
DROP TABLE IF EXISTS `email_addresses`;
CREATE TABLE `email_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `account_type` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `email_bounces`
-- ----------------------------
DROP TABLE IF EXISTS `email_bounces`;
CREATE TABLE `email_bounces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `exception_type` varchar(255) DEFAULT NULL,
  `exception_message` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_email_bounces_on_email` (`email`),
  KEY `index_email_bounces_on_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `emails`
-- ----------------------------
DROP TABLE IF EXISTS `emails`;
CREATE TABLE `emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `last_send_attempt` int(11) DEFAULT '0',
  `mail` text,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `folders`
-- ----------------------------
DROP TABLE IF EXISTS `folders`;
CREATE TABLE `folders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `parent_folder_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_folders_on_token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `google_docs`
-- ----------------------------
DROP TABLE IF EXISTS `google_docs`;
CREATE TABLE `google_docs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `document_id` varchar(255) DEFAULT NULL,
  `document_type` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `edit_url` varchar(255) DEFAULT NULL,
  `acl_url` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `write_lock` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_google_docs_on_project_id` (`project_id`),
  KEY `index_google_docs_on_user_id` (`user_id`),
  KEY `index_google_docs_on_comment_id` (`comment_id`),
  KEY `index_google_docs_on_deleted` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `ims`
-- ----------------------------
DROP TABLE IF EXISTS `ims`;
CREATE TABLE `ims` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `account_im_type` int(11) DEFAULT '0',
  `account_type` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `invitations`
-- ----------------------------
DROP TABLE IF EXISTS `invitations`;
CREATE TABLE `invitations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `role` int(11) DEFAULT '2',
  `email` varchar(255) DEFAULT NULL,
  `invited_user_id` int(11) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `membership` int(11) DEFAULT '10',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_invitations_on_deleted` (`deleted`),
  KEY `index_invitations_on_project_id` (`project_id`),
  KEY `index_invitations_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `memberships`
-- ----------------------------
DROP TABLE IF EXISTS `memberships`;
CREATE TABLE `memberships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `role` int(11) DEFAULT '20',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `notes`
-- ----------------------------
DROP TABLE IF EXISTS `notes`;
CREATE TABLE `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `body` text,
  `body_html` text,
  `position` int(11) DEFAULT NULL,
  `last_comment_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_notes_on_page_id` (`page_id`),
  KEY `index_notes_on_deleted` (`deleted`),
  KEY `index_notes_on_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `notifications`
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `target_type` varchar(255) DEFAULT NULL,
  `sent` tinyint(1) DEFAULT '0',
  `read` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_notifications_on_user_id_and_read` (`user_id`,`read`),
  KEY `index_notifications_on_person_id_and_sent` (`person_id`,`sent`),
  KEY `index_notifications_on_comment_id` (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `oauth_nonces`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_nonces`;
CREATE TABLE `oauth_nonces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nonce` varchar(255) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_oauth_nonces_on_nonce_and_timestamp` (`nonce`,`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `oauth_tokens`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_tokens`;
CREATE TABLE `oauth_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `client_application_id` int(11) DEFAULT NULL,
  `token` varchar(40) DEFAULT NULL,
  `secret` varchar(40) DEFAULT NULL,
  `callback_url` varchar(255) DEFAULT NULL,
  `verifier` varchar(20) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `authorized_at` datetime DEFAULT NULL,
  `invalidated_at` datetime DEFAULT NULL,
  `valid_to` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_oauth_tokens_on_token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `organizations`
-- ----------------------------
DROP TABLE IF EXISTS `organizations`;
CREATE TABLE `organizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `permalink` varchar(255) NOT NULL,
  `language` varchar(255) DEFAULT 'en',
  `time_zone` varchar(255) DEFAULT 'Eastern Time (US & Canada)',
  `domain` varchar(255) DEFAULT NULL,
  `description` text,
  `logo_file_name` varchar(255) DEFAULT NULL,
  `logo_content_type` varchar(255) DEFAULT NULL,
  `logo_file_size` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `settings` text,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_organizations_on_permalink` (`permalink`),
  KEY `index_organizations_on_domain` (`domain`),
  KEY `index_organizations_on_deleted` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `page_slots`
-- ----------------------------
DROP TABLE IF EXISTS `page_slots`;
CREATE TABLE `page_slots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `rel_object_id` int(11) NOT NULL DEFAULT '0',
  `rel_object_type` varchar(30) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `pages`
-- ----------------------------
DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `last_comment_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `permalink` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_pages_on_project_id` (`project_id`),
  KEY `index_pages_on_deleted` (`deleted`),
  KEY `index_pages_on_is_private` (`is_private`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `people`
-- ----------------------------
DROP TABLE IF EXISTS `people`;
CREATE TABLE `people` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `source_user_id` int(11) DEFAULT NULL,
  `permissions` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT '2',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `digest` int(11) DEFAULT '0',
  `last_digest_delivery` datetime DEFAULT NULL,
  `next_digest_delivery` datetime DEFAULT NULL,
  `watch_new_task` tinyint(1) DEFAULT '0',
  `watch_new_conversation` tinyint(1) DEFAULT '0',
  `watch_new_page` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_people_on_user_id_and_project_id` (`user_id`,`project_id`),
  KEY `index_people_on_project_id` (`project_id`),
  KEY `index_people_on_user_id` (`user_id`),
  KEY `index_people_on_deleted` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `phone_numbers`
-- ----------------------------
DROP TABLE IF EXISTS `phone_numbers`;
CREATE TABLE `phone_numbers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `account_type` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `projects`
-- ----------------------------
DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `permalink` varchar(255) DEFAULT NULL,
  `last_comment_id` int(11) DEFAULT NULL,
  `comments_count` int(11) NOT NULL DEFAULT '0',
  `archived` tinyint(1) DEFAULT '0',
  `tracks_time` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `public` tinyint(1) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_projects_on_permalink` (`permalink`),
  KEY `index_projects_on_deleted` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `reset_passwords`
-- ----------------------------
DROP TABLE IF EXISTS `reset_passwords`;
CREATE TABLE `reset_passwords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `reset_code` varchar(255) DEFAULT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `schema_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `schema_migrations`;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `schema_migrations`
-- ----------------------------
BEGIN;
INSERT INTO `schema_migrations` VALUES ('20100429210031'), ('20100429222246'), ('20100505055336'), ('20100511133109'), ('20100521093855'), ('20100613181634'), ('20100614131154'), ('20100714113347'), ('20100727153714'), ('20100729134941'), ('20100802115606'), ('20100802193633'), ('20100807200706'), ('20100808072052'), ('20100808122052'), ('20100815175602'), ('20100817104609'), ('20100817111219'), ('20100818185843'), ('20100826150615'), ('20100901153649'), ('20100903152418'), ('20100916140725'), ('20101013172028'), ('20101014112847'), ('20101026091837'), ('20101102171331'), ('20101102171602'), ('20101109112722'), ('20101112132101'), ('20101115162241'), ('20101117103529'), ('20101121194455'), ('20101123155108'), ('20101124111325'), ('20101130163336'), ('20101208193430'), ('20101215175148'), ('20101220141905'), ('20110107120943'), ('20110117210422'), ('20110117211601'), ('20110125200118'), ('20110211173002'), ('20110212184746'), ('20110222150934'), ('20110228153429'), ('20110228182657'), ('20110228211014'), ('20110301182608'), ('20110301195721'), ('20110303172637'), ('20110307185353'), ('20110307204107'), ('20110308160737'), ('20110317144743'), ('20110321095245'), ('20110324153051'), ('20110325195500'), ('20110404210516'), ('20110404233401'), ('20110418210553'), ('20110511003051'), ('20110511060055'), ('20110516120900'), ('20110517003032'), ('20110517231302'), ('20110523122936'), ('20110524125342'), ('20110602230212'), ('20110618072022'), ('20110620141747'), ('20110622145207'), ('20110622151731'), ('20110622154231'), ('20110622155452'), ('20110623083525'), ('20110722194606'), ('20110725155921'), ('20110808082545'), ('20110812101537'), ('20110812102452'), ('20110818091722'), ('20110826144729'), ('20110831142330'), ('20110902112234');
COMMIT;

-- ----------------------------
--  Table structure for `sessions`
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) NOT NULL DEFAULT '',
  `data` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sessions_on_session_id` (`session_id`),
  KEY `index_sessions_on_updated_at` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `sessions`
-- ----------------------------
BEGIN;
INSERT INTO `sessions` VALUES ('1', '321e03f8e621cda21cda1aec520508ba', 'BAh7ByIQX2NzcmZfdG9rZW4iMXIzZDA3dTZNZzdJRXhXNVZ1dm5MelFBV2s3\ncFRjcGh5R0d2NHVDOFlHVms9Ig5yZXR1cm5fdG8iG2h0dHA6Ly9sb2NhbGhv\nc3Q6MzAwMC8=\n', '2012-03-12 11:14:32', '2012-03-12 11:14:34');
COMMIT;

-- ----------------------------
--  Table structure for `social_networks`
-- ----------------------------
DROP TABLE IF EXISTS `social_networks`;
CREATE TABLE `social_networks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `account_network_type` int(11) DEFAULT '0',
  `account_type` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `task_list_templates`
-- ----------------------------
DROP TABLE IF EXISTS `task_list_templates`;
CREATE TABLE `task_list_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `raw_tasks` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `task_lists`
-- ----------------------------
DROP TABLE IF EXISTS `task_lists`;
CREATE TABLE `task_lists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `last_comment_id` int(11) DEFAULT NULL,
  `comments_count` int(11) NOT NULL DEFAULT '0',
  `archived` tinyint(1) DEFAULT '0',
  `archived_tasks_count` int(11) NOT NULL DEFAULT '0',
  `tasks_count` int(11) NOT NULL DEFAULT '0',
  `completed_at` datetime DEFAULT NULL,
  `start_on` date DEFAULT NULL,
  `finish_on` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_task_lists_on_project_id` (`project_id`),
  KEY `index_task_lists_on_deleted` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `tasks`
-- ----------------------------
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `task_list_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `comments_count` int(11) NOT NULL DEFAULT '0',
  `last_comment_id` int(11) DEFAULT NULL,
  `assigned_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `due_on` date DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `google_calendar_url_token` varchar(255) DEFAULT NULL,
  `urgent` tinyint(1) NOT NULL DEFAULT '0',
  `record_conversion_id` int(11) DEFAULT NULL,
  `record_conversion_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_tasks_on_project_id` (`project_id`),
  KEY `index_tasks_on_task_list_id` (`task_list_id`),
  KEY `index_tasks_on_deleted` (`deleted`),
  KEY `index_tasks_on_assigned_id` (`assigned_id`),
  KEY `index_tasks_on_is_private` (`is_private`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `teambox_datas`
-- ----------------------------
DROP TABLE IF EXISTS `teambox_datas`;
CREATE TABLE `teambox_datas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `project_ids` text,
  `processed_data_file_name` varchar(255) DEFAULT NULL,
  `processed_data_content_type` varchar(255) DEFAULT NULL,
  `processed_data_file_size` int(11) DEFAULT NULL,
  `processed_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `processed_objects` text,
  `service` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `organization_id` int(11) DEFAULT NULL,
  `user_map` text,
  PRIMARY KEY (`id`),
  KEY `index_teambox_datas_on_deleted` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `uploads`
-- ----------------------------
DROP TABLE IF EXISTS `uploads`;
CREATE TABLE `uploads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `description` text,
  `asset_file_name` varchar(255) DEFAULT NULL,
  `asset_content_type` varchar(255) DEFAULT NULL,
  `asset_file_size` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `parent_folder_id` int(11) DEFAULT NULL,
  `token` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_uploads_on_comment_id` (`comment_id`),
  KEY `index_uploads_on_deleted` (`deleted`),
  KEY `index_uploads_on_project_id_and_deleted_and_updated_at` (`project_id`,`deleted`,`updated_at`),
  KEY `index_uploads_on_is_private` (`is_private`),
  KEY `index_uploads_on_page_id_and_asset_file_name` (`page_id`,`asset_file_name`),
  KEY `index_uploads_on_token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(40) DEFAULT NULL,
  `first_name` varchar(20) DEFAULT '',
  `last_name` varchar(20) DEFAULT '',
  `biography` text,
  `email` varchar(100) DEFAULT NULL,
  `crypted_password` varchar(40) DEFAULT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `remember_token` varchar(40) DEFAULT NULL,
  `remember_token_expires_at` datetime DEFAULT NULL,
  `time_zone` varchar(255) DEFAULT 'Eastern Time (US & Canada)',
  `locale` varchar(255) DEFAULT 'en',
  `first_day_of_week` varchar(255) DEFAULT 'sunday',
  `invitations_count` int(11) NOT NULL DEFAULT '0',
  `login_token` varchar(40) DEFAULT NULL,
  `login_token_expires_at` datetime DEFAULT NULL,
  `confirmed_user` tinyint(1) DEFAULT '0',
  `rss_token` varchar(40) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT '0',
  `comments_count` int(11) NOT NULL DEFAULT '0',
  `notify_mentions` tinyint(1) DEFAULT '1',
  `notify_conversations` tinyint(1) DEFAULT '1',
  `notify_tasks` tinyint(1) DEFAULT '1',
  `avatar_file_name` varchar(255) DEFAULT NULL,
  `avatar_content_type` varchar(255) DEFAULT NULL,
  `avatar_file_size` int(11) DEFAULT NULL,
  `invited_by_id` int(11) DEFAULT NULL,
  `invited_count` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `wants_task_reminder` tinyint(1) DEFAULT '1',
  `recent_projects_ids` text,
  `feature_level` varchar(255) DEFAULT '',
  `spreedly_token` varchar(255) DEFAULT '',
  `avatar_updated_at` datetime DEFAULT NULL,
  `visited_at` datetime DEFAULT NULL,
  `betatester` tinyint(1) DEFAULT '0',
  `splash_screen` tinyint(1) DEFAULT '0',
  `assigned_tasks_count` int(11) DEFAULT NULL,
  `completed_tasks_count` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `settings` text,
  `digest_delivery_hour` int(11) DEFAULT '9',
  `instant_notification_on_mention` tinyint(1) DEFAULT '1',
  `default_digest` int(11) DEFAULT '0',
  `default_watch_new_task` tinyint(1) DEFAULT '0',
  `default_watch_new_conversation` tinyint(1) DEFAULT '0',
  `default_watch_new_page` tinyint(1) DEFAULT '0',
  `notify_pages` tinyint(1) DEFAULT '0',
  `google_calendar_url_token` varchar(255) DEFAULT NULL,
  `auto_accept_invites` tinyint(1) DEFAULT '1',
  `authentication_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_login` (`login`),
  UNIQUE KEY `index_users_on_auth_token` (`authentication_token`),
  KEY `index_users_on_deleted` (`deleted`),
  KEY `index_users_on_email_and_deleted_and_updated_at` (`email`,`deleted`,`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `versions`
-- ----------------------------
DROP TABLE IF EXISTS `versions`;
CREATE TABLE `versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `versioned_id` int(11) DEFAULT NULL,
  `versioned_type` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `modifications` text,
  `number` int(11) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_versions_on_versioned_id_and_versioned_type` (`versioned_id`,`versioned_type`),
  KEY `index_versions_on_user_id_and_user_type` (`user_id`,`user_type`),
  KEY `index_versions_on_user_name` (`user_name`),
  KEY `index_versions_on_number` (`number`),
  KEY `index_versions_on_tag` (`tag`),
  KEY `index_versions_on_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `watchers`
-- ----------------------------
DROP TABLE IF EXISTS `watchers`;
CREATE TABLE `watchers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `watchable_id` int(11) DEFAULT NULL,
  `watchable_type` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueness_index` (`user_id`,`watchable_id`,`watchable_type`),
  UNIQUE KEY `watchers_uniqueness_index` (`user_id`,`watchable_id`,`watchable_type`),
  KEY `index_watchers_on_user_id` (`user_id`),
  KEY `index_watchers_on_watchable_id` (`watchable_id`),
  KEY `index_watchers_on_watchable_type` (`watchable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `websites`
-- ----------------------------
DROP TABLE IF EXISTS `websites`;
CREATE TABLE `websites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `account_type` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

