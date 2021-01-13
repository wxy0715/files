-- MariaDB dump 10.18  Distrib 10.4.17-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: lsblj
-- ------------------------------------------------------
-- Server version	10.4.17-MariaDB

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
-- Current Database: `lsblj`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `lsblj` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `lsblj`;
--
-- Table structure for table `lsblj_access_policy`
--

DROP TABLE IF EXISTS `lsblj_access_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_access_policy` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '策略名称',
  `valid_datetime_start` varchar(255) DEFAULT '' COMMENT '有效开始时间',
  `valid_long` tinyint(1) DEFAULT 1 COMMENT '永久有效',
  `valid_datetime_end` varchar(255) DEFAULT '' COMMENT '有效截止时间',
  `file_upload` tinyint(1) DEFAULT 1 COMMENT '允许文件上传',
  `file_download` tinyint(1) DEFAULT 1 COMMENT '允许文件下载',
  `timelimit_ban_monday` varchar(100) DEFAULT '' COMMENT '周1不允许时间',
  `timelimit_ban_tuesday` varchar(100) DEFAULT '' COMMENT '周2不允许时间',
  `timelimit_ban_wednesday` varchar(100) DEFAULT '' COMMENT '周3不允许时间',
  `timelimit_ban_thursday` varchar(100) DEFAULT '' COMMENT '周4不允许时间',
  `timelimit_ban_friday` varchar(100) DEFAULT '' COMMENT '周5不允许时间',
  `timelimit_ban_saturday` varchar(100) DEFAULT '' COMMENT '周6不允许时间',
  `timelimit_ban_sunday` varchar(100) DEFAULT '' COMMENT '周7不允许时间',
  `allow_ip` varchar(2048) DEFAULT '',
  `ban_ip` varchar(2048) DEFAULT '',
  `status` tinyint(1) DEFAULT 1 COMMENT '1启用,0禁用',
  `desc` varchar(255) DEFAULT '' COMMENT '描述',
  `priority` int(11) NOT NULL DEFAULT 0 COMMENT '优先权',
  `department` int(11) NOT NULL DEFAULT 1 COMMENT '部门id',
  `sort` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `idx_sort` (`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_access_policy`
--

LOCK TABLES `lsblj_access_policy` WRITE;
/*!40000 ALTER TABLE `lsblj_access_policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_access_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_access_policy_apppub_account`
--

DROP TABLE IF EXISTS `lsblj_access_policy_apppub_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_access_policy_apppub_account` (
  `policy_id` int(11) NOT NULL DEFAULT 0 COMMENT '策略ID',
  `apppub_account_id` int(11) NOT NULL DEFAULT 0 COMMENT '应用账号ID',
  UNIQUE KEY `policy_id` (`policy_id`,`apppub_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_access_policy_apppub_account`
--

LOCK TABLES `lsblj_access_policy_apppub_account` WRITE;
/*!40000 ALTER TABLE `lsblj_access_policy_apppub_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_access_policy_apppub_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_access_policy_device_account`
--

DROP TABLE IF EXISTS `lsblj_access_policy_device_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_access_policy_device_account` (
  `policy_id` int(11) NOT NULL DEFAULT 0 COMMENT '策略ID',
  `device_account_id` int(11) NOT NULL DEFAULT 0 COMMENT '设备账号ID',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '运维人员对设备账号的备注',
  UNIQUE KEY `policy_id` (`policy_id`,`device_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_access_policy_device_account`
--

LOCK TABLES `lsblj_access_policy_device_account` WRITE;
/*!40000 ALTER TABLE `lsblj_access_policy_device_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_access_policy_device_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_access_policy_group`
--

DROP TABLE IF EXISTS `lsblj_access_policy_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_access_policy_group` (
  `policy_id` int(11) NOT NULL DEFAULT 0 COMMENT '策略ID',
  `group_id` int(11) NOT NULL DEFAULT 0 COMMENT '组ID',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '类型',
  UNIQUE KEY `policy_id` (`policy_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_access_policy_group`
--

LOCK TABLES `lsblj_access_policy_group` WRITE;
/*!40000 ALTER TABLE `lsblj_access_policy_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_access_policy_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_access_policy_user`
--

DROP TABLE IF EXISTS `lsblj_access_policy_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_access_policy_user` (
  `policy_id` int(11) NOT NULL DEFAULT 0 COMMENT '策略ID',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID',
  UNIQUE KEY `policy_id` (`policy_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_access_policy_user`
--

LOCK TABLES `lsblj_access_policy_user` WRITE;
/*!40000 ALTER TABLE `lsblj_access_policy_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_access_policy_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_alert_log`
--

DROP TABLE IF EXISTS `lsblj_alert_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_alert_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `source_ip` varchar(150) NOT NULL DEFAULT '' COMMENT '来源IP',
  `user_id` int(11) NOT NULL DEFAULT 1 COMMENT '用户id',
  `username` varchar(150) NOT NULL DEFAULT '' COMMENT '用户名',
  `realname` varchar(50) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `device_ip` varchar(150) NOT NULL DEFAULT '' COMMENT '服务器IP',
  `device_account` varchar(100) NOT NULL DEFAULT '' COMMENT '设备账户',
  `command` varchar(100) NOT NULL DEFAULT '' COMMENT '告警命令',
  `operate_datetime` int(10) NOT NULL DEFAULT 0 COMMENT '操作时间',
  `protocol` varchar(50) NOT NULL DEFAULT '' COMMENT '登录协议',
  `operational_group` varchar(100) NOT NULL DEFAULT '' COMMENT '运维组',
  `alert_times` varchar(100) NOT NULL DEFAULT '0' COMMENT '命令次数',
  `isemail` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否发送邮件',
  `email_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发送时间',
  `issms` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否发送短信',
  `sms_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发送时间',
  `email_count` tinyint(2) NOT NULL DEFAULT 0 COMMENT '发送邮件次数',
  `sms_count` tinyint(2) NOT NULL DEFAULT 0 COMMENT '发送短信次数',
  `policy_id` int(11) NOT NULL DEFAULT 0 COMMENT '策略ID',
  `dangerlevel` tinyint(2) NOT NULL DEFAULT 0 COMMENT '事件级别',
  `workorder_apply_id` int(11) NOT NULL DEFAULT 0 COMMENT '工单申请ID',
  `result` tinyint(1) NOT NULL DEFAULT 0 COMMENT '执行结果',
  `department` int(11) NOT NULL DEFAULT 1 COMMENT '部门id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_alert_log`
--

LOCK TABLES `lsblj_alert_log` WRITE;
/*!40000 ALTER TABLE `lsblj_alert_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_alert_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_app_loginkey`
--

DROP TABLE IF EXISTS `lsblj_app_loginkey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_app_loginkey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginkey` varchar(50) NOT NULL COMMENT '密钥',
  `userid` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `logintime` int(10) NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='app登录密钥';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_app_loginkey`
--

LOCK TABLES `lsblj_app_loginkey` WRITE;
/*!40000 ALTER TABLE `lsblj_app_loginkey` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_app_loginkey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_apppub_account`
--

DROP TABLE IF EXISTS `lsblj_apppub_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_apppub_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '应用名称',
  `department` int(11) NOT NULL DEFAULT 1 COMMENT '部门ID，为空时置0',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `apppub_program_id` int(10) NOT NULL COMMENT '程序ID',
  `url` varchar(1024) DEFAULT NULL COMMENT '访问地址',
  `desc` varchar(1024) DEFAULT NULL COMMENT '描述',
  `apppub_server_id` int(11) NOT NULL DEFAULT 0 COMMENT '应用发布服务器ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_apppub_account`
--

LOCK TABLES `lsblj_apppub_account` WRITE;
/*!40000 ALTER TABLE `lsblj_apppub_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_apppub_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_apppub_program`
--

DROP TABLE IF EXISTS `lsblj_apppub_program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_apppub_program` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apppub_server_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '应用名称',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `parameter` varchar(255) NOT NULL DEFAULT '0' COMMENT '参数',
  `icon` varchar(255) NOT NULL DEFAULT '0' COMMENT '图标',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_apppub_program`
--

LOCK TABLES `lsblj_apppub_program` WRITE;
/*!40000 ALTER TABLE `lsblj_apppub_program` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_apppub_program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_apppub_record`
--

DROP TABLE IF EXISTS `lsblj_apppub_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_apppub_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_ip` varchar(150) NOT NULL DEFAULT '' COMMENT '来源ip',
  `server_ip` varchar(150) NOT NULL DEFAULT '',
  `port` int(11) NOT NULL DEFAULT 0 COMMENT '端口',
  `start` int(10) NOT NULL DEFAULT 0,
  `start_of_millis` bigint(15) NOT NULL DEFAULT 0 COMMENT '开始时间(精确到毫秒)',
  `end` int(10) NOT NULL DEFAULT 0,
  `log_file` varchar(255) NOT NULL DEFAULT '',
  `video_file` varchar(255) NOT NULL DEFAULT '' COMMENT '日志文件',
  `login_type_id` tinyint(1) NOT NULL DEFAULT 0 COMMENT '资源类型id',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户',
  `apppub_account_id` int(11) NOT NULL DEFAULT 0 COMMENT '应用账号',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '应用名称',
  `program` varchar(2048) NOT NULL DEFAULT '' COMMENT '程序',
  `username` varchar(100) NOT NULL DEFAULT '' COMMENT '运维用户',
  `realname` varchar(100) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `apppub_username` varchar(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态',
  `time_length` int(11) NOT NULL DEFAULT 0 COMMENT '会话时长',
  `access_parameter` varchar(255) NOT NULL DEFAULT '' COMMENT '访问参数',
  `log_file_size` double(10,0) NOT NULL DEFAULT 0 COMMENT '会话大小',
  `video_file_size` int(11) NOT NULL DEFAULT 0 COMMENT '回放文件大小',
  `client_mac` varchar(255) NOT NULL DEFAULT '' COMMENT '来源MAC',
  `department` int(11) NOT NULL DEFAULT 1 COMMENT '部门ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_apppub_record`
--

LOCK TABLES `lsblj_apppub_record` WRITE;
/*!40000 ALTER TABLE `lsblj_apppub_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_apppub_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_apppub_server`
--

DROP TABLE IF EXISTS `lsblj_apppub_server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_apppub_server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(150) NOT NULL DEFAULT '0' COMMENT '服务器地址',
  `department` int(11) NOT NULL DEFAULT 1,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '服务器名称',
  `desc` varchar(1024) NOT NULL DEFAULT '' COMMENT '描述',
  `port` int(11) DEFAULT NULL,
  `account` varchar(255) NOT NULL DEFAULT '' COMMENT '账号',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `adport` int(11) NOT NULL DEFAULT 389 COMMENT 'AD/LDAP端口',
  `os_type` int(2) NOT NULL DEFAULT 0 COMMENT '系统类型 0：Windows（默认），1：Linux',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_apppub_server`
--

LOCK TABLES `lsblj_apppub_server` WRITE;
/*!40000 ALTER TABLE `lsblj_apppub_server` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_apppub_server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_backup_config`
--

DROP TABLE IF EXISTS `lsblj_backup_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_backup_config` (
  `seq` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) NOT NULL,
  `port` smallint(6) NOT NULL,
  `dbactive` tinyint(1) DEFAULT NULL,
  `fileactive` tinyint(1) DEFAULT NULL,
  `user` varchar(20) DEFAULT NULL,
  `passwd` blob DEFAULT NULL,
  `mysqluser` varchar(20) DEFAULT NULL,
  `mysqlpasswd` blob DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL,
  `dbname` varchar(100) DEFAULT NULL,
  `enable` int(11) NOT NULL,
  `session_flag` tinyint(1) DEFAULT 0,
  `protocol` varchar(15) DEFAULT NULL,
  `desc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自动备份';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_backup_config`
--

LOCK TABLES `lsblj_backup_config` WRITE;
/*!40000 ALTER TABLE `lsblj_backup_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_backup_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_backup_log`
--

DROP TABLE IF EXISTS `lsblj_backup_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_backup_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `filesize` int(11) NOT NULL DEFAULT 0,
  `filepath` varchar(200) NOT NULL DEFAULT '',
  `backup_datetime` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_backup_log`
--

LOCK TABLES `lsblj_backup_log` WRITE;
/*!40000 ALTER TABLE `lsblj_backup_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_backup_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_change_password_log`
--

DROP TABLE IF EXISTS `lsblj_change_password_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_change_password_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exec_datetime` datetime(5) NOT NULL COMMENT '修改时间',
  `device_ip` varchar(20) NOT NULL COMMENT '设备地址',
  `device_port` int(7) NOT NULL DEFAULT 0 COMMENT '端口',
  `device_username` varchar(20) NOT NULL COMMENT '设备账号',
  `device_name` varchar(50) NOT NULL COMMENT '设备名称',
  `update_success_flag` varchar(5) NOT NULL COMMENT '修改结果 0 失败 1 成功',
  `password` varchar(255) NOT NULL DEFAULT '',
  `old_password` varchar(255) NOT NULL DEFAULT '' COMMENT '原密码',
  `end_datetime` datetime(5) NOT NULL COMMENT '结束时间',
  `change_pa` varchar(20) DEFAULT NULL COMMENT '改密次数',
  `policy_id` int(11) NOT NULL DEFAULT 0 COMMENT '策略ID',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_change_password_log`
--

LOCK TABLES `lsblj_change_password_log` WRITE;
/*!40000 ALTER TABLE `lsblj_change_password_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_change_password_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_change_password_policy`
--

DROP TABLE IF EXISTS `lsblj_change_password_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_change_password_policy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '任务名称',
  `status` smallint(2) DEFAULT 1 COMMENT '0禁1启用',
  `file_id` int(11) NOT NULL DEFAULT 0,
  `changetype` smallint(2) NOT NULL DEFAULT 0 COMMENT '改密方式0不同密码1相同密码2指定相同密码',
  `exec_method` int(1) NOT NULL DEFAULT 1 COMMENT '执行方式0是手动,1定时,2是周期',
  `exec_datetime` varchar(20) NOT NULL DEFAULT '0000-00-00' COMMENT '执行时间',
  `exec_cycle` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0每分钟1每小时...',
  `internal` smallint(5) NOT NULL DEFAULT 0 COMMENT '间隔',
  `end_datetime` varchar(20) NOT NULL DEFAULT '0000-00-00' COMMENT '结束时间',
  `description` varchar(2048) NOT NULL DEFAULT '' COMMENT '描述',
  `allow_root` tinyint(1) NOT NULL DEFAULT 1 COMMENT '优先使用特权账号改密',
  `allow_change_root` tinyint(1) NOT NULL DEFAULT 1 COMMENT '允许修改特权账号密码',
  `password` varchar(255) DEFAULT '' COMMENT '指定密码',
  `type` varchar(255) DEFAULT NULL,
  `department` int(11) NOT NULL DEFAULT 1 COMMENT '部门id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_change_password_policy`
--

LOCK TABLES `lsblj_change_password_policy` WRITE;
/*!40000 ALTER TABLE `lsblj_change_password_policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_change_password_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_change_password_policy_apppub_account`
--

DROP TABLE IF EXISTS `lsblj_change_password_policy_apppub_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_change_password_policy_apppub_account` (
  `policy_id` int(11) NOT NULL COMMENT '策略ID',
  `apppub_id` varchar(255) NOT NULL DEFAULT '' COMMENT '应用ID',
  PRIMARY KEY (`policy_id`,`apppub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_change_password_policy_apppub_account`
--

LOCK TABLES `lsblj_change_password_policy_apppub_account` WRITE;
/*!40000 ALTER TABLE `lsblj_change_password_policy_apppub_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_change_password_policy_apppub_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_change_password_policy_device_account`
--

DROP TABLE IF EXISTS `lsblj_change_password_policy_device_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_change_password_policy_device_account` (
  `policy_id` int(11) NOT NULL COMMENT '策略ID',
  `device_account_id` int(11) NOT NULL DEFAULT 0 COMMENT '设备账号ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_change_password_policy_device_account`
--

LOCK TABLES `lsblj_change_password_policy_device_account` WRITE;
/*!40000 ALTER TABLE `lsblj_change_password_policy_device_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_change_password_policy_device_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_change_password_policy_group`
--

DROP TABLE IF EXISTS `lsblj_change_password_policy_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_change_password_policy_group` (
  `policy_id` int(11) NOT NULL COMMENT '策略ID',
  `group_id` varchar(255) NOT NULL DEFAULT '' COMMENT '组ID',
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '类型'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_change_password_policy_group`
--

LOCK TABLES `lsblj_change_password_policy_group` WRITE;
/*!40000 ALTER TABLE `lsblj_change_password_policy_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_change_password_policy_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_cmd_policy`
--

DROP TABLE IF EXISTS `lsblj_cmd_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_cmd_policy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cmd_parameter` varchar(255) DEFAULT '' COMMENT '命令集参数',
  `cmd_name` varchar(255) DEFAULT '' COMMENT '命令集名称',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '策略名称',
  `valid_datetime_start` varchar(50) DEFAULT '0' COMMENT '有效开始时间',
  `valid_datetime_end` varchar(50) DEFAULT '0' COMMENT '有效截止时间',
  `longtime` int(10) DEFAULT 0 COMMENT '1永久有效 0有具体时间',
  `department_id` int(11) NOT NULL DEFAULT 1 COMMENT '部门ID',
  `execute_action` tinyint(1) DEFAULT 1 COMMENT '4断开连接，3拒绝执行，2动态授权 1允许执行',
  `timelimit_ban_monday` varchar(100) DEFAULT '' COMMENT '周1不允许时间',
  `timelimit_ban_tuesday` varchar(100) DEFAULT '' COMMENT '周2不允许时间',
  `timelimit_ban_wednesday` varchar(100) DEFAULT '' COMMENT '周3不允许时间',
  `timelimit_ban_thursday` varchar(100) DEFAULT '' COMMENT '周4不允许时间',
  `timelimit_ban_friday` varchar(100) DEFAULT '' COMMENT '周5不允许时间',
  `timelimit_ban_saturday` varchar(100) DEFAULT '' COMMENT '周6不允许时间',
  `timelimit_ban_sunday` varchar(100) DEFAULT '' COMMENT '周7不允许时间',
  `white_or_black` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0白名单1黑名单',
  `allow_ip` varchar(2048) DEFAULT '' COMMENT '允许的IP',
  `ban_ip` varchar(2048) DEFAULT '' COMMENT '禁止IP',
  `status` tinyint(1) DEFAULT 1 COMMENT '0禁用,1启用',
  `cmd` varchar(255) DEFAULT '' COMMENT '命令',
  `desc` text NOT NULL DEFAULT '' COMMENT '描述',
  `alert_level` varchar(2) DEFAULT '1' COMMENT '告警级别:1低,2中,3高',
  `alert_methods` varchar(10) DEFAULT '100' COMMENT '消息邮件短信',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_cmd_policy`
--

LOCK TABLES `lsblj_cmd_policy` WRITE;
/*!40000 ALTER TABLE `lsblj_cmd_policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_cmd_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_cmd_policy_apppub`
--

DROP TABLE IF EXISTS `lsblj_cmd_policy_apppub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_cmd_policy_apppub` (
  `policy_id` int(11) NOT NULL DEFAULT 0 COMMENT '策略ID',
  `apppub_id` int(11) NOT NULL DEFAULT 0 COMMENT '应用ID',
  UNIQUE KEY `policy_id` (`policy_id`,`apppub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_cmd_policy_apppub`
--

LOCK TABLES `lsblj_cmd_policy_apppub` WRITE;
/*!40000 ALTER TABLE `lsblj_cmd_policy_apppub` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_cmd_policy_apppub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_cmd_policy_cmd`
--

DROP TABLE IF EXISTS `lsblj_cmd_policy_cmd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_cmd_policy_cmd` (
  `policy_id` int(11) NOT NULL DEFAULT 0 COMMENT '组ID',
  `command` varchar(255) NOT NULL DEFAULT '' COMMENT '命令',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_cmd_policy_cmd`
--

LOCK TABLES `lsblj_cmd_policy_cmd` WRITE;
/*!40000 ALTER TABLE `lsblj_cmd_policy_cmd` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_cmd_policy_cmd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_cmd_policy_cmdgroup`
--

DROP TABLE IF EXISTS `lsblj_cmd_policy_cmdgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_cmd_policy_cmdgroup` (
  `policy_id` int(11) NOT NULL DEFAULT 0 COMMENT '策略ID',
  `cmdgroup_id` int(11) NOT NULL DEFAULT 0 COMMENT '组ID',
  UNIQUE KEY `policy_id` (`policy_id`,`cmdgroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_cmd_policy_cmdgroup`
--

LOCK TABLES `lsblj_cmd_policy_cmdgroup` WRITE;
/*!40000 ALTER TABLE `lsblj_cmd_policy_cmdgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_cmd_policy_cmdgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_cmd_policy_device_account`
--

DROP TABLE IF EXISTS `lsblj_cmd_policy_device_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_cmd_policy_device_account` (
  `policy_id` int(11) NOT NULL DEFAULT 0 COMMENT '策略ID',
  `device_account_id` int(11) NOT NULL DEFAULT 0 COMMENT '设备账号ID',
  UNIQUE KEY `policy_id` (`policy_id`,`device_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_cmd_policy_device_account`
--

LOCK TABLES `lsblj_cmd_policy_device_account` WRITE;
/*!40000 ALTER TABLE `lsblj_cmd_policy_device_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_cmd_policy_device_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_cmd_policy_group`
--

DROP TABLE IF EXISTS `lsblj_cmd_policy_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_cmd_policy_group` (
  `policy_id` int(11) NOT NULL DEFAULT 0 COMMENT '策略ID',
  `group_id` int(11) NOT NULL DEFAULT 0 COMMENT '组ID',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0是用户组 1是设备组'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_cmd_policy_group`
--

LOCK TABLES `lsblj_cmd_policy_group` WRITE;
/*!40000 ALTER TABLE `lsblj_cmd_policy_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_cmd_policy_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_cmd_policy_user`
--

DROP TABLE IF EXISTS `lsblj_cmd_policy_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_cmd_policy_user` (
  `policy_id` int(11) NOT NULL DEFAULT 0 COMMENT '策略ID',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_cmd_policy_user`
--

LOCK TABLES `lsblj_cmd_policy_user` WRITE;
/*!40000 ALTER TABLE `lsblj_cmd_policy_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_cmd_policy_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_cmdgroup`
--

DROP TABLE IF EXISTS `lsblj_cmdgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_cmdgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组ID',
  `name` varchar(255) NOT NULL COMMENT '组名称',
  `cmd` varchar(255) NOT NULL DEFAULT '' COMMENT '命令/参数',
  `department` int(11) NOT NULL DEFAULT 1 COMMENT '部门id',
  `description` varchar(255) DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_cmdgroup`
--

LOCK TABLES `lsblj_cmdgroup` WRITE;
/*!40000 ALTER TABLE `lsblj_cmdgroup` DISABLE KEYS */;
INSERT INTO `lsblj_cmdgroup` VALUES (1,'高危命令集_申请确认','',1,'高危命令集，无法删除！'),(2,'高危命令集_指令阻断','',1,'高危命令集，无法删除！'),(3,'高危命令集_会话阻断','',1,'高危命令集，无法删除！');
/*!40000 ALTER TABLE `lsblj_cmdgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_cmdgroup_cmd`
--

DROP TABLE IF EXISTS `lsblj_cmdgroup_cmd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_cmdgroup_cmd` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '命令ID',
  `group_id` int(11) NOT NULL COMMENT '组ID',
  `command` varchar(255) NOT NULL DEFAULT '' COMMENT '命令',
  `regular` int(2) DEFAULT 0 COMMENT '是否正则 1:是正则,0:不是正则',
  `risk_desc` varchar(255) DEFAULT NULL COMMENT '风险描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_cmdgroup_cmd`
--

LOCK TABLES `lsblj_cmdgroup_cmd` WRITE;
/*!40000 ALTER TABLE `lsblj_cmdgroup_cmd` DISABLE KEYS */;
INSERT INTO `lsblj_cmdgroup_cmd` VALUES (1,3,'format',0,'格式化'),(8,3,'remove running.cfg',0,'清空配置（ZTE）'),(10,1,'reboot',0,'重启'),(12,1,'shutdown',0,'关闭系统；关闭接口'),(13,1,'halt',0,'关闭系统'),(14,1,'poweroff',0,'关闭系统'),(15,1,'init 0',0,'停机'),(16,1,'pkill',0,'杀死进程'),(17,1,'kill',0,'杀死进程'),(18,1,'rm -rf',0,'rm -rf为递归强制删除，忽视提示'),(19,1,'mount',0,'挂载文件系统，有病毒拷贝风险'),(20,1,'umount',0,'卸载文件系统'),(21,1,'parted',0,'文件系统分区'),(43,2,'remove running.cfg',0,'清空配置（ZTE）'),(44,2,'format',0,'格式化');
/*!40000 ALTER TABLE `lsblj_cmdgroup_cmd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_config`
--

DROP TABLE IF EXISTS `lsblj_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_config`
--

LOCK TABLES `lsblj_config` WRITE;
/*!40000 ALTER TABLE `lsblj_config` DISABLE KEYS */;
INSERT INTO `lsblj_config` VALUES (1,'companyname','blj.Tec'),(2,'recordpath','/opt/lsblj/records'),(3,'textLoginType','1,3,5,6'),(4,'graphLoginType','2,4'),(5,'connectDataSource','longersec'),(6,'baoleijisshport','12288'),(7,'baoleijireplayusername','bljreplayuser'),(8,'baoleijireplaypassword','bljreplaypassword'),(9,'baoleijireplayaddress','localhost'),(10,'keepAliveConfigFile','/etc/keepalived/keepalived.conf'),(11,'mariadbConfigFile','/opt/lsblj/mariadb/conf/mariadb.conf'),(12,'interfacePath','/etc/sysconfig/network-scripts'),(13,'network','/etc/sysconfig/network'),(14,'userdriver','/opt/lsblj/driver'),(15,'lsbljHome','/opt/lsblj'),(16,'lsbljBackupRecord','/usr/bin/python3 /opt/lsblj/server/bin/BackUp.pyc'),(17,'lsbljCronFile','/opt/lsblj/cron/cronscripts'),(18,'fileUploadPath','/opt/lsblj/uploadfils'),(19,'lsbljCrontabCommand','/usr/bin/python3 /opt/lsblj/server/bin/autoCmd.pyc'),(20,'lsbljChangePasswordCommand','/usr/bin/python3 /opt/lsblj/server/bin/changePassword.pyc'),(21,'lsbljSendEmail','/usr/bin/python3 /opt/lsblj/server/bin/SendMail.pyc'),(22,'lsbljSendSms','/usr/bin/python3 /opt/lsblj/server/bin/SendSMS.pyc'),(23,'ftpport','5521'),(24,'sftpPort','5522'),(25,'dbbackuppath','/opt/lsblj/dbbackup'),(26,'licensepath','/opt/lsblj/license'),(27,'baoleijihostname','baoleiji'),(28,'baoleijiip','192.168.1.201'),(29,'lsbljtcplogCommand','/usr/bin/python3 /opt/lsblj/server/bin/sendTcpLog.pyc'),(30,'EFilePath','/opt/lsblj/efile'),(31,'LinuxApppubVncBasePort','15900'),(32,'WindowsApppubAdphpPort','20616'),(33,'recordVideoCommand','/opt/lsblj/server/bin/guacenc'),(34,'NanRuiUSBKEYVerifySignCmd','/opt/lsblj/server/bin/vwdukey'),(35,'baoleijislavehostname','GO TECH-SOP-E Backup'),(36,'baoleijislaveip','192.168.75.176'),(37,'rclocalfile','/etc/rc.d/rc.local');
/*!40000 ALTER TABLE `lsblj_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_config_alert_level`
--

DROP TABLE IF EXISTS `lsblj_config_alert_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_config_alert_level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cpu_max` tinyint(3) NOT NULL DEFAULT 0 COMMENT 'cpu使用最大百分比',
  `disk_max` tinyint(3) NOT NULL DEFAULT 0 COMMENT '硬盘使用最大百分比',
  `memory_max` tinyint(3) NOT NULL DEFAULT 0 COMMENT '内存使用最大百分比',
  `swap_max` int(11) NOT NULL DEFAULT 0 COMMENT '虚拟内存',
  `cpu_max_msg` varchar(3) NOT NULL DEFAULT '' COMMENT 'cpu告警方式1消息2邮件3短信',
  `disk_max_msg` varchar(3) NOT NULL DEFAULT '' COMMENT '硬盘告警方式1消息2邮件3短信',
  `memory_max_msg` varchar(3) NOT NULL DEFAULT '' COMMENT '内存告警方式1消息2邮件3短信',
  `swap_max_msg` varchar(3) NOT NULL DEFAULT '' COMMENT '虚拟内存告警方式1消息2邮件3短信',
  `cpu_max_level` tinyint(2) NOT NULL DEFAULT 1 COMMENT '0关闭1低级2中级3高级',
  `disk_max_level` tinyint(2) NOT NULL DEFAULT 1 COMMENT '0关闭1低级2中级3高级',
  `memory_max_level` tinyint(12) NOT NULL DEFAULT 1 COMMENT '0关闭1低级2中级3高级',
  `swap_max_level` tinyint(2) NOT NULL DEFAULT 1 COMMENT '0关闭1低级2中级3高级 ',
  `web_max` tinyint(3) NOT NULL DEFAULT 0 COMMENT 'web并发最大阈值',
  `ssh_max` tinyint(3) NOT NULL DEFAULT 0 COMMENT 'ssh并发最大阈值',
  `rdp_max` tinyint(3) NOT NULL DEFAULT 0 COMMENT 'rdp并发最大阈值',
  `telnet_max` int(11) NOT NULL DEFAULT 0 COMMENT 'telnet并发最大阈值',
  `app_max` int(11) NOT NULL DEFAULT 0 COMMENT 'app并发最大阈值',
  `sftp_max` int(11) NOT NULL DEFAULT 0 COMMENT 'sftp并发最大阈值',
  `ftp_max` int(11) NOT NULL DEFAULT 0 COMMENT 'ftp并发最大阈值',
  `vnc_max` int(11) NOT NULL DEFAULT 0 COMMENT 'vnc并发最大阈值',
  `web_max_msg` varchar(3) NOT NULL DEFAULT '' COMMENT '告警方式1消息2邮件3短信',
  `ssh_max_msg` varchar(3) NOT NULL DEFAULT '' COMMENT '告警方式1消息2邮件3短信',
  `rdp_max_msg` varchar(3) NOT NULL DEFAULT '' COMMENT '告警方式1消息2邮件3短信',
  `app_max_msg` varchar(3) NOT NULL DEFAULT '' COMMENT '告警方式1消息2邮件3短信',
  `telnet_max_msg` varchar(3) NOT NULL DEFAULT '' COMMENT '告警方式1消息2邮件3短信',
  `vnc_max_msg` varchar(3) NOT NULL DEFAULT '' COMMENT '虚拟内存告警方式1消息2邮件3短信',
  `sftp_max_msg` varchar(3) NOT NULL DEFAULT '' COMMENT '告警方式1消息2邮件3短信',
  `ftp_max_msg` varchar(3) NOT NULL DEFAULT '' COMMENT '告警方式1消息2邮件3短信',
  `web_max_level` tinyint(2) NOT NULL DEFAULT 1 COMMENT '0关闭1低级2中级3高级',
  `ssh_max_level` tinyint(2) NOT NULL DEFAULT 1 COMMENT '0关闭1低级2中级3高级',
  `rdp_max_level` tinyint(12) NOT NULL DEFAULT 1 COMMENT '0关闭1低级2中级3高级',
  `app_max_level` tinyint(12) NOT NULL DEFAULT 1 COMMENT '0关闭1低级2中级3高级',
  `telnet_max_level` tinyint(12) NOT NULL DEFAULT 1 COMMENT '0关闭1低级2中级3高级',
  `sftp_max_level` tinyint(12) NOT NULL DEFAULT 1 COMMENT '0关闭1低级2中级3高级',
  `ftp_max_level` tinyint(12) NOT NULL DEFAULT 1 COMMENT '0关闭1低级2中级3高级',
  `vnc_max_level` tinyint(2) NOT NULL DEFAULT 1 COMMENT '0关闭1低级2中级3高级 ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='告警参数';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_config_alert_level`
--

LOCK TABLES `lsblj_config_alert_level` WRITE;
/*!40000 ALTER TABLE `lsblj_config_alert_level` DISABLE KEYS */;
INSERT INTO `lsblj_config_alert_level` VALUES (1,90,80,90,50,'101','111','101','110',3,1,2,2,2,66,77,99,77,64,0,88,'011','110','110','110','110','111','011','011',3,2,3,3,2,2,1,1);
/*!40000 ALTER TABLE `lsblj_config_alert_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_config_certification`
--

DROP TABLE IF EXISTS `lsblj_config_certification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_config_certification` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '根证书名称',
  `keyword` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '根证书关键字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_config_certification`
--

LOCK TABLES `lsblj_config_certification` WRITE;
/*!40000 ALTER TABLE `lsblj_config_certification` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_config_certification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_config_cluster`
--

DROP TABLE IF EXISTS `lsblj_config_cluster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_config_cluster` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '节点名称',
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '节点IP地址',
  `pwd` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '集群密钥',
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_config_cluster`
--

LOCK TABLES `lsblj_config_cluster` WRITE;
/*!40000 ALTER TABLE `lsblj_config_cluster` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_config_cluster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_config_connector`
--

DROP TABLE IF EXISTS `lsblj_config_connector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_config_connector` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `connector_name` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '业务系统名称',
  `connector_account` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '认证接口账号',
  `connector_password` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT ' 认证接口密码',
  `description` varchar(128) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_config_connector`
--

LOCK TABLES `lsblj_config_connector` WRITE;
/*!40000 ALTER TABLE `lsblj_config_connector` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_config_connector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_config_dbbackup`
--

DROP TABLE IF EXISTS `lsblj_config_dbbackup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_config_dbbackup` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `backup_time` int(10) NOT NULL DEFAULT 0 COMMENT '备份时间',
  `filesize` int(11) NOT NULL DEFAULT 0 COMMENT '文件大小',
  `desc` varchar(2048) NOT NULL DEFAULT '' COMMENT '描述',
  `filepath` varchar(255) NOT NULL DEFAULT '' COMMENT '备份文件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COMMENT='数据库备份表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_config_dbbackup`
--

LOCK TABLES `lsblj_config_dbbackup` WRITE;
/*!40000 ALTER TABLE `lsblj_config_dbbackup` DISABLE KEYS */;
INSERT INTO `lsblj_config_dbbackup` VALUES (18,1607525544,20609196,'test','/opt/lsblj/dbbackup/lsblj-20201209105224.sql'),(19,1607841404,22454742,'aaa','/opt/lsblj/dbbackup/lsblj-20201213023644.sql');
/*!40000 ALTER TABLE `lsblj_config_dbbackup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_config_disksession`
--

DROP TABLE IF EXISTS `lsblj_config_disksession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_config_disksession` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `disk_config_enable` tinyint(1) NOT NULL DEFAULT 0 COMMENT ' 0未启用1启用',
  `disk_max_persent` smallint(5) NOT NULL DEFAULT 0 COMMENT '存储百分比',
  `disk_write_type` smallint(5) NOT NULL DEFAULT 0 COMMENT '动作选择,0停止审计,1覆盖旧文件',
  `session_backup_enable` tinyint(1) NOT NULL DEFAULT 0 COMMENT '审计备份是否启用0否1是',
  `session_backup_time` varchar(10) NOT NULL DEFAULT '00:00' COMMENT '备份时间',
  `session_backup_type` smallint(5) NOT NULL DEFAULT 0 COMMENT '备份协议0ftp1sftp',
  `session_backup_host` varchar(50) NOT NULL DEFAULT '' COMMENT '备份地址',
  `session_backup_port` int(6) NOT NULL DEFAULT 21 COMMENT '端口',
  `session_backup_username` varchar(255) NOT NULL DEFAULT '' COMMENT '账号',
  `session_backup_password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `session_backup_path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `session_backup_iscompress` tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否压缩0不压缩1压缩',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='磁盘和备份配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_config_disksession`
--

LOCK TABLES `lsblj_config_disksession` WRITE;
/*!40000 ALTER TABLE `lsblj_config_disksession` DISABLE KEYS */;
INSERT INTO `lsblj_config_disksession` VALUES (1,1,1,1,1,'23:00',0,'192.168.2.200',7788,'sss','75ff286d59ed4e938db05a5bd54a7ad6','/baoleiji/h',1);
/*!40000 ALTER TABLE `lsblj_config_disksession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_config_email`
--

DROP TABLE IF EXISTS `lsblj_config_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_config_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ip` varchar(150) NOT NULL DEFAULT '' COMMENT '服务器IP',
  `ssl` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'ssl',
  `port` int(11) NOT NULL DEFAULT 0 COMMENT '服务器端口',
  `username` varchar(150) NOT NULL DEFAULT '' COMMENT '账号',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0关闭1开启',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='邮箱配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_config_email`
--

LOCK TABLES `lsblj_config_email` WRITE;
/*!40000 ALTER TABLE `lsblj_config_email` DISABLE KEYS */;
INSERT INTO `lsblj_config_email` VALUES (1,'',1,465,'','',0);
/*!40000 ALTER TABLE `lsblj_config_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_config_finger`
--

DROP TABLE IF EXISTS `lsblj_config_finger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_config_finger` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `url` varchar(150) NOT NULL DEFAULT '' COMMENT '接口地址',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0禁用1启用',
  `endpoint` varchar(255) NOT NULL DEFAULT '' COMMENT '账号',
  `pwd` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='指纹配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_config_finger`
--

LOCK TABLES `lsblj_config_finger` WRITE;
/*!40000 ALTER TABLE `lsblj_config_finger` DISABLE KEYS */;
INSERT INTO `lsblj_config_finger` VALUES (1,'',0,'','');
/*!40000 ALTER TABLE `lsblj_config_finger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_config_ldap_ad`
--

DROP TABLE IF EXISTS `lsblj_config_ldap_ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_config_ldap_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ip` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器地址',
  `port` smallint(5) NOT NULL DEFAULT 0 COMMENT '端口',
  `domain` varchar(255) NOT NULL DEFAULT '' COMMENT '域',
  `basedn` varchar(255) NOT NULL DEFAULT '' COMMENT 'base dn',
  `administrator` varchar(255) NOT NULL DEFAULT '' COMMENT '管理员账号DN',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '管理员密码',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态0ldap,1ad',
  `ssl` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态',
  `filter_department` varchar(255) NOT NULL DEFAULT '' COMMENT '部门过滤',
  `filter_username` varchar(255) NOT NULL DEFAULT '' COMMENT '用户过滤',
  `filter_loginname` varchar(255) NOT NULL DEFAULT '' COMMENT '登录名过滤',
  `username` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名对应属性',
  `realname` varchar(255) NOT NULL DEFAULT '' COMMENT '姓名对应属性',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱对应属性',
  `mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '手机号对应属性',
  `async` tinyint(1) NOT NULL DEFAULT 0 COMMENT '同步方式',
  `department_id` int(11) NOT NULL DEFAULT 0 COMMENT '目标部门',
  `cover` tinyint(1) NOT NULL DEFAULT 1 COMMENT '覆盖已有用户0否，1覆盖',
  `add_department` tinyint(1) NOT NULL DEFAULT 0 COMMENT '创建新部门',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='ldap_ad';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_config_ldap_ad`
--

LOCK TABLES `lsblj_config_ldap_ad` WRITE;
/*!40000 ALTER TABLE `lsblj_config_ldap_ad` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_config_ldap_ad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_config_login`
--

DROP TABLE IF EXISTS `lsblj_config_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_config_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `lock_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '锁定类型0用户1来源IP',
  `lock_try_count` smallint(5) NOT NULL DEFAULT 0 COMMENT '尝试密码次数',
  `lock_time_length` smallint(5) NOT NULL DEFAULT 0 COMMENT '锁定时长',
  `lock_count_reset` smallint(5) NOT NULL DEFAULT 0 COMMENT '重置计数器时长',
  `lock_time` int(10) NOT NULL DEFAULT 0 COMMENT '锁定时间',
  `fail_count` smallint(3) NOT NULL DEFAULT 0 COMMENT '尝试次数',
  `lock_ip` varchar(50) NOT NULL DEFAULT '' COMMENT '禁用IP',
  `password_verify` tinyint(1) NOT NULL DEFAULT 0 COMMENT '开启密码校验1开启0关闭',
  `password_newuser_forcechange` tinyint(1) NOT NULL DEFAULT 0 COMMENT '新用户强制修改密码，1关闭0开启',
  `password_cycle` int(11) NOT NULL DEFAULT 0 COMMENT '密码修改周期',
  `password_deadline_ahead` smallint(5) NOT NULL DEFAULT 5 COMMENT '密码到期提前提醒天数',
  `web_timeout` smallint(5) NOT NULL DEFAULT 0 COMMENT 'web非活跃超时时间',
  `password_verification_times` smallint(5) NOT NULL COMMENT '密码相同校验次数',
  `new_user_default_password` varchar(255) NOT NULL DEFAULT '' COMMENT '新用户默认密码',
  `admin_login_ip` varchar(255) NOT NULL DEFAULT '' COMMENT 'ADMIN远程登录的限制IP',
  `same_user` int(5) NOT NULL COMMENT '同一Web在线用户数',
  `login_validity_long` int(5) NOT NULL COMMENT '永久有效',
  `login_validity_period_start` varchar(255) DEFAULT NULL COMMENT '生效开始时间',
  `login_validity_period_end` varchar(255) DEFAULT NULL COMMENT '结束有效时间',
  `lock_login` varchar(255) DEFAULT '' COMMENT '锁定前登录超时时间',
  `export_password` varchar(255) NOT NULL DEFAULT '' COMMENT '导出密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='登录配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_config_login`
--

LOCK TABLES `lsblj_config_login` WRITE;
/*!40000 ALTER TABLE `lsblj_config_login` DISABLE KEYS */;
INSERT INTO `lsblj_config_login` VALUES (1,0,6,100,0,1597401421,3,'60.170.166.251',0,0,300,4,30,5,'','',100,1,'','','2','fa6f22ee3dc66fb025d1c80ad47e5424');
/*!40000 ALTER TABLE `lsblj_config_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_config_logpara`
--

DROP TABLE IF EXISTS `lsblj_config_logpara`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_config_logpara` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '链接名称',
  `log_manage` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `sort` tinyint(100) NOT NULL DEFAULT 1 COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_config_logpara`
--

LOCK TABLES `lsblj_config_logpara` WRITE;
/*!40000 ALTER TABLE `lsblj_config_logpara` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_config_logpara` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_config_network`
--

DROP TABLE IF EXISTS `lsblj_config_network`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_config_network` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(150) NOT NULL DEFAULT '' COMMENT '网卡名称',
  `device` varchar(255) NOT NULL DEFAULT '' COMMENT '网卡设备',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 0关闭1开启',
  `ip_four` varchar(255) NOT NULL DEFAULT '' COMMENT 'IPv4地址',
  `ip_six` varchar(255) NOT NULL DEFAULT '' COMMENT 'IPv6',
  `ip_fourgate` varchar(255) DEFAULT '' COMMENT 'IP v4网关',
  `ip_sixgate` varchar(255) DEFAULT '' COMMENT 'IPv6网关',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='网卡配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_config_network`
--

LOCK TABLES `lsblj_config_network` WRITE;
/*!40000 ALTER TABLE `lsblj_config_network` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_config_network` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_config_password_encrypt_key`
--

DROP TABLE IF EXISTS `lsblj_config_password_encrypt_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_config_password_encrypt_key` (
  `pkey` varchar(255) NOT NULL DEFAULT '' COMMENT '密码加密密钥',
  `mode` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0软件加密1硬件加密',
  `hardwareEncryptCmd` varchar(255) NOT NULL DEFAULT '/opt/lsblj/server/bin/sm4'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='syslog配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_config_password_encrypt_key`
--

LOCK TABLES `lsblj_config_password_encrypt_key` WRITE;
/*!40000 ALTER TABLE `lsblj_config_password_encrypt_key` DISABLE KEYS */;
INSERT INTO `lsblj_config_password_encrypt_key` VALUES ('9A8159B49AB10B4BA55BC477B1C0E79E',0,'/opt/lsblj/server/bin/sm4');
/*!40000 ALTER TABLE `lsblj_config_password_encrypt_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_config_port`
--

DROP TABLE IF EXISTS `lsblj_config_port`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_config_port` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ssh_sftp` int(11) NOT NULL DEFAULT 0 COMMENT '运维端口',
  `rdp` int(11) NOT NULL DEFAULT 0 COMMENT 'RDP端口',
  `web` int(11) NOT NULL DEFAULT 0 COMMENT 'WEB端口',
  `control_port` int(11) NOT NULL DEFAULT 0 COMMENT 'ssh控制台端口',
  `ftp` int(11) NOT NULL DEFAULT 0 COMMENT 'ftp控制端口',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='syslog配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_config_port`
--

LOCK TABLES `lsblj_config_port` WRITE;
/*!40000 ALTER TABLE `lsblj_config_port` DISABLE KEYS */;
INSERT INTO `lsblj_config_port` VALUES (1,22,11,443,11,21);
/*!40000 ALTER TABLE `lsblj_config_port` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_config_radius`
--

DROP TABLE IF EXISTS `lsblj_config_radius`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_config_radius` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ip` varchar(150) NOT NULL DEFAULT '' COMMENT '服务器IP',
  `port` int(11) NOT NULL DEFAULT 0 COMMENT '服务器端口',
  `protocol` tinyint(1) NOT NULL DEFAULT 0 COMMENT '协议0PAP',
  `secret_key` varchar(150) NOT NULL DEFAULT '' COMMENT '认证密钥',
  `timeout` int(5) NOT NULL DEFAULT 0 COMMENT '超时时间',
  `department_verify` tinyint(1) NOT NULL DEFAULT 0 COMMENT '部门认证',
  `username` varchar(150) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0关闭1开启',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='Radius配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_config_radius`
--

LOCK TABLES `lsblj_config_radius` WRITE;
/*!40000 ALTER TABLE `lsblj_config_radius` DISABLE KEYS */;
INSERT INTO `lsblj_config_radius` VALUES (1,'',0,0,'',0,0,'','',0);
/*!40000 ALTER TABLE `lsblj_config_radius` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_config_route`
--

DROP TABLE IF EXISTS `lsblj_config_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_config_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `device_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=ipv4,1=ipv6',
  `device` varchar(10) NOT NULL DEFAULT '' COMMENT '接口',
  `destion_ip` varchar(50) NOT NULL DEFAULT '' COMMENT '目标地址',
  `netmask` varchar(50) NOT NULL DEFAULT '' COMMENT '网络掩码',
  `prefix` tinyint(2) NOT NULL DEFAULT 0 COMMENT '前缀',
  `nextaddress` varchar(50) NOT NULL DEFAULT '' COMMENT '下一跳地址',
  `desc` varchar(2048) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='路由表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_config_route`
--

LOCK TABLES `lsblj_config_route` WRITE;
/*!40000 ALTER TABLE `lsblj_config_route` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_config_route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_config_sms`
--

DROP TABLE IF EXISTS `lsblj_config_sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_config_sms` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `domain` varchar(255) NOT NULL DEFAULT '' COMMENT '域名',
  `product` varchar(255) NOT NULL DEFAULT '' COMMENT '产品',
  `access_key_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'api的ID',
  `access_key_secret` varchar(255) NOT NULL DEFAULT '' COMMENT 'api的Secret',
  `sign_name` varchar(255) NOT NULL DEFAULT '' COMMENT '签名',
  `template_code` varchar(255) NOT NULL DEFAULT '' COMMENT '模版编码',
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1自定义',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0关闭1开启',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='短信配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_config_sms`
--

LOCK TABLES `lsblj_config_sms` WRITE;
/*!40000 ALTER TABLE `lsblj_config_sms` DISABLE KEYS */;
INSERT INTO `lsblj_config_sms` VALUES (1,'','','','','','',1,0);
/*!40000 ALTER TABLE `lsblj_config_sms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_config_snmp`
--

DROP TABLE IF EXISTS `lsblj_config_snmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_config_snmp` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `community` varchar(1024) NOT NULL DEFAULT '0' COMMENT '通讯字符串',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0关闭1开启',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='snmp配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_config_snmp`
--

LOCK TABLES `lsblj_config_snmp` WRITE;
/*!40000 ALTER TABLE `lsblj_config_snmp` DISABLE KEYS */;
INSERT INTO `lsblj_config_snmp` VALUES (1,'',0);
/*!40000 ALTER TABLE `lsblj_config_snmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_config_syslog`
--

DROP TABLE IF EXISTS `lsblj_config_syslog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_config_syslog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ip` varchar(150) NOT NULL DEFAULT '' COMMENT '服务器IP',
  `port` int(11) NOT NULL DEFAULT 0 COMMENT '服务器端口',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态 0关闭1开启',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='syslog配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_config_syslog`
--

LOCK TABLES `lsblj_config_syslog` WRITE;
/*!40000 ALTER TABLE `lsblj_config_syslog` DISABLE KEYS */;
INSERT INTO `lsblj_config_syslog` VALUES (1,'',0,0);
/*!40000 ALTER TABLE `lsblj_config_syslog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_config_workorder`
--

DROP TABLE IF EXISTS `lsblj_config_workorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_config_workorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `range` tinyint(1) NOT NULL DEFAULT 0 COMMENT '工单申请范围0本部门1本部门及以下2全部',
  `dead_hours` tinyint(2) NOT NULL DEFAULT 0 COMMENT '工单',
  `outdate_action` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0拒绝1允许',
  `mode` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0多人审批1会签审批',
  `level` tinyint(1) NOT NULL DEFAULT 0 COMMENT '审批级数',
  `endaudit` tinyint(1) NOT NULL DEFAULT 0 COMMENT '终审节点',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_config_workorder`
--

LOCK TABLES `lsblj_config_workorder` WRITE;
/*!40000 ALTER TABLE `lsblj_config_workorder` DISABLE KEYS */;
INSERT INTO `lsblj_config_workorder` VALUES (1,2,6,1,1,3,0,'2020-11-13 15:23:33');
/*!40000 ALTER TABLE `lsblj_config_workorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_crontab_command_log`
--

DROP TABLE IF EXISTS `lsblj_crontab_command_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_crontab_command_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `command` varchar(255) NOT NULL DEFAULT '' COMMENT '命令',
  `exec_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '执行时间',
  `result` text NOT NULL DEFAULT '' COMMENT '结果',
  `device_name` varchar(100) NOT NULL COMMENT '设备名称',
  `device_ip` varchar(100) NOT NULL COMMENT '设备地址',
  `device_port` smallint(3) NOT NULL DEFAULT 0 COMMENT '设备端口',
  `device_username` varchar(255) NOT NULL DEFAULT '' COMMENT '设备用户',
  `exec_status` smallint(2) NOT NULL DEFAULT 0 COMMENT '执行状态',
  `end_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `config_id` int(11) NOT NULL DEFAULT 0 COMMENT '配置ID',
  `department` int(11) NOT NULL DEFAULT 0 COMMENT '部门ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_crontab_command_log`
--

LOCK TABLES `lsblj_crontab_command_log` WRITE;
/*!40000 ALTER TABLE `lsblj_crontab_command_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_crontab_command_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_crontab_script`
--

DROP TABLE IF EXISTS `lsblj_crontab_script`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_crontab_script` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `file_path` varchar(255) DEFAULT '' COMMENT '文件路径',
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0是python,1shell',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `upload_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '上传时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_crontab_script`
--

LOCK TABLES `lsblj_crontab_script` WRITE;
/*!40000 ALTER TABLE `lsblj_crontab_script` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_crontab_script` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_crontab_script_config`
--

DROP TABLE IF EXISTS `lsblj_crontab_script_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_crontab_script_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '任务名称',
  `file_id` int(11) NOT NULL DEFAULT 0,
  `exec_method` tinyint(1) NOT NULL DEFAULT 1 COMMENT '执行方式0是手动,1定时,2是周期',
  `exec_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '定时执行时间或周期开始时间',
  `exec_cycle` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0每分钟1每没小时...',
  `internal` smallint(5) NOT NULL DEFAULT 0 COMMENT '间隔',
  `end_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '周期结束时间',
  `su` tinyint(1) NOT NULL DEFAULT 1 COMMENT '提权执行1是',
  `description` varchar(2048) NOT NULL DEFAULT '' COMMENT '描述',
  `command` varchar(1024) NOT NULL DEFAULT '' COMMENT '命令',
  `status` smallint(2) NOT NULL DEFAULT 0 COMMENT '0未执行1执行中2执行完',
  `result` smallint(2) NOT NULL DEFAULT 0 COMMENT '结果0失败1成功',
  `department` int(11) NOT NULL DEFAULT 0 COMMENT '部门id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_crontab_script_config`
--

LOCK TABLES `lsblj_crontab_script_config` WRITE;
/*!40000 ALTER TABLE `lsblj_crontab_script_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_crontab_script_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_crontab_script_config_device`
--

DROP TABLE IF EXISTS `lsblj_crontab_script_config_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_crontab_script_config_device` (
  `config_id` int(11) NOT NULL COMMENT '策略ID',
  `device_account_id` int(11) NOT NULL COMMENT '设备用户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_crontab_script_config_device`
--

LOCK TABLES `lsblj_crontab_script_config_device` WRITE;
/*!40000 ALTER TABLE `lsblj_crontab_script_config_device` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_crontab_script_config_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_crontab_script_config_group`
--

DROP TABLE IF EXISTS `lsblj_crontab_script_config_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_crontab_script_config_group` (
  `config_id` int(11) NOT NULL COMMENT '策略ID',
  `group_id` int(11) NOT NULL COMMENT '组ID',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0用户组1设备组'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_crontab_script_config_group`
--

LOCK TABLES `lsblj_crontab_script_config_group` WRITE;
/*!40000 ALTER TABLE `lsblj_crontab_script_config_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_crontab_script_config_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_department`
--

DROP TABLE IF EXISTS `lsblj_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '部门名称',
  `count` int(11) NOT NULL DEFAULT 0 COMMENT '部门总用户数',
  `device_count` int(11) NOT NULL DEFAULT 0 COMMENT '部门总设备数',
  `description` varchar(128) NOT NULL DEFAULT '' COMMENT '描述',
  `create_time` int(10) NOT NULL DEFAULT 0 COMMENT '创建的时间',
  `create_id` int(11) NOT NULL DEFAULT 0 COMMENT '创建者id',
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '上级部门ID',
  PRIMARY KEY (`id`),
  KEY `index_pid` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_department`
--

LOCK TABLES `lsblj_department` WRITE;
/*!40000 ALTER TABLE `lsblj_department` DISABLE KEYS */;
INSERT INTO `lsblj_department` VALUES (1,'总部',0,0,'',0,1,0);
/*!40000 ALTER TABLE `lsblj_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_department_cache`
--

DROP TABLE IF EXISTS `lsblj_department_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_department_cache` (
  `department_id` int(11) NOT NULL DEFAULT 0,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  UNIQUE KEY `department_id` (`department_id`,`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_department_cache`
--

LOCK TABLES `lsblj_department_cache` WRITE;
/*!40000 ALTER TABLE `lsblj_department_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_department_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_device`
--

DROP TABLE IF EXISTS `lsblj_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_type` int(2) NOT NULL COMMENT '系统类型取值参照lsblj_device_type',
  `os_ver` varchar(128) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '设备名称',
  `ip` varchar(40) NOT NULL DEFAULT '' COMMENT '设备地址',
  `port` int(11) NOT NULL DEFAULT 0 COMMENT '端口',
  `ipv6` varchar(150) NOT NULL DEFAULT '' COMMENT '设备地址',
  `status` int(3) DEFAULT 1 COMMENT '状态',
  `account_count` int(11) NOT NULL DEFAULT 0 COMMENT '设备账号数',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `creator_id` int(11) NOT NULL DEFAULT 0,
  `create_time` int(11) NOT NULL DEFAULT 0,
  `login_method` int(2) NOT NULL DEFAULT 0 COMMENT '登录方式 0是自动登录1手动登录',
  `protocol_id` int(2) NOT NULL DEFAULT 0 COMMENT '协议类型 参考表protocol',
  `department` int(11) NOT NULL DEFAULT 1 COMMENT '部门',
  `ssh_key` int(11) NOT NULL DEFAULT 0 COMMENT 'SSH_key   0是，1否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_device`
--

LOCK TABLES `lsblj_device` WRITE;
/*!40000 ALTER TABLE `lsblj_device` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_device_account`
--

DROP TABLE IF EXISTS `lsblj_device_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_device_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '账号名称',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '账号密码',
  `device_id` int(11) NOT NULL DEFAULT 0,
  `port` int(10) NOT NULL DEFAULT 0 COMMENT '端口',
  `protocol_id` int(2) NOT NULL DEFAULT 0 COMMENT '协议类型 参照protocol',
  `is_super` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0非特权，1特权',
  `ssh_key` int(11) NOT NULL DEFAULT 0 COMMENT 'SSH_key   0是，1否',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态  0在线，1离线',
  `login_method` tinyint(1) NOT NULL DEFAULT 0 COMMENT '登录方式0是自动登录1手动登录',
  `file_id` int(11) NOT NULL DEFAULT 0 COMMENT 'ssh key的密钥id',
  `ssh_password` blob DEFAULT NULL COMMENT 'ssh密码',
  `sftp_path` varchar(255) NOT NULL DEFAULT '/tmp' COMMENT 'sftp路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_device_account`
--

LOCK TABLES `lsblj_device_account` WRITE;
/*!40000 ALTER TABLE `lsblj_device_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_device_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_device_record`
--

DROP TABLE IF EXISTS `lsblj_device_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_device_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `client_ip` varchar(150) NOT NULL DEFAULT '' COMMENT '来源IP',
  `server_ip` varchar(150) NOT NULL DEFAULT '',
  `device_ip` varchar(255) NOT NULL DEFAULT '' COMMENT '设备地址',
  `device_name` varchar(255) NOT NULL DEFAULT '' COMMENT '设备名称',
  `port` int(10) NOT NULL DEFAULT 0 COMMENT '端口',
  `start` int(10) NOT NULL DEFAULT 0,
  `start_of_millis` bigint(15) NOT NULL DEFAULT 0 COMMENT '开始时间(精确到毫秒)',
  `end` int(10) NOT NULL DEFAULT 0,
  `protocol_id` tinyint(3) NOT NULL DEFAULT 0 COMMENT '资源类型id',
  `user_id` int(11) NOT NULL DEFAULT 1,
  `username` varchar(100) NOT NULL DEFAULT '' COMMENT '运维用户',
  `realname` varchar(100) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `device_username` varchar(255) NOT NULL DEFAULT '''''' COMMENT '设备账号',
  `time_length` int(11) NOT NULL DEFAULT 0 COMMENT '会话时长',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '协议',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态',
  `log_file` varchar(255) NOT NULL DEFAULT '',
  `log_file_size` int(11) NOT NULL DEFAULT 0 COMMENT '会话大小',
  `video_file` varchar(255) NOT NULL DEFAULT '' COMMENT '视频文件',
  `video_file_size` int(11) NOT NULL DEFAULT 0 COMMENT '视频文件大小',
  `client_mac` varchar(255) NOT NULL DEFAULT '' COMMENT '来源MAC',
  `auth_type` varchar(50) NOT NULL DEFAULT '' COMMENT '认证类型',
  `token` varchar(255) NOT NULL DEFAULT '',
  `department` int(11) NOT NULL DEFAULT 1 COMMENT '部门',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_device_record`
--

LOCK TABLES `lsblj_device_record` WRITE;
/*!40000 ALTER TABLE `lsblj_device_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_device_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_device_record_key`
--

DROP TABLE IF EXISTS `lsblj_device_record_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_device_record_key` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `lsblj_device_record_id` int(11) NOT NULL DEFAULT 0 COMMENT '记录ID',
  `start` int(10) DEFAULT NULL,
  `keysum` char(10) NOT NULL DEFAULT '0' COMMENT '按键码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='审计按键记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_device_record_key`
--

LOCK TABLES `lsblj_device_record_key` WRITE;
/*!40000 ALTER TABLE `lsblj_device_record_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_device_record_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_device_record_mouse`
--

DROP TABLE IF EXISTS `lsblj_device_record_mouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_device_record_mouse` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `lsblj_device_record_id` int(11) NOT NULL DEFAULT 0 COMMENT '记录ID',
  `start` int(10) DEFAULT NULL,
  `position_x` int(11) NOT NULL DEFAULT 0 COMMENT 'x坐标',
  `position_y` int(11) NOT NULL DEFAULT 0 COMMENT 'Y坐标',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='审计鼠标位置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_device_record_mouse`
--

LOCK TABLES `lsblj_device_record_mouse` WRITE;
/*!40000 ALTER TABLE `lsblj_device_record_mouse` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_device_record_mouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_device_type`
--

DROP TABLE IF EXISTS `lsblj_device_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_device_type` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '系统类型',
  `param` varchar(255) DEFAULT '' COMMENT '提权参数',
  `device_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:主机，1:网络',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_device_type`
--

LOCK TABLES `lsblj_device_type` WRITE;
/*!40000 ALTER TABLE `lsblj_device_type` DISABLE KEYS */;
INSERT INTO `lsblj_device_type` VALUES (1,'WINDOWS','',0,''),(2,'LINUX','su',0,''),(3,'UNIX','',0,''),(4,'HUAWEI','',1,''),(5,'AIX','',0,''),(6,'CISCO','',1,''),(7,'H3C','',1,''),(8,'UOS','',0,'统信操作系统'),(9,'Kylin','',0,'麒麟操作系统');
/*!40000 ALTER TABLE `lsblj_device_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_dynamic_token`
--

DROP TABLE IF EXISTS `lsblj_dynamic_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_dynamic_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sign` varchar(255) NOT NULL DEFAULT '',
  `private_key` varchar(255) NOT NULL DEFAULT '',
  `user_id` varchar(255) NOT NULL DEFAULT '',
  `creator_id` int(11) NOT NULL DEFAULT 0,
  `creator_time` int(10) NOT NULL DEFAULT 0,
  `state` tinyint(1) DEFAULT NULL COMMENT '0禁用，1启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_dynamic_token`
--

LOCK TABLES `lsblj_dynamic_token` WRITE;
/*!40000 ALTER TABLE `lsblj_dynamic_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_dynamic_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_efile_log`
--

DROP TABLE IF EXISTS `lsblj_efile_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_efile_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addtime` datetime NOT NULL DEFAULT current_timestamp() COMMENT '添加时间',
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `filecontent` text COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件内容',
  `result` tinyint(1) NOT NULL DEFAULT 2 COMMENT '0失败1部分成功2全部成功',
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='EFile内容';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_efile_log`
--

LOCK TABLES `lsblj_efile_log` WRITE;
/*!40000 ALTER TABLE `lsblj_efile_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_efile_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_efile_server`
--

DROP TABLE IF EXISTS `lsblj_efile_server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_efile_server` (
  `id` int(11) NOT NULL,
  `ip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'sftp服务器IP',
  `port` int(8) NOT NULL DEFAULT 0 COMMENT 'sftp服务器端口',
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'sftp用户名',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'sftp用户密码',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '/' COMMENT '路径',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0禁用1启用'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='工单任务sftp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_efile_server`
--

LOCK TABLES `lsblj_efile_server` WRITE;
/*!40000 ALTER TABLE `lsblj_efile_server` DISABLE KEYS */;
INSERT INTO `lsblj_efile_server` VALUES (1,'',0,'','','',0);
/*!40000 ALTER TABLE `lsblj_efile_server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_email_log`
--

DROP TABLE IF EXISTS `lsblj_email_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_email_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_users` varchar(255) NOT NULL DEFAULT '' COMMENT '收件人',
  `to_title` varchar(255) NOT NULL DEFAULT '' COMMENT '邮件标题',
  `to_contents` varchar(1024) NOT NULL DEFAULT '' COMMENT '邮件内容',
  `result` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0:失败，1:成功',
  `fail_count` tinyint(2) NOT NULL DEFAULT 0 COMMENT '失败的次数',
  `send_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '发送的时间',
  `alert_id` int(11) NOT NULL DEFAULT 0 COMMENT 'alert_log告警日志的ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_email_log`
--

LOCK TABLES `lsblj_email_log` WRITE;
/*!40000 ALTER TABLE `lsblj_email_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_email_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_g_connection`
--

DROP TABLE IF EXISTS `lsblj_g_connection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_g_connection` (
  `connection_id` int(11) NOT NULL AUTO_INCREMENT,
  `connection_name` varchar(128) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `protocol` varchar(32) NOT NULL,
  `proxy_port` int(11) DEFAULT NULL,
  `proxy_hostname` varchar(512) DEFAULT NULL,
  `proxy_encryption_method` enum('NONE','SSL') DEFAULT NULL,
  `max_connections` int(11) DEFAULT NULL,
  `max_connections_per_user` int(11) DEFAULT NULL,
  `connection_weight` int(11) DEFAULT NULL,
  `failover_only` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`connection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_g_connection`
--

LOCK TABLES `lsblj_g_connection` WRITE;
/*!40000 ALTER TABLE `lsblj_g_connection` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_g_connection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_g_connection_history`
--

DROP TABLE IF EXISTS `lsblj_g_connection_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_g_connection_history` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(128) NOT NULL,
  `remote_host` varchar(256) DEFAULT NULL,
  `connection_id` int(11) DEFAULT NULL,
  `connection_name` varchar(128) NOT NULL,
  `sharing_profile_id` int(11) DEFAULT NULL,
  `sharing_profile_name` varchar(128) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_g_connection_history`
--

LOCK TABLES `lsblj_g_connection_history` WRITE;
/*!40000 ALTER TABLE `lsblj_g_connection_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_g_connection_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_g_connection_parameter`
--

DROP TABLE IF EXISTS `lsblj_g_connection_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_g_connection_parameter` (
  `connection_id` int(11) NOT NULL,
  `parameter_name` varchar(128) NOT NULL,
  `parameter_value` varchar(4096) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_g_connection_parameter`
--

LOCK TABLES `lsblj_g_connection_parameter` WRITE;
/*!40000 ALTER TABLE `lsblj_g_connection_parameter` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_g_connection_parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_group`
--

DROP TABLE IF EXISTS `lsblj_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '0全部，1用户，2设备',
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '设备组名称',
  `department` int(11) NOT NULL DEFAULT 1 COMMENT '部门id',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `count` int(11) NOT NULL DEFAULT 0 COMMENT '设备数',
  `creator_id` int(11) NOT NULL DEFAULT 0,
  `create_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_group`
--

LOCK TABLES `lsblj_group` WRITE;
/*!40000 ALTER TABLE `lsblj_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_group_device_account`
--

DROP TABLE IF EXISTS `lsblj_group_device_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_group_device_account` (
  `group_id` int(11) NOT NULL COMMENT '设备组id',
  `device_account_id` int(11) NOT NULL COMMENT '设备账号id',
  UNIQUE KEY `group_id` (`group_id`,`device_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_group_device_account`
--

LOCK TABLES `lsblj_group_device_account` WRITE;
/*!40000 ALTER TABLE `lsblj_group_device_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_group_device_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_group_user`
--

DROP TABLE IF EXISTS `lsblj_group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_group_user` (
  `group_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户组id',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户id',
  UNIQUE KEY `group_id` (`group_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_group_user`
--

LOCK TABLES `lsblj_group_user` WRITE;
/*!40000 ALTER TABLE `lsblj_group_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_highrisk_command`
--

DROP TABLE IF EXISTS `lsblj_highrisk_command`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_highrisk_command` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0主机/工作站,1交换机/路由器,2数据库',
  `command` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `level` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0高危1非法',
  `action` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0申请确认1指令阻断2会话阻断',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_highrisk_command`
--

LOCK TABLES `lsblj_highrisk_command` WRITE;
/*!40000 ALTER TABLE `lsblj_highrisk_command` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_highrisk_command` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_ip_group`
--

DROP TABLE IF EXISTS `lsblj_ip_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_ip_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_ip_group`
--

LOCK TABLES `lsblj_ip_group` WRITE;
/*!40000 ALTER TABLE `lsblj_ip_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_ip_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_ip_group_ip`
--

DROP TABLE IF EXISTS `lsblj_ip_group_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_ip_group_ip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) NOT NULL DEFAULT '',
  `ip_group` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_ip_group_ip`
--

LOCK TABLES `lsblj_ip_group_ip` WRITE;
/*!40000 ALTER TABLE `lsblj_ip_group_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_ip_group_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_link_manage`
--

DROP TABLE IF EXISTS `lsblj_link_manage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_link_manage` (
  `link_id` int(10) DEFAULT NULL COMMENT '0',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '链接名称',
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '链接地址'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_link_manage`
--

LOCK TABLES `lsblj_link_manage` WRITE;
/*!40000 ALTER TABLE `lsblj_link_manage` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_link_manage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_live_sessions`
--

DROP TABLE IF EXISTS `lsblj_live_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_live_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `device_name` varchar(255) NOT NULL DEFAULT '' COMMENT '设备名称',
  `device_ip` varchar(255) NOT NULL DEFAULT '' COMMENT '设备地址',
  `protocol` varchar(255) NOT NULL DEFAULT '' COMMENT '协议',
  `device_user` varchar(255) NOT NULL DEFAULT '' COMMENT '设备账号',
  `client_ip` varchar(255) NOT NULL DEFAULT '' COMMENT '来源ip',
  `username` varchar(255) NOT NULL DEFAULT '' COMMENT '运维用户',
  `realname` varchar(255) NOT NULL DEFAULT '' COMMENT '姓名',
  `start` int(11) NOT NULL DEFAULT 0 COMMENT '开始时间',
  `app_name` varchar(255) NOT NULL DEFAULT '' COMMENT '应用名称',
  `program` varchar(255) NOT NULL DEFAULT '' COMMENT '程序',
  `app_account` varchar(255) NOT NULL DEFAULT '' COMMENT '应用账号',
  `uuid` varchar(255) NOT NULL DEFAULT '',
  `authtoken` varchar(255) NOT NULL DEFAULT '',
  `record_id` int(11) NOT NULL DEFAULT 0,
  `monitorkey` varchar(255) NOT NULL DEFAULT '',
  `connectid` int(11) NOT NULL DEFAULT 0,
  `department` int(11) NOT NULL DEFAULT 0 COMMENT '部门',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_live_sessions`
--

LOCK TABLES `lsblj_live_sessions` WRITE;
/*!40000 ALTER TABLE `lsblj_live_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_live_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_log_delete_policy`
--

DROP TABLE IF EXISTS `lsblj_log_delete_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_log_delete_policy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '任务名称',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态',
  `file_id` int(11) DEFAULT 0,
  `deletetype` tinyint(3) NOT NULL DEFAULT 0 COMMENT '删除类别 1是主机审计 2是应用审计 3是系统日志',
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '执行方式0是手动,1定时,2是周期',
  `exec_datetime` datetime NOT NULL DEFAULT current_timestamp() COMMENT '执行时间',
  `exec_cycle` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0每分钟1每小时...',
  `internal` smallint(10) DEFAULT 0 COMMENT '间隔',
  `end_datetime` datetime NOT NULL DEFAULT current_timestamp() COMMENT '结束时间',
  `session_start_datetime` datetime NOT NULL DEFAULT current_timestamp() COMMENT '会话开始时间',
  `session_end_datetime` datetime NOT NULL DEFAULT current_timestamp() COMMENT '会话截止时间',
  `description` varchar(128) DEFAULT '' COMMENT '描述',
  `change_root` varchar(255) DEFAULT '' COMMENT '修改特权账号密码',
  `department` int(11) NOT NULL DEFAULT 1 COMMENT '部门id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_log_delete_policy`
--

LOCK TABLES `lsblj_log_delete_policy` WRITE;
/*!40000 ALTER TABLE `lsblj_log_delete_policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_log_delete_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_log_delete_policy_apppub`
--

DROP TABLE IF EXISTS `lsblj_log_delete_policy_apppub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_log_delete_policy_apppub` (
  `policy_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '策略ID',
  `apppub_id` int(11) NOT NULL DEFAULT 0 COMMENT '应用ID',
  UNIQUE KEY `policy_id` (`policy_id`,`apppub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_log_delete_policy_apppub`
--

LOCK TABLES `lsblj_log_delete_policy_apppub` WRITE;
/*!40000 ALTER TABLE `lsblj_log_delete_policy_apppub` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_log_delete_policy_apppub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_log_delete_policy_device`
--

DROP TABLE IF EXISTS `lsblj_log_delete_policy_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_log_delete_policy_device` (
  `policy_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '策略ID',
  `device_id` int(11) NOT NULL DEFAULT 0 COMMENT '设备ID',
  UNIQUE KEY `policy_id` (`policy_id`,`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_log_delete_policy_device`
--

LOCK TABLES `lsblj_log_delete_policy_device` WRITE;
/*!40000 ALTER TABLE `lsblj_log_delete_policy_device` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_log_delete_policy_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_log_delete_policy_group`
--

DROP TABLE IF EXISTS `lsblj_log_delete_policy_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_log_delete_policy_group` (
  `policy_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '策略ID',
  `group_id` int(11) NOT NULL DEFAULT 0 COMMENT '组ID',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '类型',
  UNIQUE KEY `policy_id` (`policy_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_log_delete_policy_group`
--

LOCK TABLES `lsblj_log_delete_policy_group` WRITE;
/*!40000 ALTER TABLE `lsblj_log_delete_policy_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_log_delete_policy_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_log_delete_policy_user`
--

DROP TABLE IF EXISTS `lsblj_log_delete_policy_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_log_delete_policy_user` (
  `policy_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '策略ID',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID',
  UNIQUE KEY `policy_id` (`policy_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_log_delete_policy_user`
--

LOCK TABLES `lsblj_log_delete_policy_user` WRITE;
/*!40000 ALTER TABLE `lsblj_log_delete_policy_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_log_delete_policy_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_login_log`
--

DROP TABLE IF EXISTS `lsblj_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_login_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `source_ip` varchar(150) NOT NULL DEFAULT '' COMMENT '来源地址',
  `user_id` int(11) NOT NULL DEFAULT 1,
  `username` varchar(150) NOT NULL DEFAULT '' COMMENT '运维用户',
  `realname` varchar(50) NOT NULL DEFAULT '' COMMENT '姓名',
  `department` int(11) NOT NULL DEFAULT 1 COMMENT '部门',
  `protocol` varchar(100) NOT NULL DEFAULT '' COMMENT '登录协议',
  `login_type` varchar(255) NOT NULL DEFAULT '' COMMENT '登录方式',
  `device_ip` varchar(100) NOT NULL DEFAULT '',
  `os` varchar(100) NOT NULL DEFAULT '',
  `browser` varchar(100) NOT NULL DEFAULT '',
  `login_datetime` int(10) NOT NULL DEFAULT 0 COMMENT '时间',
  `logout_datetime` int(10) NOT NULL DEFAULT 0 COMMENT '登出时间',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0失败1成功',
  `result` text DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL COMMENT '注释',
  `session_id` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `lsblj_login_log_login_datetime_IDX` (`login_datetime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_login_log`
--

LOCK TABLES `lsblj_login_log` WRITE;
/*!40000 ALTER TABLE `lsblj_login_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_menu`
--

DROP TABLE IF EXISTS `lsblj_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `resource` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_menu`
--

LOCK TABLES `lsblj_menu` WRITE;
/*!40000 ALTER TABLE `lsblj_menu` DISABLE KEYS */;
INSERT INTO `lsblj_menu` VALUES (0,'全景概览','index'),(1,'用户列表','user-user'),(2,'用户分组','user-user_group'),(3,'角色管理','user-role_manage'),(4,'设备列表','asset_manage-hosts'),(5,'设备分组','asset_manage-device_group'),(6,'应用管理','asset_manage-apppub_manage'),(7,'运维授权','strategy_manage-access_control'),(8,'命令控制','strategy_manage-command_control'),(9,'执行任务','auto_operation-rapid_operation'),(10,'执行日志','auto_operation-operational_task'),(11,'主机审计','audit_manage-host_sessions'),(12,'应用审计','audit_manage-apppub_sessions'),(13,'实时会话','audit_manage-sessions_online'),(14,'系统日志','audit_manage-logs_system'),(15,'日志删除','audit_manage-log_manage'),(16,'登录报表','statistic_analysis-reports_login'),(17,'运维报表','statistic_analysis-reports_sessions'),(18,'资源报表','statistic_analysis-reports'),(19,'系统配置','system_manage-config_system'),(20,'网络配置','system_manage-config_network'),(21,'系统维护','system_manage-config_system_parameter'),(22,'密码管理','password_manage-password_management'),(23,'改密策略','password_manage-secret_change_strategy'),(24,'改密日志','password_manage-password_modify_logs'),(25,'主机运维','operation_manage-host_operation'),(26,'应用运维','operation_manage-app_operation'),(27,'系统类型','asset_manage-system_Type'),(28,'部门管理','common-department'),(29,'工单申请','work_manage-authorize'),(30,'工单审批','work_manage-approve'),(31,'E文件管理','work_manage-tcplog'),(32,'数据分析','statistic_data'),(33,'用户策略','user-user_strategy');
/*!40000 ALTER TABLE `lsblj_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_operator_log`
--

DROP TABLE IF EXISTS `lsblj_operator_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_operator_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `source_ip` varchar(150) NOT NULL DEFAULT '' COMMENT '来源IP',
  `user_id` int(11) NOT NULL DEFAULT 1 COMMENT '用户id',
  `username` varchar(150) NOT NULL DEFAULT '' COMMENT '用户名',
  `realname` varchar(50) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `department_id` int(11) NOT NULL DEFAULT 1 COMMENT '部门id',
  `content` varchar(100) NOT NULL DEFAULT '' COMMENT '内容',
  `operate_datetime` int(15) NOT NULL DEFAULT 0 COMMENT '操作时间',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0失败1成功',
  `result` text NOT NULL DEFAULT '' COMMENT '结果',
  `module` varchar(100) NOT NULL COMMENT '模块',
  `details` text NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_operator_log`
--

LOCK TABLES `lsblj_operator_log` WRITE;
/*!40000 ALTER TABLE `lsblj_operator_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_operator_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_protocol`
--

DROP TABLE IF EXISTS `lsblj_protocol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_protocol` (
  `id` tinyint(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_protocol`
--

LOCK TABLES `lsblj_protocol` WRITE;
/*!40000 ALTER TABLE `lsblj_protocol` DISABLE KEYS */;
INSERT INTO `lsblj_protocol` VALUES (1,'SSH'),(2,'RDP'),(3,'TELNET'),(4,'VNC'),(5,'FTP'),(6,'SFTP'),(7,'x11');
/*!40000 ALTER TABLE `lsblj_protocol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_record`
--

DROP TABLE IF EXISTS `lsblj_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `core_sn` varchar(5) NOT NULL DEFAULT '0000',
  `flag` int(11) NOT NULL DEFAULT 0,
  `reason` varchar(255) NOT NULL DEFAULT '',
  `sid` varchar(32) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `host_id` int(11) NOT NULL DEFAULT 0,
  `acc_id` int(11) NOT NULL DEFAULT 0,
  `state` int(11) DEFAULT 0,
  `user_username` varchar(32) NOT NULL DEFAULT '',
  `user_surname` varchar(64) NOT NULL DEFAULT '',
  `host_ip` varchar(40) DEFAULT '',
  `conn_ip` varchar(40) DEFAULT '',
  `conn_port` int(11) DEFAULT 0,
  `client_ip` varchar(40) DEFAULT '',
  `acc_username` varchar(128) DEFAULT '',
  `auth_type` int(11) DEFAULT 0,
  `protocol_type` int(11) DEFAULT 0,
  `protocol_sub_type` int(11) DEFAULT 0,
  `time_begin` int(11) DEFAULT 0,
  `time_end` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_record`
--

LOCK TABLES `lsblj_record` WRITE;
/*!40000 ALTER TABLE `lsblj_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_record_audit`
--

DROP TABLE IF EXISTS `lsblj_record_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_record_audit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `user_username` varchar(32) NOT NULL DEFAULT '',
  `user_surname` varchar(64) NOT NULL DEFAULT '',
  `ts` int(11) NOT NULL DEFAULT 0,
  `ret_code` text DEFAULT NULL,
  `ret_desc` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_record_audit`
--

LOCK TABLES `lsblj_record_audit` WRITE;
/*!40000 ALTER TABLE `lsblj_record_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_record_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_record_command`
--

DROP TABLE IF EXISTS `lsblj_record_command`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_record_command` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `record_id` int(11) NOT NULL DEFAULT 0 COMMENT '记录ID',
  `start` bigint(15) DEFAULT 0,
  `command` varchar(255) NOT NULL DEFAULT '',
  `filename` varchar(1024) NOT NULL DEFAULT '' COMMENT 'sftp文件名称',
  `filepath` varchar(255) NOT NULL DEFAULT '' COMMENT '(S)FTP传输文件',
  `filesize` bigint(15) NOT NULL DEFAULT 0 COMMENT 'sftp文件大小',
  `cmddanger_id` int(11) NOT NULL DEFAULT 0 COMMENT '危险等级id',
  `is_apppub` smallint(3) NOT NULL DEFAULT 0 COMMENT '0device,1apppub',
  `department` int(11) NOT NULL DEFAULT 1 COMMENT '部门id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_record_command`
--

LOCK TABLES `lsblj_record_command` WRITE;
/*!40000 ALTER TABLE `lsblj_record_command` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_record_command` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_role`
--

DROP TABLE IF EXISTS `lsblj_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_role`
--

LOCK TABLES `lsblj_role` WRITE;
/*!40000 ALTER TABLE `lsblj_role` DISABLE KEYS */;
INSERT INTO `lsblj_role` VALUES (1,'运维用户'),(2,'系统管理员'),(3,'审计管理员'),(4,'密码管理员'),(5,'部门管理员');
/*!40000 ALTER TABLE `lsblj_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_role_menu`
--

DROP TABLE IF EXISTS `lsblj_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_role_menu` (
  `role_id` int(11) NOT NULL DEFAULT 0 COMMENT '角色管理的角色列表',
  `menu_id` int(11) NOT NULL DEFAULT 0 COMMENT '与左栏菜单一致',
  UNIQUE KEY `role_id` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_role_menu`
--

LOCK TABLES `lsblj_role_menu` WRITE;
/*!40000 ALTER TABLE `lsblj_role_menu` DISABLE KEYS */;
INSERT INTO `lsblj_role_menu` VALUES (1,25),(1,26),(1,29),(2,0),(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),(2,12),(2,13),(2,14),(2,16),(2,17),(2,18),(2,19),(2,20),(2,21),(2,25),(2,26),(2,27),(2,28),(2,29),(2,30),(2,31),(2,32),(2,33),(3,0),(3,11),(3,12),(3,13),(3,14),(3,15),(3,16),(3,17),(3,18),(3,29),(3,30),(4,22),(4,23),(4,24),(5,1),(5,2),(5,4),(5,5),(5,6),(5,7),(5,8),(5,9),(5,10),(5,11),(5,12),(5,13),(5,25),(5,26),(5,28),(5,29),(5,30);
/*!40000 ALTER TABLE `lsblj_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_session_autodelete`
--

DROP TABLE IF EXISTS `lsblj_session_autodelete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_session_autodelete` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `table` varchar(50) NOT NULL DEFAULT '',
  `days` smallint(5) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_session_autodelete`
--

LOCK TABLES `lsblj_session_autodelete` WRITE;
/*!40000 ALTER TABLE `lsblj_session_autodelete` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_session_autodelete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_session_handdelete`
--

DROP TABLE IF EXISTS `lsblj_session_handdelete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_session_handdelete` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `table` varchar(50) NOT NULL DEFAULT '',
  `department_id` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `start_datetime` int(10) NOT NULL DEFAULT 0,
  `end_datetime` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_session_handdelete`
--

LOCK TABLES `lsblj_session_handdelete` WRITE;
/*!40000 ALTER TABLE `lsblj_session_handdelete` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_session_handdelete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_sms_log`
--

DROP TABLE IF EXISTS `lsblj_sms_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_sms_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '接收短信的手机',
  `contents` varchar(255) NOT NULL DEFAULT '' COMMENT '短信的内容',
  `result` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态：0不成功，1成功',
  `fail_count` int(2) NOT NULL DEFAULT 0 COMMENT '失败的次数',
  `send_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '发送的时间',
  `alert_id` int(11) NOT NULL DEFAULT 0 COMMENT '告警日志laert_log.id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_sms_log`
--

LOCK TABLES `lsblj_sms_log` WRITE;
/*!40000 ALTER TABLE `lsblj_sms_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_sms_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_ssh_script`
--

DROP TABLE IF EXISTS `lsblj_ssh_script`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_ssh_script` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `file_path` varchar(255) DEFAULT '' COMMENT '文件路径',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `upload_time` datetime NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_ssh_script`
--

LOCK TABLES `lsblj_ssh_script` WRITE;
/*!40000 ALTER TABLE `lsblj_ssh_script` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_ssh_script` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_sys_session1`
--

DROP TABLE IF EXISTS `lsblj_sys_session1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_sys_session1` (
  `id` varchar(200) NOT NULL COMMENT 'Sessoin的id',
  `refresh_time` int(10) NOT NULL DEFAULT 0 COMMENT 'Session更新时间',
  `session` varchar(5000) DEFAULT NULL COMMENT 'Session的序列化对象',
  `userid` int(32) DEFAULT 0 COMMENT '用户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_sys_session1`
--

LOCK TABLES `lsblj_sys_session1` WRITE;
/*!40000 ALTER TABLE `lsblj_sys_session1` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_sys_session1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_system_message`
--

DROP TABLE IF EXISTS `lsblj_system_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_system_message` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL DEFAULT '' COMMENT '标题',
  `content` varchar(1024) NOT NULL DEFAULT '' COMMENT '内容',
  `add_datetime` datetime NOT NULL DEFAULT current_timestamp() COMMENT '时间',
  `level` tinyint(2) DEFAULT 0 COMMENT '警告级别',
  `alert_id` int(11) NOT NULL DEFAULT 0 COMMENT '告警日志laert_log.id',
  `read_check` tinyint(1) DEFAULT 0 COMMENT '未读',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_system_message`
--

LOCK TABLES `lsblj_system_message` WRITE;
/*!40000 ALTER TABLE `lsblj_system_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_system_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_system_usage`
--

DROP TABLE IF EXISTS `lsblj_system_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_system_usage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '类别',
  `get_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '获取时间',
  `total` bigint(20) NOT NULL DEFAULT 0 COMMENT '总大小',
  `value` bigint(20) NOT NULL DEFAULT 0 COMMENT '当前值',
  `percent` smallint(3) NOT NULL DEFAULT 0 COMMENT '百分比',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_system_usage`
--

LOCK TABLES `lsblj_system_usage` WRITE;
/*!40000 ALTER TABLE `lsblj_system_usage` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_system_usage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_tcplog`
--

DROP TABLE IF EXISTS `lsblj_tcplog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_tcplog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_id` smallint(2) NOT NULL DEFAULT 160 COMMENT '日志标识',
  `reserve` tinyint(1) NOT NULL DEFAULT 0 COMMENT '保留字段',
  `type` smallint(3) NOT NULL DEFAULT 0 COMMENT '日志类型编码',
  `subtype` smallint(3) NOT NULL DEFAULT 0 COMMENT '日志子类型编码',
  `length` smallint(5) NOT NULL DEFAULT 0 COMMENT '数据包长度',
  `content` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '日志内容',
  `sendtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发送时间',
  `result` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1发送0未发送',
  `send_count` smallint(3) NOT NULL DEFAULT 0 COMMENT '发送次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_tcplog`
--

LOCK TABLES `lsblj_tcplog` WRITE;
/*!40000 ALTER TABLE `lsblj_tcplog` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_tcplog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_tcplog_server`
--

DROP TABLE IF EXISTS `lsblj_tcplog_server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_tcplog_server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `port` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0禁用1启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_tcplog_server`
--

LOCK TABLES `lsblj_tcplog_server` WRITE;
/*!40000 ALTER TABLE `lsblj_tcplog_server` DISABLE KEYS */;
INSERT INTO `lsblj_tcplog_server` VALUES (1,'',0,0);
/*!40000 ALTER TABLE `lsblj_tcplog_server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_user`
--

DROP TABLE IF EXISTS `lsblj_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL DEFAULT 0,
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `realname` varchar(64) NOT NULL DEFAULT '' COMMENT '姓名',
  `ldap_dn` varchar(128) DEFAULT '',
  `avatar` varchar(64) DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `status` int(3) NOT NULL DEFAULT 1 COMMENT '状态 0禁用，1正常',
  `fail_count` int(11) NOT NULL DEFAULT 0,
  `lock_time` int(11) DEFAULT 0,
  `last_chpass` int(11) DEFAULT 0,
  `email` varchar(64) CHARACTER SET sjis DEFAULT '' COMMENT '创建里的email',
  `mobile` varchar(24) DEFAULT '' COMMENT '创建里的电话',
  `qq` varchar(24) DEFAULT '' COMMENT '创建里的QQ',
  `wechat` varchar(32) DEFAULT '' COMMENT '创建里的微信',
  `creator_id` int(11) DEFAULT 0,
  `create_time` int(11) DEFAULT 0,
  `description` varchar(2048) DEFAULT '' COMMENT '描述',
  `local_auth` tinyint(1) DEFAULT 0 COMMENT '本地认证',
  `finger_auth` tinyint(1) NOT NULL DEFAULT 0 COMMENT '指纹认证',
  `sms_auth` tinyint(1) DEFAULT 0 COMMENT '短信认证',
  `radius_auth` tinyint(1) DEFAULT 0 COMMENT 'radius认证',
  `dynamic_auth` tinyint(1) DEFAULT 0 COMMENT '动态口令认证',
  `ldap_auth` tinyint(1) DEFAULT 0 COMMENT 'LADP认证',
  `ad_auth` tinyint(1) DEFAULT 0 COMMENT 'AD域认证',
  `wechat_auth` tinyint(1) DEFAULT 0 COMMENT '微信认证',
  `email_auth` tinyint(1) DEFAULT 0 COMMENT '邮箱认证',
  `usb_auth` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'USBKey认证',
  `usbkey` varchar(255) DEFAULT '''''''''''''' COMMENT '序列号',
  `auth_type` tinyint(1) unsigned DEFAULT 0 COMMENT '0单一，1组合',
  `last_login_ip` varchar(50) DEFAULT '',
  `last_change_password` int(10) NOT NULL DEFAULT 0 COMMENT '最后修改密码时间',
  `department` int(11) NOT NULL DEFAULT 1 COMMENT '部门',
  `type` tinyint(3) NOT NULL DEFAULT 0 COMMENT '类型',
  `resolution` tinyint(3) unsigned DEFAULT 0 COMMENT '分辨率',
  `rdpdisk` varchar(50) DEFAULT NULL COMMENT '磁盘映射',
  `session_title` tinyint(1) DEFAULT NULL COMMENT '会话标签0IP,1主机',
  `google_auth_key` varchar(255) NOT NULL DEFAULT '' COMMENT 'google认证密钥',
  `google_auth_token_used` tinyint(2) NOT NULL DEFAULT 0 COMMENT '动态验证码是否已经扫码',
  `sms_code` varchar(255) NOT NULL DEFAULT '0' COMMENT '短信验证码',
  `login_ban_ip` varchar(50) NOT NULL DEFAULT '' COMMENT '用户输错密码超过限制的IP',
  `valid_datetime_start` varchar(255) DEFAULT '' COMMENT '有效开始时间',
  `valid_long` tinyint(1) DEFAULT 1 COMMENT '永久有效',
  `valid_datetime_end` varchar(255) DEFAULT '' COMMENT '有效截止时间',
  `workplace` varchar(255) DEFAULT NULL COMMENT '单位',
  `send_method` varchar(5) DEFAULT '00' COMMENT '随机密码发送方式：10邮件，01短信，11邮件和短信',
  `key_factory` tinyint(2) NOT NULL DEFAULT 1 COMMENT 'USB厂家0科东1南瑞',
  `key_file` varchar(255) NOT NULL DEFAULT '' COMMENT 'usbkey-certfile',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_username` (`username`),
  KEY `unique_realname` (`realname`),
  KEY `inx_department` (`department`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_user`
--

LOCK TABLES `lsblj_user` WRITE;
/*!40000 ALTER TABLE `lsblj_user` DISABLE KEYS */;
INSERT INTO `lsblj_user` VALUES (1,2,'admin','系统管理员','','','bd299057d85d576f59395447ded38b61',1,0,0,0,'2357191256@qq.com','13345678944','','',1,-401150693,'',1,0,0,0,0,0,0,0,0,0,'',0,'1.80.125.102:0',1604022437,1,0,0,NULL,NULL,'o37cu6fpkqdhcbozflrjkbpoghvtisha',0,'','','',1,'','','00',0,''),(2,3,'auditor','系统审计员','','','7b4810e498356f29a2d4bef4e6eda03f',1,0,0,0,'','13901333290','','',1,848882288,'',1,0,0,0,0,0,0,0,0,0,'',0,'0:0:0:0:0:0:0:1:0',1606991359,1,0,0,NULL,NULL,'xs5nukbas2ubaklcdivnhub262f4gpw3',0,'','','',1,'','','00',0,''),(3,4,'password','密码管理员','','','7b4810e498356f29a2d4bef4e6eda03f',1,0,0,0,'','13901333290','','',1,848963730,'',1,0,0,0,0,0,0,0,0,0,'fergreg',0,'0:0:0:0:0:0:0:1:0',1607050644,1,0,0,NULL,NULL,'yva3rit3av4mkop2htdwqqjyfy2cg3rt',1,'','','',1,'','','00',0,'');
/*!40000 ALTER TABLE `lsblj_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_user_favorite`
--

DROP TABLE IF EXISTS `lsblj_user_favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_user_favorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0device,1apppub',
  `device_id` int(11) NOT NULL DEFAULT 0,
  `add_time` int(10) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `device_id` (`device_id`,`user_id`,`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='设备收藏';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_user_favorite`
--

LOCK TABLES `lsblj_user_favorite` WRITE;
/*!40000 ALTER TABLE `lsblj_user_favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_user_favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_user_message`
--

DROP TABLE IF EXISTS `lsblj_user_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_user_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '发件人',
  `to_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '收件人',
  `module` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '模块',
  `module_id` int(11) NOT NULL DEFAULT 0 COMMENT '模块ID',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_user_message`
--

LOCK TABLES `lsblj_user_message` WRITE;
/*!40000 ALTER TABLE `lsblj_user_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_user_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_user_passwordlog`
--

DROP TABLE IF EXISTS `lsblj_user_passwordlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_user_passwordlog` (
  `lsblj_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '使用密码',
  `create_time` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='历史密码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_user_passwordlog`
--

LOCK TABLES `lsblj_user_passwordlog` WRITE;
/*!40000 ALTER TABLE `lsblj_user_passwordlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_user_passwordlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_user_policy`
--

DROP TABLE IF EXISTS `lsblj_user_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_user_policy` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '策略名称',
  `valid_datetime_start` varchar(255) DEFAULT '' COMMENT '有效开始时间',
  `valid_long` tinyint(1) DEFAULT 1 COMMENT '永久有效',
  `valid_datetime_end` varchar(255) DEFAULT '' COMMENT '有效截止时间',
  `timelimit_ban_monday` varchar(100) DEFAULT '' COMMENT '周1不允许时间',
  `timelimit_ban_tuesday` varchar(100) DEFAULT '' COMMENT '周2不允许时间',
  `timelimit_ban_wednesday` varchar(100) DEFAULT '' COMMENT '周3不允许时间',
  `timelimit_ban_thursday` varchar(100) DEFAULT '' COMMENT '周4不允许时间',
  `timelimit_ban_friday` varchar(100) DEFAULT '' COMMENT '周5不允许时间',
  `timelimit_ban_saturday` varchar(100) DEFAULT '' COMMENT '周6不允许时间',
  `timelimit_ban_sunday` varchar(100) DEFAULT '' COMMENT '周7不允许时间',
  `allow_ip` varchar(2048) DEFAULT '',
  `ban_ip` varchar(2048) DEFAULT '',
  `status` tinyint(1) DEFAULT 1 COMMENT '1启用,0禁用',
  `desc` varchar(255) DEFAULT '' COMMENT '描述',
  `department` int(11) NOT NULL DEFAULT 1 COMMENT '部门id',
  `sort` int(11) unsigned NOT NULL DEFAULT 1 COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `key_sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_user_policy`
--

LOCK TABLES `lsblj_user_policy` WRITE;
/*!40000 ALTER TABLE `lsblj_user_policy` DISABLE KEYS */;
INSERT INTO `lsblj_user_policy` VALUES (38,'tet','',1,'','','','16,17,18,19,20,21,22,23,','16,17,18,19,20,21,22,23,','16,17,18,19,20,21,22,23,','16,17,18,19,20,21,22,23,','16,17,18,19,20,21,22,23,','','',1,'',1,2),(40,'gqfe','',1,'','','12,13,','','1,2,18,','1,2,3,4,5,18,','7,8,9,10,11,12,13,14,15,16,17,18,','','','3.53.34.32',1,'trgasbhhstrhythytjhyt',1,3);
/*!40000 ALTER TABLE `lsblj_user_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_user_policy_group`
--

DROP TABLE IF EXISTS `lsblj_user_policy_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_user_policy_group` (
  `policy_id` int(11) NOT NULL DEFAULT 0 COMMENT '策略ID',
  `group_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户组ID',
  UNIQUE KEY `policy_id` (`policy_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_user_policy_group`
--

LOCK TABLES `lsblj_user_policy_group` WRITE;
/*!40000 ALTER TABLE `lsblj_user_policy_group` DISABLE KEYS */;
INSERT INTO `lsblj_user_policy_group` VALUES (40,7),(40,8);
/*!40000 ALTER TABLE `lsblj_user_policy_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_user_policy_user`
--

DROP TABLE IF EXISTS `lsblj_user_policy_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_user_policy_user` (
  `policy_id` int(11) NOT NULL DEFAULT 0 COMMENT '策略ID',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID',
  UNIQUE KEY `policy_id` (`policy_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_user_policy_user`
--

LOCK TABLES `lsblj_user_policy_user` WRITE;
/*!40000 ALTER TABLE `lsblj_user_policy_user` DISABLE KEYS */;
INSERT INTO `lsblj_user_policy_user` VALUES (38,27),(38,28),(40,27),(40,33);
/*!40000 ALTER TABLE `lsblj_user_policy_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_user_role`
--

DROP TABLE IF EXISTS `lsblj_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_user_role` (
  `user_id` bigint(24) NOT NULL,
  `role_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_user_role`
--

LOCK TABLES `lsblj_user_role` WRITE;
/*!40000 ALTER TABLE `lsblj_user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_user_visit`
--

DROP TABLE IF EXISTS `lsblj_user_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_user_visit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_account_id` int(11) NOT NULL DEFAULT 0,
  `add_time` int(10) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0device,1apppub',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='设备访问';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_user_visit`
--

LOCK TABLES `lsblj_user_visit` WRITE;
/*!40000 ALTER TABLE `lsblj_user_visit` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_user_visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_workorder`
--

DROP TABLE IF EXISTS `lsblj_workorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_workorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '策略名称',
  `valid_datetime_start` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '有效开始时间',
  `valid_datetime_end` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '有效截止时间',
  `upload` tinyint(1) DEFAULT 1 COMMENT '允许上传',
  `download` tinyint(1) DEFAULT 1 COMMENT '允许下载',
  `file_manage` tinyint(1) NOT NULL DEFAULT 1 COMMENT '文件管理',
  `up_clipboard` tinyint(1) NOT NULL DEFAULT 1 COMMENT '上行剪切板',
  `down_clipboard` tinyint(1) NOT NULL DEFAULT 1 COMMENT '下行剪切板',
  `watermark` tinyint(1) NOT NULL DEFAULT 1 COMMENT '显示水印',
  `status` tinyint(1) DEFAULT 1 COMMENT '1启用,0禁用',
  `description` varchar(255) DEFAULT '' COMMENT '描述',
  `department` int(11) NOT NULL DEFAULT 1 COMMENT '部门id',
  `user_id` int(11) NOT NULL DEFAULT 1 COMMENT '用户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_workorder`
--

LOCK TABLES `lsblj_workorder` WRITE;
/*!40000 ALTER TABLE `lsblj_workorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_workorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_workorder_apply`
--

DROP TABLE IF EXISTS `lsblj_workorder_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_workorder_apply` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `jobid` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '运维工单ID',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0访问工单1命令工单',
  `apply_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '申请人',
  `apply_username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '申请人用户名',
  `apply_realname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '申请人姓名',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '工单名称',
  `name` char(35) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '工单号',
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '调控机构(电力)',
  `start` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `end` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止时间',
  `upload` tinyint(1) unsigned NOT NULL DEFAULT 1 COMMENT '上传',
  `download` tinyint(1) unsigned NOT NULL DEFAULT 1 COMMENT '下载',
  `filemanage` tinyint(1) unsigned NOT NULL DEFAULT 1 COMMENT '文件管理',
  `up_clipboard` tinyint(1) unsigned NOT NULL DEFAULT 1 COMMENT '上行剪切板',
  `down_clipboard` tinyint(1) unsigned NOT NULL DEFAULT 1 COMMENT '下行剪切板',
  `watermark` tinyint(1) unsigned NOT NULL DEFAULT 1 COMMENT '显示水印',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '描述',
  `result` tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '0未提交1已提交2审批中3审批拒绝10审批通过',
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '申请结果描述',
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deadline` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '截止日期',
  `command` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '命令',
  `record_id` int(11) NOT NULL DEFAULT 0 COMMENT '审计日志ID',
  `gconnectid` int(11) NOT NULL DEFAULT 0 COMMENT '连接ID',
  `apply_department` int(11) NOT NULL DEFAULT 1 COMMENT '申请部门',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_workorder_apply`
--

LOCK TABLES `lsblj_workorder_apply` WRITE;
/*!40000 ALTER TABLE `lsblj_workorder_apply` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_workorder_apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_workorder_apply_device_account`
--

DROP TABLE IF EXISTS `lsblj_workorder_apply_device_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_workorder_apply_device_account` (
  `workorder_apply_id` int(11) NOT NULL DEFAULT 0 COMMENT '申请ID',
  `device_account_id` int(11) NOT NULL DEFAULT 0 COMMENT '设备账号ID',
  UNIQUE KEY `workorder_id` (`workorder_apply_id`,`device_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_workorder_apply_device_account`
--

LOCK TABLES `lsblj_workorder_apply_device_account` WRITE;
/*!40000 ALTER TABLE `lsblj_workorder_apply_device_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_workorder_apply_device_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lsblj_workorder_audit_log`
--

DROP TABLE IF EXISTS `lsblj_workorder_audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lsblj_workorder_audit_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workorder_apply_id` int(11) NOT NULL DEFAULT 0 COMMENT '申请ID',
  `audit_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '审批人',
  `audit_username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '审批人用户名',
  `audit_realname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '审批人姓名',
  `submit_datetime` datetime NOT NULL DEFAULT current_timestamp() COMMENT '提交日期',
  `department` int(11) NOT NULL DEFAULT 0 COMMENT '部门',
  `audit_result` int(11) NOT NULL DEFAULT 0 COMMENT '0未审批1拒绝2通过',
  `audit_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '审批时间',
  `step` tinyint(1) NOT NULL DEFAULT 0 COMMENT '步骤',
  `audit_comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `device_account_id` int(11) NOT NULL DEFAULT 0 COMMENT '涉及设备账号ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lsblj_workorder_audit_log`
--

LOCK TABLES `lsblj_workorder_audit_log` WRITE;
/*!40000 ALTER TABLE `lsblj_workorder_audit_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `lsblj_workorder_audit_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-13 14:37:26
