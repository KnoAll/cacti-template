-- MariaDB dump 10.17  Distrib 10.4.12-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: cacti
-- ------------------------------------------------------
-- Server version	10.4.12-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aggregate_graph_templates`
--

DROP TABLE IF EXISTS `aggregate_graph_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aggregate_graph_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `graph_template_id` int(10) unsigned NOT NULL,
  `gprint_prefix` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gprint_format` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `graph_type` int(10) unsigned NOT NULL,
  `total` int(10) unsigned NOT NULL,
  `total_type` int(10) unsigned NOT NULL,
  `total_prefix` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_type` int(10) unsigned NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `graph_template_id` (`graph_template_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Template Definitions for Aggregate Graphs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aggregate_graph_templates`
--

LOCK TABLES `aggregate_graph_templates` WRITE;
/*!40000 ALTER TABLE `aggregate_graph_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `aggregate_graph_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aggregate_graph_templates_graph`
--

DROP TABLE IF EXISTS `aggregate_graph_templates_graph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aggregate_graph_templates_graph` (
  `aggregate_template_id` int(10) unsigned NOT NULL,
  `t_image_format_id` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `image_format_id` tinyint(1) NOT NULL DEFAULT 0,
  `t_height` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `height` mediumint(8) NOT NULL DEFAULT 0,
  `t_width` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `width` mediumint(8) NOT NULL DEFAULT 0,
  `t_upper_limit` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `upper_limit` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `t_lower_limit` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `lower_limit` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `t_vertical_label` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `vertical_label` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `t_slope_mode` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `slope_mode` char(2) COLLATE utf8mb4_unicode_ci DEFAULT 'on',
  `t_auto_scale` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `auto_scale` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `t_auto_scale_opts` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `auto_scale_opts` tinyint(1) NOT NULL DEFAULT 0,
  `t_auto_scale_log` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `auto_scale_log` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `t_scale_log_units` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `scale_log_units` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `t_auto_scale_rigid` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `auto_scale_rigid` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `t_auto_padding` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `auto_padding` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `t_base_value` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `base_value` mediumint(8) NOT NULL DEFAULT 0,
  `t_grouping` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `grouping` char(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `t_unit_value` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `unit_value` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `t_unit_exponent_value` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `unit_exponent_value` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `t_alt_y_grid` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `alt_y_grid` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_right_axis` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `right_axis` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_right_axis_label` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `right_axis_label` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_right_axis_format` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `right_axis_format` mediumint(8) DEFAULT NULL,
  `t_right_axis_formatter` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `right_axis_formatter` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_left_axis_formatter` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `left_axis_formatter` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_no_gridfit` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `no_gridfit` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_unit_length` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `unit_length` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_tab_width` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tab_width` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '30',
  `t_dynamic_labels` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `dynamic_labels` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_force_rules_legend` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `force_rules_legend` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_legend_position` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `legend_position` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_legend_direction` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `legend_direction` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`aggregate_template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Aggregate Template Graph Data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aggregate_graph_templates_graph`
--

LOCK TABLES `aggregate_graph_templates_graph` WRITE;
/*!40000 ALTER TABLE `aggregate_graph_templates_graph` DISABLE KEYS */;
/*!40000 ALTER TABLE `aggregate_graph_templates_graph` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aggregate_graph_templates_item`
--

DROP TABLE IF EXISTS `aggregate_graph_templates_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aggregate_graph_templates_item` (
  `aggregate_template_id` int(10) unsigned NOT NULL,
  `graph_templates_item_id` int(10) unsigned NOT NULL,
  `sequence` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `color_template` int(11) NOT NULL,
  `t_graph_type_id` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `graph_type_id` tinyint(3) NOT NULL DEFAULT 0,
  `t_cdef_id` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `cdef_id` mediumint(8) unsigned DEFAULT NULL,
  `item_skip` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_total` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`aggregate_template_id`,`graph_templates_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Aggregate Template Graph Items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aggregate_graph_templates_item`
--

LOCK TABLES `aggregate_graph_templates_item` WRITE;
/*!40000 ALTER TABLE `aggregate_graph_templates_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `aggregate_graph_templates_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aggregate_graphs`
--

DROP TABLE IF EXISTS `aggregate_graphs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aggregate_graphs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `aggregate_template_id` int(10) unsigned NOT NULL,
  `template_propogation` char(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `local_graph_id` int(10) unsigned NOT NULL,
  `title_format` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `graph_template_id` int(10) unsigned NOT NULL,
  `gprint_prefix` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gprint_format` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `graph_type` int(10) unsigned NOT NULL,
  `total` int(10) unsigned NOT NULL,
  `total_type` int(10) unsigned NOT NULL,
  `total_prefix` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_type` int(10) unsigned NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `aggregate_template_id` (`aggregate_template_id`),
  KEY `local_graph_id` (`local_graph_id`),
  KEY `title_format` (`title_format`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Aggregate Graph Definitions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aggregate_graphs`
--

LOCK TABLES `aggregate_graphs` WRITE;
/*!40000 ALTER TABLE `aggregate_graphs` DISABLE KEYS */;
/*!40000 ALTER TABLE `aggregate_graphs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aggregate_graphs_graph_item`
--

DROP TABLE IF EXISTS `aggregate_graphs_graph_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aggregate_graphs_graph_item` (
  `aggregate_graph_id` int(10) unsigned NOT NULL,
  `graph_templates_item_id` int(10) unsigned NOT NULL,
  `sequence` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `color_template` int(11) unsigned NOT NULL,
  `t_graph_type_id` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `graph_type_id` tinyint(3) NOT NULL DEFAULT 0,
  `t_cdef_id` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `cdef_id` mediumint(8) unsigned DEFAULT NULL,
  `item_skip` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_total` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`aggregate_graph_id`,`graph_templates_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Aggregate Graph Graph Items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aggregate_graphs_graph_item`
--

LOCK TABLES `aggregate_graphs_graph_item` WRITE;
/*!40000 ALTER TABLE `aggregate_graphs_graph_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `aggregate_graphs_graph_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aggregate_graphs_items`
--

DROP TABLE IF EXISTS `aggregate_graphs_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aggregate_graphs_items` (
  `aggregate_graph_id` int(10) unsigned NOT NULL,
  `local_graph_id` int(10) unsigned NOT NULL,
  `sequence` mediumint(8) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`aggregate_graph_id`,`local_graph_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Aggregate Graph Items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aggregate_graphs_items`
--

LOCK TABLES `aggregate_graphs_items` WRITE;
/*!40000 ALTER TABLE `aggregate_graphs_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `aggregate_graphs_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automation_devices`
--

DROP TABLE IF EXISTS `automation_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automation_devices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `network_id` int(10) unsigned NOT NULL DEFAULT 0,
  `hostname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ip` varchar(17) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `snmp_community` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `snmp_version` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `snmp_port` mediumint(5) unsigned NOT NULL DEFAULT 161,
  `snmp_username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `snmp_password` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `snmp_auth_protocol` char(6) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `snmp_priv_passphrase` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `snmp_priv_protocol` char(6) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `snmp_context` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `snmp_engine_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `sysName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sysLocation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sysContact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sysDescr` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sysUptime` int(32) NOT NULL DEFAULT 0,
  `os` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `snmp` tinyint(4) NOT NULL DEFAULT 0,
  `known` tinyint(4) NOT NULL DEFAULT 0,
  `up` tinyint(4) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip` (`ip`),
  KEY `hostname` (`hostname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Table of Discovered Devices';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automation_devices`
--

LOCK TABLES `automation_devices` WRITE;
/*!40000 ALTER TABLE `automation_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `automation_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automation_graph_rule_items`
--

DROP TABLE IF EXISTS `automation_graph_rule_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automation_graph_rule_items` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `rule_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `sequence` smallint(3) unsigned NOT NULL DEFAULT 0,
  `operation` smallint(3) unsigned NOT NULL DEFAULT 0,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `operator` smallint(3) unsigned NOT NULL DEFAULT 0,
  `pattern` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Automation Graph Rule Items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automation_graph_rule_items`
--

LOCK TABLES `automation_graph_rule_items` WRITE;
/*!40000 ALTER TABLE `automation_graph_rule_items` DISABLE KEYS */;
INSERT INTO `automation_graph_rule_items` VALUES (1,1,1,0,'ifOperStatus',7,'Up'),(2,1,2,1,'ifIP',16,''),(3,1,3,1,'ifHwAddr',16,''),(4,2,1,0,'ifOperStatus',7,'Up'),(5,2,2,1,'ifIP',16,''),(6,2,3,1,'ifHwAddr',16,'');
/*!40000 ALTER TABLE `automation_graph_rule_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automation_graph_rules`
--

DROP TABLE IF EXISTS `automation_graph_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automation_graph_rules` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `snmp_query_id` smallint(3) unsigned NOT NULL DEFAULT 0,
  `graph_type_id` smallint(3) unsigned NOT NULL DEFAULT 0,
  `enabled` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `name` (`name`(171))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Automation Graph Rules';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automation_graph_rules`
--

LOCK TABLES `automation_graph_rules` WRITE;
/*!40000 ALTER TABLE `automation_graph_rules` DISABLE KEYS */;
INSERT INTO `automation_graph_rules` VALUES (1,'Traffic 64 bit Server',4,14,'on'),(2,'Traffic 64 bit Server Linux',4,14,'on'),(3,'Disk Space',7,28,'on');
/*!40000 ALTER TABLE `automation_graph_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automation_ips`
--

DROP TABLE IF EXISTS `automation_ips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automation_ips` (
  `ip_address` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hostname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `network_id` int(10) unsigned DEFAULT NULL,
  `pid` int(10) unsigned DEFAULT NULL,
  `status` int(10) unsigned DEFAULT NULL,
  `thread` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ip_address`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='List of discoverable ip addresses used for scanning';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automation_ips`
--

LOCK TABLES `automation_ips` WRITE;
/*!40000 ALTER TABLE `automation_ips` DISABLE KEYS */;
/*!40000 ALTER TABLE `automation_ips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automation_match_rule_items`
--

DROP TABLE IF EXISTS `automation_match_rule_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automation_match_rule_items` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `rule_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `rule_type` smallint(3) unsigned NOT NULL DEFAULT 0,
  `sequence` smallint(3) unsigned NOT NULL DEFAULT 0,
  `operation` smallint(3) unsigned NOT NULL DEFAULT 0,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `operator` smallint(3) unsigned NOT NULL DEFAULT 0,
  `pattern` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Automation Match Rule Items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automation_match_rule_items`
--

LOCK TABLES `automation_match_rule_items` WRITE;
/*!40000 ALTER TABLE `automation_match_rule_items` DISABLE KEYS */;
INSERT INTO `automation_match_rule_items` VALUES (1,1,1,1,0,'h.snmp_sysDescr',8,''),(2,1,1,2,1,'h.snmp_version',12,'2'),(3,1,3,1,0,'ht.name',1,'Linux'),(4,2,1,1,0,'ht.name',1,'Linux'),(5,2,1,2,1,'h.snmp_version',12,'2'),(6,2,3,1,0,'ht.name',1,'SNMP'),(7,2,3,2,1,'gt.name',1,'Traffic'),(8,1,1,3,1,'h.snmp_sysDescr',2,'Windows');
/*!40000 ALTER TABLE `automation_match_rule_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automation_networks`
--

DROP TABLE IF EXISTS `automation_networks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automation_networks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `poller_id` int(10) unsigned DEFAULT 1,
  `site_id` int(10) unsigned DEFAULT 1,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'The name for this network',
  `subnet_range` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Defined subnet ranges for discovery',
  `dns_servers` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'DNS Servers to use for name resolution',
  `enabled` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `notification_enabled` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `notification_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `notification_fromname` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `notification_fromemail` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `snmp_id` int(10) unsigned DEFAULT NULL,
  `enable_netbios` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `add_to_cacti` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `same_sysname` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `total_ips` int(10) unsigned DEFAULT 0,
  `up_hosts` int(10) unsigned NOT NULL DEFAULT 0,
  `snmp_hosts` int(10) unsigned NOT NULL DEFAULT 0,
  `ping_method` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'The ping method (ICMP:TCP:UDP)',
  `ping_port` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'For TCP:UDP the port to ping',
  `ping_timeout` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'The ping timeout in seconds',
  `ping_retries` int(10) unsigned DEFAULT 0,
  `sched_type` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Schedule type: manual or automatic',
  `threads` int(10) unsigned DEFAULT 1,
  `run_limit` int(10) unsigned DEFAULT 0 COMMENT 'The maximum runtime for the discovery',
  `start_at` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `next_start` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `recur_every` int(10) unsigned DEFAULT 1,
  `day_of_week` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'The days of week to run in crontab format',
  `month` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'The months to run in crontab format',
  `day_of_month` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'The days of month to run in crontab format',
  `monthly_week` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monthly_day` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_runtime` double NOT NULL DEFAULT 0 COMMENT 'The last runtime for discovery',
  `last_started` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the discovery last started',
  `last_status` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'The last exit message if any',
  `rerun_data_queries` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Rerun data queries or not for existing hosts',
  PRIMARY KEY (`id`),
  KEY `poller_id` (`poller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Stores scanning subnet definitions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automation_networks`
--

LOCK TABLES `automation_networks` WRITE;
/*!40000 ALTER TABLE `automation_networks` DISABLE KEYS */;
INSERT INTO `automation_networks` VALUES (1,1,0,'Test Network','192.168.1.0/24','','','','','','',1,'on','on','',254,0,0,1,22,400,1,2,10,1200,'0000-00-00 00:00:00','2020-03-09 08:00:00',2,'4','','','','',55.837121963501,'2020-03-08 00:21:09','','on');
/*!40000 ALTER TABLE `automation_networks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automation_processes`
--

DROP TABLE IF EXISTS `automation_processes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automation_processes` (
  `pid` int(8) unsigned NOT NULL,
  `poller_id` int(10) unsigned DEFAULT 1,
  `network_id` int(10) unsigned NOT NULL DEFAULT 0,
  `task` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `command` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `up_hosts` int(10) unsigned DEFAULT 0,
  `snmp_hosts` int(10) unsigned DEFAULT 0,
  `heartbeat` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`pid`,`network_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Table tracking active poller processes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automation_processes`
--

LOCK TABLES `automation_processes` WRITE;
/*!40000 ALTER TABLE `automation_processes` DISABLE KEYS */;
/*!40000 ALTER TABLE `automation_processes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automation_snmp`
--

DROP TABLE IF EXISTS `automation_snmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automation_snmp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Group of SNMP Option Sets';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automation_snmp`
--

LOCK TABLES `automation_snmp` WRITE;
/*!40000 ALTER TABLE `automation_snmp` DISABLE KEYS */;
INSERT INTO `automation_snmp` VALUES (1,'Default Option Set');
/*!40000 ALTER TABLE `automation_snmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automation_snmp_items`
--

DROP TABLE IF EXISTS `automation_snmp_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automation_snmp_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `snmp_id` int(10) unsigned NOT NULL DEFAULT 0,
  `sequence` int(10) unsigned NOT NULL DEFAULT 0,
  `snmp_version` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `snmp_community` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `snmp_port` mediumint(5) unsigned NOT NULL DEFAULT 161,
  `snmp_timeout` int(10) unsigned NOT NULL DEFAULT 500,
  `snmp_retries` tinyint(11) unsigned NOT NULL DEFAULT 3,
  `max_oids` int(12) unsigned DEFAULT 10,
  `snmp_username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `snmp_password` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `snmp_auth_protocol` char(6) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `snmp_priv_passphrase` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `snmp_priv_protocol` char(6) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `snmp_context` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `snmp_engine_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`,`snmp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Set of SNMP Options';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automation_snmp_items`
--

LOCK TABLES `automation_snmp_items` WRITE;
/*!40000 ALTER TABLE `automation_snmp_items` DISABLE KEYS */;
INSERT INTO `automation_snmp_items` VALUES (1,1,1,2,'public',161,1000,3,10,'admin','baseball','MD5','','DES','',''),(2,1,2,2,'private',161,1000,3,10,'admin','baseball','MD5','','DES','','');
/*!40000 ALTER TABLE `automation_snmp_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automation_templates`
--

DROP TABLE IF EXISTS `automation_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automation_templates` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `host_template` int(8) NOT NULL DEFAULT 0,
  `availability_method` int(10) unsigned DEFAULT 2,
  `sysDescr` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `sysName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `sysOid` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `sequence` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Templates of SNMP Sys variables used for automation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automation_templates`
--

LOCK TABLES `automation_templates` WRITE;
/*!40000 ALTER TABLE `automation_templates` DISABLE KEYS */;
INSERT INTO `automation_templates` VALUES (1,5,2,'Linux','','',1),(2,6,2,'Windows','','',2),(3,2,2,'(Cisco Internetwork Operating System Software|IOS)','','',3);
/*!40000 ALTER TABLE `automation_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automation_tree_rule_items`
--

DROP TABLE IF EXISTS `automation_tree_rule_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automation_tree_rule_items` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `rule_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `sequence` smallint(3) unsigned NOT NULL DEFAULT 0,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sort_type` smallint(3) unsigned NOT NULL DEFAULT 0,
  `propagate_changes` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `search_pattern` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `replace_pattern` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Automation Tree Rule Items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automation_tree_rule_items`
--

LOCK TABLES `automation_tree_rule_items` WRITE;
/*!40000 ALTER TABLE `automation_tree_rule_items` DISABLE KEYS */;
INSERT INTO `automation_tree_rule_items` VALUES (1,1,1,'ht.name',1,'','^(.*)\\s*Linux\\s*(.*)$','${1}\\n${2}'),(2,1,2,'h.hostname',1,'','^(\\w*)\\s*(\\w*)\\s*(\\w*).*$',''),(3,2,1,'0',2,'on','Traffic',''),(4,2,2,'gtg.title_cache',1,'','^(.*)\\s*-\\s*Traffic -\\s*(.*)$','${1}\\n${2}');
/*!40000 ALTER TABLE `automation_tree_rule_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automation_tree_rules`
--

DROP TABLE IF EXISTS `automation_tree_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automation_tree_rules` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tree_id` smallint(3) unsigned NOT NULL DEFAULT 0,
  `tree_item_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `leaf_type` smallint(3) unsigned NOT NULL DEFAULT 0,
  `host_grouping_type` smallint(3) unsigned NOT NULL DEFAULT 0,
  `enabled` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `name` (`name`(171))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Automation Tree Rules';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automation_tree_rules`
--

LOCK TABLES `automation_tree_rules` WRITE;
/*!40000 ALTER TABLE `automation_tree_rules` DISABLE KEYS */;
INSERT INTO `automation_tree_rules` VALUES (1,'New Device',1,0,3,1,'on'),(2,'New Graph',1,0,2,1,'');
/*!40000 ALTER TABLE `automation_tree_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdef`
--

DROP TABLE IF EXISTS `cdef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdef` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `system` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `hash` (`hash`),
  KEY `name` (`name`(171))
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdef`
--

LOCK TABLES `cdef` WRITE;
/*!40000 ALTER TABLE `cdef` DISABLE KEYS */;
INSERT INTO `cdef` VALUES (2,'73f95f8b77b5508157d64047342c421e',0,'Turn Bytes into Bits'),(3,'3d352eed9fa8f7b2791205b3273708c7',0,'Make Stack Negative'),(4,'e961cc8ec04fda6ed4981cf5ad501aa5',0,'Make Per 5 Minutes'),(12,'f1ac79f05f255c02f914c920f1038c54',0,'Total All Data Sources'),(14,'634a23af5e78af0964e8d33b1a4ed26b',0,'Multiply by 1024'),(15,'068984b5ccdfd2048869efae5166f722',0,'Total All Data Sources, Multiply by 1024'),(16,'f0995854fa3f78e0b5ec3e42b468d857',0,'Round Up Number'),(17,'e467c2a53cd92031c422b0703329b59a',0,'Turn Uptime to Days'),(18,'2edaef75ae74a4919e6774fdcc51231d',0,'Net-SNMP - IO Wait'),(19,'551f401b7345d62439832e7e7c722d53',0,'Convert Data Source to Data Rate'),(20,'68ccb6dfc67d4539d95b20128ba5951a',0,'Ticks to Days'),(21,'9ceef9b3d60f59ec7f9861ef37615f7f',0,'Bytes/Bits Draw Negative'),(22,'2581730093ffaf41b2ddfb6a41cc78ba',0,'Unknown-Data'),(23,'622417dbf41f5bfbf878519dce8701cc',0,'Turn Bytes into bits, make negative'),(24,'a42185bd8b64e1b0d0a76d7e156ccfb8',0,'Turn Bytes into Bits Negative'),(25,'332c2d503d77d896a44a3173db18a0e0',0,'Advanced Ping - Loss 51 - 95 % top'),(26,'5427bff830a580d682e9cd4a929f2d9e',0,'Advanced Ping - Loss 06 - 10 % top'),(27,'df23ce552c69978b6ceed566c9dafb84',0,'Advanced Ping - Loss 11 - 15 % top'),(28,'3da41cbd39894c4af01c012bc5363276',0,'Advanced Ping - Loss 16 - 50 % top'),(29,'aa95e3ca5c6acadade668c092676a58e',0,'Advanced Ping - Loss 96 - 100 % top'),(30,'4ff1ed4bd47cec34bdaffef0a88e1223',0,'Advanced Ping - Position 1,2'),(31,'f47dc26902e7c585f5c900e6a313c3f0',0,'Advanced Ping - Position 3,4,5'),(32,'3bc3669fce1eb66075def0d46e048908',0,'Advanced Ping - Loss 11 - 15 % bottom'),(33,'e9ef3a38296e805e1e7a1b27c5e74cb8',0,'Advanced Ping - Loss 06 - 10 % bottom'),(34,'d05d9ef32572922e6c2e09fc8e083e03',0,'Advanced Ping - Loss 16 - 50 % bottom'),(35,'5be820394a7ef14b50b8bdae9c201977',0,'Advanced Ping - Loss 51 - 95 % bottom'),(36,'8eeeaf982528e5363ea5218e1f4bbd2b',0,'Advanced Ping - Loss 96 - 100 % bottom'),(37,'33a135c70c2e2357e97c0b379ba50668',0,'Advanced Ping - Loss 01 - 02 % bottom'),(38,'4d4ebb1184b3120f6d5990e4c64036a5',0,'Advanced Ping - Loss 01 - 02 % top'),(39,'0fd7cc72c40fb4a211e5f365b9718c1b',0,'Advanced Ping - Loss 03 - 05 % bottom'),(40,'0220a0bd96748360287393c87ce7055b',0,'Advanced Ping - Loss 03 - 05 % top'),(41,'3c976751394a4dc370c974870f56805e',0,'Advanced Ping - Stack Min - 20 %'),(42,'89535ed794980fb34be406fe34404108',0,'Advanced Ping - Loss UNKNOWN / DEAD'),(43,'6fb268b43eae3575a819f7a609b9cd85',0,'Advanced Ping - Loss 03 - 05 % - Line'),(44,'40c644befeaf39ccbcf826faa9af0e8c',0,'Advanced Ping - Loss 01 - 02 % - Line'),(45,'2a0fc32a8363608fe0af04a35c0996d6',0,'Advanced Ping - Loss 06 - 10 % - Line'),(46,'6b216e2a6895ffe0244bfeb5cbb33e57',0,'Advanced Ping - Loss 11 - 15 % - Line'),(47,'d79dafe1e1d6212eea588f7a96cff572',0,'Advanced Ping - Loss 16 - 50 % - Line'),(48,'3792375be891c76b3a805035061a4923',0,'Advanced Ping - Loss 51 - 95 % - Line'),(49,'27a77d6ee4ab83b4001fca43f6c3e64d',0,'Advanced Ping - Loss 96 - 100 % - Line'),(50,'96721309cc0b7bf72ce46cd9908c03cb',0,'Advanced Ping - Loss 0 % - Line'),(51,'8d444a42c956e50f7502e2d7789bcab0',0,'% Idle Time'),(52,'12632b26b4b8e66a6bff5d8684bcaab5',0,'Divide by 1024'),(53,'a0a68ac5d46fc6faa2a64517b232603f',0,'Divide by 1024, Divide by 1024'),(54,'8abeb3e0b2896ff18355f924ad25619f',0,'multiply by 1024, multiply by 1024');
/*!40000 ALTER TABLE `cdef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cdef_items`
--

DROP TABLE IF EXISTS `cdef_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cdef_items` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cdef_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `sequence` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `type` tinyint(2) NOT NULL DEFAULT 0,
  `value` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cdef_id_sequence` (`cdef_id`,`sequence`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cdef_items`
--

LOCK TABLES `cdef_items` WRITE;
/*!40000 ALTER TABLE `cdef_items` DISABLE KEYS */;
INSERT INTO `cdef_items` VALUES (7,'9bbf6b792507bb9bb17d2af0970f9be9',2,1,4,'CURRENT_DATA_SOURCE'),(8,'caa4e023ac2d7b1c4b4c8c4adfd55dfe',2,3,2,'3'),(9,'a4b8eb2c3bf4920a3ef571a7a004be53',2,2,6,'8'),(10,'c888c9fe6b62c26c4bfe23e18991731d',3,1,4,'CURRENT_DATA_SOURCE'),(11,'1e1d0b29a94e08b648c8f053715442a0',3,3,2,'3'),(12,'4355c197998c7f8b285be7821ddc6da4',3,2,6,'-1'),(13,'40bb7a1143b0f2e2efca14eb356236de',4,1,4,'CURRENT_DATA_SOURCE'),(14,'42686ea0925c0220924b7d333599cd67',4,3,2,'3'),(15,'faf1b148b2c0e0527362ed5b8ca1d351',4,2,6,'300'),(16,'0ef6b8a42dc83b4e43e437960fccd2ea',12,1,4,'ALL_DATA_SOURCES_NODUPS'),(18,'86370cfa0008fe8c56b28be80ee39a40',14,1,4,'CURRENT_DATA_SOURCE'),(19,'9a35cc60d47691af37f6fddf02064e20',14,2,6,'1024'),(20,'5d7a7941ec0440b257e5598a27dd1688',14,3,2,'3'),(21,'44fd595c60539ff0f5817731d9f43a85',15,1,4,'ALL_DATA_SOURCES_NODUPS'),(22,'aa38be265e5ac31783e57ce6f9314e9a',15,2,6,'1024'),(23,'204423d4b2598f1f7252eea19458345c',15,3,2,'3'),(24,'f8be084bb9912c335248a7624b1791a7',16,1,4,'CURRENT_DATA_SOURCE'),(25,'fb418923ccd3854f97245b692f86d2c0',16,2,1,'6'),(26,'c658f6a764966a4bcfbb4b0ef3deba37',17,1,4,'CURRENT_DATA_SOURCE'),(27,'f540004e39b64358d09d333535f2f497',17,2,6,'8640000'),(28,'a413e8cd783534eb54756ecec2029338',17,3,2,'4'),(29,'a96e5ae6dcdf2ca5ef1e2f9706b62ff0',18,1,6,'100'),(30,'ae2da3b8309debcc90d58fd3a7652315',18,2,4,'ALL_DATA_SOURCES_NODUPS'),(31,'56c946373bc51a86c631660a68aa7361',18,3,2,'2'),(32,'769be0527605b501381a54272d1da3e9',19,1,4,'CURRENT_DATA_SOURCE'),(33,'83663603689f36b7ba80f63e6f26f64d',19,2,4,'CURRENT_DATA_SOURCE_PI'),(34,'dfbec091d7792d2409e9310e58c7055c',19,3,2,'4'),(35,'d817245c6d8d22b4be4602a9252a8928',20,1,4,'CURRENT_DATA_SOURCE'),(36,'fb72017604454eb5401dabee26b13b91',20,2,6,'8640000'),(37,'3f0a56422f5ed9940ea0c1201fdd5d56',20,3,2,'4'),(38,'384e771ab591f0d27e9d05287a8414e9',21,1,4,'CURRENT_DATA_SOURCE'),(39,'15af8abf829c79fa76ab6abd04ceea52',21,5,6,'-8'),(40,'74a987e2cb0ba7ff33964bfe7beae0c5',21,6,2,'3'),(41,'a8535e9619999f880edace17f64382f7',22,1,4,'CURRENT_DATA_SOURCE'),(42,'1fb7891c37fc8e1fc6ddce5dd98110af',22,2,1,'19'),(43,'06b6bc4cf2c79ea5293fa2f4edd05269',22,3,1,'22'),(44,'2d11fa18e056213376755b8741a9563e',22,4,1,'20'),(45,'12b6c95dee0c6185bb4764765aa8d949',22,5,1,'12'),(46,'f16eb500862a94a07bc09ee294139ad3',23,1,4,'CURRENT_DATA_SOURCE'),(47,'7152f956d753026c7eb63599961a23e8',23,2,6,'8'),(48,'7f96b417da62449d7b4f2cb98572a569',23,3,2,'3'),(49,'b24b2f73beece6974b36cd766a140a02',23,4,6,'-1'),(50,'ebe6eadcd524576f000f49fd692395c0',23,5,2,'3'),(51,'774a2fec4ad9ecca6f3002f47fb7b059',24,1,4,'CURRENT_DATA_SOURCE'),(52,'eade1116650bed434b51708e0cf7408c',24,2,6,'8'),(53,'6049ae4730e81041f6190348dee9175a',24,3,2,'3'),(54,'e8a5514dd749f6b49d4790908910a4fa',24,4,6,'-1'),(55,'671bff5fc3b6621e8f8d23b620d917a4',24,5,2,'3'),(56,'a3c04122ac3c022ad9a764585122729f',25,1,6,'d,50.5,GT,d,95.5,GT,UNKN,INF,IF,UNKN,IF'),(57,'8268d0886cc35b475d537d0c9ab73d7c',26,1,6,'d,5.5,GT,d,10.5,GT,UNKN,INF,IF,UNKN,IF'),(58,'581c14facfd5990ea49bd7636fd4a0b6',27,1,6,'d,10.5,GT,d,15.5,GT,UNKN,INF,IF,UNKN,IF'),(59,'19a5f3ab89230d5922543240f39a80f8',28,1,6,'d,15.5,GT,d,50.5,GT,UNKN,INF,IF,UNKN,IF'),(60,'d201c98ac47e2430b3246d8a0ab3a4d5',29,1,6,'d,95.5,GT,d,100,GT,UNKN,INF,IF,UNKN,IF'),(61,'953c9bfd8a376fb1463133a1d27d22bb',30,1,6,'e,2,/'),(62,'28c269f07a9ec5a59574e016cc18190b',31,1,6,'c,b,-,e,-,3,/'),(63,'4bb64e0f549f0be7ac741bbf10dab96e',32,1,6,'d,10.5,GT,d,15.5,GT,UNKN,a,IF,UNKN,IF'),(64,'b6ff6dfcf1f71e4dbdc2e48213d533d6',33,1,6,'d,5.5,GT,d,10.5,GT,UNKN,a,IF,UNKN,IF'),(65,'ce4063cfe43f51564c17555fbe8ec5e4',34,1,6,'d,15.5,GT,d,50.5,GT,UNKN,a,IF,UNKN,IF'),(66,'5c200e27825874f9e3cb63623c15ad7b',35,1,6,'d,50.5,GT,d,95.5,GT,UNKN,a,IF,UNKN,IF'),(67,'23c77200f4c454de1c81a96e04c7bf34',36,1,6,'d,95.5,GT,d,100,GT,UNKN,a,IF,UNKN,IF'),(68,'9d2d5569146680568428fd08ac3730d8',37,1,6,'d,1,GT,d,2.5,GT,UNKN,a,IF,UNKN,IF'),(69,'1f7469c57d65a556bdf4aef89e220397',38,1,6,'d,1,GT,d,2.5,GT,UNKN,INF,IF,UNKN,IF'),(70,'5f015e8b351c4dab3217ce8f87ae7637',39,1,6,'d,2.5,GT,d,5.5,GT,UNKN,a,IF,UNKN,IF'),(71,'f37239c7b47da12f6125e4eec4bd9b81',40,1,6,'d,2.5,GT,d,5.5,GT,UNKN,INF,IF,UNKN,IF'),(72,'3be90d72c8b4cf4216c356d225c30d30',41,1,6,'b,a,-,0.2,*'),(73,'c2f4d540c9bdd2d2c44f1cb44321e071',42,1,6,'d,UN,1,EQ,TIME,300,+,NOW,GT,UNKN,INF,IF,d,100,GT,INF,UNKN,IF,IF'),(74,'187d4aa40a8956f68747edfeef249548',43,1,6,'d,2.5,GT,d,5.5,GT,UNKN,b,IF,UNKN,IF'),(75,'8f0a8a4fd7c8d27c075766426ac150af',44,1,6,'d,1,GT,d,2.5,GT,UNKN,b,IF,UNKN,IF'),(76,'2bd81f0c328d8f926a7514da388a7545',45,1,6,'d,5.5,GT,d,10.5,GT,UNKN,b,IF,UNKN,IF'),(77,'ded9d22f5244a0ae0f126185f0aa3fc0',46,1,6,'d,10.5,GT,d,15.5,GT,UNKN,b,IF,UNKN,IF'),(78,'ec7989fa2df2127de00c50e54ced80e9',47,1,6,'d,15.5,GT,d,50.5,GT,UNKN,b,IF,UNKN,IF'),(79,'1e4db0e2b7393ad90f0fa74e86524a32',48,1,6,'d,50.5,GT,d,95.5,GT,UNKN,b,IF,UNKN,IF'),(80,'75fb54111b1ad9a04d87545c0bed599f',49,1,6,'d,95.5,GT,d,100,GT,UNKN,b,IF,UNKN,IF'),(81,'0b9b7191c14819257e050fa0f704631e',50,1,6,'d,-1,GT,d,1,GT,UNKN,b,IF,UNKN,IF'),(82,'dbe3ca2d571c5c18ffc703bc1bf8800a',51,1,4,'CURRENT_DATA_SOURCE'),(83,'d2b8303b4644ba526234576e4176f25c',51,2,6,'100'),(84,'3b48fb3edf4724d95c68f480839f4c98',51,3,2,'2'),(85,'990b3540dcd28d9ada9d485e78314cc4',51,4,6,'-1'),(86,'faf9e9bb7c365243c0bd0e218e71a8ba',51,5,2,'3'),(87,'b0f4343a93cb156f2e87192d08fff881',52,1,4,'CURRENT_DATA_SOURCE'),(88,'cd72a0e3db80579b2b01715a55985c6e',52,2,6,'1024'),(89,'562a2363b91dad51286fb6e24e0a65b8',52,3,2,'4'),(90,'335990ead4e67c01d95e450cc1f0f87e',53,2,4,'CURRENT_DATA_SOURCE'),(91,'d921a289eac5edc9612f0ae1db309ac5',53,5,6,'1024'),(92,'34a05179a15b6355f5fb5763105d4106',53,6,2,'4'),(93,'244f1442ccda0519b808a61d50f5322c',53,7,6,'1024'),(94,'6483b1307f98c98fd4199c42b4a0b3ed',53,8,2,'4'),(95,'c47aff04bd9775edaeb293eedf7877bd',54,1,4,'CURRENT_DATA_SOURCE'),(96,'7a65d068f15d779ba32728dba4d9e63b',54,2,6,'1024'),(97,'752c66095a8397f86f5a22faf4fe03ca',54,3,2,'3'),(98,'f1fd0a656c42174f0dc9c0d34226af83',54,4,6,'1024'),(99,'000b2f8e346ae1ca19dc743edfd88de2',54,5,2,'3');
/*!40000 ALTER TABLE `cdef_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color_template_items`
--

DROP TABLE IF EXISTS `color_template_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `color_template_items` (
  `color_template_item_id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `color_template_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `color_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `sequence` mediumint(8) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`color_template_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Color Items for Color Templates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color_template_items`
--

LOCK TABLES `color_template_items` WRITE;
/*!40000 ALTER TABLE `color_template_items` DISABLE KEYS */;
INSERT INTO `color_template_items` VALUES (1,1,4,1),(2,1,24,2),(3,1,98,3),(4,1,25,4),(5,2,25,1),(6,2,29,2),(7,2,30,3),(8,2,31,4),(9,2,33,5),(10,2,35,6),(11,2,41,7),(12,2,9,8),(13,3,15,1),(14,3,31,2),(15,3,28,3),(16,3,8,4),(17,3,34,5),(18,3,33,6),(19,3,35,7),(20,3,41,8),(21,3,36,9),(22,3,42,10),(23,3,44,11),(24,3,48,12),(25,3,9,13),(26,3,49,14),(27,3,51,15),(28,3,52,16),(29,4,76,1),(30,4,84,2),(31,4,89,3),(32,4,17,4),(33,4,86,5),(34,4,88,6),(35,4,90,7),(36,4,94,8),(37,4,96,9),(38,4,93,10),(39,4,91,11),(40,4,22,12),(41,4,12,13),(42,4,95,14),(43,4,6,15),(44,4,92,16);
/*!40000 ALTER TABLE `color_template_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color_templates`
--

DROP TABLE IF EXISTS `color_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `color_templates` (
  `color_template_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`color_template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Color Templates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color_templates`
--

LOCK TABLES `color_templates` WRITE;
/*!40000 ALTER TABLE `color_templates` DISABLE KEYS */;
INSERT INTO `color_templates` VALUES (1,'Yellow: light -> dark, 4 colors'),(2,'Red: light yellow > dark red, 8 colors'),(3,'Red: light -> dark, 16 colors'),(4,'Green: dark -> light, 16 colors');
/*!40000 ALTER TABLE `color_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colors` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `hex` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `read_only` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `hex` (`hex`)
) ENGINE=InnoDB AUTO_INCREMENT=446 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colors`
--

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;
INSERT INTO `colors` VALUES (1,'Black','000000','on'),(2,'White','FFFFFF','on'),(4,'','FAFD9E',''),(5,'','C0C0C0',''),(6,'','74C366',''),(7,'','6DC8FE',''),(8,'','EA8F00',''),(9,'Red','FF0000','on'),(10,'','4444FF',''),(11,'Magenta','FF00FF','on'),(12,'Green','00FF00','on'),(13,'','8D85F3',''),(14,'','AD3B6E',''),(15,'','EACC00',''),(16,'','12B3B5',''),(17,'','157419',''),(18,'','C4FD3D',''),(19,'','817C4E',''),(20,'','002A97',''),(21,'','0000FF',''),(22,'','00CF00',''),(24,'','F9FD5F',''),(25,'','FFF200',''),(26,'','CCBB00',''),(27,'','837C04',''),(28,'','EAAF00',''),(29,'','FFD660',''),(30,'','FFC73B',''),(31,'','FFAB00',''),(33,'','FF7D00',''),(34,'','ED7600',''),(35,'','FF5700',''),(36,'','EE5019',''),(37,'','B1441E',''),(38,'','FFC3C0',''),(39,'','FF897C',''),(40,'','FF6044',''),(41,'','FF4105',''),(42,'','DA4725',''),(43,'','942D0C',''),(44,'','FF3932',''),(45,'','862F2F',''),(46,'','FF5576',''),(47,'','562B29',''),(48,'','F51D30',''),(49,'','DE0056',''),(50,'','ED5394',''),(51,'','B90054',''),(52,'','8F005C',''),(53,'','F24AC8',''),(54,'','E8CDEF',''),(55,'','D8ACE0',''),(56,'','A150AA',''),(57,'','750F7D',''),(58,'','8D00BA',''),(59,'','623465',''),(60,'','55009D',''),(61,'','3D168B',''),(62,'','311F4E',''),(63,'','D2D8F9',''),(64,'','9FA4EE',''),(65,'','6557D0',''),(66,'','4123A1',''),(67,'','4668E4',''),(68,'','0D006A',''),(69,'','00004D',''),(70,'','001D61',''),(71,'','00234B',''),(72,'','002A8F',''),(73,'','2175D9',''),(74,'','7CB3F1',''),(75,'','005199',''),(76,'','004359',''),(77,'','00A0C1',''),(78,'','007283',''),(79,'','00BED9',''),(80,'','AFECED',''),(81,'','55D6D3',''),(82,'','00BBB4',''),(83,'','009485',''),(84,'','005D57',''),(85,'','008A77',''),(86,'','008A6D',''),(87,'','00B99B',''),(88,'','009F67',''),(89,'','00694A',''),(90,'','00A348',''),(91,'','00BF47',''),(92,'','96E78A',''),(93,'','00BD27',''),(94,'','35962B',''),(95,'','7EE600',''),(96,'','6EA100',''),(97,'','CAF100',''),(98,'','F5F800',''),(99,'','CDCFC4',''),(100,'','BCBEB3',''),(101,'','AAABA1',''),(102,'','8F9286',''),(103,'','797C6E',''),(104,'','2E3127',''),(105,'Night','0C090A','on'),(106,'Gunmetal','2C3539','on'),(107,'Midnight','2B1B17','on'),(108,'Charcoal','34282C','on'),(109,'Dark Slate Grey','25383C','on'),(110,'Oil','3B3131','on'),(111,'Black Cat','413839','on'),(112,'Iridium','3D3C3A','on'),(113,'Black Eel','463E3F','on'),(114,'Black Cow','4C4646','on'),(115,'Gray Wolf','504A4B','on'),(116,'Vampire Gray','565051','on'),(117,'Gray Dolphin','5C5858','on'),(118,'Carbon Gray','625D5D','on'),(119,'Ash Gray','666362','on'),(120,'Cloudy Gray','6D6968','on'),(121,'Smokey Gray','726E6D','on'),(122,'Gray','736F6E','on'),(123,'Granite','837E7C','on'),(124,'Battleship Gray','848482','on'),(125,'Gray Cloud','B6B6B4','on'),(126,'Gray Goose','D1D0CE','on'),(127,'Platinum','E5E4E2','on'),(128,'Metallic Silver','BCC6CC','on'),(129,'Blue Gray','98AFC7','on'),(130,'Light Slate Gray','6D7B8D','on'),(131,'Slate Gray','657383','on'),(132,'Jet Gray','616D7E','on'),(133,'Mist Blue','646D7E','on'),(134,'Marble Blue','566D7E','on'),(135,'Slate Blue','737CA1','on'),(136,'Steel Blue','4863A0','on'),(137,'Blue Jay','2B547E','on'),(138,'Dark Slate Blue','2B3856','on'),(139,'Midnight Blue','151B54','on'),(140,'Navy Blue','000080','on'),(141,'Blue Whale','342D7E','on'),(142,'Lapis Blue','15317E','on'),(143,'Cornflower Blue','151B8D','on'),(144,'Earth Blue','0000A0','on'),(145,'Cobalt Blue','0020C2','on'),(146,'Blueberry Blue','0041C2','on'),(147,'Sapphire Blue','2554C7','on'),(148,'Blue Eyes','1569C7','on'),(149,'Royal Blue','2B60DE','on'),(150,'Blue Orchid','1F45FC','on'),(151,'Blue Lotus','6960EC','on'),(152,'Light Slate Blue','736AFF','on'),(153,'Slate Blue','357EC7','on'),(154,'Glacial Blue Ice','368BC1','on'),(155,'Silk Blue','488AC7','on'),(156,'Blue Ivy','3090C7','on'),(157,'Blue Koi','659EC7','on'),(158,'Columbia Blue','87AFC7','on'),(159,'Baby Blue','95B9C7','on'),(160,'Light Steel Blue','728FCE','on'),(161,'Ocean Blue','2B65EC','on'),(162,'Blue Ribbon','306EFF','on'),(163,'Blue Dress','157DEC','on'),(164,'Dodger Blue','1589FF','on'),(165,'Cornflower Blue','6495ED','on'),(166,'Sky Blue','6698FF','on'),(167,'Butterfly Blue','38ACEC','on'),(168,'Iceberg','56A5EC','on'),(169,'Crystal Blue','5CB3FF','on'),(170,'Deep Sky Blue','3BB9FF','on'),(171,'Denim Blue','79BAEC','on'),(172,'Light Sky Blue','82CAFA','on'),(173,'Day Sky Blue','82CAFF','on'),(174,'Jeans Blue','A0CFEC','on'),(175,'Blue Angel','B7CEEC','on'),(176,'Pastel Blue','B4CFEC','on'),(177,'Sea Blue','C2DFFF','on'),(178,'Powder Blue','C6DEFF','on'),(179,'Coral Blue','AFDCEC','on'),(180,'Light Blue','ADDFFF','on'),(181,'Robin Egg Blue','BDEDFF','on'),(182,'Pale Blue Lily','CFECEC','on'),(183,'Light Cyan','E0FFFF','on'),(184,'Water','EBF4FA','on'),(185,'Alice Blue','F0F8FF','on'),(186,'Azure','F0FFFF','on'),(187,'Light Slate','CCFFFF','on'),(188,'Light Aquamarine','93FFE8','on'),(189,'Electric Blue','9AFEFF','on'),(190,'Aquamarine','7FFFD4','on'),(191,'Cyan or Aqua','00FFFF','on'),(192,'Tron Blue','7DFDFE','on'),(193,'Blue Zircon','57FEFF','on'),(194,'Blue Lagoon','8EEBEC','on'),(195,'Celeste','50EBEC','on'),(196,'Blue Diamond','4EE2EC','on'),(197,'Tiffany Blue','81D8D0','on'),(198,'Cyan Opaque','92C7C7','on'),(199,'Blue Hosta','77BFC7','on'),(200,'Northern Lights Blue','78C7C7','on'),(201,'Medium Turquoise','48CCCD','on'),(202,'Turquoise','43C6DB','on'),(203,'Jellyfish','46C7C7','on'),(204,'Macaw Blue Green','43BFC7','on'),(205,'Light Sea Green','3EA99F','on'),(206,'Dark Turquoise','3B9C9C','on'),(207,'Sea Turtle Green','438D80','on'),(208,'Medium Aquamarine','348781','on'),(209,'Greenish Blue','307D7E','on'),(210,'Grayish Turquoise','5E7D7E','on'),(211,'Beetle Green','4C787E','on'),(212,'Teal','008080','on'),(213,'Sea Green','4E8975','on'),(214,'Camouflage Green','78866B','on'),(215,'Sage Green','848b79','on'),(216,'Hazel Green','617C58','on'),(217,'Venom Green','728C00','on'),(218,'Fern Green','667C26','on'),(219,'Dark Forrest Green','254117','on'),(220,'Medium Sea Green','306754','on'),(221,'Medium Forest Green','347235','on'),(222,'Seaweed Green','437C17','on'),(223,'Pine Green','387C44','on'),(224,'Jungle Green','347C2C','on'),(225,'Shamrock Green','347C17','on'),(226,'Medium Spring Green','348017','on'),(227,'Forest Green','4E9258','on'),(228,'Green Onion','6AA121','on'),(229,'Spring Green','4AA02C','on'),(230,'Lime Green','41A317','on'),(231,'Clover Green','3EA055','on'),(232,'Green Snake','6CBB3C','on'),(233,'Alien Green','6CC417','on'),(234,'Green Apple','4CC417','on'),(235,'Yellow Green','52D017','on'),(236,'Kelly Green','4CC552','on'),(237,'Zombie Green','54C571','on'),(238,'Frog Green','99C68E','on'),(239,'Green Peas','89C35C','on'),(240,'Dollar Bill Green','85BB65','on'),(241,'Dark Sea Green','8BB381','on'),(242,'Iguana Green','9CB071','on'),(243,'Avocado Green','B2C248','on'),(244,'Pistachio Green','9DC209','on'),(245,'Salad Green','A1C935','on'),(246,'Hummingbird Green','7FE817','on'),(247,'Nebula Green','59E817','on'),(248,'Stoplight Go Green','57E964','on'),(249,'Algae Green','64E986','on'),(250,'Jade Green','5EFB6E','on'),(251,'Emerald Green','5FFB17','on'),(252,'Lawn Green','87F717','on'),(253,'Chartreuse','8AFB17','on'),(254,'Dragon Green','6AFB92','on'),(255,'Mint green','98FF98','on'),(256,'Green Thumb','B5EAAA','on'),(257,'Light Jade','C3FDB8','on'),(258,'Tea Green','CCFB5D','on'),(259,'Green Yellow','B1FB17','on'),(260,'Slime Green','BCE954','on'),(261,'Goldenrod','EDDA74','on'),(262,'Harvest Gold','EDE275','on'),(263,'Sun Yellow','FFE87C','on'),(264,'Yellow','FFFF00','on'),(265,'Corn Yellow','FFF380','on'),(266,'Parchment','FFFFC2','on'),(267,'Cream','FFFFCC','on'),(268,'Lemon Chiffon','FFF8C6','on'),(269,'Cornsilk','FFF8DC','on'),(270,'Beige','F5F5DC','on'),(271,'Blonde','FBF6D9','on'),(272,'Antique White','FAEBD7','on'),(273,'Champagne','F7E7CE','on'),(274,'Blanched Almond','FFEBCD','on'),(275,'Vanilla','F3E5AB','on'),(276,'Tan Brown','ECE5B6','on'),(277,'Peach','FFE5B4','on'),(278,'Mustard','FFDB58','on'),(279,'Rubber Ducky Yellow','FFD801','on'),(280,'Bright Gold','FDD017','on'),(281,'Golden Brown','EAC117','on'),(282,'Macaroni and Cheese','F2BB66','on'),(283,'Saffron','FBB917','on'),(284,'Beer','FBB117','on'),(285,'Cantaloupe','FFA62F','on'),(286,'Bee Yellow','E9AB17','on'),(287,'Brown Sugar','E2A76F','on'),(288,'BurlyWood','DEB887','on'),(289,'Deep Peach','FFCBA4','on'),(290,'Ginger Brown','C9BE62','on'),(291,'School Bus Yellow','E8A317','on'),(292,'Sandy Brown','EE9A4D','on'),(293,'Fall Leaf Brown','C8B560','on'),(294,'Orange Gold','D4A017','on'),(295,'Sand','C2B280','on'),(296,'Cookie Brown','C7A317','on'),(297,'Caramel','C68E17','on'),(298,'Brass','B5A642','on'),(299,'Khaki','ADA96E','on'),(300,'Camel Brown','C19A6B','on'),(301,'Bronze','CD7F32','on'),(302,'Tiger Orange','C88141','on'),(303,'Cinnamon','C58917','on'),(304,'Bullet Shell','AF9B60','on'),(305,'Dark Goldenrod','AF7817','on'),(306,'Copper','B87333','on'),(307,'Wood','966F33','on'),(308,'Oak Brown','806517','on'),(309,'Moccasin','827839','on'),(310,'Army Brown','827B60','on'),(311,'Sandstone','786D5F','on'),(312,'Mocha','493D26','on'),(313,'Taupe','483C32','on'),(314,'Coffee','6F4E37','on'),(315,'Brown Bear','835C3B','on'),(316,'Red Dirt','7F5217','on'),(317,'Sepia','7F462C','on'),(318,'Orange Salmon','C47451','on'),(319,'Rust','C36241','on'),(320,'Red Fox','C35817','on'),(321,'Chocolate','C85A17','on'),(322,'Sedona','CC6600','on'),(323,'Papaya Orange','E56717','on'),(324,'Halloween Orange','E66C2C','on'),(325,'Pumpkin Orange','F87217','on'),(326,'Construction Cone Orange','F87431','on'),(327,'Sunrise Orange','E67451','on'),(328,'Mango Orange','FF8040','on'),(329,'Dark Orange','F88017','on'),(330,'Coral','FF7F50','on'),(331,'Basket Ball Orange','F88158','on'),(332,'Light Salmon','F9966B','on'),(333,'Tangerine','E78A61','on'),(334,'Dark Salmon','E18B6B','on'),(335,'Light Coral','E77471','on'),(336,'Bean Red','F75D59','on'),(337,'Valentine Red','E55451','on'),(338,'Shocking Orange','E55B3C','on'),(339,'Scarlet','FF2400','on'),(340,'Ruby Red','F62217','on'),(341,'Ferrari Red','F70D1A','on'),(342,'Fire Engine Red','F62817','on'),(343,'Lava Red','E42217','on'),(344,'Love Red','E41B17','on'),(345,'Grapefruit','DC381F','on'),(346,'Chestnut Red','C34A2C','on'),(347,'Cherry Red','C24641','on'),(348,'Mahogany','C04000','on'),(349,'Chilli Pepper','C11B17','on'),(350,'Cranberry','9F000F','on'),(351,'Red Wine','990012','on'),(352,'Burgundy','8C001A','on'),(353,'Chestnut','954535','on'),(354,'Blood Red','7E3517','on'),(355,'Sienna','8A4117','on'),(356,'Sangria','7E3817','on'),(357,'Firebrick','800517','on'),(358,'Maroon','810541','on'),(359,'Plum Pie','7D0541','on'),(360,'Velvet Maroon','7E354D','on'),(361,'Plum Velvet','7D0552','on'),(362,'Rosy Finch','7F4E52','on'),(363,'Puce','7F5A58','on'),(364,'Dull Purple','7F525D','on'),(365,'Rosy Brown','B38481','on'),(366,'Khaki Rose','C5908E','on'),(367,'Pink Bow','C48189','on'),(368,'Lipstick Pink','C48793','on'),(369,'Rose','E8ADAA','on'),(370,'Desert Sand','EDC9AF','on'),(371,'Pig Pink','FDD7E4','on'),(372,'Cotton Candy','FCDFFF','on'),(373,'Pink Bubblegum','FFDFDD','on'),(374,'Misty Rose','FBBBB9','on'),(375,'Pink','FAAFBE','on'),(376,'Light Pink','FAAFBA','on'),(377,'Flamingo Pink','F9A7B0','on'),(378,'Pink Rose','E7A1B0','on'),(379,'Pink Daisy','E799A3','on'),(380,'Cadillac Pink','E38AAE','on'),(381,'Carnation Pink','F778A1','on'),(382,'Blush Red','E56E94','on'),(383,'Hot Pink','F660AB','on'),(384,'Watermelon Pink','FC6C85','on'),(385,'Violet Red','F6358A','on'),(386,'Deep Pink','F52887','on'),(387,'Pink Cupcake','E45E9D','on'),(388,'Pink Lemonade','E4287C','on'),(389,'Neon Pink','F535AA','on'),(390,'Dimorphotheca Magenta','E3319D','on'),(391,'Bright Neon Pink','F433FF','on'),(392,'Pale Violet Red','D16587','on'),(393,'Tulip Pink','C25A7C','on'),(394,'Medium Violet Red','CA226B','on'),(395,'Rogue Pink','C12869','on'),(396,'Burnt Pink','C12267','on'),(397,'Bashful Pink','C25283','on'),(398,'Carnation Pink','C12283','on'),(399,'Plum','B93B8F','on'),(400,'Viola Purple','7E587E','on'),(401,'Purple Iris','571B7E','on'),(402,'Plum Purple','583759','on'),(403,'Indigo','4B0082','on'),(404,'Purple Monster','461B7E','on'),(405,'Purple Haze','4E387E','on'),(406,'Eggplant','614051','on'),(407,'Grape','5E5A80','on'),(408,'Purple Jam','6A287E','on'),(409,'Dark Orchid','7D1B7E','on'),(410,'Purple Flower','A74AC7','on'),(411,'Medium Orchid','B048B5','on'),(412,'Purple Amethyst','6C2DC7','on'),(413,'Dark Violet','842DCE','on'),(414,'Violet','8D38C9','on'),(415,'Purple Sage Bush','7A5DC7','on'),(416,'Lovely Purple','7F38EC','on'),(417,'Purple','8E35EF','on'),(418,'Aztech Purple','893BFF','on'),(419,'Medium Purple','8467D7','on'),(420,'Jasmine Purple','A23BEC','on'),(421,'Purple Daffodil','B041FF','on'),(422,'Tyrian Purple','C45AEC','on'),(423,'Crocus Purple','9172EC','on'),(424,'Purple Mimosa','9E7BFF','on'),(425,'Heliotrope Purple','D462FF','on'),(426,'Crimson','E238EC','on'),(427,'Purple Dragon','C38EC7','on'),(428,'Lilac','C8A2C8','on'),(429,'Blush Pink','E6A9EC','on'),(430,'Mauve','E0B0FF','on'),(431,'Wisteria Purple','C6AEC7','on'),(432,'Blossom Pink','F9B7FF','on'),(433,'Thistle','D2B9D3','on'),(434,'Periwinkle','E9CFEC','on'),(435,'Lavender Pinocchio','EBDDE2','on'),(436,'Lavender Blue','E3E4FA','on'),(437,'Pearl','FDEEF4','on'),(438,'SeaShell','FFF5EE','on'),(439,'Milk White','FEFCFF','on'),(440,'','0000AA',''),(441,'','333333',''),(442,'','555555',''),(443,'','888888',''),(444,'','AAAAAA',''),(445,'','CCCCCC','');
/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_debug`
--

DROP TABLE IF EXISTS `data_debug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_debug` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `started` int(11) NOT NULL DEFAULT 0,
  `done` int(11) NOT NULL DEFAULT 0,
  `user` int(11) NOT NULL DEFAULT 0,
  `datasource` int(11) NOT NULL DEFAULT 0,
  `info` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `issue` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `done` (`done`),
  KEY `datasource` (`datasource`),
  KEY `started` (`started`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Datasource Debugger Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_debug`
--

LOCK TABLES `data_debug` WRITE;
/*!40000 ALTER TABLE `data_debug` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_debug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_input`
--

DROP TABLE IF EXISTS `data_input`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_input` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `input_string` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_id` tinyint(2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `name_type_id` (`name`(171),`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_input`
--

LOCK TABLES `data_input` WRITE;
/*!40000 ALTER TABLE `data_input` DISABLE KEYS */;
INSERT INTO `data_input` VALUES (1,'3eb92bb845b9660a7445cf9740726522','Get SNMP Data','',2),(2,'bf566c869ac6443b0c75d1c32b5a350e','Get SNMP Data (Indexed)','',3),(3,'274f4685461170b9eb1b98d22567ab5e','Unix - Get Free Disk Space','<path_cacti>/scripts/diskfree.sh <partition>',1),(4,'95ed0993eb3095f9920d431ac80f4231','Unix - Get Load Average','perl <path_cacti>/scripts/loadavg_multi.pl',1),(5,'79a284e136bb6b061c6f96ec219ac448','Unix - Get Logged In Users','perl <path_cacti>/scripts/unix_users.pl <username>',1),(6,'362e6d4768937c4f899dd21b91ef0ff8','Linux - Get Memory Usage','perl <path_cacti>/scripts/linux_memory.pl <grepstr>',1),(7,'a637359e0a4287ba43048a5fdf202066','Unix - Get System Processes','perl <path_cacti>/scripts/unix_processes.pl',1),(8,'47d6bfe8be57a45171afd678920bd399','Unix - Get TCP Connections','perl <path_cacti>/scripts/unix_tcp_connections.pl <grepstr>',1),(9,'cc948e4de13f32b6aea45abaadd287a3','Unix - Get Web Hits','perl <path_cacti>/scripts/webhits.pl <log_path>',1),(10,'8bd153aeb06e3ff89efc73f35849a7a0','Unix - Ping Host','perl <path_cacti>/scripts/ping.pl <hostname>',1),(11,'80e9e4c4191a5da189ae26d0e237f015','Get Script Data (Indexed)','',4),(12,'332111d8b54ac8ce939af87a7eac0c06','Get Script Server Data (Indexed)','',6),(13,'4b7c41aef3c9c7b7cd457c373cfac84d','Local - Cacti Poller - Statistics','<path_cacti>/scripts/ss_poller.php ss_poller',5),(14,'0ae31b2bdee03a22e676c6412b494fde','Local - Cacti Poller - Boost Statistics','<path_cacti>/scripts/ss_poller.php ss_boost',5),(15,'6a40673bc2ac25fa3fd5c94e4c793910','Local - Cacti Poller - Item Statistics','<path_cacti>/scripts/ss_poller.php ss_poller_items',5),(16,'c57ecb685171224fc376a0cbf10d08ff','Local - Cacti Poller - Recache Statistics','<path_cacti>/scripts/ss_poller.php ss_recache',5),(17,'fd8efbd6a865853728f90cf6933764df','Local - Cacti Poller - Boost Memory Statistics','<path_cacti>/scripts/ss_poller.php ss_boost_mem',5),(18,'9c1806942353034cf391635c6620eee7','Local - Cacti - User Statistics','<path_php_binary> -q <path_cacti>/scripts/cacti_user_stats.php',1),(19,'eeebe9434c3d5241a022f0a4806913aa','Local - Cacti Poller - Export Graphs','<path_cacti>/scripts/ss_poller.php ss_export',5),(20,'35b5b9184425856bfea58a564bde6a40','Local - Cacti Poller - Export Duration','<path_cacti>/scripts/ss_poller.php ss_export',5),(21,'1040a9488d2e501c92775988a7764c97','Cacti Stats - Syslog Statistics','<path_cacti>/scripts/ss_poller.php ss_syslog_stats',5),(22,'677d42661935700e4c1f0490cb7f9860','Cacti Stats - Syslog Runtime','<path_cacti>/scripts/ss_poller.php ss_syslog_time',5),(23,'24b7d45245646cf7a55740f401f08035','Cacti Stats - Thold Runtime','<path_cacti>/scripts/ss_poller.php ss_thold_time',5),(24,'ba87a70974427cc0a303e9b34480397b','Cacti Stats - Boost Average Row Size','<path_cacti>/scripts/ss_poller.php ss_boost_avg_size',5),(25,'21db60a71526a131ca6556bedfacdfbf','Cacti Stats - Boost Records','<path_cacti>/scripts/ss_poller.php ss_boost_records',5),(26,'d9d758fdb1aad500fdd66b5b8a0aa636','Cacti Stats - Boost Table Size','<path_cacti>/scripts/ss_poller.php ss_boost_table',5),(27,'57bf4b03ad6d127f048fdc2309cbbd87','Cacti Stats - Boost Timing Detail','<path_cacti>/scripts/ss_poller.php ss_boost_timing',5),(28,'e4a60e4b8da9689294450dd161580dbd','Device - Polling Time','<path_cacti>/scripts/ss_hstats.php ss_hstats <host_id> polling_time',5),(29,'bb8130b897891fbcb8d77fb74cbc1d67','Device - Uptime','<path_cacti>/scripts/ss_hstats.php ss_hstats <host_id> uptime',5),(30,'65b66ec906cd11d474d3588a223ab7b3','Net-SNMP - Combined SCSI Disk I/O','<path_cacti>/scripts/ss_net_snmp_disk_io.php ss_net_snmp_disk_io <hostname>',5),(31,'d58b9cad6311a6b9652d49c0066e0582','Net-SNMP - Combined SCSI Disk Bytes','<path_cacti>/scripts/ss_net_snmp_disk_bytes.php ss_net_snmp_disk_bytes <hostname>',5),(32,'4427395a6ecd5bc2af34a3488ee0221b','Advanced Ping','<path_cacti>/scripts/ss_fping.php ss_fping <hostname> <attempts> <protocol> <port>',5);
/*!40000 ALTER TABLE `data_input` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_input_data`
--

DROP TABLE IF EXISTS `data_input_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_input_data` (
  `data_input_field_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `data_template_data_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `t_value` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`data_input_field_id`,`data_template_data_id`),
  KEY `data_template_data_id` (`data_template_data_id`),
  KEY `t_value` (`t_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_input_data`
--

LOCK TABLES `data_input_data` WRITE;
/*!40000 ALTER TABLE `data_input_data` DISABLE KEYS */;
INSERT INTO `data_input_data` VALUES (1,4,'',''),(1,5,'',''),(1,6,'',''),(1,19,'',''),(1,20,'',''),(1,22,'',''),(1,23,'',''),(1,24,'',''),(1,25,'',''),(1,26,'',''),(1,27,'',''),(1,30,'',''),(1,31,'',''),(1,32,'',''),(1,33,'',''),(1,34,'',''),(1,35,'',''),(1,42,'',''),(1,43,'',''),(1,44,'',''),(1,45,'',''),(1,46,'',''),(1,47,'',''),(1,48,'',''),(1,49,'',''),(1,50,'',''),(1,51,'',''),(1,52,'',''),(1,53,'',''),(1,54,'',''),(1,55,'',''),(1,58,'',''),(1,59,'',''),(1,61,'',''),(1,67,'',''),(1,68,'',''),(1,69,'',''),(1,70,'',''),(1,71,'',''),(1,72,'',''),(1,73,'',''),(1,74,'',''),(1,75,'',''),(1,76,'',''),(1,79,'',''),(1,80,'',''),(1,81,'',''),(1,98,'',''),(1,100,'',''),(1,101,'',''),(1,102,'',''),(1,103,'',''),(2,4,'',''),(2,5,'',''),(2,6,'',''),(2,19,'',''),(2,20,'',''),(2,22,'',''),(2,23,'',''),(2,24,'',''),(2,25,'',''),(2,26,'',''),(2,27,'',''),(2,30,'',''),(2,31,'',''),(2,32,'',''),(2,33,'',''),(2,34,'',''),(2,35,'',''),(2,42,'',''),(2,43,'',''),(2,44,'',''),(2,45,'',''),(2,46,'',''),(2,47,'',''),(2,48,'',''),(2,49,'',''),(2,50,'',''),(2,51,'',''),(2,52,'',''),(2,53,'',''),(2,54,'',''),(2,55,'',''),(2,58,'',''),(2,59,'',''),(2,61,'',''),(2,67,'',''),(2,68,'',''),(2,69,'',''),(2,70,'',''),(2,71,'',''),(2,72,'',''),(2,73,'',''),(2,74,'',''),(2,75,'',''),(2,76,'',''),(2,79,'',''),(2,80,'',''),(2,81,'',''),(2,98,'',''),(2,100,'',''),(2,101,'',''),(2,102,'',''),(2,103,'',''),(3,4,'',''),(3,5,'',''),(3,6,'',''),(3,19,'',''),(3,20,'',''),(3,22,'',''),(3,23,'',''),(3,24,'',''),(3,25,'',''),(3,26,'',''),(3,27,'',''),(3,30,'',''),(3,32,'',''),(3,33,'',''),(3,35,'',''),(3,42,'',''),(3,43,'',''),(3,44,'',''),(3,45,'',''),(3,46,'',''),(3,47,'',''),(3,48,'',''),(3,49,'',''),(3,50,'',''),(3,51,'',''),(3,52,'',''),(3,53,'',''),(3,54,'',''),(3,55,'',''),(3,67,'',''),(3,68,'',''),(3,69,'',''),(3,70,'',''),(3,71,'',''),(3,72,'',''),(3,73,'',''),(3,74,'',''),(3,75,'',''),(3,76,'',''),(3,79,'',''),(3,80,'',''),(3,81,'',''),(3,98,'',''),(3,100,'',''),(3,101,'',''),(3,102,'',''),(3,103,'',''),(4,27,'',''),(4,35,'',''),(4,42,'',''),(4,43,'',''),(4,44,'',''),(4,45,'',''),(4,46,'',''),(4,47,'',''),(4,48,'',''),(4,49,'',''),(4,50,'',''),(4,51,'',''),(4,52,'',''),(4,53,'',''),(4,54,'',''),(4,55,'',''),(4,67,'',''),(4,68,'',''),(4,69,'',''),(4,70,'',''),(4,71,'',''),(4,72,'',''),(4,73,'',''),(4,74,'',''),(4,75,'',''),(4,76,'',''),(4,79,'',''),(4,80,'',''),(4,81,'',''),(5,27,'',''),(5,35,'',''),(5,42,'',''),(5,43,'',''),(5,44,'',''),(5,45,'',''),(5,46,'',''),(5,47,'',''),(5,48,'',''),(5,49,'',''),(5,50,'',''),(5,51,'',''),(5,52,'',''),(5,53,'',''),(5,54,'',''),(5,55,'',''),(5,67,'',''),(5,68,'',''),(5,69,'',''),(5,70,'',''),(5,71,'',''),(5,72,'',''),(5,73,'',''),(5,74,'',''),(5,75,'',''),(5,76,'',''),(5,79,'',''),(5,80,'',''),(5,81,'',''),(6,27,'','.1.3.6.1.4.1.9.2.1.58.0'),(6,35,'on',''),(6,42,'','.1.3.6.1.4.1.2021.10.1.3.1'),(6,43,'','.1.3.6.1.4.1.2021.10.1.3.2'),(6,44,'','.1.3.6.1.4.1.2021.10.1.3.3'),(6,45,'','.1.3.6.1.4.1.2021.4.14.0'),(6,46,'','.1.3.6.1.4.1.2021.4.6.0'),(6,47,'','.1.3.6.1.4.1.2021.4.15.0'),(6,48,'','.1.3.6.1.4.1.2021.4.5.0'),(6,49,'','.1.3.6.1.2.1.25.1.5.0'),(6,50,'','.1.3.6.1.2.1.25.1.6.0'),(6,51,'','.1.3.6.1.4.1.2021.11.10.0'),(6,52,'','.1.3.6.1.4.1.2021.11.9.0'),(6,53,'','.1.3.6.1.4.1.2021.11.11.0'),(6,54,'','.1.3.6.1.4.1.2021.11.7.0'),(6,55,'','.1.3.6.1.4.1.2021.11.8.0'),(6,67,'','.1.3.6.1.2.1.1.3.0'),(6,68,'','.1.3.6.1.4.1.25461.2.1.2.3.1.0'),(6,69,'','.1.3.6.1.4.1.25461.2.1.2.3.3.0'),(6,70,'','.1.3.6.1.4.1.25461.2.1.2.3.4.0'),(6,71,'','.1.3.6.1.4.1.25461.2.1.2.3.5.0'),(6,72,'','.1.3.6.1.4.1.25461.2.1.2.3.6.0'),(6,73,'','.1.3.6.1.2.1.25.3.3.1.2.2'),(6,74,'','.1.3.6.1.2.1.25.3.3.1.2.1'),(6,75,'','.1.3.6.1.2.1.99.1.1.1.4.5'),(6,76,'','.1.3.6.1.2.1.99.1.1.1.4.4'),(6,79,'','.1.3.6.1.4.1.12356.1.8.0'),(6,80,'','.1.3.6.1.4.1.12356.1.10.0'),(6,81,'','.1.3.6.1.4.1.12356.1.9.0'),(7,30,'',''),(7,31,'',''),(7,32,'',''),(7,33,'',''),(7,58,'',''),(7,61,'',''),(7,77,'',''),(7,78,'',''),(7,83,'',''),(7,84,'',''),(7,85,'',''),(7,86,'',''),(7,87,'',''),(7,88,'',''),(7,89,'',''),(7,90,'',''),(7,91,'',''),(8,30,'',''),(8,31,'',''),(8,32,'',''),(8,33,'',''),(8,58,'',''),(8,61,'',''),(8,77,'',''),(8,78,'',''),(8,83,'',''),(8,84,'',''),(8,85,'',''),(8,86,'',''),(8,87,'',''),(8,88,'',''),(8,89,'',''),(8,90,'',''),(8,91,'',''),(9,30,'',''),(9,31,'',''),(9,32,'',''),(9,33,'',''),(9,58,'',''),(9,61,'',''),(9,77,'',''),(9,78,'',''),(9,83,'',''),(9,84,'',''),(9,85,'',''),(9,86,'',''),(9,87,'',''),(9,88,'',''),(9,89,'',''),(9,90,'',''),(9,91,'',''),(10,30,'',''),(10,31,'',''),(10,32,'',''),(10,33,'',''),(10,58,'',''),(10,61,'',''),(10,77,'',''),(10,78,'',''),(10,83,'',''),(10,84,'',''),(10,85,'',''),(10,86,'',''),(10,87,'',''),(10,88,'',''),(10,89,'',''),(10,90,'',''),(10,91,'',''),(11,30,'',''),(11,31,'',''),(11,32,'',''),(11,33,'',''),(11,58,'',''),(11,61,'',''),(11,77,'',''),(11,78,'',''),(11,83,'',''),(11,84,'',''),(11,85,'',''),(11,86,'',''),(11,87,'',''),(11,88,'',''),(11,89,'',''),(11,90,'',''),(11,91,'',''),(12,30,'on',''),(12,31,'on',''),(12,32,'on',''),(12,33,'on',''),(12,58,'on',''),(12,61,'on',''),(12,77,'on',''),(12,78,'on',''),(12,83,'on',''),(12,84,'on',''),(12,85,'on',''),(12,86,'on',''),(12,87,'on',''),(12,88,'on',''),(12,89,'on',''),(12,90,'on',''),(12,91,'on',''),(13,30,'on',''),(13,31,'on',''),(13,32,'on',''),(13,33,'on',''),(13,58,'on',''),(13,61,'on',''),(13,77,'on',''),(13,78,'on',''),(13,83,'on',''),(13,84,'on',''),(13,85,'on',''),(13,86,'on',''),(13,87,'on',''),(13,88,'on',''),(13,89,'on',''),(13,90,'on',''),(13,91,'on',''),(14,30,'on',''),(14,31,'on',''),(14,32,'on',''),(14,33,'on',''),(14,58,'on',''),(14,61,'on',''),(14,77,'on',''),(14,78,'on',''),(14,83,'on',''),(14,84,'on',''),(14,85,'on',''),(14,86,'on',''),(14,87,'on',''),(14,88,'on',''),(14,89,'on',''),(14,90,'on',''),(14,91,'on',''),(20,38,'',''),(20,64,'',''),(22,39,'','MemFree:'),(22,40,'','SwapFree:'),(22,65,'','MemFree:'),(22,66,'','SwapFree:'),(29,34,'',''),(31,41,'on',''),(31,93,'','dskDevice'),(32,41,'on',''),(32,93,'','/dev/mapper/centos-root'),(33,41,'on',''),(33,93,'','26'),(35,17,'',''),(35,18,'',''),(35,19,'',''),(35,20,'',''),(35,21,'',''),(35,22,'',''),(35,23,'',''),(35,24,'',''),(35,25,'',''),(35,26,'',''),(35,59,'on',''),(35,60,'on',''),(36,17,'',''),(36,18,'',''),(36,19,'',''),(36,20,'',''),(36,21,'',''),(36,22,'',''),(36,23,'',''),(36,24,'',''),(36,25,'',''),(36,26,'',''),(36,59,'on',''),(36,60,'on',''),(37,17,'',''),(37,18,'',''),(37,19,'',''),(37,20,'',''),(37,21,'',''),(37,22,'',''),(37,23,'',''),(37,24,'',''),(37,25,'',''),(37,26,'',''),(37,59,'on',''),(37,60,'on',''),(39,30,'',''),(39,31,'',''),(39,32,'',''),(39,33,'',''),(39,58,'',''),(39,78,'',''),(39,83,'',''),(39,84,'',''),(39,85,'',''),(39,86,'',''),(39,87,'',''),(39,88,'',''),(39,89,'',''),(39,90,'',''),(39,91,'',''),(40,27,'',''),(40,35,'',''),(40,42,'',''),(40,43,'',''),(40,44,'',''),(40,45,'',''),(40,46,'',''),(40,47,'',''),(40,48,'',''),(40,49,'',''),(40,50,'',''),(40,51,'',''),(40,52,'',''),(40,53,'',''),(40,54,'',''),(40,55,'',''),(40,67,'',''),(40,68,'',''),(40,69,'',''),(40,70,'',''),(40,71,'',''),(40,72,'',''),(40,73,'',''),(40,74,'',''),(40,75,'',''),(40,76,'',''),(41,27,'',''),(41,35,'',''),(41,42,'',''),(41,43,'',''),(41,44,'',''),(41,45,'',''),(41,46,'',''),(41,47,'',''),(41,48,'',''),(41,49,'',''),(41,50,'',''),(41,51,'',''),(41,52,'',''),(41,53,'',''),(41,54,'',''),(41,55,'',''),(41,67,'',''),(41,68,'',''),(41,69,'',''),(41,70,'',''),(41,71,'',''),(41,72,'',''),(41,73,'',''),(41,74,'',''),(41,75,'',''),(41,76,'',''),(42,27,'',''),(42,35,'',''),(42,42,'',''),(42,43,'',''),(42,44,'',''),(42,45,'',''),(42,46,'',''),(42,47,'',''),(42,48,'',''),(42,49,'',''),(42,50,'',''),(42,51,'',''),(42,52,'',''),(42,53,'',''),(42,54,'',''),(42,55,'',''),(42,67,'',''),(42,68,'',''),(42,69,'',''),(42,70,'',''),(42,71,'',''),(42,72,'',''),(42,73,'',''),(42,74,'',''),(42,75,'',''),(42,76,'',''),(43,27,'',''),(43,35,'',''),(43,42,'',''),(43,43,'',''),(43,44,'',''),(43,45,'',''),(43,46,'',''),(43,47,'',''),(43,48,'',''),(43,49,'',''),(43,50,'',''),(43,51,'',''),(43,52,'',''),(43,53,'',''),(43,54,'',''),(43,55,'',''),(43,67,'',''),(43,68,'',''),(43,69,'',''),(43,70,'',''),(43,71,'',''),(43,72,'',''),(43,73,'',''),(43,74,'',''),(43,75,'',''),(43,76,'',''),(44,30,'',''),(44,31,'',''),(44,58,'',''),(44,83,'',''),(44,84,'',''),(44,85,'',''),(44,86,'',''),(44,87,'',''),(44,88,'',''),(44,89,'',''),(44,90,'',''),(44,91,'',''),(45,30,'',''),(45,31,'',''),(45,58,'',''),(45,83,'',''),(45,84,'',''),(45,85,'',''),(45,86,'',''),(45,87,'',''),(45,88,'',''),(45,89,'',''),(45,90,'',''),(45,91,'',''),(46,30,'',''),(46,31,'',''),(46,58,'',''),(46,83,'',''),(46,84,'',''),(46,85,'',''),(46,86,'',''),(46,87,'',''),(46,88,'',''),(46,89,'',''),(46,90,'',''),(46,91,'',''),(89,28,'',''),(91,29,'',''),(93,56,'',''),(96,57,'',''),(99,82,'',''),(99,92,'',''),(100,82,'','ICMP'),(100,92,'','ICMP'),(101,82,'','10'),(101,92,'','10'),(102,82,'',''),(102,92,NULL,'127.0.0.1');
/*!40000 ALTER TABLE `data_input_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_input_fields`
--

DROP TABLE IF EXISTS `data_input_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_input_fields` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `data_input_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `data_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `input_output` char(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `update_rra` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `sequence` smallint(5) NOT NULL DEFAULT 0,
  `type_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `regexp_match` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `allow_nulls` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `data_input_id` (`data_input_id`),
  KEY `input_output` (`input_output`),
  KEY `type_code_data_input_id` (`type_code`,`data_input_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_input_fields`
--

LOCK TABLES `data_input_fields` WRITE;
/*!40000 ALTER TABLE `data_input_fields` DISABLE KEYS */;
INSERT INTO `data_input_fields` VALUES (1,'92f5906c8dc0f964b41f4253df582c38',1,'SNMP IP Address','management_ip','in','',0,'hostname','',''),(2,'32285d5bf16e56c478f5e83f32cda9ef',1,'SNMP Community','snmp_community','in','',0,'snmp_community','',''),(3,'ad14ac90641aed388139f6ba86a2e48b',1,'SNMP Username','snmp_username','in','',0,'snmp_username','','on'),(4,'9c55a74bd571b4f00a96fd4b793278c6',1,'SNMP Password','snmp_password','in','',0,'snmp_password','','on'),(5,'012ccb1d3687d3edb29c002ea66e72da',1,'SNMP Version (1, 2, or 3)','snmp_version','in','',0,'snmp_version','','on'),(6,'4276a5ec6e3fe33995129041b1909762',1,'OID','oid','in','',0,'snmp_oid','',''),(7,'617cdc8a230615e59f06f361ef6e7728',2,'SNMP IP Address','management_ip','in','',0,'hostname','',''),(8,'acb449d1451e8a2a655c2c99d31142c7',2,'SNMP Community','snmp_community','in','',0,'snmp_community','',''),(9,'f4facc5e2ca7ebee621f09bc6d9fc792',2,'SNMP Username (v3)','snmp_username','in','',0,'snmp_username','','on'),(10,'1cc1493a6781af2c478fa4de971531cf',2,'SNMP Password (v3)','snmp_password','in','',0,'snmp_password','','on'),(11,'b5c23f246559df38662c255f4aa21d6b',2,'SNMP Version (1, 2, or 3)','snmp_version','in','',0,'snmp_version','',''),(12,'6027a919c7c7731fbe095b6f53ab127b',2,'Index Type','index_type','in','',0,'index_type','',''),(13,'cbbe5c1ddfb264a6e5d509ce1c78c95f',2,'Index Value','index_value','in','',0,'index_value','',''),(14,'e6deda7be0f391399c5130e7c4a48b28',2,'Output Type ID','output_type','in','',0,'output_type','',''),(15,'edfd72783ad02df128ff82fc9324b4b9',3,'Disk Partition','partition','in','',1,'','',''),(16,'8b75fb61d288f0b5fc0bd3056af3689b',3,'Kilobytes Free','kilobytes','out','on',0,'','',''),(17,'363588d49b263d30aecb683c52774f39',4,'1 Minute Average','1min','out','on',0,'','',''),(18,'ad139a9e1d69881da36fca07889abf58',4,'5 Minute Average','5min','out','on',0,'','',''),(19,'5db9fee64824c08258c7ff6f8bc53337',4,'10 Minute Average','10min','out','on',0,'','',''),(20,'c0cfd0beae5e79927c5a360076706820',5,'Username (Optional)','username','in','',1,'','','on'),(21,'52c58ad414d9a2a83b00a7a51be75a53',5,'Logged In Users','users','out','on',0,'','',''),(22,'05eb5d710f0814871b8515845521f8d7',6,'Grep String','grepstr','in','',1,'','',''),(23,'86cb1cbfde66279dbc7f1144f43a3219',6,'Result (in Kilobytes)','kilobytes','out','on',0,'','',''),(24,'d5a8dd5fbe6a5af11667c0039af41386',7,'Number of Processes','proc','out','on',0,'','',''),(25,'8848cdcae831595951a3f6af04eec93b',8,'Grep String','grepstr','in','',1,'','','on'),(26,'3d1288d33008430ce354e8b9c162f7ff',8,'Connections','connections','out','on',0,'','',''),(27,'c6af570bb2ed9c84abf32033702e2860',9,'(Optional) Log Path','log_path','in','',1,'','','on'),(28,'f9389860f5c5340c9b27fca0b4ee5e71',9,'Web Hits','webhits','out','on',0,'','',''),(29,'5fbadb91ad66f203463c1187fe7bd9d5',10,'IP Address','hostname','in','',1,'hostname','',''),(30,'6ac4330d123c69067d36a933d105e89a',10,'Milliseconds','out_ms','out','on',0,'','',''),(31,'d39556ecad6166701bfb0e28c5a11108',11,'Index Type','index_type','in','',0,'index_type','',''),(32,'3b7caa46eb809fc238de6ef18b6e10d5',11,'Index Value','index_value','in','',0,'index_value','',''),(33,'74af2e42dc12956c4817c2ef5d9983f9',11,'Output Type ID','output_type','in','',0,'output_type','',''),(34,'8ae57f09f787656bf4ac541e8bd12537',11,'Output Value','output','out','on',0,'','',''),(35,'172b4b0eacee4948c6479f587b62e512',12,'Index Type','index_type','in','',0,'index_type','',''),(36,'30fb5d5bcf3d66bb5abe88596f357c26',12,'Index Value','index_value','in','',0,'index_value','',''),(37,'31112c85ae4ff821d3b288336288818c',12,'Output Type ID','output_type','in','',0,'output_type','',''),(38,'5be8fa85472d89c621790b43510b5043',12,'Output Value','output','out','on',0,'','',''),(39,'c1f36ee60c3dc98945556d57f26e475b',2,'SNMP Port','snmp_port','in','',0,'snmp_port','',''),(40,'fc64b99742ec417cc424dbf8c7692d36',1,'SNMP Port','snmp_port','in','',0,'snmp_port','',''),(41,'20832ce12f099c8e54140793a091af90',1,'SNMP Authenticaion Protocol (v3)','snmp_auth_protocol','in','',0,'snmp_auth_protocol','',''),(42,'c60c9aac1e1b3555ea0620b8bbfd82cb',1,'SNMP Privacy Passphrase (v3)','snmp_priv_passphrase','in','',0,'snmp_priv_passphrase','',''),(43,'feda162701240101bc74148415ef415a',1,'SNMP Privacy Protocol (v3)','snmp_priv_protocol','in','',0,'snmp_priv_protocol','',''),(44,'2cf7129ad3ff819a7a7ac189bee48ce8',2,'SNMP Authenticaion Protocol (v3)','snmp_auth_protocol','in','',0,'snmp_auth_protocol','',''),(45,'6b13ac0a0194e171d241d4b06f913158',2,'SNMP Privacy Passphrase (v3)','snmp_priv_passphrase','in','',0,'snmp_priv_passphrase','',''),(46,'3a33d4fc65b8329ab2ac46a36da26b72',2,'SNMP Privacy Protocol (v3)','snmp_priv_protocol','in','',0,'snmp_priv_protocol','',''),(47,'03ffd37fd55813d2d25bcd34967f2bcb',13,'Number of all processed rrds','RRDsProcessed','out','on',0,'','',''),(48,'15cfbcb8b34f83e6f088103ee83b22a8',13,'Number of all data sources','DataSources','out','on',0,'','',''),(49,'c39772d17f7cd0ba6ae330bb1bdbf607',13,'Hosts per Process','HostsPerProcess','out','on',0,'','',''),(50,'fdd660a8c8cee48696c6265882f0c14c',13,'Number of all Hosts','Hosts','out','on',0,'','',''),(51,'a63f6464addc92837bde2a091eb25b64',13,'Maximum Threads per Process','Threads','out','on',0,'','',''),(52,'cc25e6d384d698c928db02d43c16aeed',13,'Maximum Concurrent Poller Processes','Processes','out','on',0,'','',''),(53,'4b9d7d50fbef23d98e4445b444aa76e9',13,'Time for last poller run','Time','out','on',0,'','',''),(54,'f83b18feedf42a2ce3b00faa8b33f9ae',14,'Runtime of Boost Server','Time','out','on',0,'','',''),(55,'9004fc36a705da8c629059d1157d1afa',14,'Number of rrd file updates','RRDUpdates','out','on',0,'','',''),(56,'b3f6a82762aef7c767174e2b7db1efe5',15,'# of SNMP polls','snmp','out','on',0,'','',''),(57,'647d57d2e5e47684d21dbc8f2e291b47',15,'# of script polls','script','out','on',0,'','',''),(58,'9de4cbb821bac56bdf37862658c2713d',15,'# of script server entries','script_server','out','on',0,'','',''),(59,'b2bc32657a7fe9b90dafabff5ea4a966',16,'Recaching Time','RecacheTime','out','on',0,'','',''),(60,'a359a5b959303937b7a3952925c24ea7',16,'# of recached Hosts','HostsRecached','out','on',0,'','',''),(61,'ee27944f37ae0ed5d3e2e36f3389c507',17,'Boost Peak Memory usage','boost_peak_memory','out','on',0,'','',''),(62,'781b8a3655e9c94772178de16aa2a3dc',18,'number of valid logins','valid','out','on',0,'','',''),(63,'5e7570a64e33bfbd2a74e8d25cbedf84',18,'number of denied logins','invalid','out','on',0,'','',''),(64,'a576a6b27554ffc03c5b9c52e790bcf8',18,'number of active user sessions','active','out','on',0,'','',''),(65,'428cb0c15815cb5272f7e7886dfe36de',18,'number of sleeping user sessions','sleeping','out','on',0,'','',''),(66,'eab4f8666a47689e214669d60f182745',18,'number of obsolete user sessions','garbage','out','on',0,'','',''),(67,'1d9fc23dacbd933449a73aa84be5414f',18,'number of active users','uactive','out','on',0,'','',''),(68,'ce8d69c72f37533e6c32d0d866e036f6',18,'number of sleeping users','usleeping','out','on',0,'','',''),(69,'0e94e75f5f51153d8504dd96724fb0c7',19,'Total Graphs Exported','TotalGraphsExported','out','on',0,'','',''),(70,'dc898426d21a4441333656b9145abe02',20,'Export Duration','ExportDuration','out','on',0,'','',''),(71,'5c06ba76af1c36a4667440a079c14a65',21,'The Number of Record Deletes','deletes','out','on',0,'','',''),(72,'8dae453bf1629eb5767dc5a522436eae',21,'The Number of New Syslog Records','incoming','out','on',0,'','',''),(73,'e64944f0862a73d7d863447d04e03622',21,'The Number of New Syslog Records Discarded','removes','out','on',0,'','',''),(74,'168bd25e77eaf9f271059cc8265450d4',21,'The Number of New Syslog Records Moved Aside','xfers','out','on',0,'','',''),(75,'e4de70bb9c11d383e4a01ac6dd3bd784',21,'The Number of Syslog Alerts Checked for','alerts','out','on',0,'','',''),(76,'3d597fe525d8b4f0fdef3a2a6fb1cf85',21,'The Number of Syslog Alerts Newly Trigged','alarms','out','on',0,'','',''),(77,'79f7dee8871d5d9fcb5be4c6cb2ff684',21,'The Number of Syslog Reports Defined','reports','out','on',0,'','',''),(78,'c712ea4c6a4e534d3d6cb37f233e4d75',22,'The Total Syslog Runtime','syslogRuntime','out','on',0,'','',''),(79,'864aa6b4633e6f2b77a6e1cee2ca4baf',23,'The runtime for the Thold plugin','tholdRuntime','out','on',0,'','',''),(80,'e616027fec892c53c63ab7b5e1eb1ad8',24,'The Average Size of a Boost Record Row','boost_avg_size','out','on',0,'','',''),(81,'2e4a4d2d35b834c9473a0b0888df1a68',25,'Number of Records in Boost Table','boost_records','out','on',0,'','',''),(82,'3100c6b6b9d657a51cbcd818e1755503',26,'Total Size of the Boost Table in Bytes','boost_table','out','on',0,'','',''),(83,'9ffe12fb0c0b00264288d918ec21c59e',27,'The time to get records from the database','rrd_get_records','out','on',0,'','',''),(84,'7348018f3af0c4a17568d6fd77e9dbdd',27,'The total time to process the results','rrd_results_cycle','out','on',0,'','',''),(85,'1626735ca7aeadd7b9e2053add75d04a',27,'The time to gather the find the filename and build the update template','rrd_template','out','on',0,'','',''),(86,'3af21992a14b00f530a67bfcd5c06de0',27,'The amount of time to run the RRDtool lastupdate command','rrd_lastupdate','out','on',0,'','',''),(87,'0da05eedf7f74fc449bd4bba7d944b59',27,'The amount of time spent updating RRDfiles','rrd_update','out','on',0,'','',''),(88,'eff931ff2b8c8ac5a3e1501f65a10bd4',27,'The amount of time removing Boost records from the database','rrd_delete','out','on',0,'','',''),(89,'08f589472a63becab00f661c311985e8',28,'The hosts unique id','host_id','in','',0,'host_id','',''),(90,'2187e7ac3bfefe37c8227e87bbf81d90',28,'Polling Time in Milliseconds','polling_time','out','on',0,'','',''),(91,'746674cef4830927324742cbac124a19',29,'The hosts unique id','host_id','in','',0,'host_id','',''),(92,'cdd10c4aa321bb14ba8b0a5f6e62d06a',29,'Polling Time in Milliseconds','uptime','out','on',0,'','',''),(93,'5cdc32e66ef7b8619de77a274b6f7355',30,'The ID of the Host','hostname','in','',0,'hostname','',''),(94,'029b16559b8383de29dc640ba62f66f1',30,'Disk Reads in 5 Minutes','reads','out','on',0,'','',''),(95,'ff52a1a082547eaee254c3532e4c7487',30,'Disk Writes in 5 Minutes','writes','out','on',0,'','',''),(96,'3603877fa56213764cddd6ce7f126a4a',31,'The name of the host','hostname','in','',0,'hostname','',''),(97,'5560a408549e41f7f130e3d8e99505d0',31,'The number of bytes read in last 5 minutes','bytesread','out','on',0,'','',''),(98,'a9a85ecb0c17bf44cd5eee62a561c611',31,'The number of bytes written in last 5 minutes','byteswritten','out','on',0,'','',''),(99,'5f70f2d03d21300f664bfa84170f6641',32,'Port to ping.  Applies only to TCP and UDP protocols.','port','in','',4,'','','on'),(100,'1130c26c560d48191e3b1da07e26cfef',32,'Ping protocol to use.  Either ICMP (default), TCP, or UDP','protocol','in','',3,'','','on'),(101,'4042c506e261778066cbda27c21c9176',32,'The number of times to ping the host','attempts','in','',2,'','',''),(102,'96d16f176556dfeb5620d64cf916b88a',32,'Hostname or IP Address of the device to ping','hostname','in','',1,'hostname','',''),(103,'d925e1bfe111d30daf35d69afb2b3305',32,'Minimum','min','out','on',0,'','',''),(104,'d5c29836073d12c3c961fe2ed371d613',32,'Average','avg','out','on',0,'','',''),(105,'0f82cdd8c53130b92a64ff8e748ef26a',32,'Maximum','max','out','on',0,'','',''),(106,'72a5c2209fdf920fb6c1ecfab14420b4',32,'Deviation','dev','out','on',0,'','',''),(107,'15748714320e221c723c5595feb244e7',32,'Loss','loss','out','on',0,'','','');
/*!40000 ALTER TABLE `data_input_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_local`
--

DROP TABLE IF EXISTS `data_local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_local` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `data_template_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `host_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `snmp_query_id` mediumint(8) NOT NULL DEFAULT 0,
  `snmp_index` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `data_template_id` (`data_template_id`),
  KEY `snmp_query_id` (`snmp_query_id`),
  KEY `snmp_index` (`snmp_index`),
  KEY `host_id_snmp_query_id` (`host_id`,`snmp_query_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_local`
--

LOCK TABLES `data_local` WRITE;
/*!40000 ALTER TABLE `data_local` DISABLE KEYS */;
INSERT INTO `data_local` VALUES (1,36,1,0,''),(2,37,1,0,''),(3,38,1,0,''),(4,39,1,0,''),(5,40,1,0,''),(6,77,1,0,''),(7,41,1,5,'/dev/mapper/centos-root'),(8,1,1,0,''),(9,1,1,0,''),(10,2,1,0,''),(11,3,1,0,''),(12,4,1,0,''),(13,1,1,0,''),(14,5,1,0,''),(15,6,1,0,''),(16,6,1,0,''),(17,6,1,0,''),(18,2,1,0,''),(19,1,1,0,''),(20,7,1,0,''),(21,8,1,0,''),(22,9,1,0,''),(23,10,1,0,''),(24,11,1,0,''),(25,12,1,0,''),(26,13,1,0,''),(27,14,1,0,''),(28,15,1,0,''),(29,16,1,0,'');
/*!40000 ALTER TABLE `data_local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_source_profiles`
--

DROP TABLE IF EXISTS `data_source_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_source_profiles` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `step` int(10) unsigned NOT NULL DEFAULT 300,
  `heartbeat` int(10) unsigned NOT NULL DEFAULT 600,
  `x_files_factor` double DEFAULT 0.5,
  `default` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `name` (`name`(171))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Stores Data Source Profiles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_source_profiles`
--

LOCK TABLES `data_source_profiles` WRITE;
/*!40000 ALTER TABLE `data_source_profiles` DISABLE KEYS */;
INSERT INTO `data_source_profiles` VALUES (1,'d62c52891f4f9688729a5bc9fad91b18','5 Minute Collection',300,600,0.5,''),(2,'c0dd0e46b9ca268e7ed4162d329f9215','30 Second Collection',30,1200,0.5,''),(3,'66d35da8f75c912ede3dbe901fedcae0','1 Minute Collection',60,600,0.5,'on');
/*!40000 ALTER TABLE `data_source_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_source_profiles_cf`
--

DROP TABLE IF EXISTS `data_source_profiles_cf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_source_profiles_cf` (
  `data_source_profile_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `consolidation_function_id` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`data_source_profile_id`,`consolidation_function_id`),
  KEY `data_source_profile_id` (`data_source_profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Maps the Data Source Profile Consolidation Functions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_source_profiles_cf`
--

LOCK TABLES `data_source_profiles_cf` WRITE;
/*!40000 ALTER TABLE `data_source_profiles_cf` DISABLE KEYS */;
INSERT INTO `data_source_profiles_cf` VALUES (1,1),(1,2),(1,3),(1,4),(2,1),(2,2),(2,3),(2,4),(3,1),(3,2),(3,3),(3,4);
/*!40000 ALTER TABLE `data_source_profiles_cf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_source_profiles_rra`
--

DROP TABLE IF EXISTS `data_source_profiles_rra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_source_profiles_rra` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `data_source_profile_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `steps` int(10) unsigned DEFAULT 1,
  `rows` int(10) unsigned NOT NULL DEFAULT 700,
  `timespan` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `data_source_profile_id` (`data_source_profile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Stores RRA Definitions for Data Source Profiles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_source_profiles_rra`
--

LOCK TABLES `data_source_profiles_rra` WRITE;
/*!40000 ALTER TABLE `data_source_profiles_rra` DISABLE KEYS */;
INSERT INTO `data_source_profiles_rra` VALUES (1,1,'Daily (5 Minute Average)',1,600,86400),(2,1,'Weekly (30 Minute Average)',6,700,604800),(3,1,'Monthly (2 Hour Average)',24,775,2618784),(4,1,'Yearly (1 Day Average)',288,797,31536000),(5,2,'Daily (30 Second Average)',1,1500,86400),(6,2,'Weekly (15 Minute Average)',30,1346,604800),(7,2,'Monthly (1 Hour Average)',120,1445,2618784),(8,2,'Yearly (4 Hour Average)',480,4380,31536000),(9,3,'Daily (1 Minute Average)',1,2900,86400),(10,3,'Weekly (15 Minute Average)',15,1400,604800),(11,3,'Monthly (1 Hour Average)',60,1465,2618784),(12,3,'Yearly (4 Hour Average)',240,4380,31536000);
/*!40000 ALTER TABLE `data_source_profiles_rra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_source_purge_action`
--

DROP TABLE IF EXISTS `data_source_purge_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_source_purge_action` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `local_data_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `action` tinyint(2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='RRD Cleaner File Actions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_source_purge_action`
--

LOCK TABLES `data_source_purge_action` WRITE;
/*!40000 ALTER TABLE `data_source_purge_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_source_purge_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_source_purge_temp`
--

DROP TABLE IF EXISTS `data_source_purge_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_source_purge_temp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_cache` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `local_data_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `size` int(10) unsigned NOT NULL DEFAULT 0,
  `last_mod` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `in_cacti` tinyint(4) NOT NULL DEFAULT 0,
  `data_template_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `local_data_id` (`local_data_id`),
  KEY `in_cacti` (`in_cacti`),
  KEY `data_template_id` (`data_template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='RRD Cleaner File Repository';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_source_purge_temp`
--

LOCK TABLES `data_source_purge_temp` WRITE;
/*!40000 ALTER TABLE `data_source_purge_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_source_purge_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_source_stats_daily`
--

DROP TABLE IF EXISTS `data_source_stats_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_source_stats_daily` (
  `local_data_id` mediumint(8) unsigned NOT NULL,
  `rrd_name` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `average` double DEFAULT NULL,
  `peak` double DEFAULT NULL,
  PRIMARY KEY (`local_data_id`,`rrd_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_source_stats_daily`
--

LOCK TABLES `data_source_stats_daily` WRITE;
/*!40000 ALTER TABLE `data_source_stats_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_source_stats_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_source_stats_hourly`
--

DROP TABLE IF EXISTS `data_source_stats_hourly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_source_stats_hourly` (
  `local_data_id` mediumint(8) unsigned NOT NULL,
  `rrd_name` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `average` double DEFAULT NULL,
  `peak` double DEFAULT NULL,
  PRIMARY KEY (`local_data_id`,`rrd_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_source_stats_hourly`
--

LOCK TABLES `data_source_stats_hourly` WRITE;
/*!40000 ALTER TABLE `data_source_stats_hourly` DISABLE KEYS */;
INSERT INTO `data_source_stats_hourly` VALUES (1,'proc',114.75,115),(2,'load_15min',0.3175,0.32),(2,'load_1min',0.1725,0.37),(2,'load_5min',0.295,0.31),(3,'users',0,0),(4,'mem_buffers',331053,335324),(5,'mem_swap',839676,839676),(6,'avg',0.04765,0.0542),(6,'dev',0.010450000000000001,0.0146),(6,'loss',0,0),(6,'max',0.0735,0.09),(6,'min',0.03875,0.042),(7,'hdd_free',4254923,4254940),(7,'hdd_used',2231093,2231100),(8,'DataSources',30,30),(8,'Hosts',1,1),(8,'HostsPerProcess',1,1),(8,'Processes',1,1),(8,'RRDsProcessed',29,29),(8,'Threads',1,1),(8,'Time',2.455775,2.4837),(9,'DataSources',30,30),(9,'Hosts',1,1),(9,'HostsPerProcess',1,1),(9,'Processes',1,1),(9,'RRDsProcessed',29,29),(9,'Threads',1,1),(9,'Time',2.455775,2.4837),(10,'rrdupdates',0,0),(10,'time',0,0),(11,'script',10,10),(11,'script_server',20,20),(11,'snmp',0,0),(12,'hosts',0,0),(12,'time',0,0),(13,'DataSources',30,30),(13,'Hosts',1,1),(13,'HostsPerProcess',1,1),(13,'Processes',1,1),(13,'RRDsProcessed',29,29),(13,'Threads',1,1),(13,'Time',2.455775,2.4837),(14,'boost_peak_memory',0,0),(15,'active',0,0),(15,'garbage',0,0),(15,'invalid',1,1),(15,'sleeping',0,0),(15,'uactive',0,0),(15,'usleeping',0,0),(15,'valid',0,0),(16,'active',0,0),(16,'garbage',0,0),(16,'invalid',1,1),(16,'sleeping',0,0),(16,'uactive',0,0),(16,'usleeping',0,0),(16,'valid',0,0),(17,'active',0,0),(17,'garbage',0,0),(17,'invalid',1,1),(17,'sleeping',0,0),(17,'uactive',0,0),(17,'usleeping',0,0),(17,'valid',0,0),(18,'rrdupdates',0,0),(18,'time',0,0),(19,'DataSources',30,30),(19,'Hosts',1,1),(19,'HostsPerProcess',1,1),(19,'Processes',1,1),(19,'RRDsProcessed',29,29),(19,'Threads',1,1),(19,'Time',2.455775,2.4837),(20,'ExportGraphs',0,0),(21,'ExportDuration',0,0),(22,'alarms',0,0),(22,'deletes',0,0),(22,'incoming',0,0),(22,'removes',0,0),(22,'xfers',0,0),(23,'syslogRuntime',0,0),(24,'alerts',0,0),(24,'reports',0,0),(25,'tholdRuntime',0,0),(26,'boost_avg_size',0,0),(27,'boost_records',0,0),(28,'boost_table',16384,16384),(29,'rrd_lastupdate',0,0);
/*!40000 ALTER TABLE `data_source_stats_hourly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_source_stats_hourly_cache`
--

DROP TABLE IF EXISTS `data_source_stats_hourly_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_source_stats_hourly_cache` (
  `local_data_id` mediumint(8) unsigned NOT NULL,
  `rrd_name` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `value` double DEFAULT NULL,
  PRIMARY KEY (`local_data_id`,`time`,`rrd_name`),
  KEY `time` (`time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_source_stats_hourly_cache`
--

LOCK TABLES `data_source_stats_hourly_cache` WRITE;
/*!40000 ALTER TABLE `data_source_stats_hourly_cache` DISABLE KEYS */;
INSERT INTO `data_source_stats_hourly_cache` VALUES (1,'proc','2020-03-08 00:57:02',115),(1,'proc','2020-03-08 00:58:02',115),(1,'proc','2020-03-08 00:59:02',114),(1,'proc','2020-03-08 01:00:02',115),(2,'load_15min','2020-03-08 00:57:02',0.32),(2,'load_1min','2020-03-08 00:57:02',0.07),(2,'load_5min','2020-03-08 00:57:02',0.31),(2,'load_15min','2020-03-08 00:58:02',0.32),(2,'load_1min','2020-03-08 00:58:02',0.16),(2,'load_5min','2020-03-08 00:58:02',0.31),(2,'load_15min','2020-03-08 00:59:02',0.31),(2,'load_1min','2020-03-08 00:59:02',0.09),(2,'load_5min','2020-03-08 00:59:02',0.26),(2,'load_15min','2020-03-08 01:00:02',0.32),(2,'load_1min','2020-03-08 01:00:02',0.37),(2,'load_5min','2020-03-08 01:00:02',0.3),(3,'users','2020-03-08 00:57:02',0),(3,'users','2020-03-08 00:58:02',0),(3,'users','2020-03-08 00:59:02',0),(3,'users','2020-03-08 01:00:02',0),(4,'mem_buffers','2020-03-08 00:57:02',319368),(4,'mem_buffers','2020-03-08 00:58:02',335324),(4,'mem_buffers','2020-03-08 00:59:02',334896),(4,'mem_buffers','2020-03-08 01:00:02',334624),(5,'mem_swap','2020-03-08 00:57:02',839676),(5,'mem_swap','2020-03-08 00:58:02',839676),(5,'mem_swap','2020-03-08 00:59:02',839676),(5,'mem_swap','2020-03-08 01:00:02',839676),(6,'avg','2020-03-08 00:57:02',0.0542),(6,'dev','2020-03-08 00:57:02',0.0072),(6,'loss','2020-03-08 00:57:02',0),(6,'max','2020-03-08 00:57:02',0.063),(6,'min','2020-03-08 00:57:02',0.042),(6,'avg','2020-03-08 00:58:02',0.0464),(6,'dev','2020-03-08 00:58:02',0.0146),(6,'loss','2020-03-08 00:58:02',0),(6,'max','2020-03-08 00:58:02',0.09),(6,'min','2020-03-08 00:58:02',0.038),(6,'avg','2020-03-08 00:59:02',0.0439),(6,'dev','2020-03-08 00:59:02',0.0058),(6,'loss','2020-03-08 00:59:02',0),(6,'max','2020-03-08 00:59:02',0.061),(6,'min','2020-03-08 00:59:02',0.041),(6,'avg','2020-03-08 01:00:02',0.0461),(6,'dev','2020-03-08 01:00:02',0.0142),(6,'loss','2020-03-08 01:00:02',0),(6,'max','2020-03-08 01:00:02',0.08),(6,'min','2020-03-08 01:00:02',0.034),(7,'hdd_free','2020-03-08 00:57:02',4254940),(7,'hdd_used','2020-03-08 00:57:02',2231076),(7,'hdd_free','2020-03-08 00:58:02',4254920),(7,'hdd_used','2020-03-08 00:58:02',2231096),(7,'hdd_free','2020-03-08 00:59:02',4254916),(7,'hdd_used','2020-03-08 00:59:02',2231100),(7,'hdd_free','2020-03-08 01:00:02',4254916),(7,'hdd_used','2020-03-08 01:00:02',2231100),(8,'DataSources','2020-03-08 00:57:02',30),(8,'Hosts','2020-03-08 00:57:02',1),(8,'HostsPerProcess','2020-03-08 00:57:02',1),(8,'Processes','2020-03-08 00:57:02',1),(8,'RRDsProcessed','2020-03-08 00:57:02',29),(8,'Threads','2020-03-08 00:57:02',1),(8,'Time','2020-03-08 00:57:02',2.4522),(8,'DataSources','2020-03-08 00:58:02',30),(8,'Hosts','2020-03-08 00:58:02',1),(8,'HostsPerProcess','2020-03-08 00:58:02',1),(8,'Processes','2020-03-08 00:58:02',1),(8,'RRDsProcessed','2020-03-08 00:58:02',29),(8,'Threads','2020-03-08 00:58:02',1),(8,'Time','2020-03-08 00:58:02',2.4193),(8,'DataSources','2020-03-08 00:59:02',30),(8,'Hosts','2020-03-08 00:59:02',1),(8,'HostsPerProcess','2020-03-08 00:59:02',1),(8,'Processes','2020-03-08 00:59:02',1),(8,'RRDsProcessed','2020-03-08 00:59:02',29),(8,'Threads','2020-03-08 00:59:02',1),(8,'Time','2020-03-08 00:59:02',2.4679),(8,'DataSources','2020-03-08 01:00:02',30),(8,'Hosts','2020-03-08 01:00:02',1),(8,'HostsPerProcess','2020-03-08 01:00:02',1),(8,'Processes','2020-03-08 01:00:02',1),(8,'RRDsProcessed','2020-03-08 01:00:02',29),(8,'Threads','2020-03-08 01:00:02',1),(8,'Time','2020-03-08 01:00:02',2.4837),(9,'DataSources','2020-03-08 00:57:02',30),(9,'Hosts','2020-03-08 00:57:02',1),(9,'HostsPerProcess','2020-03-08 00:57:02',1),(9,'Processes','2020-03-08 00:57:02',1),(9,'RRDsProcessed','2020-03-08 00:57:02',29),(9,'Threads','2020-03-08 00:57:02',1),(9,'Time','2020-03-08 00:57:02',2.4522),(9,'DataSources','2020-03-08 00:58:02',30),(9,'Hosts','2020-03-08 00:58:02',1),(9,'HostsPerProcess','2020-03-08 00:58:02',1),(9,'Processes','2020-03-08 00:58:02',1),(9,'RRDsProcessed','2020-03-08 00:58:02',29),(9,'Threads','2020-03-08 00:58:02',1),(9,'Time','2020-03-08 00:58:02',2.4193),(9,'DataSources','2020-03-08 00:59:02',30),(9,'Hosts','2020-03-08 00:59:02',1),(9,'HostsPerProcess','2020-03-08 00:59:02',1),(9,'Processes','2020-03-08 00:59:02',1),(9,'RRDsProcessed','2020-03-08 00:59:02',29),(9,'Threads','2020-03-08 00:59:02',1),(9,'Time','2020-03-08 00:59:02',2.4679),(9,'DataSources','2020-03-08 01:00:02',30),(9,'Hosts','2020-03-08 01:00:02',1),(9,'HostsPerProcess','2020-03-08 01:00:02',1),(9,'Processes','2020-03-08 01:00:02',1),(9,'RRDsProcessed','2020-03-08 01:00:02',29),(9,'Threads','2020-03-08 01:00:02',1),(9,'Time','2020-03-08 01:00:02',2.4837),(10,'rrdupdates','2020-03-08 00:57:02',0),(10,'time','2020-03-08 00:57:02',0),(10,'rrdupdates','2020-03-08 00:58:02',0),(10,'time','2020-03-08 00:58:02',0),(10,'rrdupdates','2020-03-08 00:59:02',0),(10,'time','2020-03-08 00:59:02',0),(10,'rrdupdates','2020-03-08 01:00:02',0),(10,'time','2020-03-08 01:00:02',0),(11,'script','2020-03-08 00:57:02',10),(11,'script_server','2020-03-08 00:57:02',20),(11,'snmp','2020-03-08 00:57:02',0),(11,'script','2020-03-08 00:58:02',10),(11,'script_server','2020-03-08 00:58:02',20),(11,'snmp','2020-03-08 00:58:02',0),(11,'script','2020-03-08 00:59:02',10),(11,'script_server','2020-03-08 00:59:02',20),(11,'snmp','2020-03-08 00:59:02',0),(11,'script','2020-03-08 01:00:02',10),(11,'script_server','2020-03-08 01:00:02',20),(11,'snmp','2020-03-08 01:00:02',0),(12,'hosts','2020-03-08 00:57:02',0),(12,'time','2020-03-08 00:57:02',0),(12,'hosts','2020-03-08 00:58:02',0),(12,'time','2020-03-08 00:58:02',0),(12,'hosts','2020-03-08 00:59:02',0),(12,'time','2020-03-08 00:59:02',0),(12,'hosts','2020-03-08 01:00:02',0),(12,'time','2020-03-08 01:00:02',0),(13,'DataSources','2020-03-08 00:57:02',30),(13,'Hosts','2020-03-08 00:57:02',1),(13,'HostsPerProcess','2020-03-08 00:57:02',1),(13,'Processes','2020-03-08 00:57:02',1),(13,'RRDsProcessed','2020-03-08 00:57:02',29),(13,'Threads','2020-03-08 00:57:02',1),(13,'Time','2020-03-08 00:57:02',2.4522),(13,'DataSources','2020-03-08 00:58:02',30),(13,'Hosts','2020-03-08 00:58:02',1),(13,'HostsPerProcess','2020-03-08 00:58:02',1),(13,'Processes','2020-03-08 00:58:02',1),(13,'RRDsProcessed','2020-03-08 00:58:02',29),(13,'Threads','2020-03-08 00:58:02',1),(13,'Time','2020-03-08 00:58:02',2.4193),(13,'DataSources','2020-03-08 00:59:02',30),(13,'Hosts','2020-03-08 00:59:02',1),(13,'HostsPerProcess','2020-03-08 00:59:02',1),(13,'Processes','2020-03-08 00:59:02',1),(13,'RRDsProcessed','2020-03-08 00:59:02',29),(13,'Threads','2020-03-08 00:59:02',1),(13,'Time','2020-03-08 00:59:02',2.4679),(13,'DataSources','2020-03-08 01:00:02',30),(13,'Hosts','2020-03-08 01:00:02',1),(13,'HostsPerProcess','2020-03-08 01:00:02',1),(13,'Processes','2020-03-08 01:00:02',1),(13,'RRDsProcessed','2020-03-08 01:00:02',29),(13,'Threads','2020-03-08 01:00:02',1),(13,'Time','2020-03-08 01:00:02',2.4837),(14,'boost_peak_memory','2020-03-08 00:57:02',0),(14,'boost_peak_memory','2020-03-08 00:58:02',0),(14,'boost_peak_memory','2020-03-08 00:59:02',0),(14,'boost_peak_memory','2020-03-08 01:00:02',0),(15,'active','2020-03-08 00:57:02',0),(15,'garbage','2020-03-08 00:57:02',0),(15,'invalid','2020-03-08 00:57:02',1),(15,'sleeping','2020-03-08 00:57:02',0),(15,'uactive','2020-03-08 00:57:02',0),(15,'usleeping','2020-03-08 00:57:02',0),(15,'valid','2020-03-08 00:57:02',0),(15,'active','2020-03-08 00:58:02',0),(15,'garbage','2020-03-08 00:58:02',0),(15,'invalid','2020-03-08 00:58:02',1),(15,'sleeping','2020-03-08 00:58:02',0),(15,'uactive','2020-03-08 00:58:02',0),(15,'usleeping','2020-03-08 00:58:02',0),(15,'valid','2020-03-08 00:58:02',0),(15,'active','2020-03-08 00:59:02',0),(15,'garbage','2020-03-08 00:59:02',0),(15,'invalid','2020-03-08 00:59:02',1),(15,'sleeping','2020-03-08 00:59:02',0),(15,'uactive','2020-03-08 00:59:02',0),(15,'usleeping','2020-03-08 00:59:02',0),(15,'valid','2020-03-08 00:59:02',0),(15,'active','2020-03-08 01:00:02',0),(15,'garbage','2020-03-08 01:00:02',0),(15,'invalid','2020-03-08 01:00:02',1),(15,'sleeping','2020-03-08 01:00:02',0),(15,'uactive','2020-03-08 01:00:02',0),(15,'usleeping','2020-03-08 01:00:02',0),(15,'valid','2020-03-08 01:00:02',0),(16,'active','2020-03-08 00:57:02',0),(16,'garbage','2020-03-08 00:57:02',0),(16,'invalid','2020-03-08 00:57:02',1),(16,'sleeping','2020-03-08 00:57:02',0),(16,'uactive','2020-03-08 00:57:02',0),(16,'usleeping','2020-03-08 00:57:02',0),(16,'valid','2020-03-08 00:57:02',0),(16,'active','2020-03-08 00:58:02',0),(16,'garbage','2020-03-08 00:58:02',0),(16,'invalid','2020-03-08 00:58:02',1),(16,'sleeping','2020-03-08 00:58:02',0),(16,'uactive','2020-03-08 00:58:02',0),(16,'usleeping','2020-03-08 00:58:02',0),(16,'valid','2020-03-08 00:58:02',0),(16,'active','2020-03-08 00:59:02',0),(16,'garbage','2020-03-08 00:59:02',0),(16,'invalid','2020-03-08 00:59:02',1),(16,'sleeping','2020-03-08 00:59:02',0),(16,'uactive','2020-03-08 00:59:02',0),(16,'usleeping','2020-03-08 00:59:02',0),(16,'valid','2020-03-08 00:59:02',0),(16,'active','2020-03-08 01:00:02',0),(16,'garbage','2020-03-08 01:00:02',0),(16,'invalid','2020-03-08 01:00:02',1),(16,'sleeping','2020-03-08 01:00:02',0),(16,'uactive','2020-03-08 01:00:02',0),(16,'usleeping','2020-03-08 01:00:02',0),(16,'valid','2020-03-08 01:00:02',0),(17,'active','2020-03-08 00:57:02',0),(17,'garbage','2020-03-08 00:57:02',0),(17,'invalid','2020-03-08 00:57:02',1),(17,'sleeping','2020-03-08 00:57:02',0),(17,'uactive','2020-03-08 00:57:02',0),(17,'usleeping','2020-03-08 00:57:02',0),(17,'valid','2020-03-08 00:57:02',0),(17,'active','2020-03-08 00:58:02',0),(17,'garbage','2020-03-08 00:58:02',0),(17,'invalid','2020-03-08 00:58:02',1),(17,'sleeping','2020-03-08 00:58:02',0),(17,'uactive','2020-03-08 00:58:02',0),(17,'usleeping','2020-03-08 00:58:02',0),(17,'valid','2020-03-08 00:58:02',0),(17,'active','2020-03-08 00:59:02',0),(17,'garbage','2020-03-08 00:59:02',0),(17,'invalid','2020-03-08 00:59:02',1),(17,'sleeping','2020-03-08 00:59:02',0),(17,'uactive','2020-03-08 00:59:02',0),(17,'usleeping','2020-03-08 00:59:02',0),(17,'valid','2020-03-08 00:59:02',0),(17,'active','2020-03-08 01:00:02',0),(17,'garbage','2020-03-08 01:00:02',0),(17,'invalid','2020-03-08 01:00:02',1),(17,'sleeping','2020-03-08 01:00:02',0),(17,'uactive','2020-03-08 01:00:02',0),(17,'usleeping','2020-03-08 01:00:02',0),(17,'valid','2020-03-08 01:00:02',0),(18,'rrdupdates','2020-03-08 00:57:02',0),(18,'time','2020-03-08 00:57:02',0),(18,'rrdupdates','2020-03-08 00:58:02',0),(18,'time','2020-03-08 00:58:02',0),(18,'rrdupdates','2020-03-08 00:59:02',0),(18,'time','2020-03-08 00:59:02',0),(18,'rrdupdates','2020-03-08 01:00:02',0),(18,'time','2020-03-08 01:00:02',0),(19,'DataSources','2020-03-08 00:57:02',30),(19,'Hosts','2020-03-08 00:57:02',1),(19,'HostsPerProcess','2020-03-08 00:57:02',1),(19,'Processes','2020-03-08 00:57:02',1),(19,'RRDsProcessed','2020-03-08 00:57:02',29),(19,'Threads','2020-03-08 00:57:02',1),(19,'Time','2020-03-08 00:57:02',2.4522),(19,'DataSources','2020-03-08 00:58:02',30),(19,'Hosts','2020-03-08 00:58:02',1),(19,'HostsPerProcess','2020-03-08 00:58:02',1),(19,'Processes','2020-03-08 00:58:02',1),(19,'RRDsProcessed','2020-03-08 00:58:02',29),(19,'Threads','2020-03-08 00:58:02',1),(19,'Time','2020-03-08 00:58:02',2.4193),(19,'DataSources','2020-03-08 00:59:02',30),(19,'Hosts','2020-03-08 00:59:02',1),(19,'HostsPerProcess','2020-03-08 00:59:02',1),(19,'Processes','2020-03-08 00:59:02',1),(19,'RRDsProcessed','2020-03-08 00:59:02',29),(19,'Threads','2020-03-08 00:59:02',1),(19,'Time','2020-03-08 00:59:02',2.4679),(19,'DataSources','2020-03-08 01:00:02',30),(19,'Hosts','2020-03-08 01:00:02',1),(19,'HostsPerProcess','2020-03-08 01:00:02',1),(19,'Processes','2020-03-08 01:00:02',1),(19,'RRDsProcessed','2020-03-08 01:00:02',29),(19,'Threads','2020-03-08 01:00:02',1),(19,'Time','2020-03-08 01:00:02',2.4837),(20,'ExportGraphs','2020-03-08 00:57:02',0),(20,'ExportGraphs','2020-03-08 00:58:02',0),(20,'ExportGraphs','2020-03-08 00:59:02',0),(20,'ExportGraphs','2020-03-08 01:00:02',0),(21,'ExportDuration','2020-03-08 00:57:02',0),(21,'ExportDuration','2020-03-08 00:58:02',0),(21,'ExportDuration','2020-03-08 00:59:02',0),(21,'ExportDuration','2020-03-08 01:00:02',0),(22,'alarms','2020-03-08 00:57:02',0),(22,'deletes','2020-03-08 00:57:02',0),(22,'incoming','2020-03-08 00:57:02',0),(22,'removes','2020-03-08 00:57:02',0),(22,'xfers','2020-03-08 00:57:02',0),(22,'alarms','2020-03-08 00:58:02',0),(22,'deletes','2020-03-08 00:58:02',0),(22,'incoming','2020-03-08 00:58:02',0),(22,'removes','2020-03-08 00:58:02',0),(22,'xfers','2020-03-08 00:58:02',0),(22,'alarms','2020-03-08 00:59:02',0),(22,'deletes','2020-03-08 00:59:02',0),(22,'incoming','2020-03-08 00:59:02',0),(22,'removes','2020-03-08 00:59:02',0),(22,'xfers','2020-03-08 00:59:02',0),(22,'alarms','2020-03-08 01:00:02',0),(22,'deletes','2020-03-08 01:00:02',0),(22,'incoming','2020-03-08 01:00:02',0),(22,'removes','2020-03-08 01:00:02',0),(22,'xfers','2020-03-08 01:00:02',0),(23,'syslogRuntime','2020-03-08 00:57:02',0),(23,'syslogRuntime','2020-03-08 00:58:02',0),(23,'syslogRuntime','2020-03-08 00:59:02',0),(23,'syslogRuntime','2020-03-08 01:00:02',0),(24,'alerts','2020-03-08 00:57:02',0),(24,'reports','2020-03-08 00:57:02',0),(24,'alerts','2020-03-08 00:58:02',0),(24,'reports','2020-03-08 00:58:02',0),(24,'alerts','2020-03-08 00:59:02',0),(24,'reports','2020-03-08 00:59:02',0),(24,'alerts','2020-03-08 01:00:02',0),(24,'reports','2020-03-08 01:00:02',0),(25,'tholdRuntime','2020-03-08 00:57:02',0),(25,'tholdRuntime','2020-03-08 00:58:02',0),(25,'tholdRuntime','2020-03-08 00:59:02',0),(25,'tholdRuntime','2020-03-08 01:00:02',0),(26,'boost_avg_size','2020-03-08 00:57:02',0),(26,'boost_avg_size','2020-03-08 00:58:02',0),(26,'boost_avg_size','2020-03-08 00:59:02',0),(26,'boost_avg_size','2020-03-08 01:00:02',0),(27,'boost_records','2020-03-08 00:57:02',0),(27,'boost_records','2020-03-08 00:58:02',0),(27,'boost_records','2020-03-08 00:59:02',0),(27,'boost_records','2020-03-08 01:00:02',0),(28,'boost_table','2020-03-08 00:57:02',16384),(28,'boost_table','2020-03-08 00:58:02',16384),(28,'boost_table','2020-03-08 00:59:02',16384),(28,'boost_table','2020-03-08 01:00:02',16384),(29,'rrd_lastupdate','2020-03-08 00:57:02',0),(29,'rrd_lastupdate','2020-03-08 00:58:02',0),(29,'rrd_lastupdate','2020-03-08 00:59:02',0),(29,'rrd_lastupdate','2020-03-08 01:00:02',0);
/*!40000 ALTER TABLE `data_source_stats_hourly_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_source_stats_hourly_last`
--

DROP TABLE IF EXISTS `data_source_stats_hourly_last`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_source_stats_hourly_last` (
  `local_data_id` mediumint(8) unsigned NOT NULL,
  `rrd_name` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` double DEFAULT NULL,
  `calculated` double DEFAULT NULL,
  PRIMARY KEY (`local_data_id`,`rrd_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_source_stats_hourly_last`
--

LOCK TABLES `data_source_stats_hourly_last` WRITE;
/*!40000 ALTER TABLE `data_source_stats_hourly_last` DISABLE KEYS */;
INSERT INTO `data_source_stats_hourly_last` VALUES (1,'proc',115,115),(2,'load_15min',0.32,0.32),(2,'load_1min',0.37,0.37),(2,'load_5min',0.3,0.3),(3,'users',0,0),(4,'mem_buffers',334624,334624),(5,'mem_swap',839676,839676),(6,'avg',0.0461,0.0461),(6,'dev',0.0142,0.0142),(6,'loss',0,0),(6,'max',0.08,0.08),(6,'min',0.034,0.034),(7,'hdd_free',4254916,4254916),(7,'hdd_used',2231100,2231100),(8,'DataSources',30,30),(8,'Hosts',1,1),(8,'HostsPerProcess',1,1),(8,'Processes',1,1),(8,'RRDsProcessed',29,29),(8,'Threads',1,1),(8,'Time',2.4837,2.4837),(9,'DataSources',30,30),(9,'Hosts',1,1),(9,'HostsPerProcess',1,1),(9,'Processes',1,1),(9,'RRDsProcessed',29,29),(9,'Threads',1,1),(9,'Time',2.4837,2.4837),(10,'rrdupdates',0,0),(10,'time',0,0),(11,'script',10,10),(11,'script_server',20,20),(11,'snmp',0,0),(12,'hosts',0,0),(12,'time',0,0),(13,'DataSources',30,30),(13,'Hosts',1,1),(13,'HostsPerProcess',1,1),(13,'Processes',1,1),(13,'RRDsProcessed',29,29),(13,'Threads',1,1),(13,'Time',2.4837,2.4837),(14,'boost_peak_memory',0,0),(15,'active',0,0),(15,'garbage',0,0),(15,'invalid',1,1),(15,'sleeping',0,0),(15,'uactive',0,0),(15,'usleeping',0,0),(15,'valid',0,0),(16,'active',0,0),(16,'garbage',0,0),(16,'invalid',1,1),(16,'sleeping',0,0),(16,'uactive',0,0),(16,'usleeping',0,0),(16,'valid',0,0),(17,'active',0,0),(17,'garbage',0,0),(17,'invalid',1,1),(17,'sleeping',0,0),(17,'uactive',0,0),(17,'usleeping',0,0),(17,'valid',0,0),(18,'rrdupdates',0,0),(18,'time',0,0),(19,'DataSources',30,30),(19,'Hosts',1,1),(19,'HostsPerProcess',1,1),(19,'Processes',1,1),(19,'RRDsProcessed',29,29),(19,'Threads',1,1),(19,'Time',2.4837,2.4837),(20,'ExportGraphs',0,0),(21,'ExportDuration',0,0),(22,'alarms',0,0),(22,'deletes',0,0),(22,'incoming',0,0),(22,'removes',0,0),(22,'xfers',0,0),(23,'syslogRuntime',0,0),(24,'alerts',0,0),(24,'reports',0,0),(25,'tholdRuntime',0,0),(26,'boost_avg_size',0,0),(27,'boost_records',0,0),(28,'boost_table',16384,16384),(29,'rrd_lastupdate',0,0);
/*!40000 ALTER TABLE `data_source_stats_hourly_last` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_source_stats_monthly`
--

DROP TABLE IF EXISTS `data_source_stats_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_source_stats_monthly` (
  `local_data_id` mediumint(8) unsigned NOT NULL,
  `rrd_name` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `average` double DEFAULT NULL,
  `peak` double DEFAULT NULL,
  PRIMARY KEY (`local_data_id`,`rrd_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_source_stats_monthly`
--

LOCK TABLES `data_source_stats_monthly` WRITE;
/*!40000 ALTER TABLE `data_source_stats_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_source_stats_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_source_stats_weekly`
--

DROP TABLE IF EXISTS `data_source_stats_weekly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_source_stats_weekly` (
  `local_data_id` mediumint(8) unsigned NOT NULL,
  `rrd_name` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `average` double DEFAULT NULL,
  `peak` double DEFAULT NULL,
  PRIMARY KEY (`local_data_id`,`rrd_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_source_stats_weekly`
--

LOCK TABLES `data_source_stats_weekly` WRITE;
/*!40000 ALTER TABLE `data_source_stats_weekly` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_source_stats_weekly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_source_stats_yearly`
--

DROP TABLE IF EXISTS `data_source_stats_yearly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_source_stats_yearly` (
  `local_data_id` mediumint(8) unsigned NOT NULL,
  `rrd_name` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `average` double DEFAULT NULL,
  `peak` double DEFAULT NULL,
  PRIMARY KEY (`local_data_id`,`rrd_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_source_stats_yearly`
--

LOCK TABLES `data_source_stats_yearly` WRITE;
/*!40000 ALTER TABLE `data_source_stats_yearly` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_source_stats_yearly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_template`
--

DROP TABLE IF EXISTS `data_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_template` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_template`
--

LOCK TABLES `data_template` WRITE;
/*!40000 ALTER TABLE `data_template` DISABLE KEYS */;
INSERT INTO `data_template` VALUES (1,'e6b434046f851853292fac0b514c7947','Local - Cacti Poller - Statistics'),(2,'7980e9b1409539abf815725d7c6728ba','Local - Cacti Poller -  Boost Statistics'),(3,'69a71738d7425cc911fba8d7b6df302a','Local - Cacti Poller - Item Statistics'),(4,'6912381baf16d9fb524ebbdaffe0dae8','Local - Cacti Poller - Recache Statistics'),(5,'0eddb382f3710ee3d1de28734ad2519c','Local - Cacti Poller - Boost Memory Statistics'),(6,'8b5a5d7963ff703ac57275b3bca99aa5','Local - Cacti - User Statistics'),(7,'bc1bbeab6ee28a5ba3e82834eab10277','Local - Cacti Poller - Export Graphs'),(8,'2d59c2529f7da926447ce23c1bd7ac03','Local - Cacti Poller - Export Duration'),(9,'ebb39b5767589493cacc2499b3749903','Cacti Stats - Syslog Activity'),(10,'e82c29e393bf507d2008f0e38dda3207','Cacti Stats - Syslog Runtime'),(11,'1a16ad2e6d8906c291cca30e65d639bb','Cacti Stats - Syslog Alerts/Reports'),(12,'789c0125513a2b036be3458b6962987f','Cacti Stats - Thold Runtime'),(13,'ba53784d505b9291ce669e931db1636a','Cacti Stats - Boost Average Row Size'),(14,'a709292afadb954d707e64aaae058d5c','Cacti Stats - Boost Records'),(15,'e4ee5be8ff17271aaee5021aea04fee1','Cacti Stats - Boost Table Size'),(16,'e200f1a5a3f1fcee859695c2fedb8abf','Cacti Stats - Boost Timing Detail'),(17,'b9b5bb0e16eed9ac05f321a2098cd865','Cacti Stats - Collector Time'),(18,'19c06196312997b1d630fb9dba10513b','Cacti Stats - Collector Items'),(19,'688d0ddfe876aafb261fa91bf6a66d7b','Cacti Stats - Collector Settings'),(20,'a44346d1525119a7d28c71503fd30ae2','Cacti Stats - Collector Recache Stats'),(21,'6d056e47e81b729d10854dd66e65ea2b','Cacti Stats - WebSeer Timing'),(22,'b3baa48be94a6e80831748f3e8e988bf','Cacti Stats - WebSeer Download Size'),(23,'452d871bae40fc3efce0a0f8ccf7d525','Cacti Stats - WebSeer Download Speed'),(24,'3a36e0538c6b25b30ebb6deda6dc9965','Cacti Stats - WebSeer Status'),(25,'10150b44b528614c46fe0a244c9d1fe4','Cacti Stats - Export Graphs'),(26,'7fc923d81fd11083628731e271c3fa6a','Cacti Stats - Export Duration'),(27,'e9def3a0e409f517cb804dfeba4ccd90','Cisco Router - 5 Minute CPU'),(28,'d9231d03b0a160ba8f3ec82a43c503e9','Device - Polling Time'),(29,'bb5b2aad7fd40afa8e35f62567d5c9c9','Device - Uptime'),(30,'6632e1e0b58a565c135d7ff90440c335','Interface - Traffic'),(31,'36335cd98633963a575b70639cd2fdad','Interface - Errors/Discards'),(32,'2f654f7d69ac71a5d56b1db8543ccad3','Interface - Unicast Packets'),(33,'c84e511401a747409053c90ba910d0fe','Interface - Non-Unicast Packets'),(34,'a30a81cb1de65b52b7da542c8df3f188','Unix - Ping Host'),(35,'d429e4a6019c91e6e84562593c1968ca','SNMP - Generic OID Template'),(36,'9b8c92d3c32703900ff7dd653bfc9cd8','Unix - Processes'),(37,'9e72511e127de200733eb502eb818e1d','Unix - Load Average'),(38,'c221c2164c585b6da378013a7a6a2c13','Unix - Logged in Users'),(39,'dc33aa9a8e71fb7c61ec0e7a6da074aa','Linux - Memory - Free'),(40,'41f55087d067142d702dd3c73c98f020','Linux - Memory - Free Swap'),(41,'e4ac6919d4f6f21ec5b281a1d6ac4d4e','Unix - Hard Drive Space'),(42,'9b82d44eb563027659683765f92c9757','Net-SNMP - Load Average - 1 Minute'),(43,'87847714d19f405ff3c74f3341b3f940','Net-SNMP - Load Average - 5 Minute'),(44,'308ac157f24e2763f8cd828a80b3e5ff','Net-SNMP - Load Average - 15 Minute'),(45,'797a3e92b0039841b52e441a2823a6fb','Net-SNMP - Memory - Buffers'),(46,'fa15932d3cab0da2ab94c69b1a9f5ca7','Net-SNMP - Memory - Free'),(47,'a274deec1f78654dca6c446ba75ebca4','Net-SNMP - Memory - Cache'),(48,'728f3b41490e37c1697b6567fb661571','Net-SNMP - Memory - Total'),(49,'2ef027cc76d75720ee5f7a528f0f1fda','Host MIB - Logged in Users'),(50,'f383db441d1c246cff8482f15e184e5f','Host MIB - Processes'),(51,'a62bcd64c0904d1e239a129f6e3d7edf','Net-SNMP - CPU - System'),(52,'95946b5f47886771421a40dcc2d6d13c','Net-SNMP - CPU - User'),(53,'565b2c6597b96995ecc93083e625d6bf','Net-SNMP - CPU - Idle'),(54,'5cd3c67ceec2e04bd4f9173b79ddbc3c','Net-SNMP - Interrupts'),(55,'430e64b44e8c906747d00d8390011cc2','Net-SNMP - Context Switches'),(56,'f459faf705e1dfa06a609d390e87d265','Net-SNMP - Combined SCSI Disk I/O'),(57,'4b809fe1bacb0f92c5cdc6d1346ed251','Net-SNMP - Combined SCSI Disk Bytes'),(58,'c8a8f50f5f4a465368222594c5709ede','Net-SNMP - Hard Drive Space'),(59,'d814fa3b79bd0f8933b6e0834d3f16d0','Host MIB - Hard Drive Space'),(60,'f6e7d21c19434666bbdac00ccef9932f','Host MIB - CPU Utilization'),(61,'520349abb0429ae09302de76d090204b','Net-SNMP - Device I/O'),(62,'78140452b512614e43776fc00f608bea','SNMP - Uptime(ticks)'),(63,'fd23bebc1dfcbd9e145546385a0e3990','Palo Alto - Session Utilization Percentage'),(64,'6b23ca4107b0cf4e9b95e38d60534b02','Palo Alto - Active Sessions'),(65,'b7566b731aba9526aa6ccab504db6ac5','Palo Alto - TCP Sessions'),(66,'e3c8edf91e65d74c84437e28c098bd80','Palo Alto - UDP Sessions'),(67,'2ba04ca23d407f6fe9417dedada7a54e','Palo Alto - ICMP Active'),(68,'040e42b4935b68145e58866a4f2f0aa2','Palo Alto - Utilization - DataPlane'),(69,'447af81e955cbc7d8c6a87e61e680752','Palo Alto - Utilzation - Mgmt Plane'),(70,'7f1b3923dd909420c2ed42f74f563fae','Palo Alto - Data Plane - PA-500'),(71,'ecb43647d1135658cc7c777ccf0f558c','Palo Alto - Management Plane - PA-500'),(72,'7541c414644dcc5a27f1fd84ee537d84','Interface - Multicast Packets'),(73,'fd841e8bb822927289b7acbc031f3d7e','Interface - Status'),(74,'4ff01ce8ca0dff31d60669cea6e40544','Fortigate - CPU'),(75,'2c5cbefab0ec074447d493be53bca3d6','Fortigate - SessionCount'),(76,'80f7d5d0f38db33d5ad27f6ad52dfe91','Fortigate - Memory Usage'),(77,'04ef4da0d125620474bcbb3a72c7356c','Advanced Ping'),(78,'9b71aed8a6a0469352e9708899f06b98','SNMP_Informant_Standard - CPU Stats'),(79,'cdd5bc77a8c868d50b679aa806a1d72d','SNMP_Informant_Standard - Disk Stats'),(80,'339ca02d83d140d23a27645bced22c66','SNMP_Informant_Standard - Disk Stats (%\'s)'),(81,'c569dcba5a966cec8ac697d3b0f6ede3','SNMP_Informant_Standard - Disk Stats (Metrics)'),(82,'c719e58e1f9eb4dde11f86ed92594a74','SNMP_Informant_Standard - Memory Stats (Usage)'),(83,'0d36e2e5894f98e6b9bc227a052a6192','SNMP_Informant_Standard - Memory Stats (Paging)'),(84,'70fc9711b5ca218c3f4e4a2e459b4a79','SNMP_Informant_Standard - Net Stats'),(85,'1d6ad5ea78c7479c757439cef34a05ba','SNMP_Informant_Standard - Net Stats (Packets)'),(86,'53c359529643adc8cb0e613125ff2340','SNMP_Informant_Standard - Object Statistics');
/*!40000 ALTER TABLE `data_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_template_data`
--

DROP TABLE IF EXISTS `data_template_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_template_data` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `local_data_template_data_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `local_data_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `data_template_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `data_input_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `t_name` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name_cache` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `data_source_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `t_active` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `active` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_rrd_step` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `rrd_step` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `t_data_source_profile_id` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `data_source_profile_id` mediumint(8) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `local_data_id` (`local_data_id`),
  KEY `data_template_id` (`data_template_id`),
  KEY `data_input_id` (`data_input_id`),
  KEY `name_cache` (`name_cache`(191))
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_template_data`
--

LOCK TABLES `data_template_data` WRITE;
/*!40000 ALTER TABLE `data_template_data` DISABLE KEYS */;
INSERT INTO `data_template_data` VALUES (1,0,0,1,13,'','Local - Cacti Poller - Statistics','','','','on','',60,'',3),(2,0,0,2,14,'','Local - Cacti Poller - Boost Statistics','','','','on','',60,'',3),(3,0,0,3,15,'','Local - Cacti Poller - Item Statistics','','','','on','',60,'',3),(4,0,0,4,16,'','Local - Cacti Poller - Recache Statistics','','','','on','',60,'',3),(5,0,0,5,17,'','Local - Cacti Poller - Boost Memory Statistics','','','','on','',60,'',3),(6,0,0,6,18,'','Cacti User Statistics','','','','on','',60,'',3),(7,0,0,7,19,'','Local - Cacti Poller - Export Graphs','','','','on','',60,'',3),(8,0,0,8,20,'','Local - Cacti Poller - Export Duration','','','','on','',60,'',3),(9,0,0,9,21,'','Cacti Stats - Syslog Activity','','','','on','',60,'',3),(10,0,0,10,22,'','Cacti Stats - Syslog Runtime','','','','on','',60,'',3),(11,0,0,11,21,'','Cacti Stats - Sylog Alerts/Reports','','','','on','',60,'',3),(12,0,0,12,23,'','Cacti Stats - Thold Runtime','','','','on','',60,'',3),(13,0,0,13,24,'','Cacti Stats - Boost Average Row Size','','','','on','',60,'',3),(14,0,0,14,25,'','Cacti Stats - Boost Records','','','','on','',60,'',3),(15,0,0,15,26,'','Cacti Stats - Boost Table Size','','','','on','',60,'',3),(16,0,0,16,27,'','Cacti Stats - Boost Timing Detail','','','','on','',60,'',3),(17,0,0,17,12,'','|query_pollerName| - Collector Time','','','','on','',60,'',3),(18,0,0,18,12,'','|query_pollerName| - Collector Items','','','','on','',60,'',3),(19,0,0,19,12,'','|query_pollerName| - Collector Setings','','','','on','',60,'',3),(20,0,0,20,12,'','Cacti Stats - |query_pollerName| - Collector Recache Stats','','','','on','',60,'',3),(21,0,0,21,12,'','WebSeer - |query_webseerName| - Timing','','','','on','',60,'',3),(22,0,0,22,12,'','WebSeer - |query_webseerName| - Download Size','','','','on','',60,'',3),(23,0,0,23,12,'','WebSeer - |query_webseerName| - Download Speed','','','','on','',60,'',3),(24,0,0,24,12,'','WebSeer - |query_webseerName| - Status','','','','on','',60,'',3),(25,0,0,25,12,'','|query_exportName| - Exported Graphs','','','','on','',60,'',3),(26,0,0,26,12,'','|query_exportName| - Export Duration','','','','on','',60,'',3),(27,0,0,27,1,'','|host_description| - 5 Minute CPU','','','','on','',60,'',3),(28,0,0,28,28,'','|host_description| - Polling Time','','','','on','',60,'',3),(29,0,0,29,29,'','|host_description| - Uptime','','','','on','',60,'',3),(30,0,0,30,2,'on','|host_description| - Traffic','','','','on','',60,'',3),(31,0,0,31,2,'on','|host_description| - Errors/Discards','','','','on','',60,'',3),(32,0,0,32,2,'on','|host_description| - Unicast Packets','','','','on','',60,'',3),(33,0,0,33,2,'on','|host_description| - Non-Unicast Packets','','','','on','',60,'',3),(34,0,0,34,10,'','|host_description| - Ping Host','','','','on','',60,'',3),(35,0,0,35,1,'on','|host_description| -','','','','on','',60,'',3),(36,0,0,36,7,'','|host_description| - Processes','','','','on','',60,'on',3),(37,0,0,37,4,'','|host_description| - Load Average','','','','on','',60,'',3),(38,0,0,38,5,'','|host_description| - Logged in Users','','','','on','',60,'',3),(39,0,0,39,6,'','|host_description| - Memory - Free','','','','on','',60,'',3),(40,0,0,40,6,'','|host_description| - Memory - Free Swap','','','','on','',60,'',3),(41,0,0,41,11,'on','|host_description| - Hard Drive Space','','','','on','',60,'',3),(42,0,0,42,1,'','|host_description| - Load Average - 1 Minute','','','','on','',60,'',3),(43,0,0,43,1,'','|host_description| - Load Average - 5 Minute','','','','on','',60,'',3),(44,0,0,44,1,'','|host_description| - Load Average - 15 Minute','','','','on','',60,'',3),(45,0,0,45,1,'','|host_description| - Memory - Buffers','','','','on','',60,'',3),(46,0,0,46,1,'','|host_description| - Memory - Free','','','','on','',60,'',3),(47,0,0,47,1,'','|host_description| - Memory - Cache','','','','on','',60,'',3),(48,0,0,48,1,'','|host_description| - Memory - Total','','','','on','',60,'',3),(49,0,0,49,1,'','|host_description| - Logged in Users','','','','on','',60,'',3),(50,0,0,50,1,'','|host_description| - Processes','','','','on','',60,'',3),(51,0,0,51,1,'','|host_description| - CPU - System','','','','on','',60,'',3),(52,0,0,52,1,'','|host_description| - CPU - User','','','','on','',60,'',3),(53,0,0,53,1,'','|host_description| - CPU - Idle','','','','on','',60,'',3),(54,0,0,54,1,'','|host_description| - Interrupts','','','','on','',60,'',3),(55,0,0,55,1,'','|host_description| - Context Switches','','','','on','',60,'',3),(56,0,0,56,30,'','|host_description| - Combined SCSI Disk I/O','','','','on','',60,'',3),(57,0,0,57,31,'','|host_description| - Combined SCSI Disk Bytes','','','','on','',60,'',3),(58,0,0,58,2,'on','|host_description| - Hard Drive Space','','','','on','',60,'',3),(59,0,0,59,12,'','|host_description| - Hard Drive Space','','','','on','',60,'',3),(60,0,0,60,12,'','|host_description| - CPU Utilization','','','','on','',60,'on',3),(61,0,0,61,2,'','|host_description| - Device I/O -|query_diskIODevice|','','','','on','',60,'',3),(62,36,1,36,7,NULL,'|host_description| - Processes','Cacti-Template - Processes','<path_rra>/local_linux_machine_proc_1.rrd','','on','',60,'',3),(63,37,2,37,4,NULL,'|host_description| - Load Average','Cacti-Template - Load Average','<path_rra>/local_linux_machine_load_1min_2.rrd','','on','',60,'',3),(64,38,3,38,5,NULL,'|host_description| - Logged in Users','Cacti-Template - Logged in Users','<path_rra>/local_linux_machine_users_3.rrd','','on','',60,'',3),(65,39,4,39,6,NULL,'|host_description| - Memory - Free','Cacti-Template - Memory - Free','<path_rra>/local_linux_machine_mem_buffers_4.rrd','','on','',60,'',3),(66,40,5,40,6,NULL,'|host_description| - Memory - Free Swap','Cacti-Template - Memory - Free Swap','<path_rra>/local_linux_machine_mem_swap_5.rrd','','on','',60,'',3),(67,0,0,62,1,'on','|host_description| - Uptime(ticks)','','','','on','',60,'',3),(68,0,0,63,1,'on','|host_description| - Session Util %','','','','on','',60,'',3),(69,0,0,64,1,'on','|host_description| - Active Sessions','','','','on','',60,'',3),(70,0,0,65,1,'','|host_description| - TCP Sessions','','','','on','',60,'',3),(71,0,0,66,1,'','|host_description| - UDP Sessions','','','','on','',60,'',3),(72,0,0,67,1,'','|host_description| - ICMP Sessions','','','','on','',60,'',3),(73,0,0,68,1,'','|host_description| - Utilization - DataPlane','','','','on','',60,'',3),(74,0,0,69,1,'','|host_description| - Utilization - Mgmt Plane','','','','on','',60,'',3),(75,0,0,70,1,'on','|host_description| - Data Plane Temperature','','','','on','',60,'',3),(76,0,0,71,1,'on','|host_description| - Management Plane Temperature','','','','on','',60,'',3),(77,0,0,72,2,'on','|host_description| - Multicast Packets','','','','on','',60,'',3),(78,0,0,73,2,'on','|host_description| - Interface status','','','','on','',60,'',3),(79,0,0,74,1,'','|host_description| - 5 Minute CPU','','','','on','',60,'',3),(80,0,0,75,1,'','|host_description| - SessionCount','','','','on','',60,'',3),(81,0,0,76,1,'','|host_description| - Memory Usage','','','','on','',60,'',3),(82,0,0,77,32,'','|host_description| -  Advanced Ping','','','','on','',60,'',3),(83,0,0,78,2,'on','|host_description| - CPU Stats - |query_cpuInstance|','','','','on','',60,'',3),(84,0,0,79,2,'on','|host_description| - Disk Stats - |query_lDiskInstance|','','','','on','',60,'',3),(85,0,0,80,2,'on','|host_description| - Disk Stats (%\'s) |query_lDiskInstance|','','','','on','',60,'',3),(86,0,0,81,2,'on','|host_description| - Disk Stats (Metrics) - |query_lDiskInstance|','','','','on','',60,'',3),(87,0,0,82,2,'on','|host_description| - Memory Stats (Usage)','','','','on','',60,'',3),(88,0,0,83,2,'on','|host_description| - Memory Stats (Paging)','','','','on','',60,'',3),(89,0,0,84,2,'on','|host_description| - Net Stats - |query_netInstance|','','','','on','',60,'',3),(90,0,0,85,2,'on','|host_description| - Net Stats (Packets) - |query_netInstance|','','','','on','',60,'',3),(91,0,0,86,2,'on','|host_description| - Object Statistics','','','','on','',60,'',3),(92,82,6,77,32,NULL,'|host_description| -  Advanced Ping','Cacti-Template -  Advanced Ping','<path_rra>/cacti-template_loss_6.rrd','','on','',60,'',3),(93,41,7,41,11,NULL,'|host_description| - Free Space - |query_dskDevice|','Cacti-Template - Free Space - /dev/mapper/centos-root','<path_rra>/cacti-template_hdd_free_7.rrd','','on','',60,'',3),(94,1,8,1,13,NULL,'Local - Cacti Poller - Statistics','Local - Cacti Poller - Statistics','<path_rra>/cacti-template_rrdsprocessed_8.rrd','','on','',60,'',3),(95,1,9,1,13,NULL,'Local - Cacti Poller - Statistics','Local - Cacti Poller - Statistics','<path_rra>/cacti-template_rrdsprocessed_9.rrd','','on','',60,'',3),(96,2,10,2,14,NULL,'Local - Cacti Poller - Boost Statistics','Local - Cacti Poller - Boost Statistics','<path_rra>/cacti-template_time_10.rrd','','on','',60,'',3),(97,3,11,3,15,NULL,'Local - Cacti Poller - Item Statistics','Local - Cacti Poller - Item Statistics','<path_rra>/cacti-template_snmp_11.rrd','','on','',60,'',3),(98,4,12,4,16,NULL,'Local - Cacti Poller - Recache Statistics','Local - Cacti Poller - Recache Statistics','<path_rra>/cacti-template_hosts_12.rrd','','on','',60,'',3),(99,1,13,1,13,NULL,'Local - Cacti Poller - Statistics','Local - Cacti Poller - Statistics','<path_rra>/cacti-template_rrdsprocessed_13.rrd','','on','',60,'',3),(100,5,14,5,17,NULL,'Local - Cacti Poller - Boost Memory Statistics','Local - Cacti Poller - Boost Memory Statistics','<path_rra>/cacti-template_boost_peak_memory_14.rrd','','on','',60,'',3),(101,6,15,6,18,NULL,'Cacti User Statistics','Cacti User Statistics','<path_rra>/cacti-template_active_15.rrd','','on','',60,'',3),(102,6,16,6,18,NULL,'Cacti User Statistics','Cacti User Statistics','<path_rra>/cacti-template_active_16.rrd','','on','',60,'',3),(103,6,17,6,18,NULL,'Cacti User Statistics','Cacti User Statistics','<path_rra>/cacti-template_active_17.rrd','','on','',60,'',3),(104,2,18,2,14,NULL,'Local - Cacti Poller - Boost Statistics','Local - Cacti Poller - Boost Statistics','<path_rra>/cacti-template_time_18.rrd','','on','',60,'',3),(105,1,19,1,13,NULL,'Local - Cacti Poller - Statistics','Local - Cacti Poller - Statistics','<path_rra>/cacti-template_rrdsprocessed_19.rrd','','on','',60,'',3),(106,7,20,7,19,NULL,'Local - Cacti Poller - Export Graphs','Local - Cacti Poller - Export Graphs','<path_rra>/cacti-template_exportgraphs_20.rrd','','on','',60,'',3),(107,8,21,8,20,NULL,'Local - Cacti Poller - Export Duration','Local - Cacti Poller - Export Duration','<path_rra>/cacti-template_exportduration_21.rrd','','on','',60,'',3),(108,9,22,9,21,NULL,'Cacti Stats - Syslog Activity','Cacti Stats - Syslog Activity','<path_rra>/cacti-template_incoming_22.rrd','','on','',60,'',3),(109,10,23,10,22,NULL,'Cacti Stats - Syslog Runtime','Cacti Stats - Syslog Runtime','<path_rra>/cacti-template_syslogruntime_23.rrd','','on','',60,'',3),(110,11,24,11,21,NULL,'Cacti Stats - Sylog Alerts/Reports','Cacti Stats - Sylog Alerts/Reports','<path_rra>/cacti-template_alerts_24.rrd','','on','',60,'',3),(111,12,25,12,23,NULL,'Cacti Stats - Thold Runtime','Cacti Stats - Thold Runtime','<path_rra>/cacti-template_tholdruntime_25.rrd','','on','',60,'',3),(112,13,26,13,24,NULL,'Cacti Stats - Boost Average Row Size','Cacti Stats - Boost Average Row Size','<path_rra>/cacti-template_boost_avg_size_26.rrd','','on','',60,'',3),(113,14,27,14,25,NULL,'Cacti Stats - Boost Records','Cacti Stats - Boost Records','<path_rra>/cacti-template_boost_records_27.rrd','','on','',60,'',3),(114,15,28,15,26,NULL,'Cacti Stats - Boost Table Size','Cacti Stats - Boost Table Size','<path_rra>/cacti-template_boost_table_28.rrd','','on','',60,'',3),(115,16,29,16,27,NULL,'Cacti Stats - Boost Timing Detail','Cacti Stats - Boost Timing Detail','<path_rra>/cacti-template_rrd_delete_29.rrd','','on','',60,'',3);
/*!40000 ALTER TABLE `data_template_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_template_rrd`
--

DROP TABLE IF EXISTS `data_template_rrd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_template_rrd` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `local_data_template_rrd_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `local_data_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `data_template_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `t_rrd_maximum` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rrd_maximum` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `t_rrd_minimum` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rrd_minimum` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `t_rrd_heartbeat` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rrd_heartbeat` mediumint(6) NOT NULL DEFAULT 0,
  `t_data_source_type_id` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_source_type_id` smallint(5) NOT NULL DEFAULT 0,
  `t_data_source_name` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_source_name` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `t_data_input_field_id` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_input_field_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `duplicate_dsname_contraint` (`local_data_id`,`data_source_name`,`data_template_id`),
  KEY `local_data_id` (`local_data_id`),
  KEY `data_template_id` (`data_template_id`),
  KEY `local_data_template_rrd_id` (`local_data_template_rrd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_template_rrd`
--

LOCK TABLES `data_template_rrd` WRITE;
/*!40000 ALTER TABLE `data_template_rrd` DISABLE KEYS */;
INSERT INTO `data_template_rrd` VALUES (1,'e96673b4ff97d0e0127c71726c86d2db',0,0,1,'','U','','0','',120,'',1,'','RRDsProcessed','',47),(2,'878803580685cc6b6174a7864fe0fd07',0,0,1,'','U','','0','',120,'',1,'','DataSources','',48),(3,'d107e27befbe4a1fc861f4f97a0f363e',0,0,1,'','U','','0','',120,'',1,'','HostsPerProcess','',49),(4,'dfe4825f22716f75cbfd7e636ae232ac',0,0,1,'','U','','0','',120,'',1,'','Hosts','',50),(5,'0532007849f0e7ff7c16e250125aa847',0,0,1,'','100','','0','',120,'',1,'','Threads','',51),(6,'1d2d7bb2353049b46e4002b9e1495805',0,0,1,'','100','','0','',120,'',1,'','Processes','',52),(7,'5d041918ba1a17fd0a3d569c9f4dc135',0,0,1,'','300','','0','',120,'',1,'','Time','',53),(8,'f88a8c6783c762809f3eb50f19b633ca',0,0,2,'','U','','0','',120,'',1,'','time','',54),(9,'c71c1d51aa3bc0fe6038c1573f2a4f3f',0,0,2,'','U','','0','',120,'',1,'','rrdupdates','',55),(10,'ea735e5f7fa1765712d3d76e18f3eae3',0,0,3,'','U','','0','',120,'',1,'','snmp','',56),(11,'4309fc495d6732710867064a807ec57e',0,0,3,'','U','','0','',120,'',1,'','script','',57),(12,'bae82932239be2a7719199a94630295b',0,0,3,'','U','','0','',120,'',1,'','script_server','',58),(13,'53c6dd5e737bc8d8d40464f5dfae6742',0,0,4,'','U','','0','',120,'',1,'','hosts','',60),(14,'2618aebd09137e5fd909fc18eb5b0cde',0,0,4,'','U','','0','',120,'',1,'','time','',59),(15,'2cd9f4d9c5c2cfbf030b0e88a406cdcb',0,0,5,'','U','','0','',120,'',1,'','boost_peak_memory','',61),(16,'836b76b477ece34ef1d94272b1eb55eb',0,0,6,'','1000','','0','',120,'',1,'','active','',64),(17,'4637649e759fbdcdd92c34c9cdb8581e',0,0,6,'','1000','','0','',120,'',1,'','garbage','',66),(18,'8d663e63560701867485fcbdc05fbc1d',0,0,6,'','1000','','0','',120,'',1,'','valid','',62),(19,'fa5a4e08a3784bda350690d1955df4c5',0,0,6,'','1000','','0','',120,'',1,'','sleeping','',65),(20,'84c73f2fe39d1b0be26400aaf26359f3',0,0,6,'','1000','','0','',120,'',1,'','usleeping','',68),(21,'0ed8f3e8db5dbb151d49e2b57fb4d180',0,0,6,'','1000','','0','',120,'',1,'','uactive','',67),(22,'f6c474da45d8316158a600ef9c1c8d65',0,0,6,'','1000','','0','',120,'',1,'','invalid','',63),(23,'3f624c1aa46a5d8d8bd2ca865a44efe1',0,0,7,'','U','','0','',120,'',1,'','ExportGraphs','',69),(24,'3cb86d927fcc4f4249ccf15665201ff1',0,0,8,'','U','','0','',120,'',1,'','ExportDuration','',70),(25,'98b6a387686ac3090ac487598450166f',0,0,9,'','U','','0',NULL,600,'',1,'','incoming','',72),(26,'cb1b8aa1ad45375a6394a13d5456f6af',0,0,9,'','U','','0',NULL,600,'',1,'','deletes','',71),(27,'c9c6b631656b31aa83c8da990abb1ed1',0,0,9,'','U','','0',NULL,600,'',1,'','alarms','',76),(28,'c464bb7170d36d627699da3937146c74',0,0,9,'','U','','0',NULL,600,'',1,'','removes','',73),(29,'d0181d4252e2770d878dff2d9e1e44a9',0,0,9,'','U','','0',NULL,600,'',1,'','xfers','',74),(30,'ffa3c635a9480a67cc248261280fee76',0,0,10,'','U','','0',NULL,600,'',1,'','syslogRuntime','',78),(31,'0943367dc4441a5d1fe3318c0286b85b',0,0,11,'','U','','0',NULL,600,'',1,'','alerts','',75),(32,'b5bb959cbecaf827e3cc1c788c5158f6',0,0,11,'','U','','0',NULL,600,'',1,'','reports','',77),(33,'575608ece0aadd85775b33b2659a5880',0,0,12,'','U','','0',NULL,600,'',1,'','tholdRuntime','',79),(34,'0f1e73889af22930db308bf0cc3cd0a0',0,0,13,'','U','','0','',600,'',1,'','boost_avg_size','',80),(35,'84bbf9ee3a2ae1eaf0db2a019231ea9a',0,0,14,'','U','','0','',600,'',1,'','boost_records','',81),(36,'8874c6f36a4fe415729464996550a931',0,0,15,'','U','','0','',600,'',1,'','boost_table','',82),(37,'96321182f0b87f173d1d28cb01e33f1f',0,0,16,'','U','','0','',600,'',1,'','rrd_delete','',88),(38,'b776ee1a06961f969a862cffcf2cd6a7',0,0,16,'','U','','0',NULL,600,'',1,'','rrd_get_records','',83),(39,'223a17c021a4a180c68250d3988080d5',0,0,16,'','U','','0',NULL,600,'',1,'','rrd_lastupdate','',86),(40,'9b58d296dcc55185d85b7c4e647f9340',0,0,16,'','U','','0',NULL,600,'',1,'','rrd_results_cycle','',84),(41,'39897bc24b0f2053d7a406541c69d651',0,0,16,'','U','','0',NULL,600,'',1,'','rrd_template','',85),(42,'f8dc4c21582804b2075b7f688d884991',0,0,16,'','U','','0',NULL,600,'',1,'','rrd_update','',87),(43,'71e1d3bb9ce51f3589b97944858d6d36',0,0,17,'','U','','0',NULL,600,'',1,'','pollerTime','',0),(44,'fa901e0b6b39b012148f3af848e17138',0,0,17,'','U','','0',NULL,600,'',1,'','maxTime','',0),(45,'5eb5afe7b887da336e91b40a1d9dfd35',0,0,17,'','U','','0',NULL,600,'',1,'','minTime','',0),(46,'7a9101b7416c095512bb386e066e9d26',0,0,17,'','U','','0',NULL,600,'',1,'','avgTime','',0),(47,'dccb84135c4398850648f660d0ba9b95',0,0,18,'','U','','0',NULL,600,'',1,'','getSNMP','',0),(48,'4b28fded5fc45449154b51372ab14702',0,0,18,'','U','','0',NULL,600,'',1,'','getScript','',0),(49,'72a92c1b6f319e1bb1446bf9ce03a56d',0,0,18,'','U','','0',NULL,600,'',1,'','getScriptServer','',0),(50,'2f24d087eda2fd6f0411e3bb3a0554a5',0,0,19,'','U','','0',NULL,600,'',1,'','threadCount','',0),(51,'19875e8c7320c733d070db08e1892fc3',0,0,19,'','U','','0',NULL,600,'',1,'','processCount','',0),(52,'f9a15e3fb9ea92d097ba6cdb6166b45f',0,0,20,'','U','','0','',600,'',1,'','recacheDevices','',0),(53,'df73b613c8415809ce4b0163abcfabf0',0,0,20,'','U','','0','',600,'',1,'','recacheTime','',0),(54,'72b0a00e93f7e0af991cb2391111fe9d',0,0,21,'','U','','0','',600,'',1,'','redirectTime','',0),(55,'e64ff1388b23b7513e7552a24554b3c6',0,0,21,'','U','','0','',600,'',1,'','totalTime','',57),(56,'2efcce5e14413e8af2becfe0c27f22ab',0,0,21,'','U','','0','',600,'',1,'','connectTime','',0),(57,'67e42a7791d6f999206e6cf326a57a6d',0,0,21,'','U','','0',NULL,600,'',1,'','lookupTime','',0),(58,'4d92996d3e8a84abf8810093b2d5ed42',0,0,22,'','U','','0','',600,'',1,'','downloadSize','',0),(59,'c23245987b9310cb4f538cf44dd99742',0,0,23,'','U','','0','',600,'',1,'','downloadSpeed','',0),(60,'941ad2fce8ea3fc7f77959b45b175f4a',0,0,24,'','U','','0','',600,'',1,'','checkStatus','',0),(61,'74c7ddbfab5db5cc22f6193bd06c6d39',0,0,25,'','U','','0',NULL,600,'',1,'','totalGraphs','',0),(62,'aca40cd58112e6c3c0b24d99c8f6a0b9',0,0,26,'','U','','0',NULL,600,'',1,'','lastRuntime','',0),(63,'3c0fd1a188b64a662dfbfa985648397b',0,0,27,'','100','','0','',600,'',1,'','5min_cpu','',0),(64,'d87746b98b16ec2380f2dfa878a11a87',0,0,28,'','U','','0',NULL,600,'',1,'','polling_time','',90),(65,'1330cb9379c39216c4c26b5457a3b1bd',0,0,29,'','U','','0',NULL,600,'',1,'','uptime','',92),(66,'2df25c57022b0c7e7d0be4c035ada1a0',0,0,30,'on','100000000','','0','',120,'',2,'','traffic_in','',0),(67,'721c0794526d1ac1c359f27dc56faa49',0,0,30,'on','100000000','','0','',120,'',2,'','traffic_out','',0),(68,'c802e2fd77f5b0a4c4298951bf65957c',0,0,31,'','10000000','','0','',120,'',2,'','errors_in','',0),(69,'4e2a72240955380dc8ffacfcc8c09874',0,0,31,'','10000000','','0','',120,'',2,'','discards_in','',0),(70,'13ebb33f9cbccfcba828db1075a8167c',0,0,31,'','10000000','','0','',120,'',2,'','discards_out','',0),(71,'31399c3725bee7e09ec04049e3d5cd17',0,0,31,'','10000000','','0','',120,'',2,'','errors_out','',0),(72,'636672962b5bb2f31d86985e2ab4bdfe',0,0,32,'','1000000000','','0','',120,'',2,'','unicast_in','',0),(73,'18ce92c125a236a190ee9dd948f56268',0,0,32,'','1000000000','','0','',120,'',2,'','unicast_out','',0),(74,'7be68cbc4ee0b2973eb9785f8c7a35c7',0,0,33,'','1000000000','','0','',120,'',2,'','nonunicast_out','',0),(75,'93e2b6f59b10b13f2ddf2da3ae98b89a',0,0,33,'','1000000000','','0','',120,'',2,'','nonunicast_in','',0),(76,'962fd1994fe9cae87fb36436bdb8a742',0,0,34,'','U','','0','',600,'',1,'','ping','',30),(77,'224b83ea73f55f8a861bcf4c9bea0472',0,0,35,'on','U','','0','',600,'on',1,'','snmp_oid','',0),(78,'f1ba3a5b17b95825021241398bb0f277',0,0,36,'','U','','0','',600,'',1,'','proc','',24),(79,'8175ca431c8fe50efff5a1d3ae51b55d',0,0,37,'','U','','0','',600,'',1,'','load_1min','',17),(80,'a2eeb8acd6ea01cd0e3ac852965c0eb6',0,0,37,'','U','','0','',600,'',1,'','load_5min','',18),(81,'9f951b7fb3b19285a411aebb5254a831',0,0,37,'','U','','0','',600,'',1,'','load_15min','',19),(82,'46a5afe8e6c0419172c76421dc9e304a',0,0,38,'','U','','0','',600,'',1,'','users','',21),(83,'a4df3de5238d3beabee1a2fe140d3d80',0,0,39,'','U','','0','',600,'',1,'','mem_buffers','',23),(84,'7fea6acc9b1a19484b4cb4cef2b6c5da',0,0,40,'','U','','0','',600,'',1,'','mem_swap','',23),(85,'4c82df790325d789d304e6ee5cd4ab7d',0,0,41,'','U','','0','',600,'',1,'','hdd_free','',0),(86,'07175541991def89bd02d28a215f6fcc',0,0,41,'','U','','0','',600,'',1,'','hdd_used','',0),(87,'ed44c2438ef7e46e2aeed2b6c580815c',0,0,42,'','U','','0','',600,'',1,'','load_1min','',0),(88,'9b3a00c9e3530d9e58895ac38271361e',0,0,43,'','U','','0','',600,'',1,'','load_5min','',0),(89,'6746c2ed836ecc68a71bbddf06b0e5d9',0,0,44,'','U','','0','',600,'',1,'','load_15min','',0),(90,'9835d9e1a8c78aa2475d752e8fa74812',0,0,45,'','U','','0','',600,'',1,'','mem_buffers','',0),(91,'9c78dc1981bcea841b8c827c6dc0d26c',0,0,46,'','U','','0','',600,'',1,'','mem_free','',0),(92,'7a6ca455bbeff99ca891371bc77d5cf9',0,0,47,'','U','','0','',600,'',1,'','mem_cache','',0),(93,'129128c4c4769a74adfccf3bfa2eac32',0,0,48,'','U','','0',NULL,600,'',1,'','mem_total','',0),(94,'9464c91bcff47f23085ae5adae6ab987',0,0,49,'','U','','0','',600,'',1,'','users','',0),(95,'50ccbe193c6c7fc29fb9f726cd6c48ee',0,0,50,'','U','','0','',600,'',1,'','proc','',0),(96,'f7fc3e802831391ccd92c05b680da27c',0,0,51,'','U','','0','',600,'',1,'','ssCpuSystem','',0),(97,'93d64a9d12a9929013cd9e970a5d333c',0,0,52,'','U','','0','',600,'',1,'','ssCpuUser','',0),(98,'3d13e790d0eedbeaa9601dcd8c49be31',0,0,53,'','U','','0','',600,'',1,'','ssCpuIdle','',0),(99,'6f3c1f1706df1e20976bd5d616f63d1d',0,0,54,'','U','','0','',600,'on',1,'','ssSysInterrupts','',0),(100,'4faab1acdeb03e2bad23d3b80cf9455f',0,0,55,'','U','','0','',600,'',1,'','ssSysContext','',0),(101,'9a925659fc657e446d8623fae0ee9bfa',0,0,56,'','U','','0','',600,'',1,'','reads','',94),(102,'67f8e5f269e7d77818cdb11a9639b561',0,0,56,'','U','','0','',600,'',1,'','writes','',95),(103,'1e2ceb5261d92b3b668b1b8b6c1c4d5f',0,0,57,'','U','','0','',600,'',1,'','bytesread','',97),(104,'dc830e6d271690a7d323199b00b09836',0,0,57,'','U','','0','',600,'',1,'','byteswritten','',98),(105,'2d53f9c76767a2ae8909f4152fd473a4',0,0,58,'','U','','0','',600,'',1,'','hdd_free','',0),(106,'93d91aa7a3cc5473e7b195d5d6e6e675',0,0,58,'','U','','0','',600,'',1,'','hdd_used','',0),(107,'0ee6bb54957f6795a5369a29f818d860',0,0,59,'','U','','0','',600,'',1,'','hdd_used','',0),(108,'165a0da5f461561c85d092dfe96b9551',0,0,59,'','U','','0','',600,'',1,'','hdd_total','',0),(109,'9825aaf7c0bdf1554c5b4b86680ac2c0',0,0,60,'','U','','0','',600,'',1,'','cpu','',0),(110,'bd02243964326257af313861ed5dbd68',0,0,61,'','0','','0','',600,'',2,'','Device_Reads','',0),(111,'0810b7d392b044e5947e324942a6c6dc',0,0,61,'','0','','0','',600,'',2,'','Bytes_Written','',0),(112,'5caf6f213e9e828efc9f8f9b2ed76d3d',0,0,61,'','0','','0','',600,'',2,'','Device_Writes','',0),(113,'15f554db4748ed584449fe6d3cddb38e',0,0,61,'','100','','0','',600,'',1,'','1Min_LoadAvg','',0),(114,'c7d3c107a9598f2a1209ed0fccd2527c',0,0,61,'','100','','0','',600,'',1,'','5Min_LoadAvg','',0),(115,'8aa93b5eb1db402622935784e9bce232',0,0,61,'','100','','0','',600,'',1,'','15Min_LoadAvg','',0),(116,'569d9564a56dfe030df1fec5b596a6eb',0,0,61,'','0','','0','',600,'',2,'','Bytes_Read','',0),(117,'',78,1,36,NULL,'U',NULL,'0',NULL,600,NULL,1,NULL,'proc',NULL,24),(118,'',79,2,37,NULL,'U',NULL,'0',NULL,600,NULL,1,NULL,'load_1min',NULL,17),(119,'',80,2,37,NULL,'U',NULL,'0',NULL,600,NULL,1,NULL,'load_5min',NULL,18),(120,'',81,2,37,NULL,'U',NULL,'0',NULL,600,NULL,1,NULL,'load_15min',NULL,19),(121,'',82,3,38,NULL,'U',NULL,'0',NULL,600,NULL,1,NULL,'users',NULL,21),(122,'',83,4,39,NULL,'U',NULL,'0',NULL,600,NULL,1,NULL,'mem_buffers',NULL,23),(123,'',84,5,40,NULL,'U',NULL,'0',NULL,600,NULL,1,NULL,'mem_swap',NULL,23),(124,'7e8ccfaf90ba0b291bdec84ffe47003e',0,0,62,'','4000000000','','0','',120,'',1,'','uptime','',0),(125,'d4a555a8097546ae748628b1ef596f3a',0,0,63,'','100','','0','',120,'',1,'','pan_ses_util','',0),(126,'a6b2c6eacb9457db46e5b3a40cbf923f',0,0,64,'','U','','0','',120,'',1,'','pan_ses_act','',0),(127,'5219f1876be93a73a72e7a3259e1956b',0,0,65,'','U','','0','',120,'',1,'','pan_ses_tcp','',0),(128,'6209b7087cb3b93e3fb78b489e0e0aeb',0,0,66,'','U','','0','',120,'',1,'','pan_ses_udp','',0),(129,'49b60430cefb8564d18645277105e59a',0,0,67,'','U','','0','',120,'',1,'','pan_ses_icmp','',0),(130,'efb209e95117ba9966f63b9aefa4f375',0,0,68,'','100','','0','',120,'',1,'','pa_load_dp','',0),(131,'6d35042b8064ecf88d5e16da6adf117c',0,0,69,'','100','','0','',120,'',1,'','pa_load_mp','',0),(132,'dab00735f3e0a3a5571867771df7f84c',0,0,70,'','U','','0','',120,'',1,'','pan_cpu_temp','',0),(133,'e19edf1e064dc3360f86f9e6c6a44606',0,0,71,'','U','','0','',120,'',1,'','pan_board_temp','',0),(134,'a30b5af13aeca4f4d4c676e7bf7afc6f',0,0,72,'','1000000000','','0','',120,'',2,'','multicast_in','',0),(135,'ac4330a453867938043e71d027d0e661',0,0,72,'','1000000000','','0','',120,'',2,'','multicast_out','',0),(136,'16f0a62ef0724d6f2817d77cbc065323',0,0,73,'','U','','0','',120,'',1,'','int_status','',0),(137,'cdc6f3176e482125067942beecc9ea33',0,0,74,'','100','','0','',120,'',1,'','5min_cpu','',0),(138,'8dc290fc3b2cdead62001836d6324dd7',0,0,75,'','100','','0','',120,'',1,'','SessionCount','',0),(139,'b3e615514da015a0bddf4fa6ef13c044',0,0,76,'','536870912','','0','',120,'',1,'','mem','',0),(140,'7d463038911077b759e662d1d3b399ed',0,0,77,'','100','','0','',120,'',1,'','loss','',107),(141,'cd17c680d33f47f54a5d2bcda4fbfbf0',0,0,77,'','5000','','0','',120,'',1,'','min','',103),(142,'66f673792256a3ea04ec9961eba47fb5',0,0,77,'','5000','','0','',120,'',1,'','avg','',104),(143,'be2761605f59f3eba221a28c088efb73',0,0,77,'','5000','','0','',120,'',1,'','max','',105),(144,'5d834e3d35e2c980126cd2a14e89ab6d',0,0,77,'','5000','','0','',120,'',1,'','dev','',106),(145,'5e65dbd99f322137e7dd0dd44a3eb675',0,0,78,'','U','','0','',120,'',1,'','cpuDPCRate','',0),(146,'81e0a55c7418036c1caf6c38c94d1763',0,0,78,'','U','','0','',120,'',1,'','cpuDPCsQueuedPerSec','',0),(147,'53424d20a1a5ef4dd64a11f9fb1bdcf1',0,0,78,'','U','','0','',120,'',1,'','cpuInterruptsPerSec','',0),(148,'9ab500e6ed149e232093a4bb87b5fb4f',0,0,78,'','100','','0','',120,'',1,'','cpuPercentDPCTime','',0),(149,'c1efe69535db055384b82f2d6c28dc5f',0,0,78,'','100','','0','',120,'',1,'','cpuPercentInterrupt','',0),(150,'804572b8dfebe873c52533995619978d',0,0,78,'','100','','0','',120,'',1,'','cpuPercentPriv','',0),(151,'358513796a56382830e239bc3ac77d28',0,0,78,'','100','','0','',120,'',1,'','cpuPercentProcessor','',0),(152,'151fc16ef81ee297a28f93e4efb70721',0,0,78,'','100','','0','',120,'',1,'','cpuPercentUserTime','',0),(153,'53c0c368d67c6d82fe17827653be952e',0,0,79,'','U','','0','',120,'',1,'','DiskWriteBytesPerSe','',0),(154,'637849597a0beb8b598b35b4b9032b45',0,0,79,'','U','','0','',120,'',1,'','DiskReadBytesPerSec','',0),(155,'2651e3644fa731186c9af0977a8105af',0,0,79,'','U','','0','',120,'',1,'','DiskBytesPerSec','',0),(156,'c9c521cda35311a9f8d1f4808620250d',0,0,80,'','100','','0','',120,'',1,'','PercentDiskTime','',0),(157,'95c5e40fbdbfd2a9a11094ba0b4175d0',0,0,80,'','100','','0','',120,'',1,'','PercentDiskReadTime','',0),(158,'92a384e4a6ca3ebfa8aaef6f4690d84b',0,0,80,'','100','','0','',120,'',1,'','PerDiskWriteTime','',0),(159,'fb77315e06f36a65d42ab41add7ce7d6',0,0,80,NULL,'100',NULL,'0',NULL,120,NULL,1,NULL,'PercentFreeSpace',NULL,0),(160,'4bc3dba937a56a7ddc2c07edc12df898',0,0,80,NULL,'100',NULL,'0',NULL,120,NULL,1,NULL,'PercentIdleTime',NULL,0),(161,'19d227fdea759532df221a8e7f149915',0,0,81,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'DiskReadsPerSec',NULL,0),(162,'3c82c46028a433ed6325f7f720829f38',0,0,81,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'DiskTransfersPerSec',NULL,0),(163,'fe80499055d429902c7e512911875a82',0,0,81,'','U','','0','',120,'',1,'','AvgDiskQueueLength','',0),(164,'20269e602e1eea4b90180450ecfbcab8',0,0,81,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'CurrentDiskQueueLen',NULL,0),(165,'f6d0c9b1785ac31d5c8c862a8b777f60',0,0,81,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'AvgDiskReadQueueLen',NULL,0),(166,'69bbf6e8d5e0695213884eb3598b1bcb',0,0,81,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'AvgDiskSecPerRead',NULL,0),(167,'3cc1a336564300968727f6cfdbb86396',0,0,81,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'AvgDiskWriteQueueLe',NULL,0),(168,'e7f415447f90546e5915ed4015d74d36',0,0,81,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'DiskWritesPerSec',NULL,0),(169,'a5054162c0861633d833805afabe7681',0,0,81,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'FreeMegabytes',NULL,0),(170,'d1d0bae69b19acb81e83f083ddcc61a7',0,0,81,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'SplitIOPerSec',NULL,0),(171,'fa66b621d56d5dbb65810ca2a00f93e1',0,0,81,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'AvgDiskSecPerTransf',NULL,0),(172,'a77a20b24fcf50ae67688e182140e14f',0,0,81,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'AvgDiskSecPerWrite',NULL,0),(173,'8fdba7964ba977410e5c7d21ee89dc7b',0,0,82,'','U','','0','',120,'',1,'','sinfMemComBytes','',0),(174,'62724f2664e60e1d005032f5f0935f03',0,0,82,'','U','','0','',120,'',1,'','sinfMemPNonpagedByt','',0),(175,'c483352c1e20ef5a776706e1219d5e98',0,0,82,'','U','','0','',120,'',1,'','sinfMemAvailBytes','',0),(176,'7a79e078d7ada819ba31a38c7c5a9494',0,0,82,'','U','','0','',120,'',1,'','sinfMemPPagedBytes','',0),(177,'50bccc8795800bc150734c5d339ab5bc',0,0,82,'','U','','0','',120,'',1,'','sinfMemPPagedResByt','',0),(178,'339309d060537591976905907ac2174a',0,0,82,'','U','','0','',120,'',1,'','sinfMemSysCodeResB','',0),(179,'8a296b2afe31136ebf1e9966e789518f',0,0,82,'','U','','0','',120,'',1,'','sinfMemSysCodeTotB','',0),(180,'9c3c63e7690862f4e4a458f4142f22de',0,0,82,'','U','','0','',120,'',1,'','sinfMemSysCacheResB','',0),(181,'7b25d41ffdd1f370c1c86d2592796332',0,0,82,'','U','','0','',120,'',1,'','sinfMemCacheBytesPk','',0),(182,'6b46a107c47bc9e73b19f53f31cc839d',0,0,82,'','U','','0','',120,'',1,'','sinfMemSysDrvResB','',0),(183,'a4fa65d299d9dc6d6868940fb73df0fe',0,0,82,'','U','','0','',120,'',1,'','sinfMemSysDrvTotB','',0),(184,'038c535782a88b446a63894728498740',0,0,83,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'sinfMemPagesOutPS',NULL,0),(185,'d27d15d407d3373e24ecadf7f109f391',0,0,83,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'sinfMemPagesInputPS',NULL,0),(186,'b60d39078698ec34345089083da3ea5a',0,0,83,'','U','','0','',120,'',1,'','sinfMemPageFaultsPS','',0),(187,'f1edb71d7cdf0c87eacb2e0fa2d2e091',0,0,83,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'sinfMemPagesPerSec',NULL,0),(188,'99406b652d68ad5973d518038a1e1ebc',0,0,84,'','U','','0','',120,'',1,'','netBytesRecPerSec','',0),(189,'616ff9a80676e81aa79fcde63a6a8f88',0,0,84,'','U','','0','',120,'',1,'','netBytesSentPerSec','',0),(190,'51b34e35e08ee57d62d014c61b4bf21f',0,0,84,'','U','','0','',120,'',1,'','netBytTotPerSec','',0),(191,'495f8580c5891b5c6112b2e5b830f569',0,0,84,'','U','','0','',120,'',1,'','netCurBandwidth','',0),(192,'6f6bc9779b5282560ba0268b4f924abd',0,0,84,'','U','','0','',120,'',1,'','netOutQueueLength','',0),(193,'384a2b93c296306f9cd51d016d1ef329',0,0,85,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'netPktsRecErr',NULL,0),(194,'a8bbac9f3cc291036fe2542c730cc5c0',0,0,85,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'netPktsOutDiscarded',NULL,0),(195,'05620ccc08e9346c537a928bf8614e1c',0,0,85,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'netPktsOutErrors',NULL,0),(196,'146b11edd1479069595457f326f875f7',0,0,85,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'netPktsRecDisc',NULL,0),(197,'91d3971229addefa7c1b1bbb2a57c4f9',0,0,85,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'netPktsRecUnk',NULL,0),(198,'fe25cb6b93d8813caa3f7bae561807c9',0,0,85,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'netPktsRecPerSec',NULL,0),(199,'31ff196276301284700a79cb319d5957',0,0,85,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'netPktsSentPerSec',NULL,0),(200,'6ee3bb9a1aeed389278160577e3f457c',0,0,85,'','U','','0','',120,'',1,'','netPacketsPerSec','',0),(201,'c7f2de5e861720acf0b100aae09c0fb1',0,0,86,'','U','','0','',120,'',1,'','objectsprocesses','',0),(202,'c2ae597bc63011e5254c6b69f2cbc38d',0,0,86,'','U','','0','',120,'',1,'','objectsthreads','',0),(203,'',140,6,77,NULL,'100',NULL,'0',NULL,120,NULL,1,NULL,'loss',NULL,107),(204,'',141,6,77,NULL,'5000',NULL,'0',NULL,120,NULL,1,NULL,'min',NULL,103),(205,'',142,6,77,NULL,'5000',NULL,'0',NULL,120,NULL,1,NULL,'avg',NULL,104),(206,'',143,6,77,NULL,'5000',NULL,'0',NULL,120,NULL,1,NULL,'max',NULL,105),(207,'',144,6,77,NULL,'5000',NULL,'0',NULL,120,NULL,1,NULL,'dev',NULL,106),(208,'',85,7,41,NULL,'U',NULL,'0',NULL,600,NULL,1,NULL,'hdd_free',NULL,0),(209,'',86,7,41,NULL,'U',NULL,'0',NULL,600,NULL,1,NULL,'hdd_used',NULL,0),(210,'',1,8,1,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'RRDsProcessed',NULL,47),(211,'',2,8,1,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'DataSources',NULL,48),(212,'',3,8,1,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'HostsPerProcess',NULL,49),(213,'',4,8,1,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'Hosts',NULL,50),(214,'',5,8,1,NULL,'100',NULL,'0',NULL,120,NULL,1,NULL,'Threads',NULL,51),(215,'',6,8,1,NULL,'100',NULL,'0',NULL,120,NULL,1,NULL,'Processes',NULL,52),(216,'',7,8,1,NULL,'300',NULL,'0',NULL,120,NULL,1,NULL,'Time',NULL,53),(217,'',1,9,1,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'RRDsProcessed',NULL,47),(218,'',2,9,1,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'DataSources',NULL,48),(219,'',3,9,1,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'HostsPerProcess',NULL,49),(220,'',4,9,1,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'Hosts',NULL,50),(221,'',5,9,1,NULL,'100',NULL,'0',NULL,120,NULL,1,NULL,'Threads',NULL,51),(222,'',6,9,1,NULL,'100',NULL,'0',NULL,120,NULL,1,NULL,'Processes',NULL,52),(223,'',7,9,1,NULL,'300',NULL,'0',NULL,120,NULL,1,NULL,'Time',NULL,53),(224,'',8,10,2,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'time',NULL,54),(225,'',9,10,2,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'rrdupdates',NULL,55),(226,'',10,11,3,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'snmp',NULL,56),(227,'',11,11,3,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'script',NULL,57),(228,'',12,11,3,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'script_server',NULL,58),(229,'',13,12,4,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'hosts',NULL,60),(230,'',14,12,4,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'time',NULL,59),(231,'',1,13,1,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'RRDsProcessed',NULL,47),(232,'',2,13,1,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'DataSources',NULL,48),(233,'',3,13,1,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'HostsPerProcess',NULL,49),(234,'',4,13,1,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'Hosts',NULL,50),(235,'',5,13,1,NULL,'100',NULL,'0',NULL,120,NULL,1,NULL,'Threads',NULL,51),(236,'',6,13,1,NULL,'100',NULL,'0',NULL,120,NULL,1,NULL,'Processes',NULL,52),(237,'',7,13,1,NULL,'300',NULL,'0',NULL,120,NULL,1,NULL,'Time',NULL,53),(238,'',15,14,5,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'boost_peak_memory',NULL,61),(239,'',16,15,6,NULL,'1000',NULL,'0',NULL,120,NULL,1,NULL,'active',NULL,64),(240,'',17,15,6,NULL,'1000',NULL,'0',NULL,120,NULL,1,NULL,'garbage',NULL,66),(241,'',18,15,6,NULL,'1000',NULL,'0',NULL,120,NULL,1,NULL,'valid',NULL,62),(242,'',19,15,6,NULL,'1000',NULL,'0',NULL,120,NULL,1,NULL,'sleeping',NULL,65),(243,'',20,15,6,NULL,'1000',NULL,'0',NULL,120,NULL,1,NULL,'usleeping',NULL,68),(244,'',21,15,6,NULL,'1000',NULL,'0',NULL,120,NULL,1,NULL,'uactive',NULL,67),(245,'',22,15,6,NULL,'1000',NULL,'0',NULL,120,NULL,1,NULL,'invalid',NULL,63),(246,'',16,16,6,NULL,'1000',NULL,'0',NULL,120,NULL,1,NULL,'active',NULL,64),(247,'',17,16,6,NULL,'1000',NULL,'0',NULL,120,NULL,1,NULL,'garbage',NULL,66),(248,'',18,16,6,NULL,'1000',NULL,'0',NULL,120,NULL,1,NULL,'valid',NULL,62),(249,'',19,16,6,NULL,'1000',NULL,'0',NULL,120,NULL,1,NULL,'sleeping',NULL,65),(250,'',20,16,6,NULL,'1000',NULL,'0',NULL,120,NULL,1,NULL,'usleeping',NULL,68),(251,'',21,16,6,NULL,'1000',NULL,'0',NULL,120,NULL,1,NULL,'uactive',NULL,67),(252,'',22,16,6,NULL,'1000',NULL,'0',NULL,120,NULL,1,NULL,'invalid',NULL,63),(253,'',16,17,6,NULL,'1000',NULL,'0',NULL,120,NULL,1,NULL,'active',NULL,64),(254,'',17,17,6,NULL,'1000',NULL,'0',NULL,120,NULL,1,NULL,'garbage',NULL,66),(255,'',18,17,6,NULL,'1000',NULL,'0',NULL,120,NULL,1,NULL,'valid',NULL,62),(256,'',19,17,6,NULL,'1000',NULL,'0',NULL,120,NULL,1,NULL,'sleeping',NULL,65),(257,'',20,17,6,NULL,'1000',NULL,'0',NULL,120,NULL,1,NULL,'usleeping',NULL,68),(258,'',21,17,6,NULL,'1000',NULL,'0',NULL,120,NULL,1,NULL,'uactive',NULL,67),(259,'',22,17,6,NULL,'1000',NULL,'0',NULL,120,NULL,1,NULL,'invalid',NULL,63),(260,'',8,18,2,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'time',NULL,54),(261,'',9,18,2,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'rrdupdates',NULL,55),(262,'',1,19,1,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'RRDsProcessed',NULL,47),(263,'',2,19,1,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'DataSources',NULL,48),(264,'',3,19,1,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'HostsPerProcess',NULL,49),(265,'',4,19,1,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'Hosts',NULL,50),(266,'',5,19,1,NULL,'100',NULL,'0',NULL,120,NULL,1,NULL,'Threads',NULL,51),(267,'',6,19,1,NULL,'100',NULL,'0',NULL,120,NULL,1,NULL,'Processes',NULL,52),(268,'',7,19,1,NULL,'300',NULL,'0',NULL,120,NULL,1,NULL,'Time',NULL,53),(269,'',23,20,7,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'ExportGraphs',NULL,69),(270,'',24,21,8,NULL,'U',NULL,'0',NULL,120,NULL,1,NULL,'ExportDuration',NULL,70),(271,'',25,22,9,NULL,'U',NULL,'0',NULL,600,NULL,1,NULL,'incoming',NULL,72),(272,'',26,22,9,NULL,'U',NULL,'0',NULL,600,NULL,1,NULL,'deletes',NULL,71),(273,'',27,22,9,NULL,'U',NULL,'0',NULL,600,NULL,1,NULL,'alarms',NULL,76),(274,'',28,22,9,NULL,'U',NULL,'0',NULL,600,NULL,1,NULL,'removes',NULL,73),(275,'',29,22,9,NULL,'U',NULL,'0',NULL,600,NULL,1,NULL,'xfers',NULL,74),(276,'',30,23,10,NULL,'U',NULL,'0',NULL,600,NULL,1,NULL,'syslogRuntime',NULL,78),(277,'',31,24,11,NULL,'U',NULL,'0',NULL,600,NULL,1,NULL,'alerts',NULL,75),(278,'',32,24,11,NULL,'U',NULL,'0',NULL,600,NULL,1,NULL,'reports',NULL,77),(279,'',33,25,12,NULL,'U',NULL,'0',NULL,600,NULL,1,NULL,'tholdRuntime',NULL,79),(280,'',34,26,13,NULL,'U',NULL,'0',NULL,600,NULL,1,NULL,'boost_avg_size',NULL,80),(281,'',35,27,14,NULL,'U',NULL,'0',NULL,600,NULL,1,NULL,'boost_records',NULL,81),(282,'',36,28,15,NULL,'U',NULL,'0',NULL,600,NULL,1,NULL,'boost_table',NULL,82),(283,'',37,29,16,NULL,'U',NULL,'0',NULL,600,NULL,1,NULL,'rrd_delete',NULL,88),(284,'',38,29,16,NULL,'U',NULL,'0',NULL,600,NULL,1,NULL,'rrd_get_records',NULL,83),(285,'',39,29,16,NULL,'U',NULL,'0',NULL,600,NULL,1,NULL,'rrd_lastupdate',NULL,86),(286,'',40,29,16,NULL,'U',NULL,'0',NULL,600,NULL,1,NULL,'rrd_results_cycle',NULL,84),(287,'',41,29,16,NULL,'U',NULL,'0',NULL,600,NULL,1,NULL,'rrd_template',NULL,85),(288,'',42,29,16,NULL,'U',NULL,'0',NULL,600,NULL,1,NULL,'rrd_update',NULL,87);
/*!40000 ALTER TABLE `data_template_rrd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_links`
--

DROP TABLE IF EXISTS `external_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sortorder` int(11) NOT NULL DEFAULT 0,
  `enabled` char(2) COLLATE utf8mb4_unicode_ci DEFAULT 'on',
  `contentfile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `style` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extendedstyle` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `refresh` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Contains external links that are embedded into Cacti';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_links`
--

LOCK TABLES `external_links` WRITE;
/*!40000 ALTER TABLE `external_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_local`
--

DROP TABLE IF EXISTS `graph_local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graph_local` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `graph_template_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `host_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `snmp_query_id` mediumint(8) NOT NULL DEFAULT 0,
  `snmp_query_graph_id` mediumint(8) NOT NULL DEFAULT 0,
  `snmp_index` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `host_id` (`host_id`),
  KEY `graph_template_id` (`graph_template_id`),
  KEY `snmp_query_id` (`snmp_query_id`),
  KEY `snmp_query_graph_id` (`snmp_query_graph_id`),
  KEY `snmp_index` (`snmp_index`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Creates a relationship for each item in a custom graph.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph_local`
--

LOCK TABLES `graph_local` WRITE;
/*!40000 ALTER TABLE `graph_local` DISABLE KEYS */;
INSERT INTO `graph_local` VALUES (1,48,1,0,0,''),(2,49,1,0,0,''),(3,50,1,0,0,''),(4,51,1,0,0,''),(5,79,1,0,0,''),(6,52,1,5,26,'/dev/mapper/centos-root'),(8,1,1,0,0,''),(9,2,1,0,0,''),(10,3,1,0,0,''),(11,4,1,0,0,''),(12,5,1,0,0,''),(13,6,1,0,0,''),(14,7,1,0,0,''),(15,8,1,0,0,''),(16,9,1,0,0,''),(17,10,1,0,0,''),(18,11,1,0,0,''),(19,12,1,0,0,''),(20,13,1,0,0,''),(21,14,1,0,0,''),(22,15,1,0,0,''),(23,16,1,0,0,''),(24,17,1,0,0,''),(25,18,1,0,0,''),(26,19,1,0,0,''),(27,20,1,0,0,''),(28,21,1,0,0,''),(29,22,1,0,0,'');
/*!40000 ALTER TABLE `graph_local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_template_input`
--

DROP TABLE IF EXISTS `graph_template_input`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graph_template_input` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `graph_template_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `column_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Stores the names for graph item input groups.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph_template_input`
--

LOCK TABLES `graph_template_input` WRITE;
/*!40000 ALTER TABLE `graph_template_input` DISABLE KEYS */;
INSERT INTO `graph_template_input` VALUES (1,'2600aa2b55802194593075079b3ff217',1,'Data Source [Hosts]','','task_item_id'),(2,'6dab3c8fa41460ad4391286f9bd57396',1,'Data Source [HostsPerProcess]','','task_item_id'),(3,'e5505ad802ea90cf5e360a9fb1e857dc',2,'Data Source [DataSources]','','task_item_id'),(4,'8b36c373383efff32244eed552e9b742',2,'Data Source [RRDsProcessed]','','task_item_id'),(5,'3ed026d0c63841377b1de73e7be58202',3,'Data Source [rrdupdates]','','task_item_id'),(6,'81e327aec9e80992517e3f3a5020ce15',4,'Data Source [snmp]','','task_item_id'),(7,'dc9c886f6822c6244c5ae0f219e5f0d2',4,'Data Source [script]','','task_item_id'),(8,'740743098b09bcd7f7d3dbc7a29b1e9e',4,'Data Source [script_server]','','task_item_id'),(9,'39824d646b1d533011c21ead3c4c58fe',5,'Data Source [time]','','task_item_id'),(10,'2c4fbc040922b3d831918eef776e506b',5,'Data Source [hosts]','','task_item_id'),(11,'79efb0416dd656a19afeacbbae491397',6,'Data Source [Processes]','','task_item_id'),(12,'5106a9bdddc0fa459a7da4867ecb9e3e',6,'Data Source [Threads]','','task_item_id'),(13,'7761849322e2853790244cbd6e809d9b',7,'Data Source [boost_peak_memory]','','task_item_id'),(14,'854fdd276a19bde66c1fd85b01c84323',8,'Data Source [invalid]','','task_item_id'),(15,'4e946ab824fbadaa732911d419ef9b20',8,'Data Source [valid]','','task_item_id'),(16,'8748658cfc138fbe6db24b21e95951e6',9,'Data Source [garbage]','','task_item_id'),(17,'5302271ef7a19838fa72acd584fe7dc7',9,'Data Source [sleeping]','','task_item_id'),(18,'32367c069ff7f49ef35bdb8037544d47',9,'Data Source [active]','','task_item_id'),(19,'86d6401df83db577fac647a0828e0e35',10,'Data Source [usleeping]','','task_item_id'),(20,'c2207d5a553d76905f374937d65ab755',10,'Data Source [uactive]','','task_item_id'),(21,'2f15a574e7ebc348c61f2dda32db45ee',11,'Data Source [time]','','task_item_id'),(22,'965860ed14a227515be0fc6d1c0ffbf9',12,'Data Source [Time]','','task_item_id'),(23,'c48d08c1aea006d6c25c4a8593ec5104',12,'Data Source [pollerTime]','','task_item_id'),(24,'d9cea8c76eabdbd125a8c01933df6056',13,'Data Source [ExportGraphs]','','task_item_id'),(25,'fe137efd47408e88f099487e2493ba56',14,'Data Source [ExportDuration]','','task_item_id'),(26,'e5d4b06cdb71b588a7cf95eb07b57a99',15,'Data Source [alarms]','','task_item_id'),(27,'ef8b29e436e2ec81458bea086ff739dc',15,'Data Source [incoming]','','task_item_id'),(28,'d4605ed35fc87f88bb65540d45c76519',15,'Data Source [removes]','','task_item_id'),(29,'22faaae45c2c5967c6277b3790116731',15,'Data Source [xfers]','','task_item_id'),(30,'e812b10e7a9ec9f3b11c9b11d6f42ca5',15,'Data Source [deletes]','','task_item_id'),(31,'bf21684c0d3609c771e2fc86e9f93472',16,'Data Source [syslogRuntime]','','task_item_id'),(32,'c04af440cdf9d6cccd385add2bec14e0',17,'Data Source [alerts]','','task_item_id'),(33,'f4995efecb1f9ecf4ff2c3944a5185c1',17,'Data Source [reports]','','task_item_id'),(34,'ae88364059011d4c1ff2be83a1294456',18,'Data Source [tholdRuntime]','','task_item_id'),(35,'1d9276759ac13c7476f1d27655a68b5e',19,'Data Source [boost_avg_size]','','task_item_id'),(36,'9c58ab860bec932b046c1b7a4806942f',20,'Data Source [boost_records]','','task_item_id'),(37,'b86dec65127151fb63705cb4d5d0ace2',21,'Data Source [boost_table]','','task_item_id'),(38,'8c0796ae670469aa76d5b985d1218cc1',22,'Data Source [rrd_get_records]','','task_item_id'),(39,'e6ebd40acb1795585eea87f7c4932796',22,'Data Source [rrd_results_cycle]','','task_item_id'),(40,'8711f9fc6934936c1c5cf823e69d4187',22,'Data Source [rrd_lastupdate]','','task_item_id'),(41,'6675e0bc0c1455f6b318db7214aa4ba7',22,'Data Source [rrd_template]','','task_item_id'),(42,'9de40413fc40b0f4dd0771f8116c596d',22,'Data Source [rrd_update]','','task_item_id'),(43,'47582dd0798e137f1ffa790ea21dded5',22,'Data Source [rrd_delete]','','task_item_id'),(44,'44dea45d4aac3a4902e9f98d5548696d',23,'Data Source [pollerTime]','','task_item_id'),(45,'7c598e4533481afe36785dceb21580a7',23,'Data Source [maxTime]','','task_item_id'),(46,'fae46036ee42c83d52592737f9051a83',23,'Data Source [avgTime]','','task_item_id'),(47,'dffc76407c8bf9fd148c6058722c8a53',23,'Data Source [minTime]','','task_item_id'),(48,'ff1185972e156e03a60d607d9b3bf1f0',24,'Data Source [getSNMP]','','task_item_id'),(49,'f3b217e50a15f128abf9fd2e9dac72e4',24,'Data Source [getScriptServer]','','task_item_id'),(50,'8967e9dd060a56d3e9369258013a242f',24,'Data Source [getScript]','','task_item_id'),(51,'c88a471d1bc7cc3324252f47ae121d4a',25,'Data Source [processCount]','','task_item_id'),(52,'c81a934e61492aef9cb3645c6699e391',25,'Data Source [threadCount]','','task_item_id'),(53,'1f88e009e145214fd47e9bc1c9ff834e',26,'Data Source [recacheTime]','','task_item_id'),(54,'10f516697a767f23e9917712784382be',26,'Data Source [recacheDevices]','','task_item_id'),(55,'46e937ea754fc49ebe5596706784d2e0',27,'Data Source [totalTime]','','task_item_id'),(56,'1144662dc503a5445f792a47f2d2bdbd',27,'Data Source [connectTime]','','task_item_id'),(57,'57ff3b8de76deaacb180d066dca5e58a',27,'Data Source [lookupTime]','','task_item_id'),(58,'df85592e25bd094f6aa388d567c55be0',27,'Data Source [redirectTime]','','task_item_id'),(59,'728a6922fc0e8a2c87c816300269db50',28,'Data Source [downloadSize]','','task_item_id'),(60,'18e3b58fef13fd44972a44adc1d90a45',29,'Data Source [downloadSpeed]','','task_item_id'),(61,'ffe65c3ab96a96b48e743054c79108ea',30,'Data Source [checkStatus]','','task_item_id'),(62,'ff060f916f471dd16e0949a6a98fca50',31,'Data Source [totalGraphs]','','task_item_id'),(63,'1ef8aa80d1ce46714aa23f21cc340317',32,'Data Source [lastRuntime]','','task_item_id'),(64,'bb9d83a02261583bc1f92d9e66ea705d',33,'CPU Usage Data Source','','task_item_id'),(65,'51196222ed37b44236d9958116028980',33,'Legend Color','','color_id'),(66,'b12d40fbd3144b503e3b3a877a14e126',34,'Data Source [polling_time]','','task_item_id'),(67,'4565c0c95673d49c176a7601f24587f7',35,'Data Source [uptime]','','task_item_id'),(68,'e9d4191277fdfd7d54171f153da57fb0',36,'Inbound Data Source','','task_item_id'),(69,'7b361722a11a03238ee8ab7ce44a1037',36,'Outbound Data Source','','task_item_id'),(70,'fa83cd3a3b4271b644cb6459ea8c35dc',37,'Discards In Data Source','','task_item_id'),(71,'7946e8ee1e38a65462b85e31a15e35e5',37,'Errors In Data Source','','task_item_id'),(72,'e5acdd5368137c408d56ecf55b0e077c',37,'Discards Out Data Source','','task_item_id'),(73,'a028e586e5fae667127c655fe0ac67f0',37,'Errors Out Data Source','','task_item_id'),(74,'00ae916640272f5aca54d73ae34c326b',38,'Unicast Packets Out Data Source','','task_item_id'),(75,'1bc1652f82488ebfb7242c65d2ffa9c7',38,'Unicast Packets In Data Source','','task_item_id'),(76,'e3177d0e56278de320db203f32fb803d',39,'Non-Unicast Packets In Data Source','','task_item_id'),(77,'4f20fba2839764707f1c3373648c5fef',39,'Non-Unicast Packets Out Data Source','','task_item_id'),(78,'2764a4f142ba9fd95872106a1b43541e',40,'Inbound Data Source','','task_item_id'),(79,'f73f7ddc1f4349356908122093dbfca2',40,'Outbound Data Source','','task_item_id'),(80,'562726cccdb67d5c6941e9e826ef4ef5',41,'Inbound Data Source','','task_item_id'),(81,'82426afec226f8189c8928e7f083f80f',41,'Outbound Data Source','','task_item_id'),(82,'69a23877302e7d142f254b208c58b596',42,'Inbound Data Source','','task_item_id'),(83,'f28013abf8e5813870df0f4111a5e695',42,'Outbound Data Source','','task_item_id'),(84,'8644b933b6a09dde6c32ff24655eeb9a',43,'Outbound Data Source','','task_item_id'),(85,'49c4b4800f3e638a6f6bb681919aea80',43,'Inbound Data Source','','task_item_id'),(86,'a29d473b1bbc98a1c032237622ea0837',44,'Multicast Packets Out Data Source','','task_item_id'),(87,'cc896ba8b616aa6a66a1ba1ce802e68e',44,'Multicast Packets In Data Source','','task_item_id'),(88,'a5c3743e175afaa77f6fa1f452f72c32',45,'Non-Unicast Packets In Data Source','','task_item_id'),(89,'30e4a03de4ed9d772a0bbe93830b8b73',45,'Non-Unicast Packets Out Data Source','','task_item_id'),(90,'433f328369f9569446ddc59555a63eb8',46,'Ping Host Data Source','','task_item_id'),(91,'a1a91c1514c65152d8cb73522ea9d4e6',46,'Legend Color','','color_id'),(92,'2fb4deb1448379b27ddc64e30e70dc42',46,'Legend Text','','text_format'),(93,'2dca37011521501b9c2b705d080db750',47,'Data Source [snmp_oid]','','task_item_id'),(94,'b8d8ade5f5f3dd7b12f8cc56bbb4083e',47,'Legend Color','','color_id'),(95,'ac2355b4895c37e14df827f969f31c12',47,'Legend Text','','text_format'),(96,'592cedd465877bc61ab549df688b0b2a',48,'Processes Data Source','','task_item_id'),(97,'1d51dbabb200fcea5c4b157129a75410',48,'Legend Color','','color_id'),(98,'8cb8ed3378abec21a1819ea52dfee6a3',49,'1 Minute Data Source','','task_item_id'),(99,'5dfcaf9fd771deb8c5430bce1562e371',49,'5 Minute Data Source','','task_item_id'),(100,'6f3cc610315ee58bc8e0b1f272466324',49,'15 Minute Data Source','','task_item_id'),(101,'b457a982bf46c6760e6ef5f5d06d41fb',50,'Logged in Users Data Source','','task_item_id'),(102,'bd4a57adf93c884815b25a8036b67f98',50,'Legend Color','','color_id'),(103,'6273c71cdb7ed4ac525cdbcf6180918c',51,'Free Data Source','','task_item_id'),(104,'5e62dbea1db699f1bda04c5863e7864d',51,'Swap Data Source','','task_item_id'),(105,'940beb0f0344e37f4c6cdfc17d2060bc',52,'Available Disk Space Data Source','','task_item_id'),(106,'7b0674dd447a9badf0d11bec688028a8',52,'Used Disk Space Data Source','','task_item_id'),(107,'d7cdb63500c576e0f9f354de42c6cf3a',53,'1 Minute Data Source','','task_item_id'),(108,'a23152f5ec02e7762ca27608c0d89f6c',53,'5 Minute Data Source','','task_item_id'),(109,'2cc5d1818da577fba15115aa18f64d85',53,'15 Minute Data Source','','task_item_id'),(110,'f45def7cad112b450667aa67262258cb',54,'Memory Free Data Source','','task_item_id'),(111,'f8c361a8c8b7ad80e8be03ba7ea5d0d6',54,'Memory Buffers Data Source','','task_item_id'),(112,'e0b395be8db4f7b938d16df7ae70065f',54,'Cache Memory Data Source','','task_item_id'),(113,'eb76da0d29135bac17f898c44ec279cb',54,'Data Source [mem_total]','','task_item_id'),(114,'37d09fb7ce88ecec914728bdb20027f3',55,'Logged in Users Data Source','','task_item_id'),(115,'699bd7eff7ba0c3520db3692103a053d',55,'Legend Color','','color_id'),(116,'df905e159d13a5abed8a8a7710468831',56,'Processes Data Source','','task_item_id'),(117,'8ca9e3c65c080dbf74a59338d64b0c14',56,'Legend Color','','color_id'),(118,'41f360e2e5c7038bd6502495fc42064e',57,'Data Source [ssCpuIdle]','','task_item_id'),(119,'059853124cd1649493af05c24594bc8d',57,'Data Source [ssCpuUser]','','task_item_id'),(120,'e280d373dd8d0aecd1b26781ed7a5977',57,'Data Source [ssCpuSystem]','','task_item_id'),(121,'e147ef9f5bc72229fe46508904d1e820',58,'Data Source [ssSysInterrupts]','','task_item_id'),(122,'d57f74ec1b11fc2037d197417c7f187d',59,'Data Source [ssSysContext]','','task_item_id'),(123,'a9ac261a6344d2ce06373174f2fb91ec',60,'Data Source [reads]','','task_item_id'),(124,'90cecf239de8d0c8dbff22529dbb03ae',60,'Data Source [writes]','','task_item_id'),(125,'50955e0bcf20cbeb8fcde95c1ad26522',61,'Data Source [bytesread]','','task_item_id'),(126,'4ce2aaa9d1550ac38072302ed101655d',61,'Data Source [byteswritten]','','task_item_id'),(127,'b33eb27833614056e06ee5952c3e0724',62,'Available Disk Space Data Source','','task_item_id'),(128,'ef8799e63ee00e8904bcc4228015784a',62,'Used Disk Space Data Source','','task_item_id'),(129,'86bd8819d830a81d64267761e1fd8ec4',63,'Total Disk Space Data Source','','task_item_id'),(130,'6c8967850102202de166951e4411d426',63,'Used Disk Space Data Source','','task_item_id'),(131,'bdad718851a52b82eca0a310b0238450',64,'CPU Utilization Data Source','','task_item_id'),(132,'e7b578e12eb8a82627557b955fd6ebd4',64,'Legend Color','','color_id'),(133,'65126c24617c23b64079ba555751da3f',65,'Data Source [Bytes_Read]','','task_item_id'),(134,'7ea0ac64ce0aba0c2b392cc6d7034515',65,'Data Source [Bytes_Written]','','task_item_id'),(135,'30d6aa3a34630bec2a143ac063a76907',66,'Data Source [15Min_LoadAvg]','','task_item_id'),(136,'456e79bda9a2e0f370f7b077d0ce9ad4',66,'Data Source [1Min_LoadAvg]','','task_item_id'),(137,'f930429ea76fd8a8ea9af5461f738357',66,'Data Source [5Min_LoadAvg]','','task_item_id'),(138,'e0ab1b0794eb8ad54e549c363b3b9409',67,'Data Source [Device_Writes]','','task_item_id'),(139,'3e0edbee4c2f152e69f0912e379d303f',67,'Data Source [Device_Reads]','','task_item_id'),(140,'a49b5bb85aedffe9500b1182979b40c6',68,'Data Source [SNMP Uptime]','','task_item_id'),(141,'45e24ef99ac0ce7338a5a34ca285d6d7',69,'PAFW Session Utilization','','task_item_id'),(142,'bbad68c2fa217830a34ff93e28ba553c',70,'Data Source [pan_ses_act]','','task_item_id'),(143,'be5d77f45cdf9b78c38a18dc109ecb95',71,'Data Source [pan_ses_tcp]','','task_item_id'),(144,'e8d9d516746bf54958bdd225d8aa0b4a',71,'Data Source [pan_ses_icmp]','','task_item_id'),(145,'f1bd5556c75d8e75eda38bccaae820f9',71,'Data Source [pan_ses_udp]','','task_item_id'),(146,'8b93d5cdd3618d1e6e03d300a2ea4683',72,'Data Source [pa_load_dp]','','task_item_id'),(147,'95bdcb01321a337ac404edc5019e7d48',72,'Data Source [pa_load_mp]','','task_item_id'),(148,'8d80fad8774c81c4c8a4c4fe51ac31fa',73,'Data Source [pan_board_temp]','','task_item_id'),(149,'aa2c1b29510deb2cb750486fb64eb14a',73,'Data Source [pan_cpu_temp]','','task_item_id'),(150,'565e83e618036796e9fa88ba47039e66',74,'Data Source [multicast_in]','','task_item_id'),(151,'ed0c33f95924b1aa1eb0b2b4cab4bb95',74,'Data Source [multicast_out]','','task_item_id'),(152,'6bdc8a40352c65d899f9bfe16690d8e6',75,'Legend color','','color_id'),(153,'80893f918b697da9cc6b643d70e61ab7',75,'Int status','','task_item_id'),(154,'b0e48a1b15fed91f4ee0c7386523b114',76,'Legend Color','','color_id'),(155,'5555554b73bd8ead52e21a2f17f1af35',76,'CPU Usage Data Source','','task_item_id'),(156,'ff849e53c54d6638e8f8981dea980bbe',76,'Data Source [5min_cpu]','','task_item_id'),(157,'c1db8fe53b5a42db10a354c7a4ea07a9',77,'Data Source [SessionCount]','','task_item_id'),(158,'aac7ed46c3d963caca2bd33dda1736cd',78,'Legend Color','','color_id'),(159,'8eb1f24dd9acb7157e078c09b0160234',78,'Data Source [mem]','','task_item_id'),(160,'b94581ad461568ab3c9ce9747237b8bb',79,'Data Source [dev]','','task_item_id'),(161,'e6cbf72b9bfb7e5fc8170c53adc04d5d',79,'Data Source [loss]','','task_item_id'),(162,'eb02a9e783428540f45c4d45ff3d236b',79,'Data Source [max]','','task_item_id'),(163,'cf9d3b5f1189a8ab42cae1badee91283',79,'Data Source [avg]','','task_item_id'),(164,'f08f82cddf91f1ea225230c9bfc89d75',79,'Data Source [min]','','task_item_id'),(165,'447db101da833c04ceb266956bd8ecb7',80,'Data Source [cpuDPCsQueuedPerSec]','','task_item_id'),(166,'afcfc1bf9df13566cbfe6a7a948941ee',80,'Data Source [cpuInterruptsPerSec]','','task_item_id'),(167,'095d80ff41bf1e70947f341d99020b8a',80,'Data Source [cpuDPCRate]','','task_item_id'),(168,'89803ba92cafe3ece32b1358684faa56',80,'Data Source [cpuPercentPriv]','','task_item_id'),(169,'a1f793301e845e7925794a83835c7f5c',80,'Data Source [cpuPercentDPCTime]','','task_item_id'),(170,'8255f333ee89b1315cc01b8eceefc562',80,'Data Source [cpuPercentInterrupt]','','task_item_id'),(171,'a30f26afe555d9261c0aa1586b914b08',80,'Data Source [cpuPercentProcessor]','','task_item_id'),(172,'8ec8555f57a32dc0997936047a477ea1',80,'Data Source [cpuPercentUserTime]','','task_item_id'),(173,'e7c87f4d3b2e4cbbeac3f2432788018b',81,'Data Source [DiskReadBytesPerSec]','','task_item_id'),(174,'bd070372988bc1454d03db44ce2314de',81,'Data Source [DiskBytesPerSec]','','task_item_id'),(175,'243ac8cd45f4c1b2f3bc5f50bbcae748',81,'Data Source [DiskWriteBytesPerSe]','','task_item_id'),(176,'44b94deb8b09265212dba66a4583de80',82,'Data Source [PercentFreeSpace]','','task_item_id'),(177,'ac45225458e6d4f34bc07c35069b8fa7',82,'Data Source [PercentDiskTime]','','task_item_id'),(178,'facdd9b5a510457949419c789773b862',82,'Data Source [PercentDiskReadTime]','','task_item_id'),(179,'ae42396cb4fa9887374265ac62d03550',82,'Data Source [PerDiskWriteTime]','','task_item_id'),(180,'9096a3f79f7bca41bf059dc6444dadac',82,'Data Source [PercentIdleTime]','','task_item_id'),(181,'1b83270c60806367510fbc35b1c99094',83,'Data Source [AvgDiskSecPerWrite]','','task_item_id'),(182,'5896f77f6aa39f94b664b5f28e7a2849',83,'Data Source [DiskReadsPerSec]','','task_item_id'),(183,'2e7cd766866ee2336354afa959839170',83,'Data Source [DiskWritesPerSec]','','task_item_id'),(184,'69288a9488dea1dee323d3cddb3d0113',83,'Data Source [DiskTransfersPerSec]','','task_item_id'),(185,'a6eba617faa85fe28a102bcbe2de5c87',83,'Data Source [AvgDiskSecPerRead]','','task_item_id'),(186,'a66e18f2695351baee276e4f9321d6c2',83,'Data Source [AvgDiskReadQueueLen]','','task_item_id'),(187,'49c2efd4e79dccd2ef6578783046eb69',83,'Data Source [AvgDiskWriteQueueLe]','','task_item_id'),(188,'bd1d170c803d9b896b9e3a08cef09537',83,'Data Source [AvgDiskQueueLength]','','task_item_id'),(189,'750f61bdb04a868474434a300528b50c',83,'Data Source [CurrentDiskQueueLen]','','task_item_id'),(190,'019e74f69d3659d6e1a56c06ed5fa627',83,'Data Source [AvgDiskSecPerTransf]','','task_item_id'),(191,'4fd7842a34aae480c7ea2a729f8315cf',83,'Data Source [FreeMegabytes]','','task_item_id'),(192,'9c678fa0b2dc5fbb5f3c5cf12abe936b',83,'Data Source [SplitIOPerSec]','','task_item_id'),(193,'9d3828e30df8386fc3025dfbb9e2a351',84,'Data Source [sinfMemSysCodeResB]','','task_item_id'),(194,'c818c0bbf38863b011ab2645fa3d2a1c',84,'Data Source [sinfMemSysCodeTotB]','','task_item_id'),(195,'c12450c0a055adadd6b0327c6947ab1e',84,'Data Source [sinfMemSysDrvResB]','','task_item_id'),(196,'24288a7cd27d45a3abcc66b90255668b',84,'Data Source [sinfMemSysDrvTotB]','','task_item_id'),(197,'ee10a58483b0fd044ffcca8f57fb61fb',84,'Data Source [sinfMemSysCacheResB]','','task_item_id'),(198,'15cdd8289b0c5a53927aee296faea5ea',84,'Data Source [sinfMemPPagedResByt]','','task_item_id'),(199,'0d50ca806ac913b6090a186210d42101',84,'Data Source [sinfMemPPagedBytes]','','task_item_id'),(200,'090f16b28d8d98cc7989bf95230802b4',84,'Data Source [sinfMemCacheBytesPk]','','task_item_id'),(201,'0cb44f8993eb55a1b08f4f2cb46f79ba',84,'Data Source [sinfMemPNonpagedByt]','','task_item_id'),(202,'82aa11b0167ca2e2edd6c0e6725abc6c',84,'Data Source [sinfMemComBytes]','','task_item_id'),(203,'ae8708b2c28ba95ad912730f2adf2c62',84,'Data Source [sinfMemAvailMB]','','task_item_id'),(204,'908dbe2569bb4668cae63fd45253fbd1',85,'Data Source [sinfMemPagesOutPS]','','task_item_id'),(205,'e588b6645c7a77dc0d9b223046934d9f',85,'Data Source [sinfMemPageFaultsPS]','','task_item_id'),(206,'70a09e0d3bebbd0665ae436f8fd4299f',85,'Data Source [sinfMemPagesInputPS]','','task_item_id'),(207,'1c71145e25ddd3bb101fb13c87f863ec',85,'Data Source [sinfMemPagesPerSec]','','task_item_id'),(208,'0e20235ef87bb5a5f2c8990181efe65a',86,'Data Source [netBytesSentPerSec]','','task_item_id'),(209,'c63091b3d48288e3c8f9db92241f74c1',86,'Data Source [netBytesRecPerSec]','','task_item_id'),(210,'8ad76899b82277e93458d9bb57285dc5',86,'Data Source [netBytTotPerSec]','','task_item_id'),(211,'e28c3354b5f56fd1f5d90550764c24f5',86,'Data Source [netOutQueueLength]','','task_item_id'),(212,'adee3c03fa2403676fcb7edc7b7405bc',86,'Data Source [netCurBandwidth]','','task_item_id'),(213,'4cdc68b0eeffd211257e76b6e9f00e1f',87,'Data Source [netPktsOutErrors]','','task_item_id'),(214,'dd0a8fc2363ed07a287c2eeca17cab92',87,'Data Source [netPktsRecErr]','','task_item_id'),(215,'4f5a34beefb55cbd0eba2f9ccbc04b8a',87,'Data Source [netPktsOutDiscarded]','','task_item_id'),(216,'68633ae60e8db27b08795e3faea220a2',87,'Data Source [netPacketsPerSec]','','task_item_id'),(217,'022b7c73ed25ba8263304ef7ee937a88',87,'Data Source [netPktsSentPerSec]','','task_item_id'),(218,'f038e92fe49695254536bd6707f24568',87,'Data Source [netPktsRecPerSec]','','task_item_id'),(219,'0e2a9cc4c50c18da8e8f138bdcd96315',87,'Data Source [netPktsOutDiscarded]','','task_item_id'),(220,'982392882a471ff6f3453494b78751be',87,'Data Source [netPktsRecDisc]','','task_item_id'),(221,'c7147290f2a024a48a05997a1d7dc4e4',87,'Data Source [netPktsRecUnk]','','task_item_id'),(222,'fefc4d2888655bfe103c54f7bb8fa2aa',88,'Data Source [objectsprocesses]','','task_item_id'),(223,'fccba01e6d291c504c2042632e691f28',88,'Data Source [objectsthreads]','','task_item_id');
/*!40000 ALTER TABLE `graph_template_input` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_template_input_defs`
--

DROP TABLE IF EXISTS `graph_template_input_defs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graph_template_input_defs` (
  `graph_template_input_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `graph_template_item_id` int(12) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`graph_template_input_id`,`graph_template_item_id`),
  KEY `graph_template_input_id` (`graph_template_input_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Stores the relationship for what graph items are associated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph_template_input_defs`
--

LOCK TABLES `graph_template_input_defs` WRITE;
/*!40000 ALTER TABLE `graph_template_input_defs` DISABLE KEYS */;
INSERT INTO `graph_template_input_defs` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(2,6),(2,7),(2,8),(2,9),(2,10),(3,11),(3,12),(3,13),(3,14),(3,15),(3,16),(4,17),(4,18),(4,19),(4,20),(4,21),(4,22),(5,23),(5,24),(5,25),(5,26),(5,27),(5,28),(6,29),(6,30),(6,31),(6,32),(6,33),(7,34),(7,35),(7,36),(7,37),(7,38),(8,39),(8,40),(8,41),(8,42),(8,43),(9,44),(9,45),(9,46),(9,47),(9,48),(10,49),(10,50),(10,51),(10,52),(10,53),(11,54),(11,55),(11,56),(11,57),(11,58),(12,59),(12,60),(12,61),(12,62),(12,63),(13,64),(13,65),(13,66),(13,67),(13,68),(13,69),(14,70),(14,71),(14,72),(14,73),(15,74),(15,75),(15,76),(15,77),(16,86),(16,87),(16,88),(16,89),(16,90),(16,91),(17,78),(17,79),(17,80),(17,81),(18,82),(18,83),(18,84),(18,85),(19,92),(19,93),(19,94),(19,95),(20,96),(20,97),(20,98),(20,99),(21,100),(21,101),(21,102),(21,103),(21,104),(21,105),(22,106),(22,107),(22,108),(22,109),(22,110),(22,111),(24,112),(24,113),(24,114),(24,115),(24,116),(24,117),(25,118),(25,119),(25,120),(25,121),(25,122),(25,123),(26,124),(26,125),(26,126),(26,127),(27,128),(27,129),(27,130),(27,131),(28,132),(28,133),(28,134),(28,135),(29,136),(29,137),(29,138),(29,139),(30,140),(30,141),(30,142),(30,143),(31,144),(31,145),(31,146),(31,147),(31,148),(32,149),(32,150),(32,151),(32,152),(33,153),(33,154),(33,155),(33,156),(34,157),(34,158),(34,159),(34,160),(34,161),(35,162),(35,163),(35,164),(35,165),(35,166),(36,167),(36,168),(36,169),(36,170),(36,171),(37,172),(37,173),(37,174),(37,175),(37,176),(38,177),(38,178),(38,179),(38,180),(39,181),(39,182),(39,183),(39,184),(40,185),(40,186),(40,187),(40,188),(41,189),(41,190),(41,191),(41,192),(42,193),(42,194),(42,195),(42,196),(43,197),(43,198),(43,199),(43,200),(44,205),(44,206),(44,207),(44,208),(44,221),(45,209),(45,210),(45,211),(45,212),(46,213),(46,214),(46,215),(46,216),(47,217),(47,218),(47,219),(47,220),(48,222),(48,223),(48,224),(48,225),(49,226),(49,227),(49,228),(49,229),(50,230),(50,231),(50,232),(50,233),(51,234),(51,235),(51,236),(51,237),(52,238),(52,239),(52,240),(52,241),(53,242),(53,243),(53,244),(53,245),(53,246),(54,247),(54,248),(54,249),(54,250),(54,251),(55,252),(55,253),(55,254),(55,255),(56,256),(56,257),(56,258),(56,259),(57,260),(57,261),(57,262),(57,263),(58,264),(58,265),(58,266),(58,267),(59,268),(59,269),(59,270),(59,271),(60,272),(60,273),(60,274),(60,275),(61,276),(61,277),(61,278),(61,279),(62,280),(62,281),(62,282),(62,283),(62,284),(63,285),(63,286),(63,287),(63,288),(63,289),(64,290),(64,291),(64,292),(64,293),(65,290),(66,294),(66,295),(66,296),(66,297),(67,298),(67,299),(67,300),(67,301),(68,302),(68,303),(68,304),(68,305),(68,306),(68,691),(68,692),(68,693),(68,697),(69,307),(69,308),(69,309),(69,310),(69,311),(69,694),(69,695),(69,698),(69,699),(70,312),(70,313),(70,314),(70,315),(71,316),(71,317),(71,318),(71,319),(72,320),(72,321),(72,322),(72,323),(73,324),(73,325),(73,326),(73,327),(73,700),(74,332),(74,333),(74,334),(74,335),(74,337),(74,702),(75,328),(75,329),(75,330),(75,331),(75,336),(76,338),(76,339),(76,340),(76,341),(76,346),(77,342),(77,343),(77,344),(77,345),(77,704),(78,347),(78,348),(78,349),(78,350),(78,351),(79,352),(79,353),(79,354),(79,355),(79,356),(80,357),(80,358),(80,359),(80,360),(80,361),(80,707),(80,708),(80,709),(81,362),(81,363),(81,364),(81,365),(81,366),(81,368),(81,369),(81,711),(81,712),(82,370),(82,371),(82,372),(82,373),(82,374),(82,375),(83,376),(83,377),(83,378),(83,379),(83,380),(83,381),(83,715),(83,716),(84,388),(84,389),(84,390),(84,391),(84,392),(84,393),(84,718),(85,382),(85,383),(85,384),(85,385),(85,386),(85,387),(86,398),(86,399),(86,400),(86,401),(86,403),(87,394),(87,395),(87,396),(87,397),(87,402),(88,404),(88,405),(88,406),(88,407),(88,412),(89,408),(89,409),(89,410),(89,411),(89,413),(90,414),(90,415),(90,416),(90,417),(90,418),(91,415),(92,415),(93,419),(93,420),(93,421),(93,422),(94,419),(95,419),(96,423),(96,424),(96,425),(96,426),(97,423),(98,427),(98,428),(98,429),(98,430),(98,440),(99,431),(99,432),(99,433),(99,434),(99,441),(100,435),(100,436),(100,437),(100,438),(100,442),(101,443),(101,444),(101,445),(101,446),(101,447),(102,443),(103,448),(103,449),(103,450),(103,451),(104,452),(104,453),(104,454),(104,455),(105,460),(105,461),(105,462),(105,463),(105,469),(106,456),(106,457),(106,458),(106,459),(106,468),(107,470),(107,471),(107,472),(107,473),(107,482),(108,474),(108,475),(108,476),(108,477),(108,483),(109,478),(109,479),(109,480),(109,481),(109,484),(110,497),(110,498),(110,499),(110,500),(110,504),(111,489),(111,490),(111,491),(111,492),(111,502),(112,493),(112,494),(112,495),(112,496),(112,503),(113,485),(113,486),(113,487),(113,488),(113,501),(114,505),(114,506),(114,507),(114,508),(114,509),(115,505),(116,510),(116,511),(116,512),(116,513),(116,514),(117,510),(118,523),(118,524),(118,525),(118,526),(119,519),(119,520),(119,521),(119,522),(120,515),(120,516),(120,517),(120,518),(121,531),(121,532),(121,533),(121,534),(121,535),(122,536),(122,537),(122,538),(122,539),(122,540),(123,541),(123,542),(123,543),(123,544),(123,549),(124,545),(124,546),(124,547),(124,548),(124,550),(125,551),(125,552),(125,553),(125,554),(125,559),(126,555),(126,556),(126,557),(126,558),(126,560),(127,565),(127,566),(127,567),(127,568),(127,574),(128,561),(128,562),(128,563),(128,564),(128,573),(129,575),(129,576),(129,577),(129,578),(129,583),(130,579),(130,580),(130,581),(130,582),(130,584),(131,585),(131,586),(131,587),(131,588),(131,589),(132,585),(133,590),(133,591),(133,592),(133,593),(133,598),(134,594),(134,595),(134,596),(134,597),(134,599),(135,608),(135,609),(135,610),(135,611),(135,614),(136,600),(136,601),(136,602),(136,603),(136,612),(137,604),(137,605),(137,606),(137,607),(137,613),(138,620),(138,621),(138,622),(138,623),(138,624),(138,626),(139,615),(139,616),(139,617),(139,618),(139,619),(139,625),(140,660),(140,661),(141,662),(141,663),(141,664),(142,665),(142,666),(142,667),(142,668),(143,669),(143,670),(143,671),(143,672),(144,677),(144,678),(144,679),(144,680),(145,673),(145,674),(145,675),(145,676),(146,681),(146,682),(147,683),(147,684),(148,687),(148,688),(148,689),(148,690),(149,685),(149,686),(150,719),(150,720),(150,721),(150,722),(151,723),(151,724),(151,725),(151,726),(152,727),(153,727),(153,728),(153,729),(156,730),(156,731),(156,732),(156,733),(156,734),(157,736),(159,737),(159,738),(159,739),(159,740),(160,747),(160,799),(160,800),(160,801),(160,802),(161,746),(161,757),(161,771),(161,772),(161,773),(161,774),(162,745),(162,793),(162,794),(162,795),(162,796),(162,797),(163,744),(163,758),(163,788),(163,789),(163,790),(163,791),(163,792),(163,803),(163,804),(163,805),(163,806),(163,807),(163,808),(163,809),(163,810),(163,811),(164,743),(164,764),(164,765),(164,766),(164,767),(164,768),(164,769),(164,783),(164,784),(164,785),(164,786),(164,787),(165,843),(165,844),(165,845),(165,846),(166,831),(166,832),(166,833),(166,834),(167,847),(167,848),(167,849),(167,850),(168,823),(168,824),(168,825),(168,826),(169,839),(169,840),(169,841),(169,842),(170,835),(170,836),(170,837),(170,838),(171,815),(171,816),(171,817),(171,818),(171,827),(171,828),(171,829),(171,830),(172,819),(172,820),(172,821),(172,822),(173,851),(173,852),(173,853),(173,854),(173,863),(174,859),(174,860),(174,861),(174,862),(175,855),(175,856),(175,857),(175,858),(175,864),(176,881),(176,882),(176,883),(176,884),(177,877),(177,878),(177,879),(177,880),(178,869),(178,870),(178,871),(178,872),(179,873),(179,874),(179,875),(179,876),(180,865),(180,866),(180,867),(180,868),(181,920),(181,921),(181,922),(182,887),(182,888),(182,889),(182,890),(183,891),(183,892),(183,893),(183,894),(184,895),(184,896),(184,897),(184,898),(186,899),(186,900),(186,901),(186,902),(187,903),(187,904),(187,905),(187,906),(188,907),(188,908),(188,909),(188,910),(189,911),(189,912),(189,913),(189,914),(190,924),(190,925),(190,926),(191,928),(191,929),(191,930),(192,932),(192,933),(192,934),(193,955),(193,956),(193,957),(193,958),(194,967),(194,968),(194,969),(194,970),(195,959),(195,960),(195,961),(195,962),(196,963),(196,964),(196,965),(196,966),(197,951),(197,952),(197,953),(197,954),(198,947),(198,948),(198,949),(198,950),(199,975),(199,976),(199,977),(199,978),(200,971),(200,972),(200,973),(200,974),(201,943),(201,944),(201,945),(201,946),(202,939),(202,940),(202,941),(202,942),(203,935),(203,936),(203,937),(203,938),(204,983),(204,984),(204,985),(204,986),(205,991),(205,992),(205,993),(205,994),(206,979),(206,980),(206,981),(206,982),(207,987),(207,988),(207,989),(207,990),(208,996),(208,997),(208,998),(208,999),(208,1016),(208,1018),(208,1019),(208,1020),(209,1000),(209,1001),(209,1002),(209,1003),(209,1017),(210,1004),(210,1005),(210,1006),(210,1007),(211,1008),(211,1009),(211,1010),(211,1011),(212,1013),(212,1014),(212,1015),(213,1033),(213,1034),(213,1035),(213,1036),(214,1037),(214,1038),(214,1039),(214,1040),(215,1041),(215,1042),(215,1043),(215,1044),(216,1029),(216,1030),(216,1031),(216,1032),(217,1021),(217,1022),(217,1023),(217,1024),(218,1025),(218,1026),(218,1027),(218,1028),(220,1045),(220,1046),(220,1047),(220,1048),(221,1050),(221,1051),(221,1052),(222,1057),(222,1058),(222,1059),(222,1060),(223,1053),(223,1054),(223,1055),(223,1056);
/*!40000 ALTER TABLE `graph_template_input_defs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_templates`
--

DROP TABLE IF EXISTS `graph_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graph_templates` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `hash` char(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` char(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `multiple` char(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `multiple_name` (`multiple`,`name`(171)),
  KEY `name` (`name`(171))
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Contains each graph template name.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph_templates`
--

LOCK TABLES `graph_templates` WRITE;
/*!40000 ALTER TABLE `graph_templates` DISABLE KEYS */;
INSERT INTO `graph_templates` VALUES (1,'d4d9ba31d18ea0e68f8b2fd89b1dae92','Cacti Poller Statistics - Hosts',''),(2,'a50a3bc4e066509b42440ab0e06621fb','Cacti Poller Statistics - DS/RRD',''),(3,'7bb3750476173205d78e311bf6c1f29d','Cacti Poller Statistics - Boost Updates',''),(4,'9cd180035d1c3c356001443ccd3c029e','Cacti Poller Statistics - Items',''),(5,'bb6ae539aa2820d7b37da36992bd3f12','Cacti Poller Statistics - Recache',''),(6,'5cd07a18f0076e900def9b79e1785861','Cacti Poller Statistics - Processes',''),(7,'1b9b8b6504ab7b73a8e13e8671e6c509','Cacti Poller Statistics - Boost Memory',''),(8,'ad4ea3a1098d5f10fcda988546ca9d78','Cacti - User Login Statistics',''),(9,'1457dec786872e830766b2768254f8c5','Cacti - User Session Statistics',''),(10,'b0735807abd3052d4db6065f2411fb41','Cacti - User Statistics',''),(11,'716619d434129b9bd90be43618b5bb54','Cacti Poller Statistics - Boost Runtime',''),(12,'d102a1438c07245d192805e90ba5e42e','Cacti Poller Statistics - Poller Runtime',''),(13,'51954f9e80badf0c9bc1e67777210ef5','Cacti Poller Statistics - Export Graphs',''),(14,'f67c5d8ba4bbdd3ecfe7b1854745cabf','Cacti Poller Statistics - Export Duration',''),(15,'5d893f5aee233b192e02612aff47024d','Cacti Stats - Syslog Activity',''),(16,'621277ec8450d399db596a2d171cd5b3','Cacti Stats - Syslog Runtime',''),(17,'40a91456224a4426c55934ef3413a650','Cacti Stats - Syslog Alerts/Reports',''),(18,'e706b17bc68ad7f19c398dcc8f11f8c1','Cacti Stats - Thold Runtime',''),(19,'471c9e317c6367c55ccb503317a31257','Cacti Stats - Boost Average Row Size',''),(20,'5f5f062f7e63298286ce5c898eb91cf5','Cacti Stats - Boost Records',''),(21,'a8f16dfc82c0d3ab595830e70719958d','Cacti Stats - Boost Table Size',''),(22,'c3592c9f0a195076da0fcd6c01e3d676','Cacti Stats - Boost Timing Detail',''),(23,'bac8b167f00ed98fea715c2f9c6c0aaf','Cacti Stats - Collector Runtime',''),(24,'c6cc8c783be165409c113558f8f72923','Cacti Stats - Collector Items',''),(25,'945f74875f8e03aadf6735af5c0f11e5','Cacti Stats - Collector Settings',''),(26,'ffbb6607d79c397cf7a9e038a2468c4b','Cacti Stats - Collector Recache Stats',''),(27,'52d74f16af1b03f725ac2e696dc50445','Cacti Stats - WebSeer Timing',''),(28,'7581c1bece3710774ff2be60bf2ff0cc','Cacti Stats - WebSeer Download Size',''),(29,'e4089f6ac6ae8a30cfed7445bb7cce95','Cacti Stats - WebSeer Download Speed',''),(30,'2ca099e4bb6ae26846c741b6e01c73ae','Cacti Stats - WebSeer Status',''),(31,'c666eb00d5bd1f8d24e9dfb993f073c6','Cacti Stats - Export Graphs',''),(32,'2b4c7fb3d698e6bd375cddd4dbc1e083','Cacti Stats - Export Duration',''),(33,'9a5e6d7781cc1bd6cf24f64dd6ffb423','Cisco - CPU Usage',''),(34,'cd8d52f25b080c482485b61b236a433f','Device - Polling Time',''),(35,'ab37cbed8610deeffbb20dc1fe57b330','Device - Uptime',''),(36,'5deb0d66c81262843dce5f3861be9966','Interface - Traffic (bits/sec)',''),(37,'06621cd4a9289417cadcb8f9b5cfba80','Interface - Errors/Discards',''),(38,'e0d1625a1f4776a5294583659d5cee15','Interface - Unicast Packets',''),(39,'10ca5530554da7b73dc69d291bf55d38','Interface - Non-Unicast Packets',''),(40,'df244b337547b434b486662c3c5c7472','Interface - Traffic (bytes/sec)',''),(41,'1742b2066384637022d178cc5072905a','Interface - Traffic (bits/sec, 95th Percentile)',''),(42,'13b47e10b2d5db45707d61851f69c52b','Interface - Traffic (bits/sec, Total Bandwidth)',''),(43,'8ad6790c22b693680e041f21d62537ac','Interface - Traffic (bytes/sec, Total Bandwidth)',''),(44,'d4dff05337bbf42c70cb6f73647d0d2a','Interface - Multicast Packets',''),(45,'ed3f434a9ebd2f23ab9bc173d608b3d7','Interface - Broadcast Packets',''),(46,'cf96dfb22b58e08bf101ca825377fa4b','Unix - Ping Latency',''),(47,'010b90500e1fc6a05abfd542940584d0','SNMP - Generic OID Template',''),(48,'9fe8b4da353689d376b99b2ea526cc6b','Unix - Processes',''),(49,'fe5edd777a76d48fc48c11aded5211ef','Unix - Load Average',''),(50,'63610139d44d52b195cc375636653ebd','Unix - Logged in Users',''),(51,'6992ed4df4b44f3d5595386b8298f0ec','Linux - Memory Usage',''),(52,'8e7c8a511652fe4a8e65c69f3d34779d','Unix - Available Disk Space',''),(53,'5107ec0206562e77d965ce6b852ef9d4','Net-SNMP - Load Average',''),(54,'be275639d5680e94c72c0ebb4e19056d','Net-SNMP - Memory Usage',''),(55,'e8462bbe094e4e9e814d4e681671ea82','Host MIB - Logged in Users',''),(56,'62205afbd4066e5c4700338841e3901e','Host MIB - Processes',''),(57,'eee71ec20dc7b44635ab185bbf924dc4','Net-SNMP - CPU Utilization',''),(58,'4d2bdea3c52db05896b0d9323076613d','Net-SNMP - Interrupts',''),(59,'a9a2ce15df48242361bea33f786de6ee','Net-SNMP - Context Switches',''),(60,'8eeff0b956240da5625c05d4cdbfbe7f','Net-SNMP - Combined SCSI Disk I/O',''),(61,'cf044e8a7a9d21229564265d2fa2d80c','Net-SNMP - Combined SCSI Disk Bytes',''),(62,'abb5e813c9f1e8cd6fc1e393092ef8cb','Net-SNMP - Available Disk Space',''),(63,'7489e44466abee8a7d8636cb2cb14a1a','Host MIB - Available Disk Space',''),(64,'c6bb62bedec4ab97f9db9fd780bd85a6','Host MIB - CPU Utilization',''),(65,'30cbb1cfd3602413d84757642b71666a','Net-SNMP - Device I/O - Bytes Read/Written',''),(66,'aa2984e39e8c1a1a417e4de3a06be822','Net-SNMP - Device I/O - Load Averages',''),(67,'9ac598676e55dfc08efe6e4ec7c51a0a','Net-SNMP - Device I/O - Reads/Writes',''),(68,'198d51ec4faaf320ef8368c9d0812c36','SNMP - Uptime',''),(69,'34bbcd61a7e4e3bc9d5d4716b86ba9cc','PA FW - Session Utilization',''),(70,'5032df09b7cb580aaa1dff14ac75c49b','PA FW - Concurrent Sessions',''),(71,'54908a527e321f657602098931184bca','PA FW - Active Sessions',''),(72,'ee0da7aa6a0d84d1b2fc288150dc42b5','PA FW - CPU Utilization',''),(73,'3d780a2f2f5b3bab6a6869b67fb60b57','PA FW - Temperature - PA-500',''),(74,'9bd6d6c194c974806a6267ac4c6151f2','Interface - Multicast Packets',''),(75,'47c9d51345c3ddc162ae17331aa2e728','Interface - Status',''),(76,'1178bf5647a7ed3f97679ffa7000cdd5','Fortigate - CPU Load',''),(77,'7cdd7cf187f12b1165104c0df033a4a9','Fortigate - Session',''),(78,'cee1ccf1e0e5a9a5705d603bf05b721e','Fortigate - Memory Usage',''),(79,'ea8c30d7761c7633d8a360b39af1ea93',' 00 Advanced Ping',''),(80,'aa0d55cdeebcf62b3f0a29005dd9d125','SNMP_Informant_Standard - CPU Statistics',''),(81,'f759f6ace7d5cf7668bbbf7d4919a1e0','SNMP_Informant_Standard - Disk Statistics (I/O)',''),(82,'4780ae963d145d456345f53416bc2420','SNMP_Informant_Standard - Disk Statistics (%\'s)',''),(83,'72375beb4624f86e9d3181819fb76a95','SNMP_Informant_Standard - Disk Statistics (Metrics)',''),(84,'a685715cc39ded4bd336f8329f6970d5','SNMP_Informant_Standard - Memory Statistics (Usage)',''),(85,'b1e1c00a9e4ee316a5c684f13bb4551f','SNMP_Informant_Standard - Memory Statistics (Paging)',''),(86,'9a631e9b7edf3855469cfeef78d65fdb','SNMP_Informant_Standard - Network Statistics',''),(87,'f061600d07f065408c1dc7b9a1975ecc','SNMP_Informant_Standard - Network Statistics (Packets)',''),(88,'665e867126af230a3bac8ae33dbecb04','SNMP_Informant_Standard - Object Statistics','');
/*!40000 ALTER TABLE `graph_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_templates_gprint`
--

DROP TABLE IF EXISTS `graph_templates_gprint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graph_templates_gprint` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `gprint_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph_templates_gprint`
--

LOCK TABLES `graph_templates_gprint` WRITE;
/*!40000 ALTER TABLE `graph_templates_gprint` DISABLE KEYS */;
INSERT INTO `graph_templates_gprint` VALUES (2,'e9c43831e54eca8069317a2ce8c6f751','Normal','%8.2lf%s'),(3,'19414480d6897c8731c7dc6c5310653e','Exact Numbers','%8.0lf'),(4,'304a778405392f878a6db435afffc1e9','Load Average','%4.2lf'),(5,'4e72328b57f5f2bb08a83a477b6cd10c','Percent','%8.1lf %%'),(6,'d1328553f12cc004ec380588e75e2a61','Percent','%8.2lf %%'),(7,'5a301690f6d150e82e46b38c90fbcf4b','Ping','%8.2lf ms'),(8,'9317954f8b39f8ba30c3d8cc2c35fade','Percentage',' (%1.1lf %%)'),(9,'0fc59bce05cf15fda6352e4d6eb73599','Decimals','%8.3lf'),(10,'56d72ce71fca1c6b027471154d2eee39','Gigabytes',' %5.2lf Gb');
/*!40000 ALTER TABLE `graph_templates_gprint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_templates_graph`
--

DROP TABLE IF EXISTS `graph_templates_graph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graph_templates_graph` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `local_graph_template_graph_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `local_graph_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `graph_template_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `t_image_format_id` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `image_format_id` tinyint(1) NOT NULL DEFAULT 0,
  `t_title` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title_cache` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `t_height` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `height` mediumint(8) NOT NULL DEFAULT 0,
  `t_width` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `width` mediumint(8) NOT NULL DEFAULT 0,
  `t_upper_limit` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `upper_limit` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `t_lower_limit` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `lower_limit` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `t_vertical_label` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `vertical_label` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_slope_mode` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `slope_mode` char(2) COLLATE utf8mb4_unicode_ci DEFAULT 'on',
  `t_auto_scale` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `auto_scale` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_auto_scale_opts` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `auto_scale_opts` tinyint(1) NOT NULL DEFAULT 0,
  `t_auto_scale_log` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `auto_scale_log` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_scale_log_units` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `scale_log_units` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_auto_scale_rigid` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `auto_scale_rigid` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_auto_padding` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `auto_padding` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_base_value` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `base_value` mediumint(8) NOT NULL DEFAULT 0,
  `t_grouping` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `grouping` char(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `t_unit_value` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `unit_value` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_unit_exponent_value` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `unit_exponent_value` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `t_alt_y_grid` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `alt_y_grid` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_right_axis` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `right_axis` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_right_axis_label` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `right_axis_label` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_right_axis_format` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `right_axis_format` mediumint(8) DEFAULT NULL,
  `t_right_axis_formatter` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `right_axis_formatter` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_left_axis_formatter` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `left_axis_formatter` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_no_gridfit` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `no_gridfit` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_unit_length` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `unit_length` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_tab_width` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tab_width` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '30',
  `t_dynamic_labels` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `dynamic_labels` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_force_rules_legend` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `force_rules_legend` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_legend_position` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `legend_position` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_legend_direction` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `legend_direction` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `local_graph_id` (`local_graph_id`),
  KEY `graph_template_id` (`graph_template_id`),
  KEY `title_cache` (`title_cache`(191))
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Stores the actual graph data.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph_templates_graph`
--

LOCK TABLES `graph_templates_graph` WRITE;
/*!40000 ALTER TABLE `graph_templates_graph` DISABLE KEYS */;
INSERT INTO `graph_templates_graph` VALUES (1,0,0,1,'',1,'','Cacti Poller Statistics - Hosts','','',120,'',800,'','100','','0','','seconds','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','30','','','','','','','',''),(2,0,0,2,'',1,'','Cacti Poller Statistics - DS/RRD','','',120,'',800,'','100','','0','','numbers','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','30','','','','','','','',''),(3,0,0,3,'',1,'','Cacti Poller Statistics - Boost Updates','','',120,'',800,'','100','','0','','','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','30','','','','','','','',''),(4,0,0,4,'',1,'','Cacti Poller Statistics - Items','','',120,'',800,'','100','','0','','# of items','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','30','','','','','','','',''),(5,0,0,5,'',1,'','Cacti Poller Statistics - Recache','','',120,'',800,'','100','','0','','','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','30','','','','','','','',''),(6,0,0,6,'',1,'','Cacti Poller Statistics - Processes','','',120,'',800,'','100','','0','','seconds','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','30','','','','','','','',''),(7,0,0,7,'',1,'','Cacti Poller Statistics - Boost Memory','','',120,'',800,'','100','','0','','Memory','','on','','on','',2,'','','','','','','','on','',1024,'','','','','','','','','','','','','',0,'','','','','','','','','','30','','','','','','','',''),(8,0,0,8,'',1,'','|host_description| - Cacti User Login Statistic','','',120,'',500,'','100','','0','','User logins','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','30','','','','','','','',''),(9,0,0,9,'',1,'','|host_description| - Cacti User Session Statistic','','',120,'',500,'','100','','0','','User sessions','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','30','','','','','','','',''),(10,0,0,10,'',1,'','|host_description| - Cacti User Statistic','','',120,'',500,'','100','','0','','Users','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','30','','','','','','','',''),(11,0,0,11,'',1,'','Cacti Poller Statistics - Boost Runtime','','',120,'',800,'','100','','0','','','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','30','','','','','','','',''),(12,0,0,12,'',1,'','Cacti Poller Statistics - Poller Runtime','','',120,'',800,'','100','','0','','','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','30','','','','','','','',''),(13,0,0,13,'',1,'','Cacti Poller Statistics - Export Graphs','','',120,'',800,'','100','','0','','Graphs','','on','','on','',2,'','','','','','','','on','',1024,'','','','','','','','','','','','','',0,'','','','','','','','','','30','','','','','','','',''),(14,0,0,14,'',1,'','Cacti Poller Statistics - Export Duration','','',120,'',800,'','100','','0','','Duration','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','30','','','','','','','',''),(15,0,0,15,'',1,'','Cacti Stats - Syslog Activity','','',200,'',700,'','100','','0','','items','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(16,0,0,16,'',1,'','Cacti Stats - Syslog Runtime','','',200,'',700,'','100','','0','','seconds','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(17,0,0,17,'',1,'','Cacti Stats - Syslog Alerts/Reports','','',200,'',700,'','100','','0','','items','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(18,0,0,18,'',1,'','Cacti Stats - Thold Runtime','','',200,'',700,'','100','','0','','seconds','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(19,0,0,19,'',1,'','Cacti Stats - Boost Average Row Size','','',200,'',700,'','100','','0','','bytes','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','30','','','','','','0','','0'),(20,0,0,20,'',1,'','Cacti Stats - Boost Records','','',200,'',700,'','100','','0','','records','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(21,0,0,21,'',1,'','Cacti Stats - Boost Table Size','','',200,'',700,'','100','','0','','bytes','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(22,0,0,22,'',1,'','Cacti Stats - Boost Timing Detail','','',200,'',700,'','100','','0','','seconds','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(23,0,0,23,'',1,'','|query_pollerName| - Collector Runtime','','',200,'',700,'','100','','0','','seconds','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(24,0,0,24,'',1,'','|query_pollerName| - Collector Items','','',200,'',700,'','100','','0','','items','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(25,0,0,25,'',1,'','|query_pollerName| - Collector Settings','','',200,'',700,'','100','','0','','settings','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(26,0,0,26,'',1,'','Cacti Stats - Recache (Legacy)','','',200,'',700,'','100','','0','','seconds/devices','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','30','','','','','','0','','0'),(27,0,0,27,'',1,'','WebSeer - |query_webseerName| - Timing','','',200,'',700,'','100','','0','','seconds','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(28,0,0,28,'',1,'','WebSeer - |query_webseerName| - Download Size','','',200,'',700,'','100','','0','','bytes','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(29,0,0,29,'',1,'','WebSeer - |query_webseerName| - Download Speed','','',200,'',700,'','100','','0','','bytes/second','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(30,0,0,30,'',1,'','WebSeer - |query_webseerName| - Status','','',200,'',700,'','100','','0','','status','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(31,0,0,31,'',1,'','|query_exportName| - Exported Graphs','','',200,'',700,'','100','','0','','graphs','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(32,0,0,32,'',1,'','|query_exportName| - Export Duration','','',200,'',700,'','100','','0','','seconds','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(33,0,0,33,'',1,'','|host_description| - CPU Usage','','',200,'',700,'','100','','0','','percent','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','40','','','','','','0','','0'),(34,0,0,34,'',1,'','|host_description| - Polling Time','','',200,'',700,'','100','','0','','seconds','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(35,0,0,35,'',1,'','|host_description| - Uptime','','',200,'',700,'','100','','0','','days','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(36,0,0,36,'',1,'on','|host_description| - Traffic','','',120,'',500,'','100','','0','','bits per second','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','30','','','','','','','',''),(37,0,0,37,'',1,'on','|host_description| - Errors/Discards','','',120,'',500,'','100','','0','','errors/sec','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','30','','','','','','','',''),(38,0,0,38,'',1,'on','|host_description| - Unicast Packets','','',120,'',500,'','100','','0','','packets/sec','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','30','','','','','','','',''),(39,0,0,39,'',1,'on','|host_description| - Non-Unicast Packets','','',120,'',500,'','100','','0','','packets/sec','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','30','','','','','','','',''),(40,0,0,40,'',1,'on','|host_description| - Traffic','','',120,'',500,'','100','','0','','bytes per second','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','30','','','','','','','',''),(41,0,0,41,'',1,'on','|host_description| - Traffic','','',120,'',500,'','100','','0','','bits per second','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','30','','','','','','','',''),(42,0,0,42,'',1,'on','|host_description| - Traffic','','',120,'',500,'','100','','0','','bits per second','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','30','','','','','','0','','0'),(43,0,0,43,'',1,'on','|host_description| - Traffic','','',120,'',500,'','100','','0','','bytes per second','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','30','','','','','','','',''),(44,0,0,44,'',1,'on','|host_description| - Multicast Packets','','',200,'',700,'','100','','0','','packets/sec','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(45,0,0,45,'',1,'on','|host_description| - Broadcast Packets','','',200,'',700,'','100','','0','','packets/sec','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(46,0,0,46,'',1,'','|host_description| - Ping Latency','','',200,'',700,'','100','','0','','milliseconds','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','40','','','','','','','',''),(47,0,0,47,'',1,'on','|host_description| -','','',200,'',700,'','100','','0','on','','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','40','','','','','','0','','0'),(48,0,0,48,'',1,'','|host_description| - Processes','','',200,'',700,'','100','','0','','processes','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','40','','','','','','0','','0'),(49,0,0,49,'',1,'','|host_description| - Load Average','','',200,'',700,'','100','','0','','run que length','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','0','','','','','','','',0,'','0','','0','','','','','','40','','','','','','0','','0'),(50,0,0,50,'',1,'','|host_description| - Logged in Users','','',200,'',700,'','100','','0','','users','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','40','','','','','','','',''),(51,0,0,51,'',1,'','|host_description| - Memory Usage','','',200,'',700,'','100','','0','','bytes','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','40','','','','','','0','','0'),(52,0,0,52,'',1,'on','|host_description| - Available Disk Space','','',200,'',700,'','100','','0','','bytes','','on','','on','',2,'','','','','','on','','on','',1024,'','','','','','','','','','','','','',0,'','','','','','','','','','40','','','','','','','',''),(53,0,0,53,'',1,'','|host_description| - Load Average','','',200,'',700,'','100','','0','','run queue','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','40','','','','','','0','','0'),(54,0,0,54,'',1,'','|host_description| - Memory Usage','','',200,'',700,'','100','','0','','bytes','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','40','','','','','','0','','0'),(55,0,0,55,'',1,'','|host_description| - Logged in Users','','',200,'',700,'','100','','0','','users','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','40','','','','','','','',''),(56,0,0,56,'',1,'','|host_description| - Processes','','',200,'',700,'','100','','0','','processes','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','40','','','','','','','',''),(57,0,0,57,'',1,'','|host_description| - CPU Utilization','','',200,'',700,'','100','','0','','percent','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','','','','','','','','',''),(58,0,0,58,'',1,'','|host_description| - Interrupts','','',200,'',700,'','100','','0','','Interrupts','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','','','','','','','','',''),(59,0,0,59,'',1,'','|host_description| - Context Switches','','',200,'',700,'','100','','0','','Context Switches','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(60,0,0,60,'',1,'','|host_description| - Combined SCSI Disk I/O','','',200,'',700,'','100','','0','','operations/second','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(61,0,0,61,'',1,'','|host_description| - Combined SCSI Disk Bytes','','',200,'',700,'','100','','0','','bytes/second','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(62,0,0,62,'',1,'on','|host_description| - Hard Drive Space','','',200,'',700,'','100','','0','','bytes','','on','','on','',2,'','','','','','on','','on','',1024,'','','','','','','','','','','','','',0,'','0','','0','','','','','','40','','','','','','0','','0'),(63,0,0,63,'',1,'on','|host_description| - Available Disk Space','','',200,'',700,'','100','','0','','bytes','','on','','on','',2,'','','','','','on','','on','',1024,'','','','','','','','','','','','','',0,'','','','','','','','','','40','','','','','','','',''),(64,0,0,64,'',1,'on','|host_description| - CPU Utilization','','',200,'',700,'','110','','0','','percent','','on','','','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','40','','','','','','0','','0'),(65,0,0,65,'',1,'','|host_description| - Device I/O - Bytes Read/Written |query_diskIODevice|','','',200,'',700,'','0','','0','','Bytes Read/Written','','on','','on','',2,'','','','','','','','on','',1024,'','','','','','','','','','','','','',0,'','','','','','','','','','','','','','','','','',''),(66,0,0,66,'',1,'','|host_description| - Device I/O - Load Averages - |query_diskIODevice|','','',200,'',700,'','100','','0','','Load Average','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(67,0,0,67,'',1,'','|host_description| - Device I/O - Reads/Writes |query_diskIODevice|','','',200,'',700,'','0','','0','','Reads/Writes','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','','','','','','','','',''),(68,48,1,48,'',1,'','|host_description| - Processes','Cacti-Template - Processes','',200,'',700,'','100','','0','','processes','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','40','','','','','','0','','0'),(69,49,2,49,'',1,'','|host_description| - Load Average','Cacti-Template - Load Average','',200,'',700,'','100','','0','','run que length','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','0','','','','','','','',0,'','0','','0','','','','','','40','','','','','','0','','0'),(70,50,3,50,'',1,'','|host_description| - Logged in Users','Cacti-Template - Logged in Users','',200,'',700,'','100','','0','','users','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','40','','','','','','','',''),(71,51,4,51,'',1,'','|host_description| - Memory Usage','Cacti-Template - Memory Usage','',200,'',700,'','100','','0','','bytes','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','40','','','','','','0','','0'),(72,0,0,68,'',1,'','SNMP - Uptime','','',120,'',500,'','100','','0','','Days','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','30','','','','','','','',''),(73,0,0,69,'',1,'','|host_description| - Session Utilization %','','',120,'',500,'','100','','0','','Percent','','on','','','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','30','','','','','','','',''),(74,0,0,70,'',1,'','|host_description| - Concurrent Sessions','','',120,'',500,'','25000','','0','','Count','','on','','on','',1,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','30','','','','','','','',''),(75,0,0,71,'',1,'','|host_description| - Active Sessions','','',120,'',500,'on','65534','','0','','Session Count','','on','','','',1,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','30','','','','','','0','','0'),(76,0,0,72,'',1,'','|host_description| -  CPU Utilization','','',120,'',500,'','100','','0','','% Utilization','','on','','on','',1,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','30','','','','','','0','','0'),(77,0,0,73,'',1,'','|host_description| - Temperature','','',120,'',500,'','160','','0','','Degrees Celcius','','on','','','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','30','','','','','','0','','0'),(78,0,0,74,'',1,'on','|host_description| - Multicast Packets','','',120,'',500,'','100','','0','','packets/sec','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','30','','','','','','','',''),(79,0,0,75,'',1,'on','|host_description| - Interface Status','','',50,'',500,'','100','','0','','status','','on','','on','',2,'','','','','','on','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','30','','','','','','','',''),(80,0,0,76,'',1,'','|host_description| - CPU Load','','',120,'',500,'','100','','0','','percent %','','on','','on','',2,'','','',NULL,'','on','','on','',1000,'','','','','','','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','30','',NULL,'',NULL,'',NULL,'',NULL),(81,0,0,77,'',1,'on','|host_description| - Fortigate - Sessions','','',120,'',500,'','100','','0','','Sessions','','on','','on','',2,'','','',NULL,'','','','on','',1000,'','','','','','','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','30','',NULL,'',NULL,'',NULL,'',NULL),(82,0,0,78,'',1,'','|host_description| - Memory Usage','','',120,'',500,'','100','','0','','percent %','','on','','on','',2,'','','',NULL,'','on','','on','',1000,'','','','','','','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','30','',NULL,'',NULL,'',NULL,'',NULL),(83,0,0,79,'',1,'','|host_description| - Advanced Ping','','',240,'',750,'','5000','','0','','milliseconds','','on','','on','',2,'','','','','','','','','',1000,'','','','','','1','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','30','',NULL,'',NULL,'',NULL,'',NULL),(84,0,0,80,'',1,'on','|host_description| CPU |query_cpuInstance| Usage','','',200,'',700,'','100','','0','','CPU Usage','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','30','',NULL,'',NULL,'',NULL,'',NULL),(85,0,0,81,'',1,'on','|host_description| - Disk |query_lDiskInstance| (I/O)','','',200,'',700,'','100','','0','','Disk (I/O)','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','30','',NULL,'',NULL,'',NULL,'',NULL),(86,0,0,82,'',1,'on','|host_description| - Disk |query_lDiskInstance| (Percent Usage)','','',200,'',700,'','100','','0','','Percent Usage %','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','30','',NULL,'',NULL,'',NULL,'',NULL),(87,0,0,83,'',1,'on','|host_description| - Disk |query_lDiskInstance| (Queues/Transfers)','','',200,'',700,'','100','','0','','Disk (Queues/Transfers)','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','30','',NULL,'',NULL,'',NULL,'',NULL),(88,0,0,84,'',1,'on','|host_description| Memory (Usage)','','',200,'',700,'','100','','0','','Memory (Usage)','','on','','on','',2,'','','','','','','','on','',1024,'','','','','','','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','30','',NULL,'',NULL,'',NULL,'',NULL),(89,0,0,85,'',1,'on','|host_description| Memory (Paging)','','',200,'',700,'','100','','0','','Memory (Paging)','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','30','',NULL,'',NULL,'',NULL,'',NULL),(90,0,0,86,'',1,'on','|host_description| Network (I/O) |query_netInstance|','','',200,'',700,'','100','','0','','Network (I/O)','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','30','',NULL,'',NULL,'',NULL,'',NULL),(91,0,0,87,'',1,'on','|host_description| Network (Packets) |query_netInstance|','','',200,'',700,'','100','','0','','Network (Packets)','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','30','',NULL,'',NULL,'',NULL,'',NULL),(92,0,0,88,'',1,'on','|host_description| - Objects (Processes/Threads)','','',200,'',700,'','100','','0','','Objects (Processes/Threads)','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'',NULL,'','30','',NULL,'',NULL,'',NULL,'',NULL),(93,83,5,79,'',1,'','|host_description| - Advanced Ping','Cacti-Template - Advanced Ping','',240,'',750,'','5000','','0','','milliseconds','','on','','on','',2,'','','','','','','','','',1000,'','','','','','1','',NULL,'',NULL,'',NULL,'',0,'',NULL,'',NULL,'',NULL,'',NULL,'','30','',NULL,'',NULL,'',NULL,'',NULL),(94,52,6,52,'',1,'','|host_description| - Disk Space - |query_dskDevice|','Cacti-Template - Disk Space - /dev/mapper/centos-root','',200,'',700,'','100','','0','','bytes','','on','','on','',2,'','','','','','on','','on','',1024,'','','','','','','','','','','','','',0,'','','','','','','','','','40','','','','','','','',''),(96,1,8,1,'',1,'','Cacti Poller Statistics - Hosts','Cacti Poller Statistics - Hosts','',120,'',800,'','100','','0','','seconds','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','30','','','','','','','',''),(97,2,9,2,'',1,'','Cacti Poller Statistics - DS/RRD','Cacti Poller Statistics - DS/RRD','',120,'',800,'','100','','0','','numbers','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','30','','','','','','','',''),(98,3,10,3,'',1,'','Cacti Poller Statistics - Boost Updates','Cacti Poller Statistics - Boost Updates','',120,'',800,'','100','','0','','','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','30','','','','','','','',''),(99,4,11,4,'',1,'','Cacti Poller Statistics - Items','Cacti Poller Statistics - Items','',120,'',800,'','100','','0','','# of items','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','30','','','','','','','',''),(100,5,12,5,'',1,'','Cacti Poller Statistics - Recache','Cacti Poller Statistics - Recache','',120,'',800,'','100','','0','','','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','30','','','','','','','',''),(101,6,13,6,'',1,'','Cacti Poller Statistics - Processes','Cacti Poller Statistics - Processes','',120,'',800,'','100','','0','','seconds','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','30','','','','','','','',''),(102,7,14,7,'',1,'','Cacti Poller Statistics - Boost Memory','Cacti Poller Statistics - Boost Memory','',120,'',800,'','100','','0','','Memory','','on','','on','',2,'','','','','','','','on','',1024,'','','','','','','','','','','','','',0,'','','','','','','','','','30','','','','','','','',''),(103,8,15,8,'',1,'','|host_description| - Cacti User Login Statistic','Cacti-Template - Cacti User Login Statistic','',120,'',500,'','100','','0','','User logins','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','30','','','','','','','',''),(104,9,16,9,'',1,'','|host_description| - Cacti User Session Statistic','Cacti-Template - Cacti User Session Statistic','',120,'',500,'','100','','0','','User sessions','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','30','','','','','','','',''),(105,10,17,10,'',1,'','|host_description| - Cacti User Statistic','Cacti-Template - Cacti User Statistic','',120,'',500,'','100','','0','','Users','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','30','','','','','','','',''),(106,11,18,11,'',1,'','Cacti Poller Statistics - Boost Runtime','Cacti Poller Statistics - Boost Runtime','',120,'',800,'','100','','0','','','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','30','','','','','','','',''),(107,12,19,12,'',1,'','Cacti Poller Statistics - Poller Runtime','Cacti Poller Statistics - Poller Runtime','',120,'',800,'','100','','0','','','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','30','','','','','','','',''),(108,13,20,13,'',1,'','Cacti Poller Statistics - Export Graphs','Cacti Poller Statistics - Export Graphs','',120,'',800,'','100','','0','','Graphs','','on','','on','',2,'','','','','','','','on','',1024,'','','','','','','','','','','','','',0,'','','','','','','','','','30','','','','','','','',''),(109,14,21,14,'',1,'','Cacti Poller Statistics - Export Duration','Cacti Poller Statistics - Export Duration','',120,'',800,'','100','','0','','Duration','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','','','','','','','','','30','','','','','','','',''),(110,15,22,15,'',1,'','Cacti Stats - Syslog Activity','Cacti Stats - Syslog Activity','',200,'',700,'','100','','0','','items','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(111,16,23,16,'',1,'','Cacti Stats - Syslog Runtime','Cacti Stats - Syslog Runtime','',200,'',700,'','100','','0','','seconds','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(112,17,24,17,'',1,'','Cacti Stats - Syslog Alerts/Reports','Cacti Stats - Syslog Alerts/Reports','',200,'',700,'','100','','0','','items','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(113,18,25,18,'',1,'','Cacti Stats - Thold Runtime','Cacti Stats - Thold Runtime','',200,'',700,'','100','','0','','seconds','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(114,19,26,19,'',1,'','Cacti Stats - Boost Average Row Size','Cacti Stats - Boost Average Row Size','',200,'',700,'','100','','0','','bytes','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','30','','','','','','0','','0'),(115,20,27,20,'',1,'','Cacti Stats - Boost Records','Cacti Stats - Boost Records','',200,'',700,'','100','','0','','records','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(116,21,28,21,'',1,'','Cacti Stats - Boost Table Size','Cacti Stats - Boost Table Size','',200,'',700,'','100','','0','','bytes','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0'),(117,22,29,22,'',1,'','Cacti Stats - Boost Timing Detail','Cacti Stats - Boost Timing Detail','',200,'',700,'','100','','0','','seconds','','on','','on','',2,'','','','','','','','on','',1000,'','','','','','','','','','','','','',0,'','0','','0','','','','','','','','','','','','0','','0');
/*!40000 ALTER TABLE `graph_templates_graph` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_templates_item`
--

DROP TABLE IF EXISTS `graph_templates_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graph_templates_item` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `local_graph_template_item_id` int(12) unsigned NOT NULL DEFAULT 0,
  `local_graph_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `graph_template_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `task_item_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `color_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `alpha` char(2) COLLATE utf8mb4_unicode_ci DEFAULT 'FF',
  `graph_type_id` tinyint(3) NOT NULL DEFAULT 0,
  `line_width` decimal(4,2) DEFAULT 0.00,
  `dashes` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dash_offset` mediumint(4) DEFAULT NULL,
  `cdef_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `vdef_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `shift` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `consolidation_function_id` tinyint(2) NOT NULL DEFAULT 0,
  `textalign` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_format` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hard_return` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gprint_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `sequence` mediumint(8) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `graph_template_id` (`graph_template_id`),
  KEY `local_graph_id_sequence` (`local_graph_id`,`sequence`),
  KEY `task_item_id` (`task_item_id`),
  KEY `lgi_gti` (`local_graph_id`,`graph_template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1423 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Stores the actual graph item data.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph_templates_item`
--

LOCK TABLES `graph_templates_item` WRITE;
/*!40000 ALTER TABLE `graph_templates_item` DISABLE KEYS */;
INSERT INTO `graph_templates_item` VALUES (1,'fbafaae9c5873bcb0ea5d296e78c50ea',0,0,1,4,9,'7F',7,0.00,'',0,0,0,'',3,'','Hosts','','',2,9),(2,'34a226b489fd87466bfe001979ac914d',0,0,1,4,0,'FF',9,0.00,'',0,0,0,'',2,'','Minimum:','','',2,10),(3,'7d862c50648383dbd4f61a7c855e9125',0,0,1,4,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,11),(4,'5c95dc09177224405bfc9c8327b500de',0,0,1,4,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,12),(5,'29893153e2ebf92d76b6be6406364827',0,0,1,4,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,13),(6,'307b0e1d79f9e6c82422bdec60cb53fc',0,0,1,3,21,'FF',4,0.00,'',0,0,0,'',3,'','Hosts per Process','','',2,14),(7,'3a589db3c639a4656239ef91bdb7d963',0,0,1,3,0,'FF',9,0.00,'',0,0,0,'',2,'','Minimum:','','',2,15),(8,'95801ded6f69369331ffee4172831aac',0,0,1,3,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,16),(9,'38a2601d6ab38676eacd4fad70fa449c',0,0,1,3,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,17),(10,'31fd36f9eecfff1022bebbf8284124d3',0,0,1,3,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,18),(11,'1356201ec5a1edfcdb125799157885e4',0,0,2,2,21,'7F',7,0.00,'',0,0,0,'',1,'','DataSources','','',2,1),(12,'638f573f3bea2c92c33c4ef5b36f6676',0,0,2,2,0,'FF',9,0.00,'',0,0,0,'',2,'','Minimum:','','',2,2),(13,'cb283c3ea8d75bbfcbfc6af2c318d2ca',0,0,2,2,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,3),(14,'aed104112c9d02c3dcf5ef6d426e6d94',0,0,2,2,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,4),(15,'e35f2eb9a56c5bd4854700b07563bb35',0,0,2,2,0,'FF',9,0.00,'',0,0,0,'',3,'','Max:','','on',2,5),(16,'56d2404d75b888ebd26642b2c761aed9',0,0,2,2,21,'FF',4,0.00,'',0,0,0,'',3,'','Peak','','on',2,6),(17,'e31399b630bdb4fe4edd388d5f39f30d',0,0,2,1,22,'7F',7,0.00,'',0,0,0,'',1,'','RRDs','','',2,7),(18,'d97dde4ed16452e3606f97192b77f431',0,0,2,1,0,'FF',9,0.00,'',0,0,0,'',2,'','Minimum:','','',2,8),(19,'f4ce5c3b7b41afc8697e67d03ac237c5',0,0,2,1,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,9),(20,'e658a67093b52dda92170fa4de2891f7',0,0,2,1,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,10),(21,'35ad8af76239bf66294a5363b9232066',0,0,2,1,0,'FF',9,0.00,'',0,0,0,'',3,'','Max:','','on',2,11),(22,'f3ec7d169b458637d2ceaf1af37e2f27',0,0,2,1,22,'FF',4,0.00,'',0,0,0,'',3,'','Peak','','on',2,12),(23,'fcbadf401144aca864ee6e351dbefc71',0,0,3,9,21,'7F',7,0.00,'',0,0,0,'',1,'','RRD Updates','','',2,5),(24,'af50026d641256fd5680bf0a29cbd71c',0,0,3,9,0,'FF',9,0.00,'',0,0,0,'',2,'','Minimum:','','',2,6),(25,'f0b956b88bb80efdd2274e8fc854e3f6',0,0,3,9,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,7),(26,'ae0c95809d23aa0f352588e8687b18bd',0,0,3,9,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,8),(27,'dc5c9a4d95596a2f53bc3e750328bbbd',0,0,3,9,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,9),(28,'110e98061ccd2b0ad3e3484cb543fc2a',0,0,3,9,21,'FF',4,0.00,'',0,0,0,'',3,'','Peak','','on',2,10),(29,'32cbb9bde78d9d3611655d4ac4e54675',0,0,4,10,9,'FF',4,0.00,'',0,0,0,'',1,'','SNMP','','',2,1),(30,'16f8e7e12c7260fd96be5ee9cfba2c3e',0,0,4,10,0,'FF',9,0.00,'',0,0,0,'',2,'','Minimum:','','',2,2),(31,'55bdcf6eadd5c7c4d92bc7bdd0a1cac5',0,0,4,10,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,3),(32,'1e8b5a13351b987ecbac92383ee69c65',0,0,4,10,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,4),(33,'869609c7466eb1aa33341fc6a9b6a35d',0,0,4,10,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,5),(34,'f23734f91729f5e138af13364029c7ce',0,0,4,11,21,'FF',4,0.00,'',0,0,0,'',1,'','Scripts','','',2,6),(35,'0c61d6797018820bdef94dfe21756cf5',0,0,4,11,0,'FF',9,0.00,'',0,0,0,'',2,'','Minimum:','','',2,7),(36,'1b4d3a3012335db9379f467358c2bb6d',0,0,4,11,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,8),(37,'1830564fe0d6c049416579e32205e2a7',0,0,4,11,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,9),(38,'efdc02a9435514c364db2b92fe7fe509',0,0,4,11,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,10),(39,'27d50f2128ea10ffd3e35957cb709fe0',0,0,4,12,12,'FF',4,0.00,'',0,0,0,'',1,'','Script Server','','',2,11),(40,'c9b2c90d4d9878796780cb761d73fa8f',0,0,4,12,0,'FF',9,0.00,'',0,0,0,'',2,'','Minimum:','','',2,12),(41,'637a299a9a12c774df8313a031325966',0,0,4,12,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,13),(42,'74e490ca676857d171128263ab09b706',0,0,4,12,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,14),(43,'f863289ac9e6a795504a3d050dbd324f',0,0,4,12,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,15),(44,'04fb5222980d21b5251e1c9ed5d347db',0,0,5,14,9,'FF',4,0.00,'',0,0,0,'',1,'','Time','','',2,1),(45,'2ba70e81c22c689ee9c58709222ce49e',0,0,5,14,0,'FF',9,0.00,'',0,0,0,'',2,'','Minimum:','','',2,2),(46,'c727c1b340f092245c9bde6d87c6ddc6',0,0,5,14,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,3),(47,'8639f3c18e23ecf82d33e17ea2fe5f26',0,0,5,14,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,4),(48,'4dccef4553ab01ada824f8e65778c812',0,0,5,14,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,5),(49,'40319938001b6d218ce1db73c88a6b3a',0,0,5,13,21,'FF',4,0.00,'',0,0,0,'',1,'','Hosts','','',2,6),(50,'016456cbbd0e8192edc6ade57092ad5e',0,0,5,13,0,'FF',9,0.00,'',0,0,0,'',2,'','Minimum:','','',2,7),(51,'f5ec7bf6219291a82cf21db887e6aa4d',0,0,5,13,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,8),(52,'623af2e8a0466b4f77aa5aadda2ca456',0,0,5,13,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,9),(53,'59159dce481d701109e86a9606b32ac0',0,0,5,13,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,10),(54,'3c764c5315fffd7c67b3fa1dfca25bc1',0,0,6,6,22,'FF',7,0.00,'',0,0,0,'',3,'','Processes','','',2,5),(55,'c37e620d7448ef974823943ccc11352d',0,0,6,6,0,'FF',9,0.00,'',0,0,0,'',2,'','Minimum:','','',2,6),(56,'e1d514b3cface87552f96ddd3d759769',0,0,6,6,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,7),(57,'e5840dc4e0b35c9c81ada6a3e2a28c97',0,0,6,6,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,8),(58,'8783841513dcaa7482ec88095e5a31f3',0,0,6,6,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,9),(59,'75526bdbdfaf4453a152c2f3b21500e2',0,0,6,5,21,'FF',4,0.00,'',0,0,0,'',3,'','Threads','','',2,10),(60,'24f8242b4bd303dcf553472b5136497a',0,0,6,5,0,'FF',9,0.00,'',0,0,0,'',2,'','Minimum:','','',2,11),(61,'e9a67f629ecc1629fb887f1f4a736871',0,0,6,5,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,12),(62,'b3768741be21ff91be6f1b3d1854b3d9',0,0,6,5,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,13),(63,'03cc00dfac46da693a8ea5117aa71c85',0,0,6,5,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,14),(64,'73babc37c735c91d6470277c475e2f15',0,0,7,15,33,'99',7,0.00,'',0,0,0,'',1,'','Memory','','',2,1),(65,'50fc91a3f4ad4e4cfc0cf8a9bd6ff8b5',0,0,7,15,0,'FF',9,0.00,'',0,0,0,'',2,'','Minimum:','','',2,2),(66,'592b60422e32093971aa2c7e11cf008c',0,0,7,15,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,3),(67,'9763a5c1d8da163c9bc6f71775f260bf',0,0,7,15,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,4),(68,'cf2232500ece6afbc42356874bd23e36',0,0,7,15,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,5),(69,'cff727ebf877a5749700cc731a6ff92a',0,0,7,15,9,'FF',4,0.00,'',0,0,0,'',3,'','Peak Usage','','on',2,6),(70,'27754544d0fc505b19738949205c6307',0,0,8,22,9,'FF',7,0.00,'',0,0,0,'',1,'','invalid logins','','',2,1),(71,'0bfdda0f8488820341ecd83a11fd9be5',0,0,8,22,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,2),(72,'a4bf9518e8f49635c3b4143920081e12',0,0,8,22,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,3),(73,'365dc64f4e9cfb67eab245384ca7690e',0,0,8,22,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,4),(74,'221fcbbcaf4645f84c1872814cda7c9c',0,0,8,18,12,'FF',8,0.00,'',0,0,0,'',1,'','valid logins','','',2,5),(75,'b729d06939a4f87445a8ee4cddab6658',0,0,8,18,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,6),(76,'8b22c33cd263e4db5de2445bee127628',0,0,8,18,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,7),(77,'955e9fb6e7f969da1357561132bc8fc8',0,0,8,18,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,8),(78,'f0a60d7066fd0b24bde61889874a31d0',0,0,9,19,67,'FF',7,0.00,'',0,0,0,'',1,'','sleeping sessions','','',2,1),(79,'2125e19cca095ef5d1b7ce3c4d15b359',0,0,9,19,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,2),(80,'1f3aca03fb77d7188138c06696079c53',0,0,9,19,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,3),(81,'fb3188b591f50074e9caf7bf7923a1bd',0,0,9,19,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,4),(82,'4a7a0e5a40310ebea976a5ef8c1d8af6',0,0,9,16,12,'FF',8,0.00,'',0,0,0,'',1,'','active sessions','','',2,5),(83,'12fde6a31088c5241c4ff6c9fad6aaf3',0,0,9,16,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,6),(84,'a7ff175000c7ea9895aa5c2640ee3bfc',0,0,9,16,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,7),(85,'b7fdf087a908bf9b7f419bf2f370b4e6',0,0,9,16,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,8),(86,'64503d5111bca2182bcde7beec63caf9',0,0,9,17,1,'FF',4,0.00,'',0,0,0,'',1,'','obsolete sessions','','',2,9),(87,'f9863f026563fcaba23870cda09370d9',0,0,9,17,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,10),(88,'fce8acbd7d5e28a3a28e9d9f34142bc6',0,0,9,17,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,11),(89,'11c44453bd1055fc824dc52d9c6cc476',0,0,9,17,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,12),(90,'2a525fa0df95afc0fdc13b83ad1849b5',0,0,9,17,0,'FF',1,1.00,'',0,0,0,'',1,'','','','on',2,13),(91,'ecd93a086cd132a87249f16d6a3b95c1',0,0,9,17,0,'FF',1,1.00,'',0,0,0,'',1,'','Active is defined by activity in the last 10 minutes','','on',2,14),(92,'8e81853e0aaa20a1f9b56e8ec52b8f2f',0,0,10,20,67,'FF',7,0.00,'',0,0,0,'',1,'','sleeping users','','',2,1),(93,'7543361b2bb32daaa4418056141a7a1b',0,0,10,20,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,2),(94,'a35bf36c2139020f9595cf4a53855f2a',0,0,10,20,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,3),(95,'9cfa72d4173adb00446cefd58235266d',0,0,10,20,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,4),(96,'36894aaf231e2b7f8e0001947a45fe31',0,0,10,21,12,'FF',8,0.00,'',0,0,0,'',1,'','active users','','',2,5),(97,'343950e3fdb3f1287cf276402399d870',0,0,10,21,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,6),(98,'d798830b697dba9c537a648e2d41a788',0,0,10,21,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,7),(99,'f6b89c18ac5696d55f7eda79a68de080',0,0,10,21,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,8),(100,'a025ef65367c4f939c31b28baad20c6f',0,0,11,8,9,'7F',7,0.00,'',0,0,0,'',1,'','Runtime','','',2,1),(101,'8c89dcd9c2c2c5260ca9b788ccbe1078',0,0,11,8,0,'FF',9,0.00,'',0,0,0,'',2,'','Minimum:','','',2,2),(102,'16209062ba83af6572cba1467a13f9f5',0,0,11,8,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,3),(103,'f6b696f22bcc361f10dbe04c15e80d57',0,0,11,8,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,4),(104,'b1e4bdfffdbc00028d19c9119277ac8a',0,0,11,8,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,5),(105,'e8f29eaa246674d4a61a8046fb5b7eaa',0,0,11,8,9,'FF',4,0.00,'',0,0,0,'',3,'','Peak','','on',2,6),(106,'038d96ab1dae9a6fb035e40b2fd03c06',0,0,12,7,11,'FF',4,0.00,'',0,0,0,'',1,'','Runtime','','',2,1),(107,'59fe6ca00d3941073defec6d4c69703d',0,0,12,7,0,'FF',9,0.00,'',0,0,0,'',2,'','Minimum:','','',2,2),(108,'b087aeb26e012ec7176a5181f6eca120',0,0,12,7,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,3),(109,'17cdf49b127716314510f18f7ea86c9a',0,0,12,7,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,4),(110,'ec5c007dced72c180e68503bf538796e',0,0,12,7,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,5),(111,'d3fb4700c0b543ac780a4459cf0b75fe',0,0,12,7,220,'FF',4,1.00,'',0,0,0,'',3,'','Peak','','on',2,6),(112,'b171b0ce65711d989237df6a2a4ab0e3',0,0,13,23,33,'99',7,0.00,'',0,0,0,'',1,'','Graphs','','',2,1),(113,'3286e9c1d4b442f613843ecd31ed0f24',0,0,13,23,0,'FF',9,0.00,'',0,0,0,'',2,'','Minimum:','','',2,2),(114,'4523f4b5a43910a6d35cb39521210e17',0,0,13,23,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,3),(115,'631b712a9ec7c16cdc2cc8ab8ef8a8c8',0,0,13,23,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,4),(116,'b585ca27d990822e9f1a32dfade81359',0,0,13,23,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,5),(117,'3e98b8d0b955aeb7818c1cc0c529c97f',0,0,13,23,9,'FF',4,0.00,'',0,0,0,'',3,'','Peak Usage','','on',2,6),(118,'f39c237c29b403cf0bd9d4a695845a3e',0,0,14,24,9,'7F',7,0.00,'',0,0,0,'',1,'','Duration','','',2,1),(119,'80c57edb527d637c9d20bbf261238e4c',0,0,14,24,0,'FF',9,0.00,'',0,0,0,'',2,'','Minimum:','','',2,2),(120,'af1b340c0b30ddf1d1cb4b134733c226',0,0,14,24,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,3),(121,'ff1dffa572922628933aac2bb09b0106',0,0,14,24,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,4),(122,'0c49e83a78dd32490afa07dd00454219',0,0,14,24,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,5),(123,'8cdfbd3ad8a47ed2e2302a186d9aad89',0,0,14,24,9,'FF',4,0.00,'',0,0,0,'',3,'','Peak','','on',2,6),(124,'716f1420ab963de213406a516412d2cf',0,0,15,27,349,'FF',4,1.00,'',0,0,0,'',3,'','Alarms','','',2,1),(125,'012aa68452c36b37c6544cbc789fe24c',0,0,15,27,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',3,2),(126,'0df78b80285a642c905f1744428cdf95',0,0,15,27,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',3,3),(127,'f121d0e8d04513d5ad418fc6211dfce0',0,0,15,27,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',3,4),(128,'bae36e7e302c123f7f111bf7684bd81d',0,0,15,25,21,'FF',4,1.00,'',0,0,0,'',3,'','Incoming','','',2,5),(129,'455dae758441bd63296d97930e69a59c',0,0,15,25,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',3,6),(130,'bfd0d0ce705ba3a09fc3a85fb559443f',0,0,15,25,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',3,7),(131,'20227ad68815d5ba4587711147a51093',0,0,15,25,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',3,8),(132,'b26d3ab2971fc848493a452850b4c9c7',0,0,15,28,348,'FF',4,1.00,'',0,0,0,'',3,'','Removals','','',2,9),(133,'8e3de9824672cf6cb9ae67c6a7f262be',0,0,15,28,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',3,10),(134,'ab250b40398d352e59c1e6f3ee73ac87',0,0,15,28,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',3,11),(135,'e69ef032cf24b9097eb5b4ec111ff85b',0,0,15,28,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',3,12),(136,'4a633d659023cf582a3e511adf1648e7',0,0,15,29,73,'FF',4,1.00,'',0,0,0,'',3,'','Xfers','','',2,13),(137,'74310dee669e0a53ac0bd8f9b300a19c',0,0,15,29,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',3,14),(138,'cc5d791912ec135b55e7902939f2c757',0,0,15,29,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',3,15),(139,'30ab8cafb303abace4d2c89d43ce9a19',0,0,15,29,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',3,16),(140,'d204773375b4aa791101f1d369671e7e',0,0,15,26,57,'FF',4,1.00,'',0,0,0,'',3,'','Deletes','','',2,17),(141,'caed8185f0a18522b6206c844ddbd4b6',0,0,15,26,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',3,18),(142,'a50a149f9d1f6a99f576838e04b26675',0,0,15,26,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',3,19),(143,'d2d64a8f38a1dbe90d069570c6e1c8ab',0,0,15,26,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',3,20),(144,'df377f974b5eab4e2ca1c28ab4d5707c',0,0,16,30,147,'FF',7,1.00,'',0,0,0,'',1,'','Runtime','','',2,1),(145,'24729f911d6359d880680105a50c36eb',0,0,16,30,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',2,3),(146,'6a16b23259036c99b48dba8350d8f176',0,0,16,30,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',2,4),(147,'a041fe3d908ecbc0559325803199f6dd',0,0,16,30,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',2,5),(148,'6aeb8ad840ad85a20c278db18b389d22',0,0,16,30,145,'FF',4,1.00,'',0,0,0,'',3,'','Peak','','on',2,6),(149,'e645404fa8f50a0728ee0f0b8497f145',0,0,17,31,357,'FF',4,1.00,'',0,0,0,'',1,'','Alerts','','',2,1),(150,'820a111195923253263fd088e6a3f26b',0,0,17,31,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',3,2),(151,'ae9df897b9bf829f947805e2ac06c92f',0,0,17,31,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',3,3),(152,'bbab846026945121c0978c86248cd67a',0,0,17,31,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',3,4),(153,'0279878d31321a2a823b2482c3c4e2b3',0,0,17,32,78,'FF',4,1.00,'',0,0,0,'',1,'','Reports','','',2,5),(154,'4df64c107b86749dfdf7a4b127ae3a5c',0,0,17,32,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',3,6),(155,'e830b1c6d23710a36411f68c617f3948',0,0,17,32,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',3,7),(156,'12331f7b11cfcc046b0f1e9bc1d7fac4',0,0,17,32,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',3,8),(157,'aea38ece8b8b30d21485c0b193c77eff',0,0,18,33,326,'FF',7,1.00,'',0,0,0,'',1,'','Runtime','','',2,1),(158,'5d5e84e81929c7e6ed528c3d387aafe7',0,0,18,33,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',2,2),(159,'01395a1a1d3fce41cdd179a4173073d1',0,0,18,33,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',2,3),(160,'373d780cb5937fcbc8ad34434f9afe0f',0,0,18,33,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',2,4),(161,'43056bf401422ce4438364e8dc2b7c0d',0,0,18,33,357,'FF',4,1.00,'',0,0,0,'',3,'','Peak','','on',2,5),(162,'38d4e3f04ddea34a2bf90f74949270ab',0,0,19,34,348,'FF',7,1.00,'',0,0,0,'',1,'','Row Size','','',2,1),(163,'dd0ea182d14943eba902e7e067c4acaa',0,0,19,34,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',2,2),(164,'a602db7b166a3582acef0641443ef775',0,0,19,34,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',2,3),(165,'62496efcc8886713cae76027d4848eec',0,0,19,34,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',2,4),(166,'db1f04ea4b4010ee7f9e1f2b6215d05f',0,0,19,34,334,'FF',4,1.00,'',0,0,0,'',3,'','Peak','','on',2,5),(167,'4e24397603819f4c6659969e94db0278',0,0,20,35,403,'FF',7,1.00,'',0,0,0,'',1,'','Records','','',2,1),(168,'0ceed612e3956938df52ae938deeffe7',0,0,20,35,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',3,2),(169,'b6301d5ff8f778890f30b56ed66576ba',0,0,20,35,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',3,3),(170,'f9a2893f1306147633c4fd6194975a41',0,0,20,35,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',3,4),(171,'53f04b914c7976276fc3092fbd0a9e45',0,0,20,35,359,'FF',4,1.00,'',0,0,0,'',3,'','Peak','','on',2,5),(172,'753a4c827aeb53939f4bba22dfb1496a',0,0,21,36,351,'FF',7,1.00,'',0,0,0,'',1,'','Table Size','','',2,1),(173,'91e4dfa95ee8f1e20721bab7e65403f6',0,0,21,36,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',2,2),(174,'aa453957c913b7a97a01eef249747984',0,0,21,36,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',2,3),(175,'ac124d79912482fa498839088e206b97',0,0,21,36,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',2,4),(176,'ed7b7c12f54f929d9ee94d6f47efec77',0,0,21,36,52,'FF',4,1.00,'',0,0,0,'',3,'','Peak','','on',2,5),(177,'a1113096d9a5cf96f370b863d86bb8da',0,0,22,38,145,'FF',7,1.00,'',0,0,0,'',1,'','Fetch Records','','',2,1),(178,'2403d49b2f517764311e11a235d307da',0,0,22,38,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',2,2),(179,'932649e9571571435bc62ce53e59779b',0,0,22,38,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',2,3),(180,'e8824f8fb582b97fc974b39f94303c97',0,0,22,38,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',2,4),(181,'6f98a18a3d115120487255505690391d',0,0,22,40,411,'FF',8,1.00,'',0,0,0,'',1,'','Cycle Time','','',2,5),(182,'b254dfa21fda194dbb7c59844475b061',0,0,22,40,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',2,6),(183,'696b3b72ff76cb648bf65a9dd0494ff0',0,0,22,40,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',2,7),(184,'e5682ebf46d1ce91b2a2607752740724',0,0,22,40,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',2,8),(185,'391228d6e2cddd2fffb105f87b02406e',0,0,22,39,62,'FF',8,1.00,'',0,0,0,'',1,'','Last Update','','',2,9),(186,'4b66e291b5c468ab395b57acedbbefb6',0,0,22,39,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',2,10),(187,'ef597f67783ffb0b919c0c32bf2bc913',0,0,22,39,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',2,11),(188,'4e23b63817cab703883d7eb311437734',0,0,22,39,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',2,12),(189,'dd503d194079fc6f7f7d4e469a24e195',0,0,22,41,287,'FF',8,1.00,'',0,0,0,'',1,'','Template','','',2,13),(190,'e282696b254dd0225d393e752e656f01',0,0,22,41,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',2,14),(191,'5302ffa84c5c94c13b91f08773f7ef81',0,0,22,41,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',2,15),(192,'cf9ced491348a4232519a6c82005a47a',0,0,22,41,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',2,16),(193,'82b6d4d06fdd5f02e83a3d014b210862',0,0,22,42,276,'FF',8,1.00,'',0,0,0,'',1,'','Update','','',2,17),(194,'46c2f071028021b4348cb4dedb7decea',0,0,22,42,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',2,18),(195,'1d839b2e152f8e85b16fffa424444f03',0,0,22,42,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',2,19),(196,'89f2fd5edf87146e624b7a5f8f3ff8f5',0,0,22,42,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',2,20),(197,'f578ded21f328c5350d6810ae8b12170',0,0,22,37,357,'FF',8,1.00,'',0,0,0,'',1,'','Delete','','',2,21),(198,'44e102eb5740dd787e8b10d32383fe14',0,0,22,37,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',2,22),(199,'204fbdd6a4ce01e2664c5ded5ed5a49b',0,0,22,37,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',2,23),(200,'1f1faff4ad32a349cce4a728f401a200',0,0,22,37,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',2,24),(201,'3ca5fb14afe1dbfe091a3f685bf918b3',0,0,22,0,1,'FF',4,1.00,'',0,12,0,'',1,'','Total','','',2,25),(202,'3c075d59646dd06b104baff9084a2f35',0,0,22,0,0,'FF',9,1.00,'',0,12,0,'',4,'','Cur:','','',2,26),(203,'d62b68535fa7e6add5585756ac1f2678',0,0,22,0,0,'FF',9,1.00,'',0,12,0,'',1,'','Avg:','','',2,27),(204,'1951085bce9526637318f74f5abbd8a2',0,0,22,0,0,'FF',9,1.00,'',0,12,0,'',3,'','Max:','','on',2,28),(205,'90aa926db140390b81939dd167f31bf9',0,0,23,43,91,'FF',7,1.00,'',0,0,0,'',1,'','Current','','',2,1),(206,'9bd0b69684b9db0be1e90ad59c8f43db',0,0,23,43,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',2,2),(207,'59c30586c3796fbf6d79fcd774b3d533',0,0,23,43,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',2,3),(208,'a3422cf61a1b392f9f77b653d6e73eb6',0,0,23,43,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',2,4),(209,'6491296bc4cdc4dd9f40b7489c2313e1',0,0,23,44,358,'FF',4,1.00,'',0,0,0,'',3,'','Lifetime Peak','','',2,5),(210,'f689f98d2e155dc2f053bf02894bf0d5',0,0,23,44,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',2,6),(211,'49867473eaf4e97ff7e10a94bff6cdee',0,0,23,44,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',2,7),(212,'17d8becfd5c9e3a867a2491e49127e3b',0,0,23,44,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',2,8),(213,'71bde29995acee91ce6240e7bf30a714',0,0,23,46,349,'FF',4,1.00,'',0,0,0,'',4,'','Average','','',2,9),(214,'850e9d00620c6194ff320380f7e5e019',0,0,23,46,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',2,10),(215,'45c3107ed64f33eb8aa960f58a963170',0,0,23,46,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',2,11),(216,'f560f3c8725c1e874f038a25f462559e',0,0,23,46,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',2,12),(217,'a18377556acb58eb831bd2a7fb84a29d',0,0,23,45,27,'FF',4,1.00,'',0,0,0,'',3,'','Minimum','','',2,13),(218,'131a3570a93809d275835bcefb3c05d7',0,0,23,45,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',2,14),(219,'e0baf41a67b0fff8ca61c23dd020d6bf',0,0,23,45,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',2,15),(220,'f1edcf266598abc50b762c75e3ece85c',0,0,23,45,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',2,16),(221,'f8a0a627660cef2011e9e58cfb25ee7c',0,0,23,43,90,'FF',4,1.00,'',0,0,0,'',3,'','Current Peak','','on',2,17),(222,'105102b5c5741b9f89c877dbb903cabb',0,0,24,47,426,'FF',7,1.00,'',0,0,0,'',3,'','SNMP','','',2,1),(223,'2ab78ee476b088eababf4ccb62fc8403',0,0,24,47,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',3,2),(224,'ed62c47411851ae395a52ce26bc670e7',0,0,24,47,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',3,3),(225,'757dc17ec75e4f9eca6d4117ebd42dd0',0,0,24,47,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',3,4),(226,'ff6cc0639ccb1d3c0848a900a12379e8',0,0,24,49,357,'FF',8,1.00,'',0,0,0,'',1,'','Script Server','','',2,5),(227,'043f187de99960e36d87e1ce0a2f0b72',0,0,24,49,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',3,6),(228,'8621e16ec9dc7e5866fc599223582de7',0,0,24,49,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',3,7),(229,'cee71f7ef12c59baa96bdac49349bfa9',0,0,24,49,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',3,8),(230,'942cd58c2eddcf7076c61fc019ba3eac',0,0,24,48,348,'FF',8,1.00,'',0,0,0,'',1,'','Scripts','','',2,9),(231,'686dd24b3c493c67ebd6f7d4a11483c0',0,0,24,48,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',3,10),(232,'2338d1f67efe9dc28ceffe8551005df0',0,0,24,48,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',3,11),(233,'5a6b48b066d09506186f6220453e785e',0,0,24,48,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',3,12),(234,'2a2abecfc31410f129f059f08be26dba',0,0,25,51,144,'FF',7,1.00,'',0,0,0,'',1,'','Processes','','',2,1),(235,'8526ed34da699b32a34c9de47fce0dd9',0,0,25,51,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',3,2),(236,'b21bb04a40073403e7e931cbc41457ca',0,0,25,51,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',3,3),(237,'d72a4029cfc0bbdfefb616aacdbc864e',0,0,25,51,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',3,4),(238,'c18009102b862009e870c67198647f85',0,0,25,50,357,'FF',4,1.00,'',0,0,0,'',1,'','Threads','','',2,5),(239,'2c16622f87cd7c1d213b8cd42e1b759e',0,0,25,50,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',3,6),(240,'1024c6693b523ea3fa63d763201aec75',0,0,25,50,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',3,7),(241,'f4b97f0baf923e8c7a89104012a212cf',0,0,25,50,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',3,8),(242,'7175043999c84d28236e69db0fb2d0e2',0,0,26,53,9,'FF',4,0.00,'',0,0,0,'',1,'','Time','','',2,1),(243,'e41b859d762ed23daca15893e9fe8727',0,0,26,53,0,'FF',9,0.00,'',0,0,0,'',2,'','Minimum:','','',2,2),(244,'7b775daf6f91738088c320fdedcab975',0,0,26,53,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,3),(245,'ca41a8dc66c5e3d7cc828848db05c99f',0,0,26,53,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,4),(246,'3024df07146306f8c27fec3a01db3fe5',0,0,26,53,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,5),(247,'43b2438bffbdcd5b7abd8102a6af1d70',0,0,26,52,21,'FF',4,0.00,'',0,0,0,'',1,'','Devices','','',2,6),(248,'7480eaaf598bebd33f6a23454c5e1625',0,0,26,52,0,'FF',9,0.00,'',0,0,0,'',2,'','Minimum:','','',2,7),(249,'147d8cbfcc339d79720a1b6c0572b463',0,0,26,52,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,8),(250,'9471ed059841dd352b66003c362383ff',0,0,26,52,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,9),(251,'40b100203ca15f90bf48f64a0e0c0579',0,0,26,52,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,10),(252,'f71f6c21397cde4455ec7ce05be0c805',0,0,27,55,357,'FF',4,1.00,'',0,0,0,'',1,'','Total:','','',2,1),(253,'5a177ed26c79c1f8c0a49327593dd855',0,0,27,55,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',2,2),(254,'c0d4230b4782bab828d1313be2378fa3',0,0,27,55,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',2,3),(255,'d7c04af370bfaf14c841d4148f9213d2',0,0,27,55,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',2,4),(256,'1f06ec5211f93c944d14a3cde570428c',0,0,27,56,343,'FF',4,1.00,'',0,0,0,'',1,'','Connect:','','',2,5),(257,'53db1d40a7526c7d7457eae04879e1ab',0,0,27,56,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',2,6),(258,'2a1206a84c0c76cd3b93d1ec1116804a',0,0,27,56,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',2,7),(259,'d198a15c400945de6b75e444ea180d15',0,0,27,56,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',2,8),(260,'f4773a21325149011bc11b6681f0d19d',0,0,27,57,225,'FF',4,1.00,'',0,0,0,'',1,'','Lookup:','','',2,9),(261,'aec34f5241f64bd6352d222c0bb02239',0,0,27,57,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',2,10),(262,'e3fca6ab743912305dc0ea5c59508012',0,0,27,57,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',2,11),(263,'7490bc790de900b11faa17df41a08420',0,0,27,57,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',2,13),(264,'2b5d497ecf6d2d0f4ca5edbe1729c031',0,0,27,54,353,'FF',4,1.00,'',0,0,0,'',1,'','Redirect:','','',2,14),(265,'5c204cf91b9cd5c9d7311c42ffbe620b',0,0,27,54,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',2,15),(266,'ec0bc049a662c26ac028ae800ba756cb',0,0,27,54,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',2,16),(267,'622fa49e702161cd45b74a4fcba9bfe5',0,0,27,54,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',2,17),(268,'6aef9ddbac86a8d19be50dabdd8724da',0,0,28,58,405,'FF',7,1.00,'',0,0,0,'',1,'','Bytes:','','',2,1),(269,'d12e123a12003a100705507198109d83',0,0,28,58,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',2,2),(270,'e9c1f169a5c6c07968766dca84ef11f9',0,0,28,58,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',2,3),(271,'bd70cc4253c94a3f02fcaf2c90c42999',0,0,28,58,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',2,4),(272,'babac9758665f7d6a8ba605266f9754b',0,0,29,59,357,'FF',7,1.00,'',0,0,0,'',1,'','Speed:','','',2,1),(273,'709ca443cd11088d1b986c4d2ef6357d',0,0,29,59,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',2,2),(274,'cee4c525b099d936e3fb988921f27b5f',0,0,29,59,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',2,3),(275,'d1f68670716f08b8057560d51fabf422',0,0,29,59,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',2,4),(276,'dcb057c00ed0ea907246aa77a489e25c',0,0,30,60,229,'FF',7,1.00,'',0,0,0,'',1,'','Status:','','',2,1),(277,'f21839d327c9fab7dc6ad25b72dd7029',0,0,30,60,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',3,2),(278,'975120273737bbebe78b70294fcb11f2',0,0,30,60,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',3,3),(279,'aae174e66dfb195c115bacc2842a9aa0',0,0,30,60,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',3,4),(280,'aa4e939e1bd355d7f686feea56d6406d',0,0,31,61,222,'FF',7,1.00,'',0,0,0,'',1,'','Graphs','','',2,1),(281,'153aa66af867a7986145e91a0e164776',0,0,31,61,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',3,2),(282,'b950a0d6cf65ac9bd9388055fa2fedb1',0,0,31,61,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',3,3),(283,'3080b6bd91d9c228b5be03fb7223ac9e',0,0,31,61,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',3,4),(284,'b1ea5328178fc466a83d638d9259f06a',0,0,31,61,212,'FF',4,1.00,'',0,0,0,'',3,'','Peak','','on',2,5),(285,'af1d8f26973de2814c68761d2b1a618e',0,0,32,62,348,'FF',7,1.00,'',0,0,0,'',1,'','Duration','','',2,1),(286,'3bccd2a4912b4fda027239309ecbee64',0,0,32,62,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',2,3),(287,'04ec92cd1ae1cb08a5f84b88368307a0',0,0,32,62,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',2,4),(288,'0dc578df23a328a457e395b619d28219',0,0,32,62,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',2,5),(289,'a59cf0171d15adf152b57663ca235918',0,0,32,62,334,'FF',4,1.00,'',0,0,0,'',3,'','Peak','','on',2,6),(290,'098b10c13a5701ddb7d4d1d2e2b0fdb7',0,0,33,63,9,'FF',7,0.00,'',0,0,0,'',1,'','CPU Usage','','',2,1),(291,'1dbda412a9926b0ee5c025aa08f3b230',0,0,33,63,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',3,2),(292,'725c45917146807b6a4257fc351f2bae',0,0,33,63,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,3),(293,'4e336fdfeb84ce65f81ded0e0159a5e0',0,0,33,63,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,4),(294,'55f63b2553858e79aa716715955dba88',0,0,34,64,357,'FF',7,1.00,'',0,0,0,'',1,'','Time:','','',2,1),(295,'bade2e0fd8ce4c2a2a12714738ac3248',0,0,34,64,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',2,2),(296,'3ea9e524e4f105a35cab3f9875a32921',0,0,34,64,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',2,3),(297,'e3b50899210cefa545a5aedfe912b320',0,0,34,64,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',2,4),(298,'0c16125e5f2c1a5a528a56fc2bfd639c',0,0,35,65,145,'FF',7,1.00,'',0,17,0,'',1,'','Uptime:','','',2,1),(299,'4b79bda8d293a60ca458dcf433517d26',0,0,35,65,0,'FF',9,1.00,'',0,17,0,'',4,'','Cur:','','',2,2),(300,'9a4303a20c1eef5009e87c58c8b95dd8',0,0,35,65,0,'FF',9,1.00,'',0,17,0,'',1,'','Avg:','','',2,3),(301,'e9559cbc8fbe84e648e0f39f35e3e8c5',0,0,35,65,0,'FF',9,1.00,'',0,17,0,'',3,'','Max:','','on',2,4),(302,'67b03eadc8e1d948a23326b7c6e225aa',0,0,36,66,22,'FF',4,0.00,'',0,2,0,'',3,'','','','',2,1),(303,'0470b2427dbfadb6b8346e10a71268fa',0,0,36,66,22,'FF',7,0.00,'',0,2,0,'',1,'','Inbound','','',2,1),(304,'84a5fe0db518550266309823f994ce9c',0,0,36,66,0,'FF',9,0.00,'',0,2,0,'',4,'','Current:','','',2,2),(305,'2f222f28084085cd06a1f46e4449c793',0,0,36,66,0,'FF',9,0.00,'',0,2,0,'',1,'','Average:','','',2,3),(306,'55acbcc33f46ee6d754e8e81d1b54808',0,0,36,66,0,'FF',9,0.00,'',0,2,0,'',3,'','Maximum:','','on',2,4),(307,'d71b8ba294f057e0f135cc4c644e6b0d',0,0,36,67,20,'FF',4,0.00,'',0,2,0,'',3,'','','','',2,6),(308,'fdaf2321fc890e355711c2bffc07d036',0,0,36,67,20,'FF',4,0.00,'',0,2,0,'',1,'','Outbound','','',2,5),(309,'768318f42819217ed81196d2179d3e1b',0,0,36,67,0,'FF',9,0.00,'',0,2,0,'',4,'','Current:','','',2,6),(310,'cb3aa6256dcb3acd50d4517b77a1a5c3',0,0,36,67,0,'FF',9,0.00,'',0,2,0,'',1,'','Average:','','',2,7),(311,'671e989be7cbf12c623b4e79d91c7bed',0,0,36,67,0,'FF',9,0.00,'',0,2,0,'',3,'','Maximum:','','',2,8),(312,'7e04a041721df1f8828381a9ea2f2154',0,0,37,69,31,'FF',4,0.00,'',0,0,0,'',1,'','Discards In','','',2,1),(313,'afc8bca6b1b3030a6d71818272336c6c',0,0,37,69,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,2),(314,'6ac169785f5aeaf1cc5cdfd38dfcfb6c',0,0,37,69,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,3),(315,'178c0a0ce001d36a663ff6f213c07505',0,0,37,69,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,4),(316,'8e3268c0abde7550616bff719f10ee2f',0,0,37,68,48,'FF',4,0.00,'',0,0,0,'',1,'','Errors In','','',2,5),(317,'18891392b149de63b62c4258a68d75f8',0,0,37,68,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,6),(318,'dfc9d23de0182c9967ae3dabdfa55a16',0,0,37,68,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,7),(319,'c47ba64e2e5ea8bf84aceec644513176',0,0,37,68,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,8),(320,'617d10dff9bbc3edd9d733d9c254da76',0,0,37,70,18,'FF',4,0.00,'',0,0,0,'',1,'','Discards Out','','',2,9),(321,'9269a66502c34d00ac3c8b1fcc329ac6',0,0,37,70,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,10),(322,'d45deed7e1ad8350f3b46b537ae0a933',0,0,37,70,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,11),(323,'2f64cf47dc156e8c800ae03c3b893e3c',0,0,37,70,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,12),(324,'57434bef8cb21283c1a73f055b0ada19',0,0,37,71,89,'FF',4,0.00,'',0,0,0,'',1,'','Errors Out','','',2,13),(325,'660a1b9365ccbba356fd142faaec9f04',0,0,37,71,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,14),(326,'28c5297bdaedcca29acf245ef4bbed9e',0,0,37,71,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,15),(327,'99098604fd0c78fd7dabac8f40f1fb29',0,0,37,71,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,16),(328,'d4e5f253f01c3ea77182c5a46418fc44',0,0,38,72,25,'FF',7,0.00,'',0,0,0,'',1,'','Unicast Packets In','','',2,1),(329,'526a96add143da021c5f00d8764a6c12',0,0,38,72,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,2),(330,'81eeb46f451212f00fd7caee42a81c0b',0,0,38,72,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,3),(331,'089e4d1c3faeb00fd5dcc9622b06d656',0,0,38,72,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,4),(332,'9d052e7d632c479737fbfaced0821f79',0,0,38,73,71,'FF',4,0.00,'',0,0,0,'',1,'','Unicast Packets Out','','',2,5),(333,'9b9fa6268571b6a04fa4411d8e08c730',0,0,38,73,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,6),(334,'8e8f2fbeb624029cbda1d2a6ddd991ba',0,0,38,73,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,7),(335,'c76495beb1ed01f0799838eb8a893124',0,0,38,73,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,8),(336,'042d90f1a390c15509ae208bd97aa885',0,0,38,72,25,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,9),(337,'3641f6b8e83ea26e73d41ceccf38b131',0,0,38,73,71,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,10),(338,'fe66cb973966d22250de073405664200',0,0,39,75,25,'FF',7,0.00,'',0,0,0,'',1,'','Non-Unicast Packets In','','',2,1),(339,'1ba3fc3466ad32fdd2669cac6cad6faa',0,0,39,75,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,2),(340,'f810154d3a934c723c21659e66199cdf',0,0,39,75,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,3),(341,'98a161df359b01304346657ff1a9d787',0,0,39,75,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,4),(342,'d5e55eaf617ad1f0516f6343b3f07c5e',0,0,39,74,71,'FF',4,0.00,'',0,0,0,'',1,'','Non-Unicast Packets Out','','',2,5),(343,'9fde6b8c84089b9f9044e681162e7567',0,0,39,74,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,6),(344,'9a3510727c3d9fa7e2e7a015783a99b3',0,0,39,74,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,7),(345,'451afd23f2cb59ab9b975fd6e2735815',0,0,39,74,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,8),(346,'c72c76b0c6d9066a4feea17ca032b3cd',0,0,39,75,25,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,9),(347,'b276e28b10447b11ee289f78e0c1ed82',0,0,40,66,22,'FF',4,0.00,'',0,0,0,'',3,'','','','',2,1),(348,'de3eefd6d6c58afabdabcaf6c0168378',0,0,40,66,22,'FF',7,0.00,'',0,0,0,'',1,'','Inbound','','',2,1),(349,'1a80fa108f5c46eecb03090c65bc9a12',0,0,40,66,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,2),(350,'fe458892e7faa9d232e343d911e845f3',0,0,40,66,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,3),(351,'175c0a68689bebc38aad2fbc271047b3',0,0,40,66,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,4),(352,'f9da7d4c2da9636f2f3e37f4781954db',0,0,40,67,20,'FF',4,0.00,'',0,0,0,'',3,'','','','',2,6),(353,'1bf2283106510491ddf3b9c1376c0b31',0,0,40,67,20,'FF',4,0.00,'',0,0,0,'',1,'','Outbound','','',2,5),(354,'c5202f1690ffe45600c0d31a4a804f67',0,0,40,67,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,6),(355,'eb9794e3fdafc2b74f0819269569ed40',0,0,40,67,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,7),(356,'6bcedd61e3ccf7518ca431940c93c439',0,0,40,67,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','',2,8),(357,'11d87688979b97cf026809f75cef30be',0,0,41,66,22,'FF',4,1.00,'',0,2,0,'',3,'','','','',2,1),(358,'918e6e7d41bb4bae0ea2937b461742a4',0,0,41,66,22,'FF',7,0.00,'',0,2,0,'',1,'','Inbound','','',2,1),(359,'f19fbd06c989ea85acd6b4f926e4a456',0,0,41,66,0,'FF',9,0.00,'',0,2,0,'',4,'','Current:','','',2,2),(360,'fc150a15e20c57e11e8d05feca557ef9',0,0,41,66,0,'FF',9,0.00,'',0,2,0,'',1,'','Average:','','',2,3),(361,'ccbd86e03ccf07483b4d29e63612fb18',0,0,41,66,0,'FF',9,0.00,'',0,2,0,'',3,'','Maximum:','','on',2,4),(362,'75796e3f885739c2d7229fd25babf30d',0,0,41,67,20,'FF',4,1.00,'',0,2,0,'',3,'','','','',2,6),(363,'964c5c30cd05eaf5a49c0377d173de86',0,0,41,67,20,'FF',4,0.00,'',0,2,0,'',1,'','Outbound','','',2,5),(364,'b1a6fb775cf62e79e1c4bc4933c7e4ce',0,0,41,67,0,'FF',9,0.00,'',0,2,0,'',4,'','Current:','','',2,6),(365,'721038182a872ab266b5cf1bf7f7755c',0,0,41,67,0,'FF',9,0.00,'',0,2,0,'',1,'','Average:','','',2,7),(366,'2302f80c2c70b897d12182a1fc11ecd6',0,0,41,67,0,'FF',9,0.00,'',0,2,0,'',3,'','Maximum:','','on',2,8),(367,'4ffc7af8533d103748316752b70f8e3c',0,0,41,0,0,'FF',1,0.00,'',0,0,0,'',1,'','','','on',2,9),(368,'64527c4b6eeeaf627acc5117ff2180fd',0,0,41,67,9,'FF',2,0.00,'',0,0,0,'',1,'','95th Percentile','|95:bits:0:max:2|','',2,10),(369,'d5bbcbdbf83ae858862611ac6de8fc62',0,0,41,67,0,'FF',1,0.00,'',0,0,0,'',1,'','(|95:bits:6:max:2| mbit in+out)','','',2,11),(370,'9ee6db2f910144bc95760876d0a16a62',0,0,42,66,22,'FF',4,1.00,'',0,2,0,'',3,'','','','',2,1),(371,'1995d8c23e7d8e1efa2b2c55daf3c5a7',0,0,42,66,22,'FF',7,0.00,'',0,2,0,'',1,'','Inbound','','',2,1),(372,'55083351cd728b82cc4dde68eb935700',0,0,42,66,0,'FF',9,0.00,'',0,2,0,'',4,'','Current:','','',2,2),(373,'54782f71929e7d1734ed5ad4b8dda50d',0,0,42,66,0,'FF',9,0.00,'',0,2,0,'',1,'','Average:','','',2,3),(374,'88d3094d5dc2164cbf2f974aeb92f051',0,0,42,66,0,'FF',9,0.00,'',0,2,0,'',3,'','Maximum:','','',2,4),(375,'5b43e4102600ad75379c5afd235099c4',0,0,42,66,0,'FF',1,0.00,'',0,0,0,'',1,'','Total In:  |sum:auto:current:2:auto|','','on',2,5),(376,'c4886a8552ee60c6559de8ab16c2dcf2',0,0,42,67,20,'FF',4,1.00,'',0,2,0,'',3,'','','','',2,7),(377,'4a381a8e87d4db1ac99cf8d9078266d3',0,0,42,67,20,'FF',4,0.00,'',0,2,0,'',1,'','Outbound','','',2,6),(378,'5bff63207c7bf076d76ff3036b5dad54',0,0,42,67,0,'FF',9,0.00,'',0,2,0,'',4,'','Current:','','',2,7),(379,'979fff9d691ca35e3f4b3383d9cae43f',0,0,42,67,0,'FF',9,0.00,'',0,2,0,'',1,'','Average:','','',2,8),(380,'0e715933830112c23c15f7e3463f77b6',0,0,42,67,0,'FF',9,0.00,'',0,2,0,'',3,'','Maximum:','','',2,11),(381,'db7c15d253ca666601b3296f2574edc9',0,0,42,67,0,'FF',1,0.00,'',0,0,0,'',1,'','Total Out: |sum:auto:current:2:auto|','','',2,12),(382,'3baa47b136f8c36ccea69196b0285a6c',0,0,43,66,22,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,1),(383,'3ff8dba1ca6279692b3fcabed0bc2631',0,0,43,66,22,'FF',7,0.00,'',0,0,0,'',1,'','Inbound','','',2,1),(384,'66bfdb701c8eeadffe55e926d6e77e71',0,0,43,66,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,2),(385,'777aa88fb0a79b60d081e0e3759f1cf7',0,0,43,66,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,3),(386,'de265acbbfa99eb4b3e9f7e90c7feeda',0,0,43,66,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','',2,4),(387,'76ae747365553a02313a2d8a0dd55c8a',0,0,43,66,0,'FF',1,0.00,'',0,0,0,'',1,'','Total In:  |sum:auto:current:2:auto|','','on',2,5),(388,'43a2cef12147952c703fc0fc473dec7a',0,0,43,67,20,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,7),(389,'cf8c9f69878f0f595d583eac109a9be1',0,0,43,67,20,'FF',4,0.00,'',0,0,0,'',1,'','Outbound','','',2,6),(390,'54e3971b3dd751dd2509f62721c12b41',0,0,43,67,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,7),(391,'6824d29c3f13fe1e849f1dbb8377d3f1',0,0,43,67,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,8),(392,'fdaec5b9227522c758ad55882c483a83',0,0,43,67,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','',2,11),(393,'d6041d14f9c8fb9b7ddcf3556f763c03',0,0,43,67,0,'FF',1,0.00,'',0,0,0,'',1,'','Total Out: |sum:auto:current:2:auto|','','',2,12),(394,'34a594c6b419427329b10f73f40e85f7',0,0,44,72,25,'7F',7,0.00,'',0,0,0,'',1,'','Multicast Packets In','','',2,1),(395,'1540d561f6ab4b55ac810661fb0c93ee',0,0,44,72,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,2),(396,'e9e41de3845454688f838662e4c34aa7',0,0,44,72,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,3),(397,'350ebb1cd31fb46d9997bc21a00d36b1',0,0,44,72,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,4),(398,'16f958e2b047113d38c7550c76ef04c8',0,0,44,73,71,'7F',7,0.00,'',0,0,0,'',1,'','Multicast Packets Out','','',2,5),(399,'a393430c1db0d9da48dca3098022cf50',0,0,44,73,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,6),(400,'3f73834149d86814a4dbbfa4052fdb14',0,0,44,73,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,7),(401,'07164e2d5ebe685b622a97250dab9cc2',0,0,44,73,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,8),(402,'2a19f1c71b1ff8edea69af3f1825cec0',0,0,44,72,25,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,9),(403,'e9625f33db3635e39e206334da9f99ef',0,0,44,73,71,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,10),(404,'ea54bfaa4bad2b6862165840418f5fd4',0,0,45,75,25,'7F',7,0.00,'',0,0,0,'',1,'','Broadcast Packets In','','',2,1),(405,'a2508ab1f57dff7b143433ab81ff7a3e',0,0,45,75,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,2),(406,'cab434df67b94a93728ab794b1d0f6fb',0,0,45,75,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,3),(407,'29d51e734ad14bcdb3a9b7a640f2c4a3',0,0,45,75,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,4),(408,'725d97e3666c2417241ca7bb67a8c902',0,0,45,74,71,'7F',7,0.00,'',0,0,0,'',1,'','Broadcast Packets Out','','',2,5),(409,'b01f45a155e10f49d640d13b50aa61a5',0,0,45,74,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,6),(410,'eb37825efbb281484cdb1e896764b73a',0,0,45,74,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,7),(411,'b18b67ef2779d5ff43843cac220d9bb9',0,0,45,74,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,8),(412,'56ea543140aa516299ba202b313fc822',0,0,45,75,25,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,9),(413,'ce17bd1ed1efaa2f7eb2b1fef7354d8d',0,0,45,74,71,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,10),(414,'8b693a3303345abdc5ad9798895bc6c4',0,0,46,76,25,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,1),(415,'80e0aa956f50c261e5143273da58b8a3',0,0,46,76,25,'7F',7,0.00,'',0,0,0,'',1,'','','','',2,2),(416,'48fdcae893a7b7496e1a61efc3453599',0,0,46,76,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,3),(417,'22f43e5fa20f2716666ba9ed9a7d1727',0,0,46,76,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,4),(418,'3e86d497bcded7af7ab8408e4908e0d8',0,0,46,76,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,5),(419,'41316670b1a36171de2bda91a0cc2364',0,0,47,77,98,'FF',7,0.00,'',0,0,0,'',1,'','','','',2,1),(420,'c9e8cbdca0215b434c902e68755903ea',0,0,47,77,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,2),(421,'dab91d7093e720841393feea5bdcba85',0,0,47,77,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,3),(422,'03e5bd2151fea3c90843eb1130b84458',0,0,47,77,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,4),(423,'ba00ecd28b9774348322ff70a96f2826',0,0,48,78,48,'7F',7,0.00,'',0,0,0,'',1,'','Running Processes<>','','',2,1),(424,'304244ca63d5b09e62a94c8ec6fbda8d',0,0,48,78,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,3),(425,'da1ba71a93d2ed4a2a00d54592b14157',0,0,48,78,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,4),(426,'5b4f05b04f704a24c663998293fa8848',0,0,48,78,48,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,5),(427,'93ad2f2803b5edace85d86896620b9da',0,0,49,79,15,'7F',7,0.00,'',0,0,0,'',1,'','1 Minute Average','','',2,1),(428,'fa1570f2b111da3555e165c7873a376b',0,0,49,79,0,'FF',9,1.00,'',0,0,0,'',4,'','Current:','','',4,2),(429,'16675723e5e9885489c2ccbbcee82ef0',0,0,49,79,0,'FF',9,1.00,'',0,0,0,'',1,'','Average:','','',4,3),(430,'31aab74f1dc7d1bf540da8cc19203944',0,0,49,79,0,'FF',9,1.00,'',0,0,0,'',3,'','Maximum:','','on',4,4),(431,'bbdfa13adc00398eed132b1ccb4337d2',0,0,49,80,8,'7F',8,0.00,'',0,0,0,'',1,'','5 Minute Average','','',2,5),(432,'0f5158874901e0ecfba9b4dc9a4f3afd',0,0,49,80,0,'FF',9,1.00,'',0,0,0,'',4,'','Current:','','',4,6),(433,'e8425ef97ba1b5d98a84bda5ea42c0e8',0,0,49,80,0,'FF',9,1.00,'',0,0,0,'',1,'','Average:','','',4,7),(434,'760f184ddf2c4f10d26f1b1eec68f579',0,0,49,80,0,'FF',9,1.00,'',0,0,0,'',3,'','Maximum:','','on',4,8),(435,'9cf6ed48a6a54b9644a1de8c9929bd4e',0,0,49,81,9,'7F',8,0.00,'',0,0,0,'',1,'','15 Minute Average','','',2,9),(436,'0dd3ea1600ef0749b7895f349de650a0',0,0,49,81,0,'FF',9,1.00,'',0,0,0,'',4,'','Current:','','',4,10),(437,'15ac9644211ac78240154a0eb3cd8b29',0,0,49,81,0,'FF',9,1.00,'',0,0,0,'',1,'','Average:','','',4,11),(438,'c45aeff75d805220a7798f46324381f6',0,0,49,81,0,'FF',9,1.00,'',0,0,0,'',3,'','Maximum:','','on',4,12),(439,'fa1bc4eff128c4da70f5247d55b8a444',0,0,49,0,1,'FF',4,0.00,'',0,12,0,'',1,'','','','on',2,13),(440,'cf0848f7482b56ea746453f90881d05e',0,0,49,79,15,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,14),(441,'ebb3b6d41faaf7338fd640b8ff720cb3',0,0,49,80,8,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,15),(442,'f995fe7d096e2ef4b33608328ebc0843',0,0,49,81,9,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,16),(443,'5c94ac24bc0d6d2712cc028fa7d4c7d2',0,0,50,82,67,'7F',7,0.00,'',0,0,0,'',1,'','Users','','',2,1),(444,'8bc7f905526f62df7d5c2d8c27c143c1',0,0,50,82,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',3,2),(445,'cd074cd2b920aab70d480c020276d45b',0,0,50,82,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,3),(446,'415630f25f5384ba0c82adbdb05fe98b',0,0,50,82,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,4),(447,'c55914240f7e1d4f881ea598d4de9196',0,0,50,82,67,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,5),(448,'5fa7c2317f19440b757ab2ea1cae6abc',0,0,51,83,41,'FF',7,0.00,'',0,14,0,'',1,'','Free','','',2,9),(449,'b1d18060bfd3f68e812c508ff4ac94ed',0,0,51,83,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,10),(450,'780b6f0850aaf9431d1c246c55143061',0,0,51,83,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,11),(451,'2d54a7e7bb45e6c52d97a09e24b7fba7',0,0,51,83,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,12),(452,'40206367a3c192b836539f49801a0b15',0,0,51,84,30,'FF',8,0.00,'',0,14,0,'',1,'','Swap','','',2,13),(453,'7ee72e2bb3722d4f8a7f9c564e0dd0d0',0,0,51,84,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,14),(454,'c8af33b949e8f47133ee25e63c91d4d0',0,0,51,84,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,15),(455,'568128a16723d1195ce6a234d353ce00',0,0,51,84,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,16),(456,'6ca2161c37b0118786dbdb46ad767e5d',0,0,52,86,48,'7F',7,0.00,'',0,14,0,'',1,'','Used','','',2,1),(457,'8ef3e7fb7ce962183f489725939ea40f',0,0,52,86,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,2),(458,'3b13eb2e542fe006c9bf86947a6854fa',0,0,52,86,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,3),(459,'a751838f87068e073b95be9555c57bde',0,0,52,86,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,4),(460,'5d6dff9c14c71dc1ebf83e87f1c25695',0,0,52,85,20,'7F',8,0.00,'',0,14,0,'',1,'','Available','','',2,5),(461,'b27cb9a158187d29d17abddc6fdf0f15',0,0,52,85,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,6),(462,'6c0555013bb9b964e51d22f108dae9b0',0,0,52,85,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,7),(463,'42ce58ec17ef5199145fbf9c6ee39869',0,0,52,85,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,8),(464,'9bdff98f2394f666deea028cbca685f3',0,0,52,0,1,'FF',5,0.00,'',0,15,0,'',1,'','Total','','',2,9),(465,'fb831fefcf602bc31d9d24e8e456c2e6',0,0,52,0,0,'FF',9,0.00,'',0,15,0,'',4,'','Current:','','',2,10),(466,'5a958d56785a606c08200ef8dbf8deef',0,0,52,0,0,'FF',9,0.00,'',0,15,0,'',1,'','Average:','','',2,11),(467,'5ce67a658cec37f526dc84ac9e08d6e7',0,0,52,0,0,'FF',9,0.00,'',0,15,0,'',3,'','Maximum:','','on',2,12),(468,'ac0ffc9f0f2cb7f8c6cb9eb8fa73b390',0,0,52,86,48,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,13),(469,'d9fc8b516374885c6c45153803e5b90a',0,0,52,85,20,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,14),(470,'d77d2050be357ab067666a9485426e6b',0,0,53,87,15,'7F',7,0.00,'',0,0,0,'',1,'','1 Minute Average','','',2,1),(471,'664b23027b847964b9cf92e16538ee66',0,0,53,87,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',4,2),(472,'2832fe3cb648e0c7a0905d04c39e7093',0,0,53,87,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',4,3),(473,'12b7126f3ced07574b1e5f8bf3f1b4bc',0,0,53,87,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',4,4),(474,'8580230d31d2851ec667c296a665cbf9',0,0,53,88,8,'7F',8,0.00,'',0,0,0,'',1,'','5 Minute Average','','',2,5),(475,'48099998fd7cddeab6685b6e3bf07b1a',0,0,53,88,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',4,6),(476,'af5b1e90e9ad3e2a5ce0e0cd58bdb76b',0,0,53,88,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',4,7),(477,'28953315320fc3bea62f8a9a094825e3',0,0,53,88,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',4,8),(478,'2ec10edf4bfaa866b7efd544d4c3f446',0,0,53,89,9,'7F',8,0.00,'',0,0,0,'',1,'','15 Minute Average','','',2,9),(479,'efc200ea9c770725ffed0f5b75976035',0,0,53,89,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',4,10),(480,'b81c4fba7c56fb91f722b41c806d3fe8',0,0,53,89,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',4,11),(481,'520a2b1fed006bf79bd81c30b7478781',0,0,53,89,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',4,12),(482,'f1e343e458e95676cb4fa98ccfa89be2',0,0,53,87,15,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,13),(483,'401fc06aff694aef1333b2aeaafc598e',0,0,53,88,8,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,14),(484,'96698209a56e2765d6b31c6a15cef66b',0,0,53,89,9,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,15),(485,'5dcf25ffb22516593f0989c350e23976',0,0,54,93,142,'7F',7,1.00,'',0,14,0,'',1,'','Memory Total','','',2,1),(486,'4813c1df025417d45dd0fb5062d4f095',0,0,54,93,0,'FF',9,1.00,'',0,14,0,'',4,'','Current:','','',2,2),(487,'749d182a551ada29c6db6992cd791dbd',0,0,54,93,0,'FF',9,1.00,'',0,14,0,'',1,'','Average:','','',2,3),(488,'68beff095c894bf5336982459f8763e3',0,0,54,93,0,'FF',9,1.00,'',0,0,0,'',3,'','Maximum:','','on',2,4),(489,'95d6e4e5110b456f34324f7941d08318',0,0,54,90,35,'7F',7,0.00,'',0,14,0,'',1,'','Memory Buffers','','',2,5),(490,'0c631bfc0785a9cca68489ea87a6c3da',0,0,54,90,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,6),(491,'3468579d3b671dfb788696df7dcc1ec9',0,0,54,90,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,7),(492,'c3ddfdaa65449f99b7f1a735307f9abe',0,0,54,90,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,8),(493,'8a1b44ab97d3b56207d0e9e77a035d25',0,0,54,92,30,'7F',8,0.00,'',0,14,0,'',1,'','Cache Memory','','',2,9),(494,'6db3f439e9764941ff43fbaae348f5dc',0,0,54,92,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,10),(495,'cc9b2fe7acf0820caa61c1519193f65e',0,0,54,92,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,11),(496,'9eea140bdfeaa40d50c5cdcd1f23f72d',0,0,54,92,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,12),(497,'7517a40d478e28ed88ba2b2a65e16b57',0,0,54,91,52,'7F',8,0.00,'',0,14,0,'',1,'','Memory Free','','',2,13),(498,'df0c8b353d26c334cb909dc6243957c5',0,0,54,91,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,14),(499,'c41a4cf6fefaf756a24f0a9510580724',0,0,54,91,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,15),(500,'9efa8f01c6ed11364a21710ff170f422',0,0,54,91,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,16),(501,'2cc00941cd1690789f952f5c9976db1a',0,0,54,93,143,'FF',4,1.00,'',0,14,0,'',3,'','','','',2,17),(502,'479deb05c1b4bc8491ddca5cdb4801a4',0,0,54,90,35,'FF',4,1.00,'',0,14,0,'',3,'','','','',2,18),(503,'876c3723c5dbd6654d13259e5976dfd0',0,0,54,92,30,'FF',20,1.00,'',0,14,0,'',3,'','','','',2,19),(504,'d35384da14f3df0baf3f276a9140661a',0,0,54,91,52,'FF',20,1.00,'',0,14,0,'',3,'','','','',2,20),(505,'38f6891b0db92aa8950b4ce7ae902741',0,0,55,94,67,'7F',7,0.00,'',0,0,0,'',1,'','Users','','',2,1),(506,'af13152956a20aa894ef4a4067b88f63',0,0,55,94,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',3,2),(507,'1b2388bbede4459930c57dc93645284e',0,0,55,94,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,3),(508,'6407dc226db1d03be9730f4d6f3eeccf',0,0,55,94,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,4),(509,'26b0e9922e1e4c1961b9120e90881985',0,0,55,94,67,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,5),(510,'fca6a530c8f37476b9004a90b42ee988',0,0,56,95,48,'7F',7,0.00,'',0,0,0,'',1,'','Running Processes','','',2,1),(511,'5acebbde3dc65e02f8fda03955852fbe',0,0,56,95,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',3,2),(512,'311079ffffac75efaab2837df8123122',0,0,56,95,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,3),(513,'724d27007ebf31016cfa5530fee1b867',0,0,56,95,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','',3,4),(514,'aa2be4ba323b0ded621b3e34737b26a1',0,0,56,95,48,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,5),(515,'53c9b0999e402a4a7cbeface3ea84479',0,0,57,96,48,'7F',7,0.00,'',0,0,0,'',1,'','System:','','',2,1),(516,'23ce25454b19d116c2665f36276178cd',0,0,57,96,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',5,2),(517,'8f8f596cda649b141e6fb33753328441',0,0,57,96,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',5,3),(518,'f64a0489181fca04c3ab9756d599cd2a',0,0,57,96,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',5,4),(519,'444155b1d39f0414b8f7536d05725f10',0,0,57,97,6,'7F',8,0.00,'',0,0,0,'',1,'','User:','','',2,5),(520,'ff1636dec0cf9582770ebc8d41f8ad92',0,0,57,97,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',5,6),(521,'a9814713bdd7982063ede15294e44353',0,0,57,97,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',5,7),(522,'b74446b41339040c50769c528f140afc',0,0,57,97,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',5,8),(523,'7a8fd8ba66b859e766b4b5f4f634dbce',0,0,57,98,112,'7F',8,0.00,'',0,0,0,'',1,'','Idle:','','',2,9),(524,'073b77aec68c56fb703c95e4999a99a6',0,0,57,98,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',5,10),(525,'3c0f7af8872c51acbf79b71b79f0bad5',0,0,57,98,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',5,11),(526,'ca50f081abe0f8718977f2982f2209f1',0,0,57,98,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',5,12),(527,'709a9acaaab34bc6976eb8499f1828ce',0,0,57,0,69,'7F',8,0.00,'',0,18,0,'',1,'','IO Wait:','','',2,13),(528,'7d4a7f4d52491c0b25dcbbe2222d0f0d',0,0,57,0,0,'FF',9,0.00,'',0,18,0,'',4,'','Current:','','',5,14),(529,'75390a70fc7589c23295d9ed45aa7614',0,0,57,0,0,'FF',9,0.00,'',0,18,0,'',1,'','Average:','','',5,15),(530,'ee981253aa7b49d9761a80ec0ad1541a',0,0,57,0,0,'FF',9,0.00,'',0,18,0,'',3,'','Maximum:','','on',5,16),(531,'857bb546882bc5049e673c4188cdda8b',0,0,58,99,46,'FF',4,0.00,'',0,0,0,'',3,'','','','',2,1),(532,'e7261d3093976dbe63de4937296a9a96',0,0,58,99,46,'7F',7,0.00,'',0,0,0,'',1,'','Interrupts:','','',2,2),(533,'959854c407cfa371240c0744d44618a6',0,0,58,99,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',3,3),(534,'1fbdf8aef7acfbc90ba7d24b6644e432',0,0,58,99,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,4),(535,'2df153e12b5db6ae3dea51df70f73651',0,0,58,99,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,5),(536,'0b502e0b5d0228d17d3c30f5a04c7083',0,0,59,100,65,'FF',4,0.00,'',0,0,0,'',3,'','','','',2,1),(537,'64c92d07fe3877e99dcc3b570ee90966',0,0,59,100,65,'7F',7,0.00,'',0,0,0,'',1,'','Context Switches:','','',2,2),(538,'72c6b8ab332e09e2894f18bcf5ba92fe',0,0,59,100,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',3,3),(539,'37f9956018cb4615de77aec4695fbb0c',0,0,59,100,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,4),(540,'1d7fe63be7b044229b79b6203298e506',0,0,59,100,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,5),(541,'c6034b9950f1eedb9623215773ac4c0e',0,0,60,101,67,'7F',7,0.00,'',0,19,0,'',1,'','Reads:','','',2,1),(542,'fc50e9a07b1662f659e87807228fcd50',0,0,60,101,0,'FF',9,0.00,'',0,19,0,'',4,'','Current:','','',3,2),(543,'fe48830387c7065ec8411d7509d4d387',0,0,60,101,0,'FF',9,0.00,'',0,19,0,'',1,'','Average:','','',3,3),(544,'f003813991610aa5f6889a2e5a526cca',0,0,60,101,0,'FF',9,0.00,'',0,19,0,'',3,'','Maximum:','','on',3,4),(545,'822b07e6f130a6ea9c4e56b745d456bb',0,0,60,102,41,'7F',8,0.00,'',0,19,0,'',1,'','Writes:','','',2,5),(546,'9cca58312cb9a95693e7e2a2d36de347',0,0,60,102,0,'FF',9,0.00,'',0,19,0,'',4,'','Current:','','',3,6),(547,'b51a340cee28a09462ff313592a69a72',0,0,60,102,0,'FF',9,0.00,'',0,19,0,'',1,'','Average:','','',3,7),(548,'818864becb9866cf3a2121c5d4478d80',0,0,60,102,0,'FF',9,0.00,'',0,19,0,'',3,'','Maximum:','','on',3,8),(549,'4a1e068ffc8c910ee9c5307d779c2db8',0,0,60,101,67,'FF',4,1.00,'',0,19,0,'',3,'','','','',2,9),(550,'f066a69f356fc13e266d4c7b737f8c0b',0,0,60,102,41,'FF',20,1.00,'',0,19,0,'',3,'','','','',2,10),(551,'46d2518edca9b8c584eb56da6e0d8591',0,0,61,103,60,'7F',7,0.00,'',0,19,0,'',1,'','Bytes Read:','','',2,1),(552,'278e15e34511ac2901776a5b2f57d86a',0,0,61,103,0,'FF',9,0.00,'',0,19,0,'',4,'','Current:','','',2,2),(553,'af0663bb419f274a0ed0136d4bd72367',0,0,61,103,0,'FF',9,0.00,'',0,19,0,'',1,'','Average:','','',2,3),(554,'bf1430f6ead0841deedd0453863d6f12',0,0,61,103,0,'FF',9,0.00,'',0,19,0,'',3,'','Maximum:','','on',2,4),(555,'0d501ca8ba8d40edaaf84251ce59c423',0,0,61,104,31,'7F',8,0.00,'',0,19,0,'',1,'','Bytes Written:','','',2,5),(556,'214d9cdbf3964e6b96b3040a9d346cd1',0,0,61,104,0,'FF',9,0.00,'',0,19,0,'',4,'','Current:','','',2,6),(557,'9cc55857c9a94c366c7530a0c04aebe4',0,0,61,104,0,'FF',9,0.00,'',0,19,0,'',1,'','Average:','','',2,7),(558,'9e0b34da9be24a05c4e35d199158d7a8',0,0,61,104,0,'FF',9,0.00,'',0,19,0,'',3,'','Maximum:','','on',2,8),(559,'aa49ac76638f30cd1e4b873155bdb1c1',0,0,61,103,60,'FF',4,1.00,'',0,19,0,'',3,'','','','',2,9),(560,'684c38d947eb1b9b64d718ab7a3552f3',0,0,61,104,31,'FF',20,1.00,'',0,19,0,'',3,'','','','',2,10),(561,'b561ed15b3ba66d277e6d7c1640b86f7',0,0,62,106,48,'7F',7,0.00,'',0,14,0,'',1,'','Used','','',2,1),(562,'99ef051057fa6adfa6834a7632e9d8a2',0,0,62,106,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,2),(563,'3986695132d3f4716872df4c6fbccb65',0,0,62,106,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,3),(564,'0444300017b368e6257f010dca8bbd0d',0,0,62,106,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,4),(565,'4d6a0b9063124ca60e2d1702b3e15e41',0,0,62,105,20,'7F',8,0.00,'',0,14,0,'',1,'','Available','','',2,5),(566,'181b08325e4d00cd50b8cdc8f8ae8e77',0,0,62,105,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,6),(567,'bba0a9ff1357c990df50429d64314340',0,0,62,105,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,7),(568,'d4a67883d53bc1df8aead21c97c0bc52',0,0,62,105,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,8),(569,'253c9ec2d66905245149c1c2dc8e536e',0,0,62,0,1,'FF',5,0.00,'',0,15,0,'',1,'','Total','','',2,9),(570,'ea9ea883383f4eb462fec6aa309ba7b5',0,0,62,0,0,'FF',9,0.00,'',0,15,0,'',4,'','Current:','','',2,10),(571,'83b746bcaba029eeca170a9f77ec4864',0,0,62,0,0,'FF',9,0.00,'',0,15,0,'',1,'','Average:','','',2,11),(572,'82e01dd92fd37887c0696192efe7af65',0,0,62,0,0,'FF',9,0.00,'',0,15,0,'',3,'','Maximum:','','on',2,12),(573,'a198acfb7af4b149e97b2eeae05f7854',0,0,62,106,48,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,13),(574,'fa2011b811862c238b476b5cd1d648e4',0,0,62,105,20,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,14),(575,'d80e4a4901ab86ee39c9cc613e13532f',0,0,63,108,20,'7F',7,0.00,'',0,0,0,'',1,'','Total','','',2,1),(576,'567c2214ee4753aa712c3d101ea49a5d',0,0,63,108,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,2),(577,'ba0b6a9e316ef9be66abba68b80f7587',0,0,63,108,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,3),(578,'4b8e4a6bf2757f04c3e3a088338a2f7a',0,0,63,108,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,4),(579,'16d6a9a7f608762ad65b0841e5ef4e9c',0,0,63,107,48,'7F',7,0.00,'',0,0,0,'',1,'','Used','','',2,5),(580,'2c35b5cae64c5f146a55fcb416dd14b5',0,0,63,107,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,6),(581,'36fa8063df3b07cece878d54443db727',0,0,63,107,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,7),(582,'b7b381d47972f836785d338a3bef6661',0,0,63,107,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,8),(583,'fd1f89bda6ca439507b8b10a6895ef83',0,0,63,108,20,'FF',4,1.00,'',0,0,0,'',1,'','','','',2,9),(584,'204c34152b67dada375e7a147ebe7b3f',0,0,63,107,344,'FF',4,1.00,'',0,0,0,'',1,'','','','',2,10),(585,'42537599b5fb8ea852240b58a58633de',0,0,64,109,9,'7F',7,0.00,'',0,0,0,'',1,'','CPU Utilization','','',2,1),(586,'d478a76de1df9edf896c9ce51506c483',0,0,64,109,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',3,2),(587,'8536e034ab5268a61473f1ff2f6bd88f',0,0,64,109,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,3),(588,'87e10f9942b625aa323a0f39b60058e7',0,0,64,109,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,4),(589,'309fd90f1a335fc13383a332a06504f1',0,0,64,109,9,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,5),(590,'5f1c879abc0726777fca0fc789389c83',0,0,65,116,81,'7F',7,0.00,'',0,0,0,'',1,'','Bytes Read','','',2,1),(591,'51c0118319b44f47189ae31f0309f9f0',0,0,65,116,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,2),(592,'0f89b5078bf70f0af2bf78234b23f00d',0,0,65,116,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,3),(593,'0120d481227fa168959c10bb270caa18',0,0,65,116,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,4),(594,'e73e2f5934a93891e7cbc573904bd6b4',0,0,65,111,31,'7F',8,0.00,'',0,0,0,'',1,'','Bytes Written','','',2,5),(595,'1c6656d52338c4abb6dadf149bfed8bf',0,0,65,111,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,6),(596,'e37e7851de6f4fbcb7d56a154a105e87',0,0,65,111,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,7),(597,'70eee256f03cfc9b2c94b79764c919f7',0,0,65,111,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,8),(598,'bdca605f97fdfba3d40218f3fd1c6cb2',0,0,65,116,81,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,9),(599,'592330a782c1e3234b068ba5c654b27e',0,0,65,111,31,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,10),(600,'2f92441bafd3b0ac3d8a7b8f14f7e7f4',0,0,66,113,25,'7F',7,0.00,'',0,0,0,'',1,'','1 Minute:','','',2,1),(601,'95c77bfdeab8864b3308a8ddae8a16d6',0,0,66,113,0,'FF',9,1.00,'',0,0,0,'',4,'','Current:','','',2,2),(602,'3742a4866a8778864fc50f1f9ae10b06',0,0,66,113,0,'FF',9,1.00,'',0,0,0,'',1,'','Average:','','',2,3),(603,'aaaaa65c1525d22a62fd821c2b2ed7c5',0,0,66,113,0,'FF',9,1.00,'',0,0,0,'',3,'','Maximum:','','on',2,4),(604,'0a493360ea80b6c42fab0a25a4035ac9',0,0,66,114,31,'7F',8,0.00,'',0,0,0,'',1,'','5 Minute:','','',2,5),(605,'b60da656f73dc1d11635625c2e6ef8c1',0,0,66,114,0,'FF',9,1.00,'',0,0,0,'',4,'','Current:','','',2,6),(606,'d44df4adf7c34dc15e76ab871c0f7ce6',0,0,66,114,0,'FF',9,1.00,'',0,0,0,'',1,'','Average:','','',2,7),(607,'e087987a73b788ff5661f66a9874fa59',0,0,66,114,0,'FF',9,1.00,'',0,0,0,'',3,'','Maximum:','','on',2,8),(608,'c970fc901877e404e96c0f5e3ff294b5',0,0,66,115,9,'7F',8,0.00,'',0,0,0,'',1,'','15 Minute:','','',2,9),(609,'3794dae61e4e3edbdede2cb237154dc6',0,0,66,115,0,'FF',9,1.00,'',0,0,0,'',4,'','Current:','','',2,10),(610,'e585d22bc3d118452e586f731769954e',0,0,66,115,0,'FF',9,1.00,'',0,0,0,'',1,'','Average:','','',2,11),(611,'31e471174c77bdb8c2b88f126732e2ea',0,0,66,115,0,'FF',9,1.00,'',0,0,0,'',3,'','Maximum:','','on',2,12),(612,'de8cc8b4d0b3bce5a15e0332abcc89f3',0,0,66,113,25,'FF',4,1.00,'',0,0,0,'',4,'','','','',2,13),(613,'9ab1319b03c5582751de0e918d27ba36',0,0,66,114,31,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,14),(614,'5642ca20de5f7a517d4fe1b32c67d05f',0,0,66,115,9,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,15),(615,'6b85618a4561027dc8dcb67583fdca53',0,0,67,110,21,'7F',7,0.00,'',0,0,0,'',1,'','Device Reads:','','',3,1),(616,'44c288205e20b2728a49386848edef0b',0,0,67,110,0,'FF',9,0.00,'',0,0,0,'',4,'','Last:','','',3,2),(617,'582b30daf33cec747505d4aa1b5beab3',0,0,67,110,0,'FF',9,0.00,'',0,0,0,'',2,'','Minimum:','','',3,3),(618,'0e1db768b3c884e7b70ef9c5f1b5c299',0,0,67,110,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,4),(619,'d22a3018c9394f9c72e6a39535facd0d',0,0,67,110,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,5),(620,'169f60ae37d15d6981fca7ab5b5899bb',0,0,67,112,9,'7F',8,0.00,'',0,0,0,'',1,'','Device Writes:','','',3,6),(621,'36692ccb814a0c7d7c1c4ed1fa51a185',0,0,67,112,0,'FF',9,0.00,'',0,0,0,'',4,'','Last:','','',3,7),(622,'8a880165df484c71ab809559158e2a15',0,0,67,112,0,'FF',9,0.00,'',0,0,0,'',2,'','Minumum:','','',3,8),(623,'634c71aa9ed03895176a26aceb375d83',0,0,67,112,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,9),(624,'168911021bc829a8abf4d4bfeacbe1d3',0,0,67,112,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,10),(625,'ce2b53b34a50ce8c54c8849b1c8baf9e',0,0,67,110,21,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,11),(626,'7675101daedceb6fd63d927e304f6273',0,0,67,112,9,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,12),(627,'',423,1,48,117,48,'7F',7,0.00,'',0,0,0,'',1,'','Running Processes<>','','',2,1),(628,'',424,1,48,117,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,3),(629,'',425,1,48,117,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,4),(630,'',426,1,48,117,48,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,5),(631,'',427,2,49,118,15,'7F',7,0.00,'',0,0,0,'',1,'','1 Minute Average','','',2,1),(632,'',428,2,49,118,0,'FF',9,1.00,'',0,0,0,'',4,'','Current:','','',4,2),(633,'',429,2,49,118,0,'FF',9,1.00,'',0,0,0,'',1,'','Average:','','',4,3),(634,'',430,2,49,118,0,'FF',9,1.00,'',0,0,0,'',3,'','Maximum:','','on',4,4),(635,'',431,2,49,119,8,'7F',8,0.00,'',0,0,0,'',1,'','5 Minute Average','','',2,5),(636,'',432,2,49,119,0,'FF',9,1.00,'',0,0,0,'',4,'','Current:','','',4,6),(637,'',433,2,49,119,0,'FF',9,1.00,'',0,0,0,'',1,'','Average:','','',4,7),(638,'',434,2,49,119,0,'FF',9,1.00,'',0,0,0,'',3,'','Maximum:','','on',4,8),(639,'',435,2,49,120,9,'7F',8,0.00,'',0,0,0,'',1,'','15 Minute Average','','',2,9),(640,'',436,2,49,120,0,'FF',9,1.00,'',0,0,0,'',4,'','Current:','','',4,10),(641,'',437,2,49,120,0,'FF',9,1.00,'',0,0,0,'',1,'','Average:','','',4,11),(642,'',438,2,49,120,0,'FF',9,1.00,'',0,0,0,'',3,'','Maximum:','','on',4,12),(643,'',439,2,49,0,1,'FF',4,0.00,'',0,12,0,'',1,'','','','on',2,13),(644,'',440,2,49,118,15,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,14),(645,'',441,2,49,119,8,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,15),(646,'',442,2,49,120,9,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,16),(647,'',443,3,50,121,67,'7F',7,0.00,'',0,0,0,'',1,'','Users','','',2,1),(648,'',444,3,50,121,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',3,2),(649,'',445,3,50,121,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,3),(650,'',446,3,50,121,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,4),(651,'',447,3,50,121,67,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,5),(652,'',448,4,51,122,41,'FF',7,0.00,'',0,14,0,'',1,'','Free','','',2,9),(653,'',449,4,51,122,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,10),(654,'',450,4,51,122,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,11),(655,'',451,4,51,122,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,12),(656,'',452,4,51,123,30,'FF',8,0.00,'',0,14,0,'',1,'','Swap','','',2,13),(657,'',453,4,51,123,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,14),(658,'',454,4,51,123,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,15),(659,'',455,4,51,123,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,16),(660,'38976334dfcaee218e39623892bf6508',0,0,68,124,22,'FF',7,0.00,'',0,20,0,'',1,'','','','',2,1),(661,'f938f0fbc39b1041639181a7cadc3a04',0,0,68,124,0,'FF',9,0.00,'',0,20,0,'',4,'','Current','','',2,2),(662,'212809cf6a37a8a3c7a7db6e16d6a1d4',0,0,69,125,58,'FF',7,0.00,'',0,0,0,'',1,'','Session Utilization','','on',2,1),(663,'19a7a1fcdfe985d7a4ed6e8d683ce580',0,0,69,125,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','on',3,2),(664,'c185b7bbfc3dba7d45ab590449e65abe',0,0,69,125,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,4),(665,'6fb0b65058c30bb9e1ed4ccbb829ae9b',0,0,70,126,67,'FF',4,0.00,'',0,0,0,'',1,'','Concurrent Sessions','','on',2,1),(666,'10db8e3dd47c64ea5650d4bc94ab1ab1',0,0,70,126,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',3,3),(667,'bb5a93b9529865a2c0bdeded097a6e3b',0,0,70,126,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',3,4),(668,'34ff020ed1b0898e78c882633e6dddee',0,0,70,126,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,5),(669,'8460d536537838780be1940227c5d179',0,0,71,127,67,'FF',4,0.00,'',0,0,0,'',1,'','TCP Sessions','','on',2,1),(670,'9c962cdc2310dba4d8f6ed543f305802',0,0,71,127,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','on',3,2),(671,'c70bd95f75fb4d09949c1213aa6d4851',0,0,71,127,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','on',3,3),(672,'8629a833a70c9c77c1e2908b6d8f35f8',0,0,71,127,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,4),(673,'a765eadfe07aa7851530cdd6c30e2425',0,0,71,128,48,'FF',6,0.00,'',0,0,0,'',1,'','UDP Sessions','','on',2,5),(674,'b6d894eb3640797434159e6b84214f81',0,0,71,128,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','on',3,6),(675,'562245a722ed80f59618c14cc7e0aafe',0,0,71,128,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','on',3,7),(676,'44d3327e9fe9cd5e4917f4574b0ff575',0,0,71,128,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,8),(677,'14c73784527d06beb1203045c938e84f',0,0,71,129,12,'FF',6,0.00,'',0,0,0,'',1,'','ICMP Sessions','','on',2,9),(678,'c1eba89d553283e19fea951909563b42',0,0,71,129,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','on',3,10),(679,'1341e979df0f66b23b6f09a46917f0d6',0,0,71,129,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','on',3,11),(680,'d8a7e7a853ed5700b73b66919e21ebb6',0,0,71,129,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',3,12),(681,'3a82918f6de9b68482a644e75da70eb3',0,0,72,130,10,'FF',4,0.00,'',0,0,0,'',1,'','Data Plane:','','',2,1),(682,'fab1079fd4cc5f8a747a35c9ade1ae38',0,0,72,130,0,'FF',9,0.00,'',0,0,0,'',1,'','','','on',3,2),(683,'f3a5150aff78171f91d134e770e97153',0,0,72,131,12,'FF',5,0.00,'',0,0,0,'',1,'','Management Plane:','','',2,5),(684,'9d39b60012e4320a346d716a87ed96ad',0,0,72,131,0,'FF',9,0.00,'',0,0,0,'',1,'','','','on',3,6),(685,'971eeef377ba8fb5651e125226936a80',0,0,73,132,9,'FF',4,0.00,'',0,0,0,'',1,'','DP Temperature:','','',3,1),(686,'5ddab7a610974c95a2eb644b8b1ef018',0,0,73,132,0,'FF',9,0.00,'',0,0,0,'',1,'','','','on',3,2),(687,'cbb3c8c49c6217761df7513c54cce977',0,0,73,133,68,'FF',5,0.00,'',0,0,0,'',1,'','MP Temperature:','','',2,3),(688,'64a8108791e4f8a10e1118a89dc5f74f',0,0,73,133,0,'FF',9,0.00,'',0,0,0,'',1,'','','','on',3,4),(689,'9fb9b3f46512dd4635c74c39426b05f6',0,0,73,133,340,'FF',2,1.00,'',0,0,0,'',1,'','Max Temp','50','',2,5),(690,'0d1bf9d0d9723117ebb66785b2080142',0,0,73,133,21,'FF',2,1.00,'',0,0,0,'',1,'','Min Temp','5','',2,6),(691,'efcd7123f659b06bcc61e84131a5ff5d',0,0,36,66,12,'19',7,0.00,'',0,2,0,'',1,'','','','',2,1),(692,'b64fa4ca3abdc9a4416c73ca74a1bbdf',0,0,36,66,9,'33',7,0.00,'',0,2,0,'',1,'','','','',2,2),(693,'a08a4b9683da7e14cb6f7383aa51bc6e',0,0,36,66,84,'FF',4,0.00,'',0,2,0,'',3,'','Peak Usage','','on',2,5),(694,'ce93ec35c1e011b318c0617a0b6bbd96',0,0,36,67,10,'19',7,0.00,'',0,21,0,'',1,'','','','',2,6),(695,'455fc632dfd21728bfd7fad9b148bb42',0,0,36,67,440,'33',7,0.00,'',0,2,0,'',1,'','','','',2,7),(696,'9a4039e75156c2240387c66563420b0e',0,0,36,0,102,'FF',7,0.00,'',0,22,0,'',1,'','','','',2,9),(697,'7ca34f612d35e1abafff8fe4ac59124a',0,0,36,66,1,'FF',4,0.00,'',0,2,0,'',1,'','','','',2,9),(698,'6128de3c9dac221510c457f99d455173',0,0,36,67,440,'FF',4,0.00,'',0,23,0,'',3,'','Peak Usage','','on',2,10),(699,'b5445c3a25f2b596953a87b5495e7b3e',0,0,36,67,1,'FF',4,0.00,'',0,24,0,'',1,'','','','',2,10),(700,'43b17f21ae57f4e8d838612d3694b866',0,0,37,71,0,'FF',1,0.00,'',0,0,0,'',1,'','Graph Last Updated:|date_time|','','on',2,17),(701,'87fa51f61ad16b3ad435fbfa2e87ac35',0,0,37,0,102,'FF',7,0.00,'',0,22,0,'',1,'','','','',2,18),(702,'56dc4c7023262bf9c15fefe6cd240c54',0,0,38,73,0,'FF',1,0.00,'',0,0,0,'',1,'','Graph Last Updated:|date_time|','','on',2,9),(703,'5ea1fbfc3fd6069b7fdd3070fc1b6b77',0,0,38,0,102,'FF',7,0.00,'',0,22,0,'',1,'','','','',2,10),(704,'612db8b591cdfd7b3a2d8235980a6761',0,0,39,74,0,'FF',1,0.00,'',0,0,0,'',1,'','Graph Last Updated:|date_time|','','on',2,9),(705,'c689d3bf3c4812d4a20343a88241b7c3',0,0,39,0,102,'FF',7,0.00,'',0,22,0,'',1,'','','','',2,10),(706,'ef1d179fc26f6406828ff552ca882c85',0,0,40,0,102,'FF',7,0.00,'',0,22,0,'',1,'','','','',2,9),(707,'c0cbc6b9637c2a6694748d1732746d01',0,0,41,66,0,'FF',1,0.00,'',0,0,0,'',1,'','Transfer:  |sum:auto:current:2:auto|','','',2,5),(708,'307da5e1e847b67848a7ac8db5ae62af',0,0,41,66,12,'FF',2,0.00,'',0,0,0,'',1,'','95%:','|95:bits:0:current|','',2,6),(709,'970ab82d4e4524c92ad853d3991f0b24',0,0,41,66,0,'FF',1,0.00,'',0,0,0,'',1,'','|95:bits:6:current| mbit','','on',2,7),(710,'1969b1b42ec55cd35bb28914fd96d0aa',0,0,41,0,102,'FF',7,0.00,'',0,22,0,'',1,'','','','',2,12),(711,'94c2fbd8817ce422921d352afb0d7abb',0,0,41,67,0,'FF',1,0.00,'',0,0,0,'',1,'','Transfer: |sum:auto:current:2:auto|','','',2,14),(712,'a98663fa6795a75be57ebdf49dab3fb6',0,0,41,67,21,'FF',2,0.00,'',0,0,0,'',1,'','95%:','|95:bits:0:current|','',2,15),(713,'01c2c094112f1647198d52ecf92722cd',0,0,41,0,0,'FF',1,0.00,'',0,12,0,'',1,'','|95:bits:6:total:2| mbit','','',2,19),(714,'6ee4edad1407ff6e8457d351c37a8d48',0,0,41,0,0,'FF',1,0.00,'',0,0,0,'',1,'','Total Transfer: |sum:auto:total:2:auto|','','on',2,21),(715,'7cfb6f6783dac1c370801a13300ecc1c',0,0,42,67,0,'FF',1,0.00,'',0,0,0,'',1,'','Description: |query_ifAlias|','','on',2,13),(716,'5c3af9591be8b45e2cb932468f9a10c9',0,0,42,67,0,'FF',1,0.00,'',0,0,0,'',3,'','Graph Last Updated:|date_time|','','on',2,14),(717,'dc22372cdaf5b37ecc7ddcef862299c3',0,0,42,0,102,'FF',7,0.00,'',0,22,0,'',1,'','','','',2,29),(718,'f01bb9a4cc86396250360f1e17b1ac0a',0,0,43,67,102,'FF',7,0.00,'',0,22,0,'',1,'','','','',2,13),(719,'d2d581c4e2c3dc7998f813a91412342e',0,0,74,134,25,'FF',7,0.00,'',0,0,0,'',1,'','Multicast Packets In','','',2,1),(720,'4e88c6b0891b5ef1e224d6dce076aef8',0,0,74,134,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,2),(721,'5d2c7297069acb593c50535a9db1ca16',0,0,74,134,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,3),(722,'8cd6a8763b42a460f782ff509992597e',0,0,74,134,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,4),(723,'3bbc2aeb67f2ede3d3d6830a4c73954a',0,0,74,135,71,'FF',4,0.00,'',0,0,0,'',1,'','Multicast Packets Out','','',2,5),(724,'c037f08886a2a013c573327e50b1b498',0,0,74,135,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,6),(725,'619caccf6708eb5268577bc4ace96538',0,0,74,135,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,7),(726,'651eeb3124343a753318aede1011d9b3',0,0,74,135,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,8),(727,'ced53866748e172e7563bdf44eff317a',0,0,75,136,30,'FF',7,0.00,'',0,0,0,'',1,'','Current status:','','',2,1),(728,'f0f451b88208769af51b35b710615047',0,0,75,136,0,'FF',9,0.00,'',0,0,0,'',4,'','','','on',2,2),(729,'b1c4139713f888396ffea00632531fa8',0,0,75,136,0,'FF',1,0.00,'',0,0,0,'',4,'','(1 = Up | 2 = Down)','','on',2,3),(730,'519da60f949ae61f7bb21d9f4563155e',0,0,76,137,67,'FF',7,0.00,NULL,NULL,0,0,NULL,3,NULL,'CPU Usage','','',2,1),(731,'96d08618a5b3d4cdcdd6d1e4ed04b45f',0,0,76,137,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',3,2),(732,'70265cd2de044cedcbe708069a077804',0,0,76,137,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',3,3),(733,'7a0e91f07f0d3f0400a6beb6a7db340b',0,0,76,137,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','',3,4),(734,'45f2e4a865fe9f81f4ccdec74266cd40',0,0,76,137,0,'FF',1,0.00,NULL,NULL,0,0,NULL,1,NULL,'Graph Last Updated:|date_time|','','',2,5),(735,'a0b22e9fe0f7069dcdadc66a1a062cf7',0,0,76,0,2,'FF',7,0.00,NULL,NULL,22,0,NULL,1,NULL,'','','',2,6),(736,'bd342e8beb756d1b837568da7c5e6bb9',0,0,77,138,9,'FF',7,0.00,NULL,NULL,0,0,NULL,1,NULL,'Allocated:','','',2,2),(737,'9c2016957115b1833e3a3a5deea50944',0,0,78,139,94,'FF',7,0.00,NULL,NULL,0,0,NULL,3,NULL,'Memory Usage','','',2,1),(738,'f0dfece1ced17a43480a1fb3ac3470b6',0,0,78,139,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',3,2),(739,'3a8b665f9106aef3511d7d0280c19f20',0,0,78,139,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',3,3),(740,'7d3ba0fe8802062635f99b654b1328e1',0,0,78,139,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','',3,4),(741,'d7b8b34f2eed55b686e8794e5ea86073',0,0,78,137,0,'FF',1,0.00,NULL,NULL,0,0,NULL,1,NULL,'Graph Last Updated:|date_time|','','',2,5),(742,'1d56cfa6c755dfa115eb584237508ec6',0,0,78,0,2,'FF',7,0.00,NULL,NULL,22,0,NULL,1,NULL,'','','',2,6),(743,'a0425fd0b683065b1b13f19ea55588bb',0,0,79,141,0,'FF',4,0.00,NULL,NULL,0,0,NULL,1,NULL,'','','',2,1),(744,'f6b38e63b1bd291b3c22b3b5e2d1eb89',0,0,79,142,0,'FF',4,0.00,NULL,NULL,0,0,NULL,1,NULL,'','','',2,2),(745,'125917dd1e6cda165877e195b7c92408',0,0,79,143,0,'FF',4,0.00,NULL,NULL,0,0,NULL,1,NULL,'','','',2,3),(746,'acd1627d238f9dcedb8d85b3ab475076',0,0,79,140,0,'FF',4,0.00,NULL,NULL,0,0,NULL,1,NULL,'','','',2,4),(747,'746af0ee1a30bbb3407211c86db409ef',0,0,79,144,0,'FF',4,0.00,NULL,NULL,0,0,NULL,1,NULL,'','','',2,5),(748,'100dba97c23948319da2c8b0038825e3',0,0,79,142,0,'FF',1,0.00,NULL,NULL,0,0,NULL,1,NULL,'  Packet Loss  ','','',2,8),(749,'0839825c0797f3d5dec79a376f476a86',0,0,79,0,12,'7F',7,0.00,NULL,NULL,50,0,NULL,1,NULL,'0%','','',2,9),(750,'596979d6c5325467419d74565dcf5a24',0,0,79,0,80,'7F',7,0.00,NULL,NULL,38,0,NULL,1,NULL,'1-2%','','',2,10),(751,'1ed1c0acdefb93fe910b97d0d39d3495',0,0,79,0,81,'7F',7,0.00,NULL,NULL,40,0,NULL,1,NULL,'3-5%','','',2,11),(752,'66359feaf55870b3894af7a78fee4939',0,0,79,0,74,'7F',7,0.00,NULL,NULL,26,0,NULL,1,NULL,'6-10%','','',2,12),(753,'d3d252781d0eb3b9cc2d2f55fd6f7587',0,0,79,0,67,'7F',7,0.00,NULL,NULL,27,0,NULL,1,NULL,'11-15%','','',2,13),(754,'a7e624198fd5e900cc1e487b3a4806b6',0,0,79,0,56,'7F',7,0.00,NULL,NULL,28,0,NULL,1,NULL,'16-50%','','',2,14),(755,'780c1cff313c789190189fe9c9fd5995',0,0,79,0,11,'7F',7,0.00,NULL,NULL,25,0,NULL,1,NULL,'51-95%','','',2,15),(756,'c65e83b27d099ee55bbfa0523ffb0e59',0,0,79,0,48,'7F',7,0.00,NULL,NULL,29,0,NULL,1,NULL,'96-100%','','',2,16),(757,'1113c27922d4837b3769f4f3d70612b5',0,0,79,0,1,'33',7,0.00,NULL,NULL,42,0,NULL,1,NULL,'DEAD / NaN','','on',2,17),(758,'3fae9a48fa30028cae44c6c448281332',0,0,79,142,2,'FF',7,0.00,NULL,NULL,0,0,NULL,1,NULL,'','','',2,18),(759,'ce42bf71b22d9ce5fcbe6cc150bf654e',0,0,79,0,441,'FF',8,0.00,NULL,NULL,30,0,NULL,1,NULL,'','','',2,19),(760,'f8a029b5507c37513780b8019c6c827f',0,0,79,0,442,'FF',8,0.00,NULL,NULL,30,0,NULL,1,NULL,'','','',2,20),(761,'c07edb917c624b1a385ba3d7c3f69bcc',0,0,79,0,443,'FF',8,0.00,NULL,NULL,31,0,NULL,1,NULL,'','','',2,21),(762,'2151c43b2e94d3bb37e3275522378db1',0,0,79,0,444,'FF',8,0.00,NULL,NULL,31,0,NULL,1,NULL,'','','',2,22),(763,'749777bfaba49565e06ab178608daa8e',0,0,79,0,445,'FF',8,0.00,NULL,NULL,31,0,NULL,1,NULL,'','','',2,23),(764,'b259f3a0a941b96dfccf79d04fed2d35',0,0,79,141,2,'FF',7,0.00,NULL,NULL,0,0,NULL,1,NULL,'','','',2,24),(765,'3696a08e0098c5f942e316b584f17744',0,0,79,0,445,'FF',8,0.00,NULL,NULL,41,0,NULL,1,NULL,'','','',2,25),(766,'ce8da148e7eac9b2601a774b2648aaa1',0,0,79,0,444,'FF',8,0.00,NULL,NULL,41,0,NULL,1,NULL,'','','',2,26),(767,'2b3b7766edc58dcfc0bd0cf17df6794e',0,0,79,0,443,'FF',8,0.00,NULL,NULL,41,0,NULL,1,NULL,'','','',2,27),(768,'6d9cda91fada153c5ae82c875504d615',0,0,79,0,442,'FF',8,0.00,NULL,NULL,41,0,NULL,1,NULL,'','','',2,28),(769,'875c87ede5add54209043e6948c3dba5',0,0,79,0,441,'FF',8,0.00,NULL,NULL,41,0,NULL,1,NULL,'','','',2,29),(770,'45cd22fd0f3530fedd30ccecb13acce5',0,0,79,0,0,'FF',1,0.00,NULL,NULL,0,0,NULL,1,NULL,'  Packet Loss  ','','',2,30),(771,'c87bb4e70d64cbc58038a13f951eba1a',0,0,79,140,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',6,31),(772,'89f4ee5a22105307ee376b01b3a75725',0,0,79,140,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,' Avg:','','',6,32),(773,'2dec439607fb5b2d3f2053fa9c9349a5',0,0,79,140,0,'FF',9,0.00,NULL,NULL,0,0,NULL,2,NULL,' Min:','','',6,33),(774,'f7a8e7656c184bfa6d7ba4672039cb51',0,0,79,140,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,' Max:','','on',6,34),(775,'f3b400f85f528bfd1ddfd23f05edf9e0',0,0,79,0,0,'FF',1,0.00,NULL,NULL,0,0,NULL,1,NULL,'','','on',2,36),(776,'0df8101edbdbb1853bb59e45a712538c',0,0,79,0,80,'7F',7,0.00,NULL,NULL,37,0,NULL,1,NULL,'','','',2,37),(777,'8f9986628ddb833cb880d1e00aca6786',0,0,79,0,81,'7F',7,0.00,NULL,NULL,39,0,NULL,1,NULL,'','','',2,38),(778,'74f90d97feb5be4269dc85cb13487fad',0,0,79,0,74,'7F',7,0.00,NULL,NULL,33,0,NULL,1,NULL,'','','',2,39),(779,'80df0be7454acf79e2da7bf19f4241f4',0,0,79,0,67,'7F',7,0.00,NULL,NULL,32,0,NULL,1,NULL,'','','',2,40),(780,'6629306114ad537b36699b5e35dc16fc',0,0,79,0,56,'7F',7,0.00,NULL,NULL,34,0,NULL,1,NULL,'','','',2,41),(781,'977a28bada48600f987ea1f4855f8f8c',0,0,79,0,11,'7F',7,0.00,NULL,NULL,35,0,NULL,1,NULL,'','','',2,42),(782,'0462d7705ccc46d75144487102820ef2',0,0,79,0,48,'7F',7,0.00,NULL,NULL,36,0,NULL,1,NULL,'','','',2,43),(783,'658f1214eaea64051456aad74e8e876a',0,0,79,141,445,'00',4,0.00,NULL,NULL,0,0,NULL,1,NULL,'Min Latency  ','','',7,44),(784,'6961bea34b5d98c67e3e178aa6c70235',0,0,79,141,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',7,45),(785,'e4fada2f8f09422c6ab2ee5e91357435',0,0,79,141,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Avg:','','',7,46),(786,'eb2ae267eeb91908ac31fc266e5aea26',0,0,79,141,0,'FF',9,0.00,NULL,NULL,0,0,NULL,2,NULL,'Min:','','',7,47),(787,'d5c2d8d4587fb30f76899d2aa694e220',0,0,79,141,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Max:','','on',7,48),(788,'d58e20dabf87929e594efae108e94470',0,0,79,142,1,'FF',4,0.00,NULL,NULL,0,0,NULL,1,NULL,'Avg Latency  ','','',7,49),(789,'41615590d6401d59a36880e1253e20b7',0,0,79,142,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',7,50),(790,'cceff2f82f59eae4a615fe82fdb0c3c2',0,0,79,142,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Avg:','','',7,51),(791,'8fe80a24afb979c48f53901743bb3296',0,0,79,142,0,'FF',9,0.00,NULL,NULL,0,0,NULL,2,NULL,'Min:','','',7,52),(792,'71723c3bb59df15738598982d447b3cb',0,0,79,142,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Max:','','on',7,53),(793,'eb9a85a85fb929621b8cf05d1f1cd8ba',0,0,79,143,445,'00',4,0.00,NULL,NULL,0,0,NULL,1,NULL,'Max Latency  ','','',7,54),(794,'6d1f1b426c009dc933b0a1a5d1344c1c',0,0,79,143,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',7,55),(795,'16ef06533a4b13d096e4d0cb5e02e3fa',0,0,79,143,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Avg:','','',7,56),(796,'4f5e2cb361f3cfef7f34e67db21cb0c5',0,0,79,143,0,'FF',9,0.00,NULL,NULL,0,0,NULL,2,NULL,'Min:','','',7,57),(797,'b0591b46f0ab6cc30204bc7a0fd34462',0,0,79,143,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Max:','','on',7,58),(798,'16397242fa349435df67d8335e339fcc',0,0,79,0,0,'FF',1,0.00,NULL,NULL,0,0,NULL,1,NULL,'  Deviation    ','','',2,60),(799,'23da499024a14d34f18804850cfbf405',0,0,79,144,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',7,61),(800,'0eaee440fd39c25ef13d7dcc159c17c7',0,0,79,144,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Avg:','','',7,62),(801,'485b63dd64e5c1f8377a5a21ee9236ff',0,0,79,144,0,'FF',9,0.00,NULL,NULL,0,0,NULL,2,NULL,'Min:','','',7,63),(802,'72fa013f5290903f2dca9ee8ec1f5aee',0,0,79,144,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Max:','','on',7,64),(803,'b16f28ad63a7d25694579b1aec3d81dd',0,0,79,142,1,'FF',4,0.00,NULL,NULL,0,0,NULL,1,NULL,'','','',2,65),(804,'40a66050a8941839e02827a6ac2e872e',0,0,79,142,12,'FF',5,0.00,NULL,NULL,50,0,NULL,1,NULL,'','','',2,66),(805,'2f713eab603ef3da208dec08104524ba',0,0,79,142,80,'FF',5,0.00,NULL,NULL,44,0,NULL,1,NULL,'','','',2,67),(806,'9fd82f92425cc78fe33e3cdb7f0d98c4',0,0,79,142,81,'FF',5,0.00,NULL,NULL,43,0,NULL,1,NULL,'','','',2,68),(807,'79330f8dbd567611225dbab5a22716b6',0,0,79,142,74,'FF',5,0.00,NULL,NULL,45,0,NULL,1,NULL,'','','',2,69),(808,'d57e0aacb97843c62309402b67c2bf22',0,0,79,142,67,'FF',5,0.00,NULL,NULL,46,0,NULL,1,NULL,'','','',2,70),(809,'e546d94af892957f7eb89add33b56063',0,0,79,142,56,'FF',5,0.00,NULL,NULL,47,0,NULL,1,NULL,'','','',2,71),(810,'bc1855ce785c8157135e256f3ec2b730',0,0,79,142,11,'FF',5,0.00,NULL,NULL,48,0,NULL,1,NULL,'','','',2,72),(811,'c8bf2802e895a8639a3243b689b87ae2',0,0,79,142,48,'FF',5,0.00,NULL,NULL,49,0,NULL,1,NULL,'','','',2,73),(812,'e7844ed0d252c5243d25518e4eb4dd33',0,0,79,0,0,'FF',1,0.00,NULL,NULL,0,0,NULL,1,NULL,'','','on',2,75),(813,'c37053a7729667151ef2a2ce5e41392e',0,0,79,0,0,'FF',1,0.00,NULL,NULL,0,0,NULL,1,NULL,'  Probe        ','','',2,76),(814,'f9015f69cec2c47f04df97058bb88fb9',0,0,79,0,0,'FF',1,0.00,NULL,NULL,0,0,NULL,1,NULL,'|input_attempts| |input_protocol| packets every 300 seconds to |host_hostname|','','on',2,77),(815,'8d5904bebbd101cb00f78d92c9f4ceba',0,0,80,151,5,'FF',7,0.00,NULL,NULL,51,0,NULL,1,NULL,'% CPU Idle','','',8,1),(816,'ef1a789e93e30e1b0ff24070dc91f1d2',0,0,80,151,0,'FF',9,0.00,NULL,NULL,51,0,NULL,4,NULL,'Current:','','',8,2),(817,'00adf8d4f685303facf95943682ca428',0,0,80,151,0,'FF',9,0.00,NULL,NULL,51,0,NULL,1,NULL,'Average:','','',8,3),(818,'6a1970d25f3ef2962ac8321187461abd',0,0,80,151,0,'FF',9,0.00,NULL,NULL,51,0,NULL,3,NULL,'Maximum:','','on',8,4),(819,'783a57ea63bf8f247d3b6e423019713a',0,0,80,152,21,'FF',7,0.00,NULL,NULL,0,0,NULL,1,NULL,'% User:','','',2,5),(820,'4fdb83458a91179888d0b752fc66e3f9',0,0,80,152,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',8,6),(821,'1f3fe0398296137a51373f46d4c314b3',0,0,80,152,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',8,7),(822,'a7837f7f299bf91f799dd452372ee8e9',0,0,80,152,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',8,8),(823,'1521435155eb30b7940a69cec2d72274',0,0,80,150,12,'FF',8,0.00,NULL,NULL,0,0,NULL,1,NULL,'% Privileged:','','',2,9),(824,'3834dd65e271de32ccc02ac78c31cfc1',0,0,80,150,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',8,10),(825,'6bbb980c0886bae0c1c3c4014b3b6921',0,0,80,150,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',8,11),(826,'79f4759689c99ce15cc47091cc84915e',0,0,80,150,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',8,12),(827,'5ecae227935a25f5bcab731e34560f40',0,0,80,151,9,'FF',4,0.00,NULL,NULL,0,0,NULL,1,NULL,'% Processor:','','',2,13),(828,'5767b9d5d8c08e536009f73319f2219d',0,0,80,151,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',8,14),(829,'6e23b45f3526341c315c1c94c9ef0d94',0,0,80,151,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',8,15),(830,'f8ee2420f6abbf1958d1d87b2427e581',0,0,80,151,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',8,16),(831,'4e4cb582cb5c35ba1d6cc6b77a71de8b',0,0,80,147,0,'FF',1,0.00,NULL,NULL,0,0,NULL,1,NULL,'Interrupts/Sec:','','',3,17),(832,'bca018f11fa176061942a7e7f6dbc3cd',0,0,80,147,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',9,18),(833,'a4aae94c92056bda27a4f8b75a04d342',0,0,80,147,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',9,19),(834,'f80d87da673c59fad88d008d4413cf20',0,0,80,147,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',9,20),(835,'0485bd7567a6b64c4e0baf09ecb74b81',0,0,80,149,0,'FF',1,0.00,NULL,NULL,0,0,NULL,1,NULL,'% Interrupt:','','',2,21),(836,'54d81c9f863a2286693826a1d40c136f',0,0,80,149,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',8,22),(837,'5a4c74fdd441d8be62f43dba4dd7fdcd',0,0,80,149,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',8,23),(838,'ed8d00f65d159e5475e028ead6a78722',0,0,80,149,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',8,24),(839,'fb68e75608dc1f82ae7596628d515756',0,0,80,148,0,'FF',1,0.00,NULL,NULL,0,0,NULL,1,NULL,'% DPC Time:','','',2,25),(840,'9d682b24de9f6638deb9835dc06dbe01',0,0,80,148,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',8,26),(841,'cf53388348d64776c047f9a095ac3c35',0,0,80,148,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',8,27),(842,'2efd1b7ae8bb1846cca783fc6f8e1d6f',0,0,80,148,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',8,28),(843,'6ee1aab00e6aebcac4be8cbbdb8b2927',0,0,80,146,0,'FF',1,0.00,NULL,NULL,0,0,NULL,1,NULL,'DPCs Queued/Sec:','','',3,29),(844,'9b68c268761d704113770f4bd248b7cc',0,0,80,146,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',9,30),(845,'f79e43358ac234e95d8d84dcdbd357cc',0,0,80,146,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',9,31),(846,'2bc44e9c24303e3cb233e41f1fa73520',0,0,80,146,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',9,32),(847,'5938a3d221c8bd24075dbed8c2065d4c',0,0,80,145,0,'FF',1,0.00,NULL,NULL,0,0,NULL,1,NULL,'DPC Rate:','','',2,33),(848,'4f5fb007f849a348a2879e5a642e7c21',0,0,80,145,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',3,34),(849,'0acdd30f2cbaf38927f930dbab466193',0,0,80,145,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',3,35),(850,'52699cf14595f28e2d94a52adb22dbd9',0,0,80,145,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',3,36),(851,'3c8beb5a5bb38fe4bbb967ef1c2877fe',0,0,81,154,12,'FF',7,0.00,NULL,NULL,0,0,NULL,1,NULL,'Disk Read Bytes/Sec:','','',2,1),(852,'07bdaac581e0aa44d87588adf5c79471',0,0,81,154,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',2,2),(853,'86adaadd3119aadefc074681507c3bd5',0,0,81,154,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',2,3),(854,'a54f36d0ad267417b94a3cc92eca4df0',0,0,81,154,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',2,4),(855,'b072be00c7004935014c87c4379d4090',0,0,81,153,21,'FF',8,0.00,NULL,NULL,0,0,NULL,1,NULL,'Disk Write Bytes/Sec:','','',2,5),(856,'11da2413445e47cf3bb1ea6149557c17',0,0,81,153,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',2,6),(857,'43d9e3adc5a81a39bc7d956a14d6049c',0,0,81,153,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',2,7),(858,'95c8c81b1b65242d2481b27e4cc94a24',0,0,81,153,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',2,8),(859,'0b6ed950aa539fa450c2082f61ead8b1',0,0,81,155,9,'FF',4,0.00,NULL,NULL,0,0,NULL,1,NULL,'Total Disk Bytes/Sec:','','',2,9),(860,'0cb758ff0f12f4dea964c8bb0cbf033e',0,0,81,155,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',2,10),(861,'01c5e84fea41e90a4e34180bae7a382c',0,0,81,155,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',2,11),(862,'df46460631552b16ae5385420578f28a',0,0,81,155,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',2,12),(863,'3fc08f3c292e8d20d12d6af5882462cf',0,0,81,154,0,'FF',1,0.00,NULL,NULL,0,0,NULL,1,NULL,'Total Read:  |sum:auto:current:2:auto|','','',2,13),(864,'d6b212b508e537ce5654f7a9d9b92a1c',0,0,81,153,0,'FF',1,0.00,NULL,NULL,0,0,NULL,1,NULL,'Total Writes:  |sum:auto:current:2:auto|','','',2,14),(865,'728a3f0330f87cabfe044fb2f86010af',0,0,82,160,444,'FF',7,0.00,NULL,NULL,0,0,NULL,1,NULL,'% Idle Time:','','',2,1),(866,'5e9dcbdb8b3ccb2e14cfe11f8f832e1d',0,0,82,160,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',8,2),(867,'5a717e7ea6c9c3767733dea873d1e83b',0,0,82,160,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',8,3),(868,'36e40c72567ba2de362a7dc3d994be97',0,0,82,160,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',8,4),(869,'611f073a3116ca98f1fbd59140edbcd7',0,0,82,157,21,'FF',7,0.00,NULL,NULL,0,0,NULL,1,NULL,'% Read Time:','','',2,5),(870,'8b7be585cad9de6977c8fee6b6ecf94e',0,0,82,157,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',8,6),(871,'240f3919932ac76985c9fa0dc14510fc',0,0,82,157,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',8,7),(872,'00499ddc3feb1adaac5b3fc91ac818da',0,0,82,157,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',8,8),(873,'96d726daac84655cf5ef1c0623832e37',0,0,82,158,12,'FF',8,0.00,NULL,NULL,0,0,NULL,1,NULL,'% Write Time:','','',2,9),(874,'0b4506eec82b7ef2cd7c44a368cb3852',0,0,82,158,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',8,10),(875,'8bb17163c66e2872ffb26efdb2c5f84b',0,0,82,158,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',8,11),(876,'a9d3f623d4d5b6f14ad2a8a3c124b4ec',0,0,82,158,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',8,12),(877,'97871e7af4bf1e3d97fde7c4b1e2b561',0,0,82,156,9,'FF',4,0.00,NULL,NULL,0,0,NULL,1,NULL,'% Disk Time:','','',8,13),(878,'3132949118fd288918b40b9653ccae68',0,0,82,156,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',8,14),(879,'d05b72e09d234805342bf52ffc88dba2',0,0,82,156,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',8,15),(880,'d6595a32f1b2678d4abe8eb22eb65c18',0,0,82,156,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',8,16),(881,'96b90771ec3fda7183cc414be72c48ed',0,0,82,159,264,'FF',4,0.00,NULL,NULL,0,0,NULL,1,NULL,'% Free Space:','','',2,17),(882,'569590768d72061c08650a4b5bec4b7f',0,0,82,159,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',8,18),(883,'ea35d2e47379565effd38340d73aaf06',0,0,82,159,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',8,19),(884,'1f9f9bea39bb5b71063d8405ab1a6ff2',0,0,82,159,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',8,20),(885,'8d16a47b7211e371f5bf566fd65e1eaa',0,0,82,0,61,'FF',2,0.00,NULL,NULL,0,0,NULL,1,NULL,'% Disk Time Threshold:','90','on',2,21),(886,'9e54df5839abdfc11f35eeec6b96446f',0,0,82,0,0,'FF',1,0.00,NULL,NULL,0,0,NULL,1,NULL,'|date_time|','','',2,22),(887,'ecc14372d77018500e8ca0aa2f3019e7',0,0,83,161,21,'FF',7,0.00,NULL,NULL,0,0,NULL,1,NULL,'Disk Reads/Sec:','','',9,1),(888,'05057782f07de7df5cff8b39d7f6e346',0,0,83,161,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',9,2),(889,'16d2b05d0ec2d1e26773889b412f67e9',0,0,83,161,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',9,3),(890,'511eec161fc9bc161067880ae556d6f5',0,0,83,161,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',9,4),(891,'d68dcd9c6bad0e58f28d5ea72c0703f3',0,0,83,168,11,'FF',8,0.00,NULL,NULL,0,0,NULL,1,NULL,'Disk Writes/Sec:','','',9,5),(892,'a78592118b90abc2f7696a6915f0e2ab',0,0,83,168,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',9,6),(893,'c79e3c8c5b3717ec2a3519898e2d504f',0,0,83,168,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',9,7),(894,'fe5b34413c83797b502b250bf074380d',0,0,83,168,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',9,8),(895,'29b83529180992f04330c2440733ae4a',0,0,83,162,264,'FF',4,0.00,NULL,NULL,0,0,NULL,1,NULL,'Total Disk Transfers/Sec:','','',9,9),(896,'2d7c815962c61e25e59e9c00d8411313',0,0,83,162,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',9,10),(897,'0bab2f0ce1fc646860dd2dbbd7982d9a',0,0,83,162,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',9,11),(898,'83121c9a6e10bceb96c6abee6cfc2edc',0,0,83,162,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',9,12),(899,'c01fa9212c2e27dfa64ab945b6e4a4c8',0,0,83,165,80,'FF',7,0.00,NULL,NULL,52,0,NULL,1,NULL,'Avg. Disk Read Queue Length:','','',9,13),(900,'b7b8f5f359c2b76d8283198734ed2875',0,0,83,165,0,'FF',9,0.00,NULL,NULL,52,0,NULL,4,NULL,'Current:','','',9,14),(901,'b594b33e74890d881ca7a469ce35621d',0,0,83,165,0,'FF',9,0.00,NULL,NULL,52,0,NULL,1,NULL,'Average:','','',9,15),(902,'6d6b2e8eea81f31f9997c4518f0ce46d',0,0,83,165,0,'FF',9,0.00,NULL,NULL,52,0,NULL,3,NULL,'Maximum:','','on',9,16),(903,'57e4b661698ecc9725b6399d2d8ed765',0,0,83,167,1,'FF',8,0.00,NULL,NULL,52,0,NULL,1,NULL,'Avg. Disk Write Queue Length:','','',9,17),(904,'1f2d3d8cc625a45e9f108edcd4217524',0,0,83,167,0,'FF',9,0.00,NULL,NULL,52,0,NULL,4,NULL,'Current:','','',9,18),(905,'71748f98170570e959f657a2fa6b6110',0,0,83,167,0,'FF',9,0.00,NULL,NULL,52,0,NULL,1,NULL,'Average:','','',9,19),(906,'b06d1c08ca31cfbc7ac5be6a004dfe8a',0,0,83,167,0,'FF',9,0.00,NULL,NULL,52,0,NULL,3,NULL,'Maximum:','','on',9,20),(907,'d11b345c5a37a398161dd58f61ca70ad',0,0,83,163,43,'FF',4,0.00,NULL,NULL,52,0,NULL,1,NULL,'Avg. Disk Queue Length:','','',9,21),(908,'3210f38038972367c5cafc48fd84199b',0,0,83,163,0,'FF',9,0.00,NULL,NULL,52,0,NULL,4,NULL,'Current:','','',9,22),(909,'76135bf867455bf6a24d95307e81f350',0,0,83,163,0,'FF',9,0.00,NULL,NULL,52,0,NULL,1,NULL,'Average:','','',9,23),(910,'3837d8bc30214241edb598180edde1b8',0,0,83,163,0,'FF',9,0.00,NULL,NULL,52,0,NULL,3,NULL,'Maximum:','','on',9,24),(911,'cd5e387c568d4ba52fd803e0f31c859b',0,0,83,164,68,'FF',7,0.00,NULL,NULL,0,0,NULL,1,NULL,'Current Disk Queue Length:','','',3,25),(912,'a5fad1fec35ca418e7eaff880c639868',0,0,83,164,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',3,26),(913,'1075fe491cdcc288d389b8f4365e2921',0,0,83,164,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',3,27),(914,'97225cf4b598059bf738c4b84ca6ea61',0,0,83,164,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',3,28),(915,'cd3109eeaf9f72cd24f9ed291caac309',0,0,83,0,0,'FF',1,0.00,NULL,NULL,53,0,NULL,1,NULL,'Avg. Seconds/Read:','','',9,29),(916,'d1113dace16c0a74ace3690e9fbb884c',0,0,83,166,0,'FF',9,0.00,NULL,NULL,53,0,NULL,4,NULL,'Current:','','',9,30),(917,'7bf261fdb48ecd15917284c25afc0de1',0,0,83,166,0,'FF',9,0.00,NULL,NULL,53,0,NULL,1,NULL,'Average:','','',9,31),(918,'5f312a1d2137944bef826eb8d82a62fb',0,0,83,166,0,'FF',9,0.00,NULL,NULL,53,0,NULL,3,NULL,'Maximum:','','on',9,32),(919,'6ddaa9e6028c93b48b6006802f26fd7c',0,0,83,0,0,'FF',1,0.00,NULL,NULL,53,0,NULL,1,NULL,'Avg. Seconds/Write:','','',9,33),(920,'009e17dfdf1156ec45e2a8ccd95767a2',0,0,83,172,0,'FF',9,0.00,NULL,NULL,53,0,NULL,4,NULL,'Current:','','',9,34),(921,'1062ddaf2d498b1096d1534ab21924a5',0,0,83,172,0,'FF',9,0.00,NULL,NULL,53,0,NULL,1,NULL,'Average:','','',9,35),(922,'4e553fc5129f917b046f75a9eb5f66ed',0,0,83,172,0,'FF',9,0.00,NULL,NULL,53,0,NULL,3,NULL,'Maximum:','','on',9,36),(923,'848c081e1c3d92b0052ddb9835c2a8e5',0,0,83,0,0,'FF',1,0.00,NULL,NULL,53,0,NULL,1,NULL,'Avg. Seconds/Transfer:','','',9,37),(924,'073c73c81c7a0d7e6c5c090e76254905',0,0,83,171,0,'FF',9,0.00,NULL,NULL,53,0,NULL,4,NULL,'Current:','','',9,38),(925,'1769b0d69d44bd4d22cc534310b28b38',0,0,83,171,0,'FF',9,0.00,NULL,NULL,53,0,NULL,1,NULL,'Average:','','',9,39),(926,'3b72dfbc6359a426eb5414ed937477e1',0,0,83,171,0,'FF',9,0.00,NULL,NULL,53,0,NULL,3,NULL,'Maximum:','','on',9,40),(927,'d8c9b7b556b47ab2089b1ff9f0846b6d',0,0,83,0,0,'FF',1,0.00,NULL,NULL,0,0,NULL,1,NULL,'Free Space:','','',2,41),(928,'bfdc3fcbdaa5076c407b94e5aec5a8d4',0,0,83,169,0,'FF',9,0.00,NULL,NULL,52,0,NULL,4,NULL,'Current:','','',10,42),(929,'bb22d8a174180535e9486576a10cee50',0,0,83,169,0,'FF',9,0.00,NULL,NULL,52,0,NULL,1,NULL,'Average:','','',10,43),(930,'cca3bea8c394ac63e4f8b8d039718879',0,0,83,169,0,'FF',9,0.00,NULL,NULL,52,0,NULL,3,NULL,'Maximum:','','on',10,44),(931,'f69732d185a7a730f7343a51cd508cd1',0,0,83,0,0,'FF',1,0.00,NULL,NULL,0,0,NULL,1,NULL,'Split IO\'s/Sec','','',2,45),(932,'6d256a10e960c41709d1b5da1189f578',0,0,83,170,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',3,46),(933,'dde108c80aa1b0df96b538dff1216cb6',0,0,83,170,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',3,47),(934,'5584c0e9fa104a402c74fbb08a0e51a4',0,0,83,170,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',3,48),(935,'917e9a390542abe48badb78add9d2788',0,0,84,175,21,'FF',7,0.00,NULL,NULL,54,0,NULL,1,NULL,'Available Bytes:','','',2,1),(936,'f832dc23e6de2d6d005e70719e6ce6b5',0,0,84,175,0,'FF',9,0.00,NULL,NULL,54,0,NULL,4,NULL,'Current:','','',2,2),(937,'099b9d644dde99d503a980c0aee0b8e6',0,0,84,175,0,'FF',9,0.00,NULL,NULL,54,0,NULL,1,NULL,'Average:','','',2,3),(938,'92311768935c7ec7e5ff00a9dfeaf591',0,0,84,175,0,'FF',9,0.00,NULL,NULL,54,0,NULL,3,NULL,'Maximum:','','on',2,4),(939,'78967bbbbe086b431eda5e8456ca9a2b',0,0,84,173,12,'FF',8,0.00,NULL,NULL,0,0,NULL,1,NULL,'Committed Bytes:','','',2,5),(940,'1a280da024bd6dd255a4028a8a090bbe',0,0,84,173,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',2,6),(941,'0e1c6611419bf95c1e55a35913d48d0e',0,0,84,173,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',2,7),(942,'5d9345dec89b994e2c14cbe4a0133ce0',0,0,84,173,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',2,8),(943,'0af598aeb7118eb926887d515c2e45a7',0,0,84,174,9,'FF',8,0.00,NULL,NULL,0,0,NULL,1,NULL,'Pool Nonpaged Bytes:','','',2,9),(944,'98ee979c9d3a1e047463514fd7d72cb7',0,0,84,174,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',2,10),(945,'6364c248eb995cb0a99351c5c1f9b7f7',0,0,84,174,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',2,11),(946,'270333f987122a6c2086b587f8157f38',0,0,84,174,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',2,12),(947,'d5bd01fb94c156dde32df2261f11a727',0,0,84,177,264,'FF',8,0.00,NULL,NULL,0,0,NULL,1,NULL,'Pool Paged Resident Bytes:','','',2,13),(948,'d356f4ad39f5013ab850e34ed897d490',0,0,84,177,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',2,14),(949,'12a96abb39cb3c2f9b7f1ee4b2d79e4e',0,0,84,177,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',2,15),(950,'1111cb65cb66ff5fdb5fa96808e543f4',0,0,84,177,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',2,16),(951,'cbd7b7ebf47443b9a79989ae7cb9dfdc',0,0,84,180,86,'FF',8,0.00,NULL,NULL,0,0,NULL,1,NULL,'System Cache Resident Bytes:','','',2,17),(952,'e540d01bf7fa33a1adfc63089118ad09',0,0,84,180,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',2,18),(953,'211b7e38b396bf7509da3d8c97a3ae6d',0,0,84,180,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',2,19),(954,'806c8f346e53f509e29cc3f30f7a1c00',0,0,84,180,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',2,20),(955,'301d00faf95e9d74267789595093b912',0,0,84,178,444,'FF',8,0.00,NULL,NULL,0,0,NULL,1,NULL,'System Code Resident Bytes:','','',2,21),(956,'42f66a693c9f0ef9a042b36787644023',0,0,84,178,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',2,22),(957,'62e8659550231eda6fe2d0c685381072',0,0,84,178,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',2,23),(958,'1aa53eba4ed0528919c33213cfb9c411',0,0,84,178,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',2,24),(959,'39c8cec5976dfd6357acacfd1a90a58e',0,0,84,182,51,'FF',8,0.00,NULL,NULL,0,0,NULL,1,NULL,'System Drivers Resident Bytes:','','',2,25),(960,'e7b31b8b7bb0a92c88a61a5a72af56aa',0,0,84,182,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',2,26),(961,'d0e64c8dea7797fb274946a34a4a6f29',0,0,84,182,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',2,27),(962,'16b48f1ec0d39fa38c1989b1916a73f2',0,0,84,182,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',2,28),(963,'ef37f17aa44d9b68382ccb90f9d7117b',0,0,84,183,0,'FF',1,0.00,NULL,NULL,0,0,NULL,1,NULL,'System Drivers Total Bytes:','','',2,29),(964,'6636bdaf6543ad47fd674c6dd38d8819',0,0,84,183,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',2,30),(965,'0db7267a7032ad0576eed95984a4483c',0,0,84,183,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',2,31),(966,'4096cb02034ab591eae0e6ac757a766d',0,0,84,183,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',2,32),(967,'8b3fa60e648a370179dca88f385219b6',0,0,84,179,0,'FF',1,0.00,NULL,NULL,0,0,NULL,1,NULL,'System Code Total Bytes:','','',2,33),(968,'4a990731efad6faa9091721d67ecd16a',0,0,84,179,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',2,34),(969,'06dab3919d36e77fa7d8a6e1454d5a1d',0,0,84,179,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',2,35),(970,'62c78a2baceba06d05b2415974f85905',0,0,84,179,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',2,36),(971,'76cc846c039ca0f387813b4eab8abdb9',0,0,84,181,0,'FF',1,0.00,NULL,NULL,0,0,NULL,1,NULL,'Cache Bytes Peak:','','',2,37),(972,'26400dec32f6c1af690a17e896c08f9e',0,0,84,181,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',2,38),(973,'9e1c16d6b9185ee62d61d6d1f9e2a73c',0,0,84,181,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',2,39),(974,'084e260465472f02779e7466a38d1487',0,0,84,181,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',2,40),(975,'4166cbded58312e50d7732d2152396e6',0,0,84,176,0,'FF',1,0.00,NULL,NULL,0,0,NULL,1,NULL,'Pool Paged Bytes:','','',2,41),(976,'1813a2c15e0349f24cff4bc751bc863c',0,0,84,176,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',2,42),(977,'61e13a2a533c31a9f0de402cc9c7feb4',0,0,84,176,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',2,43),(978,'4404dd92bfa5b0d87ffcad06783be8a6',0,0,84,176,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',2,44),(979,'357f3c83b7bfa67e92fbb807523faf36',0,0,85,185,12,'FF',7,0.00,NULL,NULL,0,0,NULL,1,NULL,'Pages Input/Sec:','','',9,1),(980,'25ec96592612662571391079af063c28',0,0,85,185,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',9,2),(981,'14416071889217ded989c5cc28078b03',0,0,85,185,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',9,3),(982,'64a8a9ce3d6958f110f37c8eb4b208f5',0,0,85,185,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',9,4),(983,'65095030a09e030334114fce60deadfa',0,0,85,184,21,'FF',8,0.00,NULL,NULL,0,0,NULL,1,NULL,'Pages Output/Sec:','','',9,5),(984,'b32f585dbdc513f71b58ee3393a774f6',0,0,85,184,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',9,6),(985,'5db74a5d5da154f4e6329a08805a2f9d',0,0,85,184,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',9,7),(986,'e40398c3d59f0ba93d1f97f0e57a15af',0,0,85,184,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',9,8),(987,'d2c3686e31219be3837ba85e838ae378',0,0,85,187,264,'FF',4,0.00,NULL,NULL,0,0,NULL,1,NULL,'Pages/Sec (Hard Page Faults):','','',9,9),(988,'034663e46244126930626c18feadcca9',0,0,85,187,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',9,10),(989,'e46929429e4ba4813a1d2a837485cde7',0,0,85,187,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',9,11),(990,'e1335429da40b4cfceffa76d05b5df90',0,0,85,187,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',9,12),(991,'e40303b4d2265236daecb1a6a968b180',0,0,85,0,0,'FF',1,0.00,NULL,NULL,0,0,NULL,1,NULL,'Page Faults/Sec (Hard/Soft):','','',9,13),(992,'0c2a54ddad0ba0aa91decf321814e9ba',0,0,85,186,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',9,14),(993,'d918720235cc450be791097306a178ab',0,0,85,186,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',9,15),(994,'8743bec276f8fa15272ad0eb23a3eacb',0,0,85,186,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',9,16),(995,'3a3c8e45d2e34cc5b0978c0b41cb589f',0,0,85,0,61,'FF',2,0.00,NULL,NULL,0,0,NULL,1,NULL,'Pages/Sec Threshold:','20','',2,17),(996,'dc87903ea7158f412cf1781166583648',0,0,86,189,21,'FF',7,0.00,NULL,NULL,0,0,NULL,1,NULL,'Bytes Sent/Sec:','','',2,1),(997,'f70c30c5ce81f4354ee2413741c96c59',0,0,86,189,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',2,2),(998,'a13bf062d7d70ca8544f26334442e2fa',0,0,86,189,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',2,3),(999,'ea1d66bf1dcc6106c4f7ccc97eb7a8ed',0,0,86,189,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',2,4),(1000,'1d7e8dbef607e181eb2bf2748a511da4',0,0,86,188,12,'FF',8,0.00,NULL,NULL,0,0,NULL,1,NULL,'Bytes Received/Sec:','','',2,5),(1001,'407982a1b2fb5324f990bbfc678eac78',0,0,86,188,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',2,6),(1002,'7232f674c2ec68759364d9dd530fc409',0,0,86,188,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',2,7),(1003,'213aa820b1d224cc9f6fcbfdb855dec6',0,0,86,188,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',2,8),(1004,'541a334a177e4b5195d541885661361d',0,0,86,190,53,'FF',4,0.00,NULL,NULL,0,0,NULL,1,NULL,'Bytes Total/Sec:','','',2,9),(1005,'42448ba523bce881a460a452426426d8',0,0,86,190,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',2,10),(1006,'b4403de89dad7a66465dc4259a0f21c1',0,0,86,190,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',2,11),(1007,'308046c399f8d5abba7fa10bce360165',0,0,86,190,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',2,12),(1008,'4a1a817d4924da6444d004025e370cef',0,0,86,192,81,'FF',4,0.00,NULL,NULL,0,0,NULL,1,NULL,'Output Queue Length:','','',3,25),(1009,'f270bbf388989d240398fb09c808cf69',0,0,86,192,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',3,26),(1010,'e31d3bc6f871fbd1b894769718411e02',0,0,86,192,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',3,27),(1011,'70d2d36f8514889929d824509fc9957e',0,0,86,192,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',3,28),(1012,'d74ddbc5f09a2419e6e59c14ade6b2df',0,0,86,0,0,'FF',1,0.00,NULL,NULL,0,0,NULL,1,NULL,'Current Bandwidth:','','',2,29),(1013,'7c32af7bf310e06e43dd099a07b5e024',0,0,86,191,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',2,30),(1014,'250a744744e5c78436a724f6a0221565',0,0,86,191,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',2,31),(1015,'dc10543d93abe27bb834fac7f9199c3c',0,0,86,191,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',2,32),(1016,'0fdb5028b84b6f190ca45c6e63060fc6',0,0,86,189,0,'FF',1,0.00,NULL,NULL,0,0,NULL,1,NULL,'Total Sent: (|sum:auto:current:2:auto|)','','',2,33),(1017,'e4db2f1d7e9bbb6e80146e6976d1272f',0,0,86,188,0,'FF',1,0.00,NULL,NULL,0,0,NULL,1,NULL,'Total Received:  (|sum:auto:current:2:auto|)','','on',2,34),(1018,'d731c78be938b5e4a74d1e6b21e97162',0,0,86,189,9,'FF',2,0.00,NULL,NULL,0,0,NULL,1,NULL,'95th Percentile Sent:','|95:bits:0:max:2|','on',2,35),(1019,'ad93b198c828aa3dcab3247690e92908',0,0,86,189,0,'FF',1,0.00,NULL,NULL,0,0,NULL,1,NULL,'95th Percentile (|95:bits:6:max:2| mbit in+out)','','on',2,36),(1020,'bf851b72e2026ad2f4335a6318c78120',0,0,86,189,0,'FF',1,0.00,NULL,NULL,0,0,NULL,1,NULL,'|date_time|','','',2,37),(1021,'af5b18046cd70e8ffa0618c7cc194bea',0,0,87,199,21,'FF',7,0.00,NULL,NULL,0,0,NULL,1,NULL,'Packets Sent/Sec:','','',9,1),(1022,'8069ee452654f7327a78944b32e3d74a',0,0,87,199,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',9,2),(1023,'5d69a8a3cd733e85937d5c0da021263d',0,0,87,199,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',9,3),(1024,'b924184d368a4f094d3ce51d89fcc3ed',0,0,87,199,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',9,4),(1025,'729c8670858e677668fbafa2b40c5ef9',0,0,87,198,12,'FF',8,0.00,NULL,NULL,0,0,NULL,1,NULL,'Packets Received/Sec:','','',9,5),(1026,'a756a04034c2a484e6fb9e4e8703d08f',0,0,87,198,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',9,6),(1027,'666a9960a9112c308461c09673e6ba29',0,0,87,198,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',9,7),(1028,'c0355f5c3cae2f992d0e67507e17c97d',0,0,87,198,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',9,8),(1029,'2b7615bded40c9d36be4208cab5a9c4d',0,0,87,200,53,'FF',4,0.00,NULL,NULL,0,0,NULL,1,NULL,'Total Network Packets/Sec:','','',9,9),(1030,'2a49ba833dd01550cd2d9be532e4baa0',0,0,87,200,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',9,10),(1031,'38d1011b8ad2ce9e074163f3e39fff50',0,0,87,200,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',9,11),(1032,'015edabee7ca620bce2adc431561c9ae',0,0,87,200,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',9,12),(1033,'5c4a330524ecaaa4d37a5ef42b226b37',0,0,87,195,81,'FF',4,0.00,NULL,NULL,0,0,NULL,1,NULL,'Packets Outbound Errors:','','',9,13),(1034,'da750c2086f345b9034bed1d0b0a41d9',0,0,87,195,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',9,14),(1035,'804172530032acfd99ec8e5bb594c486',0,0,87,195,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',9,15),(1036,'5366379e4e6b564c66f475ff6495b2c8',0,0,87,195,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',9,16),(1037,'67c04f02c970e33eda836fb35f09b27f',0,0,87,193,43,'FF',4,0.00,NULL,NULL,0,0,NULL,1,NULL,'Packets Received Errors:','','',9,17),(1038,'f0a034cef3f1aa6baaa97cebedbbe1af',0,0,87,193,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',9,18),(1039,'59ef8677de2a69b8f09c73893677b862',0,0,87,193,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',9,19),(1040,'e0cfab23e85a9b50bf779fd0eea89e21',0,0,87,193,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',9,20),(1041,'0f4a4e9466a8efd3b34b921950052233',0,0,87,194,1,'FF',4,0.00,NULL,NULL,0,0,NULL,1,NULL,'Packets Outbound Discarded:','','',9,21),(1042,'bb05aae4d5d2bf71a1cfa9c1e9d226e4',0,0,87,194,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',3,22),(1043,'2f89a2c67502c19ca5becc43815e6a84',0,0,87,194,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',9,23),(1044,'c0f7b2cda1c5022d357f571d9341c83b',0,0,87,194,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',9,24),(1045,'047a76bb3ad47da4fed3ac89f44f4d5b',0,0,87,196,68,'FF',4,0.00,NULL,NULL,0,0,NULL,1,NULL,'Packets Received Discarded:','','',9,25),(1046,'0cfb34fd9f35daeeeeeda6432524f574',0,0,87,196,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',9,26),(1047,'0e02610cc0f9ea074c09d96ce290a04f',0,0,87,196,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',9,27),(1048,'4b88fd8303fe9e841f30261e4d276ac3',0,0,87,196,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',9,28),(1049,'97c595bf02954c859f4d85786aa2d0d5',0,0,87,0,0,'FF',1,0.00,NULL,NULL,0,0,NULL,1,NULL,'Packets Received Unknown:','','',3,29),(1050,'815bdc883fc38e2ecc689b4a18ced75b',0,0,87,197,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',9,30),(1051,'7e71e048145a54fea99158787f9602e8',0,0,87,197,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',9,31),(1052,'1a14fa5da69da044fbe1842c29533c95',0,0,87,197,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',9,32),(1053,'4e1836ab4f39721344f15d72b38f652a',0,0,88,202,9,'FF',7,0.00,NULL,NULL,0,0,NULL,1,NULL,'Objects Threads:','','',3,1),(1054,'3cf5162a05e663f55dc6ca506843dadc',0,0,88,202,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',3,2),(1055,'f3fafa40e389221b2a1ba1de926362cc',0,0,88,202,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',3,3),(1056,'cbdfd4f1a92c5773061bf3c871d6e4fe',0,0,88,202,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',3,4),(1057,'d6f9adcbed50ec31aa8e1853256fa632',0,0,88,201,12,'FF',7,0.00,NULL,NULL,0,0,NULL,1,NULL,'Objects Processes:','','',3,5),(1058,'4ca6e84c4abe48e858208776cee5d877',0,0,88,201,0,'FF',9,0.00,NULL,NULL,0,0,NULL,4,NULL,'Current:','','',3,6),(1059,'6c3b4742edede389f0e236d0f3a73a18',0,0,88,201,0,'FF',9,0.00,NULL,NULL,0,0,NULL,1,NULL,'Average:','','',3,7),(1060,'d16d86a57f414677410f22bf4bc0d583',0,0,88,201,0,'FF',9,0.00,NULL,NULL,0,0,NULL,3,NULL,'Maximum:','','on',3,8),(1061,'',743,5,79,204,0,'FF',4,0.00,NULL,0,0,0,NULL,1,NULL,'','','',2,1),(1062,'',744,5,79,205,0,'FF',4,0.00,NULL,0,0,0,NULL,1,NULL,'','','',2,2),(1063,'',745,5,79,206,0,'FF',4,0.00,NULL,0,0,0,NULL,1,NULL,'','','',2,3),(1064,'',746,5,79,203,0,'FF',4,0.00,NULL,0,0,0,NULL,1,NULL,'','','',2,4),(1065,'',747,5,79,207,0,'FF',4,0.00,NULL,0,0,0,NULL,1,NULL,'','','',2,5),(1066,'',748,5,79,205,0,'FF',1,0.00,NULL,0,0,0,NULL,1,NULL,'  Packet Loss  ','','',2,8),(1067,'',749,5,79,0,12,'7F',7,0.00,NULL,0,50,0,NULL,1,NULL,'0%','','',2,9),(1068,'',750,5,79,0,80,'7F',7,0.00,NULL,0,38,0,NULL,1,NULL,'1-2%','','',2,10),(1069,'',751,5,79,0,81,'7F',7,0.00,NULL,0,40,0,NULL,1,NULL,'3-5%','','',2,11),(1070,'',752,5,79,0,74,'7F',7,0.00,NULL,0,26,0,NULL,1,NULL,'6-10%','','',2,12),(1071,'',753,5,79,0,67,'7F',7,0.00,NULL,0,27,0,NULL,1,NULL,'11-15%','','',2,13),(1072,'',754,5,79,0,56,'7F',7,0.00,NULL,0,28,0,NULL,1,NULL,'16-50%','','',2,14),(1073,'',755,5,79,0,11,'7F',7,0.00,NULL,0,25,0,NULL,1,NULL,'51-95%','','',2,15),(1074,'',756,5,79,0,48,'7F',7,0.00,NULL,0,29,0,NULL,1,NULL,'96-100%','','',2,16),(1075,'',757,5,79,0,1,'33',7,0.00,NULL,0,42,0,NULL,1,NULL,'DEAD / NaN','','on',2,17),(1076,'',758,5,79,205,2,'FF',7,0.00,NULL,0,0,0,NULL,1,NULL,'','','',2,18),(1077,'',759,5,79,0,441,'FF',8,0.00,NULL,0,30,0,NULL,1,NULL,'','','',2,19),(1078,'',760,5,79,0,442,'FF',8,0.00,NULL,0,30,0,NULL,1,NULL,'','','',2,20),(1079,'',761,5,79,0,443,'FF',8,0.00,NULL,0,31,0,NULL,1,NULL,'','','',2,21),(1080,'',762,5,79,0,444,'FF',8,0.00,NULL,0,31,0,NULL,1,NULL,'','','',2,22),(1081,'',763,5,79,0,445,'FF',8,0.00,NULL,0,31,0,NULL,1,NULL,'','','',2,23),(1082,'',764,5,79,204,2,'FF',7,0.00,NULL,0,0,0,NULL,1,NULL,'','','',2,24),(1083,'',765,5,79,0,445,'FF',8,0.00,NULL,0,41,0,NULL,1,NULL,'','','',2,25),(1084,'',766,5,79,0,444,'FF',8,0.00,NULL,0,41,0,NULL,1,NULL,'','','',2,26),(1085,'',767,5,79,0,443,'FF',8,0.00,NULL,0,41,0,NULL,1,NULL,'','','',2,27),(1086,'',768,5,79,0,442,'FF',8,0.00,NULL,0,41,0,NULL,1,NULL,'','','',2,28),(1087,'',769,5,79,0,441,'FF',8,0.00,NULL,0,41,0,NULL,1,NULL,'','','',2,29),(1088,'',770,5,79,0,0,'FF',1,0.00,NULL,0,0,0,NULL,1,NULL,'  Packet Loss  ','','',2,30),(1089,'',771,5,79,203,0,'FF',9,0.00,NULL,0,0,0,NULL,4,NULL,'Current:','','',6,31),(1090,'',772,5,79,203,0,'FF',9,0.00,NULL,0,0,0,NULL,1,NULL,' Avg:','','',6,32),(1091,'',773,5,79,203,0,'FF',9,0.00,NULL,0,0,0,NULL,2,NULL,' Min:','','',6,33),(1092,'',774,5,79,203,0,'FF',9,0.00,NULL,0,0,0,NULL,3,NULL,' Max:','','on',6,34),(1093,'',775,5,79,0,0,'FF',1,0.00,NULL,0,0,0,NULL,1,NULL,'','','on',2,36),(1094,'',776,5,79,0,80,'7F',7,0.00,NULL,0,37,0,NULL,1,NULL,'','','',2,37),(1095,'',777,5,79,0,81,'7F',7,0.00,NULL,0,39,0,NULL,1,NULL,'','','',2,38),(1096,'',778,5,79,0,74,'7F',7,0.00,NULL,0,33,0,NULL,1,NULL,'','','',2,39),(1097,'',779,5,79,0,67,'7F',7,0.00,NULL,0,32,0,NULL,1,NULL,'','','',2,40),(1098,'',780,5,79,0,56,'7F',7,0.00,NULL,0,34,0,NULL,1,NULL,'','','',2,41),(1099,'',781,5,79,0,11,'7F',7,0.00,NULL,0,35,0,NULL,1,NULL,'','','',2,42),(1100,'',782,5,79,0,48,'7F',7,0.00,NULL,0,36,0,NULL,1,NULL,'','','',2,43),(1101,'',783,5,79,204,445,'00',4,0.00,NULL,0,0,0,NULL,1,NULL,'Min Latency  ','','',7,44),(1102,'',784,5,79,204,0,'FF',9,0.00,NULL,0,0,0,NULL,4,NULL,'Current:','','',7,45),(1103,'',785,5,79,204,0,'FF',9,0.00,NULL,0,0,0,NULL,1,NULL,'Avg:','','',7,46),(1104,'',786,5,79,204,0,'FF',9,0.00,NULL,0,0,0,NULL,2,NULL,'Min:','','',7,47),(1105,'',787,5,79,204,0,'FF',9,0.00,NULL,0,0,0,NULL,3,NULL,'Max:','','on',7,48),(1106,'',788,5,79,205,1,'FF',4,0.00,NULL,0,0,0,NULL,1,NULL,'Avg Latency  ','','',7,49),(1107,'',789,5,79,205,0,'FF',9,0.00,NULL,0,0,0,NULL,4,NULL,'Current:','','',7,50),(1108,'',790,5,79,205,0,'FF',9,0.00,NULL,0,0,0,NULL,1,NULL,'Avg:','','',7,51),(1109,'',791,5,79,205,0,'FF',9,0.00,NULL,0,0,0,NULL,2,NULL,'Min:','','',7,52),(1110,'',792,5,79,205,0,'FF',9,0.00,NULL,0,0,0,NULL,3,NULL,'Max:','','on',7,53),(1111,'',793,5,79,206,445,'00',4,0.00,NULL,0,0,0,NULL,1,NULL,'Max Latency  ','','',7,54),(1112,'',794,5,79,206,0,'FF',9,0.00,NULL,0,0,0,NULL,4,NULL,'Current:','','',7,55),(1113,'',795,5,79,206,0,'FF',9,0.00,NULL,0,0,0,NULL,1,NULL,'Avg:','','',7,56),(1114,'',796,5,79,206,0,'FF',9,0.00,NULL,0,0,0,NULL,2,NULL,'Min:','','',7,57),(1115,'',797,5,79,206,0,'FF',9,0.00,NULL,0,0,0,NULL,3,NULL,'Max:','','on',7,58),(1116,'',798,5,79,0,0,'FF',1,0.00,NULL,0,0,0,NULL,1,NULL,'  Deviation    ','','',2,60),(1117,'',799,5,79,207,0,'FF',9,0.00,NULL,0,0,0,NULL,4,NULL,'Current:','','',7,61),(1118,'',800,5,79,207,0,'FF',9,0.00,NULL,0,0,0,NULL,1,NULL,'Avg:','','',7,62),(1119,'',801,5,79,207,0,'FF',9,0.00,NULL,0,0,0,NULL,2,NULL,'Min:','','',7,63),(1120,'',802,5,79,207,0,'FF',9,0.00,NULL,0,0,0,NULL,3,NULL,'Max:','','on',7,64),(1121,'',803,5,79,205,1,'FF',4,0.00,NULL,0,0,0,NULL,1,NULL,'','','',2,65),(1122,'',804,5,79,205,12,'FF',5,0.00,NULL,0,50,0,NULL,1,NULL,'','','',2,66),(1123,'',805,5,79,205,80,'FF',5,0.00,NULL,0,44,0,NULL,1,NULL,'','','',2,67),(1124,'',806,5,79,205,81,'FF',5,0.00,NULL,0,43,0,NULL,1,NULL,'','','',2,68),(1125,'',807,5,79,205,74,'FF',5,0.00,NULL,0,45,0,NULL,1,NULL,'','','',2,69),(1126,'',808,5,79,205,67,'FF',5,0.00,NULL,0,46,0,NULL,1,NULL,'','','',2,70),(1127,'',809,5,79,205,56,'FF',5,0.00,NULL,0,47,0,NULL,1,NULL,'','','',2,71),(1128,'',810,5,79,205,11,'FF',5,0.00,NULL,0,48,0,NULL,1,NULL,'','','',2,72),(1129,'',811,5,79,205,48,'FF',5,0.00,NULL,0,49,0,NULL,1,NULL,'','','',2,73),(1130,'',812,5,79,0,0,'FF',1,0.00,NULL,0,0,0,NULL,1,NULL,'','','on',2,75),(1131,'',813,5,79,0,0,'FF',1,0.00,NULL,0,0,0,NULL,1,NULL,'  Probe        ','','',2,76),(1132,'',814,5,79,0,0,'FF',1,0.00,NULL,0,0,0,NULL,1,NULL,'|input_attempts| |input_protocol| packets every 300 seconds to |host_hostname|','','on',2,77),(1133,'',456,6,52,209,48,'7F',7,0.00,'',0,14,0,'',1,'','Used','','',2,1),(1134,'',457,6,52,209,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,2),(1135,'',458,6,52,209,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,3),(1136,'',459,6,52,209,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,4),(1137,'',460,6,52,208,20,'7F',8,0.00,'',0,14,0,'',1,'','Available','','',2,5),(1138,'',461,6,52,208,0,'FF',9,0.00,'',0,14,0,'',4,'','Current:','','',2,6),(1139,'',462,6,52,208,0,'FF',9,0.00,'',0,14,0,'',1,'','Average:','','',2,7),(1140,'',463,6,52,208,0,'FF',9,0.00,'',0,14,0,'',3,'','Maximum:','','on',2,8),(1141,'',464,6,52,0,1,'FF',5,0.00,'',0,15,0,'',1,'','Total','','',2,9),(1142,'',465,6,52,0,0,'FF',9,0.00,'',0,15,0,'',4,'','Current:','','',2,10),(1143,'',466,6,52,0,0,'FF',9,0.00,'',0,15,0,'',1,'','Average:','','',2,11),(1144,'',467,6,52,0,0,'FF',9,0.00,'',0,15,0,'',3,'','Maximum:','','on',2,12),(1145,'',468,6,52,209,48,'FF',4,1.00,'',0,0,0,'',3,'','','','',2,13),(1146,'',469,6,52,208,20,'FF',20,1.00,'',0,0,0,'',3,'','','','',2,14),(1219,'',1,8,1,213,9,'7F',7,0.00,'',0,0,0,'',3,'','Hosts','','',2,9),(1220,'',2,8,1,213,0,'FF',9,0.00,'',0,0,0,'',2,'','Minimum:','','',2,10),(1221,'',3,8,1,213,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,11),(1222,'',4,8,1,213,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,12),(1223,'',5,8,1,213,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,13),(1224,'',6,8,1,212,21,'FF',4,0.00,'',0,0,0,'',3,'','Hosts per Process','','',2,14),(1225,'',7,8,1,212,0,'FF',9,0.00,'',0,0,0,'',2,'','Minimum:','','',2,15),(1226,'',8,8,1,212,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,16),(1227,'',9,8,1,212,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,17),(1228,'',10,8,1,212,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,18),(1229,'',11,9,2,218,21,'7F',7,0.00,'',0,0,0,'',1,'','DataSources','','',2,1),(1230,'',12,9,2,218,0,'FF',9,0.00,'',0,0,0,'',2,'','Minimum:','','',2,2),(1231,'',13,9,2,218,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,3),(1232,'',14,9,2,218,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,4),(1233,'',15,9,2,218,0,'FF',9,0.00,'',0,0,0,'',3,'','Max:','','on',2,5),(1234,'',16,9,2,218,21,'FF',4,0.00,'',0,0,0,'',3,'','Peak','','on',2,6),(1235,'',17,9,2,217,22,'7F',7,0.00,'',0,0,0,'',1,'','RRDs','','',2,7),(1236,'',18,9,2,217,0,'FF',9,0.00,'',0,0,0,'',2,'','Minimum:','','',2,8),(1237,'',19,9,2,217,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,9),(1238,'',20,9,2,217,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,10),(1239,'',21,9,2,217,0,'FF',9,0.00,'',0,0,0,'',3,'','Max:','','on',2,11),(1240,'',22,9,2,217,22,'FF',4,0.00,'',0,0,0,'',3,'','Peak','','on',2,12),(1241,'',23,10,3,225,21,'7F',7,0.00,'',0,0,0,'',1,'','RRD Updates','','',2,5),(1242,'',24,10,3,225,0,'FF',9,0.00,'',0,0,0,'',2,'','Minimum:','','',2,6),(1243,'',25,10,3,225,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,7),(1244,'',26,10,3,225,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,8),(1245,'',27,10,3,225,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,9),(1246,'',28,10,3,225,21,'FF',4,0.00,'',0,0,0,'',3,'','Peak','','on',2,10),(1247,'',29,11,4,226,9,'FF',4,0.00,'',0,0,0,'',1,'','SNMP','','',2,1),(1248,'',30,11,4,226,0,'FF',9,0.00,'',0,0,0,'',2,'','Minimum:','','',2,2),(1249,'',31,11,4,226,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,3),(1250,'',32,11,4,226,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,4),(1251,'',33,11,4,226,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,5),(1252,'',34,11,4,227,21,'FF',4,0.00,'',0,0,0,'',1,'','Scripts','','',2,6),(1253,'',35,11,4,227,0,'FF',9,0.00,'',0,0,0,'',2,'','Minimum:','','',2,7),(1254,'',36,11,4,227,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,8),(1255,'',37,11,4,227,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,9),(1256,'',38,11,4,227,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,10),(1257,'',39,11,4,228,12,'FF',4,0.00,'',0,0,0,'',1,'','Script Server','','',2,11),(1258,'',40,11,4,228,0,'FF',9,0.00,'',0,0,0,'',2,'','Minimum:','','',2,12),(1259,'',41,11,4,228,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,13),(1260,'',42,11,4,228,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,14),(1261,'',43,11,4,228,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,15),(1262,'',44,12,5,230,9,'FF',4,0.00,'',0,0,0,'',1,'','Time','','',2,1),(1263,'',45,12,5,230,0,'FF',9,0.00,'',0,0,0,'',2,'','Minimum:','','',2,2),(1264,'',46,12,5,230,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,3),(1265,'',47,12,5,230,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,4),(1266,'',48,12,5,230,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,5),(1267,'',49,12,5,229,21,'FF',4,0.00,'',0,0,0,'',1,'','Hosts','','',2,6),(1268,'',50,12,5,229,0,'FF',9,0.00,'',0,0,0,'',2,'','Minimum:','','',2,7),(1269,'',51,12,5,229,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,8),(1270,'',52,12,5,229,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,9),(1271,'',53,12,5,229,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,10),(1272,'',54,13,6,236,22,'FF',7,0.00,'',0,0,0,'',3,'','Processes','','',2,5),(1273,'',55,13,6,236,0,'FF',9,0.00,'',0,0,0,'',2,'','Minimum:','','',2,6),(1274,'',56,13,6,236,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,7),(1275,'',57,13,6,236,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,8),(1276,'',58,13,6,236,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,9),(1277,'',59,13,6,235,21,'FF',4,0.00,'',0,0,0,'',3,'','Threads','','',2,10),(1278,'',60,13,6,235,0,'FF',9,0.00,'',0,0,0,'',2,'','Minimum:','','',2,11),(1279,'',61,13,6,235,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,12),(1280,'',62,13,6,235,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,13),(1281,'',63,13,6,235,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,14),(1282,'',64,14,7,238,33,'99',7,0.00,'',0,0,0,'',1,'','Memory','','',2,1),(1283,'',65,14,7,238,0,'FF',9,0.00,'',0,0,0,'',2,'','Minimum:','','',2,2),(1284,'',66,14,7,238,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,3),(1285,'',67,14,7,238,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,4),(1286,'',68,14,7,238,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,5),(1287,'',69,14,7,238,9,'FF',4,0.00,'',0,0,0,'',3,'','Peak Usage','','on',2,6),(1288,'',70,15,8,245,9,'FF',7,0.00,'',0,0,0,'',1,'','invalid logins','','',2,1),(1289,'',71,15,8,245,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,2),(1290,'',72,15,8,245,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,3),(1291,'',73,15,8,245,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,4),(1292,'',74,15,8,241,12,'FF',8,0.00,'',0,0,0,'',1,'','valid logins','','',2,5),(1293,'',75,15,8,241,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,6),(1294,'',76,15,8,241,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,7),(1295,'',77,15,8,241,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,8),(1296,'',78,16,9,249,67,'FF',7,0.00,'',0,0,0,'',1,'','sleeping sessions','','',2,1),(1297,'',79,16,9,249,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,2),(1298,'',80,16,9,249,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,3),(1299,'',81,16,9,249,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,4),(1300,'',82,16,9,246,12,'FF',8,0.00,'',0,0,0,'',1,'','active sessions','','',2,5),(1301,'',83,16,9,246,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,6),(1302,'',84,16,9,246,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,7),(1303,'',85,16,9,246,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,8),(1304,'',86,16,9,247,1,'FF',4,0.00,'',0,0,0,'',1,'','obsolete sessions','','',2,9),(1305,'',87,16,9,247,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,10),(1306,'',88,16,9,247,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,11),(1307,'',89,16,9,247,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,12),(1308,'',90,16,9,247,0,'FF',1,1.00,'',0,0,0,'',1,'','','','on',2,13),(1309,'',91,16,9,247,0,'FF',1,1.00,'',0,0,0,'',1,'','Active is defined by activity in the last 10 minutes','','on',2,14),(1310,'',92,17,10,257,67,'FF',7,0.00,'',0,0,0,'',1,'','sleeping users','','',2,1),(1311,'',93,17,10,257,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,2),(1312,'',94,17,10,257,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,3),(1313,'',95,17,10,257,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,4),(1314,'',96,17,10,258,12,'FF',8,0.00,'',0,0,0,'',1,'','active users','','',2,5),(1315,'',97,17,10,258,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,6),(1316,'',98,17,10,258,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,7),(1317,'',99,17,10,258,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,8),(1318,'',100,18,11,260,9,'7F',7,0.00,'',0,0,0,'',1,'','Runtime','','',2,1),(1319,'',101,18,11,260,0,'FF',9,0.00,'',0,0,0,'',2,'','Minimum:','','',2,2),(1320,'',102,18,11,260,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,3),(1321,'',103,18,11,260,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,4),(1322,'',104,18,11,260,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,5),(1323,'',105,18,11,260,9,'FF',4,0.00,'',0,0,0,'',3,'','Peak','','on',2,6),(1324,'',106,19,12,268,11,'FF',4,0.00,'',0,0,0,'',1,'','Runtime','','',2,1),(1325,'',107,19,12,268,0,'FF',9,0.00,'',0,0,0,'',2,'','Minimum:','','',2,2),(1326,'',108,19,12,268,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,3),(1327,'',109,19,12,268,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,4),(1328,'',110,19,12,268,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,5),(1329,'',111,19,12,268,220,'FF',4,1.00,'',0,0,0,'',3,'','Peak','','on',2,6),(1330,'',112,20,13,269,33,'99',7,0.00,'',0,0,0,'',1,'','Graphs','','',2,1),(1331,'',113,20,13,269,0,'FF',9,0.00,'',0,0,0,'',2,'','Minimum:','','',2,2),(1332,'',114,20,13,269,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,3),(1333,'',115,20,13,269,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,4),(1334,'',116,20,13,269,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,5),(1335,'',117,20,13,269,9,'FF',4,0.00,'',0,0,0,'',3,'','Peak Usage','','on',2,6),(1336,'',118,21,14,270,9,'7F',7,0.00,'',0,0,0,'',1,'','Duration','','',2,1),(1337,'',119,21,14,270,0,'FF',9,0.00,'',0,0,0,'',2,'','Minimum:','','',2,2),(1338,'',120,21,14,270,0,'FF',9,0.00,'',0,0,0,'',4,'','Current:','','',2,3),(1339,'',121,21,14,270,0,'FF',9,0.00,'',0,0,0,'',1,'','Average:','','',2,4),(1340,'',122,21,14,270,0,'FF',9,0.00,'',0,0,0,'',3,'','Maximum:','','on',2,5),(1341,'',123,21,14,270,9,'FF',4,0.00,'',0,0,0,'',3,'','Peak','','on',2,6),(1342,'',124,22,15,273,349,'FF',4,1.00,'',0,0,0,'',3,'','Alarms','','',2,1),(1343,'',125,22,15,273,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',3,2),(1344,'',126,22,15,273,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',3,3),(1345,'',127,22,15,273,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',3,4),(1346,'',128,22,15,271,21,'FF',4,1.00,'',0,0,0,'',3,'','Incoming','','',2,5),(1347,'',129,22,15,271,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',3,6),(1348,'',130,22,15,271,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',3,7),(1349,'',131,22,15,271,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',3,8),(1350,'',132,22,15,274,348,'FF',4,1.00,'',0,0,0,'',3,'','Removals','','',2,9),(1351,'',133,22,15,274,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',3,10),(1352,'',134,22,15,274,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',3,11),(1353,'',135,22,15,274,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',3,12),(1354,'',136,22,15,275,73,'FF',4,1.00,'',0,0,0,'',3,'','Xfers','','',2,13),(1355,'',137,22,15,275,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',3,14),(1356,'',138,22,15,275,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',3,15),(1357,'',139,22,15,275,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',3,16),(1358,'',140,22,15,272,57,'FF',4,1.00,'',0,0,0,'',3,'','Deletes','','',2,17),(1359,'',141,22,15,272,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',3,18),(1360,'',142,22,15,272,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',3,19),(1361,'',143,22,15,272,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',3,20),(1362,'',144,23,16,276,147,'FF',7,1.00,'',0,0,0,'',1,'','Runtime','','',2,1),(1363,'',145,23,16,276,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',2,3),(1364,'',146,23,16,276,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',2,4),(1365,'',147,23,16,276,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',2,5),(1366,'',148,23,16,276,145,'FF',4,1.00,'',0,0,0,'',3,'','Peak','','on',2,6),(1367,'',149,24,17,277,357,'FF',4,1.00,'',0,0,0,'',1,'','Alerts','','',2,1),(1368,'',150,24,17,277,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',3,2),(1369,'',151,24,17,277,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',3,3),(1370,'',152,24,17,277,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',3,4),(1371,'',153,24,17,278,78,'FF',4,1.00,'',0,0,0,'',1,'','Reports','','',2,5),(1372,'',154,24,17,278,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',3,6),(1373,'',155,24,17,278,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',3,7),(1374,'',156,24,17,278,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',3,8),(1375,'',157,25,18,279,326,'FF',7,1.00,'',0,0,0,'',1,'','Runtime','','',2,1),(1376,'',158,25,18,279,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',2,2),(1377,'',159,25,18,279,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',2,3),(1378,'',160,25,18,279,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',2,4),(1379,'',161,25,18,279,357,'FF',4,1.00,'',0,0,0,'',3,'','Peak','','on',2,5),(1380,'',162,26,19,280,348,'FF',7,1.00,'',0,0,0,'',1,'','Row Size','','',2,1),(1381,'',163,26,19,280,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',2,2),(1382,'',164,26,19,280,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',2,3),(1383,'',165,26,19,280,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',2,4),(1384,'',166,26,19,280,334,'FF',4,1.00,'',0,0,0,'',3,'','Peak','','on',2,5),(1385,'',167,27,20,281,403,'FF',7,1.00,'',0,0,0,'',1,'','Records','','',2,1),(1386,'',168,27,20,281,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',3,2),(1387,'',169,27,20,281,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',3,3),(1388,'',170,27,20,281,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',3,4),(1389,'',171,27,20,281,359,'FF',4,1.00,'',0,0,0,'',3,'','Peak','','on',2,5),(1390,'',172,28,21,282,351,'FF',7,1.00,'',0,0,0,'',1,'','Table Size','','',2,1),(1391,'',173,28,21,282,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',2,2),(1392,'',174,28,21,282,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',2,3),(1393,'',175,28,21,282,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',2,4),(1394,'',176,28,21,282,52,'FF',4,1.00,'',0,0,0,'',3,'','Peak','','on',2,5),(1395,'',177,29,22,284,145,'FF',7,1.00,'',0,0,0,'',1,'','Fetch Records','','',2,1),(1396,'',178,29,22,284,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',2,2),(1397,'',179,29,22,284,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',2,3),(1398,'',180,29,22,284,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',2,4),(1399,'',181,29,22,286,411,'FF',8,1.00,'',0,0,0,'',1,'','Cycle Time','','',2,5),(1400,'',182,29,22,286,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',2,6),(1401,'',183,29,22,286,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',2,7),(1402,'',184,29,22,286,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',2,8),(1403,'',185,29,22,285,62,'FF',8,1.00,'',0,0,0,'',1,'','Last Update','','',2,9),(1404,'',186,29,22,285,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',2,10),(1405,'',187,29,22,285,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',2,11),(1406,'',188,29,22,285,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',2,12),(1407,'',189,29,22,287,287,'FF',8,1.00,'',0,0,0,'',1,'','Template','','',2,13),(1408,'',190,29,22,287,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',2,14),(1409,'',191,29,22,287,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',2,15),(1410,'',192,29,22,287,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',2,16),(1411,'',193,29,22,288,276,'FF',8,1.00,'',0,0,0,'',1,'','Update','','',2,17),(1412,'',194,29,22,288,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',2,18),(1413,'',195,29,22,288,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',2,19),(1414,'',196,29,22,288,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',2,20),(1415,'',197,29,22,283,357,'FF',8,1.00,'',0,0,0,'',1,'','Delete','','',2,21),(1416,'',198,29,22,283,0,'FF',9,1.00,'',0,0,0,'',4,'','Cur:','','',2,22),(1417,'',199,29,22,283,0,'FF',9,1.00,'',0,0,0,'',1,'','Avg:','','',2,23),(1418,'',200,29,22,283,0,'FF',9,1.00,'',0,0,0,'',3,'','Max:','','on',2,24),(1419,'',201,29,22,0,1,'FF',4,1.00,'',0,12,0,'',1,'','Total','','',2,25),(1420,'',202,29,22,0,0,'FF',9,1.00,'',0,12,0,'',4,'','Cur:','','',2,26),(1421,'',203,29,22,0,0,'FF',9,1.00,'',0,12,0,'',1,'','Avg:','','',2,27),(1422,'',204,29,22,0,0,'FF',9,1.00,'',0,12,0,'',3,'','Max:','','on',2,28);
/*!40000 ALTER TABLE `graph_templates_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_tree`
--

DROP TABLE IF EXISTS `graph_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graph_tree` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `enabled` char(2) COLLATE utf8mb4_unicode_ci DEFAULT 'on',
  `locked` tinyint(4) DEFAULT 0,
  `locked_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sort_type` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sequence` int(10) unsigned DEFAULT 1,
  `user_id` int(10) unsigned DEFAULT 1,
  `last_modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `sequence` (`sequence`),
  KEY `name` (`name`(171))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph_tree`
--

LOCK TABLES `graph_tree` WRITE;
/*!40000 ALTER TABLE `graph_tree` DISABLE KEYS */;
INSERT INTO `graph_tree` VALUES (1,'on',0,'0000-00-00 00:00:00',1,'Default Tree',1,1,'0000-00-00 00:00:00',1);
/*!40000 ALTER TABLE `graph_tree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graph_tree_items`
--

DROP TABLE IF EXISTS `graph_tree_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graph_tree_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent` bigint(20) unsigned DEFAULT NULL,
  `position` int(10) unsigned DEFAULT NULL,
  `graph_tree_id` smallint(5) unsigned NOT NULL DEFAULT 0,
  `local_graph_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `host_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `site_id` int(10) unsigned DEFAULT 0,
  `host_grouping_type` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `sort_children_type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `graph_regex` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `host_regex` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `graph_tree_id` (`graph_tree_id`),
  KEY `host_id` (`host_id`),
  KEY `site_id` (`site_id`),
  KEY `local_graph_id` (`local_graph_id`),
  KEY `parent_position` (`parent`,`position`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph_tree_items`
--

LOCK TABLES `graph_tree_items` WRITE;
/*!40000 ALTER TABLE `graph_tree_items` DISABLE KEYS */;
INSERT INTO `graph_tree_items` VALUES (1,0,1,1,0,'Local ',0,0,1,1,'',''),(2,1,1,1,0,'Machine',0,0,1,1,'',''),(3,2,1,1,0,'',1,0,1,0,'',''),(4,0,2,1,0,'',1,0,1,2,'','');
/*!40000 ALTER TABLE `graph_tree_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host`
--

DROP TABLE IF EXISTS `host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `poller_id` int(10) unsigned NOT NULL DEFAULT 1,
  `site_id` int(10) unsigned NOT NULL DEFAULT 1,
  `host_template_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `description` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hostname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_id` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `snmp_community` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `snmp_version` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `snmp_username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `snmp_password` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `snmp_auth_protocol` char(6) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `snmp_priv_passphrase` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `snmp_priv_protocol` char(6) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `snmp_context` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `snmp_engine_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `snmp_port` mediumint(5) unsigned NOT NULL DEFAULT 161,
  `snmp_timeout` mediumint(8) unsigned NOT NULL DEFAULT 500,
  `snmp_sysDescr` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `snmp_sysObjectID` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `snmp_sysUpTimeInstance` int(10) unsigned NOT NULL DEFAULT 0,
  `snmp_sysContact` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `snmp_sysName` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `snmp_sysLocation` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `availability_method` smallint(5) unsigned NOT NULL DEFAULT 1,
  `ping_method` smallint(5) unsigned DEFAULT 0,
  `ping_port` int(12) unsigned DEFAULT 0,
  `ping_timeout` int(12) unsigned DEFAULT 500,
  `ping_retries` int(12) unsigned DEFAULT 2,
  `max_oids` int(12) unsigned DEFAULT 10,
  `device_threads` tinyint(2) unsigned NOT NULL DEFAULT 1,
  `deleted` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `disabled` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0,
  `status_event_count` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `status_fail_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status_rec_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status_last_error` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `min_time` decimal(10,5) DEFAULT 9.99999,
  `max_time` decimal(10,5) DEFAULT 0.00000,
  `cur_time` decimal(10,5) DEFAULT 0.00000,
  `avg_time` decimal(10,5) DEFAULT 0.00000,
  `polling_time` double DEFAULT 0,
  `total_polls` int(12) unsigned DEFAULT 0,
  `failed_polls` int(12) unsigned DEFAULT 0,
  `availability` decimal(8,5) NOT NULL DEFAULT 100.00000,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `poller_id_disabled` (`poller_id`,`disabled`),
  KEY `site_id` (`site_id`),
  KEY `external_id` (`external_id`),
  KEY `disabled` (`disabled`),
  KEY `status` (`status`),
  KEY `site_id_location` (`site_id`,`location`),
  KEY `hostname` (`hostname`),
  KEY `poller_id_last_updated` (`poller_id`,`last_updated`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host`
--

LOCK TABLES `host` WRITE;
/*!40000 ALTER TABLE `host` DISABLE KEYS */;
INSERT INTO `host` VALUES (1,1,0,1,'Cacti-Template','127.0.0.1','','','','public',2,'','','','','','','',161,500,'\\\"Linux localhost.localdomain 3.10.0-1062.12.1.el7.x86_64 #1 SMP Tue Feb 4 23:02:59 UTC 2020 x86_64\\\"','iso.3.6.1.4.1.8072.3.2.10',212703,'\\\"Root <root@localhost> (configure /etc/snmp/snmp.local.conf)\\\"','\\\"localhost.localdomain\\\"','\\\"Unknown (edit /etc/snmp/snmpd.conf)\\\"',4,1,23,400,1,10,1,'','',3,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','',0.00000,0.36883,0.24199,0.03400,0.752,33,0,100.00000,'2020-03-08 01:00:02');
/*!40000 ALTER TABLE `host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_graph`
--

DROP TABLE IF EXISTS `host_graph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host_graph` (
  `host_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `graph_template_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`host_id`,`graph_template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host_graph`
--

LOCK TABLES `host_graph` WRITE;
/*!40000 ALTER TABLE `host_graph` DISABLE KEYS */;
INSERT INTO `host_graph` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,48),(1,49),(1,50),(1,51);
/*!40000 ALTER TABLE `host_graph` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_snmp_cache`
--

DROP TABLE IF EXISTS `host_snmp_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host_snmp_cache` (
  `host_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `snmp_query_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `field_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `field_value` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `snmp_index` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `oid` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `present` tinyint(4) NOT NULL DEFAULT 1,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`host_id`,`snmp_query_id`,`field_name`,`snmp_index`),
  KEY `host_id` (`host_id`,`field_name`),
  KEY `snmp_index` (`snmp_index`),
  KEY `field_name` (`field_name`),
  KEY `field_value` (`field_value`),
  KEY `snmp_query_id` (`snmp_query_id`),
  KEY `last_updated` (`last_updated`),
  KEY `present` (`present`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host_snmp_cache`
--

LOCK TABLES `host_snmp_cache` WRITE;
/*!40000 ALTER TABLE `host_snmp_cache` DISABLE KEYS */;
INSERT INTO `host_snmp_cache` VALUES (1,1,'pollerId','1','1','',1,'2020-03-08 00:48:19'),(1,1,'pollerName','Main Poller','1','',1,'2020-03-08 00:48:19'),(1,5,'dskDevice','/dev/mapper/centos-root','/dev/mapper/centos-root','',1,'2020-03-08 00:26:18'),(1,5,'dskDevice','/dev/sda1','/dev/sda1','',1,'2020-03-08 00:26:18'),(1,5,'dskMount','/','/dev/mapper/centos-root','',1,'2020-03-08 00:26:18'),(1,5,'dskMount','/boot','/dev/sda1','',1,'2020-03-08 00:26:18');
/*!40000 ALTER TABLE `host_snmp_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_snmp_query`
--

DROP TABLE IF EXISTS `host_snmp_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host_snmp_query` (
  `host_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `snmp_query_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `sort_field` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title_format` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `reindex_method` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`host_id`,`snmp_query_id`),
  KEY `host_id` (`host_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host_snmp_query`
--

LOCK TABLES `host_snmp_query` WRITE;
/*!40000 ALTER TABLE `host_snmp_query` DISABLE KEYS */;
INSERT INTO `host_snmp_query` VALUES (1,1,'pollerId','Check#|query_pollerId|',1),(1,2,'webseerId','',1),(1,3,'exportId','',1),(1,5,'dskDevice','|query_dskDevice|',1);
/*!40000 ALTER TABLE `host_snmp_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_template`
--

DROP TABLE IF EXISTS `host_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host_template` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host_template`
--

LOCK TABLES `host_template` WRITE;
/*!40000 ALTER TABLE `host_template` DISABLE KEYS */;
INSERT INTO `host_template` VALUES (1,'bd1c482a581a40e96348657977e33b75','Cacti Polling Host'),(2,'cae6a879f86edacb2471055783bec6d0','Cisco Router'),(3,'4855b0e3e553085ed57219690285f91f','Generic SNMP Device'),(4,'2d3e47f416738c2d22c87c40218cc55e','Local Linux Machine'),(5,'07d3fe6a52915f99e642d22e27d967a4','Net-SNMP Device'),(6,'5b8300be607dce4f030b026a381b91cd','Windows Device'),(7,'f695731bcce5d441e427675f085f86d7','Palo Alto Firewalls - PA-500'),(8,'11a8c8d80dac03a92d64768fdbdb7de3','Fortigate'),(9,'6eb1be43973dccde86ca7b9f622bd683','SNMP_Informant_Windows');
/*!40000 ALTER TABLE `host_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_template_graph`
--

DROP TABLE IF EXISTS `host_template_graph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host_template_graph` (
  `host_template_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `graph_template_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`host_template_id`,`graph_template_id`),
  KEY `host_template_id` (`host_template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host_template_graph`
--

LOCK TABLES `host_template_graph` WRITE;
/*!40000 ALTER TABLE `host_template_graph` DISABLE KEYS */;
INSERT INTO `host_template_graph` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(2,33),(2,34),(2,35),(3,34),(3,35),(3,46),(3,47),(4,48),(4,49),(4,50),(4,51),(5,34),(5,35),(5,53),(5,54),(5,55),(5,56),(5,57),(5,58),(5,59),(5,60),(5,61),(6,34),(6,35),(6,55),(6,56),(7,68),(7,69),(7,70),(7,71),(7,72),(7,73),(8,76),(8,77),(8,78);
/*!40000 ALTER TABLE `host_template_graph` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_template_snmp_query`
--

DROP TABLE IF EXISTS `host_template_snmp_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host_template_snmp_query` (
  `host_template_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `snmp_query_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`host_template_id`,`snmp_query_id`),
  KEY `host_template_id` (`host_template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host_template_snmp_query`
--

LOCK TABLES `host_template_snmp_query` WRITE;
/*!40000 ALTER TABLE `host_template_snmp_query` DISABLE KEYS */;
INSERT INTO `host_template_snmp_query` VALUES (1,1),(1,2),(1,3),(2,4),(3,4),(4,5),(5,4),(5,6),(5,7),(5,8),(5,9),(6,4),(6,7),(6,8),(7,4),(9,10),(9,11),(9,12),(9,13),(9,14);
/*!40000 ALTER TABLE `host_template_snmp_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_config`
--

DROP TABLE IF EXISTS `plugin_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_config` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `directory` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status` tinyint(2) NOT NULL DEFAULT 0,
  `author` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `webpage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `directory` (`directory`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_config`
--

LOCK TABLES `plugin_config` WRITE;
/*!40000 ALTER TABLE `plugin_config` DISABLE KEYS */;
INSERT INTO `plugin_config` VALUES (1,'webseer','Web Service Monitor',4,'The Cacti Group','http://cactiusers.org','3.0');
/*!40000 ALTER TABLE `plugin_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_db_changes`
--

DROP TABLE IF EXISTS `plugin_db_changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_db_changes` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `plugin` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `column` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `plugin` (`plugin`),
  KEY `method` (`method`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_db_changes`
--

LOCK TABLES `plugin_db_changes` WRITE;
/*!40000 ALTER TABLE `plugin_db_changes` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_db_changes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_hooks`
--

DROP TABLE IF EXISTS `plugin_hooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_hooks` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hook` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `function` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status` int(8) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `hook` (`hook`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_hooks`
--

LOCK TABLES `plugin_hooks` WRITE;
/*!40000 ALTER TABLE `plugin_hooks` DISABLE KEYS */;
INSERT INTO `plugin_hooks` VALUES (1,'internal','config_arrays','','plugin_config_arrays',1),(2,'internal','draw_navigation_text','','plugin_draw_navigation_text',1),(3,'webseer','draw_navigation_text','setup.php','plugin_webseer_draw_navigation_text',0),(4,'webseer','config_arrays','setup.php','plugin_webseer_config_arrays',1),(5,'webseer','poller_bottom','setup.php','plugin_webseer_poller_bottom',0);
/*!40000 ALTER TABLE `plugin_hooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_realms`
--

DROP TABLE IF EXISTS `plugin_realms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_realms` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `plugin` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `file` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `display` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `plugin` (`plugin`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_realms`
--

LOCK TABLES `plugin_realms` WRITE;
/*!40000 ALTER TABLE `plugin_realms` DISABLE KEYS */;
INSERT INTO `plugin_realms` VALUES (1,'internal','plugins.php','Plugin Management'),(2,'webseer','webseer.php,webseer_edit.php,webseer_servers.php,webseer_servers_edit.php,webseer_proxies.php','Web Service Check Admin');
/*!40000 ALTER TABLE `plugin_realms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_webseer_contacts`
--

DROP TABLE IF EXISTS `plugin_webseer_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_webseer_contacts` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `user_id` int(12) NOT NULL,
  `type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_type` (`user_id`,`type`),
  KEY `type` (`type`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Table of WebSeer contacts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_webseer_contacts`
--

LOCK TABLES `plugin_webseer_contacts` WRITE;
/*!40000 ALTER TABLE `plugin_webseer_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_webseer_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_webseer_processes`
--

DROP TABLE IF EXISTS `plugin_webseer_processes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_webseer_processes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `url_id` int(11) unsigned NOT NULL,
  `pid` int(11) unsigned NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `url_id` (`url_id`),
  KEY `time` (`time`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Holds running process information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_webseer_processes`
--

LOCK TABLES `plugin_webseer_processes` WRITE;
/*!40000 ALTER TABLE `plugin_webseer_processes` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_webseer_processes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_webseer_proxies`
--

DROP TABLE IF EXISTS `plugin_webseer_proxies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_webseer_proxies` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `hostname` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `http_port` mediumint(8) unsigned DEFAULT 80,
  `https_port` mediumint(8) unsigned DEFAULT 443,
  `username` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `password` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `hostname` (`hostname`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Holds Proxy Information for Connections';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_webseer_proxies`
--

LOCK TABLES `plugin_webseer_proxies` WRITE;
/*!40000 ALTER TABLE `plugin_webseer_proxies` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_webseer_proxies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_webseer_servers`
--

DROP TABLE IF EXISTS `plugin_webseer_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_webseer_servers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `enabled` char(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'on',
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastcheck` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `compression` int(3) NOT NULL DEFAULT 0,
  `isme` int(11) unsigned NOT NULL DEFAULT 0,
  `master` int(11) unsigned NOT NULL DEFAULT 0,
  `url` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `location` (`location`,`lastcheck`),
  KEY `isme` (`isme`),
  KEY `master` (`master`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Holds WebSeer Server Definitions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_webseer_servers`
--

LOCK TABLES `plugin_webseer_servers` WRITE;
/*!40000 ALTER TABLE `plugin_webseer_servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_webseer_servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_webseer_servers_log`
--

DROP TABLE IF EXISTS `plugin_webseer_servers_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_webseer_servers_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `server` int(11) unsigned NOT NULL DEFAULT 0,
  `url_id` int(11) unsigned NOT NULL DEFAULT 0,
  `lastcheck` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `compression` int(3) unsigned NOT NULL DEFAULT 0,
  `result` int(11) unsigned NOT NULL DEFAULT 0,
  `http_code` int(11) unsigned DEFAULT NULL,
  `error` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_time` double DEFAULT NULL,
  `namelookup_time` double DEFAULT NULL,
  `connect_time` double DEFAULT NULL,
  `redirect_time` double DEFAULT NULL,
  `redirect_count` int(11) unsigned DEFAULT NULL,
  `size_download` int(11) unsigned DEFAULT NULL,
  `speed_download` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `url_id` (`url_id`),
  KEY `lastcheck` (`lastcheck`),
  KEY `result` (`result`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Holds WebSeer Service Check Results';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_webseer_servers_log`
--

LOCK TABLES `plugin_webseer_servers_log` WRITE;
/*!40000 ALTER TABLE `plugin_webseer_servers_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_webseer_servers_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_webseer_urls`
--

DROP TABLE IF EXISTS `plugin_webseer_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_webseer_urls` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `enabled` char(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'on',
  `type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'http',
  `display_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `search` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `search_maint` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `search_failed` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requiresauth` char(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `proxy_server` int(11) unsigned NOT NULL DEFAULT 0,
  `checkcert` char(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'on',
  `notify_accounts` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notify_extra` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notify_format` int(3) unsigned NOT NULL DEFAULT 0,
  `result` int(11) unsigned NOT NULL DEFAULT 0,
  `downtrigger` int(11) unsigned NOT NULL DEFAULT 3,
  `timeout_trigger` int(11) unsigned NOT NULL DEFAULT 4,
  `failures` int(11) unsigned NOT NULL DEFAULT 0,
  `triggered` int(11) unsigned NOT NULL DEFAULT 0,
  `lastcheck` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `compression` int(3) unsigned NOT NULL DEFAULT 0,
  `error` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_code` int(11) unsigned DEFAULT NULL,
  `total_time` double DEFAULT NULL,
  `namelookup_time` double DEFAULT NULL,
  `connect_time` double DEFAULT NULL,
  `redirect_time` double DEFAULT NULL,
  `speed_download` int(11) unsigned DEFAULT NULL,
  `size_download` int(11) unsigned DEFAULT NULL,
  `redirect_count` int(11) unsigned DEFAULT NULL,
  `debug` longblob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lastcheck` (`lastcheck`),
  KEY `triggered` (`triggered`),
  KEY `result` (`result`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Holds WebSeer Service Check Definitions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_webseer_urls`
--

LOCK TABLES `plugin_webseer_urls` WRITE;
/*!40000 ALTER TABLE `plugin_webseer_urls` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_webseer_urls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_webseer_urls_log`
--

DROP TABLE IF EXISTS `plugin_webseer_urls_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_webseer_urls_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url_id` int(11) unsigned NOT NULL DEFAULT 0,
  `lastcheck` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `compression` int(3) unsigned NOT NULL DEFAULT 0,
  `result` int(11) unsigned NOT NULL DEFAULT 0,
  `http_code` int(11) unsigned DEFAULT NULL,
  `error` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_time` double DEFAULT NULL,
  `namelookup_time` double DEFAULT NULL,
  `connect_time` double DEFAULT NULL,
  `redirect_time` double unsigned DEFAULT NULL,
  `redirect_count` int(11) unsigned DEFAULT NULL,
  `size_download` int(11) unsigned DEFAULT NULL,
  `speed_download` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `url_id` (`url_id`),
  KEY `lastcheck` (`lastcheck`),
  KEY `result` (`result`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Holds WebSeer Service Check Logs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_webseer_urls_log`
--

LOCK TABLES `plugin_webseer_urls_log` WRITE;
/*!40000 ALTER TABLE `plugin_webseer_urls_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_webseer_urls_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poller`
--

DROP TABLE IF EXISTS `poller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poller` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `disabled` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status` int(10) unsigned NOT NULL DEFAULT 0,
  `timezone` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `hostname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `dbdefault` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `dbhost` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `dbuser` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `dbpass` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `dbport` int(10) unsigned DEFAULT 3306,
  `dbssl` char(3) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `dbsslkey` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dbsslcert` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dbsslca` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_time` double DEFAULT 0,
  `max_time` double DEFAULT NULL,
  `min_time` double DEFAULT NULL,
  `avg_time` double DEFAULT NULL,
  `total_polls` int(10) unsigned DEFAULT 0,
  `processes` int(10) unsigned DEFAULT 1,
  `threads` int(10) unsigned DEFAULT 1,
  `sync_interval` int(10) unsigned DEFAULT 7200,
  `snmp` mediumint(8) unsigned DEFAULT 0,
  `script` mediumint(8) unsigned DEFAULT 0,
  `server` mediumint(8) unsigned DEFAULT 0,
  `last_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_status` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_sync` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `requires_sync` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `disabled` (`disabled`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Pollers for Cacti';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poller`
--

LOCK TABLES `poller` WRITE;
/*!40000 ALTER TABLE `poller` DISABLE KEYS */;
INSERT INTO `poller` VALUES (1,'','Main Poller','',2,'','localhost.localdomain','','localhost.localdomain','','',3306,'',NULL,NULL,NULL,1.4263,69.58581495285,1.1521289348602,5.219002369288,37,1,1,7200,0,10,20,'2020-03-08 01:00:03','2020-03-08 01:00:03','0000-00-00 00:00:00','');
/*!40000 ALTER TABLE `poller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poller_command`
--

DROP TABLE IF EXISTS `poller_command`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poller_command` (
  `poller_id` smallint(5) unsigned NOT NULL DEFAULT 1,
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `action` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `command` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`poller_id`,`action`,`command`),
  KEY `poller_id_last_updated` (`poller_id`,`last_updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poller_command`
--

LOCK TABLES `poller_command` WRITE;
/*!40000 ALTER TABLE `poller_command` DISABLE KEYS */;
/*!40000 ALTER TABLE `poller_command` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poller_data_template_field_mappings`
--

DROP TABLE IF EXISTS `poller_data_template_field_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poller_data_template_field_mappings` (
  `data_template_id` int(10) unsigned NOT NULL DEFAULT 0,
  `data_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `data_source_names` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`data_template_id`,`data_name`,`data_source_names`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Tracks mapping of Data Templates to their Data Source Names';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poller_data_template_field_mappings`
--

LOCK TABLES `poller_data_template_field_mappings` WRITE;
/*!40000 ALTER TABLE `poller_data_template_field_mappings` DISABLE KEYS */;
INSERT INTO `poller_data_template_field_mappings` VALUES (1,'DataSources','DataSources','2020-03-08 00:44:27'),(1,'Hosts','Hosts','2020-03-08 00:44:27'),(1,'HostsPerProcess','HostsPerProcess','2020-03-08 00:44:27'),(1,'Processes','Processes','2020-03-08 00:44:27'),(1,'RRDsProcessed','RRDsProcessed','2020-03-08 00:44:27'),(1,'Threads','Threads','2020-03-08 00:44:27'),(1,'Time','Time','2020-03-08 00:44:27'),(2,'RRDUpdates','rrdupdates','2020-03-08 00:44:27'),(2,'Time','time','2020-03-08 00:44:27'),(3,'script','script','2020-03-08 00:44:27'),(3,'script_server','script_server','2020-03-08 00:44:27'),(3,'snmp','snmp','2020-03-08 00:44:27'),(4,'DevicesRecached','hosts','2020-03-08 00:26:19'),(4,'HostsRecached','hosts','2020-03-08 00:44:27'),(4,'RecacheTime','time','2020-03-08 00:44:27'),(5,'boost_peak_memory','boost_peak_memory','2020-03-08 00:44:27'),(6,'active','active','2020-03-08 00:44:27'),(6,'garbage','garbage','2020-03-08 00:44:27'),(6,'invalid','invalid','2020-03-08 00:44:27'),(6,'sleeping','sleeping','2020-03-08 00:44:27'),(6,'uactive','uactive','2020-03-08 00:44:27'),(6,'usleeping','usleeping','2020-03-08 00:44:27'),(6,'valid','valid','2020-03-08 00:44:27'),(7,'TotalGraphsExported','ExportGraphs','2020-03-08 00:44:27'),(8,'ExportDuration','ExportDuration','2020-03-08 00:44:27'),(9,'alarms','alarms','2020-03-08 00:26:19'),(9,'deletes','deletes','2020-03-08 00:26:19'),(9,'incoming','incoming','2020-03-08 00:26:19'),(9,'removes','removes','2020-03-08 00:26:19'),(9,'xfers','xfers','2020-03-08 00:26:19'),(10,'syslogRuntime','syslogRuntime','2020-03-08 00:26:19'),(11,'alerts','alerts','2020-03-08 00:26:19'),(11,'reports','reports','2020-03-08 00:26:19'),(12,'tholdRuntime','tholdRuntime','2020-03-08 00:26:19'),(13,'boost_avg_size','boost_avg_size','2020-03-08 00:26:19'),(14,'boost_records','boost_records','2020-03-08 00:26:19'),(15,'boost_table','boost_table','2020-03-08 00:26:19'),(16,'rrd_delete','rrd_delete','2020-03-08 00:26:19'),(16,'rrd_get_records','rrd_get_records','2020-03-08 00:26:19'),(16,'rrd_lastupdate','rrd_lastupdate','2020-03-08 00:26:19'),(16,'rrd_results_cycle','rrd_results_cycle','2020-03-08 00:26:19'),(16,'rrd_template','rrd_template','2020-03-08 00:26:19'),(16,'rrd_update','rrd_update','2020-03-08 00:26:19'),(21,'script','totalTime','2020-03-08 00:26:19'),(28,'polling_time','polling_time','2020-03-08 00:26:19'),(29,'uptime','uptime','2020-03-08 00:26:19'),(34,'out_ms','ping','2020-03-08 00:26:19'),(36,'proc','proc','2020-03-08 00:26:19'),(37,'10min','load_15min','2020-03-08 00:26:19'),(37,'1min','load_1min','2020-03-08 00:26:19'),(37,'5min','load_5min','2020-03-08 00:26:19'),(38,'users','users','2020-03-08 00:26:19'),(39,'kilobytes','mem_buffers','2020-03-08 00:26:19'),(40,'kilobytes','mem_swap','2020-03-08 00:26:19'),(56,'reads','reads','2020-03-08 00:26:19'),(56,'writes','writes','2020-03-08 00:26:19'),(57,'bytesread','bytesread','2020-03-08 00:26:19'),(57,'byteswritten','byteswritten','2020-03-08 00:26:19'),(77,'avg','avg','2020-03-08 00:41:14'),(77,'dev','dev','2020-03-08 00:41:14'),(77,'loss','loss','2020-03-08 00:41:14'),(77,'max','max','2020-03-08 00:41:14'),(77,'min','min','2020-03-08 00:41:14');
/*!40000 ALTER TABLE `poller_data_template_field_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poller_item`
--

DROP TABLE IF EXISTS `poller_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poller_item` (
  `local_data_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `poller_id` int(10) unsigned NOT NULL DEFAULT 1,
  `host_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `action` tinyint(2) unsigned NOT NULL DEFAULT 1,
  `present` tinyint(4) NOT NULL DEFAULT 1,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `hostname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `snmp_community` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `snmp_version` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `snmp_username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `snmp_password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `snmp_auth_protocol` char(6) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `snmp_priv_passphrase` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `snmp_priv_protocol` char(6) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `snmp_context` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `snmp_engine_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `snmp_port` mediumint(5) unsigned NOT NULL DEFAULT 161,
  `snmp_timeout` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `rrd_name` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rrd_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rrd_num` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `rrd_step` mediumint(8) NOT NULL DEFAULT 300,
  `rrd_next_step` mediumint(8) NOT NULL DEFAULT 0,
  `arg1` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arg2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arg3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`local_data_id`,`rrd_name`),
  KEY `host_id` (`host_id`),
  KEY `action` (`action`),
  KEY `present` (`present`),
  KEY `poller_id_host_id` (`poller_id`,`host_id`),
  KEY `poller_id_rrd_next_step` (`poller_id`,`rrd_next_step`),
  KEY `poller_id_action` (`poller_id`,`action`),
  KEY `poller_id_last_updated` (`poller_id`,`last_updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poller_item`
--

LOCK TABLES `poller_item` WRITE;
/*!40000 ALTER TABLE `poller_item` DISABLE KEYS */;
INSERT INTO `poller_item` VALUES (1,1,1,1,1,'2020-03-08 00:55:02','127.0.0.1','public',2,'','','','','','','',161,500,'proc','/var/www/html/cacti/rra/local_linux_machine_proc_1.rrd',1,60,0,'perl /var/www/html/cacti/scripts/unix_processes.pl','',''),(2,1,1,1,1,'2020-03-08 00:55:02','127.0.0.1','public',2,'','','','','','','',161,500,'','/var/www/html/cacti/rra/local_linux_machine_load_1min_2.rrd',1,60,0,'perl /var/www/html/cacti/scripts/loadavg_multi.pl','',''),(3,1,1,1,1,'2020-03-08 00:55:02','127.0.0.1','public',2,'','','','','','','',161,500,'users','/var/www/html/cacti/rra/local_linux_machine_users_3.rrd',1,60,0,'perl /var/www/html/cacti/scripts/unix_users.pl \'\'','',''),(4,1,1,1,1,'2020-03-08 00:55:02','127.0.0.1','public',2,'','','','','','','',161,500,'mem_buffers','/var/www/html/cacti/rra/local_linux_machine_mem_buffers_4.rrd',1,60,0,'perl /var/www/html/cacti/scripts/linux_memory.pl \'MemFree:\'','',''),(5,1,1,1,1,'2020-03-08 00:55:02','127.0.0.1','public',2,'','','','','','','',161,500,'mem_swap','/var/www/html/cacti/rra/local_linux_machine_mem_swap_5.rrd',1,60,0,'perl /var/www/html/cacti/scripts/linux_memory.pl \'SwapFree:\'','',''),(6,1,1,2,1,'2020-03-08 00:55:02','127.0.0.1','public',2,'','','','','','','',161,500,'','/var/www/html/cacti/rra/cacti-template_loss_6.rrd',1,60,0,'/var/www/html/cacti/scripts/ss_fping.php ss_fping \'127.0.0.1\' \'10\' \'ICMP\' \'\'','',''),(7,1,1,1,1,'2020-03-08 00:55:02','127.0.0.1','public',2,'','','','','','','',161,500,'hdd_free','/var/www/html/cacti/rra/cacti-template_hdd_free_7.rrd',2,60,0,'perl /var/www/html/cacti/scripts/query_unix_partitions.pl \'get\' \'available\' \'/dev/mapper/centos-root\'','',''),(7,1,1,1,1,'2020-03-08 00:55:02','127.0.0.1','public',2,'','','','','','','',161,500,'hdd_used','/var/www/html/cacti/rra/cacti-template_hdd_free_7.rrd',2,60,0,'perl /var/www/html/cacti/scripts/query_unix_partitions.pl \'get\' \'used\' \'/dev/mapper/centos-root\'','',''),(8,1,1,2,1,'2020-03-08 00:55:02','127.0.0.1','public',2,'','','','','','','',161,500,'','/var/www/html/cacti/rra/cacti-template_rrdsprocessed_8.rrd',1,60,0,'/var/www/html/cacti/scripts/ss_poller.php ss_poller','',''),(9,1,1,2,1,'2020-03-08 00:55:02','127.0.0.1','public',2,'','','','','','','',161,500,'','/var/www/html/cacti/rra/cacti-template_rrdsprocessed_9.rrd',1,60,0,'/var/www/html/cacti/scripts/ss_poller.php ss_poller','',''),(10,1,1,2,1,'2020-03-08 00:55:02','127.0.0.1','public',2,'','','','','','','',161,500,'','/var/www/html/cacti/rra/cacti-template_time_10.rrd',1,60,0,'/var/www/html/cacti/scripts/ss_poller.php ss_boost','',''),(11,1,1,2,1,'2020-03-08 00:55:02','127.0.0.1','public',2,'','','','','','','',161,500,'','/var/www/html/cacti/rra/cacti-template_snmp_11.rrd',1,60,0,'/var/www/html/cacti/scripts/ss_poller.php ss_poller_items','',''),(12,1,1,2,1,'2020-03-08 00:55:02','127.0.0.1','public',2,'','','','','','','',161,500,'','/var/www/html/cacti/rra/cacti-template_hosts_12.rrd',1,60,0,'/var/www/html/cacti/scripts/ss_poller.php ss_recache','',''),(13,1,1,2,1,'2020-03-08 00:55:02','127.0.0.1','public',2,'','','','','','','',161,500,'','/var/www/html/cacti/rra/cacti-template_rrdsprocessed_13.rrd',1,60,0,'/var/www/html/cacti/scripts/ss_poller.php ss_poller','',''),(14,1,1,2,1,'2020-03-08 00:55:02','127.0.0.1','public',2,'','','','','','','',161,500,'boost_peak_memory','/var/www/html/cacti/rra/cacti-template_boost_peak_memory_14.rrd',1,60,0,'/var/www/html/cacti/scripts/ss_poller.php ss_boost_mem','',''),(15,1,1,1,1,'2020-03-08 00:55:02','127.0.0.1','public',2,'','','','','','','',161,500,'','/var/www/html/cacti/rra/cacti-template_active_15.rrd',1,60,0,'/usr/bin/php -q /var/www/html/cacti/scripts/cacti_user_stats.php','',''),(16,1,1,1,1,'2020-03-08 00:55:02','127.0.0.1','public',2,'','','','','','','',161,500,'','/var/www/html/cacti/rra/cacti-template_active_16.rrd',1,60,0,'/usr/bin/php -q /var/www/html/cacti/scripts/cacti_user_stats.php','',''),(17,1,1,1,1,'2020-03-08 00:55:02','127.0.0.1','public',2,'','','','','','','',161,500,'','/var/www/html/cacti/rra/cacti-template_active_17.rrd',1,60,0,'/usr/bin/php -q /var/www/html/cacti/scripts/cacti_user_stats.php','',''),(18,1,1,2,1,'2020-03-08 00:55:02','127.0.0.1','public',2,'','','','','','','',161,500,'','/var/www/html/cacti/rra/cacti-template_time_18.rrd',1,60,0,'/var/www/html/cacti/scripts/ss_poller.php ss_boost','',''),(19,1,1,2,1,'2020-03-08 00:55:02','127.0.0.1','public',2,'','','','','','','',161,500,'','/var/www/html/cacti/rra/cacti-template_rrdsprocessed_19.rrd',1,60,0,'/var/www/html/cacti/scripts/ss_poller.php ss_poller','',''),(20,1,1,2,1,'2020-03-08 00:55:02','127.0.0.1','public',2,'','','','','','','',161,500,'ExportGraphs','/var/www/html/cacti/rra/cacti-template_exportgraphs_20.rrd',1,60,0,'/var/www/html/cacti/scripts/ss_poller.php ss_export','',''),(21,1,1,2,1,'2020-03-08 00:55:02','127.0.0.1','public',2,'','','','','','','',161,500,'ExportDuration','/var/www/html/cacti/rra/cacti-template_exportduration_21.rrd',1,60,0,'/var/www/html/cacti/scripts/ss_poller.php ss_export','',''),(22,1,1,2,1,'2020-03-08 00:55:02','127.0.0.1','public',2,'','','','','','','',161,500,'','/var/www/html/cacti/rra/cacti-template_incoming_22.rrd',1,60,0,'/var/www/html/cacti/scripts/ss_poller.php ss_syslog_stats','',''),(23,1,1,2,1,'2020-03-08 00:55:02','127.0.0.1','public',2,'','','','','','','',161,500,'syslogRuntime','/var/www/html/cacti/rra/cacti-template_syslogruntime_23.rrd',1,60,0,'/var/www/html/cacti/scripts/ss_poller.php ss_syslog_time','',''),(24,1,1,2,1,'2020-03-08 00:55:02','127.0.0.1','public',2,'','','','','','','',161,500,'','/var/www/html/cacti/rra/cacti-template_alerts_24.rrd',1,60,0,'/var/www/html/cacti/scripts/ss_poller.php ss_syslog_stats','',''),(25,1,1,2,1,'2020-03-08 00:55:02','127.0.0.1','public',2,'','','','','','','',161,500,'tholdRuntime','/var/www/html/cacti/rra/cacti-template_tholdruntime_25.rrd',1,60,0,'/var/www/html/cacti/scripts/ss_poller.php ss_thold_time','',''),(26,1,1,2,1,'2020-03-08 00:55:02','127.0.0.1','public',2,'','','','','','','',161,500,'boost_avg_size','/var/www/html/cacti/rra/cacti-template_boost_avg_size_26.rrd',1,60,0,'/var/www/html/cacti/scripts/ss_poller.php ss_boost_avg_size','',''),(27,1,1,2,1,'2020-03-08 00:55:02','127.0.0.1','public',2,'','','','','','','',161,500,'boost_records','/var/www/html/cacti/rra/cacti-template_boost_records_27.rrd',1,60,0,'/var/www/html/cacti/scripts/ss_poller.php ss_boost_records','',''),(28,1,1,2,1,'2020-03-08 00:55:02','127.0.0.1','public',2,'','','','','','','',161,500,'boost_table','/var/www/html/cacti/rra/cacti-template_boost_table_28.rrd',1,60,0,'/var/www/html/cacti/scripts/ss_poller.php ss_boost_table','',''),(29,1,1,2,1,'2020-03-08 00:55:02','127.0.0.1','public',2,'','','','','','','',161,500,'','/var/www/html/cacti/rra/cacti-template_rrd_delete_29.rrd',1,60,0,'/var/www/html/cacti/scripts/ss_poller.php ss_boost_timing','','');
/*!40000 ALTER TABLE `poller_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poller_output`
--

DROP TABLE IF EXISTS `poller_output`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poller_output` (
  `local_data_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `rrd_name` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `output` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`local_data_id`,`rrd_name`,`time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poller_output`
--

LOCK TABLES `poller_output` WRITE;
/*!40000 ALTER TABLE `poller_output` DISABLE KEYS */;
/*!40000 ALTER TABLE `poller_output` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poller_output_boost`
--

DROP TABLE IF EXISTS `poller_output_boost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poller_output_boost` (
  `local_data_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `rrd_name` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `output` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`local_data_id`,`time`,`rrd_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poller_output_boost`
--

LOCK TABLES `poller_output_boost` WRITE;
/*!40000 ALTER TABLE `poller_output_boost` DISABLE KEYS */;
/*!40000 ALTER TABLE `poller_output_boost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poller_output_boost_processes`
--

DROP TABLE IF EXISTS `poller_output_boost_processes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poller_output_boost_processes` (
  `sock_int_value` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sock_int_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poller_output_boost_processes`
--

LOCK TABLES `poller_output_boost_processes` WRITE;
/*!40000 ALTER TABLE `poller_output_boost_processes` DISABLE KEYS */;
/*!40000 ALTER TABLE `poller_output_boost_processes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poller_output_realtime`
--

DROP TABLE IF EXISTS `poller_output_realtime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poller_output_realtime` (
  `local_data_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `rrd_name` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `output` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `poller_id` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`local_data_id`,`rrd_name`,`time`),
  KEY `poller_id` (`poller_id`(191)),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poller_output_realtime`
--

LOCK TABLES `poller_output_realtime` WRITE;
/*!40000 ALTER TABLE `poller_output_realtime` DISABLE KEYS */;
/*!40000 ALTER TABLE `poller_output_realtime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poller_reindex`
--

DROP TABLE IF EXISTS `poller_reindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poller_reindex` (
  `host_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `data_query_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `action` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `present` tinyint(4) NOT NULL DEFAULT 1,
  `op` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `assert_value` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `arg1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`host_id`,`data_query_id`,`arg1`(187)),
  KEY `present` (`present`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poller_reindex`
--

LOCK TABLES `poller_reindex` WRITE;
/*!40000 ALTER TABLE `poller_reindex` DISABLE KEYS */;
INSERT INTO `poller_reindex` VALUES (1,1,0,1,'<','212704','.1.3.6.1.2.1.1.3.0');
/*!40000 ALTER TABLE `poller_reindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poller_resource_cache`
--

DROP TABLE IF EXISTS `poller_resource_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poller_resource_cache` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resource_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `md5sum` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `contents` longblob DEFAULT NULL,
  `attributes` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Caches all scripts, resources files, and plugins';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poller_resource_cache`
--

LOCK TABLES `poller_resource_cache` WRITE;
/*!40000 ALTER TABLE `poller_resource_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `poller_resource_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poller_time`
--

DROP TABLE IF EXISTS `poller_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poller_time` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT 0,
  `poller_id` int(10) unsigned NOT NULL DEFAULT 1,
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `poller_id_end_time` (`poller_id`,`end_time`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poller_time`
--

LOCK TABLES `poller_time` WRITE;
/*!40000 ALTER TABLE `poller_time` DISABLE KEYS */;
INSERT INTO `poller_time` VALUES (68,3481,1,'2020-03-08 01:00:01','2020-03-08 01:00:01'),(69,3484,1,'2020-03-08 01:00:02','2020-03-08 01:00:02');
/*!40000 ALTER TABLE `poller_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cformat` char(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `format_file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `font_size` smallint(2) unsigned NOT NULL DEFAULT 0,
  `alignment` smallint(2) unsigned NOT NULL DEFAULT 0,
  `graph_linked` char(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `intrvl` smallint(2) unsigned NOT NULL DEFAULT 0,
  `count` smallint(2) unsigned NOT NULL DEFAULT 0,
  `offset` int(12) unsigned NOT NULL DEFAULT 0,
  `mailtime` bigint(20) unsigned NOT NULL DEFAULT 0,
  `subject` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `from_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_email` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `bcc` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment_type` smallint(2) unsigned NOT NULL DEFAULT 1,
  `graph_height` smallint(2) unsigned NOT NULL DEFAULT 0,
  `graph_width` smallint(2) unsigned NOT NULL DEFAULT 0,
  `graph_columns` smallint(2) unsigned NOT NULL DEFAULT 0,
  `thumbnails` char(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lastsent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `enabled` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mailtime` (`mailtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Cacri Reporting Reports';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports_items`
--

DROP TABLE IF EXISTS `reports_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reports_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `report_id` int(10) unsigned NOT NULL DEFAULT 0,
  `item_type` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `tree_id` int(10) unsigned NOT NULL DEFAULT 0,
  `branch_id` int(10) unsigned NOT NULL DEFAULT 0,
  `tree_cascade` char(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `graph_name_regexp` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `host_template_id` int(10) unsigned NOT NULL DEFAULT 0,
  `host_id` int(10) unsigned NOT NULL DEFAULT 0,
  `graph_template_id` int(10) unsigned NOT NULL DEFAULT 0,
  `local_graph_id` int(10) unsigned NOT NULL DEFAULT 0,
  `timespan` int(10) unsigned NOT NULL DEFAULT 0,
  `align` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `item_text` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `font_size` smallint(2) unsigned NOT NULL DEFAULT 10,
  `sequence` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `report_id` (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Cacti Reporting Items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports_items`
--

LOCK TABLES `reports_items` WRITE;
/*!40000 ALTER TABLE `reports_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remote_addr` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `access` int(10) unsigned DEFAULT NULL,
  `data` mediumblob DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Used for Database based Session Storage';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES ('0',''),('1',''),('10',''),('100',''),('101',''),('102',''),('103',''),('104',''),('105',''),('106',''),('107',''),('108',''),('11',''),('12',''),('13',''),('14',''),('15',''),('16',''),('17',''),('18',''),('19',''),('2',''),('20',''),('21',''),('22',''),('23',''),('24',''),('25',''),('26',''),('27',''),('28',''),('29',''),('3',''),('30',''),('31',''),('32',''),('33',''),('34',''),('35',''),('36',''),('37',''),('38',''),('39',''),('4',''),('40',''),('41',''),('42',''),('43',''),('44',''),('45',''),('46',''),('47',''),('48',''),('49',''),('5',''),('50',''),('51',''),('52',''),('53',''),('54',''),('55',''),('56',''),('57',''),('58',''),('59',''),('6',''),('60',''),('61',''),('62',''),('63',''),('64',''),('65',''),('66',''),('67',''),('68',''),('69',''),('7',''),('70',''),('71',''),('72',''),('73',''),('74',''),('75',''),('76',''),('77',''),('78',''),('79',''),('8',''),('80',''),('81',''),('82',''),('83',''),('84',''),('85',''),('86',''),('87',''),('88',''),('89',''),('9',''),('90',''),('91',''),('92',''),('93',''),('94',''),('95',''),('96',''),('97',''),('98',''),('99',''),('admin_user','1'),('auth_cache_enabled','on'),('auth_method','1'),('autocomplete_enabled','1'),('autocomplete_rows','30'),('automation_email',''),('automation_fromemail',''),('automation_fromname',''),('automation_graphs_enabled',''),('automation_tree_enabled',''),('availability_method','2'),('axis_size','7'),('base_url','http://localhost/cacti/'),('boost_parallel','1'),('boost_png_cache_directory','/var/www/html/cacti/cache/boost/'),('boost_png_cache_enable',''),('boost_poller_mem_limit','1024'),('boost_redirect',''),('boost_rrd_update_enable',''),('boost_rrd_update_interval','60'),('boost_rrd_update_max_records','1000000'),('boost_rrd_update_max_records_per_select','50000'),('boost_rrd_update_max_runtime','1200'),('boost_rrd_update_string_length','2000'),('boost_rrd_update_system_enable',''),('concurrent_processes','1'),('cron_interval','60'),('data_source_trace',''),('date','2020-03-07 17:00:02'),('default_date_format','4'),('default_datechar','1'),('default_graph_height','150'),('default_graph_width','500'),('default_graphs_new_dropdown','-2'),('default_has',''),('default_image_format','1'),('default_interface_speed','1000'),('default_poller','1'),('default_site','1'),('default_template','3'),('deletion_verification','on'),('device_threads','1'),('disable_cache_replication',''),('drag_and_drop','on'),('ds_preselected_delete','on'),('dsstats_daily_interval','60'),('dsstats_enable','on'),('dsstats_hourly_duration','60'),('dsstats_last_daily_run_time','2020-03-07 16:57:06'),('dsstats_last_major_run_time','2020-03-07 16:57:06'),('dsstats_major_update_time','12:00am'),('dsstats_poller_mem_limit','1024'),('enable_snmp_agent','on'),('extended_paths',''),('font_method','1'),('force_https',''),('graph_auth_method','1'),('graph_watermark','Generated by Cacti®'),('graphs_auto_unlock',''),('grds_creation_method','0'),('guest_user','0'),('hide_console',''),('hide_form_description',''),('i18n_auto_detection','1'),('i18n_default_language','en-US'),('i18n_language_support','1'),('install_automation_mode','false'),('install_automation_override','false'),('install_automation_range','192.168.1.0/24'),('install_complete','1583627181.9052'),('install_error',''),('install_eula','1'),('install_has_tables','1'),('install_has_templates','1'),('install_language','en-US'),('install_mode','1'),('install_next','0'),('install_prev','0'),('install_profile','3'),('install_progress','100'),('install_rrdtool_version','1.4.0'),('install_snmp_option_max_oids','10'),('install_snmp_option_snmp_auth_protocol','MD5'),('install_snmp_option_snmp_community','public'),('install_snmp_option_snmp_context',''),('install_snmp_option_snmp_engine_id',''),('install_snmp_option_snmp_password',''),('install_snmp_option_snmp_port','161'),('install_snmp_option_snmp_priv_passphrase',''),('install_snmp_option_snmp_priv_protocol','DES'),('install_snmp_option_snmp_retries','3'),('install_snmp_option_snmp_security_level','authPriv'),('install_snmp_option_snmp_timeout','500'),('install_snmp_option_snmp_username',''),('install_snmp_option_snmp_version','2'),('install_started','1583627103.9528'),('install_step','98'),('install_table_aggregate_graph_templates','aggregate_graph_templates'),('install_table_aggregate_graph_templates_graph','aggregate_graph_templates_graph'),('install_table_aggregate_graph_templates_item','aggregate_graph_templates_item'),('install_table_aggregate_graphs','aggregate_graphs'),('install_table_aggregate_graphs_graph_item','aggregate_graphs_graph_item'),('install_table_aggregate_graphs_items','aggregate_graphs_items'),('install_table_automation_devices','automation_devices'),('install_table_automation_graph_rule_items','automation_graph_rule_items'),('install_table_automation_graph_rules','automation_graph_rules'),('install_table_automation_ips','automation_ips'),('install_table_automation_match_rule_items','automation_match_rule_items'),('install_table_automation_networks','automation_networks'),('install_table_automation_processes','automation_processes'),('install_table_automation_snmp','automation_snmp'),('install_table_automation_snmp_items','automation_snmp_items'),('install_table_automation_templates','automation_templates'),('install_table_automation_tree_rule_items','automation_tree_rule_items'),('install_table_automation_tree_rules','automation_tree_rules'),('install_table_cdef','cdef'),('install_table_cdef_items','cdef_items'),('install_table_color_template_items','color_template_items'),('install_table_color_templates','color_templates'),('install_table_colors','colors'),('install_table_data_debug','data_debug'),('install_table_data_input','data_input'),('install_table_data_input_data','data_input_data'),('install_table_data_input_fields','data_input_fields'),('install_table_data_local','data_local'),('install_table_data_source_profiles','data_source_profiles'),('install_table_data_source_profiles_cf','data_source_profiles_cf'),('install_table_data_source_profiles_rra','data_source_profiles_rra'),('install_table_data_source_purge_action','data_source_purge_action'),('install_table_data_source_purge_temp','data_source_purge_temp'),('install_table_data_source_stats_daily','data_source_stats_daily'),('install_table_data_source_stats_hourly','data_source_stats_hourly'),('install_table_data_source_stats_hourly_cache','data_source_stats_hourly_cache'),('install_table_data_source_stats_hourly_last','data_source_stats_hourly_last'),('install_table_data_source_stats_monthly','data_source_stats_monthly'),('install_table_data_source_stats_weekly','data_source_stats_weekly'),('install_table_data_source_stats_yearly','data_source_stats_yearly'),('install_table_data_template','data_template'),('install_table_data_template_data','data_template_data'),('install_table_data_template_rrd','data_template_rrd'),('install_table_external_links','external_links'),('install_table_graph_local','graph_local'),('install_table_graph_template_input','graph_template_input'),('install_table_graph_template_input_defs','graph_template_input_defs'),('install_table_graph_templates','graph_templates'),('install_table_graph_templates_gprint','graph_templates_gprint'),('install_table_graph_templates_graph','graph_templates_graph'),('install_table_graph_templates_item','graph_templates_item'),('install_table_graph_tree','graph_tree'),('install_table_graph_tree_items','graph_tree_items'),('install_table_host','host'),('install_table_host_graph','host_graph'),('install_table_host_snmp_cache','host_snmp_cache'),('install_table_host_snmp_query','host_snmp_query'),('install_table_host_template','host_template'),('install_table_host_template_graph','host_template_graph'),('install_table_host_template_snmp_query','host_template_snmp_query'),('install_table_plugin_config','plugin_config'),('install_table_plugin_db_changes','plugin_db_changes'),('install_table_plugin_hooks','plugin_hooks'),('install_table_plugin_realms','plugin_realms'),('install_table_poller','poller'),('install_table_poller_command','poller_command'),('install_table_poller_data_template_field_mappings','poller_data_template_field_mappings'),('install_table_poller_item','poller_item'),('install_table_poller_output','poller_output'),('install_table_poller_output_boost','poller_output_boost'),('install_table_poller_output_boost_processes','poller_output_boost_processes'),('install_table_poller_output_realtime','poller_output_realtime'),('install_table_poller_reindex','poller_reindex'),('install_table_poller_resource_cache','poller_resource_cache'),('install_table_poller_time','poller_time'),('install_table_reports','reports'),('install_table_reports_items','reports_items'),('install_table_sessions','sessions'),('install_table_settings','settings'),('install_table_settings_tree','settings_tree'),('install_table_settings_user','settings_user'),('install_table_settings_user_group','settings_user_group'),('install_table_sites','sites'),('install_table_snmp_query','snmp_query'),('install_table_snmp_query_graph','snmp_query_graph'),('install_table_snmp_query_graph_rrd','snmp_query_graph_rrd'),('install_table_snmp_query_graph_rrd_sv','snmp_query_graph_rrd_sv'),('install_table_snmp_query_graph_sv','snmp_query_graph_sv'),('install_table_snmpagent_cache','snmpagent_cache'),('install_table_snmpagent_cache_notifications','snmpagent_cache_notifications'),('install_table_snmpagent_cache_textual_conventions','snmpagent_cache_textual_conventions'),('install_table_snmpagent_managers','snmpagent_managers'),('install_table_snmpagent_managers_notifications','snmpagent_managers_notifications'),('install_table_snmpagent_mibs','snmpagent_mibs'),('install_table_snmpagent_notifications_log','snmpagent_notifications_log'),('install_table_user_auth','user_auth'),('install_table_user_auth_cache','user_auth_cache'),('install_table_user_auth_group','user_auth_group'),('install_table_user_auth_group_members','user_auth_group_members'),('install_table_user_auth_group_perms','user_auth_group_perms'),('install_table_user_auth_group_realm','user_auth_group_realm'),('install_table_user_auth_perms','user_auth_perms'),('install_table_user_auth_realm','user_auth_realm'),('install_table_user_domains','user_domains'),('install_table_user_domains_ldap','user_domains_ldap'),('install_table_user_log','user_log'),('install_table_vdef','vdef'),('install_table_vdef_items','vdef_items'),('install_table_version','version'),('install_template_Cacti_Stats_xml_gz','Cacti_Stats.xml.gz'),('install_template_Cisco_Router_xml_gz','Cisco_Router.xml.gz'),('install_template_Generic_SNMP_Device_xml_gz','Generic_SNMP_Device.xml.gz'),('install_template_Local_Linux_Machine_xml_gz','Local_Linux_Machine.xml.gz'),('install_template_NetSNMP_Device_xml_gz','NetSNMP_Device.xml.gz'),('install_template_Windows_Device_xml_gz','Windows_Device.xml.gz'),('install_theme','modern'),('install_updated','1583627181.8891'),('install_version','1.2.9'),('ldap_encryption','0'),('ldap_group_member_type','1'),('ldap_group_require',''),('ldap_mode','0'),('ldap_port','389'),('ldap_port_ssl','636'),('ldap_referrals','0'),('ldap_version','3'),('legend_size','8'),('log_destination','1'),('log_perror','on'),('log_pstats',''),('log_pwarn',''),('log_refresh_interval','60'),('log_validation',''),('log_verbosity','2'),('logrotate_enabled','on'),('logrotate_frequency','1'),('logrotate_lastrun','1583626867'),('logrotate_retain','7'),('max_data_query_field_length','40'),('max_display_rows','1000'),('max_get_size','10'),('max_threads','1'),('max_title_length','110'),('max_tree_width','300'),('min_tree_width','170'),('notify_admin',''),('num_rows_log','500'),('num_rows_table','30'),('oid_increasing_check_disable',''),('path_boost_log',''),('path_cactilog','/var/www/html/cacti/log/cacti.log'),('path_php_binary','/usr/bin/php'),('path_rrdtool','/usr/bin/rrdtool'),('path_snmpbulkwalk','/usr/bin/snmpbulkwalk'),('path_snmpget','/usr/bin/snmpget'),('path_snmpgetnext','/usr/bin/snmpgetnext'),('path_snmptrap','/usr/bin/snmptrap'),('path_snmpwalk','/usr/bin/snmpwalk'),('path_spine','/usr/local/spine/bin/spine'),('path_spine_config','/usr/local/spine/etc/spine.conf'),('path_stderrlog','/var/www/html/cacti/log/cacti_stderr.log'),('path_webroot','/var/www/html/cacti'),('php_servers','1'),('ping_failure_count','2'),('ping_method','2'),('ping_port','23'),('ping_recovery_count','3'),('ping_retries','1'),('ping_timeout','400'),('poller_debug',''),('poller_enabled','on'),('poller_interval','60'),('poller_lastrun_1','1583629201'),('poller_replicate_data_input_crc','4ea0d514f0a9054adff28b4c7eee26dbe5f8d280'),('poller_replicate_data_input_fields_crc','5521e13056a5e8a719b8ddc1cfe488d200da7725'),('poller_replicate_data_source_cache_crc_1','c6fe6d69b86a26d8fb94fc5a793de69dd571a33a'),('poller_replicate_device_cache_crc_1','a95977a1483b0ba795c169ced9b794388b05164f'),('poller_replicate_snmp_query_crc','0a138dbc63c5df327571913769e66e9461481b31'),('poller_sync_interval','1800'),('poller_type','2'),('process_leveling','on'),('realtime_cache_path','/var/www/html/cacti/cache/realtime/'),('realtime_enabled','on'),('realtime_gwindow','60'),('realtime_interval','10'),('reindex_method','1'),('remote_agent_timeout','5'),('reports_allow_ln',''),('reports_default_image_format','1'),('reports_log_verbosity','2'),('reports_max_attach','10485760'),('rrd_archive',''),('rrd_autoclean','on'),('rrd_autoclean_method','1'),('rrdp_fingerprint',''),('rrdp_fingerprint_backup',''),('rrdp_load_balancing',''),('rrdp_port','40301'),('rrdp_port_backup','40301'),('rrdp_server',''),('rrdp_server_backup',''),('rrdtool_version','1.4.0'),('rsa_fingerprint','5c:4a:78:db:57:bc:f6:a4:b0:3a:e2:3b:ce:41:a8:b0'),('rsa_private_key','-----BEGIN RSA PRIVATE KEY----- MIIEpAIBAAKCAQEAwv8C0VUeFwHNFKyEliu27X6kk5UzQswS8oCKEXzBgEUckLyI Zqd3S/Zi6f3kkJ3D/3ReG6WunpRebBOzxrmaVZHyCmoNZj9Vub29VKFyXU1AWW1Q R6+elpJHc7GH2+GV9z7QBU0hEBFRgm9U//IZA7HaW51kutajpVelu6fZaVIAKOyY 6DyhMUcHERv38pvGmqM7hLQiNo6YyJCrYcXlJJn4L4WPfLZ/Rf0VQ31sAuF5LnrZ YExGcycpw6XCcB7zaf/bKDSUDh+dob0YpNiGWfU6JKT32tQcnJHceoen0nv8ytkt n2LJofZEQfLl5HUcU+tIkWznz4nLpsSaqnk2JQIDAQABAoIBAAFS8/Tx7ANh+r+C MGBIqbRRINLzt2Zjtlk5MDbQLwws6/W7of14c6HraV6HX87vk04fvyfW5ymifkWj mJvn1LlyBT+22qJwGafqNuflNL6XcLFqwZnLAnupQJzzfqWqkXcdURJIJMpUI8aL 9PrL7QmOYpoupmlyXagYwUJV8G77oYXcWQ/NoNZhlgAtBhxyWyH3qBjq6uIdsvp9 fu8x5aGPGHISHryXyU6TWrLhAmIZJskc3TdDA71jlFBFgKM2xoLcUo07EAw085h0 pwQfQDOgjwMYIlwKgB9UqIcxFrKFX3osaKDrFaVMA5nwb9PR+qb8QeSEThjg6hFb qD1YT90CgYEA4X72YXunl39twS4AkPmxqp1kpqxRsJtWiEHgxh5TIuyzXUSzxKdr SHlYX6lq1lwFmxhwvtSyUUh1cZSMoKwE6JrsvjGLMIjHCXq9vtH5TTG2eT+cw0BR r0aFJkfboNdZXU82lpm5qDzkVLfVPwDJ0o2QzeHu7EtQUp6Ud/Ka3e8CgYEA3V/T K0GdTGv/BZe7KkwPvpuRYncnTetsXFqxYI0uZnyEOr/sXbHmmPbVc090O0VUKwWO zfXlUY4Iwgyv6GarK88rnO7UX+oFRtSW9CD05c/KLdKJ9TjK0Yg5qjQLAy24MnDF OHzoqYRUuhC1qQrmRTFoWyzKJEF8PHiGqMHoASsCgYAd+cq22sFEmmP0sjDRFOBR VerzXSTe3Ud7hYZjz9QtaFnPpDphgf/4+miNDvBs3n7AR1d1hsDNnVw/ZQfss/FT GoUuI1flc8lBsVdX7oG9iUZAh/xG2F4DdtRsalD/6KCwjr8q9fSAMNgJiwaGAYzS uI7vT4F7V+etk/cYmt+LcQKBgQC46Q/kc9xGN3c/Xqwx+nK0ThG0Y77q8RkEU6UR 9xuo850nzaRL5wus/ZDxzo5R6+kQPoY4N4sjAjcCj8Jnp0qXP2c4oK24qCtcLLsi lFy7kUNZ3yDpOlT/jIBOUUZZk1jmmRfDxWI6JpT3DnoPB1GsvkZi0hjPC/wQLsSc NcvrHQKBgQCjpXKZzdnM6WTeq/9g4sAKZAR4tkD1mrY6d0wcCFyYA2YyCL1mXz2u BRcHXqc7AkEc+aTH7J/GKtaq9FIjiAEd+bB4S/xqyGcJcifzI48BGp/D59Tn6gEC YycZIhowbgQHaNUrfsPbD0FiNWVUH4J1kuJ4PZmqy9LP1Dy/fXNo1A== -----END RSA PRIVATE KEY-----'),('rsa_public_key','-----BEGIN PUBLIC KEY----- MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwv8C0VUeFwHNFKyEliu2 7X6kk5UzQswS8oCKEXzBgEUckLyIZqd3S/Zi6f3kkJ3D/3ReG6WunpRebBOzxrma VZHyCmoNZj9Vub29VKFyXU1AWW1QR6+elpJHc7GH2+GV9z7QBU0hEBFRgm9U//IZ A7HaW51kutajpVelu6fZaVIAKOyY6DyhMUcHERv38pvGmqM7hLQiNo6YyJCrYcXl JJn4L4WPfLZ/Rf0VQ31sAuF5LnrZYExGcycpw6XCcB7zaf/bKDSUDh+dob0YpNiG WfU6JKT32tQcnJHceoen0nv8ytktn2LJofZEQfLl5HUcU+tIkWznz4nLpsSaqnk2 JQIDAQAB -----END PUBLIC KEY-----'),('script_timeout','25'),('secpass_expireaccount','0'),('secpass_expirepass','0'),('secpass_forceold',''),('secpass_history','0'),('secpass_lockfailed','0'),('secpass_minlen','8'),('secpass_reqmixcase','on'),('secpass_reqnum','on'),('secpass_reqspec','on'),('secpass_unlocktime','60'),('selected_theme','modern'),('selective_debug',''),('selective_device_debug',''),('selective_plugin_debug',''),('sess_allowed_templates_lastchange','1583628707'),('settings_dns_primary',''),('settings_dns_secondary',''),('settings_dns_timeout','500'),('settings_from_email',''),('settings_from_name',''),('settings_how','0'),('settings_ping_mail','0'),('settings_sendmail_path',''),('settings_smtp_host','localhost'),('settings_smtp_port','25'),('settings_smtp_secure','none'),('settings_smtp_timeout','10'),('settings_smtp_username',''),('settings_test_email',''),('settings_wordwrap','120'),('snmp_auth_protocol','MD5'),('snmp_bulk_walk_size','10'),('snmp_community','public'),('snmp_context',''),('snmp_engine_id',''),('snmp_password',''),('snmp_port','161'),('snmp_priv_passphrase',''),('snmp_priv_protocol','DES'),('snmp_retries','3'),('snmp_security_level','authPriv'),('snmp_timeout','500'),('snmp_username',''),('snmp_version','2'),('spikekill_avgnan','last'),('spikekill_backupdir','/var/www/html/cacti/cache/spikekill/'),('spikekill_basetime','12:00am'),('spikekill_batch','0'),('spikekill_deviations','10'),('spikekill_method','2'),('spikekill_number','5'),('spikekill_outliers','5'),('spikekill_percent','1000'),('spikekill_purge','7856352'),('spine_log_level','0'),('stats_dsstats_HOURLY','Time:0.0951 RRDUser:0.0000 RRDSystem:0.0000 RRDReal:0.0000'),('stats_poller','Time:1.4263 Method:spine Processes:1 Threads:1 Hosts:1 HostsPerProcess:1 DataSources:30 RRDsProcessed:29'),('stats_recache_1','Poller:1 RecacheTime:0.0 DevicesRecached:0'),('storage_location','0'),('strip_domain',''),('title_size','10'),('unit_size','7'),('user_template','0');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings_tree`
--

DROP TABLE IF EXISTS `settings_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings_tree` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `graph_tree_item_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`,`graph_tree_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings_tree`
--

LOCK TABLES `settings_tree` WRITE;
/*!40000 ALTER TABLE `settings_tree` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings_tree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings_user`
--

DROP TABLE IF EXISTS `settings_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings_user` (
  `user_id` smallint(8) unsigned NOT NULL DEFAULT 0,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings_user`
--

LOCK TABLES `settings_user` WRITE;
/*!40000 ALTER TABLE `settings_user` DISABLE KEYS */;
INSERT INTO `settings_user` VALUES (1,'allow_graph_dates_in_future','on'),(1,'axis_font',''),(1,'axis_size','8'),(1,'custom_fonts',''),(1,'day_shift_end','18:00'),(1,'day_shift_start','07:00'),(1,'default_date_format','4'),(1,'default_datechar','1'),(1,'default_height','100'),(1,'default_rra_id','1'),(1,'default_timeshift','7'),(1,'default_timespan','3'),(1,'default_tree_id','1'),(1,'default_view_mode','3'),(1,'default_width','300'),(1,'expand_hosts',''),(1,'first_weekdayid','1'),(1,'hide_disabled','on'),(1,'legend_font',''),(1,'legend_size','10'),(1,'max_tree_width','300'),(1,'min_tree_width','170'),(1,'num_columns','2'),(1,'num_columns_tree','2'),(1,'page_refresh','300'),(1,'preview_graphs_per_page','20'),(1,'realtime_mode','2'),(1,'selected_theme','modern'),(1,'sess_allowed_templates_lastchange','1583628707'),(1,'show_graph_title','on'),(1,'thumbnail_section_preview','on'),(1,'thumbnail_section_tree_2',''),(1,'title_font',''),(1,'title_size','12'),(1,'tree_history','on'),(1,'treeview_graphs_per_page','20'),(1,'unit_font',''),(1,'unit_size','8'),(1,'user_language','en-US');
/*!40000 ALTER TABLE `settings_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings_user_group`
--

DROP TABLE IF EXISTS `settings_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings_user_group` (
  `group_id` smallint(8) unsigned NOT NULL DEFAULT 0,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`group_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Stores the Default User Group Graph Settings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings_user_group`
--

LOCK TABLES `settings_user_group` WRITE;
/*!40000 ALTER TABLE `settings_user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `address1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `address2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `state` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `country` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `timezone` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `latitude` decimal(13,10) NOT NULL DEFAULT 0.0000000000,
  `longitude` decimal(13,10) NOT NULL DEFAULT 0.0000000000,
  `zoom` tinyint(3) unsigned DEFAULT NULL,
  `alternate_id` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `notes` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `city` (`city`),
  KEY `state` (`state`),
  KEY `postal_code` (`postal_code`),
  KEY `country` (`country`),
  KEY `alternate_id` (`alternate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Contains information about customer sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (1,'Edge','','','','','','','',0.0000000000,0.0000000000,0,'',''),(2,'Core','','','','','','','',0.0000000000,0.0000000000,0,'','');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snmp_query`
--

DROP TABLE IF EXISTS `snmp_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snmp_query` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `xml_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `graph_template_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `data_input_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snmp_query`
--

LOCK TABLES `snmp_query` WRITE;
/*!40000 ALTER TABLE `snmp_query` DISABLE KEYS */;
INSERT INTO `snmp_query` VALUES (1,'3a54461cc68c5a1bfb5500d0f6400ec1','<path_cacti>/resource/script_server/cpoller.xml','Cacti Stats - Data Collector Stats','Poller Statistics for Cacti\'s Main and Remote Data Collectors',0,12),(2,'0b2d6a21fdc0688028d66441ec0bfaab','<path_cacti>/resource/script_server/webseer.xml','Cacti Stats - WebSeer Service Checks','WebSeer Service Check Statistics',0,12),(3,'77d589f1eceb0a84fe25d8453b4f8749','<path_cacti>/resource/script_server/gexport.xml','Cacti Stats - Graph Exports','Graph Export Statistics for the Gexport Plugin',0,12),(4,'d75e406fdeca4fcef45b8be3a9a63cbc','<path_cacti>/resource/snmp_queries/interface.xml','SNMP - Interface Statistics','Queries a host for a list of monitorable interfaces',0,2),(5,'8ffa36c1864124b38bcda2ae9bd61f46','<path_cacti>/resource/script_queries/unix_disk.xml','Unix - Get Mounted Partitions','Queries a list of mounted partitions on a unix-based host with the',0,11),(6,'3c1b27d94ad208a0090f293deadde753','<path_cacti>/resource/snmp_queries/net-snmp_disk.xml','Net-SNMP -  Get Monitored Partitions','Retrieves a list of monitored partitions/disks from a net-snmp enabled host.',0,2),(7,'9343eab1f4d88b0e61ffc9d020f35414','<path_cacti>/resource/script_server/host_disk.xml','SNMP - Get Mounted Partitions','Gets a list of partitions using SNMP',0,12),(8,'0d1ab53fe37487a5d0b9e1d3ee8c1d0d','<path_cacti>/resource/script_server/host_cpu.xml','SNMP - Get Processor Information','Gets usage for each processor in the system using the host MIB.',0,12),(9,'edb9fb7e6656f44e34652960625032b5','<path_cacti>/resource/snmp_queries/net-snmp_devio.xml','Net-SNMP - Get Device I/O','Retrieves the I/O for all disk and memory devices',0,2),(10,'951e3c86c2d1e2cb3e270c8ae30ba17a','<path_cacti>/resource/snmp_queries/snmp_informant_standard_cpu.xml','SNMP_Informant_Standard - CPU Statistics','Query CPU Stats',0,2),(11,'72ccd11613ba583f8414745ce9ecbaed','<path_cacti>/resource/snmp_queries/snmp_informant_standard_disk.xml','SNMP_Informant_Standard - Disk Statistics','Query Disk Stats',0,2),(12,'96962f601f431a22a513307bf76b70e1','<path_cacti>/resource/snmp_queries/snmp_informant_standard_memory.xml','SNMP_Informant_Standard - Memory Statistics','Query Memory Statistics',0,2),(13,'db5fe4291ef46d2eeffceb5acf57a268','<path_cacti>/resource/snmp_queries/snmp_informant_standard_network.xml','SNMP_Informant_Standard - Network Statistics','Query Network Stats',0,2),(14,'402301c99ebc9f50793e1c7b93c50ec4','<path_cacti>/resource/snmp_queries/snmp_informant_standard_objects.xml','SNMP_Informant_Standard - Objects Statistics','Query Object Stats',0,2);
/*!40000 ALTER TABLE `snmp_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snmp_query_graph`
--

DROP TABLE IF EXISTS `snmp_query_graph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snmp_query_graph` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `snmp_query_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `graph_template_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `graph_template_id_name` (`graph_template_id`,`name`),
  KEY `snmp_query_id_name` (`snmp_query_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snmp_query_graph`
--

LOCK TABLES `snmp_query_graph` WRITE;
/*!40000 ALTER TABLE `snmp_query_graph` DISABLE KEYS */;
INSERT INTO `snmp_query_graph` VALUES (1,'cfbbdbaba184a0fbea76fe33c64772e7',1,'Poller Items',24),(2,'ab2d927519ac4d7149785e457efedb5f',1,'Runtime',23),(3,'5296b23bc65c96473a863c5ca4222abf',1,'Processes/Threads',25),(4,'41f997af9bf01f3e0270f2ca4fccc55e',1,'Recache Stats',26),(5,'96b6db904fb34890d1e4befb3ef82836',2,'Timing',27),(6,'5e4c63456ecdccef5e461787a07b5e59',2,'Status',30),(7,'a8e3874adad4ec52b50279d1dcaae859',2,'Download Size',28),(8,'e53704d46bbd650b7766953c3a12733b',2,'Download Speed',29),(9,'87b10a33ccad3fb09b684f0d552b6bc7',3,'Export Duration',32),(10,'1d635a54202a94f9fc6ee27e4a2b2be8',3,'Exported Graphs',31),(11,'a4b829746fb45e35e10474c36c69c0cf',4,'In/Out Errors/Discarded Packets',37),(12,'01e33224f8b15997d3d09d6b1bf83e18',4,'In/Out Non-Unicast Packets',39),(13,'1e6edee3115c42d644dbd014f0577066',4,'In/Out Unicast Packets',38),(14,'ab93b588c29731ab15db601ca0bc9dec',4,'In/Out Bytes (64-bit Counters)',40),(15,'ae34f5f385bed8c81a158bf3030f1089',4,'In/Out Bits',36),(16,'1e16a505ddefb40356221d7a50619d91',4,'In/Out Bits (64-bit Counters)',36),(17,'d1e0d9b8efd4af98d28ce2aad81a87e7',4,'In/Out Bytes',40),(18,'ed7f68175d7bb83db8ead332fc945720',4,'In/Out Bits with 95th Percentile',41),(19,'f85386cd2fc94634ef167c7f1e5fbcd0',4,'In/Out Bits with Total Bandwidth',42),(20,'7d309bf200b6e3cdb59a33493c2e58e0',4,'In/Out Bytes with Total Bandwidth',43),(21,'a06c23783baa5022299706f5ff2a56e7',4,'In/Out Bits (64-bit, 95th)',41),(22,'1e24c56421c50a2114c15afd159a538c',4,'In/Out Bits (64-bit, BW)',42),(23,'fefe4ae1ec313b6875d6502319f08cde',4,'In/Out Bytes (64-bit, BW)',43),(24,'c5792b18bf1263b5bf3826f9196376d9',4,'In/Out (Broadcasts)',45),(25,'524e65b03f12b772f5c5bdad3f9dd783',4,'In/Out (Multicasts)',44),(26,'a0b3e7b63c2e66f9e1ea24a16ff245fc',5,'Disk Space',52),(27,'da43655bf1f641b07579256227806977',6,'Disk Space',62),(28,'46c4ee688932cf6370459527eceb8ef3',7,'Disk Space',63),(29,'4a515b61441ea5f27ab7dee6c3cb7818',8,'Utilization',64),(30,'a9290ce34d38bb09074ee5d96679694b',9,'Bytes Read/Written',65),(31,'44735d5afb573d8a19af9d0d85d07c4d',9,'Load Averages',66),(32,'2bb111ab931b86766db8e67150a6b5a2',9,'Reads/Writes',67),(33,'0f60de19732e692ea4757b6fb7b31415',4,'Interface Operational status',75),(34,'80c0800150ce5b9e2046bd04beb12b29',4,'In/Out Multicast Packets (64-bit Counters)',74),(35,'ed01d29687f7d3801cfcf82013932205',4,'In/Out Multicast Packets',74),(36,'8b0c04281a29d73a7767a9fa6154c71c',10,'CPU Statistics',80),(37,'53334c4e33a57b215f92b532fc994ad6',11,'Disk Statistics (I/O)',81),(38,'abf0b2d599f96a60e234cfbee5b8e85d',11,'Disk Statistics (%\'s)',82),(39,'079c54e9a4530261c8543c34541e4123',11,'Disk Statistics (Metrics)',83),(40,'27216b45c81063ab9a0ed08048319f25',12,'Memory Stats (Usage)',84),(41,'96ed1bfce95a7215ad2fcf75d7ec51f8',12,'Memory Stats (Paging)',85),(42,'af3d9f717b2a8eb094db3dbf1f06d840',13,'Network Statistics',86),(43,'02af037a73f2ddf8fcca09588c38ccf9',13,'Network Statistics (Packets)',87),(44,'690cd3c3c722dcd91d34d6271ff4b588',14,'Object Statistics',88);
/*!40000 ALTER TABLE `snmp_query_graph` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snmp_query_graph_rrd`
--

DROP TABLE IF EXISTS `snmp_query_graph_rrd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snmp_query_graph_rrd` (
  `snmp_query_graph_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `data_template_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `data_template_rrd_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `snmp_field_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`snmp_query_graph_id`,`data_template_id`,`data_template_rrd_id`),
  KEY `data_template_rrd_id` (`data_template_rrd_id`),
  KEY `snmp_query_graph_id` (`snmp_query_graph_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snmp_query_graph_rrd`
--

LOCK TABLES `snmp_query_graph_rrd` WRITE;
/*!40000 ALTER TABLE `snmp_query_graph_rrd` DISABLE KEYS */;
INSERT INTO `snmp_query_graph_rrd` VALUES (1,18,47,'getSNMP'),(1,18,48,'getScript'),(1,18,49,'getScriptServer'),(2,17,43,'pollerTime'),(2,17,44,'maxTime'),(2,17,45,'minTime'),(2,17,46,'avgTime'),(3,19,50,'threadCount'),(3,19,51,'processCount'),(4,20,52,'recacheDevices'),(4,20,53,'recacheTime'),(5,21,54,'redirectTime'),(5,21,55,'totalTime'),(5,21,56,'connectTime'),(5,21,57,'lookupTime'),(6,24,60,'checkStatus'),(7,22,58,'downloadSize'),(8,23,59,'downloadSpeed'),(9,26,62,'lastRuntime'),(10,25,61,'totalGraphs'),(11,31,68,'ifInErrors'),(11,31,69,'ifInDiscards'),(11,31,70,'ifOutDiscards'),(11,31,71,'ifOutErrors'),(12,33,74,'ifOutNUcastPkts'),(12,33,75,'ifInNUcastPkts'),(13,32,72,'ifInUcastPkts'),(13,32,73,'ifOutUcastPkts'),(14,30,66,'ifHCInOctets'),(14,30,67,'ifHCOutOctets'),(15,30,66,'ifInOctets'),(15,30,67,'ifOutOctets'),(16,30,66,'ifHCInOctets'),(16,30,67,'ifHCOutOctets'),(17,30,66,'ifInOctets'),(17,30,67,'ifOutOctets'),(18,30,66,'ifInOctets'),(18,30,67,'ifOutOctets'),(19,30,66,'ifInOctets'),(19,30,67,'ifOutOctets'),(20,30,66,'ifInOctets'),(20,30,67,'ifOutOctets'),(21,30,66,'ifHCInOctets'),(21,30,67,'ifHCOutOctets'),(22,30,66,'ifHCInOctets'),(22,30,67,'ifHCOutOctets'),(23,30,66,'ifHCInOctets'),(23,30,67,'ifHCOutOctets'),(24,33,74,'ifOutBroadcastPkts'),(24,33,75,'ifInBroadcastPkts'),(25,32,72,'ifInMulticastPkts'),(25,32,73,'ifOutMulticastPkts'),(26,41,85,'dskAvailable'),(26,41,86,'dskUsed'),(27,58,105,'dskAvail'),(27,58,106,'dskUsed'),(28,59,107,'hrStorageUsed'),(28,59,108,'hrStorageSize'),(29,60,109,'hrProcessorLoad'),(30,61,111,'diskIONWritten'),(30,61,116,'diskIONRead'),(31,61,113,'diskIOLA1'),(31,61,114,'diskIOLA5'),(31,61,115,'diskIOLA15'),(32,61,110,'diskIOReads'),(32,61,112,'diskIOWrites'),(33,73,136,'ifOperStatus'),(34,72,134,'ifHCInMulticastPkts'),(34,72,135,'ifHCOutMulticastPkts'),(35,72,134,'ifInMulticastPkts'),(35,72,135,'ifOutMulticastPkts'),(36,78,145,'cpuDPCRate'),(36,78,146,'cpuDPCsQueuedPerSec'),(36,78,147,'cpuInterruptsPerSec'),(36,78,148,'cpuPercentDPCTime'),(36,78,149,'cpuPercentInterruptTimeTOOLONG'),(36,78,150,'cpuPercentPrivilegedTimeTOOLONG'),(36,78,151,'cpuPercentProcessorTimeTOOLONG'),(36,78,152,'cpuPercentUserTime'),(37,79,153,'DiskWriteBytesPerSec'),(37,79,154,'DiskReadBytesPerSec'),(37,79,155,'DiskBytesPerSec'),(38,80,156,'PercentDiskTime'),(38,80,157,'PercentDiskReadTime'),(38,80,158,'PercentDiskWriteTime'),(38,80,159,'PercentFreeSpace'),(38,80,160,'PercentIdleTime'),(39,81,161,'DiskReadsPerSec'),(39,81,162,'DiskTransfersPerSec'),(39,81,163,'AvgDiskQueueLength'),(39,81,164,'CurrentDiskQueueLength'),(39,81,165,'AvgDiskReadQueueLength'),(39,81,166,'AvgDiskSecPerRead'),(39,81,167,'AvgDiskWriteQueueLength'),(39,81,168,'DiskWritesPerSec'),(39,81,169,'FreeMegabytes'),(39,81,170,'SplitIOPerSec'),(39,81,171,'AvgDiskSecPerTransfer'),(39,81,172,'AvgDiskSecPerWrite'),(40,82,173,'sinfMemComBytes'),(40,82,174,'sinfMemPNonpagedByt'),(40,82,175,'sinfMemAvailBytes'),(40,82,176,'sinfMemPPagedBytes'),(40,82,177,'sinfMemPPagedResByt'),(40,82,178,'sinfMemSysCodeResB'),(40,82,179,'sinfMemSysCodeTotB'),(40,82,180,'sinfMemSysCacheResB'),(40,82,181,'sinfMemCacheBytesPk'),(40,82,182,'sinfMemSysDrvResB'),(40,82,183,'sinfMemSysDrvTotB'),(41,83,184,'sinfMemPagesOutPS'),(41,83,185,'sinfMemPagesInputPS'),(41,83,186,'sinfMemPageFaultsPS'),(41,83,187,'sinfMemPagesPerSec'),(42,84,188,'netBytesRecPerSec'),(42,84,189,'netBytSentPerSec'),(42,84,190,'netBytTotPerSec'),(42,84,191,'netCurBandwidth'),(42,84,192,'netOutQueueLength'),(43,85,193,'netPktsRecErr'),(43,85,194,'netPktsOutDiscarded'),(43,85,195,'netPktsOutErrors'),(43,85,196,'netPktsRecDisc'),(43,85,197,'netPktsRecUnk'),(43,85,198,'netPktsRecPerSec'),(43,85,199,'netPktsSentPerSec'),(43,85,200,'netPacketsPerSec'),(44,86,201,'objectsprocesses'),(44,86,202,'objectsthreads');
/*!40000 ALTER TABLE `snmp_query_graph_rrd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snmp_query_graph_rrd_sv`
--

DROP TABLE IF EXISTS `snmp_query_graph_rrd_sv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snmp_query_graph_rrd_sv` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `snmp_query_graph_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `data_template_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `sequence` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `field_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `snmp_query_graph_id` (`snmp_query_graph_id`),
  KEY `data_template_id` (`data_template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snmp_query_graph_rrd_sv`
--

LOCK TABLES `snmp_query_graph_rrd_sv` WRITE;
/*!40000 ALTER TABLE `snmp_query_graph_rrd_sv` DISABLE KEYS */;
INSERT INTO `snmp_query_graph_rrd_sv` VALUES (1,'6537b3209e0697fbec278e94e7317b52',11,31,1,'name','|host_description| - Errors - |query_ifIP| - |query_ifName|'),(2,'6d3f612051016f48c951af8901720a1c',11,31,2,'name','|host_description| - Errors - |query_ifName|'),(3,'62bc981690576d0b2bd0041ec2e4aa6f',11,31,3,'name','|host_description| - Errors - |query_ifIP|/|query_ifDescr|'),(4,'adb270d55ba521d205eac6a21478804a',11,31,4,'name','|host_description| - Errors - |query_ifDescr|'),(5,'77065435f3bbb2ff99bc3b43b81de8fe',12,33,1,'name','|host_description| - Non-Unicast Packets - |query_ifIP| - |query_ifName|'),(6,'240d8893092619c97a54265e8d0b86a1',12,33,2,'name','|host_description| - Non-Unicast Packets - |query_ifName|'),(7,'4b200ecf445bdeb4c84975b74991df34',12,33,3,'name','|host_description| - Non-Unicast Packets - |query_ifIP|/|query_ifDescr|'),(8,'d6da3887646078e4d01fe60a123c2179',12,33,4,'name','|host_description| - Non-Unicast Packets - |query_ifDescr|'),(9,'ce7769b97d80ca31d21f83dc18ba93c2',13,32,1,'name','|host_description| - Unicast Packets - |query_ifIP| - |query_ifName|'),(10,'1ee1f9717f3f4771f7f823ca5a8b83dd',13,32,2,'name','|host_description| - Unicast Packets - |query_ifName|'),(11,'a7dbd54604533b592d4fae6e67587e32',13,32,3,'name','|host_description| - Unicast Packets - |query_ifIP|/|query_ifDescr|'),(12,'b148fa7199edcf06cd71c89e5c5d7b63',13,32,4,'name','|host_description| - Unicast Packets - |query_ifDescr|'),(13,'c582d3b37f19e4a703d9bf4908dc6548',14,30,1,'name','|host_description| - Traffic - |query_ifIP| - |query_ifName|'),(14,'ce0b9c92a15759d3ddbd7161d26a98b7',14,30,1,'rrd_maximum','|query_ifSpeed|'),(15,'e1be83d708ed3c0b8715ccb6517a0365',14,30,2,'name','|host_description| - Traffic - |query_ifName|'),(16,'57a9ae1f197498ca8dcde90194f61cbc',14,30,3,'name','|host_description| - Traffic - |query_ifIP|/|query_ifDescr|'),(17,'0110e120981c7ff15304e4a85cb42cbe',14,30,4,'name','|host_description| - Traffic - |query_ifDescr|'),(18,'87a659326af8c75158e5142874fd74b0',15,30,1,'name','|host_description| - Traffic - |query_ifIP| - |query_ifName|'),(19,'7e093c535fa3d810fa76fc3d8c80c94b',15,30,1,'rrd_maximum','|query_ifSpeed|'),(20,'14aa2dead86bbad0f992f1514722c95e',15,30,2,'name','|host_description| - Traffic - |query_ifName|'),(21,'70390712158c3c5052a7d830fb456489',15,30,3,'name','|host_description| - Traffic - |query_ifIP|/|query_ifDescr|'),(22,'084efd82bbddb69fb2ac9bd0b0f16ac6',15,30,4,'name','|host_description| - Traffic - |query_ifDescr|'),(23,'2e8b27c63d98249096ad5bc320787f43',16,30,1,'name','|host_description| - Traffic - |query_ifIP| - |query_ifName|'),(24,'e85ddc56efa677b70448f9e931360b77',16,30,1,'rrd_maximum','|query_ifSpeed|'),(25,'8d820d091ec1a9683cfa74a462f239ee',16,30,2,'name','|host_description| - Traffic - |query_ifName|'),(26,'62a47c18be10f273a5f5a13a76b76f54',16,30,3,'name','|host_description| - Traffic - |query_ifIP|/|query_ifDescr|'),(27,'37bb8c5b38bb7e89ec88ea7ccacf44d4',16,30,4,'name','|host_description| - Traffic - |query_ifDescr|'),(28,'db6547fe6d8a04e7d007eb8aab9d4ec5',16,30,5,'name','|host_description| - Traffic - |query_ifAlias|'),(29,'c7ee2110bf81639086d2da03d9d88286',17,30,1,'name','|host_description| - Traffic - |query_ifIP| - |query_ifName|'),(30,'27eb220995925e1a5e0e41b2582a2af6',17,30,1,'rrd_maximum','|query_ifSpeed|'),(31,'8ef8ae2ef548892ab95bb6c9f0b3170e',17,30,2,'name','|host_description| - Traffic - |query_ifName|'),(32,'3a0f707d1c8fd0e061b70241541c7e2e',17,30,3,'name','|host_description| - Traffic - |query_ifIP|/|query_ifDescr|'),(33,'2347e9f53564a54d43f3c00d4b60040d',17,30,4,'name','|host_description| - Traffic - |query_ifDescr|'),(34,'7e87efd0075caba9908e2e6e569b25b0',18,30,1,'name','|host_description| - Traffic - |query_ifIP| - |query_ifName|'),(35,'3b018f789ff72cc5693ef79e3a794370',18,30,1,'rrd_maximum','|query_ifSpeed|'),(36,'dd28d96a253ab86846aedb25d1cca712',18,30,2,'name','|host_description| - Traffic - |query_ifName|'),(37,'ce425fed4eb3174e4f1cde9713eeafa0',18,30,3,'name','|host_description| - Traffic - |query_ifIP|/|query_ifDescr|'),(38,'d0d05156ddb2c65181588db4b64d3907',18,30,4,'name','|host_description| - Traffic - |query_ifDescr|'),(39,'b225229dbbb48c1766cf90298674ceed',19,30,1,'name','|host_description| - Traffic - |query_ifIP| - |query_ifName|'),(40,'e9ab404a294e406c20fdd30df766161f',19,30,1,'rrd_maximum','|query_ifSpeed|'),(41,'c79248ddbbd195907260887b021a055d',19,30,2,'name','|host_description| - Traffic - |query_ifName|'),(42,'12a6750d973b7f14783f205d86220082',19,30,3,'name','|host_description| - Traffic - |query_ifIP|/|query_ifDescr|'),(43,'25b151fcfe093812cb5c208e36dd697e',19,30,4,'name','|host_description| - Traffic - |query_ifDescr|'),(44,'119578a4f01ab47e820b0e894e5e5bb3',20,30,1,'name','|host_description| - Traffic - |query_ifIP| - |query_ifName|'),(45,'fdc4cb976c4b9053bfa2af791a21c5b5',20,30,1,'rrd_maximum','|query_ifSpeed|'),(46,'940e57d24b2623849c77b59ed05931b9',20,30,2,'name','|host_description| - Traffic - |query_ifName|'),(47,'0f045eab01bbc4437b30da568ed5cb03',20,30,3,'name','|host_description| - Traffic - |query_ifIP|/|query_ifDescr|'),(48,'bd70bf71108d32f0bf91b24c85b87ff0',20,30,4,'name','|host_description| - Traffic - |query_ifDescr|'),(49,'af8c10bb98e3d96d7aeed76069f5d8f6',21,30,1,'name','|host_description| - Traffic - |query_ifIP| - |query_ifName| '),(50,'d5fe4ab8a8049c76715b11367544a77b',21,30,1,'rrd_maximum','|query_ifSpeed|'),(51,'eb9aa71f654327ecea55af11c6ff06ac',21,30,2,'name','|host_description| - Traffic - |query_ifName|'),(52,'afe143588235f0465993fd642dbc2ad9',21,30,3,'name','|host_description| - Traffic - |query_ifIP|/|query_ifDescr|'),(53,'424ebeaaef4a5cbffdc4611beeb7c19c',21,30,4,'name','|host_description| - Traffic - |query_ifDescr|'),(54,'694c4ef8e495357d8303d1c127d0c55e',22,30,1,'name','|host_description| - Traffic - |query_ifIP| - |query_ifName|'),(55,'0a772cfb504e15d7e784dd0e73ced97a',22,30,1,'rrd_maximum','|query_ifSpeed|'),(56,'114c55114ede9f492d84b1c79d3bbae6',22,30,2,'name','|host_description| - Traffic - |query_ifName| '),(57,'8aa4f743291cd2afdea20a4180e6eb42',22,30,3,'name','|host_description| - Traffic - |query_ifIP|/|query_ifDescr|'),(58,'3d4ba44d5e6a7bbcd5a448b9ef113c59',22,30,4,'name','|host_description| - Traffic - |query_ifDescr|'),(59,'e29d0a2547c6a48e73ce2c800e308515',23,30,1,'name','|host_description| - Traffic - |query_ifIP| - |query_ifName|'),(60,'cf780d419b924d0cbbb173b9a4918208',23,30,1,'rrd_maximum','|query_ifSpeed|'),(61,'3aeeb54a14baa08beaa59a1cd6af12c8',23,30,2,'name','|host_description| - Traffic - |query_ifName|'),(62,'30aaee4b45f97ac74641442e17e4527e',23,30,3,'name','|host_description| - Traffic - |query_ifIP|/|query_ifDescr|'),(63,'da2842ddfe7ea7d7b06266cc107169aa',23,30,4,'name','|host_description| - Traffic - |query_ifDescr|'),(64,'fc4e456b3fe4b712c943700ef1b3be80',24,33,1,'name','|host_description| - Broadcast Packets - |query_ifAlias| '),(65,'aea995fae5b2500b69819a09d20e9760',24,33,2,'name','|host_description| - Broadcast Packets - |query_ifName|'),(66,'8e07b64fa0767a318ec6d0320c3f9e2c',24,33,3,'name','|host_description| - Broadcast Packets - |query_ifIP| (|query_ifDescr|)'),(67,'9e7c0ec6d0025a509af6a510804c2488',24,33,4,'name','|host_description| - Broadcast Packets - |query_ifDescr|/|query_ifIndex|'),(68,'87418ca7ce94c355ba7bbc8625f53f92',25,32,1,'name','|host_description| - Multicast Packets - |query_ifAlias|'),(69,'ab0e5022e10f6529ac66772815be583f',25,32,2,'name','|host_description| - Multicast Packets - |query_ifName|'),(70,'27da5a787ff471f3da8bde88f6ecd4c9',25,32,3,'name','|host_description| - Multicast Packets - |query_ifIP| (|query_ifDescr|)'),(71,'3ac3c16381774c78791b5b568d06bc4f',25,32,4,'name','|host_description| - Multicast Packets - |query_ifDescr|/|query_ifIndex|'),(72,'cb09784ba05e401a3f1450126ed1e395',26,41,1,'name','|host_description| - Free Space - |query_dskDevice|'),(73,'5d3a8b2f4a454e5b0a1494e00fe7d424',27,58,1,'name','|host_description| - Partition - |query_dskDevice|'),(74,'a3f280327b1592a1a948e256380b544f',28,59,1,'name','|host_description| - Used Space - |query_hrStorageDescr|'),(75,'b5a724edc36c10891fa2a5c370d55b6f',29,60,1,'name','|host_description| - CPU Utilization - CPU|query_hrProcessorFrwID|'),(76,'7b002f4ea6be0ce6df7660fc519d49c6',33,73,1,'name','|host_description| - Status - |query_ifIP| - |query_ifName|'),(77,'3eb135d33c76f934eb996ae222a197e0',33,73,2,'name','|host_description| - Status - |query_ifIP| - |query_ifName| - |query_ifAlias|'),(78,'458c7cffd078819bedd02d2222bcdae4',33,73,3,'name','|host_description| - Status - |query_ifName|'),(79,'8f6ba6b6dc40463e9542340263ada65a',16,30,1,'name','|host_description| - Traffic - |query_ifName| |query_ifAlias|'),(80,'747f7cb1b49621b8d51ed27de53aed77',16,30,1,'name','|host_description| - Traffic - |query_ifIP| - |query_ifName|'),(81,'678ca9fbf50174f636b5ffe94db17567',16,30,1,'rrd_maximum','|query_ifSpeed|'),(82,'63159199bd9cbd800ea6ba8e1c7ba785',16,30,2,'name','|host_description| - Traffic - |query_ifName|'),(83,'f87264d2981d8f0b1a48c3f53abf9dcd',16,30,3,'name','|host_description| - Traffic - |query_ifIP|/|query_ifDescr|'),(84,'9569f0760c8cc01ff01770f11299ba9a',16,30,4,'name','|host_description| - Traffic - |query_ifDescr|'),(85,'b75108c2597465d89da5f520a51d4c22',16,30,5,'name','|host_hostname| - Traffic - |query_ifIP| - |query_ifName|'),(86,'2d4cfd3175addffa21f3bed7866a2728',16,30,6,'name','|host_hostname| - Traffic - |query_ifName|'),(87,'52f6da941e2f0061ff5aaeda09eadaaa',16,30,7,'name','|host_hostname| - Traffic - |query_ifIP|/|query_ifDescr|'),(88,'ad649786a382ff5f7df5ec75c3839837',16,30,8,'name','|host_hostname| - Traffic - |query_ifDescr|'),(89,'ce9c677474648cf1d4f13911864faf05',13,32,3,'name','|host_description| - Unicast Packets - |query_ifIP|/|query_ifDescr|'),(90,'8428ba899734cb884531f64a5d480cd6',34,72,1,'name','|host_description| - Multicast Packets - |query_ifIP| - |query_ifName|'),(91,'e382668069d7ea7f24bd354b6309f7c4',34,72,2,'name','|host_description| - Multicast Packets - |query_ifName|'),(92,'f25d337fbbfdda8abbf37b7695cf1318',34,72,3,'name','|host_description| - Multicast Packets - |query_ifIP|/|query_ifDescr|'),(93,'f693c354e0d08a795d171caa9e5802af',34,72,4,'name','|host_description| - Multicast Packets - |query_ifDescr|'),(94,'351a07dbd05db4af837c85640e4a7381',11,31,5,'name','|host_hostname| - Errors - |query_ifIP| - |query_ifName|'),(95,'ebaf146751134e303fee0e138ba47d3f',11,31,6,'name','|host_hostname| - Errors - |query_ifName|'),(96,'0c5e754d1a9781d8127387b2bfd8c7fc',11,31,7,'name','|host_hostname| - Errors - |query_ifIP|/|query_ifDescr|'),(97,'11f53e7503b618063c669b326cfa83e6',11,31,8,'name','|host_hostname| - Errors - |query_ifDescr|'),(98,'f4e7fdff7e90e20109933f11268612c9',15,30,3,'name','|host_description| - Traffic - |query_ifName|'),(99,'f79587c8b9524ffd726ab5e722e49860',15,30,6,'name','|host_hostname| - Traffic - |query_ifIP| - |query_ifName|'),(100,'c7fd0c7a5673f9d96c7e572193cabf0e',15,30,7,'name','|host_hostname| - Traffic - |query_ifName|'),(101,'538f3c1da362c9afca2e37c11e00bc5f',15,30,8,'name','|host_hostname| - Traffic - |query_ifIP|/|query_ifDescr|'),(102,'03d3d2160aabd71b307287269072f052',15,30,9,'name','|host_hostname| - Traffic - |query_ifDescr|'),(103,'8884c46843591d83b290d43c2eb61cee',35,72,1,'name','|host_description| - Multicast Packets - |query_ifIP| - |query_ifName|'),(104,'442499d4f6c05c4f276338dff1934d03',35,72,2,'name','|host_description| - Multicast Packets - |query_ifName|'),(105,'e6938caf6ce870bb380658c547448a92',35,72,3,'name','|host_description| - Multicast Packets - |query_ifIP|/|query_ifDescr|'),(106,'e338e3e7b8da3de30efb21fa3474fbf5',35,72,4,'name','|host_description| - Multicast Packets - |query_ifDescr|');
/*!40000 ALTER TABLE `snmp_query_graph_rrd_sv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snmp_query_graph_sv`
--

DROP TABLE IF EXISTS `snmp_query_graph_sv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snmp_query_graph_sv` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `snmp_query_graph_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `sequence` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `field_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `snmp_query_graph_id` (`snmp_query_graph_id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snmp_query_graph_sv`
--

LOCK TABLES `snmp_query_graph_sv` WRITE;
/*!40000 ALTER TABLE `snmp_query_graph_sv` DISABLE KEYS */;
INSERT INTO `snmp_query_graph_sv` VALUES (1,'0180de36c2fc1b1c3d929705cdaadfc6',11,1,'title','|host_description| - Errors - |query_ifAlias|'),(2,'299d3434851fc0d5c0e105429069709d',11,1,'title','|host_description| - Errors - |query_ifName|'),(3,'8c8860b17fd67a9a500b4cb8b5e19d4b',11,2,'title','|host_description| - Errors - |query_ifIP| (|query_ifDescr|)'),(4,'d96360ae5094e5732e7e7496ceceb636',11,3,'title','|host_description| - Errors - |query_ifDescr|/|query_ifIndex|'),(5,'6a1d5e477fd0b8a4d743993be0fa2c8c',12,1,'title','|host_description| - Non-Unicast Packets - |query_ifAlias|'),(6,'750a290cadc3dc60bb682a5c5f47df16',12,1,'title','|host_description| - Non-Unicast Packets - |query_ifName|'),(7,'bde195eecc256c42ca9725f1f22c1dc0',12,2,'title','|host_description| - Non-Unicast Packets - |query_ifIP| (|query_ifDescr|)'),(8,'d9e97d22689e4ffddaca23b46f2aa306',12,3,'title','|host_description| - Non-Unicast Packets - |query_ifDescr|/|query_ifIndex|'),(9,'54f5a5508fc525a15bc2be83a880e0c9',13,1,'title','|host_description| - Unicast Packets - |query_ifAlias|'),(10,'48ceaba62e0c2671a810a7f1adc5f751',13,1,'title','|host_description| - Unicast Packets - |query_ifName|'),(11,'d6258884bed44abe46d264198adc7c5d',13,2,'title','|host_description| - Unicast Packets - |query_ifIP| (|query_ifDescr|)'),(12,'6eb58d9835b2b86222306d6ced9961d9',13,3,'title','|host_description| - Unicast Packets - |query_ifDescr|/|query_ifIndex|'),(13,'74c33dd7c052d14a8224148ab3fe23ae',14,1,'title','|host_description| - Traffic - |query_ifAlias|'),(14,'0a5eb36e98c04ad6be8e1ef66caeed3c',14,1,'title','|host_description| - Traffic - |query_ifName|'),(15,'4c4386a96e6057b7bd0b78095209ddfa',14,2,'title','|host_description| - Traffic - |query_ifIP| (|query_ifDescr|)'),(16,'fd3a384768b0388fa64119fe2f0cc113',14,3,'title','|host_description| - Traffic - |query_ifDescr|/|query_ifIndex|'),(17,'aafaab75d93c10a760d600c4ab4a742c',15,2,'title','|host_description| - Traffic - |query_ifAlias|'),(18,'bda15298139ad22bdc8a3b0952d4e3ab',15,2,'title','|host_description| - Traffic - |query_ifIP| (|query_ifDescr|)'),(19,'29e48483d0471fcd996bfb702a5960aa',15,3,'title','|host_description| - Traffic - |query_ifDescr|/|query_ifIndex|'),(20,'49dca5592ac26ff149a4fbd18d690644',15,1,'title','|host_description| - Traffic - |query_ifName|'),(21,'3f42d358965cb94ce4f708b59e04f82b',16,1,'title','|host_description| - Traffic - |query_ifName|'),(22,'69c14fbcc23aecb9920b3cdad7f89901',16,3,'title','|host_description| - Traffic - |query_ifDescr|/|query_ifIndex|'),(23,'a1d061ff7fb9875b29c54de4fadddcdc',16,3,'title','|host_description| - Traffic - |query_ifAlias|'),(24,'45f44b2f811ea8a8ace1cbed8ef906f1',16,2,'title','|host_description| - Traffic - |query_ifIP| (|query_ifDescr|)'),(25,'a5899a68c68e50959a099d7ac591873a',17,1,'title','|host_description| - Traffic - |query_ifAlias|'),(26,'7fb4a267065f960df81c15f9022cd3a4',17,1,'title','|host_description| - Traffic - |query_ifName|'),(27,'e403f5a733bf5c8401a110609683deb3',17,2,'title','|host_description| - Traffic - |query_ifIP| (|query_ifDescr|)'),(28,'809c2e80552d56b65ca496c1c2fff398',17,3,'title','|host_description| - Traffic - |query_ifDescr|/|query_ifIndex|'),(29,'1acc9985eb91a7234ff97608cb85b0f5',18,1,'title','|host_description| - Traffic - |query_ifAlias|'),(30,'f434ec853c479d424276f367e9806a75',18,1,'title','|host_description| - Traffic - |query_ifName|'),(31,'9b085245847444c5fb90ebbf4448e265',18,2,'title','|host_description| - Traffic - |query_ifIP| (|query_ifDescr|)'),(32,'5977863f28629bd8eb93a2a9cbc3e306',18,3,'title','|host_description| - Traffic - |query_ifDescr|/|query_ifIndex|'),(33,'820eb01dd91c9026fbdf667a7f25302f',19,1,'title','|host_description| - Traffic - |query_ifAlias|'),(34,'37b6711af3930c56309cf8956d8bbf14',19,1,'title','|host_description| - Traffic - |query_ifName|'),(35,'cc435c5884a75421329a9b08207c1c90',19,2,'title','|host_description| - Traffic - |query_ifIP| (|query_ifDescr|)'),(36,'82edeea1ec249c9818773e3145836492',19,3,'title','|host_description| - Traffic - |query_ifDescr|/|query_ifIndex|'),(37,'c0422682831631bf539023fc04615025',20,1,'title','|host_description| - Traffic - |query_ifAlias|'),(38,'87522150ee8a601b4d6a1f6b9e919c47',20,1,'title','|host_description| - Traffic - |query_ifName|'),(39,'993a87c04f550f1209d689d584aa8b45',20,2,'title','|host_description| - Traffic - |query_ifIP| (|query_ifDescr|)'),(40,'183bb486c92a566fddcb0585ede37865',20,3,'title','|host_description| - Traffic - |query_ifDescr|/|query_ifIndex|'),(41,'a877a37f5d0e6f49a5d9d99ac7e347f3',21,1,'title','|host_description| - Traffic - |query_ifAlias| '),(42,'9e42f7e5310653f35f977285e48ecfa5',21,2,'title','|host_description| - Traffic - |query_ifName| '),(43,'cab54d19353de5548e0151180cb7c5dd',21,3,'title','|host_description| - Traffic - |query_ifIP| (|query_ifDescr|) '),(44,'f9de6e508d7fa64d91d163d864b9f31a',21,4,'title','|host_description| - Traffic - |query_ifDescr|/|query_ifIndex| '),(45,'419c8f569d1695b86c1943f7204abf3d',22,1,'title','|host_description| - Traffic - |query_ifAlias|'),(46,'1819f9ccdb512f19acfdc4edcda425b5',22,2,'title','|host_description| - Traffic - |query_ifName|'),(47,'08310b48a18f195d941fcd2c4ed40e7b',22,3,'title','|host_description| - Traffic - |query_ifIP| (|query_ifDescr|)'),(48,'dffe8e880677480a795b1232fc1207e5',22,4,'title','|host_description| - Traffic - |query_ifDescr|/|query_ifIndex|'),(49,'9be678415c48e9ee7a16e5208e523c6d',23,1,'title','|host_description| - Traffic - |query_ifAlias|'),(50,'702b89f7db8eae17a358e246d6264d05',23,2,'title','|host_description| - Traffic - |query_ifName|'),(51,'1fc5aabb79ad301bee69e6bb0094df2c',23,3,'title','|host_description| - Traffic - |query_ifIP| (|query_ifDescr|)'),(52,'bb5bd62bcfbfc5ff765afe625b830d31',23,4,'title','|host_description| - Traffic - |query_ifDescr|/|query_ifIndex|'),(53,'6b166ed8f603998fdc51719da3478e55',24,1,'title','|host_description| - Broadcast Packets - |query_ifAlias|'),(54,'dd545c92388329c666f7e88f99618e87',24,2,'title','|host_description| - Broadcast Packets - |query_ifName|'),(55,'71574f16039ab62c26d626c113ebdab0',24,3,'title','|host_description| - Broadcast Packets - |query_ifIP| (|query_ifDescr|)'),(56,'555ae21f832f02689c7a6e2f690ec7d3',24,4,'title','|host_description| - Broadcast Packets - |query_ifDescr|/|query_ifIndex|'),(57,'c5e2bd31d661ba33d5169e505bf920b6',25,1,'title','|host_description| - Multicast Packets - |query_ifAlias|'),(58,'be5c494fd82964bd9bd267399c4f7a3b',25,2,'title','|host_description| - Multicast Packets - |query_ifName|'),(59,'ca3d99f3c6f8ee1e3849e28274be14ba',25,3,'title','|host_description| - Multicast Packets - |query_ifIP| (|query_ifDescr|)'),(60,'6f48f284918085de78181d9698fb35ad',25,4,'title','|host_description| - Multicast Packets - |query_ifDescr|/|query_ifIndex|'),(61,'f21b23df740bc4a2d691d2d7b1b18dba',26,1,'title','|host_description| - Disk Space - |query_dskDevice|'),(62,'437918b8dcd66a64625c6cee481fff61',27,1,'title','|host_description| - Disk Space - |query_dskPath|'),(63,'9852782792ede7c0805990e506ac9618',28,1,'title','|host_description| - Used Space - |query_hrStorageDescr|'),(64,'fa2f07ab54fce72eea684ba893dd9c95',29,1,'title','|host_description| - CPU Utilization - CPU|query_hrProcessorFrwID|'),(65,'05e9a1f3fba9c615082991371ece0320',33,1,'title','|host_description| - Status - |query_ifName| - |query_ifAlias|'),(66,'38beaff1957a904d5eb500d2e6697df8',33,2,'title','|host_description| - Status - |query_ifName|'),(67,'6213182790b491588a42e12795673a22',16,1,'title','|host_description| - Traffic - |query_ifName| - (|query_ifAlias|)'),(68,'5372de8e0061685ec35531a41c54a7dc',16,2,'title','|host_description| - Traffic - |query_ifName| |query_ifAlias|'),(69,'0805c579674b98884a9b4c69bbce8fde',16,2,'title','|host_description| - Traffic - |query_ifName|'),(70,'f9c8b2d3783fbe2e8a88a0f5924d5eb4',16,3,'title','|host_description| - Traffic - |query_ifIP| (|query_ifDescr|)'),(71,'ed2c0c664e56877bf6660412553020bd',16,4,'title','|host_description| - Traffic - |query_ifDescr|/|query_ifIndex|'),(72,'ba75e07cb78b0033088b0bf2878c29d2',16,5,'title','|host_hostname| - Traffic - |query_ifName|'),(73,'76463baa5afb0c6bd23deca506409a75',16,6,'title','|host_hostname| - Traffic - |query_ifIP| (|query_ifDescr|)'),(74,'3fed6f7ce386987fdbf3b144951ddbe8',16,7,'title','|host_hostname| - Traffic - |query_ifDescr|/|query_ifIndex|'),(75,'b3b6f74f1354e0c655f118051d1f3c13',13,2,'title','|host_description| - Unicast Packets - |query_ifIP|/|query_ifDescr|'),(76,'84697525bb0edec1c6dc2cc07ec9b47c',34,1,'title','|host_description| - Multicast Packets - |query_ifName|'),(77,'a2bac15b73d82c2493452210553d6d86',34,2,'title','|host_description| - Multicast Packets - |query_ifIP| (|query_ifDescr|)'),(78,'828eabe607f8abf3abf009c2ea6643bc',34,3,'title','|host_description| - Multicast Packets - |query_ifDescr|/|query_ifIndex|'),(79,'a60b86693c0482d2f52a09dfe961d9e4',11,1,'title','|host_description| - Errors - |query_ifName| - (|query_ifAlias|)'),(80,'a107d4655000e380be72c3eab465b7d9',11,9,'title','|host_hostname| - Errors - |query_ifName|'),(81,'81a8320ec536c790d5a410bf0101b13f',11,10,'title','|host_hostname| - Errors - |query_ifIP| (|query_ifDescr|)'),(82,'2a897fed054fc8d2b7ae05cd7a635639',11,11,'title','|host_hostname| - Errors - |query_ifDescr|/|query_ifIndex|'),(83,'ad178dd4c21737b7248a003896618cca',15,1,'title','|host_description| - Traffic - |query_ifName| - (|query_ifAlias|)'),(84,'43b316b2957065c6204a2b4dc80a63f3',15,1,'title','|host_description| - Traffic - |query_ifName| - |query_ifAlias|'),(85,'1cd77bfb144d2ea5fd892870662627d0',15,5,'title','|host_description| - Traffic - |query_ifName| - |query_ifAlias|'),(86,'6b2af36e19b37a910af99e6120e09635',15,5,'title','|host_hostname| - Traffic - |query_ifName|'),(87,'95ec5b05a33b6ecb94fa52b07b7e95aa',15,6,'title','|host_hostname| - Traffic - |query_ifIP| (|query_ifDescr|)'),(88,'dc705a1b827d4382ee7bdab1a3b6d840',15,7,'title','|host_hostname| - Traffic - |query_ifDescr|/|query_ifIndex|'),(89,'71cf31b7c644535f0adcd1750a89e8dd',17,1,'title','|host_description| - Traffic - |query_ifName| - |query_ifAlias|'),(90,'1f95892a7dd855a8c14db98b235f4cbe',35,1,'title','|host_description| - Multicast Packets - |query_ifName|'),(91,'7677b65f04764fe17eda75cf19ec229c',35,2,'title','|host_description| - Multicast Packets - |query_ifIP| (|query_ifDescr|)'),(92,'738f41cdd4f0e30b1ae5fd90c16dd3bb',35,3,'title','|host_description| - Multicast Packets - |query_ifDescr|/|query_ifIndex|'),(93,'f09065d2ef5826d6258a92d46cf37d0d',19,1,'title','    |host_description| - Traffic - |query_ifName| - (|query_ifAlias|)');
/*!40000 ALTER TABLE `snmp_query_graph_sv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snmpagent_cache`
--

DROP TABLE IF EXISTS `snmpagent_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snmpagent_cache` (
  `oid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mib` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `otype` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `kind` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `max-access` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'not-accessible',
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`oid`),
  KEY `name` (`name`),
  KEY `mib_name` (`mib`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='SNMP MIB CACHE';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snmpagent_cache`
--

LOCK TABLES `snmpagent_cache` WRITE;
/*!40000 ALTER TABLE `snmpagent_cache` DISABLE KEYS */;
INSERT INTO `snmpagent_cache` VALUES ('.1.3.6.1.4.1.23925','cacti','CACTI-MIB','','MODULE-IDENTITY','Node','not-accessible','','Initial version of this MIB module.'),('.1.3.6.1.4.1.23925.1','cactiAppl','CACTI-MIB','','OBJECT-IDENTITY','Node','not-accessible','','reserved for Cacti application data'),('.1.3.6.1.4.1.23925.1.1.0','cactiApplLastUpdate','CACTI-MIB','Unsigned32','DATA','Scalar','read-only','1583629203','Unix timestamp when this data has been updated for the last time.'),('.1.3.6.1.4.1.23925.1.10.0','cactiApplSpineMaxThreads','CACTI-MIB','Unsigned32','DATA','Scalar','read-only','1','Represents the maximum threads allowed per process.'),('.1.3.6.1.4.1.23925.1.11.0','cactiApplSpineScriptServers','CACTI-MIB','Unsigned32','DATA','Scalar','read-only','1','Represents the maximum number of script servers a spine process is<br>allowed to run.'),('.1.3.6.1.4.1.23925.1.12.0','cactiApplSpineScriptTimeout','CACTI-MIB','Unsigned32','DATA','Scalar','read-only','25','Describes the maximum time Cacti will wait on a script to complete.'),('.1.3.6.1.4.1.23925.1.13.0','cactiApplSpineMaxOids','CACTI-MIB','Unsigned32','DATA','Scalar','read-only','10','The maximum number of snmp get OIDs to issue per snmpbulkwalk<br>request.'),('.1.3.6.1.4.1.23925.1.14','cactiApplDeviceTable','CACTI-MIB','SEQUENCE OF','OBJECT-TYPE','Table','not-accessible','','A table of registered hosts on a Cacti system.<br>The maximum number of entries is implementation dependent.'),('.1.3.6.1.4.1.23925.1.14.1','cactiApplDeviceEntry','CACTI-MIB','CactiApplDeviceEntry','OBJECT-TYPE','Row','not-accessible','','An entry in the table of registered hosts on a Cacti system. A row<br>in this table cannot be created or deleted by SNMP operations on<br>columns of the table.'),('.1.3.6.1.4.1.23925.1.14.1.1','cactiApplDeviceIndex','CACTI-MIB','Unsigned32','OBJECT-TYPE','Column','read-only','','A unique device identifier. This ID will be created by Cacti itself.'),('.1.3.6.1.4.1.23925.1.14.1.1.1','cactiApplDeviceIndex','CACTI-MIB','Unsigned32','DATA','Column Data','read-only','1',''),('.1.3.6.1.4.1.23925.1.14.1.2','cactiApplDeviceDescription','CACTI-MIB','DisplayString','OBJECT-TYPE','Column','read-only','','A meaning description of a device.'),('.1.3.6.1.4.1.23925.1.14.1.2.1','cactiApplDeviceDescription','CACTI-MIB','DisplayString','DATA','Column Data','read-only','Cacti-Template',''),('.1.3.6.1.4.1.23925.1.14.1.3','cactiApplDeviceHostname','CACTI-MIB','DisplayString','OBJECT-TYPE','Column','read-only','','Fully qualified devicename or IP address.'),('.1.3.6.1.4.1.23925.1.14.1.3.1','cactiApplDeviceHostname','CACTI-MIB','DisplayString','DATA','Column Data','read-only','127.0.0.1',''),('.1.3.6.1.4.1.23925.1.14.1.4','cactiApplDeviceStatus','CACTI-MIB','INTEGER','OBJECT-TYPE','Column','read-only','','The status a device can have within Cacti:<br>unknown(0)     - device has not been polled yet<br>down(1)        - device became unresponsive<br>recovering(2)  - device was down and became reachable again<br>up(3)          - device is reachable<br>disabled(4)    - device will not be monitored'),('.1.3.6.1.4.1.23925.1.14.1.4.1','cactiApplDeviceStatus','CACTI-MIB','INTEGER','DATA','Column Data','read-only','3',''),('.1.3.6.1.4.1.23925.1.14.1.5','cactiApplDeviceEventCount','CACTI-MIB','Unsigned32','OBJECT-TYPE','Column','read-only','','Total number of events registered for that device since last reset.'),('.1.3.6.1.4.1.23925.1.14.1.5.1','cactiApplDeviceEventCount','CACTI-MIB','Unsigned32','DATA','Column Data','read-only','0',''),('.1.3.6.1.4.1.23925.1.14.1.6','cactiApplDeviceFailDate','CACTI-MIB','DisplayString','OBJECT-TYPE','Column','read-only','','Date of last fail'),('.1.3.6.1.4.1.23925.1.14.1.6.1','cactiApplDeviceFailDate','CACTI-MIB','DisplayString','DATA','Column Data','read-only','0000-00-00 00:00:00',''),('.1.3.6.1.4.1.23925.1.14.1.7','cactiApplDeviceRecoveryDate','CACTI-MIB','DisplayString','OBJECT-TYPE','Column','read-only','','Date of lats recovery'),('.1.3.6.1.4.1.23925.1.14.1.7.1','cactiApplDeviceRecoveryDate','CACTI-MIB','DisplayString','DATA','Column Data','read-only','0000-00-00 00:00:00',''),('.1.3.6.1.4.1.23925.1.14.1.8','cactiApplDeviceLastError','CACTI-MIB','DisplayString','OBJECT-TYPE','Column','read-only','','Description of last error being detected.'),('.1.3.6.1.4.1.23925.1.14.1.8.1','cactiApplDeviceLastError','CACTI-MIB','DisplayString','DATA','Column Data','read-only','',''),('.1.3.6.1.4.1.23925.1.15','cactiApplPollerTable','CACTI-MIB','SEQUENCE OF','OBJECT-TYPE','Table','not-accessible','','A table of pollers registered on a Cacti system.<br>The maximum number of entries is implementation dependent.'),('.1.3.6.1.4.1.23925.1.15.1','cactiApplPollerEntry','CACTI-MIB','CactiApplPollerEntry','OBJECT-TYPE','Row','not-accessible','','An entry in the table of registered pollers to a Cacti system. A row<br>in this table cannot be created or deleted by SNMP operations on<br>columns of the table.'),('.1.3.6.1.4.1.23925.1.15.1.1','cactiApplPollerIndex','CACTI-MIB','Unsigned32','OBJECT-TYPE','Column','read-only','','A unique poller identifier. This ID will be created by Cacti itself.'),('.1.3.6.1.4.1.23925.1.15.1.2','cactiApplPollerHostname','CACTI-MIB','DisplayString','OBJECT-TYPE','Column','read-only','','Name of the device where the poller is running on.'),('.1.3.6.1.4.1.23925.1.15.1.3','cactiApplPollerIpAddress','CACTI-MIB','DisplayString','OBJECT-TYPE','Column','read-only','','IP address of the poller\'s host.'),('.1.3.6.1.4.1.23925.1.15.1.4','cactiApplPollerLastUpdate','CACTI-MIB','DisplayString','OBJECT-TYPE','Column','read-only','','Timestamp of last update.'),('.1.3.6.1.4.1.23925.1.16','cactiApplPluginTable','CACTI-MIB','SEQUENCE OF','OBJECT-TYPE','Table','not-accessible','','A table of registered plugins on a Cacti system.<br>The maximum number of entries is implementation dependent.'),('.1.3.6.1.4.1.23925.1.16.1','cactiApplPluginEntry','CACTI-MIB','CactiApplPluginEntry','OBJECT-TYPE','Row','not-accessible','','An entry in the table of all installed Cacti plugins. A row<br>in this table cannot be created or deleted by SNMP operations on<br>columns of the table.'),('.1.3.6.1.4.1.23925.1.16.1.1','cactiApplPluginIndex','CACTI-MIB','Unsigned32','OBJECT-TYPE','Column','read-only','','A unique plugin identifier. This ID will be administrated by Cacti itself.'),('.1.3.6.1.4.1.23925.1.16.1.1.1','cactiApplPluginIndex','CACTI-MIB','Unsigned32','DATA','Column Data','read-only','1',''),('.1.3.6.1.4.1.23925.1.16.1.1.2','cactiApplPluginIndex','CACTI-MIB','Unsigned32','DATA','Column Data','read-only','2',''),('.1.3.6.1.4.1.23925.1.16.1.1.3','cactiApplPluginIndex','CACTI-MIB','Unsigned32','DATA','Column Data','read-only','3',''),('.1.3.6.1.4.1.23925.1.16.1.2','cactiApplPluginType','CACTI-MIB','INTEGER','OBJECT-TYPE','Column','read-only','','Describes whether or not the plugin has been registered as a system plugin.<br>System plugins offer a lot of functions normal Cacti plugins rely on.'),('.1.3.6.1.4.1.23925.1.16.1.2.1','cactiApplPluginType','CACTI-MIB','INTEGER','DATA','Column Data','read-only','2',''),('.1.3.6.1.4.1.23925.1.16.1.2.2','cactiApplPluginType','CACTI-MIB','INTEGER','DATA','Column Data','read-only','2',''),('.1.3.6.1.4.1.23925.1.16.1.2.3','cactiApplPluginType','CACTI-MIB','INTEGER','DATA','Column Data','read-only','2',''),('.1.3.6.1.4.1.23925.1.16.1.3','cactiApplPluginName','CACTI-MIB','DisplayString','OBJECT-TYPE','Column','read-only','','The official name of a plugin given by its author.'),('.1.3.6.1.4.1.23925.1.16.1.3.1','cactiApplPluginName','CACTI-MIB','DisplayString','DATA','Column Data','read-only','webseer',''),('.1.3.6.1.4.1.23925.1.16.1.3.2','cactiApplPluginName','CACTI-MIB','DisplayString','DATA','Column Data','read-only','thold',''),('.1.3.6.1.4.1.23925.1.16.1.3.3','cactiApplPluginName','CACTI-MIB','DisplayString','DATA','Column Data','read-only','monitor',''),('.1.3.6.1.4.1.23925.1.16.1.4','cactiApplPluginStatus','CACTI-MIB','INTEGER','OBJECT-TYPE','Column','read-only','','The status a plugin can have within Cacti:<br>disabledold(-2)   - plugin (old PIA) is available, but has not been installed<br>activeold(-1)     - plugin (old PIA) is installed and active<br>notinstalled(0)   - plugin (new PIA) is available, but has not been installed<br>active(1)         - plugin (new PIA) is installed and active<br>setupmode(2)      - plugin (new PIA) is installed, but configuration is needed<br>disabled(4)       - plugin (new PIA) is installed, but without function'),('.1.3.6.1.4.1.23925.1.16.1.4.1','cactiApplPluginStatus','CACTI-MIB','INTEGER','DATA','Column Data','read-only','4',''),('.1.3.6.1.4.1.23925.1.16.1.4.2','cactiApplPluginStatus','CACTI-MIB','INTEGER','DATA','Column Data','read-only','0',''),('.1.3.6.1.4.1.23925.1.16.1.4.3','cactiApplPluginStatus','CACTI-MIB','INTEGER','DATA','Column Data','read-only','0',''),('.1.3.6.1.4.1.23925.1.16.1.5','cactiApplPluginVersion','CACTI-MIB','DisplayString','OBJECT-TYPE','Column','read-only','','Version string of the Cacti plugin being installed.'),('.1.3.6.1.4.1.23925.1.16.1.5.1','cactiApplPluginVersion','CACTI-MIB','DisplayString','DATA','Column Data','read-only','3.0',''),('.1.3.6.1.4.1.23925.1.16.1.5.2','cactiApplPluginVersion','CACTI-MIB','DisplayString','DATA','Column Data','read-only','1.3.4',''),('.1.3.6.1.4.1.23925.1.16.1.5.3','cactiApplPluginVersion','CACTI-MIB','DisplayString','DATA','Column Data','read-only','2.3.6',''),('.1.3.6.1.4.1.23925.1.2.0','cactiApplVersion','CACTI-MIB','DisplayString','DATA','Scalar','read-only','1.2.9','Returns the version string of Cacti'),('.1.3.6.1.4.1.23925.1.3.0','cactiApplSnmpVersion','CACTI-MIB','TcCactiApplSnmpVersion','DATA','Scalar','read-only','3','Represents the type of SNMP used by Cacti:<br><br>NET-SNMP<br>UCD-SNMP<br>PHP-SNMP'),('.1.3.6.1.4.1.23925.1.4.0','cactiApplRrdtoolVersion','CACTI-MIB','DisplayString','DATA','Scalar','read-only','1.4.0','The version of RRDtool used by Cacti'),('.1.3.6.1.4.1.23925.1.5.0','cactiApplPollerEnabled','CACTI-MIB','TruthValue','DATA','Scalar','read-only','1','If Cacti polling has been enabled this object is set to true(1).'),('.1.3.6.1.4.1.23925.1.6.0','cactiApplPollerType','CACTI-MIB','TcCactiApplPollerType','DATA','Scalar','read-only','2','Describes the polling engine used by Cacti:<br><br>cmd         - php based poller<br>spine       - high performance C-based polling engine'),('.1.3.6.1.4.1.23925.1.7.0','cactiApplPollerInterval','CACTI-MIB','Unsigned32','DATA','Scalar','read-only','60','The polling interval in seconds which determines how often<br>data sources will be checked and updated.'),('.1.3.6.1.4.1.23925.1.8.0','cactiApplPollerMaxProcesses','CACTI-MIB','Unsigned32','DATA','Scalar','read-only','1','Represents the number of maximum poller processes Cacti is allowed to<br>perform in parallel.'),('.1.3.6.1.4.1.23925.1.9.0','cactiApplPollerLoadBalance','CACTI-MIB','TruthValue','DATA','Scalar','read-only','1','If true Cacti attempt to balance the load of each poller process.'),('.1.3.6.1.4.1.23925.2','cactiStats','CACTI-MIB','','OBJECT-IDENTITY','Node','not-accessible','','reserved for cacti statistics'),('.1.3.6.1.4.1.23925.2.1.0','cactiStatsLastUpdate','CACTI-MIB','Unsigned32','DATA','Scalar','read-only','1583629203','Unix timestamp when this data has been updated for the last time.'),('.1.3.6.1.4.1.23925.2.10','cactiStatsPollerTable','CACTI-MIB','SEQUENCE OF','OBJECT-TYPE','Table','not-accessible','','A table of statistics for all pollers registered on a Cacti system.<br>The maximum number of entries is implementation dependent.<br>This table has a 1:1 relationship to cactiApplPollerTable.'),('.1.3.6.1.4.1.23925.2.10.1','cactiStatsPollerEntry','CACTI-MIB','CactiStatsPollerEntry','OBJECT-TYPE','Row','not-accessible','','An entry in the table of statistics for registered pollers of a Cacti system.<br>A row in this table cannot be created or deleted by SNMP operations on<br>columns of the table.'),('.1.3.6.1.4.1.23925.2.10.1.1','cactiStatsPollerIndex','CACTI-MIB','Unsigned32','OBJECT-TYPE','Column','read-only','','A unique poller identifier. This ID will be created by Cacti itself.'),('.1.3.6.1.4.1.23925.2.10.1.10','cactiStatsPollerRrrdsProcessed','CACTI-MIB','Unsigned32','OBJECT-TYPE','Column','read-only','','Number of RRDs being processed. This object will always return zero<br>if RRD updates will be handled by BOOST.'),('.1.3.6.1.4.1.23925.2.10.1.11','cactiStatsPollerUtilization','CACTI-MIB','DisplayString','OBJECT-TYPE','Column','read-only','','The proportion of the poller interval in percent the poller requires<br>to poll all data sources.'),('.1.3.6.1.4.1.23925.2.10.1.2','cactiStatsPollerHostname','CACTI-MIB','DisplayString','OBJECT-TYPE','Column','read-only','','Name of the device where the poller is running on.'),('.1.3.6.1.4.1.23925.2.10.1.3','cactiStatsPollerRunTime','CACTI-MIB','DisplayString','OBJECT-TYPE','Column','read-only','','Last poller runtime in seconds.'),('.1.3.6.1.4.1.23925.2.10.1.4','cactiStatsPollerMethod','CACTI-MIB','TcCactiApplPollerType','OBJECT-TYPE','Column','read-only','','Describes the polling engine used by Cacti:<br>cmd         - php based poller<br>spine       - high performance C-based polling engine'),('.1.3.6.1.4.1.23925.2.10.1.5','cactiStatsPollerConcurrentProcesses','CACTI-MIB','Unsigned32','OBJECT-TYPE','Column','read-only','','Number of concurrent processes.'),('.1.3.6.1.4.1.23925.2.10.1.6','cactiStatsPollerThreads','CACTI-MIB','Unsigned32','OBJECT-TYPE','Column','read-only','','Number of threads. This object will always return zero if<br>polling method is CMD.'),('.1.3.6.1.4.1.23925.2.10.1.7','cactiStatsPollerHosts','CACTI-MIB','Unsigned32','OBJECT-TYPE','Column','read-only','','Number of polled devices.'),('.1.3.6.1.4.1.23925.2.10.1.8','cactiStatsPollerHostsPerProcess','CACTI-MIB','Unsigned32','OBJECT-TYPE','Column','read-only','','Maximum number of hosts per process.'),('.1.3.6.1.4.1.23925.2.10.1.9','cactiStatsPollerItems','CACTI-MIB','Unsigned32','OBJECT-TYPE','Column','read-only','','Number of items being polled.'),('.1.3.6.1.4.1.23925.2.11.0','cactiStatsTotalsDeviceStatusUnknown','CACTI-MIB','Unsigned32','DATA','Scalar','read-only','0','Total number of devices that have not been polled yet.'),('.1.3.6.1.4.1.23925.2.12.0','cactiStatsTotalsDeviceStatusDown','CACTI-MIB','Unsigned32','DATA','Scalar','read-only','0','Total number of devices being unreachable.'),('.1.3.6.1.4.1.23925.2.13.0','cactiStatsTotalsDeviceStatusRecovering','CACTI-MIB','Unsigned32','DATA','Scalar','read-only','0','Total number of devices recovering.'),('.1.3.6.1.4.1.23925.2.14.0','cactiStatsTotalsDeviceStatusUp','CACTI-MIB','Unsigned32','DATA','Scalar','read-only','1','Total number of devices being reachable.'),('.1.3.6.1.4.1.23925.2.15.0','cactiStatsTotalsDeviceStatusDisabled','CACTI-MIB','Unsigned32','DATA','Scalar','read-only','0','Total number of devices being reachable.'),('.1.3.6.1.4.1.23925.2.2.0','cactiStatsRecacheTime','CACTI-MIB','Unsigned32','DATA','Scalar','read-only','','Returns the recache Time in seconds.'),('.1.3.6.1.4.1.23925.2.3.0','cactiStatsRecachedHosts','CACTI-MIB','Unsigned32','DATA','Scalar','read-only','','The current number of recaching events being discovered.'),('.1.3.6.1.4.1.23925.2.4.0','cactiStatsLocalPollerRuntime','CACTI-MIB','DisplayString','DATA','Scalar','read-only','1.4263','Returns the runtime of the local poller in seconds.'),('.1.3.6.1.4.1.23925.2.5.0','cactiStatsTotalsDevices','CACTI-MIB','Unsigned32','DATA','Scalar','read-only','1','Returns the total number of registered devices.'),('.1.3.6.1.4.1.23925.2.6.0','cactiStatsTotalsDataSources','CACTI-MIB','Unsigned32','DATA','Scalar','read-only','29','Returns the total number of data sources.'),('.1.3.6.1.4.1.23925.2.7.0','cactiStatsTotalsGraphs','CACTI-MIB','Unsigned32','DATA','Scalar','read-only','28','Returns the total number of graphs.'),('.1.3.6.1.4.1.23925.2.8','cactiStatsTotalsDeviceStatusTable','CACTI-MIB','SEQUENCE OF','OBJECT-TYPE','Table','not-accessible','','A table of statistics for all devices registered on a Cacti system<br>in relation to their device status.<br>The maximum number of entries is limited to maximum number of<br>device stati.'),('.1.3.6.1.4.1.23925.2.8.1','cactiStatsTotalsDeviceStatusEntry','CACTI-MIB','CactiStatsTotalsDeviceStatusEntry','OBJECT-TYPE','Row','not-accessible','','A table of statistics for all devices registered on a Cacti system<br>in relation to their device status.<br>A row in this table cannot be created or deleted by SNMP operations on<br>columns of the table.'),('.1.3.6.1.4.1.23925.2.8.1.1','cactiStatsTotalsDeviceStatusIndex','CACTI-MIB','INTEGER','OBJECT-TYPE','Column','read-only','','unknown(0)     - Total number of devices that have not been polled yet<br>down(1)        - Total number of devices being unreachable<br>recovering(2)  - Total number of devices recovering<br>up(3)          - Total number of devices being reachable<br>disabled(4)    - Total number of devices that will not be monitored'),('.1.3.6.1.4.1.23925.2.8.1.1.0','cactiStatsTotalsDeviceStatusIndex','CACTI-MIB','INTEGER','DATA','Column Data','read-only','0',''),('.1.3.6.1.4.1.23925.2.8.1.1.1','cactiStatsTotalsDeviceStatusIndex','CACTI-MIB','INTEGER','DATA','Column Data','read-only','1',''),('.1.3.6.1.4.1.23925.2.8.1.1.2','cactiStatsTotalsDeviceStatusIndex','CACTI-MIB','INTEGER','DATA','Column Data','read-only','2',''),('.1.3.6.1.4.1.23925.2.8.1.1.3','cactiStatsTotalsDeviceStatusIndex','CACTI-MIB','INTEGER','DATA','Column Data','read-only','3',''),('.1.3.6.1.4.1.23925.2.8.1.1.4','cactiStatsTotalsDeviceStatusIndex','CACTI-MIB','INTEGER','DATA','Column Data','read-only','4',''),('.1.3.6.1.4.1.23925.2.8.1.2','cactiStatsTotalsDeviceStatusCounter','CACTI-MIB','Unsigned32','OBJECT-TYPE','Column','read-only','','Returns the total number of registered devices in relation to<br>cactiStatsTotalsDeviceStatusIndex.'),('.1.3.6.1.4.1.23925.2.8.1.2.0','cactiStatsTotalsDeviceStatusCounter','CACTI-MIB','Unsigned32','DATA','Column Data','read-only','0',''),('.1.3.6.1.4.1.23925.2.8.1.2.1','cactiStatsTotalsDeviceStatusCounter','CACTI-MIB','Unsigned32','DATA','Column Data','read-only','0',''),('.1.3.6.1.4.1.23925.2.8.1.2.2','cactiStatsTotalsDeviceStatusCounter','CACTI-MIB','Unsigned32','DATA','Column Data','read-only','0',''),('.1.3.6.1.4.1.23925.2.8.1.2.3','cactiStatsTotalsDeviceStatusCounter','CACTI-MIB','Unsigned32','DATA','Column Data','read-only','1',''),('.1.3.6.1.4.1.23925.2.8.1.2.4','cactiStatsTotalsDeviceStatusCounter','CACTI-MIB','Unsigned32','DATA','Column Data','read-only','0',''),('.1.3.6.1.4.1.23925.2.9','cactiStatsDeviceTable','CACTI-MIB','SEQUENCE OF','OBJECT-TYPE','Table','not-accessible','','A table of statistics for all devices registered on a Cacti system.<br>The maximum number of entries is implementation dependent.<br>This table has a 1:1 relationship to cactiApplDeviceTable.'),('.1.3.6.1.4.1.23925.2.9.1','cactiStatsDeviceEntry','CACTI-MIB','CactiStatsDeviceEntry','OBJECT-TYPE','Row','not-accessible','','An entry in the table of statistics for registered devices of a Cacti system.<br>A row in this table cannot be created or deleted by SNMP operations on<br>columns of the table.'),('.1.3.6.1.4.1.23925.2.9.1.1','cactiStatsDeviceIndex','CACTI-MIB','Unsigned32','OBJECT-TYPE','Column','read-only','','A unique device identifier. This ID will be created by Cacti itself.'),('.1.3.6.1.4.1.23925.2.9.1.1.1','cactiStatsDeviceIndex','CACTI-MIB','Unsigned32','DATA','Column Data','read-only','1',''),('.1.3.6.1.4.1.23925.2.9.1.2','cactiStatsDeviceHostname','CACTI-MIB','DisplayString','OBJECT-TYPE','Column','read-only','','Fully qualified devicename or IP address.'),('.1.3.6.1.4.1.23925.2.9.1.2.1','cactiStatsDeviceHostname','CACTI-MIB','DisplayString','DATA','Column Data','read-only','127.0.0.1',''),('.1.3.6.1.4.1.23925.2.9.1.3','cactiStatsDeviceMinTime','CACTI-MIB','DisplayString','OBJECT-TYPE','Column','read-only','','Minimum response time in seconds.'),('.1.3.6.1.4.1.23925.2.9.1.3.1','cactiStatsDeviceMinTime','CACTI-MIB','DisplayString','DATA','Column Data','read-only','0.00000',''),('.1.3.6.1.4.1.23925.2.9.1.4','cactiStatsDeviceMaxTime','CACTI-MIB','DisplayString','OBJECT-TYPE','Column','read-only','','Maximum response time in seconds.'),('.1.3.6.1.4.1.23925.2.9.1.4.1','cactiStatsDeviceMaxTime','CACTI-MIB','DisplayString','DATA','Column Data','read-only','0.36883',''),('.1.3.6.1.4.1.23925.2.9.1.5','cactiStatsDeviceCurTime','CACTI-MIB','DisplayString','OBJECT-TYPE','Column','read-only','','Last response time in seconds.'),('.1.3.6.1.4.1.23925.2.9.1.5.1','cactiStatsDeviceCurTime','CACTI-MIB','DisplayString','DATA','Column Data','read-only','0.24199',''),('.1.3.6.1.4.1.23925.2.9.1.6','cactiStatsDeviceAvgTime','CACTI-MIB','DisplayString','OBJECT-TYPE','Column','read-only','','Average response time in seconds.'),('.1.3.6.1.4.1.23925.2.9.1.6.1','cactiStatsDeviceAvgTime','CACTI-MIB','DisplayString','DATA','Column Data','read-only','0.03400',''),('.1.3.6.1.4.1.23925.2.9.1.7','cactiStatsDeviceTotalPolls','CACTI-MIB','Unsigned32','OBJECT-TYPE','Column','read-only','','Number of total polls against a monitored device.'),('.1.3.6.1.4.1.23925.2.9.1.7.1','cactiStatsDeviceTotalPolls','CACTI-MIB','Unsigned32','DATA','Column Data','read-only','33',''),('.1.3.6.1.4.1.23925.2.9.1.8','cactiStatsDeviceFailedPolls','CACTI-MIB','Unsigned32','OBJECT-TYPE','Column','read-only','','Number of failed polls.'),('.1.3.6.1.4.1.23925.2.9.1.8.1','cactiStatsDeviceFailedPolls','CACTI-MIB','Unsigned32','DATA','Column Data','read-only','0',''),('.1.3.6.1.4.1.23925.2.9.1.9','cactiStatsDeviceAvailability','CACTI-MIB','DisplayString','OBJECT-TYPE','Column','read-only','','Calculated availablity in percent.'),('.1.3.6.1.4.1.23925.2.9.1.9.1','cactiStatsDeviceAvailability','CACTI-MIB','DisplayString','DATA','Column Data','read-only','100.00000',''),('.1.3.6.1.4.1.23925.3','cactiEvents','CACTI-MIB','','OBJECT-IDENTITY','Node','not-accessible','','reserved for cacti events'),('.1.3.6.1.4.1.23925.3.1','cactiEventAttributes','CACTI-MIB','','OBJECT-IDENTITY','Node','not-accessible','','resevered for event attributes, used as varbind for the SMNP notifications'),('.1.3.6.1.4.1.23925.3.1.1.0','cactiEventDescription','CACTI-MIB','DisplayString','DATA','Scalar','accessible-for-notify','','Contains a customized event description.'),('.1.3.6.1.4.1.23925.3.2','cactiEventNotifications','CACTI-MIB','','OBJECT-IDENTITY','Node','not-accessible','','resevered for event notifications'),('.1.3.6.1.4.1.23925.3.2.1','cactiNotify','CACTI-MIB','','NOTIFICATION-TYPE','Notification','not-accessible','','This SNMP notification will only include varbind cactiEventDescription<br>and can be used as a simple and generic notification by plugins for example.'),('.1.3.6.1.4.1.23925.3.2.2','cactiNotifyDeviceDown','CACTI-MIB','','NOTIFICATION-TYPE','Notification','not-accessible','','This SNMP notification will be send to notification receivers if Cacti has detected<br>that a monitored device went down.'),('.1.3.6.1.4.1.23925.3.2.3','cactiNotifyDeviceRecovering','CACTI-MIB','','NOTIFICATION-TYPE','Notification','not-accessible','','This SNMP notification will be send to notification receivers if Cacti has detected<br>that a monitored device became reachable again.'),('.1.3.6.1.4.1.23925.3.2.4','cactiNotifyPollerRuntimeExceeding','CACTI-MIB','','NOTIFICATION-TYPE','Notification','not-accessible','','This SNMP notification will be send to notification receivers if a Cacti poller<br>has breached its maximum runtime.'),('.1.3.6.1.4.1.23925.3.2.5','cactiNotifyDeviceFailedPoll','CACTI-MIB','','NOTIFICATION-TYPE','Notification','not-accessible','','This SNMP notification will be send to notification receivers if Cacti<br>was unable to poll a device.'),('.1.3.6.1.4.1.23925.4','cactiPlugins','CACTI-MIB','','OBJECT-IDENTITY','Node','not-accessible','','cactiPlugins provides a root object identifier<br>from which mibs produced by plugin developers may be<br>placed. mibs written by other developers will typically<br>be implemented with the object identifiers as defined<br>in the mib.<br>Plugin developers have to take notice of the following<br>requirements:<br><br>|MIB name: CACTI-<plugin_name>-MIB<br>|Module name: <plugin_name><br>|Architecture:<br>Plugin mibs have to reserve the first three<br>sub-trees for:<br>+<br>|-<plugin_name>Appl(1)<br>|-<plugin_name>Stats(2)<br>|-<plugin_name>Events(3)<br>|-<plugin_name>MibGroups(4)<br><br>The plugin name has to be written in lower cases only.<br><br>As reference plugin developers should take a look at<br>the CACTI-THOLD-MIB.'),('.1.3.6.1.4.1.23925.4.2','boost','CACTI-BOOST-MIB','','MODULE-IDENTITY','Node','not-accessible','','Initial version of this MIB module.'),('.1.3.6.1.4.1.23925.4.2.1','boostAppl','CACTI-BOOST-MIB','','OBJECT-IDENTITY','Node','not-accessible','','reserved for Boost application data'),('.1.3.6.1.4.1.23925.4.2.1.1.0','boostApplLastUpdate','CACTI-BOOST-MIB','Unsigned32','DATA','Scalar','read-only','1583628990','Unix timestamp when this data has been updated for the last time.'),('.1.3.6.1.4.1.23925.4.2.1.10.0','boostApplServerEnabled','CACTI-BOOST-MIB','TruthValue','DATA','Scalar','read-only','','If Boost Server will be used for RRDUpdates this object is set<br>to true (1).'),('.1.3.6.1.4.1.23925.4.2.1.11.0','boostApplServerMultiprocess','CACTI-BOOST-MIB','TruthValue','DATA','Scalar','read-only','','This object returns true (1) if Boost Server should  fork a separate<br>update process for each boost request'),('.1.3.6.1.4.1.23925.4.2.1.12.0','boostApplServerHostname','CACTI-BOOST-MIB','DisplayString','DATA','Scalar','read-only','','Returns the Hostname/IP of the boost server.'),('.1.3.6.1.4.1.23925.4.2.1.13.0','boostApplServerListenPort','CACTI-BOOST-MIB','DisplayString','DATA','Scalar','read-only','','Returns the TCP port the boost server will listen on.'),('.1.3.6.1.4.1.23925.4.2.1.14.0','boostApplServerTimeOuts','CACTI-BOOST-MIB','Unsigned32','DATA','Scalar','read-only','','Defines the maximum number of seconds a client should wait on the<br>Boost server before giving up.'),('.1.3.6.1.4.1.23925.4.2.1.15.0','boostApplImageCacheEnabled','CACTI-BOOST-MIB','TruthValue','DATA','Scalar','read-only','2','If image caching has been enabled this object is set to true (1).'),('.1.3.6.1.4.1.23925.4.2.1.16.0','boostApplLoggingEnabled','CACTI-BOOST-MIB','TruthValue','DATA','Scalar','read-only','2','If Boost debug logging is enabled this object will return true (1).'),('.1.3.6.1.4.1.23925.4.2.1.17.0','boostApplStorageDatabaseEngine','CACTI-BOOST-MIB','DisplayString','DATA','Scalar','read-only','','Returns the database engine being used for the boost storage.'),('.1.3.6.1.4.1.23925.4.2.1.18.0','boostApplStorageMaxTableSize','CACTI-BOOST-MIB','Integer32','DATA','Scalar','read-only','','This object contains the maximum size in kbytes a boost memory (1) table<br>is allowed to have. If boostApplStorageDatabaseEngine is set to<br>myisam (2) the table size is unlimited and this object returns -1.'),('.1.3.6.1.4.1.23925.4.2.1.19.0','boostApplStorageMaxRecords','CACTI-BOOST-MIB','Unsigned32','DATA','Scalar','read-only','','This object contains the estimated number of records a boost memory (1)<br>table can store. If boostApplStorageDatabaseEngine is set to<br>myisam (2) the number of maximum records is unlimited and<br>this object returns 0.'),('.1.3.6.1.4.1.23925.4.2.1.2.0','boostApplRrdUpdateEnabled','CACTI-BOOST-MIB','TruthValue','DATA','Scalar','read-only','2','If Boost on demand RRD updating has been enabled this object is set<br>to true(1).'),('.1.3.6.1.4.1.23925.4.2.1.3.0','boostApplRrdUpdateInterval','CACTI-BOOST-MIB','Unsigned32','DATA','Scalar','read-only','60','If Boost has been enabled this interval determines when<br>RRDfiles will be updated automatically.'),('.1.3.6.1.4.1.23925.4.2.1.4.0','boostApplRrdUpdateMaxRecords','CACTI-BOOST-MIB','Unsigned32','DATA','Scalar','read-only','1000000','Represents the maximum size in records of the Boost output table.<br>If the boost output table exceeds this size, in records, an update<br>will take place.'),('.1.3.6.1.4.1.23925.4.2.1.5.0','boostApplRrdUpdateMaxRecordsPerSelect','CACTI-BOOST-MIB','Unsigned32','DATA','Scalar','read-only','50000','Defines the maximum number of data source items that should be<br>retrieved in one single pass.'),('.1.3.6.1.4.1.23925.4.2.1.6.0','boostApplRrdUpdateMaxStringLength','CACTI-BOOST-MIB','Unsigned32','DATA','Scalar','read-only','2000','Defines the maximum argument length Boost must not exceed for update<br>commands to RRDtool. This limit varies by operating system and kernel<br>level.'),('.1.3.6.1.4.1.23925.4.2.1.7.0','boostApplRrdUpdatePollerMemLimit','CACTI-BOOST-MIB','Unsigned32','DATA','Scalar','read-only','1024','Returns the maximum amount of memory for the Cacti Poller and<br>Boost\'s Poller.'),('.1.3.6.1.4.1.23925.4.2.1.8.0','boostApplRrdUpdateMaxRunTime','CACTI-BOOST-MIB','Unsigned32','DATA','Scalar','read-only','1200','Represents the maximum boot poller run time in seconds being allowed.'),('.1.3.6.1.4.1.23925.4.2.1.9.0','boostApplRrdUpdateRedirect','CACTI-BOOST-MIB','TruthValue','DATA','Scalar','read-only','2','If direct population of poller_output_boost table by spine has been<br>enabled this object is set to true(1). This enables direct insert of<br>records into poller output boost.'),('.1.3.6.1.4.1.23925.4.2.2','boostStats','CACTI-BOOST-MIB','','OBJECT-IDENTITY','Node','not-accessible','','reserved for boost statistics'),('.1.3.6.1.4.1.23925.4.2.2.1.0','boostStatsLastUpdate','CACTI-BOOST-MIB','Unsigned32','DATA','Scalar','read-only','','Unix timestamp when this data has been updated for the last time.'),('.1.3.6.1.4.1.23925.4.2.2.10.0','boostStatsTotalsRecords','CACTI-BOOST-MIB','Unsigned32','DATA','Scalar','read-only','','Returns the total number of records being handled by Boost.'),('.1.3.6.1.4.1.23925.4.2.2.11.0','boostStatsTotalsRecordsPending','CACTI-BOOST-MIB','Unsigned32','DATA','Scalar','read-only','','Total number of records marked as pending.'),('.1.3.6.1.4.1.23925.4.2.2.12.0','boostStatsTotalsRecordsArchived','CACTI-BOOST-MIB','Unsigned32','DATA','Scalar','read-only','','Total number of records marked as archived.'),('.1.3.6.1.4.1.23925.4.2.2.13.0','boostStatsStorageTableSize','CACTI-BOOST-MIB','Unsigned32','DATA','Scalar','read-only','','This object contains the current size of the boost memory table<br>in kBytes.'),('.1.3.6.1.4.1.23925.4.2.2.14.0','boostStatsStorageAverageRecordSize','CACTI-BOOST-MIB','Unsigned32','DATA','Scalar','read-only','','Returns the average record size of the boost memory table in bytes.'),('.1.3.6.1.4.1.23925.4.2.2.15.0','boostStatsStorageMaxRecordLength','CACTI-BOOST-MIB','Unsigned32','DATA','Scalar','read-only','','Returns size of longest record within the boost memory table<br>in bytes.'),('.1.3.6.1.4.1.23925.4.2.2.16.0','boostStatsTotalsImagesCacheSize','CACTI-BOOST-MIB','Unsigned32','DATA','Scalar','read-only','','Represents the total number of RRD image files being<br>currently cached by Boost.'),('.1.3.6.1.4.1.23925.4.2.2.17.0','boostStatsTotalsImagesCacheReads','CACTI-BOOST-MIB','Counter64','DATA','Scalar','read-only','','Number of succesful read operations.'),('.1.3.6.1.4.1.23925.4.2.2.18.0','boostStatsTotalsImagesCacheWrites','CACTI-BOOST-MIB','Counter64','DATA','Scalar','read-only','','Indicates the number of uncached read operations.'),('.1.3.6.1.4.1.23925.4.2.2.2.0','boostStatsRrdUpdateProcessStatus','CACTI-BOOST-MIB','INTEGER','DATA','Scalar','read-only','','The status the update process of Boost can have:<br>disabled(0)    - RRD update process has been disabled.<br>neverrun(1)    - RRD update process is enabled but did not run so far<br>complete(2)    - Last RRD update process has been completed<br>running(3)     - RRD update process is still running<br>overrun(4)     - Overrun detected ?     *review*<br>timeout(5)     - Time out detected ?    *review*<br>other(6)       - Undefined state        *review*'),('.1.3.6.1.4.1.23925.4.2.2.3.0','boostStatsRrdUpdateLastRun','CACTI-BOOST-MIB','DisplayString','DATA','Scalar','read-only','','Date of last run'),('.1.3.6.1.4.1.23925.4.2.2.4.0','boostStatsRrdUpdates','CACTI-BOOST-MIB','Unsigned32','DATA','Scalar','read-only','','Number of RRDs being updated.'),('.1.3.6.1.4.1.23925.4.2.2.5.0','boostStatsRrdUpdateDuration','CACTI-BOOST-MIB','DisplayString','DATA','Scalar','read-only','','Represents the duration of the last update process in seconds.'),('.1.3.6.1.4.1.23925.4.2.2.6.0','boostStatsRrdUpdateUtilization','CACTI-BOOST-MIB','DisplayString','DATA','Scalar','read-only','','The proportion of the maximum upate frequency in percent Boost requires<br>to update all rrds.'),('.1.3.6.1.4.1.23925.4.2.2.7.0','boostStatsRrdUpdatePollerPeakMemory','CACTI-BOOST-MIB','Unsigned32','DATA','Scalar','read-only','','Returns the peak of memory in bytes that has been allocated by Boost<br>during the last rrd update process.'),('.1.3.6.1.4.1.23925.4.2.2.8.0','boostStatsRrdUpdateNextRun','CACTI-BOOST-MIB','DisplayString','DATA','Scalar','read-only','','Date of next run'),('.1.3.6.1.4.1.23925.4.2.2.9.0','boostStatsTotalsDataSources','CACTI-BOOST-MIB','Unsigned32','DATA','Scalar','read-only','','Represents the total number of poller items Boost has to take care of.'),('.1.3.6.1.4.1.23925.4.2.3','boostEvents','CACTI-BOOST-MIB','','OBJECT-IDENTITY','Node','not-accessible','','reserved for boost events'),('.1.3.6.1.4.1.23925.4.2.4','boostMibGroups','CACTI-BOOST-MIB','','OBJECT-IDENTITY','Node','not-accessible','','reserved for group definitions'),('.1.3.6.1.4.1.23925.4.4','snmpagent','CACTI-SNMPAGENT-MIB','','MODULE-IDENTITY','Node','not-accessible','','Initial version of this MIB module.'),('.1.3.6.1.4.1.23925.4.4.1','snmpagentAppl','CACTI-SNMPAGENT-MIB','','OBJECT-IDENTITY','Node','not-accessible','','resevered for statistics'),('.1.3.6.1.4.1.23925.4.4.1.1.0','snmpagentApplLastUpdate','CACTI-SNMPAGENT-MIB','Unsigned32','DATA','Scalar','read-only','','Unix timestamp when this data has been updated for the last time.'),('.1.3.6.1.4.1.23925.4.4.2','snmpagentStats','CACTI-SNMPAGENT-MIB','','OBJECT-IDENTITY','Node','not-accessible','','resevered for statistics'),('.1.3.6.1.4.1.23925.4.4.2.1.0','snmpagentStatsLastUpdate','CACTI-SNMPAGENT-MIB','Unsigned32','DATA','Scalar','read-only','','Unix timestamp when this data has been updated for the last time.'),('.1.3.6.1.4.1.23925.4.4.3','snmpagentEvents','CACTI-SNMPAGENT-MIB','','OBJECT-IDENTITY','Node','not-accessible','','resevered for events'),('.1.3.6.1.4.1.23925.4.4.3.1','snmpagentEventAttributes','CACTI-SNMPAGENT-MIB','','OBJECT-IDENTITY','Node','not-accessible','','resevered for event attributes, used as varbind for the SMNP notifications'),('.1.3.6.1.4.1.23925.4.4.3.1.1.0','snmpagentEventDescription','CACTI-SNMPAGENT-MIB','DisplayString','DATA','Scalar','accessible-for-notify','','Contains a customized event description.'),('.1.3.6.1.4.1.23925.4.4.3.2','snmpagentEventNotifications','CACTI-SNMPAGENT-MIB','','OBJECT-IDENTITY','Node','not-accessible','','resevered for event notifications'),('.1.3.6.1.4.1.23925.4.4.3.2.1','snmpagentNotificationTest','CACTI-SNMPAGENT-MIB','','NOTIFICATION-TYPE','Notification','not-accessible','','This SNMP notification will only include varbind snmpagentEventDescription<br>and can be used to verify the configuration of SNMP managers.'),('.1.3.6.1.4.1.23925.4.4.4','snmpagentMibGroups','CACTI-SNMPAGENT-MIB','','OBJECT-IDENTITY','Node','not-accessible','','resevered for group definitions'),('.1.3.6.1.4.1.23925.4.4.4.1','snmpagentEventGroup','CACTI-SNMPAGENT-MIB','','OBJECT-GROUP','Group','not-accessible','','A collection of objects providing the SNMPAgent event<br>attributes.'),('.1.3.6.1.4.1.23925.4.4.4.2','snmpagentNotifyGroup','CACTI-SNMPAGENT-MIB','','NOTIFICATION-GROUP','Group','not-accessible','','The group of notifications SNMPAgent offers.'),('.1.3.6.1.4.1.23925.5','cactiMibGroups','CACTI-MIB','','OBJECT-IDENTITY','Node','not-accessible','','reserved for group definitions'),('.1.3.6.1.4.1.23925.5.1','cactiApplPollerGroup','CACTI-MIB','','OBJECT-GROUP','Group','not-accessible','','A collection of poller settings.'),('.1.3.6.1.4.1.23925.5.2','cactiApplSpineGroup','CACTI-MIB','','OBJECT-GROUP','Group','not-accessible','','A collection of Spine specific parameters.'),('.1.3.6.1.4.1.23925.5.3','cactiStatsTotalsDeviceGroup','CACTI-MIB','','OBJECT-GROUP','Group','not-accessible','','A collection of Spine specific parameters.'),('.1.3.6.1.4.1.23925.5.4','cactiNotifyGroup','CACTI-MIB','','NOTIFICATION-GROUP','Group','not-accessible','','The group of notifications Cacti supports.');
/*!40000 ALTER TABLE `snmpagent_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snmpagent_cache_notifications`
--

DROP TABLE IF EXISTS `snmpagent_cache_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snmpagent_cache_notifications` (
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mib` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sequence_id` smallint(6) NOT NULL,
  PRIMARY KEY (`name`,`mib`,`attribute`,`sequence_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Notifcations and related attributes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snmpagent_cache_notifications`
--

LOCK TABLES `snmpagent_cache_notifications` WRITE;
/*!40000 ALTER TABLE `snmpagent_cache_notifications` DISABLE KEYS */;
INSERT INTO `snmpagent_cache_notifications` VALUES ('cactiNotify','CACTI-MIB','cactiEventDescription',0),('cactiNotifyDeviceDown','CACTI-MIB','cactiApplDeviceDescription',2),('cactiNotifyDeviceDown','CACTI-MIB','cactiApplDeviceHostname',4),('cactiNotifyDeviceDown','CACTI-MIB','cactiApplDeviceIndex',0),('cactiNotifyDeviceDown','CACTI-MIB','cactiApplDeviceLastError',6),('cactiNotifyDeviceFailedPoll','CACTI-MIB','cactiApplDeviceDescription',2),('cactiNotifyDeviceFailedPoll','CACTI-MIB','cactiApplDeviceHostname',4),('cactiNotifyDeviceFailedPoll','CACTI-MIB','cactiApplDeviceIndex',0),('cactiNotifyDeviceFailedPoll','CACTI-MIB','cactiApplDeviceLastError',6),('cactiNotifyDeviceRecovering','CACTI-MIB','cactiApplDeviceDescription',2),('cactiNotifyDeviceRecovering','CACTI-MIB','cactiApplDeviceHostname',4),('cactiNotifyDeviceRecovering','CACTI-MIB','cactiApplDeviceIndex',0),('cactiNotifyDeviceRecovering','CACTI-MIB','cactiApplDeviceLastError',6),('cactiNotifyPollerRuntimeExceeding','CACTI-MIB','cactiApplPollerHostname',2),('cactiNotifyPollerRuntimeExceeding','CACTI-MIB','cactiApplPollerIndex',0),('cactiNotifyPollerRuntimeExceeding','CACTI-MIB','cactiApplPollerIpAddress',4),('snmpagentNotificationTest','CACTI-SNMPAGENT-MIB','snmpagentEventDescription',0);
/*!40000 ALTER TABLE `snmpagent_cache_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snmpagent_cache_textual_conventions`
--

DROP TABLE IF EXISTS `snmpagent_cache_textual_conventions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snmpagent_cache_textual_conventions` (
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mib` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`name`,`mib`,`type`),
  KEY `name` (`name`),
  KEY `mib` (`mib`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Textual conventions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snmpagent_cache_textual_conventions`
--

LOCK TABLES `snmpagent_cache_textual_conventions` WRITE;
/*!40000 ALTER TABLE `snmpagent_cache_textual_conventions` DISABLE KEYS */;
INSERT INTO `snmpagent_cache_textual_conventions` VALUES ('TcCactiApplPollerType','CACTI-MIB','INTEGER','Poller types:<br />\r\n<br />\r\ncmd         - php based poller<br />\r\nspine       - high performance C-based polling engine<br />\r\n'),('TcCactiApplSnmpVersion','CACTI-MIB','INTEGER','The type of SNMP being used:<br />\r\n<br />\r\nNET-SNMP<br />\r\nUCD-SNMP<br />\r\nPHP-SNMP<br />\r\n');
/*!40000 ALTER TABLE `snmpagent_cache_textual_conventions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snmpagent_managers`
--

DROP TABLE IF EXISTS `snmpagent_managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snmpagent_managers` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disabled` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_log_size` tinyint(1) NOT NULL,
  `snmp_version` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `snmp_community` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `snmp_username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `snmp_password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `snmp_auth_protocol` char(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `snmp_priv_passphrase` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `snmp_priv_protocol` char(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `snmp_engine_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `snmp_port` mediumint(5) unsigned NOT NULL DEFAULT 161,
  `snmp_message_type` tinyint(1) NOT NULL,
  `notes` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hostname` (`hostname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='snmp notification receivers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snmpagent_managers`
--

LOCK TABLES `snmpagent_managers` WRITE;
/*!40000 ALTER TABLE `snmpagent_managers` DISABLE KEYS */;
/*!40000 ALTER TABLE `snmpagent_managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snmpagent_managers_notifications`
--

DROP TABLE IF EXISTS `snmpagent_managers_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snmpagent_managers_notifications` (
  `manager_id` int(8) NOT NULL,
  `notification` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mib` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`manager_id`,`notification`,`mib`),
  KEY `mib` (`mib`),
  KEY `manager_id_notification` (`manager_id`,`notification`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='snmp notifications to receivers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snmpagent_managers_notifications`
--

LOCK TABLES `snmpagent_managers_notifications` WRITE;
/*!40000 ALTER TABLE `snmpagent_managers_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `snmpagent_managers_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snmpagent_mibs`
--

DROP TABLE IF EXISTS `snmpagent_mibs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snmpagent_mibs` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Registered MIB files';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snmpagent_mibs`
--

LOCK TABLES `snmpagent_mibs` WRITE;
/*!40000 ALTER TABLE `snmpagent_mibs` DISABLE KEYS */;
INSERT INTO `snmpagent_mibs` VALUES (1,'CACTI-MIB','/var/www/html/cacti/mibs/CACTI-MIB'),(2,'CACTI-SNMPAGENT-MIB','/var/www/html/cacti/mibs/CACTI-SNMPAGENT-MIB'),(3,'CACTI-BOOST-MIB','/var/www/html/cacti/mibs/CACTI-BOOST-MIB');
/*!40000 ALTER TABLE `snmpagent_mibs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snmpagent_notifications_log`
--

DROP TABLE IF EXISTS `snmpagent_notifications_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snmpagent_notifications_log` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `time` int(24) NOT NULL,
  `severity` tinyint(1) NOT NULL,
  `manager_id` int(8) NOT NULL,
  `notification` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mib` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `varbinds` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `severity` (`severity`),
  KEY `manager_id_notification` (`manager_id`,`notification`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='logs snmp notifications to receivers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snmpagent_notifications_log`
--

LOCK TABLES `snmpagent_notifications_log` WRITE;
/*!40000 ALTER TABLE `snmpagent_notifications_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `snmpagent_notifications_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_auth`
--

DROP TABLE IF EXISTS `user_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_auth` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `password` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `realm` mediumint(8) NOT NULL DEFAULT 0,
  `full_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `email_address` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `must_change_password` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_change` char(2) COLLATE utf8mb4_unicode_ci DEFAULT 'on',
  `show_tree` char(2) COLLATE utf8mb4_unicode_ci DEFAULT 'on',
  `show_list` char(2) COLLATE utf8mb4_unicode_ci DEFAULT 'on',
  `show_preview` char(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'on',
  `graph_settings` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_opts` tinyint(1) NOT NULL DEFAULT 1,
  `policy_graphs` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `policy_trees` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `policy_hosts` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `policy_graph_templates` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `enabled` char(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'on',
  `lastchange` int(12) NOT NULL DEFAULT -1,
  `lastlogin` int(12) NOT NULL DEFAULT -1,
  `password_history` varchar(4096) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-1',
  `locked` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `failed_attempts` int(5) NOT NULL DEFAULT 0,
  `lastfail` int(12) NOT NULL DEFAULT 0,
  `reset_perms` int(12) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `realm` (`realm`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_auth`
--

LOCK TABLES `user_auth` WRITE;
/*!40000 ALTER TABLE `user_auth` DISABLE KEYS */;
INSERT INTO `user_auth` VALUES (1,'admin','f10b480defde9a69030b3d0683e19549',0,'Administrator','','','on','on','on','on','on',2,1,1,1,1,'on',-1,-1,'-1','',0,0,1339587029),(3,'guest','43e9a4ab75570f5b',0,'Guest Account','','on','on','on','on','on','3',1,1,1,1,1,'',-1,-1,'-1','',0,0,0);
/*!40000 ALTER TABLE `user_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_auth_cache`
--

DROP TABLE IF EXISTS `user_auth_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_auth_cache` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `hostname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `last_update` timestamp NOT NULL DEFAULT current_timestamp(),
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tokenkey` (`token`),
  KEY `hostname` (`hostname`),
  KEY `user_id` (`user_id`),
  KEY `last_update` (`last_update`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Caches Remember Me Details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_auth_cache`
--

LOCK TABLES `user_auth_cache` WRITE;
/*!40000 ALTER TABLE `user_auth_cache` DISABLE KEYS */;
INSERT INTO `user_auth_cache` VALUES (1,1,'10.0.2.2','2020-03-08 00:19:54','68395f5cb7e27232e9ccc5992bef665e505c222a5f19cbe918a5a50dd33b084569ecde003fea4da31bb272139bc54b01a64b528a0f1f7b5273bf84b5dcb89b17'),(2,1,'10.0.2.2','2020-03-08 00:44:52','96814fa0cc1441ab42213e722356627159e3ca8c8905cb4fd2bf1423e1464abe9dac71118095d2401462596554a71101d0461d9d7267b2406a5e33112cf49993');
/*!40000 ALTER TABLE `user_auth_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_auth_group`
--

DROP TABLE IF EXISTS `user_auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `graph_settings` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_opts` tinyint(1) NOT NULL DEFAULT 1,
  `show_tree` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT 'on',
  `show_list` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT 'on',
  `show_preview` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'on',
  `policy_graphs` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `policy_trees` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `policy_hosts` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `policy_graph_templates` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `enabled` char(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'on',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Table that Contains User Groups';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_auth_group`
--

LOCK TABLES `user_auth_group` WRITE;
/*!40000 ALTER TABLE `user_auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_auth_group_members`
--

DROP TABLE IF EXISTS `user_auth_group_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_auth_group_members` (
  `group_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`user_id`),
  KEY `realm_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Table that Contains User Group Members';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_auth_group_members`
--

LOCK TABLES `user_auth_group_members` WRITE;
/*!40000 ALTER TABLE `user_auth_group_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_auth_group_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_auth_group_perms`
--

DROP TABLE IF EXISTS `user_auth_group_perms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_auth_group_perms` (
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `item_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `type` tinyint(2) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`group_id`,`item_id`,`type`),
  KEY `group_id` (`group_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Table that Contains User Group Permissions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_auth_group_perms`
--

LOCK TABLES `user_auth_group_perms` WRITE;
/*!40000 ALTER TABLE `user_auth_group_perms` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_auth_group_perms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_auth_group_realm`
--

DROP TABLE IF EXISTS `user_auth_group_realm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_auth_group_realm` (
  `group_id` int(10) unsigned NOT NULL,
  `realm_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`realm_id`),
  KEY `realm_id` (`realm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Table that Contains User Group Realm Permissions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_auth_group_realm`
--

LOCK TABLES `user_auth_group_realm` WRITE;
/*!40000 ALTER TABLE `user_auth_group_realm` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_auth_group_realm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_auth_perms`
--

DROP TABLE IF EXISTS `user_auth_perms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_auth_perms` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `item_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `type` tinyint(2) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`,`item_id`,`type`),
  KEY `user_id` (`user_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_auth_perms`
--

LOCK TABLES `user_auth_perms` WRITE;
/*!40000 ALTER TABLE `user_auth_perms` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_auth_perms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_auth_realm`
--

DROP TABLE IF EXISTS `user_auth_realm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_auth_realm` (
  `realm_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`realm_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_auth_realm`
--

LOCK TABLES `user_auth_realm` WRITE;
/*!40000 ALTER TABLE `user_auth_realm` DISABLE KEYS */;
INSERT INTO `user_auth_realm` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(7,1),(7,3),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(101,1),(102,1),(1043,1);
/*!40000 ALTER TABLE `user_auth_realm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_domains`
--

DROP TABLE IF EXISTS `user_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_domains` (
  `domain_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(10) unsigned NOT NULL DEFAULT 0,
  `enabled` char(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'on',
  `defdomain` tinyint(3) NOT NULL DEFAULT 0,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Table to Hold Login Domains';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_domains`
--

LOCK TABLES `user_domains` WRITE;
/*!40000 ALTER TABLE `user_domains` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_domains_ldap`
--

DROP TABLE IF EXISTS `user_domains_ldap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_domains_ldap` (
  `domain_id` int(10) unsigned NOT NULL,
  `server` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `port` int(10) unsigned NOT NULL,
  `port_ssl` int(10) unsigned NOT NULL,
  `proto_version` tinyint(3) unsigned NOT NULL,
  `encryption` tinyint(3) unsigned NOT NULL,
  `referrals` tinyint(3) unsigned NOT NULL,
  `mode` tinyint(3) unsigned NOT NULL,
  `dn` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_require` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_dn` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_attrib` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_member_type` tinyint(3) unsigned NOT NULL,
  `search_base` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `search_filter` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `specific_dn` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `specific_password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cn_full_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `cn_email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Table to Hold Login Domains for LDAP';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_domains_ldap`
--

LOCK TABLES `user_domains_ldap` WRITE;
/*!40000 ALTER TABLE `user_domains_ldap` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_domains_ldap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_log`
--

DROP TABLE IF EXISTS `user_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_log` (
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `user_id` mediumint(8) NOT NULL DEFAULT 0,
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `result` tinyint(1) NOT NULL DEFAULT 0,
  `ip` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`username`,`user_id`,`time`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_log`
--

LOCK TABLES `user_log` WRITE;
/*!40000 ALTER TABLE `user_log` DISABLE KEYS */;
INSERT INTO `user_log` VALUES ('admin',0,'2020-03-08 00:20:03',3,'10.0.2.2'),('admin',1,'2020-03-08 00:19:54',1,'10.0.2.2'),('admin',1,'2020-03-08 00:44:52',1,'10.0.2.2');
/*!40000 ALTER TABLE `user_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vdef`
--

DROP TABLE IF EXISTS `vdef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vdef` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `hash` (`hash`),
  KEY `name` (`name`(171))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='vdef';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vdef`
--

LOCK TABLES `vdef` WRITE;
/*!40000 ALTER TABLE `vdef` DISABLE KEYS */;
INSERT INTO `vdef` VALUES (1,'e06ed529238448773038601afb3cf278','Maximum'),(2,'e4872dda82092393d6459c831a50dc3b','Minimum'),(3,'5ce1061a46bb62f36840c80412d2e629','Average'),(4,'06bd3cbe802da6a0745ea5ba93af554a','Last (Current)'),(5,'631c1b9086f3979d6dcf5c7a6946f104','First'),(6,'6b5335843630b66f858ce6b7c61fc493','Total: Current Data Source'),(7,'c80d12b0f030af3574da68b28826cd39','95th Percentage: Current Data Source');
/*!40000 ALTER TABLE `vdef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vdef_items`
--

DROP TABLE IF EXISTS `vdef_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vdef_items` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `vdef_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `sequence` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `type` tinyint(2) NOT NULL DEFAULT 0,
  `value` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `vdef_id_sequence` (`vdef_id`,`sequence`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='vdef items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vdef_items`
--

LOCK TABLES `vdef_items` WRITE;
/*!40000 ALTER TABLE `vdef_items` DISABLE KEYS */;
INSERT INTO `vdef_items` VALUES (1,'88d33bf9271ac2bdf490cf1784a342c1',1,1,4,'CURRENT_DATA_SOURCE'),(2,'a307afab0c9b1779580039e3f7c4f6e5',1,2,1,'1'),(3,'0945a96068bb57c80bfbd726cf1afa02',2,1,4,'CURRENT_DATA_SOURCE'),(4,'95a8df2eac60a89e8a8ca3ea3d019c44',2,2,1,'2'),(5,'cc2e1c47ec0b4f02eb13708cf6dac585',3,1,4,'CURRENT_DATA_SOURCE'),(6,'a2fd796335b87d9ba54af6a855689507',3,2,1,'3'),(7,'a1d7974ee6018083a2053e0d0f7cb901',4,1,4,'CURRENT_DATA_SOURCE'),(8,'26fccba1c215439616bc1b83637ae7f3',4,2,1,'5'),(9,'a8993b265f4c5398f4a47c44b5b37a07',5,1,4,'CURRENT_DATA_SOURCE'),(10,'5a380d469d611719057c3695ce1e4eee',5,2,1,'6'),(11,'65cfe546b17175fad41fcca98c057feb',6,1,4,'CURRENT_DATA_SOURCE'),(12,'f330b5633c3517d7c62762cef091cc9e',6,2,1,'7'),(13,'f1bf2ecf54ca0565cf39c9c3f7e5394b',7,1,4,'CURRENT_DATA_SOURCE'),(14,'11a26f18feba3919be3af426670cba95',7,2,6,'95'),(15,'e7ae90275bc1efada07c19ca3472d9db',7,3,1,'8');
/*!40000 ALTER TABLE `vdef_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version`
--

DROP TABLE IF EXISTS `version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `version` (
  `cacti` char(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`cacti`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version`
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
INSERT INTO `version` VALUES ('1.2.9');
/*!40000 ALTER TABLE `version` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-07 17:01:00
