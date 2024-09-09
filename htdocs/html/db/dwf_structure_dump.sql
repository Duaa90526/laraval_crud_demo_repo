/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.5.5-10.1.30-MariaDB : Database - dwfprod
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dwfprod` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `dwfprod`;

/*Table structure for table `api_logs` */

DROP TABLE IF EXISTS `api_logs`;

CREATE TABLE `api_logs` (
  `api_log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `api_name` varchar(50) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT '0.0.0.0',
  `url` varchar(500) DEFAULT NULL,
  `trigger_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `response_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `request_data` varchar(500) DEFAULT NULL,
  `response_count` int(10) DEFAULT NULL,
  `response_status` varchar(20) DEFAULT NULL,
  `response_message` varchar(50) DEFAULT NULL,
  `success` tinyint(2) DEFAULT NULL,
  `entity_type` varchar(50) DEFAULT NULL,
  `entity_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`api_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `api_logs` */

/*Table structure for table `attendance` */

DROP TABLE IF EXISTS `attendance`;

CREATE TABLE `attendance` (
  `record_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `type` enum('checkin','checkout') DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `entry_time` datetime DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5876 DEFAULT CHARSET=latin1;

/*Data for the table `attendance` */

/*Table structure for table `authentication` */

DROP TABLE IF EXISTS `authentication`;

CREATE TABLE `authentication` (
  `record_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `device_id` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`),
  KEY `device_id` (`device_id`),
  KEY `user_id` (`user_id`),
  KEY `code` (`code`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `authentication` */

/*Table structure for table `branch` */

DROP TABLE IF EXISTS `branch`;

CREATE TABLE `branch` (
  `branch_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `branch_name` tinytext,
  `branch_address` varchar(512) DEFAULT NULL,
  `branch_code` varchar(100) DEFAULT NULL,
  `latitude` double(9,6) DEFAULT NULL,
  `longitude` double(9,6) DEFAULT NULL,
  `branch_email` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `branch` */

/*Table structure for table `branch_city_region` */

DROP TABLE IF EXISTS `branch_city_region`;

CREATE TABLE `branch_city_region` (
  `record_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `region_name` varchar(255) DEFAULT NULL,
  `branch_code` int(11) DEFAULT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `city_name` varchar(255) DEFAULT NULL,
  `branch_status` enum('1','-1') DEFAULT '1',
  `counter` bigint(20) DEFAULT '0',
  `added_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `branch_city_region` */

/*Table structure for table `branch_person` */

DROP TABLE IF EXISTS `branch_person`;

CREATE TABLE `branch_person` (
  `record_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `meet_with` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `branch_person` */

/*Table structure for table `branch_target` */

DROP TABLE IF EXISTS `branch_target`;

CREATE TABLE `branch_target` (
  `branch_target_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `region` varchar(255) DEFAULT NULL,
  `branch_code` varchar(255) DEFAULT NULL,
  `dao_branch` varchar(255) DEFAULT NULL,
  `year` int(10) unsigned DEFAULT NULL,
  `month` int(10) unsigned DEFAULT NULL,
  `date` date DEFAULT NULL,
  `net_target` bigint(20) DEFAULT NULL,
  `new_customer` double(10,2) DEFAULT NULL,
  `new_hiring` double(10,2) DEFAULT NULL,
  `revenue` double(14,2) DEFAULT NULL,
  `mtpf_target` double(14,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`branch_target_id`),
  KEY `date` (`date`),
  KEY `branch_code` (`branch_code`),
  KEY `net_target` (`net_target`),
  KEY `new_customer` (`new_customer`),
  KEY `new_hiring` (`new_hiring`),
  KEY `revenue` (`revenue`),
  KEY `mtpf_target` (`mtpf_target`),
  KEY `month` (`month`),
  KEY `year` (`year`),
  KEY `branch_code_2` (`branch_code`),
  KEY `dao_branch` (`dao_branch`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `branch_target` */

/*Table structure for table `companies` */

DROP TABLE IF EXISTS `companies`;

CREATE TABLE `companies` (
  `company_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) DEFAULT NULL,
  `company_category` varchar(255) DEFAULT NULL,
  `domain_name` varchar(255) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `no_of_users` int(4) unsigned DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

/*Data for the table `companies` */

insert  into `companies`(`company_id`,`company_name`,`company_category`,`domain_name`,`email_address`,`no_of_users`,`status`,`created_at`) values (42,'UHF Solutions','Finance','uhfsolutions.com','tariq@uhfsolutions.com',4,'active','2021-02-22 11:06:29'),(43,'EHUB','Finance','ehub.pk','tariq@ehub.pk',4,'inactive','2021-03-20 10:09:10');

/*Table structure for table `company_branches` */

DROP TABLE IF EXISTS `company_branches`;

CREATE TABLE `company_branches` (
  `record_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) NOT NULL,
  `region_id` bigint(20) NOT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_on` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `company_branches` */

insert  into `company_branches`(`record_id`,`company_id`,`region_id`,`branch_name`,`status`,`created_on`,`created_by`,`updated_on`) values (1,42,1,'Branch1','active',NULL,NULL,NULL),(2,42,1,'Branch2','active',NULL,NULL,NULL),(3,42,2,'Branch3','active',NULL,NULL,NULL);

/*Table structure for table `company_configurations` */

DROP TABLE IF EXISTS `company_configurations`;

CREATE TABLE `company_configurations` (
  `record_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) unsigned DEFAULT NULL,
  `color_theme` varchar(20) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `company_configurations` */

/*Table structure for table `company_designations` */

DROP TABLE IF EXISTS `company_designations`;

CREATE TABLE `company_designations` (
  `record_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) NOT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_on` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `company_designations` */

insert  into `company_designations`(`record_id`,`company_id`,`role_name`,`status`,`created_on`,`created_by`,`updated_on`) values (1,42,'ASM','active',NULL,NULL,NULL),(2,42,'NSM','active',NULL,NULL,NULL);

/*Table structure for table `company_regions` */

DROP TABLE IF EXISTS `company_regions`;

CREATE TABLE `company_regions` (
  `record_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) NOT NULL,
  `region_name` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_on` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `company_regions` */

insert  into `company_regions`(`record_id`,`company_id`,`region_name`,`status`,`created_on`,`created_by`,`updated_on`) values (1,42,'Region1','active',NULL,NULL,NULL),(2,42,'Region2','active',NULL,NULL,NULL);

/*Table structure for table `edit_user_mapping` */

DROP TABLE IF EXISTS `edit_user_mapping`;

CREATE TABLE `edit_user_mapping` (
  `user_mapping_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `login_id` bigint(20) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_role` varchar(255) DEFAULT NULL,
  `report_to_id` bigint(20) DEFAULT NULL,
  `report_to_name` varchar(255) DEFAULT NULL,
  `report_to_role` varchar(255) DEFAULT NULL,
  `assign_to_user_id` bigint(20) DEFAULT NULL,
  `assign_to_name` varchar(255) DEFAULT NULL,
  `assign_to_role` varchar(255) DEFAULT NULL,
  `status` enum('pending','approve','reject') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `added_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_mapping_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `edit_user_mapping` */

/*Table structure for table `lead_sources` */

DROP TABLE IF EXISTS `lead_sources`;

CREATE TABLE `lead_sources` (
  `record_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `lead_sources` */

insert  into `lead_sources`(`record_id`,`name`,`status`,`company_id`,`created_by`,`created_at`,`updated_at`) values (1,'btl',NULL,NULL,NULL,NULL,NULL),(2,'call_center',NULL,NULL,NULL,NULL,NULL),(3,'sms',NULL,NULL,NULL,NULL,NULL),(4,'app',NULL,NULL,NULL,NULL,NULL),(5,'website',NULL,NULL,NULL,NULL,NULL),(6,'social_media',NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `lead_statuses` */

DROP TABLE IF EXISTS `lead_statuses`;

CREATE TABLE `lead_statuses` (
  `record_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `lead_statuses` */

insert  into `lead_statuses`(`record_id`,`name`,`status`,`company_id`,`created_by`,`created_at`,`updated_at`) values (1,'not_interesed',NULL,NULL,NULL,NULL,NULL),(2,'inprocess',NULL,NULL,NULL,NULL,NULL),(3,'closed',NULL,NULL,NULL,NULL,NULL),(4,'qualified',NULL,NULL,NULL,NULL,NULL),(5,'followup',NULL,NULL,NULL,NULL,NULL),(6,'not_available',NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `lead_user_statuses` */

DROP TABLE IF EXISTS `lead_user_statuses`;

CREATE TABLE `lead_user_statuses` (
  `record_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `lead_user_statuses` */

insert  into `lead_user_statuses`(`record_id`,`name`,`status`,`company_id`,`created_by`,`created_at`,`updated_at`) values (1,'pending',NULL,NULL,NULL,NULL,NULL),(2,'accepted',NULL,NULL,NULL,NULL,NULL),(3,'rejected',NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `lead_users` */

DROP TABLE IF EXISTS `lead_users`;

CREATE TABLE `lead_users` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `distance_difference` varchar(255) DEFAULT NULL,
  `lead_user_status` varchar(255) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `lead_users` */

/*Table structure for table `leads` */

DROP TABLE IF EXISTS `leads`;

CREATE TABLE `leads` (
  `record_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `home_phone_number` int(11) DEFAULT NULL,
  `office_phone_number` int(11) DEFAULT NULL,
  `mobile_phone_number` int(11) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `address` varchar(512) DEFAULT NULL,
  `age` varchar(20) DEFAULT NULL,
  `gender` enum('female','male') DEFAULT NULL,
  `marital_status` enum('yes','no') DEFAULT NULL,
  `parent_account_for_lead` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `auto_assignment` enum('yes','no') DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `user_code` varchar(255) DEFAULT NULL,
  `international_lead` enum('yes','no') DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `near_by_location` varchar(512) DEFAULT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `employment` enum('yes','no') DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `potential_amount` varchar(255) DEFAULT NULL,
  `expected_amount` varchar(20) DEFAULT NULL,
  `expected_closure_date` varchar(255) DEFAULT NULL,
  `probability` varchar(20) DEFAULT NULL,
  `follow_up_date` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `branch_code` varchar(255) DEFAULT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `lead_status` varchar(255) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `crm_lead_id` varchar(255) DEFAULT NULL,
  `crm_update_id` varchar(255) DEFAULT NULL,
  `crm_order_id` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `campaign_id` bigint(20) DEFAULT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT NULL,
  `is_closed` enum('yes','no') DEFAULT 'no',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `dao_id` (`user_id`),
  KEY `created_at` (`created_at`),
  KEY `lead_id` (`record_id`),
  KEY `lead_status` (`lead_status`),
  KEY `lead_source` (`source`),
  KEY `region` (`region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `leads` */

/*Table structure for table `lov_registercompany` */

DROP TABLE IF EXISTS `lov_registercompany`;

CREATE TABLE `lov_registercompany` (
  `registercompany_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `companyname` varchar(255) DEFAULT NULL,
  `rate` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` enum('1','-1') DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`registercompany_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `lov_registercompany` */

/*Table structure for table `mapping_history` */

DROP TABLE IF EXISTS `mapping_history`;

CREATE TABLE `mapping_history` (
  `mapping_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `child_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`mapping_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mapping_history` */

/*Table structure for table `mapping_redemption` */

DROP TABLE IF EXISTS `mapping_redemption`;

CREATE TABLE `mapping_redemption` (
  `record_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `mapping` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1173 DEFAULT CHARSET=latin1;

/*Data for the table `mapping_redemption` */

insert  into `mapping_redemption`(`record_id`,`user_id`,`mapping`,`created_at`) values (1170,1373,'1373','2021-03-27 09:54:17'),(1171,1374,'1374','2021-03-27 09:54:17'),(1172,1372,'1372','2021-03-27 09:54:17');

/*Table structure for table `notification` */

DROP TABLE IF EXISTS `notification`;

CREATE TABLE `notification` (
  `notification_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) DEFAULT NULL,
  `message` varchar(1024) DEFAULT NULL,
  `t24_id` varchar(255) DEFAULT NULL,
  `lead_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` enum('active','inactive') DEFAULT 'active',
  PRIMARY KEY (`notification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `notification` */

/*Table structure for table `notification_medium` */

DROP TABLE IF EXISTS `notification_medium`;

CREATE TABLE `notification_medium` (
  `medium_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `medium_name` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `creation_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`medium_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `notification_medium` */

/*Table structure for table `notification_pending` */

DROP TABLE IF EXISTS `notification_pending`;

CREATE TABLE `notification_pending` (
  `pending_notification_id` int(255) NOT NULL AUTO_INCREMENT,
  `dao_id` varchar(255) DEFAULT NULL,
  `customer_code` varchar(255) DEFAULT NULL,
  `notification_type` varchar(255) DEFAULT NULL,
  `portfolio` varchar(255) DEFAULT NULL,
  `amount` double(10,2) DEFAULT NULL,
  `source_fund` varchar(255) DEFAULT NULL,
  `destination_fund` varchar(255) DEFAULT NULL,
  `transaction_date` datetime DEFAULT NULL,
  `creation_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `notification_sent_date` datetime DEFAULT NULL,
  `T24_id` varchar(255) DEFAULT NULL,
  `lead_id` varchar(255) DEFAULT NULL,
  `status` enum('pending','sent','error') DEFAULT 'pending',
  PRIMARY KEY (`pending_notification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `notification_pending` */

/*Table structure for table `notification_settings` */

DROP TABLE IF EXISTS `notification_settings`;

CREATE TABLE `notification_settings` (
  `setting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `medium_id` bigint(20) DEFAULT NULL,
  `medium_name` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `creation_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `notification_settings` */

/*Table structure for table `notification_template` */

DROP TABLE IF EXISTS `notification_template`;

CREATE TABLE `notification_template` (
  `template_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `notification_type_id` bigint(20) DEFAULT NULL,
  `notification_medium_id` bigint(20) DEFAULT NULL,
  `template_content` longtext,
  `status` enum('active','inactive') DEFAULT 'active',
  `creation_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `notification_template` */

/*Table structure for table `notification_type` */

DROP TABLE IF EXISTS `notification_type`;

CREATE TABLE `notification_type` (
  `type_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `creation_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `notification_type` */

/*Table structure for table `notifications` */

DROP TABLE IF EXISTS `notifications`;

CREATE TABLE `notifications` (
  `record_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `reference_id` bigint(20) DEFAULT NULL,
  `redemption_id` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` bigint(20) DEFAULT NULL,
  `message` text,
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email_address` varbinary(255) DEFAULT NULL,
  `android_push_id` varchar(20) DEFAULT NULL,
  `apple_push_id` varchar(20) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  `sent_status` char(50) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT '0',
  `T24_id` varchar(255) DEFAULT NULL,
  `lead_id` varchar(255) DEFAULT NULL,
  `transaction_read` enum('yes','no') DEFAULT 'no',
  `amount` varchar(255) DEFAULT NULL,
  `protfolio` varchar(255) DEFAULT NULL,
  `fund_id` varchar(255) DEFAULT NULL,
  `fund_name` varchar(255) DEFAULT NULL,
  `mnemonic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `notifications` */

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `product_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) DEFAULT NULL,
  `product_code` varchar(255) DEFAULT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `company_id` bigint(20) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `products` */

/*Table structure for table `regions` */

DROP TABLE IF EXISTS `regions`;

CREATE TABLE `regions` (
  `region_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `city_id` bigint(20) DEFAULT NULL,
  `region_name` varchar(255) DEFAULT NULL,
  `zone_name` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `regions` */

/*Table structure for table `sessions` */

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `session_id` varchar(255) NOT NULL,
  `user_id` bigint(20) NOT NULL DEFAULT '-1',
  `username` varchar(420) DEFAULT NULL,
  `ipaddress` varchar(255) DEFAULT '0.0.0.0',
  `creation_time` datetime DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  `textvalue` text,
  `session_type` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sessions` */

insert  into `sessions`(`session_id`,`user_id`,`username`,`ipaddress`,`creation_time`,`last_updated`,`textvalue`,`session_type`) values ('6f2bceef7e0fecf5df4f95fea6a663a0',-1,'tariqadmin@uhfsolutions.com','127.0.0.1','2021-04-15 08:19:09','2021-04-15 15:11:11','company_id=42&&&usertype=1&&&userid=1367&&&loginid=tariqadmin%40uhfsolutions.com&&&username=TariqAdmin++&&&',1);

/*Table structure for table `tree_controls` */

DROP TABLE IF EXISTS `tree_controls`;

CREATE TABLE `tree_controls` (
  `record_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tree_name` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tree_controls` */

/*Table structure for table `user_branch` */

DROP TABLE IF EXISTS `user_branch`;

CREATE TABLE `user_branch` (
  `record_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `branch_id` bigint(20) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`record_id`),
  KEY `customer_id` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_branch` */

/*Table structure for table `user_machines` */

DROP TABLE IF EXISTS `user_machines`;

CREATE TABLE `user_machines` (
  `record_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) DEFAULT '0.0.0.0',
  `login_id` varchar(255) DEFAULT '0',
  `user_id` bigint(11) unsigned DEFAULT '0',
  `num_of_login_attempts` int(2) unsigned DEFAULT '0',
  `last_login_time` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`),
  KEY `ip_address` (`ip_address`),
  KEY `login_id` (`login_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_machines` */

/*Table structure for table `user_mapping` */

DROP TABLE IF EXISTS `user_mapping`;

CREATE TABLE `user_mapping` (
  `mapping_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL,
  `child_id` bigint(20) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `comments` text,
  PRIMARY KEY (`mapping_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1190 DEFAULT CHARSET=utf8;

/*Data for the table `user_mapping` */

insert  into `user_mapping`(`mapping_id`,`parent_id`,`child_id`,`status`,`comments`) values (1187,1,1372,1,NULL),(1188,1,1373,1,NULL),(1189,1,1374,1,NULL);

/*Table structure for table `user_mapping_cache` */

DROP TABLE IF EXISTS `user_mapping_cache`;

CREATE TABLE `user_mapping_cache` (
  `record_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `mapping` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1270 DEFAULT CHARSET=latin1;

/*Data for the table `user_mapping_cache` */

insert  into `user_mapping_cache`(`record_id`,`user_id`,`mapping`,`created_at`) values (1265,1367,'1367','2021-03-27 09:54:17'),(1266,1369,'1369','2021-03-27 09:54:17'),(1267,1373,'1373','2021-03-27 09:54:17'),(1268,1374,'1374','2021-03-27 09:54:17'),(1269,1372,'1372','2021-03-27 09:54:17');

/*Table structure for table `user_password_history` */

DROP TABLE IF EXISTS `user_password_history`;

CREATE TABLE `user_password_history` (
  `record_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_password_history` */

/*Table structure for table `user_tracking` */

DROP TABLE IF EXISTS `user_tracking`;

CREATE TABLE `user_tracking` (
  `record_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `location_time` timestamp NULL DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `distance` varchar(255) DEFAULT NULL,
  `time_difference` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `userid` (`user_id`),
  KEY `lat` (`latitude`),
  KEY `long` (`longitude`),
  KEY `distance` (`distance`),
  KEY `user_id` (`user_id`),
  KEY `location_time` (`location_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_tracking` */

/*Table structure for table `user_tracking_offline` */

DROP TABLE IF EXISTS `user_tracking_offline`;

CREATE TABLE `user_tracking_offline` (
  `record_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `location_time` timestamp NULL DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `userid` (`user_id`),
  KEY `lat` (`latitude`),
  KEY `long` (`longitude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_tracking_offline` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login_id` varchar(255) DEFAULT NULL,
  `emp_code` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `profile_img` varchar(1024) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `user_type` int(8) DEFAULT NULL,
  `designation_id` bigint(20) DEFAULT NULL,
  `branch_id` bigint(20) DEFAULT NULL,
  `date_of_joining` datetime DEFAULT NULL,
  `date_of_resign` datetime DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `android_push_id` varchar(1024) DEFAULT NULL,
  `apple_push_id` varchar(1024) DEFAULT NULL,
  `num_of_login_attempts` int(2) unsigned DEFAULT NULL,
  `last_login_time` int(11) unsigned DEFAULT NULL,
  `is_new_user` enum('yes','no') DEFAULT 'yes',
  `last_change_password_date` datetime DEFAULT NULL,
  `token` varchar(1024) DEFAULT NULL,
  `is_live` int(5) DEFAULT '0',
  `temp_key` tinyint(4) DEFAULT '0',
  `device_id` varchar(255) DEFAULT NULL,
  `parallel_to` varchar(255) DEFAULT NULL,
  `company_id` int(11) unsigned DEFAULT NULL,
  `email_verification_at` timestamp NULL DEFAULT NULL,
  `email_verification_status` enum('not verified','verified') DEFAULT 'not verified',
  `activation_code` varchar(1024) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `comments` text,
  PRIMARY KEY (`user_id`),
  KEY `login_id` (`login_id`),
  KEY `user_type` (`user_type`),
  KEY `first_name` (`first_name`),
  KEY `creation_date` (`creation_date`),
  KEY `user_type_2` (`user_type`),
  KEY `first_name_2` (`first_name`),
  KEY `creation_date_2` (`creation_date`),
  KEY `branch` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1375 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`user_id`,`login_id`,`emp_code`,`password`,`first_name`,`last_name`,`email_address`,`phone_number`,`gender`,`profile_img`,`date_of_birth`,`user_type`,`designation_id`,`branch_id`,`date_of_joining`,`date_of_resign`,`creation_date`,`android_push_id`,`apple_push_id`,`num_of_login_attempts`,`last_login_time`,`is_new_user`,`last_change_password_date`,`token`,`is_live`,`temp_key`,`device_id`,`parallel_to`,`company_id`,`email_verification_at`,`email_verification_status`,`activation_code`,`status`,`comments`) values (1367,'tariqadmin@uhfsolutions.com',NULL,'$2y$10$ZehKXLd7Jrl6WW2HzVKEI.nSfhV37324CX89yjIo/jGi9z1pjdfxq','TariqAdmin',NULL,'tariq@uhfsolutions.com',NULL,NULL,NULL,NULL,1,NULL,0,NULL,'0000-00-00 00:00:00','2021-02-22 11:06:29',NULL,NULL,NULL,NULL,'no','2021-03-20 10:13:36',NULL,0,0,NULL,NULL,42,'0000-00-00 00:00:00','verified','rlfpJLKlqXxdhcKwNgce',1,NULL),(1368,'tariqism@uhfsolutions.com',NULL,'$2y$10$lfEN7iGMbbV3DZAF8sLX0e/IFKsM41aYJ.1nbyYYC4olrzto68qfG','Tariqsm',NULL,'tariq@uhfsolutions.com',NULL,NULL,NULL,NULL,2048,NULL,0,NULL,'0000-00-00 00:00:00','2021-02-22 11:06:30',NULL,NULL,NULL,NULL,'no','2021-03-20 10:13:37',NULL,0,0,NULL,NULL,42,'0000-00-00 00:00:00','verified','rlfpJLKlqXxdhcKwNgce',1,NULL),(1369,'tariqadmin@ehub.pk',NULL,'$2y$10$GSC3Zjkg5z9y28L.pK5qzOGEDoMhyHDH8VyJzlbmzkwQOlrcAO0e6','Tariq',NULL,'tariq@ehub.pk',NULL,NULL,NULL,NULL,1,NULL,0,NULL,'0000-00-00 00:00:00','2021-03-20 10:09:10',NULL,NULL,NULL,NULL,'no','2021-03-20 10:13:40',NULL,0,0,NULL,NULL,43,NULL,'not verified','LDMoeJZVStnpPADFlLrQ',0,NULL),(1370,'tariqism@ehub.pk',NULL,'$2y$10$8FKkynLdB6gy7cNKJRr4XelUzEHcygt02KQ8kFwrbvHZ8MWUG/pAu','Tariq',NULL,'tariq@ehub.pk',NULL,NULL,NULL,NULL,2048,NULL,0,NULL,'0000-00-00 00:00:00','2021-03-20 10:09:10',NULL,NULL,NULL,NULL,'no','2021-03-20 10:13:41',NULL,0,0,NULL,NULL,43,NULL,'not verified','LDMoeJZVStnpPADFlLrQ',0,NULL),(1371,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2021-03-20 10:13:42',NULL,NULL,NULL,NULL,'yes',NULL,NULL,0,0,NULL,NULL,NULL,NULL,'not verified',NULL,1,NULL),(1372,'tariq123','314','$2y$10$fHYqMTjXRRljQOjJO0E7wO2OsIZRO4e3Txg.YugK0lhLn7rEsXyuO','Tariq Khawaja',NULL,'tkhawaja@gmail.com','03002658202',NULL,NULL,NULL,16,0,0,NULL,'0000-00-00 00:00:00','2021-03-20 10:47:38',NULL,NULL,NULL,NULL,'no','2021-03-28 13:59:00',NULL,0,0,NULL,NULL,42,NULL,'not verified',NULL,2,NULL),(1373,'tariq2','','$2y$10$12gGaIgZAEf5oho.BsclQuAbvQ6eZLe1Qppfcu1gjToH3B8t2iSPO','UHF Solutions',NULL,'tkhawaja@gmail.com','03002658202',NULL,NULL,NULL,8,0,0,NULL,'0000-00-00 00:00:00','2021-03-20 10:49:11',NULL,NULL,NULL,NULL,'no','2021-03-28 13:59:02',NULL,0,0,NULL,NULL,42,NULL,'not verified',NULL,2,NULL),(1374,'tk1','32','$2y$10$GPt6E/jNPe.mvqYxCyruXO9xIOAWszBXTQVQHOWdMsSrN1h4jW2RC','Tarq',NULL,'dsa@dsa.das','4324234',NULL,NULL,NULL,8,0,0,'2021-03-27 09:54:17','0000-00-00 00:00:00','2021-03-27 09:50:22',NULL,NULL,NULL,NULL,'no','2021-03-28 13:59:04',NULL,0,0,NULL,NULL,42,NULL,'not verified',NULL,1,NULL);

/*Table structure for table `version` */

DROP TABLE IF EXISTS `version`;

CREATE TABLE `version` (
  `version_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `version_number` varchar(10) DEFAULT NULL,
  `downloadable_link` varchar(255) DEFAULT NULL,
  `remarks` text,
  `status` enum('active','restore') DEFAULT 'restore',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `version` */

/*Table structure for table `web_logs` */

DROP TABLE IF EXISTS `web_logs`;

CREATE TABLE `web_logs` (
  `web_log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `action` varchar(50) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT '0.0.0.0',
  `url` varchar(500) DEFAULT NULL,
  `trigger_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `response_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `request_data` varchar(500) DEFAULT NULL,
  `response_count` int(10) DEFAULT NULL,
  `response_status` varchar(20) DEFAULT NULL,
  `response_message` varchar(50) DEFAULT NULL,
  `success` tinyint(2) DEFAULT NULL,
  `entity_type` varchar(50) DEFAULT NULL,
  `entity_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`web_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2166 DEFAULT CHARSET=latin1;

/*Data for the table `web_logs` */

insert  into `web_logs`(`web_log_id`,`action`,`ip_address`,`url`,`trigger_time`,`response_time`,`request_data`,`response_count`,`response_status`,`response_message`,`success`,`entity_type`,`entity_id`,`created_at`,`updated_at`) values (1864,'resetpassword','127.0.0.1','dwfprod.local/index.php?SCREEN=companyconfig&sid=2f886fc109d1c04af2759533d6b09d3b&isajaxcall=1&rand=24592','2021-02-22 11:12:57','0000-00-00 00:00:00','{\"SCREEN\":\"companyconfig\",\"sid\":\"2f886fc109d1c04af2759533d6b09d3b\",\"isajaxcall\":\"1\",\"rand\":\"24592\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1865,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=7a26fa03048276595af61a1c1fa05516&isajaxcall=1&rand=8394593','2021-03-20 10:13:47','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"7a26fa03048276595af61a1c1fa05516\",\"isajaxcall\":\"1\",\"rand\":\"8394593\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1866,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=active&sid=7a26fa03048276595af61a1c1fa05516&isajaxcall=1&rand=9881913','2021-03-20 10:13:48','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"active\",\"sid\":\"7a26fa03048276595af61a1c1fa05516\",\"isajaxcall\":\"1\",\"rand\":\"9881913\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1867,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=inactive&sid=7a26fa03048276595af61a1c1fa05516&isajaxcall=1&rand=4241447','2021-03-20 10:13:48','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"inactive\",\"sid\":\"7a26fa03048276595af61a1c1fa05516\",\"isajaxcall\":\"1\",\"rand\":\"4241447\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1868,'showresignuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showresignuser&sid=7a26fa03048276595af61a1c1fa05516&isajaxcall=1&rand=4297592','2021-03-20 10:13:49','0000-00-00 00:00:00','{\"SCREEN\":\"showresignuser\",\"sid\":\"7a26fa03048276595af61a1c1fa05516\",\"isajaxcall\":\"1\",\"rand\":\"4297592\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1869,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=7574856','2021-03-20 10:46:55','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"7574856\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1870,'ADDUSER','127.0.0.1','dwfprod.local/index.php?SCREEN=adduserform&sid=243ac5594fe8d726c339c4a0c3411388&rand=2321105','2021-03-20 10:47:38','0000-00-00 00:00:00','{\"SCREEN\":\"adduserform\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"rand\":\"2321105\",\"ACTION\":\"ADDUSER\",\"token\":\"d6eg92rqq7cow4kgo8sswcg4ckkgocw\",\"companyId\":\"42\",\"validated\":\"1\",\"loginId\":\"tariq123\",\"password\":\"VWhmQDEyMzQ=\",\"fullname\":\"Tariq Khawaja\",\"fullname_d\":\"VGFyaXEgS2hhd2FqYQ==\",\"email\":\"tkhawaja@gmail.com\",\"email_d\":\"dGtoYXdhamFAZ21haWwuY29t\",\"employeecode\":\"314\",\"phone_number\":\"03002658202\",\"phone_number_d\":\"MDMwMDI2NTgyMDI=\",\"designation\":\"BM\",\"designation_d\":\"Qk0=\",\"usertype\":\"16\",\"reg',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1871,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=3032197','2021-03-20 10:47:40','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"3032197\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1872,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=1308914','2021-03-20 10:48:36','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"1308914\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1873,'ADDUSER','127.0.0.1','dwfprod.local/index.php?SCREEN=adduserform&sid=243ac5594fe8d726c339c4a0c3411388&rand=9780114','2021-03-20 10:49:11','0000-00-00 00:00:00','{\"SCREEN\":\"adduserform\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"rand\":\"9780114\",\"ACTION\":\"ADDUSER\",\"token\":\"t5cedgkb6pco0s0o8w40g048cco8ogc\",\"companyId\":\"42\",\"validated\":\"1\",\"loginId\":\"tariq2\",\"password\":\"VWhmQDEyMzQ=\",\"fullname\":\"UHF Solutions\",\"fullname_d\":\"VUhGIFNvbHV0aW9ucw==\",\"email\":\"tkhawaja@gmail.com\",\"email_d\":\"dGtoYXdhamFAZ21haWwuY29t\",\"employeecode\":\"\",\"phone_number\":\"03002658202\",\"phone_number_d\":\"MDMwMDI2NTgyMDI=\",\"designation\":\"\",\"designation_d\":\"\",\"usertype\":\"8\",\"region_name\":\"\"',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1874,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=6989212','2021-03-20 10:49:12','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"6989212\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1875,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=7345149','2021-03-20 10:49:19','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"7345149\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1876,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=5540739','2021-03-20 10:55:34','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"5540739\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1877,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=2277727','2021-03-20 10:55:35','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"2277727\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1878,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=1154996','2021-03-20 10:55:49','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"1154996\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1879,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=1323500','2021-03-20 10:55:50','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"1323500\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1880,'viewusermapping','127.0.0.1','dwfprod.local/index.php?SCREEN=viewusermapping&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=5062878','2021-03-20 10:55:54','0000-00-00 00:00:00','{\"SCREEN\":\"viewusermapping\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"5062878\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1881,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=1004831','2021-03-20 10:55:56','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"1004831\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1882,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=1958696','2021-03-20 10:55:59','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"1958696\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1883,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=2555355','2021-03-20 11:02:25','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"2555355\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1884,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=8148844','2021-03-20 11:02:27','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"8148844\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1885,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=4758798','2021-03-20 11:03:55','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"4758798\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1886,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=279353','2021-03-20 11:03:56','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"279353\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1887,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=4674834','2021-03-20 11:04:14','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"4674834\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1888,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=9157717','2021-03-20 11:04:15','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"9157717\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1889,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=33920','2021-03-20 11:08:39','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"33920\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1890,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=8980607','2021-03-20 11:08:40','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"8980607\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1891,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=2155368','2021-03-20 11:08:59','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"2155368\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1892,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=3187501','2021-03-20 11:09:00','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"3187501\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1893,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=533983','2021-03-20 11:09:46','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"533983\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1894,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=3267314','2021-03-20 11:09:47','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"3267314\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1895,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=7020805','2021-03-20 11:16:13','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"7020805\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1896,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=5045633','2021-03-20 11:16:15','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"5045633\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1897,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=1027034','2021-03-20 11:16:28','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"1027034\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1898,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=9603503','2021-03-20 11:16:29','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"9603503\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1899,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=1233569','2021-03-20 11:17:17','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"1233569\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1900,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=2777630','2021-03-20 11:17:19','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"2777630\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1901,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=2968408','2021-03-20 11:17:42','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"2968408\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1902,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=9563792','2021-03-20 11:17:43','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"9563792\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1903,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=5281185','2021-03-20 11:18:01','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"5281185\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1904,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=324689','2021-03-20 11:18:03','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"324689\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1905,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=362957','2021-03-20 11:18:30','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"362957\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1906,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=2347161','2021-03-20 11:18:30','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"2347161\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1907,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=3541845','2021-03-20 11:20:11','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"3541845\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1908,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=355602','2021-03-20 11:20:12','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"355602\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1909,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=283315','2021-03-20 11:22:35','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"283315\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1910,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=2788339','2021-03-20 11:22:36','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"2788339\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1911,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=3805441','2021-03-20 11:23:27','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"3805441\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1912,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=243ac5594fe8d726c339c4a0c3411388&isajaxcall=1&rand=6452157','2021-03-20 11:23:28','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"243ac5594fe8d726c339c4a0c3411388\",\"isajaxcall\":\"1\",\"rand\":\"6452157\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1913,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=46a4e15beca3e5106d98452efd25553a&isajaxcall=1&rand=9928589','2021-03-22 11:12:19','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"46a4e15beca3e5106d98452efd25553a\",\"isajaxcall\":\"1\",\"rand\":\"9928589\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1914,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=46a4e15beca3e5106d98452efd25553a&isajaxcall=1&rand=5579428','2021-03-22 11:12:40','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"46a4e15beca3e5106d98452efd25553a\",\"isajaxcall\":\"1\",\"rand\":\"5579428\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1915,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=active&sid=46a4e15beca3e5106d98452efd25553a&isajaxcall=1&rand=9713773','2021-03-22 11:12:41','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"active\",\"sid\":\"46a4e15beca3e5106d98452efd25553a\",\"isajaxcall\":\"1\",\"rand\":\"9713773\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1916,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=inactive&sid=46a4e15beca3e5106d98452efd25553a&isajaxcall=1&rand=4405236','2021-03-22 11:12:43','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"inactive\",\"sid\":\"46a4e15beca3e5106d98452efd25553a\",\"isajaxcall\":\"1\",\"rand\":\"4405236\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1917,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=active&sid=46a4e15beca3e5106d98452efd25553a&isajaxcall=1&rand=2882418','2021-03-22 11:12:44','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"active\",\"sid\":\"46a4e15beca3e5106d98452efd25553a\",\"isajaxcall\":\"1\",\"rand\":\"2882418\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1918,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=active&sid=46a4e15beca3e5106d98452efd25553a&isajaxcall=1&rand=3364852','2021-03-22 11:13:09','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"active\",\"sid\":\"46a4e15beca3e5106d98452efd25553a\",\"isajaxcall\":\"1\",\"rand\":\"3364852\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1919,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=inactive&sid=46a4e15beca3e5106d98452efd25553a&isajaxcall=1&rand=7428358','2021-03-22 11:13:11','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"inactive\",\"sid\":\"46a4e15beca3e5106d98452efd25553a\",\"isajaxcall\":\"1\",\"rand\":\"7428358\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1920,'showresignuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showresignuser&sid=46a4e15beca3e5106d98452efd25553a&isajaxcall=1&rand=284309','2021-03-22 11:13:11','0000-00-00 00:00:00','{\"SCREEN\":\"showresignuser\",\"sid\":\"46a4e15beca3e5106d98452efd25553a\",\"isajaxcall\":\"1\",\"rand\":\"284309\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1921,'showresignuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showresignuser&sid=46a4e15beca3e5106d98452efd25553a&isajaxcall=1&rand=7394157','2021-03-22 11:13:30','0000-00-00 00:00:00','{\"SCREEN\":\"showresignuser\",\"sid\":\"46a4e15beca3e5106d98452efd25553a\",\"isajaxcall\":\"1\",\"rand\":\"7394157\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1922,'viewusermapping','127.0.0.1','dwfprod.local/index.php?SCREEN=viewusermapping&sid=46a4e15beca3e5106d98452efd25553a&isajaxcall=1&rand=657530','2021-03-22 11:13:31','0000-00-00 00:00:00','{\"SCREEN\":\"viewusermapping\",\"sid\":\"46a4e15beca3e5106d98452efd25553a\",\"isajaxcall\":\"1\",\"rand\":\"657530\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1923,'viewusermapping','127.0.0.1','dwfprod.local/index.php?SCREEN=viewusermapping&sid=46a4e15beca3e5106d98452efd25553a&isajaxcall=1&rand=5745377','2021-03-22 11:14:03','0000-00-00 00:00:00','{\"SCREEN\":\"viewusermapping\",\"sid\":\"46a4e15beca3e5106d98452efd25553a\",\"isajaxcall\":\"1\",\"rand\":\"5745377\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1924,'viewusermapping','127.0.0.1','dwfprod.local/index.php?SCREEN=viewusermapping&sid=46a4e15beca3e5106d98452efd25553a&isajaxcall=1&rand=9820425','2021-03-22 11:14:04','0000-00-00 00:00:00','{\"SCREEN\":\"viewusermapping\",\"sid\":\"46a4e15beca3e5106d98452efd25553a\",\"isajaxcall\":\"1\",\"rand\":\"9820425\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1925,'viewusermapping','127.0.0.1','dwfprod.local/index.php?SCREEN=viewusermapping&sid=46a4e15beca3e5106d98452efd25553a&isajaxcall=1&rand=4334744','2021-03-22 11:14:22','0000-00-00 00:00:00','{\"SCREEN\":\"viewusermapping\",\"sid\":\"46a4e15beca3e5106d98452efd25553a\",\"isajaxcall\":\"1\",\"rand\":\"4334744\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1926,'mappingrequested','127.0.0.1','dwfprod.local/index.php?SCREEN=mappingrequested&sid=46a4e15beca3e5106d98452efd25553a&isajaxcall=1&rand=2172113','2021-03-22 11:14:24','0000-00-00 00:00:00','{\"SCREEN\":\"mappingrequested\",\"sid\":\"46a4e15beca3e5106d98452efd25553a\",\"isajaxcall\":\"1\",\"rand\":\"2172113\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1927,'mappingrequested','127.0.0.1','dwfprod.local/index.php?SCREEN=mappingrequested&sid=46a4e15beca3e5106d98452efd25553a&isajaxcall=1&rand=4578810','2021-03-22 11:14:43','0000-00-00 00:00:00','{\"SCREEN\":\"mappingrequested\",\"sid\":\"46a4e15beca3e5106d98452efd25553a\",\"isajaxcall\":\"1\",\"rand\":\"4578810\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1928,'mappingrequested','127.0.0.1','dwfprod.local/index.php?SCREEN=mappingrequested&sid=46a4e15beca3e5106d98452efd25553a&isajaxcall=1&rand=7563783','2021-03-22 11:14:44','0000-00-00 00:00:00','{\"SCREEN\":\"mappingrequested\",\"sid\":\"46a4e15beca3e5106d98452efd25553a\",\"isajaxcall\":\"1\",\"rand\":\"7563783\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1929,'mappingrequested','127.0.0.1','dwfprod.local/index.php?SCREEN=mappingrequested&sid=46a4e15beca3e5106d98452efd25553a&isajaxcall=1&rand=2799358','2021-03-22 11:15:05','0000-00-00 00:00:00','{\"SCREEN\":\"mappingrequested\",\"sid\":\"46a4e15beca3e5106d98452efd25553a\",\"isajaxcall\":\"1\",\"rand\":\"2799358\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1930,'transferusermapping','127.0.0.1','dwfprod.local/index.php?SCREEN=transferusermapping&sid=46a4e15beca3e5106d98452efd25553a&isajaxcall=1&rand=1188246','2021-03-22 11:15:07','0000-00-00 00:00:00','{\"SCREEN\":\"transferusermapping\",\"sid\":\"46a4e15beca3e5106d98452efd25553a\",\"isajaxcall\":\"1\",\"rand\":\"1188246\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1931,'transferusermapping','127.0.0.1','dwfprod.local/index.php?SCREEN=transferusermapping&sid=46a4e15beca3e5106d98452efd25553a&isajaxcall=1&rand=7454440','2021-03-22 11:16:07','0000-00-00 00:00:00','{\"SCREEN\":\"transferusermapping\",\"sid\":\"46a4e15beca3e5106d98452efd25553a\",\"isajaxcall\":\"1\",\"rand\":\"7454440\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1932,'mappingrequested','127.0.0.1','dwfprod.local/index.php?SCREEN=mappingrequested&sid=46a4e15beca3e5106d98452efd25553a&isajaxcall=1&rand=6966098','2021-03-22 11:16:16','0000-00-00 00:00:00','{\"SCREEN\":\"mappingrequested\",\"sid\":\"46a4e15beca3e5106d98452efd25553a\",\"isajaxcall\":\"1\",\"rand\":\"6966098\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1933,'transferusermapping','127.0.0.1','dwfprod.local/index.php?SCREEN=transferusermapping&sid=46a4e15beca3e5106d98452efd25553a&isajaxcall=1&rand=8338558','2021-03-22 11:16:17','0000-00-00 00:00:00','{\"SCREEN\":\"transferusermapping\",\"sid\":\"46a4e15beca3e5106d98452efd25553a\",\"isajaxcall\":\"1\",\"rand\":\"8338558\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1934,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=46a4e15beca3e5106d98452efd25553a&isajaxcall=1&rand=4738459','2021-03-22 11:55:10','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"46a4e15beca3e5106d98452efd25553a\",\"isajaxcall\":\"1\",\"rand\":\"4738459\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1935,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=46a4e15beca3e5106d98452efd25553a&isajaxcall=1&rand=2188067','2021-03-22 11:55:12','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"46a4e15beca3e5106d98452efd25553a\",\"isajaxcall\":\"1\",\"rand\":\"2188067\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1936,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=46a4e15beca3e5106d98452efd25553a&isajaxcall=1&rand=6115503','2021-03-22 11:55:14','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"46a4e15beca3e5106d98452efd25553a\",\"isajaxcall\":\"1\",\"rand\":\"6115503\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1937,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=46a4e15beca3e5106d98452efd25553a&isajaxcall=1&rand=2362917','2021-03-22 11:55:15','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"46a4e15beca3e5106d98452efd25553a\",\"isajaxcall\":\"1\",\"rand\":\"2362917\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1938,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=42886eb078bfcba717a073895612e1dd&isajaxcall=1&rand=1260198','2021-03-22 13:06:50','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"42886eb078bfcba717a073895612e1dd\",\"isajaxcall\":\"1\",\"rand\":\"1260198\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1939,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=42886eb078bfcba717a073895612e1dd&isajaxcall=1&rand=7932923','2021-03-22 13:07:47','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"42886eb078bfcba717a073895612e1dd\",\"isajaxcall\":\"1\",\"rand\":\"7932923\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1940,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=42886eb078bfcba717a073895612e1dd&isajaxcall=1&rand=6624380','2021-03-22 13:07:49','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"42886eb078bfcba717a073895612e1dd\",\"isajaxcall\":\"1\",\"rand\":\"6624380\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1941,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=42886eb078bfcba717a073895612e1dd&isajaxcall=1&rand=6725433','2021-03-22 13:08:19','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"42886eb078bfcba717a073895612e1dd\",\"isajaxcall\":\"1\",\"rand\":\"6725433\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1942,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=42886eb078bfcba717a073895612e1dd&isajaxcall=1&rand=7110148','2021-03-22 13:08:21','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"42886eb078bfcba717a073895612e1dd\",\"isajaxcall\":\"1\",\"rand\":\"7110148\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1943,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=fff9f428fce4d7d71f484fb9cbc9c70c&isajaxcall=1&rand=7402872','2021-03-27 09:49:31','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"fff9f428fce4d7d71f484fb9cbc9c70c\",\"isajaxcall\":\"1\",\"rand\":\"7402872\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1944,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=active&sid=fff9f428fce4d7d71f484fb9cbc9c70c&isajaxcall=1&rand=123087','2021-03-27 09:49:37','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"active\",\"sid\":\"fff9f428fce4d7d71f484fb9cbc9c70c\",\"isajaxcall\":\"1\",\"rand\":\"123087\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1945,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=fff9f428fce4d7d71f484fb9cbc9c70c&isajaxcall=1&rand=509332','2021-03-27 09:49:39','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"fff9f428fce4d7d71f484fb9cbc9c70c\",\"isajaxcall\":\"1\",\"rand\":\"509332\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1946,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=fff9f428fce4d7d71f484fb9cbc9c70c&isajaxcall=1&rand=7924398','2021-03-27 09:49:40','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"fff9f428fce4d7d71f484fb9cbc9c70c\",\"isajaxcall\":\"1\",\"rand\":\"7924398\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1947,'ADDUSER','127.0.0.1','dwfprod.local/index.php?SCREEN=adduserform&sid=fff9f428fce4d7d71f484fb9cbc9c70c&rand=3534735','2021-03-27 09:50:22','0000-00-00 00:00:00','{\"SCREEN\":\"adduserform\",\"sid\":\"fff9f428fce4d7d71f484fb9cbc9c70c\",\"rand\":\"3534735\",\"ACTION\":\"ADDUSER\",\"token\":\"lrooawjnoy88ckcccgsgkkoscsscwo4\",\"companyId\":\"42\",\"validated\":\"1\",\"loginId\":\"tk1\",\"password\":\"VWhmQDEyMzQ=\",\"fullname\":\"Tarq\",\"fullname_d\":\"VGFycQ==\",\"email\":\"dsa@dsa.das\",\"email_d\":\"ZHNhQGRzYS5kYXM=\",\"employeecode\":\"32\",\"phone_number\":\"4324234\",\"phone_number_d\":\"NDMyNDIzNA==\",\"designation\":\"BM\",\"designation_d\":\"Qk0=\",\"usertype\":\"1\",\"region_name\":\"1\",\"branch\":\",Branch2\",\"captcha\":\"WZHFMV',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1948,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=fff9f428fce4d7d71f484fb9cbc9c70c&isajaxcall=1&rand=3527035','2021-03-27 09:50:24','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"fff9f428fce4d7d71f484fb9cbc9c70c\",\"isajaxcall\":\"1\",\"rand\":\"3527035\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1949,'mappingrequested','127.0.0.1','dwfprod.local/index.php?SCREEN=mappingrequested&sid=fff9f428fce4d7d71f484fb9cbc9c70c&isajaxcall=1&rand=362943','2021-03-27 09:50:31','0000-00-00 00:00:00','{\"SCREEN\":\"mappingrequested\",\"sid\":\"fff9f428fce4d7d71f484fb9cbc9c70c\",\"isajaxcall\":\"1\",\"rand\":\"362943\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1950,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=pendingdelete&sid=dc5825a442a61ce571f298adb576a9e6&isajaxcall=1&rand=7706641','2021-03-27 09:51:59','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"pendingdelete\",\"sid\":\"dc5825a442a61ce571f298adb576a9e6\",\"isajaxcall\":\"1\",\"rand\":\"7706641\"}',NULL,NULL,NULL,NULL,'tariqism@uhfsolutions.com',1368,'0000-00-00 00:00:00',NULL),(1951,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=requestadd&sid=dc5825a442a61ce571f298adb576a9e6&isajaxcall=1&rand=5202094','2021-03-27 09:52:00','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"requestadd\",\"sid\":\"dc5825a442a61ce571f298adb576a9e6\",\"isajaxcall\":\"1\",\"rand\":\"5202094\"}',NULL,NULL,NULL,NULL,'tariqism@uhfsolutions.com',1368,'0000-00-00 00:00:00',NULL),(1952,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=requestadd&sid=dc5825a442a61ce571f298adb576a9e6&isajaxcall=1&rand=7893684','2021-03-27 09:54:10','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"requestadd\",\"sid\":\"dc5825a442a61ce571f298adb576a9e6\",\"isajaxcall\":\"1\",\"rand\":\"7893684\"}',NULL,NULL,NULL,NULL,'tariqism@uhfsolutions.com',1368,'0000-00-00 00:00:00',NULL),(1953,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=all&sid=dc5825a442a61ce571f298adb576a9e6&isajaxcall=1&rand=7978525','2021-03-27 09:54:19','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"all\",\"sid\":\"dc5825a442a61ce571f298adb576a9e6\",\"isajaxcall\":\"1\",\"rand\":\"7978525\"}',NULL,NULL,NULL,NULL,'tariqism@uhfsolutions.com',1368,'0000-00-00 00:00:00',NULL),(1954,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=fff9f428fce4d7d71f484fb9cbc9c70c&isajaxcall=1&rand=1982571','2021-03-27 09:54:23','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"fff9f428fce4d7d71f484fb9cbc9c70c\",\"isajaxcall\":\"1\",\"rand\":\"1982571\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1955,'viewusermapping','127.0.0.1','dwfprod.local/index.php?SCREEN=viewusermapping&sid=fff9f428fce4d7d71f484fb9cbc9c70c&isajaxcall=1&rand=9143311','2021-03-27 09:54:26','0000-00-00 00:00:00','{\"SCREEN\":\"viewusermapping\",\"sid\":\"fff9f428fce4d7d71f484fb9cbc9c70c\",\"isajaxcall\":\"1\",\"rand\":\"9143311\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1956,'mappingrequested','127.0.0.1','dwfprod.local/index.php?SCREEN=mappingrequested&sid=fff9f428fce4d7d71f484fb9cbc9c70c&isajaxcall=1&rand=3038149','2021-03-27 09:54:27','0000-00-00 00:00:00','{\"SCREEN\":\"mappingrequested\",\"sid\":\"fff9f428fce4d7d71f484fb9cbc9c70c\",\"isajaxcall\":\"1\",\"rand\":\"3038149\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1957,'transferusermapping','127.0.0.1','dwfprod.local/index.php?SCREEN=transferusermapping&sid=fff9f428fce4d7d71f484fb9cbc9c70c&isajaxcall=1&rand=9044547','2021-03-27 09:54:28','0000-00-00 00:00:00','{\"SCREEN\":\"transferusermapping\",\"sid\":\"fff9f428fce4d7d71f484fb9cbc9c70c\",\"isajaxcall\":\"1\",\"rand\":\"9044547\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1958,'mappingrequested','127.0.0.1','dwfprod.local/index.php?SCREEN=mappingrequested&sid=fff9f428fce4d7d71f484fb9cbc9c70c&isajaxcall=1&rand=8347701','2021-03-27 09:54:29','0000-00-00 00:00:00','{\"SCREEN\":\"mappingrequested\",\"sid\":\"fff9f428fce4d7d71f484fb9cbc9c70c\",\"isajaxcall\":\"1\",\"rand\":\"8347701\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1959,'resetpassword','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=active&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=9071865','2021-03-28 13:43:34','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"active\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"9071865\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1960,'resetpassword','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=4917175','2021-03-28 13:43:41','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"4917175\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1961,'resetpassword','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=2266078','2021-03-28 13:43:44','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"2266078\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1962,'resetpassword','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=1317399','2021-03-28 13:44:00','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"1317399\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1963,'resetpassword','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=5583587','2021-03-28 13:44:03','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"5583587\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1964,'resetpassword','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=1335489','2021-03-28 13:44:04','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"1335489\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1965,'resetpassword','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=8321126','2021-03-28 13:44:12','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"8321126\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1966,'resetpassword','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=8000777','2021-03-28 13:44:13','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"8000777\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1967,'resetpassword','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=7745546','2021-03-28 13:44:13','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"7745546\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1968,'resetpassword','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=9582992','2021-03-28 13:44:22','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"9582992\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1969,'resetpassword','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=3284492','2021-03-28 13:44:23','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"3284492\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1970,'resetpassword','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=2579455','2021-03-28 13:45:10','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"2579455\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1971,'resetpassword','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=6885536','2021-03-28 13:45:31','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"6885536\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1972,'resetpassword','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=active&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=7217663','2021-03-28 13:45:36','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"active\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"7217663\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1973,'resetpassword','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=3242045','2021-03-28 13:45:38','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"3242045\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1974,'resetpassword','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1','2021-03-28 13:50:57','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1975,'resetpassword','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1','2021-03-28 13:51:09','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1976,'resetpassword','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1','2021-03-28 13:53:11','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1977,'resetpassword','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1','2021-03-28 13:53:12','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1978,'resetpassword','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1','2021-03-28 13:53:21','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1979,'resetpassword','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1','2021-03-28 13:54:28','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1980,'resetpassword','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1','2021-03-28 13:54:29','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1981,'resetpassword','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1','2021-03-28 13:57:07','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1982,'resetpassword','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1','2021-03-28 13:57:38','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1983,'resetpassword','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1','2021-03-28 13:57:56','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1984,'resetpassword','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=4643291','2021-03-28 13:58:00','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"4643291\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1985,'resetpassword','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=5064020','2021-03-28 13:58:03','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"5064020\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1986,'resetpassword','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1','2021-03-28 13:58:25','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1987,'resetpassword','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1','2021-03-28 13:59:06','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1988,'resetpassword','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1','2021-03-28 13:59:08','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1989,'resetpassword','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1','2021-03-28 13:59:09','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1990,'resetpassword','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1','2021-03-28 13:59:53','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1991,'resetpassword','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1','2021-03-28 14:01:56','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1992,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1','2021-03-28 14:02:10','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1993,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1','2021-03-28 14:02:58','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1994,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1','2021-03-28 14:03:23','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1995,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=1108231','2021-03-28 14:03:29','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"1108231\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1996,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=3724679','2021-03-28 14:03:55','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"3724679\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1997,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=2834616','2021-03-28 14:03:56','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"2834616\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1998,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=9450928','2021-03-28 14:03:57','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"9450928\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(1999,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=1870849','2021-03-28 14:03:58','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"1870849\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2000,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=80541','2021-03-28 14:05:30','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"80541\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2001,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=5122322','2021-03-28 14:05:31','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"5122322\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2002,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=754537','2021-03-28 14:05:33','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"754537\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2003,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=active&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=1398287','2021-03-28 14:05:34','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"active\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"1398287\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2004,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=900123','2021-03-28 14:05:35','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"900123\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2005,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=active&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=8744921','2021-03-28 14:05:36','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"active\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"8744921\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2006,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=2267865','2021-03-28 14:05:37','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"2267865\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2007,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=active&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=6406992','2021-03-28 18:35:22','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"active\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"6406992\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2008,'transferusermapping','127.0.0.1','dwfprod.local/index.php?SCREEN=transferusermapping&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=6453606','2021-03-28 18:35:26','0000-00-00 00:00:00','{\"SCREEN\":\"transferusermapping\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"6453606\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2009,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=active&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=6044335','2021-03-28 18:38:34','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"active\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"6044335\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2010,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=active&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=7206826','2021-03-28 18:39:26','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"active\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"7206826\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2011,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=active&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=6723456','2021-03-28 18:42:29','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"active\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"6723456\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2012,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=active&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=7305794','2021-03-28 18:42:38','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"active\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"7305794\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2013,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=active&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=9953287','2021-03-28 18:42:49','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"active\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"9953287\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2014,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=active&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=7063116','2021-03-28 18:43:24','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"active\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"7063116\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2015,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=active&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=3493186','2021-03-28 18:43:33','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"active\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"3493186\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2016,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=active&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=3118410','2021-03-28 18:46:37','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"active\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"3118410\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2017,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=inactive&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=6236401','2021-03-28 18:46:41','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"inactive\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"6236401\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2018,'showresignuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showresignuser&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=6502462','2021-03-28 18:46:42','0000-00-00 00:00:00','{\"SCREEN\":\"showresignuser\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"6502462\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2019,'viewusermapping','127.0.0.1','dwfprod.local/index.php?SCREEN=viewusermapping&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=8335495','2021-03-28 18:46:43','0000-00-00 00:00:00','{\"SCREEN\":\"viewusermapping\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"8335495\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2020,'mappingrequested','127.0.0.1','dwfprod.local/index.php?SCREEN=mappingrequested&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=5368868','2021-03-28 18:46:44','0000-00-00 00:00:00','{\"SCREEN\":\"mappingrequested\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"5368868\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2021,'transferusermapping','127.0.0.1','dwfprod.local/index.php?SCREEN=transferusermapping&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=9201224','2021-03-28 18:46:45','0000-00-00 00:00:00','{\"SCREEN\":\"transferusermapping\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"9201224\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2022,'mappingrequested','127.0.0.1','dwfprod.local/index.php?SCREEN=mappingrequested&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=8020372','2021-03-28 18:46:47','0000-00-00 00:00:00','{\"SCREEN\":\"mappingrequested\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"8020372\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2023,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=inactive&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=2418430','2021-03-28 18:47:33','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"inactive\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"2418430\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2024,'showresignuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showresignuser&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=1988341','2021-03-28 18:47:35','0000-00-00 00:00:00','{\"SCREEN\":\"showresignuser\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"1988341\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2025,'viewusermapping','127.0.0.1','dwfprod.local/index.php?SCREEN=viewusermapping&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=9861212','2021-03-28 18:47:36','0000-00-00 00:00:00','{\"SCREEN\":\"viewusermapping\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"9861212\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2026,'mappingrequested','127.0.0.1','dwfprod.local/index.php?SCREEN=mappingrequested&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=7319632','2021-03-28 18:47:38','0000-00-00 00:00:00','{\"SCREEN\":\"mappingrequested\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"7319632\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2027,'mappingrequested','127.0.0.1','dwfprod.local/index.php?SCREEN=mappingrequested&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=6554657','2021-03-28 18:47:44','0000-00-00 00:00:00','{\"SCREEN\":\"mappingrequested\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"6554657\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2028,'pendingmapping','127.0.0.1','dwfprod.local/index.php?SCREEN=pendingmapping&sid=fb8f42fc0823984f2974e1e51ba7eb12&isajaxcall=1&rand=1215491','2021-03-28 18:48:13','0000-00-00 00:00:00','{\"SCREEN\":\"pendingmapping\",\"sid\":\"fb8f42fc0823984f2974e1e51ba7eb12\",\"isajaxcall\":\"1\",\"rand\":\"1215491\"}',NULL,NULL,NULL,NULL,'tariqism@uhfsolutions.com',1368,'0000-00-00 00:00:00',NULL),(2029,'approvedmapping','127.0.0.1','dwfprod.local/index.php?SCREEN=approvedmapping&sid=fb8f42fc0823984f2974e1e51ba7eb12&isajaxcall=1&rand=3344315','2021-03-28 18:48:14','0000-00-00 00:00:00','{\"SCREEN\":\"approvedmapping\",\"sid\":\"fb8f42fc0823984f2974e1e51ba7eb12\",\"isajaxcall\":\"1\",\"rand\":\"3344315\"}',NULL,NULL,NULL,NULL,'tariqism@uhfsolutions.com',1368,'0000-00-00 00:00:00',NULL),(2030,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=requestadd&sid=fb8f42fc0823984f2974e1e51ba7eb12&isajaxcall=1&rand=168121','2021-03-28 18:48:18','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"requestadd\",\"sid\":\"fb8f42fc0823984f2974e1e51ba7eb12\",\"isajaxcall\":\"1\",\"rand\":\"168121\"}',NULL,NULL,NULL,NULL,'tariqism@uhfsolutions.com',1368,'0000-00-00 00:00:00',NULL),(2031,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=pendingdelete&sid=fb8f42fc0823984f2974e1e51ba7eb12&isajaxcall=1&rand=7776502','2021-03-28 18:48:20','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"pendingdelete\",\"sid\":\"fb8f42fc0823984f2974e1e51ba7eb12\",\"isajaxcall\":\"1\",\"rand\":\"7776502\"}',NULL,NULL,NULL,NULL,'tariqism@uhfsolutions.com',1368,'0000-00-00 00:00:00',NULL),(2032,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=all%20users&sid=fb8f42fc0823984f2974e1e51ba7eb12&isajaxcall=1&rand=4083057','2021-03-28 18:48:21','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"all users\",\"sid\":\"fb8f42fc0823984f2974e1e51ba7eb12\",\"isajaxcall\":\"1\",\"rand\":\"4083057\"}',NULL,NULL,NULL,NULL,'tariqism@uhfsolutions.com',1368,'0000-00-00 00:00:00',NULL),(2033,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=active&sid=fb8f42fc0823984f2974e1e51ba7eb12&isajaxcall=1&rand=8727332','2021-03-28 18:48:22','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"active\",\"sid\":\"fb8f42fc0823984f2974e1e51ba7eb12\",\"isajaxcall\":\"1\",\"rand\":\"8727332\"}',NULL,NULL,NULL,NULL,'tariqism@uhfsolutions.com',1368,'0000-00-00 00:00:00',NULL),(2034,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=inactive&sid=fb8f42fc0823984f2974e1e51ba7eb12&isajaxcall=1&rand=5721952','2021-03-28 18:48:23','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"inactive\",\"sid\":\"fb8f42fc0823984f2974e1e51ba7eb12\",\"isajaxcall\":\"1\",\"rand\":\"5721952\"}',NULL,NULL,NULL,NULL,'tariqism@uhfsolutions.com',1368,'0000-00-00 00:00:00',NULL),(2035,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=requestadd&sid=fb8f42fc0823984f2974e1e51ba7eb12&isajaxcall=1&rand=883403','2021-03-28 18:48:43','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"requestadd\",\"sid\":\"fb8f42fc0823984f2974e1e51ba7eb12\",\"isajaxcall\":\"1\",\"rand\":\"883403\"}',NULL,NULL,NULL,NULL,'tariqism@uhfsolutions.com',1368,'0000-00-00 00:00:00',NULL),(2036,'pendingmapping','127.0.0.1','dwfprod.local/index.php?SCREEN=pendingmapping&sid=fb8f42fc0823984f2974e1e51ba7eb12&isajaxcall=1&rand=8788931','2021-03-28 18:48:46','0000-00-00 00:00:00','{\"SCREEN\":\"pendingmapping\",\"sid\":\"fb8f42fc0823984f2974e1e51ba7eb12\",\"isajaxcall\":\"1\",\"rand\":\"8788931\"}',NULL,NULL,NULL,NULL,'tariqism@uhfsolutions.com',1368,'0000-00-00 00:00:00',NULL),(2037,'pendingmapping','127.0.0.1','dwfprod.local/index.php?SCREEN=pendingmapping&sid=fb8f42fc0823984f2974e1e51ba7eb12&isajaxcall=1&rand=161254','2021-03-28 18:48:48','0000-00-00 00:00:00','{\"SCREEN\":\"pendingmapping\",\"sid\":\"fb8f42fc0823984f2974e1e51ba7eb12\",\"isajaxcall\":\"1\",\"rand\":\"161254\"}',NULL,NULL,NULL,NULL,'tariqism@uhfsolutions.com',1368,'0000-00-00 00:00:00',NULL),(2038,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=requestadd&sid=fb8f42fc0823984f2974e1e51ba7eb12&isajaxcall=1&rand=3310961','2021-03-28 18:48:50','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"requestadd\",\"sid\":\"fb8f42fc0823984f2974e1e51ba7eb12\",\"isajaxcall\":\"1\",\"rand\":\"3310961\"}',NULL,NULL,NULL,NULL,'tariqism@uhfsolutions.com',1368,'0000-00-00 00:00:00',NULL),(2039,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=pendingdelete&sid=fb8f42fc0823984f2974e1e51ba7eb12&isajaxcall=1&rand=4751246','2021-03-28 18:48:51','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"pendingdelete\",\"sid\":\"fb8f42fc0823984f2974e1e51ba7eb12\",\"isajaxcall\":\"1\",\"rand\":\"4751246\"}',NULL,NULL,NULL,NULL,'tariqism@uhfsolutions.com',1368,'0000-00-00 00:00:00',NULL),(2040,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=8422594','2021-03-28 18:48:57','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"8422594\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2041,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=7200917','2021-03-28 18:48:59','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"7200917\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2042,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=active&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=4643517','2021-03-28 18:56:57','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"active\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"4643517\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2043,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=active&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=5402568','2021-03-28 18:57:17','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"active\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"5402568\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2044,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=active&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=1813330','2021-03-28 18:57:59','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"active\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"1813330\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2045,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=active&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=4281949','2021-03-28 18:58:29','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"active\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"4281949\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2046,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=active&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=1950293','2021-03-28 18:59:14','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"active\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"1950293\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2047,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=inactive&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=6590280','2021-03-28 18:59:26','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"inactive\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"6590280\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2048,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=265357','2021-03-28 18:59:27','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"265357\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2049,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=9179708','2021-03-28 18:59:29','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"9179708\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2050,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=4278016','2021-03-28 19:07:36','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"4278016\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2051,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=7966224','2021-03-28 19:07:37','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"7966224\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2052,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=1183596','2021-03-28 19:08:43','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"1183596\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2053,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=6159965','2021-03-28 19:08:44','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"6159965\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2054,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=active&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=6482803','2021-03-28 19:09:29','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"active\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"6482803\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2055,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=512216','2021-03-28 19:09:31','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"512216\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2056,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=6028055','2021-03-28 19:09:32','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"6028055\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2057,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=2390201','2021-03-28 19:09:59','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"2390201\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2058,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=5209126','2021-03-28 19:10:00','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"5209126\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2059,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=3217610','2021-03-28 19:11:04','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"3217610\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2060,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=3310133','2021-03-28 19:11:05','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"3310133\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2061,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=2777572','2021-03-28 19:11:15','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"2777572\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2062,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=9511076','2021-03-28 19:11:16','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"9511076\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2063,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=2370363','2021-03-28 19:14:36','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"2370363\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2064,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=9928560','2021-03-28 19:14:37','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"9928560\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2065,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=5495443','2021-03-28 19:15:45','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"5495443\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2066,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=c649c6b0576e25136bd343c7da82f493&isajaxcall=1&rand=9680552','2021-03-28 19:15:47','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"c649c6b0576e25136bd343c7da82f493\",\"isajaxcall\":\"1\",\"rand\":\"9680552\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2067,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=02b83fa2510f5e433fd6ab8cd2ee93ab&isajaxcall=1&rand=503179','2021-03-29 10:15:51','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"02b83fa2510f5e433fd6ab8cd2ee93ab\",\"isajaxcall\":\"1\",\"rand\":\"503179\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2068,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=active&sid=02b83fa2510f5e433fd6ab8cd2ee93ab&isajaxcall=1&rand=4431000','2021-03-29 10:15:55','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"active\",\"sid\":\"02b83fa2510f5e433fd6ab8cd2ee93ab\",\"isajaxcall\":\"1\",\"rand\":\"4431000\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2069,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=inactive&sid=02b83fa2510f5e433fd6ab8cd2ee93ab&isajaxcall=1&rand=4878177','2021-03-29 10:15:56','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"inactive\",\"sid\":\"02b83fa2510f5e433fd6ab8cd2ee93ab\",\"isajaxcall\":\"1\",\"rand\":\"4878177\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2070,'showresignuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showresignuser&sid=02b83fa2510f5e433fd6ab8cd2ee93ab&isajaxcall=1&rand=863570','2021-03-29 10:15:58','0000-00-00 00:00:00','{\"SCREEN\":\"showresignuser\",\"sid\":\"02b83fa2510f5e433fd6ab8cd2ee93ab\",\"isajaxcall\":\"1\",\"rand\":\"863570\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2071,'viewusermapping','127.0.0.1','dwfprod.local/index.php?SCREEN=viewusermapping&sid=02b83fa2510f5e433fd6ab8cd2ee93ab&isajaxcall=1&rand=3615017','2021-03-29 10:15:59','0000-00-00 00:00:00','{\"SCREEN\":\"viewusermapping\",\"sid\":\"02b83fa2510f5e433fd6ab8cd2ee93ab\",\"isajaxcall\":\"1\",\"rand\":\"3615017\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2072,'mappingrequested','127.0.0.1','dwfprod.local/index.php?SCREEN=mappingrequested&sid=02b83fa2510f5e433fd6ab8cd2ee93ab&isajaxcall=1&rand=644284','2021-03-29 10:16:00','0000-00-00 00:00:00','{\"SCREEN\":\"mappingrequested\",\"sid\":\"02b83fa2510f5e433fd6ab8cd2ee93ab\",\"isajaxcall\":\"1\",\"rand\":\"644284\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2073,'transferusermapping','127.0.0.1','dwfprod.local/index.php?SCREEN=transferusermapping&sid=02b83fa2510f5e433fd6ab8cd2ee93ab&isajaxcall=1&rand=7332300','2021-03-29 10:16:01','0000-00-00 00:00:00','{\"SCREEN\":\"transferusermapping\",\"sid\":\"02b83fa2510f5e433fd6ab8cd2ee93ab\",\"isajaxcall\":\"1\",\"rand\":\"7332300\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2074,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=02b83fa2510f5e433fd6ab8cd2ee93ab&isajaxcall=1&rand=9663292','2021-03-29 10:16:04','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"02b83fa2510f5e433fd6ab8cd2ee93ab\",\"isajaxcall\":\"1\",\"rand\":\"9663292\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2075,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=02b83fa2510f5e433fd6ab8cd2ee93ab&isajaxcall=1&rand=9448552','2021-03-29 10:16:06','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"02b83fa2510f5e433fd6ab8cd2ee93ab\",\"isajaxcall\":\"1\",\"rand\":\"9448552\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2076,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=02b83fa2510f5e433fd6ab8cd2ee93ab&isajaxcall=1&rand=9380582','2021-03-29 10:19:26','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"02b83fa2510f5e433fd6ab8cd2ee93ab\",\"isajaxcall\":\"1\",\"rand\":\"9380582\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2077,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=active&sid=02b83fa2510f5e433fd6ab8cd2ee93ab&isajaxcall=1&rand=9919085','2021-03-29 10:19:27','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"active\",\"sid\":\"02b83fa2510f5e433fd6ab8cd2ee93ab\",\"isajaxcall\":\"1\",\"rand\":\"9919085\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2078,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=02b83fa2510f5e433fd6ab8cd2ee93ab&isajaxcall=1&rand=402366','2021-03-29 10:51:02','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"02b83fa2510f5e433fd6ab8cd2ee93ab\",\"isajaxcall\":\"1\",\"rand\":\"402366\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2079,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=02b83fa2510f5e433fd6ab8cd2ee93ab&isajaxcall=1&rand=5669867','2021-03-29 10:51:04','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"02b83fa2510f5e433fd6ab8cd2ee93ab\",\"isajaxcall\":\"1\",\"rand\":\"5669867\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2080,'viewusermapping','127.0.0.1','dwfprod.local/index.php?SCREEN=viewusermapping&sid=02b83fa2510f5e433fd6ab8cd2ee93ab&isajaxcall=1&rand=8144208','2021-03-29 10:51:07','0000-00-00 00:00:00','{\"SCREEN\":\"viewusermapping\",\"sid\":\"02b83fa2510f5e433fd6ab8cd2ee93ab\",\"isajaxcall\":\"1\",\"rand\":\"8144208\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2081,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=02b83fa2510f5e433fd6ab8cd2ee93ab&isajaxcall=1&rand=1932572','2021-03-29 11:19:46','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"02b83fa2510f5e433fd6ab8cd2ee93ab\",\"isajaxcall\":\"1\",\"rand\":\"1932572\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2082,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=active&sid=02b83fa2510f5e433fd6ab8cd2ee93ab&isajaxcall=1&rand=2237350','2021-03-29 11:20:09','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"active\",\"sid\":\"02b83fa2510f5e433fd6ab8cd2ee93ab\",\"isajaxcall\":\"1\",\"rand\":\"2237350\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2083,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=02b83fa2510f5e433fd6ab8cd2ee93ab&isajaxcall=1&rand=841998','2021-03-29 11:47:43','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"02b83fa2510f5e433fd6ab8cd2ee93ab\",\"isajaxcall\":\"1\",\"rand\":\"841998\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2084,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=02b83fa2510f5e433fd6ab8cd2ee93ab&isajaxcall=1&rand=8041849','2021-03-29 12:07:21','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"02b83fa2510f5e433fd6ab8cd2ee93ab\",\"isajaxcall\":\"1\",\"rand\":\"8041849\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2085,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=active&sid=02b83fa2510f5e433fd6ab8cd2ee93ab&isajaxcall=1&rand=7116547','2021-03-29 12:07:23','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"active\",\"sid\":\"02b83fa2510f5e433fd6ab8cd2ee93ab\",\"isajaxcall\":\"1\",\"rand\":\"7116547\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2086,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=02b83fa2510f5e433fd6ab8cd2ee93ab&isajaxcall=1&rand=3074122','2021-03-29 12:07:24','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"02b83fa2510f5e433fd6ab8cd2ee93ab\",\"isajaxcall\":\"1\",\"rand\":\"3074122\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2087,'companyconfig','127.0.0.1','dwfprod.local/index.php?SCREEN=companyconfig&sid=02b83fa2510f5e433fd6ab8cd2ee93ab&isajaxcall=1&rand=467984','2021-03-29 12:08:25','0000-00-00 00:00:00','{\"SCREEN\":\"companyconfig\",\"sid\":\"02b83fa2510f5e433fd6ab8cd2ee93ab\",\"isajaxcall\":\"1\",\"rand\":\"467984\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2088,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=02b83fa2510f5e433fd6ab8cd2ee93ab&isajaxcall=1&rand=1183160','2021-03-29 12:08:28','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"02b83fa2510f5e433fd6ab8cd2ee93ab\",\"isajaxcall\":\"1\",\"rand\":\"1183160\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2089,'transferusermapping','127.0.0.1','dwfprod.local/index.php?SCREEN=transferusermapping&sid=02b83fa2510f5e433fd6ab8cd2ee93ab&isajaxcall=1&rand=538430','2021-03-29 12:12:12','0000-00-00 00:00:00','{\"SCREEN\":\"transferusermapping\",\"sid\":\"02b83fa2510f5e433fd6ab8cd2ee93ab\",\"isajaxcall\":\"1\",\"rand\":\"538430\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2090,'mappingrequested','127.0.0.1','dwfprod.local/index.php?SCREEN=mappingrequested&sid=02b83fa2510f5e433fd6ab8cd2ee93ab&isajaxcall=1&rand=9815194','2021-03-29 12:12:19','0000-00-00 00:00:00','{\"SCREEN\":\"mappingrequested\",\"sid\":\"02b83fa2510f5e433fd6ab8cd2ee93ab\",\"isajaxcall\":\"1\",\"rand\":\"9815194\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2091,'viewusermapping','127.0.0.1','dwfprod.local/index.php?SCREEN=viewusermapping&sid=02b83fa2510f5e433fd6ab8cd2ee93ab&isajaxcall=1&rand=4001902','2021-03-29 12:12:48','0000-00-00 00:00:00','{\"SCREEN\":\"viewusermapping\",\"sid\":\"02b83fa2510f5e433fd6ab8cd2ee93ab\",\"isajaxcall\":\"1\",\"rand\":\"4001902\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2092,'viewusermapping','127.0.0.1','dwfprod.local/index.php?SCREEN=viewusermapping&sid=02b83fa2510f5e433fd6ab8cd2ee93ab&isajaxcall=1&rand=793708','2021-03-29 12:12:50','0000-00-00 00:00:00','{\"SCREEN\":\"viewusermapping\",\"sid\":\"02b83fa2510f5e433fd6ab8cd2ee93ab\",\"isajaxcall\":\"1\",\"rand\":\"793708\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2093,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=active&sid=02b83fa2510f5e433fd6ab8cd2ee93ab&isajaxcall=1&rand=4278612','2021-03-29 12:20:44','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"active\",\"sid\":\"02b83fa2510f5e433fd6ab8cd2ee93ab\",\"isajaxcall\":\"1\",\"rand\":\"4278612\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2094,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=02b83fa2510f5e433fd6ab8cd2ee93ab&isajaxcall=1&rand=664695','2021-03-29 12:20:47','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"02b83fa2510f5e433fd6ab8cd2ee93ab\",\"isajaxcall\":\"1\",\"rand\":\"664695\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2095,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=02b83fa2510f5e433fd6ab8cd2ee93ab&isajaxcall=1&rand=8755229','2021-03-29 12:49:39','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"02b83fa2510f5e433fd6ab8cd2ee93ab\",\"isajaxcall\":\"1\",\"rand\":\"8755229\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2096,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=active&sid=02b83fa2510f5e433fd6ab8cd2ee93ab&isajaxcall=1&rand=2424758','2021-03-29 12:49:41','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"active\",\"sid\":\"02b83fa2510f5e433fd6ab8cd2ee93ab\",\"isajaxcall\":\"1\",\"rand\":\"2424758\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2097,'showresignuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showresignuser&sid=02b83fa2510f5e433fd6ab8cd2ee93ab&isajaxcall=1&rand=6140353','2021-03-29 12:49:44','0000-00-00 00:00:00','{\"SCREEN\":\"showresignuser\",\"sid\":\"02b83fa2510f5e433fd6ab8cd2ee93ab\",\"isajaxcall\":\"1\",\"rand\":\"6140353\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2098,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=active&sid=f4a0f54dd1bc7beceafe35025afa6f37&isajaxcall=1&rand=5743230','2021-03-29 17:39:31','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"active\",\"sid\":\"f4a0f54dd1bc7beceafe35025afa6f37\",\"isajaxcall\":\"1\",\"rand\":\"5743230\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2099,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=inactive&sid=9d81a4cca2829e6c5a789cdf9e3c848a&isajaxcall=1&rand=6580434','2021-04-05 10:09:24','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"inactive\",\"sid\":\"9d81a4cca2829e6c5a789cdf9e3c848a\",\"isajaxcall\":\"1\",\"rand\":\"6580434\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2100,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=inactive&sid=9d81a4cca2829e6c5a789cdf9e3c848a&isajaxcall=1&rand=9276649','2021-04-05 10:09:25','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"inactive\",\"sid\":\"9d81a4cca2829e6c5a789cdf9e3c848a\",\"isajaxcall\":\"1\",\"rand\":\"9276649\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2101,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=e442b684defffe73c7172f11355e056e&isajaxcall=1&rand=7709886','2021-04-05 10:18:22','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"e442b684defffe73c7172f11355e056e\",\"isajaxcall\":\"1\",\"rand\":\"7709886\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2102,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=active&sid=e442b684defffe73c7172f11355e056e&isajaxcall=1&rand=6303420','2021-04-05 10:18:24','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"active\",\"sid\":\"e442b684defffe73c7172f11355e056e\",\"isajaxcall\":\"1\",\"rand\":\"6303420\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2103,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=inactive&sid=e442b684defffe73c7172f11355e056e&isajaxcall=1&rand=3363090','2021-04-05 10:18:25','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"inactive\",\"sid\":\"e442b684defffe73c7172f11355e056e\",\"isajaxcall\":\"1\",\"rand\":\"3363090\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2104,'showresignuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showresignuser&sid=e442b684defffe73c7172f11355e056e&isajaxcall=1&rand=7966665','2021-04-05 10:18:26','0000-00-00 00:00:00','{\"SCREEN\":\"showresignuser\",\"sid\":\"e442b684defffe73c7172f11355e056e\",\"isajaxcall\":\"1\",\"rand\":\"7966665\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2105,'viewusermapping','127.0.0.1','dwfprod.local/index.php?SCREEN=viewusermapping&sid=e442b684defffe73c7172f11355e056e&isajaxcall=1&rand=4199952','2021-04-05 10:18:27','0000-00-00 00:00:00','{\"SCREEN\":\"viewusermapping\",\"sid\":\"e442b684defffe73c7172f11355e056e\",\"isajaxcall\":\"1\",\"rand\":\"4199952\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2106,'mappingrequested','127.0.0.1','dwfprod.local/index.php?SCREEN=mappingrequested&sid=e442b684defffe73c7172f11355e056e&isajaxcall=1&rand=3973454','2021-04-05 10:18:28','0000-00-00 00:00:00','{\"SCREEN\":\"mappingrequested\",\"sid\":\"e442b684defffe73c7172f11355e056e\",\"isajaxcall\":\"1\",\"rand\":\"3973454\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2107,'transferusermapping','127.0.0.1','dwfprod.local/index.php?SCREEN=transferusermapping&sid=e442b684defffe73c7172f11355e056e&isajaxcall=1&rand=7168926','2021-04-05 10:18:35','0000-00-00 00:00:00','{\"SCREEN\":\"transferusermapping\",\"sid\":\"e442b684defffe73c7172f11355e056e\",\"isajaxcall\":\"1\",\"rand\":\"7168926\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2108,'mappingrequested','127.0.0.1','dwfprod.local/index.php?SCREEN=mappingrequested&sid=e442b684defffe73c7172f11355e056e&isajaxcall=1&rand=9050249','2021-04-05 10:18:36','0000-00-00 00:00:00','{\"SCREEN\":\"mappingrequested\",\"sid\":\"e442b684defffe73c7172f11355e056e\",\"isajaxcall\":\"1\",\"rand\":\"9050249\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2109,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=e442b684defffe73c7172f11355e056e&isajaxcall=1&rand=8744127','2021-04-05 10:24:34','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"e442b684defffe73c7172f11355e056e\",\"isajaxcall\":\"1\",\"rand\":\"8744127\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2110,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=active&sid=e442b684defffe73c7172f11355e056e&isajaxcall=1&rand=6382441','2021-04-05 10:24:35','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"active\",\"sid\":\"e442b684defffe73c7172f11355e056e\",\"isajaxcall\":\"1\",\"rand\":\"6382441\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2111,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=e442b684defffe73c7172f11355e056e&isajaxcall=1&rand=6336198','2021-04-05 10:24:37','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"e442b684defffe73c7172f11355e056e\",\"isajaxcall\":\"1\",\"rand\":\"6336198\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2112,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=inactive&sid=e442b684defffe73c7172f11355e056e&isajaxcall=1&rand=4435459','2021-04-05 10:24:43','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"inactive\",\"sid\":\"e442b684defffe73c7172f11355e056e\",\"isajaxcall\":\"1\",\"rand\":\"4435459\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2113,'showresignuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showresignuser&sid=e442b684defffe73c7172f11355e056e&isajaxcall=1&rand=1906414','2021-04-05 10:24:44','0000-00-00 00:00:00','{\"SCREEN\":\"showresignuser\",\"sid\":\"e442b684defffe73c7172f11355e056e\",\"isajaxcall\":\"1\",\"rand\":\"1906414\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2114,'viewusermapping','127.0.0.1','dwfprod.local/index.php?SCREEN=viewusermapping&sid=e442b684defffe73c7172f11355e056e&isajaxcall=1&rand=4870205','2021-04-05 10:24:45','0000-00-00 00:00:00','{\"SCREEN\":\"viewusermapping\",\"sid\":\"e442b684defffe73c7172f11355e056e\",\"isajaxcall\":\"1\",\"rand\":\"4870205\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2115,'mappingrequested','127.0.0.1','dwfprod.local/index.php?SCREEN=mappingrequested&sid=e442b684defffe73c7172f11355e056e&isajaxcall=1&rand=4249077','2021-04-05 10:24:46','0000-00-00 00:00:00','{\"SCREEN\":\"mappingrequested\",\"sid\":\"e442b684defffe73c7172f11355e056e\",\"isajaxcall\":\"1\",\"rand\":\"4249077\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2116,'transferusermapping','127.0.0.1','dwfprod.local/index.php?SCREEN=transferusermapping&sid=e442b684defffe73c7172f11355e056e&isajaxcall=1&rand=244479','2021-04-05 10:24:47','0000-00-00 00:00:00','{\"SCREEN\":\"transferusermapping\",\"sid\":\"e442b684defffe73c7172f11355e056e\",\"isajaxcall\":\"1\",\"rand\":\"244479\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2117,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=active&sid=e442b684defffe73c7172f11355e056e&isajaxcall=1&rand=3063729','2021-04-05 10:28:34','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"active\",\"sid\":\"e442b684defffe73c7172f11355e056e\",\"isajaxcall\":\"1\",\"rand\":\"3063729\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2118,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=e442b684defffe73c7172f11355e056e&isajaxcall=1&rand=5104526','2021-04-05 10:35:14','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"e442b684defffe73c7172f11355e056e\",\"isajaxcall\":\"1\",\"rand\":\"5104526\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2119,'showuser','127.0.0.1','dwfprod.local/index.php?SCREEN=showuser&status=active&sid=e442b684defffe73c7172f11355e056e&isajaxcall=1&rand=7394789','2021-04-05 10:35:15','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"active\",\"sid\":\"e442b684defffe73c7172f11355e056e\",\"isajaxcall\":\"1\",\"rand\":\"7394789\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2120,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=e442b684defffe73c7172f11355e056e&isajaxcall=1&rand=1003449','2021-04-05 10:35:16','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"e442b684defffe73c7172f11355e056e\",\"isajaxcall\":\"1\",\"rand\":\"1003449\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2121,'showUserPipeLine','127.0.0.1','dwfprod.local/index.php?SCREEN=showUserPipeLine&sid=e57bbfe796e7df5eb7e40c7853447ea4&isajaxcall=1&rand=2219012','2021-04-05 12:09:10','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"e57bbfe796e7df5eb7e40c7853447ea4\",\"isajaxcall\":\"1\",\"rand\":\"2219012\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2122,'adduser','127.0.0.1','dwfprod.local/index.php?SCREEN=adduser&sid=e57bbfe796e7df5eb7e40c7853447ea4&isajaxcall=1&rand=2311107','2021-04-05 12:09:22','0000-00-00 00:00:00','{\"SCREEN\":\"adduser\",\"sid\":\"e57bbfe796e7df5eb7e40c7853447ea4\",\"isajaxcall\":\"1\",\"rand\":\"2311107\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2123,'showUserPipeLine','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=showUserPipeLine&sid=b1eafa6493c5e9b51ce9a4441bc481be&isajaxcall=1&rand=7010927','2021-04-07 11:54:50','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"b1eafa6493c5e9b51ce9a4441bc481be\",\"isajaxcall\":\"1\",\"rand\":\"7010927\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2124,'showUserPipeLine','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=showUserPipeLine&sid=b1eafa6493c5e9b51ce9a4441bc481be&isajaxcall=1&rand=9396575','2021-04-07 11:55:04','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"b1eafa6493c5e9b51ce9a4441bc481be\",\"isajaxcall\":\"1\",\"rand\":\"9396575\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2125,'showuser','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=showuser&status=active&sid=b1eafa6493c5e9b51ce9a4441bc481be&isajaxcall=1&rand=9213424','2021-04-07 11:55:05','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"active\",\"sid\":\"b1eafa6493c5e9b51ce9a4441bc481be\",\"isajaxcall\":\"1\",\"rand\":\"9213424\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2126,'showuser','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=showuser&status=inactive&sid=b1eafa6493c5e9b51ce9a4441bc481be&isajaxcall=1&rand=1293582','2021-04-07 11:55:06','0000-00-00 00:00:00','{\"SCREEN\":\"showuser\",\"status\":\"inactive\",\"sid\":\"b1eafa6493c5e9b51ce9a4441bc481be\",\"isajaxcall\":\"1\",\"rand\":\"1293582\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2127,'showresignuser','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=showresignuser&sid=b1eafa6493c5e9b51ce9a4441bc481be&isajaxcall=1&rand=6603616','2021-04-07 11:55:07','0000-00-00 00:00:00','{\"SCREEN\":\"showresignuser\",\"sid\":\"b1eafa6493c5e9b51ce9a4441bc481be\",\"isajaxcall\":\"1\",\"rand\":\"6603616\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2128,'showUserPipeLine','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=showUserPipeLine&sid=b1eafa6493c5e9b51ce9a4441bc481be&isajaxcall=1&rand=1630054','2021-04-07 11:55:08','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"b1eafa6493c5e9b51ce9a4441bc481be\",\"isajaxcall\":\"1\",\"rand\":\"1630054\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2129,'showUserPipeLine','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=showUserPipeLine&sid=a6426670fdbc8b5750bbd5db533cbddc&isajaxcall=1&rand=3876293','2021-04-07 13:47:28','0000-00-00 00:00:00','{\"SCREEN\":\"showUserPipeLine\",\"sid\":\"a6426670fdbc8b5750bbd5db533cbddc\",\"isajaxcall\":\"1\",\"rand\":\"3876293\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2130,'addlead','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=addlead&sid=e7202fc94047b26488ad58fe49fe3b18&isajaxcall=1&rand=8268652','2021-04-08 10:31:30','0000-00-00 00:00:00','{\"SCREEN\":\"addlead\",\"sid\":\"e7202fc94047b26488ad58fe49fe3b18\",\"isajaxcall\":\"1\",\"rand\":\"8268652\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2131,'addlead','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=addlead&sid=e7202fc94047b26488ad58fe49fe3b18&isajaxcall=1&rand=1201711','2021-04-08 10:31:31','0000-00-00 00:00:00','{\"SCREEN\":\"addlead\",\"sid\":\"e7202fc94047b26488ad58fe49fe3b18\",\"isajaxcall\":\"1\",\"rand\":\"1201711\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2132,'leadlist','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=leadlist&sid=e7202fc94047b26488ad58fe49fe3b18&isajaxcall=1&rand=9450450','2021-04-08 10:31:32','0000-00-00 00:00:00','{\"SCREEN\":\"leadlist\",\"sid\":\"e7202fc94047b26488ad58fe49fe3b18\",\"isajaxcall\":\"1\",\"rand\":\"9450450\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2133,'leadlist','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=leadlist&leadStatus=open&assign=unassign&sid=e7202fc94047b26488ad58fe49fe3b18&isajaxcall=1&rand=8663188','2021-04-08 10:31:33','0000-00-00 00:00:00','{\"SCREEN\":\"leadlist\",\"leadStatus\":\"open\",\"assign\":\"unassign\",\"sid\":\"e7202fc94047b26488ad58fe49fe3b18\",\"isajaxcall\":\"1\",\"rand\":\"8663188\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2134,'leadlist','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=leadlist&leadStatus=Inprocess&assign=assign&sid=e7202fc94047b26488ad58fe49fe3b18&isajaxcall=1&rand=1314600','2021-04-08 10:31:35','0000-00-00 00:00:00','{\"SCREEN\":\"leadlist\",\"leadStatus\":\"Inprocess\",\"assign\":\"assign\",\"sid\":\"e7202fc94047b26488ad58fe49fe3b18\",\"isajaxcall\":\"1\",\"rand\":\"1314600\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2135,'leadlist','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=leadlist&leadStatus=qualified&assign=assign&sid=e7202fc94047b26488ad58fe49fe3b18&isajaxcall=1&rand=3124428','2021-04-08 10:31:36','0000-00-00 00:00:00','{\"SCREEN\":\"leadlist\",\"leadStatus\":\"qualified\",\"assign\":\"assign\",\"sid\":\"e7202fc94047b26488ad58fe49fe3b18\",\"isajaxcall\":\"1\",\"rand\":\"3124428\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2136,'leadlist','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=leadlist&leadStatus=closed%20by%20self&assign=assign&sid=e7202fc94047b26488ad58fe49fe3b18&isajaxcall=1&rand=5145229','2021-04-08 10:31:36','0000-00-00 00:00:00','{\"SCREEN\":\"leadlist\",\"leadStatus\":\"closed by self\",\"assign\":\"assign\",\"sid\":\"e7202fc94047b26488ad58fe49fe3b18\",\"isajaxcall\":\"1\",\"rand\":\"5145229\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2137,'leadlist','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=leadlist&leadStatus=closed%20by%20system&assign=assign&sid=e7202fc94047b26488ad58fe49fe3b18&isajaxcall=1&rand=690589','2021-04-08 10:31:37','0000-00-00 00:00:00','{\"SCREEN\":\"leadlist\",\"leadStatus\":\"closed by system\",\"assign\":\"assign\",\"sid\":\"e7202fc94047b26488ad58fe49fe3b18\",\"isajaxcall\":\"1\",\"rand\":\"690589\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2138,'leadlist','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=leadlist&leadStatus=dead&assign=assign&sid=e7202fc94047b26488ad58fe49fe3b18&isajaxcall=1&rand=7756702','2021-04-08 10:31:37','0000-00-00 00:00:00','{\"SCREEN\":\"leadlist\",\"leadStatus\":\"dead\",\"assign\":\"assign\",\"sid\":\"e7202fc94047b26488ad58fe49fe3b18\",\"isajaxcall\":\"1\",\"rand\":\"7756702\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2139,'countwisereport','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=countwisereport&sid=e7202fc94047b26488ad58fe49fe3b18&isajaxcall=1&rand=2140334','2021-04-08 10:31:41','0000-00-00 00:00:00','{\"SCREEN\":\"countwisereport\",\"sid\":\"e7202fc94047b26488ad58fe49fe3b18\",\"isajaxcall\":\"1\",\"rand\":\"2140334\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2140,'amountwisereport','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=amountwisereport&sid=e7202fc94047b26488ad58fe49fe3b18&isajaxcall=1&rand=892115','2021-04-08 10:31:43','0000-00-00 00:00:00','{\"SCREEN\":\"amountwisereport\",\"sid\":\"e7202fc94047b26488ad58fe49fe3b18\",\"isajaxcall\":\"1\",\"rand\":\"892115\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2141,'channelwisereport','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=channelwisereport&sid=e7202fc94047b26488ad58fe49fe3b18&isajaxcall=1&rand=6918547','2021-04-08 10:31:46','0000-00-00 00:00:00','{\"SCREEN\":\"channelwisereport\",\"sid\":\"e7202fc94047b26488ad58fe49fe3b18\",\"isajaxcall\":\"1\",\"rand\":\"6918547\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2142,'leadlist','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=leadlist&sid=e7202fc94047b26488ad58fe49fe3b18&isajaxcall=1&rand=6895912','2021-04-08 10:31:49','0000-00-00 00:00:00','{\"SCREEN\":\"leadlist\",\"sid\":\"e7202fc94047b26488ad58fe49fe3b18\",\"isajaxcall\":\"1\",\"rand\":\"6895912\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2143,'addlead','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=addlead&sid=a142b64f98b524cad1ab70ee70d86358&isajaxcall=1&rand=8299214','2021-04-14 09:48:33','0000-00-00 00:00:00','{\"SCREEN\":\"addlead\",\"sid\":\"a142b64f98b524cad1ab70ee70d86358\",\"isajaxcall\":\"1\",\"rand\":\"8299214\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2144,'leads_show','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=leads_show&sid=a142b64f98b524cad1ab70ee70d86358&isajaxcall=1&rand=15123','2021-04-14 09:48:37','0000-00-00 00:00:00','{\"SCREEN\":\"leads_show\",\"sid\":\"a142b64f98b524cad1ab70ee70d86358\",\"isajaxcall\":\"1\",\"rand\":\"15123\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2145,'addlead','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=addlead&sid=a142b64f98b524cad1ab70ee70d86358&isajaxcall=1&rand=5878478','2021-04-14 09:48:42','0000-00-00 00:00:00','{\"SCREEN\":\"addlead\",\"sid\":\"a142b64f98b524cad1ab70ee70d86358\",\"isajaxcall\":\"1\",\"rand\":\"5878478\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2146,'leads_add','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=leads_add&sid=a142b64f98b524cad1ab70ee70d86358&isajaxcall=1&rand=7090577','2021-04-14 10:19:14','0000-00-00 00:00:00','{\"SCREEN\":\"leads_add\",\"sid\":\"a142b64f98b524cad1ab70ee70d86358\",\"isajaxcall\":\"1\",\"rand\":\"7090577\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2147,'leads_add','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=leads_add&sid=a142b64f98b524cad1ab70ee70d86358&isajaxcall=1&rand=9663298','2021-04-14 10:19:56','0000-00-00 00:00:00','{\"SCREEN\":\"leads_add\",\"sid\":\"a142b64f98b524cad1ab70ee70d86358\",\"isajaxcall\":\"1\",\"rand\":\"9663298\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2148,'leads_add','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=leads_add&sid=a142b64f98b524cad1ab70ee70d86358&isajaxcall=1&rand=81533','2021-04-14 10:20:23','0000-00-00 00:00:00','{\"SCREEN\":\"leads_add\",\"sid\":\"a142b64f98b524cad1ab70ee70d86358\",\"isajaxcall\":\"1\",\"rand\":\"81533\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2149,'leads_add','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=leads_add&sid=a142b64f98b524cad1ab70ee70d86358&isajaxcall=1&rand=9285781','2021-04-14 10:24:25','0000-00-00 00:00:00','{\"SCREEN\":\"leads_add\",\"sid\":\"a142b64f98b524cad1ab70ee70d86358\",\"isajaxcall\":\"1\",\"rand\":\"9285781\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2150,'leads_add','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=leads_add&sid=a142b64f98b524cad1ab70ee70d86358&isajaxcall=1&rand=5793536','2021-04-14 10:24:33','0000-00-00 00:00:00','{\"SCREEN\":\"leads_add\",\"sid\":\"a142b64f98b524cad1ab70ee70d86358\",\"isajaxcall\":\"1\",\"rand\":\"5793536\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2151,'leads_add','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=leads_add&sid=a142b64f98b524cad1ab70ee70d86358&isajaxcall=1&rand=1562590','2021-04-14 10:25:02','0000-00-00 00:00:00','{\"SCREEN\":\"leads_add\",\"sid\":\"a142b64f98b524cad1ab70ee70d86358\",\"isajaxcall\":\"1\",\"rand\":\"1562590\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2152,'leads_add','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=leads_add&sid=a142b64f98b524cad1ab70ee70d86358&isajaxcall=1&rand=7118182','2021-04-14 10:25:16','0000-00-00 00:00:00','{\"SCREEN\":\"leads_add\",\"sid\":\"a142b64f98b524cad1ab70ee70d86358\",\"isajaxcall\":\"1\",\"rand\":\"7118182\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2153,'leads_add','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=leads_add&sid=a142b64f98b524cad1ab70ee70d86358&isajaxcall=1&rand=1694544','2021-04-14 10:26:02','0000-00-00 00:00:00','{\"SCREEN\":\"leads_add\",\"sid\":\"a142b64f98b524cad1ab70ee70d86358\",\"isajaxcall\":\"1\",\"rand\":\"1694544\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2154,'leads_add','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=leads_add&sid=a142b64f98b524cad1ab70ee70d86358&isajaxcall=1&rand=7385091','2021-04-14 10:26:34','0000-00-00 00:00:00','{\"SCREEN\":\"leads_add\",\"sid\":\"a142b64f98b524cad1ab70ee70d86358\",\"isajaxcall\":\"1\",\"rand\":\"7385091\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2155,'leads_add','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=leads_add&sid=a142b64f98b524cad1ab70ee70d86358&isajaxcall=1&rand=5817690','2021-04-14 10:26:49','0000-00-00 00:00:00','{\"SCREEN\":\"leads_add\",\"sid\":\"a142b64f98b524cad1ab70ee70d86358\",\"isajaxcall\":\"1\",\"rand\":\"5817690\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2156,'leads_add','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=leads_add&sid=a142b64f98b524cad1ab70ee70d86358&isajaxcall=1&rand=5136251','2021-04-14 10:27:15','0000-00-00 00:00:00','{\"SCREEN\":\"leads_add\",\"sid\":\"a142b64f98b524cad1ab70ee70d86358\",\"isajaxcall\":\"1\",\"rand\":\"5136251\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2157,'leads_add','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=leads_add&sid=6f2bceef7e0fecf5df4f95fea6a663a0&isajaxcall=1&rand=2601474','2021-04-15 14:19:07','0000-00-00 00:00:00','{\"SCREEN\":\"leads_add\",\"sid\":\"6f2bceef7e0fecf5df4f95fea6a663a0\",\"isajaxcall\":\"1\",\"rand\":\"2601474\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2158,'leads_add','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=leads_add&sid=6f2bceef7e0fecf5df4f95fea6a663a0&isajaxcall=1&rand=6680625','2021-04-15 14:54:56','0000-00-00 00:00:00','{\"SCREEN\":\"leads_add\",\"sid\":\"6f2bceef7e0fecf5df4f95fea6a663a0\",\"isajaxcall\":\"1\",\"rand\":\"6680625\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2159,'leads_add','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=leads_add&sid=6f2bceef7e0fecf5df4f95fea6a663a0&isajaxcall=1&rand=8526664','2021-04-15 14:55:20','0000-00-00 00:00:00','{\"SCREEN\":\"leads_add\",\"sid\":\"6f2bceef7e0fecf5df4f95fea6a663a0\",\"isajaxcall\":\"1\",\"rand\":\"8526664\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2160,'leads_add','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=leads_add&sid=6f2bceef7e0fecf5df4f95fea6a663a0&isajaxcall=1&rand=353929','2021-04-15 14:56:04','0000-00-00 00:00:00','{\"SCREEN\":\"leads_add\",\"sid\":\"6f2bceef7e0fecf5df4f95fea6a663a0\",\"isajaxcall\":\"1\",\"rand\":\"353929\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2161,'leads_add','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=leads_add&sid=6f2bceef7e0fecf5df4f95fea6a663a0&isajaxcall=1&rand=1763370','2021-04-15 15:00:59','0000-00-00 00:00:00','{\"SCREEN\":\"leads_add\",\"sid\":\"6f2bceef7e0fecf5df4f95fea6a663a0\",\"isajaxcall\":\"1\",\"rand\":\"1763370\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2162,'leads_add','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=leads_add&sid=6f2bceef7e0fecf5df4f95fea6a663a0&isajaxcall=1&rand=5155148','2021-04-15 15:01:54','0000-00-00 00:00:00','{\"SCREEN\":\"leads_add\",\"sid\":\"6f2bceef7e0fecf5df4f95fea6a663a0\",\"isajaxcall\":\"1\",\"rand\":\"5155148\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2163,'leads_add','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=leads_add&sid=6f2bceef7e0fecf5df4f95fea6a663a0&isajaxcall=1&rand=3363570','2021-04-15 15:04:04','0000-00-00 00:00:00','{\"SCREEN\":\"leads_add\",\"sid\":\"6f2bceef7e0fecf5df4f95fea6a663a0\",\"isajaxcall\":\"1\",\"rand\":\"3363570\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2164,'leads_add','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=leads_add&sid=6f2bceef7e0fecf5df4f95fea6a663a0&isajaxcall=1&rand=3750340','2021-04-15 15:04:21','0000-00-00 00:00:00','{\"SCREEN\":\"leads_add\",\"sid\":\"6f2bceef7e0fecf5df4f95fea6a663a0\",\"isajaxcall\":\"1\",\"rand\":\"3750340\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL),(2165,'leads_add','127.0.0.1','saleforcefrontend-app.local/index.php?SCREEN=leads_add&sid=6f2bceef7e0fecf5df4f95fea6a663a0&isajaxcall=1&rand=2603922','2021-04-15 15:04:48','0000-00-00 00:00:00','{\"SCREEN\":\"leads_add\",\"sid\":\"6f2bceef7e0fecf5df4f95fea6a663a0\",\"isajaxcall\":\"1\",\"rand\":\"2603922\"}',NULL,NULL,NULL,NULL,'tariqadmin@uhfsolutions.com',1367,'0000-00-00 00:00:00',NULL);

/* Procedure structure for procedure `customer_units` */

/*!50003 DROP PROCEDURE IF EXISTS  `customer_units` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`admin`@`%` PROCEDURE `customer_units`(
  IN customerCode VARCHAR (255),
  IN Customer_Name VARCHAR (255),
  IN Portfolio_ID VARCHAR (255),
  IN mnumenic VARCHAR (255),
  IN FUND_NAME VARCHAR (255),
  IN AGENT_NAME VARCHAR (255),
  IN BalUnits VARCHAR (255),
  IN BalanceAmount VARCHAR (255),
  IN ProductCode VARCHAR (255),
  IN LeadId VARCHAR (255)
)
BEGIN
  DECLARE Product_Id BIGINT ;
  DECLARE Fund_Record_Id BIGINT ;
  DECLARE customerId BIGINT ;
  
  IF LeadId IS NOT NULL 
  THEN 
  UPDATE `lead` SET lead_status = 'closed by system' , created_at = NOW() WHERE `crm_lead_id` = LeadId;
  END IF;
  SELECT 
    customer.customer_id INTO 
    customerId 
  FROM
    customer 
  WHERE customer.customer_code = TO_BASE64(customerCode) ;
  IF customerCode != "" 
  THEN ## Customer Protofolio
  SELECT 
    product.product_id INTO Product_Id 
  FROM
    product 
  WHERE product.product_code = ProductCode ;
  IF Product_Id != "" 
  THEN 
  SELECT 
    customer_portfolio_detail.record_id INTO Fund_Record_Id 
  FROM
    `customer_portfolio_detail` 
  WHERE customer_portfolio_detail.customer_code = TO_BASE64(customerCode) 
    AND customer_portfolio_detail.portfolio_name = Portfolio_ID 
    AND customer_portfolio_detail.fund_id = Product_Id 
    AND customer_portfolio_detail.agent_name = AGENT_NAME ;
  IF Fund_Record_Id IS NULL 
  THEN 
  INSERT INTO `customer_portfolio_detail` (
    `customer_id`,
    `customer_code`,
    `customer_name`,
    `fund_id`,
    `fund_name`,
    `mnumenic`,
    `portfolio_name`,
    `amount`,
    `agent_name`,
    `balance_unit`,
    `unit_type`
  ) 
  VALUES
    (
      customerId,
      TO_BASE64(customerCode),
      TO_BASE64(Customer_Name),
      Product_Id,
      FUND_NAME,
      mnumenic,
      Portfolio_ID,
      BalanceAmount,
      AGENT_NAME,
      BalUnits,
      'A'
    ) ;
  ELSEIF Fund_Record_Id != '' 
  THEN 
  UPDATE 
    customer_portfolio_detail 
  SET
    ## customer_id = customerId,
    customer_code = TO_BASE64(customerCode),
    customer_name = TO_BASE64(Customer_Name),
    fund_id = Product_Id,
    fund_name = FUND_NAME,
    mnumenic = mnumenic,
    portfolio_name = Portfolio_ID,
    amount = BalanceAmount,
    unit_type = 'A',
    balance_unit = BalUnits,
    agent_name = AGENT_NAME 
  WHERE record_id = Fund_Record_Id ;
  END IF ;
  END IF ;
  END IF ;
END */$$
DELIMITER ;

/* Procedure structure for procedure `demo` */

/*!50003 DROP PROCEDURE IF EXISTS  `demo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`admin`@`%` PROCEDURE `demo`(IN test int)
BEGIN
	select test;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `demo_pendingnotification` */

/*!50003 DROP PROCEDURE IF EXISTS  `demo_pendingnotification` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`admin`@`%` PROCEDURE `demo_pendingnotification`(IN dao_id INT)
BEGIN
	select dao_id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `fund_nav` */

/*!50003 DROP PROCEDURE IF EXISTS  `fund_nav` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`admin`@`%` PROCEDURE `fund_nav`(
  IN fund_id VARCHAR (255),
  IN fund_name VARCHAR (255),
  IN short_name VARCHAR (255),
  IN fund_group VARCHAR (255),
  IN fund_nav DOUBLE
)
BEGIN
  DECLARE fundName VARCHAR (20) ;
  SELECT 
    product_name INTO fundName 
  FROM
    product 
  WHERE product_code = fund_id ;
  IF fundName IS NULL
  THEN 
  INSERT INTO product (
    `product_code`,
    `product_name`,
    `mnemonic`,
    `category_name`,
    `nav`
  ) 
  VALUES
    (
      fund_id,
      fund_name,
      short_name,
      fund_group,
      fund_nav
    ) ;
  ELSEIF fundName != '' 
  THEN 
  UPDATE 
    product 
  SET
    nav = fund_nav 
  WHERE product_code = fund_id ;
  END IF ;
END */$$
DELIMITER ;

/* Procedure structure for procedure `close_by_system` */

/*!50003 DROP PROCEDURE IF EXISTS  `close_by_system` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`admin`@`%` PROCEDURE `close_by_system`(
  IN LeadId VARCHAR (255)
)
BEGIN
  
  IF LeadId IS NOT NULL 
  THEN 
  UPDATE `lead` SET lead_status = 'closed by system' , created_at = NOW() WHERE `crm_lead_id` = LeadId;
  END IF;
  
END */$$
DELIMITER ;

/* Procedure structure for procedure `hello world` */

/*!50003 DROP PROCEDURE IF EXISTS  `hello world` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`admin`@`localhost` PROCEDURE `hello world`()
BEGIN
	select * From users;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insert_pendingnotification` */

/*!50003 DROP PROCEDURE IF EXISTS  `insert_pendingnotification` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`admin`@`%` PROCEDURE `insert_pendingnotification`(IN dao_id VARCHAR(255),
       IN customer_code VARCHAR(255),
       IN notification_type VARCHAR(255),
       IN portfolio VARCHAR(255),
       IN amount DOUBLE(10,2),
       IN source_fund VARCHAR(255),
       IN destination_fund VARCHAR(255),
       IN transaction_date DATETIME,
       IN T24_ID VARCHAR(255),
       IN Lead_ID VARCHAR(255)
       )
BEGIN
      INSERT INTO `notification_pending`(`dao_id`,`customer_code`,`notification_type`,`portfolio`,`amount`,`source_fund`,`destination_fund`,`transaction_date`,`T24_id`,`lead_id`)
       VALUES(dao_id,customer_code,notification_type,portfolio,amount,source_fund,destination_fund,transaction_date,T24_ID,Lead_ID);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `customer_unit_copy` */

/*!50003 DROP PROCEDURE IF EXISTS  `customer_unit_copy` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`admin`@`%` PROCEDURE `customer_unit_copy`(
  IN DaoBranch VARCHAR (255),
  IN Customer_ID VARCHAR (255),
  IN Customer_Name VARCHAR (255),
  IN Currency VARCHAR (255),
  IN DaoID VARCHAR (255),
  IN AcctOpenDate DATETIME,
  IN dt_AccountOpening DATETIME,
  IN ID_NO VARCHAR (255),
  IN SectorCode VARCHAR (255),
  IN SectorName VARCHAR (255),
  IN daoGroupName VARCHAR (255),
  IN Address VARCHAR (255),
  IN CompleteAddress VARCHAR (255),
  IN Date_Of_Birth DATETIME,
  IN UpdateDate VARCHAR (255),
  IN Email VARCHAR (255),
  IN UN_VER_REASON VARCHAR (255),
  IN DebitCard VARCHAR (255),
  IN InternetBanking VARCHAR (255),
  IN SMSAlerts VARCHAR (255),
  IN ContactNo VARCHAR (255),
  IN Cnic DATE
 
)
BEGIN
  DECLARE Customer_Code VARCHAR (20) ;
  DECLARE Product_Id BIGINT ;
  DECLARE Fund_Record_Id BIGINT ;
  DECLARE customerId BIGINT ;
  DECLARE Mapping_Record_Id BIGINT ;
  DECLARE User_Id BIGINT ;
  
  INSERT INTO `update_customer_sp_log`
            (`dao_branch`,
             `customer_id`,
             `customer_name`,
             `currency`,
             `dao_id`,
             `account_open_date`,
             `dt_AccountOpening`,
             `id_no`,
             `sector_code`,
             `sector_name`,
             `dao_group`,
             `address`,
             `complete_address`,
             `dob`,
             `update_date`,
             `email`,
             `ver_reason`,
             `debit_card`,
             `net_banking`,
             `sms`,
             `contanct_no`,
	 `cnic_date`)
VALUES (DaoBranch,
        Customer_ID,
        Customer_Name,
        Currency,
        DaoID,
        AcctOpenDate,
        dt_AccountOpening,
        ID_NO,
        SectorCode,
        SectorName,
        daoGroupName,
        Address,
        CompleteAddress,
        Date_Of_Birth,
        UpdateDate,
        Email,
        UN_VER_REASON,
        DebitCard,
        InternetBanking,
       SMSAlerts,
        ContactNo,
        Cnic
        );
  
  SELECT 
    customer.customer_code,customer.customer_id INTO Customer_Code, customerId
  FROM
    customer 
  WHERE customer.customer_code = TO_BASE64(Customer_ID) ;
 
    
  IF Customer_Code IS NULL 
  THEN ## Customer
  INSERT INTO `customer` (
    `customer_code`,
    `customer_name`,
    `currency`,
    `account_opening_date`,
    `id_no`,
    `address`,
    `complete_address`,
    `date_of_birth`,
    `email_address`,
    `debit_card`,
    `internet_banking`,
    `sms_alert`,
    `dao_id`,
    `updated_at`,
    `account_num`,
    `contact_number`,
    `cnic_date`
  ) 
  VALUES
    (
      TO_BASE64(Customer_ID),
      TO_BASE64(Customer_Name),
      Currency,
      AcctOpenDate,
      TO_BASE64(ID_NO),
      TO_BASE64(Address),
      TO_BASE64(CompleteAddress),
      Date_Of_Birth,
      TO_BASE64(Email),
      DebitCard,
      InternetBanking,
      SMSAlerts,
      DaoID,
      NOW(),
      TO_BASE64(Customer_ID),
      TO_BASE64(ContactNo),
      Cnic
    ) ;
  SET customerId = 
  (SELECT 
    LAST_INSERT_ID()) ;
  ## Customer Detail
  INSERT INTO `customer_details` (
    `customer_id`,
    `customer_name`,
    `currency`,
    `id_number`,
    `email_one`,
    `account_opening_date`,
    `dao_branch`,
    `dao_id`,
    `account_balance`,
    `dt_account_opening`,
    `sector`,
    `sector_description`,
    `dao_group_name`,
    `un_ver_region`
  ) 
  VALUES
    (
      customerId,
      TO_BASE64(Customer_Name),
      TO_BASE64(Currency),
      TO_BASE64(ID_NO),
      TO_BASE64(Email),
      AcctOpenDate,
      DaoBranch,
      DaoID,
      0,
      dt_AccountOpening,
      SectorCode,
      SectorName,
      daoGroupName,
      UN_VER_REASON
    ) ;
  ## User Customer Mapping
  SELECT 
    u.user_id INTO User_Id 
  FROM
    users u 
  WHERE u.`login_id` = DaoID AND u.status='1' LIMIT 1;
  SELECT 
    user_customer.record_id INTO Mapping_Record_Id 
  FROM
    user_customer 
  WHERE user_customer.customer_id = customerId 
    AND user_customer.user_id = User_Id ;
    
  IF Mapping_Record_Id IS NULL 
  THEN 
  INSERT INTO `user_customer` (`customer_id`, `user_id`) 
  VALUES
    (customerId, User_Id) ;
  ELSEIF Mapping_Record_Id != '' 
  THEN 
  UPDATE 
    user_customer 
  SET
    user_id = User_Id,
    customer_id = customerId 
  WHERE user_customer.record_id = Mapping_Record_Id ;
  END IF ;
  
  ELSEIF Customer_Code != '' 
  THEN ## Customer
  UPDATE 
    customer 
  SET
    customer_name = TO_BASE64(Customer_Name),
    currency = Currency,
    id_no = TO_BASE64(ID_NO),
    address = TO_BASE64(Address),
    complete_address = TO_BASE64(CompleteAddress),
    date_of_birth = Date_Of_Birth,
    email_address = TO_BASE64(Email),
    debit_card = DebitCard,
    internet_banking = InternetBanking,
    sms_alert = SMSAlerts,
    dao_id = DaoID,
    updated_at = NOW(),
    contact_number = TO_BASE64(ContactNo),
    cnic_date = Cnic
    
      
  WHERE customer.customer_id = customerId ;
  ## Customer Detail
  UPDATE 
    customer_details 
  SET
    customer_name = TO_BASE64(Customer_Name),
    currency = Currency,
    id_number = TO_BASE64(ID_NO),
    email_one = TO_BASE64(Email),
    account_opening_date = AcctOpenDate,
    dao_branch = DaoBranch,
    dao_id = DaoID,
    account_balance = 0,
    dt_account_opening = dt_AccountOpening,
    sector = SectorCode,
    sector_description = SectorName,
    dao_group_name = daoGroupName,
    un_ver_region = UN_VER_REASON 
  WHERE customer_details.customer_id = customerId ;
  ## User Customer Mapping
  SELECT 
    u.user_id INTO User_Id 
  FROM
    users u 
  WHERE u.`login_id` = DaoID AND u.status='1' LIMIT 1;
  SELECT 
    user_customer.record_id INTO Mapping_Record_Id 
  FROM
    user_customer 
  WHERE user_customer.customer_id = customerId 
    AND user_customer.user_id = User_Id ;
  IF Mapping_Record_Id IS NULL 
  THEN 
  INSERT INTO `user_customer` (`customer_id`, `user_id`) 
  VALUES
    (customerId, User_Id) ;
  ELSEIF Mapping_Record_Id != '' 
  THEN 
  UPDATE 
    user_customer 
  SET
    user_id = User_Id,
    customer_id = customerId 
  WHERE user_customer.record_id = Mapping_Record_Id ;
  END IF ;
  
  END IF ;
  
  
  
END */$$
DELIMITER ;

/* Procedure structure for procedure `insert_update_customer_detail` */

/*!50003 DROP PROCEDURE IF EXISTS  `insert_update_customer_detail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`admin`@`%` PROCEDURE `insert_update_customer_detail`(
  IN DaoBranch VARCHAR (255),
  IN Customer_ID VARCHAR (255),
  IN Customer_Name VARCHAR (255),
  IN Currency VARCHAR (255),
  IN DaoID VARCHAR (255),
  IN AcctOpenDate DATETIME,
  IN dt_AccountOpening DATETIME,
  IN ID_NO VARCHAR (255),
  IN SectorCode VARCHAR (255),
  IN SectorName VARCHAR (255),
  IN daoGroupName VARCHAR (255),
  IN Address VARCHAR (255),
  IN CompleteAddress VARCHAR (255),
  IN Date_Of_Birth DATETIME,
  IN UpdateDate VARCHAR (255),
  IN Email VARCHAR (255),
  IN UN_VER_REASON VARCHAR (255),
  IN DebitCard VARCHAR (255),
  IN InternetBanking VARCHAR (255),
  IN SMSAlerts VARCHAR (255),
  IN ContactNo VARCHAR (255)
 
)
BEGIN
  DECLARE Customer_Code VARCHAR (20) ;
  DECLARE Product_Id BIGINT ;
  DECLARE Fund_Record_Id BIGINT ;
  DECLARE customerId BIGINT ;
  DECLARE Mapping_Record_Id BIGINT ;
  DECLARE User_Id BIGINT ;
  
  INSERT INTO `update_customer_sp_log`
            (`dao_branch`,
             `customer_id`,
             `customer_name`,
             `currency`,
             `dao_id`,
             `account_open_date`,
             `dt_AccountOpening`,
             `id_no`,
             `sector_code`,
             `sector_name`,
             `dao_group`,
             `address`,
             `complete_address`,
             `dob`,
             `update_date`,
             `email`,
             `ver_reason`,
             `debit_card`,
             `net_banking`,
             `sms`,
             `contanct_no`)
VALUES (DaoBranch,
        Customer_ID,
        Customer_Name,
        Currency,
        DaoID,
        AcctOpenDate,
        dt_AccountOpening,
        ID_NO,
        SectorCode,
        SectorName,
        daoGroupName,
        Address,
        CompleteAddress,
        Date_Of_Birth,
        UpdateDate,
        Email,
        UN_VER_REASON,
        DebitCard,
        InternetBanking,
       SMSAlerts,
        ContactNo
        );
  
  SELECT 
    customer.customer_code,customer.customer_id INTO Customer_Code, customerId
  FROM
    customer 
  WHERE customer.customer_code = TO_BASE64(Customer_ID) ;
 
    
  IF Customer_Code IS NULL 
  THEN ## Customer
  INSERT INTO `customer` (
    `customer_code`,
    `customer_name`,
    `currency`,
    `account_opening_date`,
    `id_no`,
    `address`,
    `complete_address`,
    `date_of_birth`,
    `email_address`,
    `debit_card`,
    `internet_banking`,
    `sms_alert`,
    `dao_id`,
    `updated_at`,
    `account_num`,
    `contact_number`
  ) 
  VALUES
    (
      TO_BASE64(Customer_ID),
      TO_BASE64(Customer_Name),
      Currency,
      AcctOpenDate,
      TO_BASE64(ID_NO),
      TO_BASE64(Address),
      TO_BASE64(CompleteAddress),
      Date_Of_Birth,
      TO_BASE64(Email),
      DebitCard,
      InternetBanking,
      SMSAlerts,
      DaoID,
      NOW(),
      TO_BASE64(Customer_ID),
      TO_BASE64(ContactNo)
    ) ;
  SET customerId = 
  (SELECT 
    LAST_INSERT_ID()) ;
  ## Customer Detail
  INSERT INTO `customer_details` (
    `customer_id`,
    `customer_name`,
    `currency`,
    `id_number`,
    `email_one`,
    `account_opening_date`,
    `dao_branch`,
    `dao_id`,
    `account_balance`,
    `dt_account_opening`,
    `sector`,
    `sector_description`,
    `dao_group_name`,
    `un_ver_region`
  ) 
  VALUES
    (
      customerId,
      TO_BASE64(Customer_Name),
      TO_BASE64(Currency),
      TO_BASE64(ID_NO),
      TO_BASE64(Email),
      AcctOpenDate,
      DaoBranch,
      DaoID,
      0,
      dt_AccountOpening,
      SectorCode,
      SectorName,
      daoGroupName,
      UN_VER_REASON
    ) ;
  ## User Customer Mapping
  SELECT 
    u.user_id INTO User_Id 
  FROM
    users u 
  WHERE u.`login_id` = DaoID AND u.status='1' LIMIT 1;
  SELECT 
    user_customer.record_id INTO Mapping_Record_Id 
  FROM
    user_customer 
  WHERE user_customer.customer_id = customerId 
    AND user_customer.user_id = User_Id ;
    
  IF Mapping_Record_Id IS NULL 
  THEN 
  INSERT INTO `user_customer` (`customer_id`, `user_id`) 
  VALUES
    (customerId, User_Id) ;
  ELSEIF Mapping_Record_Id != '' 
  THEN 
  UPDATE 
    user_customer 
  SET
    user_id = User_Id,
    customer_id = customerId 
  WHERE user_customer.record_id = Mapping_Record_Id ;
  END IF ;
  
  ELSEIF Customer_Code != '' 
  THEN ## Customer
  UPDATE 
    customer 
  SET
    customer_name = TO_BASE64(Customer_Name),
    currency = Currency,
    id_no = TO_BASE64(ID_NO),
    address = TO_BASE64(Address),
    complete_address = TO_BASE64(CompleteAddress),
    date_of_birth = Date_Of_Birth,
    email_address = TO_BASE64(Email),
    debit_card = DebitCard,
    internet_banking = InternetBanking,
    sms_alert = SMSAlerts,
    dao_id = DaoID,
    updated_at = NOW(),
    contact_number = TO_BASE64(ContactNo)
      
  WHERE customer.customer_id = customerId ;
  ## Customer Detail
  UPDATE 
    customer_details 
  SET
    customer_name = TO_BASE64(Customer_Name),
    currency = Currency,
    id_number = TO_BASE64(ID_NO),
    email_one = TO_BASE64(Email),
    account_opening_date = AcctOpenDate,
    dao_branch = DaoBranch,
    dao_id = DaoID,
    account_balance = 0,
    dt_account_opening = dt_AccountOpening,
    sector = SectorCode,
    sector_description = SectorName,
    dao_group_name = daoGroupName,
    un_ver_region = UN_VER_REASON 
  WHERE customer_details.customer_id = customerId ;
  ## User Customer Mapping
  SELECT 
    u.user_id INTO User_Id 
  FROM
    users u 
  WHERE u.`login_id` = DaoID AND u.status='1' LIMIT 1;
  SELECT 
    user_customer.record_id INTO Mapping_Record_Id 
  FROM
    user_customer 
  WHERE user_customer.customer_id = customerId 
    AND user_customer.user_id = User_Id ;
  IF Mapping_Record_Id IS NULL 
  THEN 
  INSERT INTO `user_customer` (`customer_id`, `user_id`) 
  VALUES
    (customerId, User_Id) ;
  ELSEIF Mapping_Record_Id != '' 
  THEN 
  UPDATE 
    user_customer 
  SET
    user_id = User_Id,
    customer_id = customerId 
  WHERE user_customer.record_id = Mapping_Record_Id ;
  END IF ;
  
  END IF ;
  
  
  
END */$$
DELIMITER ;

/* Procedure structure for procedure `sales_performance` */

/*!50003 DROP PROCEDURE IF EXISTS  `sales_performance` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`admin`@`localhost` PROCEDURE `sales_performance`(
  IN FinYear VARCHAR (255),
  IN FinMonth VARCHAR (255),
  IN DaoID VARCHAR (255),
  IN FundID VARCHAR (255),
  IN FundName VARCHAR (255),
  IN FundGroup VARCHAR (255),
  IN GrossSale VARCHAR (255),
  IN SaleRedemption VARCHAR (255),
  IN SaleFCI VARCHAR (255),
  IN SaleFCO VARCHAR (255),
  IN NetSale VARCHAR (255),
  IN RevenueLoad VARCHAR (255),
  IN RevenueFee VARCHAR (255)
)
BEGIN
 DECLARE Record_id BIGINT (20) ;
  
  INSERT INTO `performance_sheet_log` (
	`fin_year`,
	`fin_month`,
	`dao_id`,
	`fund_id`,
	`fund_name`,
	`fund_group`,
	`net_sale`,
	`gross_sale`,
	`revenue_load`,
	`revenue_fee`,
	`sale_redemption`,
	`sales_fci`,`sales_fco`) 
	VALUES (
	  FinYear,
	  FinMonth,
	  DaoID,
	  FundID,
	  FundName,
	  FundGroup,
	  NetSale,
	  GrossSale,
	  RevenueLoad,
	  RevenueFee,
	  SaleRedemption,
	  SaleFCI,
	  SaleFCO);
 
SELECT 
    net_sale_revenue.net_sale_revenue_id INTO Record_id
  FROM
    net_sale_revenue 
  WHERE net_sale_revenue.fin_year = FinYear AND net_sale_revenue.fin_month = FinMonth AND net_sale_revenue.dao_id = DaoID AND net_sale_revenue.fund_id = FundID;
IF Record_id IS NULL 
  THEN 
  INSERT INTO `net_sale_revenue`(
    `fin_year`,
	`fin_month`,
	`date`,
	`dao_id`,
	`fund_id`,
	`fund_name`,
	`fund_group`,
	`net_sale`,
	`gross_sale`,
	`revenue_load`,
	`revenue_fee`,
	`sale_redemption`) 
  VALUES
    (
	  FinYear,
	  FinMonth,
	  CONCAT(FinYear,'-',FinMonth,'-01'),
	  DaoID,
	  FundID,
	  FundName,
	  FundGroup,
	  NetSale,
	  GrossSale,
	  RevenueLoad,
	  RevenueFee,
	  SaleRedemption);
 ELSE 
  UPDATE 
	net_sale_revenue 
  SET
    `net_sale` = NetSale,
	`gross_sale` = GrossSale,
	`revenue_load` = RevenueLoad,
	`revenue_fee` = RevenueFee,
	`sale_redemption` = SaleRedemption
      
  WHERE net_sale_revenue.net_sale_revenue_id = Record_id;
  END IF;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
