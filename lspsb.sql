-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- 主机： 39.97.123.62
-- 生成日期： 2020-12-07 12:44:30
-- 服务器版本： 10.4.17-MariaDB
-- PHP 版本： 7.3.22-(to be removed in future macOS)

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `lspsb`
--
CREATE DATABASE IF NOT EXISTS `lspsb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `lspsb`;

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_access_policy`
--

DROP TABLE IF EXISTS `lspsb_access_policy`;
CREATE TABLE `lspsb_access_policy` (
  `id` int(11) UNSIGNED NOT NULL,
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
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_access_policy_device_account`
--

DROP TABLE IF EXISTS `lspsb_access_policy_device_account`;
CREATE TABLE `lspsb_access_policy_device_account` (
  `policy_id` int(11) NOT NULL DEFAULT 0 COMMENT '策略ID',
  `device_account_id` int(11) NOT NULL DEFAULT 0 COMMENT '设备账号ID',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '运维人员对设备账号的备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_access_policy_group`
--

DROP TABLE IF EXISTS `lspsb_access_policy_group`;
CREATE TABLE `lspsb_access_policy_group` (
  `policy_id` int(11) NOT NULL DEFAULT 0 COMMENT '策略ID',
  `group_id` int(11) NOT NULL DEFAULT 0 COMMENT '组ID',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '类型'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_access_policy_user`
--

DROP TABLE IF EXISTS `lspsb_access_policy_user`;
CREATE TABLE `lspsb_access_policy_user` (
  `policy_id` int(11) NOT NULL DEFAULT 0 COMMENT '策略ID',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_alert_log`
--

DROP TABLE IF EXISTS `lspsb_alert_log`;
CREATE TABLE `lspsb_alert_log` (
  `id` int(10) NOT NULL,
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
  `department` int(11) NOT NULL DEFAULT 1 COMMENT '部门id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_app_loginkey`
--

DROP TABLE IF EXISTS `lspsb_app_loginkey`;
CREATE TABLE `lspsb_app_loginkey` (
  `id` int(11) NOT NULL,
  `loginkey` varchar(50) NOT NULL COMMENT '密钥',
  `userid` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `logintime` int(10) NOT NULL DEFAULT 0 COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='app登录密钥';

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_change_password_log`
--

DROP TABLE IF EXISTS `lspsb_change_password_log`;
CREATE TABLE `lspsb_change_password_log` (
  `id` int(11) NOT NULL,
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
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '说明'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_change_password_policy`
--

DROP TABLE IF EXISTS `lspsb_change_password_policy`;
CREATE TABLE `lspsb_change_password_policy` (
  `id` int(11) NOT NULL,
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
  `department` int(11) NOT NULL DEFAULT 1 COMMENT '部门id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_change_password_policy_device_account`
--

DROP TABLE IF EXISTS `lspsb_change_password_policy_device_account`;
CREATE TABLE `lspsb_change_password_policy_device_account` (
  `policy_id` int(11) NOT NULL COMMENT '策略ID',
  `device_account_id` int(11) NOT NULL DEFAULT 0 COMMENT '设备账号ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_change_password_policy_group`
--

DROP TABLE IF EXISTS `lspsb_change_password_policy_group`;
CREATE TABLE `lspsb_change_password_policy_group` (
  `policy_id` int(11) NOT NULL COMMENT '策略ID',
  `group_id` varchar(255) NOT NULL DEFAULT '' COMMENT '组ID',
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '类型'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_config`
--

DROP TABLE IF EXISTS `lspsb_config`;
CREATE TABLE `lspsb_config` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_config_alert_level`
--

DROP TABLE IF EXISTS `lspsb_config_alert_level`;
CREATE TABLE `lspsb_config_alert_level` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `telnet_max` int(11) NOT NULL DEFAULT 0 COMMENT 'telnet并发最大阈值',
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
  `vnc_max_level` tinyint(2) NOT NULL DEFAULT 1 COMMENT '0关闭1低级2中级3高级 '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='告警参数';

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_config_dbbackup`
--

DROP TABLE IF EXISTS `lspsb_config_dbbackup`;
CREATE TABLE `lspsb_config_dbbackup` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `backup_time` int(10) NOT NULL DEFAULT 0 COMMENT '备份时间',
  `filesize` int(11) NOT NULL DEFAULT 0 COMMENT '文件大小',
  `desc` varchar(2048) NOT NULL DEFAULT '' COMMENT '描述',
  `filepath` varchar(255) NOT NULL DEFAULT '' COMMENT '备份文件'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='数据库备份表';

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_config_email`
--

DROP TABLE IF EXISTS `lspsb_config_email`;
CREATE TABLE `lspsb_config_email` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `ip` varchar(150) NOT NULL DEFAULT '' COMMENT '服务器IP',
  `ssl` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'ssl',
  `port` int(11) NOT NULL DEFAULT 0 COMMENT '服务器端口',
  `username` varchar(150) NOT NULL DEFAULT '' COMMENT '账号',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0关闭1开启'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='邮箱配置';

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_config_finger`
--

DROP TABLE IF EXISTS `lspsb_config_finger`;
CREATE TABLE `lspsb_config_finger` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `url` varchar(150) NOT NULL DEFAULT '' COMMENT '接口地址',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0禁用1启用',
  `endpoint` varchar(255) NOT NULL DEFAULT '' COMMENT '账号',
  `pwd` varchar(255) NOT NULL DEFAULT '' COMMENT '密码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='指纹配置';

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_config_login`
--

DROP TABLE IF EXISTS `lspsb_config_login`;
CREATE TABLE `lspsb_config_login` (
  `id` int(11) NOT NULL COMMENT 'ID',
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
  `background` varchar(255) NOT NULL DEFAULT '' COMMENT '登录背景',
  `company_icon_big` varchar(255) NOT NULL DEFAULT '' COMMENT '公司图标',
  `company_icon` varchar(255) NOT NULL DEFAULT '' COMMENT '公司图标小的'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='登录配置';

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_config_logpara`
--

DROP TABLE IF EXISTS `lspsb_config_logpara`;
CREATE TABLE `lspsb_config_logpara` (
  `id` int(11) NOT NULL COMMENT '序号',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '链接名称',
  `log_manage` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `sort` tinyint(100) NOT NULL DEFAULT 1 COMMENT '排序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_config_password_encrypt_key`
--

DROP TABLE IF EXISTS `lspsb_config_password_encrypt_key`;
CREATE TABLE `lspsb_config_password_encrypt_key` (
  `pkey` varchar(255) NOT NULL DEFAULT '' COMMENT '密码加密密钥',
  `mode` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0软件加密1硬件加密',
  `hardwareEncryptCmd` varchar(255) NOT NULL DEFAULT '/opt/lspsb/server/bin/sm4'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='syslog配置';

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_department`
--

DROP TABLE IF EXISTS `lspsb_department`;
CREATE TABLE `lspsb_department` (
  `id` int(11) NOT NULL COMMENT '部门ID',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '部门名称',
  `count` int(11) NOT NULL DEFAULT 0 COMMENT '部门总用户数',
  `device_count` int(11) NOT NULL DEFAULT 0 COMMENT '部门总设备数',
  `description` varchar(128) NOT NULL DEFAULT '' COMMENT '描述',
  `create_time` int(10) NOT NULL DEFAULT 0 COMMENT '创建的时间',
  `create_id` int(11) NOT NULL DEFAULT 0 COMMENT '创建者id',
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '上级部门ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_department_cache`
--

DROP TABLE IF EXISTS `lspsb_department_cache`;
CREATE TABLE `lspsb_department_cache` (
  `department_id` int(11) NOT NULL DEFAULT 0,
  `parent_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_device`
--

DROP TABLE IF EXISTS `lspsb_device`;
CREATE TABLE `lspsb_device` (
  `id` int(11) NOT NULL,
  `device_type` int(2) NOT NULL COMMENT '系统类型取值参照lspsb_device_type',
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
  `ssh_key` int(11) NOT NULL DEFAULT 0 COMMENT 'SSH_key   0是，1否'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_device_account`
--

DROP TABLE IF EXISTS `lspsb_device_account`;
CREATE TABLE `lspsb_device_account` (
  `id` int(11) NOT NULL,
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
  `sftp_path` varchar(255) NOT NULL DEFAULT '/tmp' COMMENT 'sftp路径'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_device_type`
--

DROP TABLE IF EXISTS `lspsb_device_type`;
CREATE TABLE `lspsb_device_type` (
  `id` tinyint(4) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '系统类型',
  `param` varchar(255) DEFAULT '' COMMENT '提权参数',
  `device_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:主机，1:网络',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_dynamic_token`
--

DROP TABLE IF EXISTS `lspsb_dynamic_token`;
CREATE TABLE `lspsb_dynamic_token` (
  `id` int(11) NOT NULL,
  `sign` varchar(255) NOT NULL DEFAULT '',
  `private_key` varchar(255) NOT NULL DEFAULT '',
  `user_id` varchar(255) NOT NULL DEFAULT '',
  `creator_id` int(11) NOT NULL DEFAULT 0,
  `creator_time` int(10) NOT NULL DEFAULT 0,
  `state` tinyint(1) DEFAULT NULL COMMENT '0禁用，1启用'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_email_log`
--

DROP TABLE IF EXISTS `lspsb_email_log`;
CREATE TABLE `lspsb_email_log` (
  `id` int(11) NOT NULL,
  `to_users` varchar(255) NOT NULL DEFAULT '' COMMENT '收件人',
  `to_title` varchar(255) NOT NULL DEFAULT '' COMMENT '邮件标题',
  `to_contents` varchar(1024) NOT NULL DEFAULT '' COMMENT '邮件内容',
  `result` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0:失败，1:成功',
  `fail_count` tinyint(2) NOT NULL DEFAULT 0 COMMENT '失败的次数',
  `send_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '发送的时间',
  `alert_id` int(11) NOT NULL DEFAULT 0 COMMENT 'alert_log告警日志的ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_group`
--

DROP TABLE IF EXISTS `lspsb_group`;
CREATE TABLE `lspsb_group` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '0全部，1用户，2设备',
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '设备组名称',
  `department` int(11) NOT NULL DEFAULT 1 COMMENT '部门id',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `count` int(11) NOT NULL DEFAULT 0 COMMENT '设备数',
  `creator_id` int(11) NOT NULL DEFAULT 0,
  `create_time` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_group_device_account`
--

DROP TABLE IF EXISTS `lspsb_group_device_account`;
CREATE TABLE `lspsb_group_device_account` (
  `group_id` int(11) NOT NULL COMMENT '设备组id',
  `device_account_id` int(11) NOT NULL COMMENT '设备账号id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_group_user`
--

DROP TABLE IF EXISTS `lspsb_group_user`;
CREATE TABLE `lspsb_group_user` (
  `group_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户组id',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_login_log`
--

DROP TABLE IF EXISTS `lspsb_login_log`;
CREATE TABLE `lspsb_login_log` (
  `id` int(10) NOT NULL,
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
  `session_id` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_menu`
--

DROP TABLE IF EXISTS `lspsb_menu`;
CREATE TABLE `lspsb_menu` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `resource` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_operator_log`
--

DROP TABLE IF EXISTS `lspsb_operator_log`;
CREATE TABLE `lspsb_operator_log` (
  `id` int(10) NOT NULL,
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
  `details` text NOT NULL DEFAULT '' COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_protocol`
--

DROP TABLE IF EXISTS `lspsb_protocol`;
CREATE TABLE `lspsb_protocol` (
  `id` tinyint(2) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_role`
--

DROP TABLE IF EXISTS `lspsb_role`;
CREATE TABLE `lspsb_role` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_role_menu`
--

DROP TABLE IF EXISTS `lspsb_role_menu`;
CREATE TABLE `lspsb_role_menu` (
  `role_id` int(11) NOT NULL DEFAULT 0 COMMENT '角色管理的角色列表',
  `menu_id` int(11) NOT NULL DEFAULT 0 COMMENT '与左栏菜单一致'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_system_message`
--

DROP TABLE IF EXISTS `lspsb_system_message`;
CREATE TABLE `lspsb_system_message` (
  `id` int(10) NOT NULL,
  `title` varchar(150) NOT NULL DEFAULT '' COMMENT '标题',
  `content` varchar(1024) NOT NULL DEFAULT '' COMMENT '内容',
  `add_datetime` datetime NOT NULL DEFAULT current_timestamp() COMMENT '时间',
  `level` tinyint(2) DEFAULT 0 COMMENT '警告级别',
  `alert_id` int(11) NOT NULL DEFAULT 0 COMMENT '告警日志laert_log.id',
  `read_check` tinyint(1) DEFAULT 0 COMMENT '未读'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_system_usage`
--

DROP TABLE IF EXISTS `lspsb_system_usage`;
CREATE TABLE `lspsb_system_usage` (
  `id` bigint(20) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '类别',
  `get_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '获取时间',
  `total` bigint(20) NOT NULL DEFAULT 0 COMMENT '总大小',
  `value` bigint(20) NOT NULL DEFAULT 0 COMMENT '当前值',
  `percent` smallint(3) NOT NULL DEFAULT 0 COMMENT '百分比'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统信息';

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_user`
--

DROP TABLE IF EXISTS `lspsb_user`;
CREATE TABLE `lspsb_user` (
  `id` int(11) NOT NULL,
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
  `auth_type` tinyint(1) UNSIGNED DEFAULT 0 COMMENT '0单一，1组合',
  `last_login_ip` varchar(50) DEFAULT '',
  `last_change_password` int(10) NOT NULL DEFAULT 0 COMMENT '最后修改密码时间',
  `department` int(11) NOT NULL DEFAULT 1 COMMENT '部门',
  `type` tinyint(3) NOT NULL DEFAULT 0 COMMENT '类型',
  `resolution` tinyint(3) UNSIGNED DEFAULT 0 COMMENT '分辨率',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_user_message`
--

DROP TABLE IF EXISTS `lspsb_user_message`;
CREATE TABLE `lspsb_user_message` (
  `id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '发件人',
  `to_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '收件人',
  `module` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '模块',
  `module_id` int(11) NOT NULL DEFAULT 0 COMMENT '模块ID',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_user_passwordlog`
--

DROP TABLE IF EXISTS `lspsb_user_passwordlog`;
CREATE TABLE `lspsb_user_passwordlog` (
  `lspsb_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '使用密码',
  `create_time` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='历史密码';

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_user_policy`
--

DROP TABLE IF EXISTS `lspsb_user_policy`;
CREATE TABLE `lspsb_user_policy` (
  `id` int(11) UNSIGNED NOT NULL,
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
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 1 COMMENT '排序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_user_policy_group`
--

DROP TABLE IF EXISTS `lspsb_user_policy_group`;
CREATE TABLE `lspsb_user_policy_group` (
  `policy_id` int(11) NOT NULL DEFAULT 0 COMMENT '策略ID',
  `group_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户组ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_user_policy_user`
--

DROP TABLE IF EXISTS `lspsb_user_policy_user`;
CREATE TABLE `lspsb_user_policy_user` (
  `policy_id` int(11) NOT NULL DEFAULT 0 COMMENT '策略ID',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_user_role`
--

DROP TABLE IF EXISTS `lspsb_user_role`;
CREATE TABLE `lspsb_user_role` (
  `user_id` bigint(24) NOT NULL,
  `role_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `lspsb_user_visit`
--

DROP TABLE IF EXISTS `lspsb_user_visit`;
CREATE TABLE `lspsb_user_visit` (
  `id` int(11) NOT NULL,
  `device_account_id` int(11) NOT NULL DEFAULT 0,
  `add_time` int(10) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='设备访问';

--
-- 转储表的索引
--

--
-- 表的索引 `lspsb_access_policy`
--
ALTER TABLE `lspsb_access_policy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_sort` (`sort`);

--
-- 表的索引 `lspsb_access_policy_device_account`
--
ALTER TABLE `lspsb_access_policy_device_account`
  ADD UNIQUE KEY `policy_id` (`policy_id`,`device_account_id`);

--
-- 表的索引 `lspsb_access_policy_group`
--
ALTER TABLE `lspsb_access_policy_group`
  ADD UNIQUE KEY `policy_id` (`policy_id`,`group_id`);

--
-- 表的索引 `lspsb_access_policy_user`
--
ALTER TABLE `lspsb_access_policy_user`
  ADD UNIQUE KEY `policy_id` (`policy_id`,`user_id`);

--
-- 表的索引 `lspsb_alert_log`
--
ALTER TABLE `lspsb_alert_log`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `lspsb_app_loginkey`
--
ALTER TABLE `lspsb_app_loginkey`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `lspsb_change_password_log`
--
ALTER TABLE `lspsb_change_password_log`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `lspsb_change_password_policy`
--
ALTER TABLE `lspsb_change_password_policy`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `lspsb_config`
--
ALTER TABLE `lspsb_config`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `lspsb_config_alert_level`
--
ALTER TABLE `lspsb_config_alert_level`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `lspsb_config_dbbackup`
--
ALTER TABLE `lspsb_config_dbbackup`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `lspsb_config_email`
--
ALTER TABLE `lspsb_config_email`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `lspsb_config_finger`
--
ALTER TABLE `lspsb_config_finger`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `lspsb_config_login`
--
ALTER TABLE `lspsb_config_login`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `lspsb_config_logpara`
--
ALTER TABLE `lspsb_config_logpara`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `lspsb_department`
--
ALTER TABLE `lspsb_department`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_pid` (`parent_id`);

--
-- 表的索引 `lspsb_department_cache`
--
ALTER TABLE `lspsb_department_cache`
  ADD UNIQUE KEY `department_id` (`department_id`,`parent_id`);

--
-- 表的索引 `lspsb_device`
--
ALTER TABLE `lspsb_device`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `lspsb_device_account`
--
ALTER TABLE `lspsb_device_account`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `lspsb_device_type`
--
ALTER TABLE `lspsb_device_type`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `lspsb_dynamic_token`
--
ALTER TABLE `lspsb_dynamic_token`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `lspsb_email_log`
--
ALTER TABLE `lspsb_email_log`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `lspsb_group`
--
ALTER TABLE `lspsb_group`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `lspsb_group_device_account`
--
ALTER TABLE `lspsb_group_device_account`
  ADD UNIQUE KEY `group_id` (`group_id`,`device_account_id`);

--
-- 表的索引 `lspsb_group_user`
--
ALTER TABLE `lspsb_group_user`
  ADD UNIQUE KEY `group_id` (`group_id`,`user_id`);

--
-- 表的索引 `lspsb_login_log`
--
ALTER TABLE `lspsb_login_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lspsb_login_log_login_datetime_IDX` (`login_datetime`) USING BTREE;

--
-- 表的索引 `lspsb_menu`
--
ALTER TABLE `lspsb_menu`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `lspsb_operator_log`
--
ALTER TABLE `lspsb_operator_log`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `lspsb_protocol`
--
ALTER TABLE `lspsb_protocol`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `lspsb_role`
--
ALTER TABLE `lspsb_role`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `lspsb_role_menu`
--
ALTER TABLE `lspsb_role_menu`
  ADD UNIQUE KEY `role_id` (`role_id`,`menu_id`);

--
-- 表的索引 `lspsb_system_message`
--
ALTER TABLE `lspsb_system_message`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `lspsb_system_usage`
--
ALTER TABLE `lspsb_system_usage`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `lspsb_user`
--
ALTER TABLE `lspsb_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_username` (`username`),
  ADD KEY `unique_realname` (`realname`),
  ADD KEY `inx_department` (`department`);

--
-- 表的索引 `lspsb_user_message`
--
ALTER TABLE `lspsb_user_message`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `lspsb_user_policy`
--
ALTER TABLE `lspsb_user_policy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `key_sort` (`sort`);

--
-- 表的索引 `lspsb_user_policy_group`
--
ALTER TABLE `lspsb_user_policy_group`
  ADD UNIQUE KEY `policy_id` (`policy_id`,`group_id`);

--
-- 表的索引 `lspsb_user_policy_user`
--
ALTER TABLE `lspsb_user_policy_user`
  ADD UNIQUE KEY `policy_id` (`policy_id`,`user_id`);

--
-- 表的索引 `lspsb_user_visit`
--
ALTER TABLE `lspsb_user_visit`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `lspsb_access_policy`
--
ALTER TABLE `lspsb_access_policy`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `lspsb_alert_log`
--
ALTER TABLE `lspsb_alert_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `lspsb_app_loginkey`
--
ALTER TABLE `lspsb_app_loginkey`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `lspsb_change_password_log`
--
ALTER TABLE `lspsb_change_password_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `lspsb_change_password_policy`
--
ALTER TABLE `lspsb_change_password_policy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `lspsb_config`
--
ALTER TABLE `lspsb_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `lspsb_config_alert_level`
--
ALTER TABLE `lspsb_config_alert_level`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `lspsb_config_dbbackup`
--
ALTER TABLE `lspsb_config_dbbackup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- 使用表AUTO_INCREMENT `lspsb_config_email`
--
ALTER TABLE `lspsb_config_email`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- 使用表AUTO_INCREMENT `lspsb_config_finger`
--
ALTER TABLE `lspsb_config_finger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- 使用表AUTO_INCREMENT `lspsb_config_login`
--
ALTER TABLE `lspsb_config_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- 使用表AUTO_INCREMENT `lspsb_config_logpara`
--
ALTER TABLE `lspsb_config_logpara`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号';

--
-- 使用表AUTO_INCREMENT `lspsb_department`
--
ALTER TABLE `lspsb_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门ID';

--
-- 使用表AUTO_INCREMENT `lspsb_device`
--
ALTER TABLE `lspsb_device`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `lspsb_device_account`
--
ALTER TABLE `lspsb_device_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `lspsb_device_type`
--
ALTER TABLE `lspsb_device_type`
  MODIFY `id` tinyint(4) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `lspsb_dynamic_token`
--
ALTER TABLE `lspsb_dynamic_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `lspsb_email_log`
--
ALTER TABLE `lspsb_email_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `lspsb_group`
--
ALTER TABLE `lspsb_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `lspsb_login_log`
--
ALTER TABLE `lspsb_login_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `lspsb_menu`
--
ALTER TABLE `lspsb_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `lspsb_operator_log`
--
ALTER TABLE `lspsb_operator_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `lspsb_protocol`
--
ALTER TABLE `lspsb_protocol`
  MODIFY `id` tinyint(2) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `lspsb_role`
--
ALTER TABLE `lspsb_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `lspsb_system_message`
--
ALTER TABLE `lspsb_system_message`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `lspsb_system_usage`
--
ALTER TABLE `lspsb_system_usage`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `lspsb_user`
--
ALTER TABLE `lspsb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `lspsb_user_message`
--
ALTER TABLE `lspsb_user_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `lspsb_user_policy`
--
ALTER TABLE `lspsb_user_policy`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `lspsb_user_visit`
--
ALTER TABLE `lspsb_user_visit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
