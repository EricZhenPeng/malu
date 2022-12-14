/*
Navicat MySQL Data Transfer

Source Server         : cdc
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : malu

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2022-07-29 13:47:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES ('1', 'ml_prize', '奖品管理', '', null, 'MlPrize', 'crud', 'com.ruoyi.project.system', 'system', 'prize', '奖品管理', 'pengz', '0', '/', '{\"parentMenuId\":\"2\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"系统监控\",\"treeCode\":\"\"}', 'admin', '2022-07-25 15:53:20', '', '2022-07-25 16:03:01', '');
INSERT INTO `gen_table` VALUES ('2', 'ml_user', '抽奖用户管理', '', null, 'MlUser', 'crud', 'com.ruoyi.project.system', 'system', 'mluser', '抽奖用户管理', 'malu', '0', '/', '{\"parentMenuId\":\"2006\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"奖品管理\",\"treeCode\":\"\"}', 'admin', '2022-07-25 22:38:36', '', '2022-07-25 22:43:57', '');
INSERT INTO `gen_table` VALUES ('3', 'ml_user_prize', '抽奖用户与奖品之间的绑定', '', null, 'MlUserPrize', 'crud', 'com.ruoyi.project.system', 'system', 'userPrize', '抽奖用户与奖品之间的绑定', 'malu', '0', '/', '{\"parentMenuId\":\"2006\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"奖品管理\",\"treeCode\":\"\"}', 'admin', '2022-07-26 11:33:50', '', '2022-07-26 11:35:18', '');
INSERT INTO `gen_table` VALUES ('4', 'ml_prize_log', '奖品日志', '', null, 'MlPrizeLog', 'crud', 'com.ruoyi.project.system', 'system', 'prizeLog', '奖品日志', 'malu', '0', '/', '{\"parentMenuId\":\"2006\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"奖品管理\",\"treeCode\":\"\"}', 'admin', '2022-07-27 14:57:09', '', '2022-07-27 15:17:13', '');
INSERT INTO `gen_table` VALUES ('5', 'ml_user_prize_log', '用户与日志中间表', '', null, 'MlUserPrizeLog', 'crud', 'com.ruoyi.project.system', 'system', 'userPrizeLog', '日志与用户之间的关系', 'malu', '0', '/', '{\"parentMenuId\":\"2006\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"奖品管理\",\"treeCode\":\"\"}', 'admin', '2022-07-27 15:03:03', '', '2022-07-27 15:04:38', '');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES ('1', '1', 'id', '', 'bigint(20)', 'Long', 'id', '1', '1', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2022-07-25 15:53:20', null, '2022-07-25 16:03:01');
INSERT INTO `gen_table_column` VALUES ('2', '1', 'name', '奖品名称', 'varchar(50)', 'String', 'name', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '2', 'admin', '2022-07-25 15:53:20', null, '2022-07-25 16:03:01');
INSERT INTO `gen_table_column` VALUES ('3', '1', 'prize', '奖品金额', 'double(20,0)', 'Long', 'prize', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2022-07-25 15:53:20', null, '2022-07-25 16:03:01');
INSERT INTO `gen_table_column` VALUES ('4', '1', 'state', '状态', 'varchar(30)', 'String', 'state', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', 'sys_normal_disable', '4', 'admin', '2022-07-25 15:53:20', null, '2022-07-25 16:03:01');
INSERT INTO `gen_table_column` VALUES ('5', '1', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', null, '1', null, null, null, 'EQ', 'input', '', '5', 'admin', '2022-07-25 15:53:20', null, '2022-07-25 16:03:01');
INSERT INTO `gen_table_column` VALUES ('6', '1', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, '1', null, null, null, 'EQ', 'datetime', '', '6', 'admin', '2022-07-25 15:53:20', null, '2022-07-25 16:03:01');
INSERT INTO `gen_table_column` VALUES ('7', '1', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', null, '1', '1', null, null, 'EQ', 'input', '', '7', 'admin', '2022-07-25 15:53:20', null, '2022-07-25 16:03:01');
INSERT INTO `gen_table_column` VALUES ('8', '1', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, '1', '1', null, null, 'EQ', 'datetime', '', '8', 'admin', '2022-07-25 15:53:20', null, '2022-07-25 16:03:01');
INSERT INTO `gen_table_column` VALUES ('9', '2', 'id', '', 'bigint(20)', 'Long', 'id', '1', '0', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2022-07-25 22:38:36', null, '2022-07-25 22:43:57');
INSERT INTO `gen_table_column` VALUES ('10', '2', 'user_name', '用户名称', 'varchar(60)', 'String', 'userName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '2', 'admin', '2022-07-25 22:38:36', null, '2022-07-25 22:43:57');
INSERT INTO `gen_table_column` VALUES ('11', '2', 'draw_num', '抽奖次数', 'int(10)', 'Integer', 'drawNum', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2022-07-25 22:38:36', null, '2022-07-25 22:43:57');
INSERT INTO `gen_table_column` VALUES ('12', '2', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', null, '1', null, null, null, 'EQ', 'input', '', '4', 'admin', '2022-07-25 22:38:36', null, '2022-07-25 22:43:57');
INSERT INTO `gen_table_column` VALUES ('13', '2', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', null, '1', null, null, null, 'EQ', 'datetime', '', '5', 'admin', '2022-07-25 22:38:36', null, '2022-07-25 22:43:57');
INSERT INTO `gen_table_column` VALUES ('14', '2', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', null, '1', '1', null, null, 'EQ', 'input', '', '6', 'admin', '2022-07-25 22:38:36', null, '2022-07-25 22:43:57');
INSERT INTO `gen_table_column` VALUES ('15', '2', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', null, '1', '1', null, null, 'EQ', 'datetime', '', '7', 'admin', '2022-07-25 22:38:36', null, '2022-07-25 22:43:57');
INSERT INTO `gen_table_column` VALUES ('16', '3', 'user_id', '用户id', 'bigint(20)', 'Long', 'userId', '1', '0', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2022-07-26 11:33:50', null, '2022-07-26 11:35:18');
INSERT INTO `gen_table_column` VALUES ('17', '3', 'prize_id', '奖品ID', 'bigint(20)', 'Long', 'prizeId', '1', '0', null, '1', null, null, null, 'EQ', 'input', '', '2', 'admin', '2022-07-26 11:33:50', null, '2022-07-26 11:35:18');
INSERT INTO `gen_table_column` VALUES ('18', '4', 'id', '', 'bigint(20)', 'Long', 'id', '1', '0', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2022-07-27 14:57:09', null, '2022-07-27 15:17:13');
INSERT INTO `gen_table_column` VALUES ('19', '4', 'user_name', '抽奖用户', 'varchar(60)', 'String', 'userName', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '2', 'admin', '2022-07-27 14:57:09', null, '2022-07-27 15:17:13');
INSERT INTO `gen_table_column` VALUES ('20', '4', 'prize', '奖品金额', 'float(5,2)', 'Double', 'prize', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2022-07-27 14:57:09', null, '2022-07-27 15:17:13');
INSERT INTO `gen_table_column` VALUES ('21', '4', 'create_time', '抽奖时间', 'datetime', 'Date', 'createTime', '0', '0', null, '1', null, '1', null, 'EQ', 'datetime', '', '4', 'admin', '2022-07-27 14:57:09', null, '2022-07-27 15:17:13');
INSERT INTO `gen_table_column` VALUES ('22', '4', 'update_by', '发放奖品人员', 'varchar(64)', 'String', 'updateBy', '0', '0', null, '1', '1', '1', null, 'EQ', 'input', '', '5', 'admin', '2022-07-27 14:57:09', null, '2022-07-27 15:17:13');
INSERT INTO `gen_table_column` VALUES ('23', '4', 'update_time', '发奖时间', 'datetime', 'Date', 'updateTime', '0', '0', null, '1', '1', '1', null, 'EQ', 'datetime', '', '6', 'admin', '2022-07-27 14:57:09', null, '2022-07-27 15:17:13');
INSERT INTO `gen_table_column` VALUES ('24', '4', 'falg', '是否发放奖品', 'varchar(10)', 'String', 'falg', '0', '0', null, '1', '1', '1', '1', 'EQ', 'radio', 'sys_yes_no', '7', 'admin', '2022-07-27 14:57:09', null, '2022-07-27 15:17:13');
INSERT INTO `gen_table_column` VALUES ('25', '5', 'user_id', '用户id', 'bigint(20)', 'Long', 'userId', '1', '0', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2022-07-27 15:03:03', null, '2022-07-27 15:04:38');
INSERT INTO `gen_table_column` VALUES ('26', '5', 'log_id', '日志id', 'bigint(20)', 'Long', 'logId', '1', '0', null, '1', null, null, null, 'EQ', 'input', '', '2', 'admin', '2022-07-27 15:03:03', null, '2022-07-27 15:04:38');

-- ----------------------------
-- Table structure for ml_prize
-- ----------------------------
DROP TABLE IF EXISTS `ml_prize`;
CREATE TABLE `ml_prize` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `prize` double(10,2) DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL,
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ml_prize
-- ----------------------------
INSERT INTO `ml_prize` VALUES ('2', '323', '12.00', '0', '', '2022-07-25 16:08:35', '', '2022-07-25 21:09:38');
INSERT INTO `ml_prize` VALUES ('3', '12', '323.22', '0', '', '2022-07-25 16:08:58', '', '2022-07-25 17:25:31');
INSERT INTO `ml_prize` VALUES ('5', '3000', '30.30', '0', '', '2022-07-25 17:14:58', '', null);
INSERT INTO `ml_prize` VALUES ('6', '333232', '1233.00', '0', '', '2022-07-25 21:09:15', '', '2022-07-28 14:21:13');
INSERT INTO `ml_prize` VALUES ('7', 'sssas', '10.30', '0', '', '2022-07-25 21:19:44', '', null);
INSERT INTO `ml_prize` VALUES ('8', '奖品1.2', '1.20', '0', '', '2022-07-28 09:52:56', '', null);
INSERT INTO `ml_prize` VALUES ('9', '362', '1.00', '0', '', null, '', null);
INSERT INTO `ml_prize` VALUES ('10', '权威2', '2.00', '0', '', null, '', null);
INSERT INTO `ml_prize` VALUES ('11', '232s', '3.00', '0', '', null, '', null);
INSERT INTO `ml_prize` VALUES ('12', '权威3', '4.00', '0', '', null, '', null);
INSERT INTO `ml_prize` VALUES ('13', '权威4', '5.00', '0', '', null, '', null);
INSERT INTO `ml_prize` VALUES ('14', '权威5', '6.00', '0', '', null, '', null);
INSERT INTO `ml_prize` VALUES ('15', '奖品1', '11112233.00', '0', '', '2022-07-28 14:26:23', '', null);

-- ----------------------------
-- Table structure for ml_prize_log
-- ----------------------------
DROP TABLE IF EXISTS `ml_prize_log`;
CREATE TABLE `ml_prize_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(60) DEFAULT NULL,
  `prize` double(10,2) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `falg` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ml_prize_log
-- ----------------------------
INSERT INTO `ml_prize_log` VALUES ('4', 'zhangsan', '30.30', '2022-07-28 11:39:35', '', null, 'N');
INSERT INTO `ml_prize_log` VALUES ('5', 'lisi', '323.22', '2022-07-28 14:23:40', '', null, 'N');
INSERT INTO `ml_prize_log` VALUES ('6', 'zhangsan', '12.00', '2022-07-28 14:24:25', '', null, 'N');
INSERT INTO `ml_prize_log` VALUES ('7', 'lisi', '323.22', '2022-07-28 14:24:31', '', null, 'N');
INSERT INTO `ml_prize_log` VALUES ('8', 'zhangsan', '111122.00', '2022-07-28 14:36:29', '', null, 'N');
INSERT INTO `ml_prize_log` VALUES ('9', 'lisi', '1233.00', '2022-07-28 14:36:38', '', null, 'N');

-- ----------------------------
-- Table structure for ml_user
-- ----------------------------
DROP TABLE IF EXISTS `ml_user`;
CREATE TABLE `ml_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(60) DEFAULT NULL,
  `draw_num` int(10) DEFAULT NULL,
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ml_user
-- ----------------------------
INSERT INTO `ml_user` VALUES ('10', 'zhangsan', '1', 'admin', '2022-07-27 18:12:08', '', '2022-07-28 15:03:01');
INSERT INTO `ml_user` VALUES ('11', 'lisi', '0', 'admin', '2022-07-28 14:20:03', '', '2022-07-28 14:36:38');

-- ----------------------------
-- Table structure for ml_user_prize
-- ----------------------------
DROP TABLE IF EXISTS `ml_user_prize`;
CREATE TABLE `ml_user_prize` (
  `user_id` bigint(20) NOT NULL,
  `prize_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`prize_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ml_user_prize
-- ----------------------------
INSERT INTO `ml_user_prize` VALUES ('10', '15');

-- ----------------------------
-- Table structure for ml_user_prize_log
-- ----------------------------
DROP TABLE IF EXISTS `ml_user_prize_log`;
CREATE TABLE `ml_user_prize_log` (
  `user_id` bigint(20) NOT NULL,
  `log_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ml_user_prize_log
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Blob类型的触发器表';

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日历信息表';

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cron类型的触发器表';

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='已触发的触发器表';

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) NOT NULL COMMENT '任务组名',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务详细信息表';

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存储的悲观锁信息表';

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='暂停的触发器表';

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调度器状态表';

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='简单触发器的信息表';

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='同步机制的行锁表';

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='触发器详细信息表';

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-07-25 14:23:44', '', null, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-07-25 14:23:44', '', null, '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('3', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-07-25 14:23:44', '', null, '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES ('4', '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2022-07-25 14:23:44', '', null, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES ('5', '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2022-07-25 14:23:44', '', null, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO `sys_config` VALUES ('6', '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '0', 'Y', 'admin', '2022-07-25 14:23:44', '', null, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES ('7', '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2022-07-25 14:23:44', '', null, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES ('8', '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 'default', 'Y', 'admin', '2022-07-25 14:23:44', '', null, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO `sys_config` VALUES ('9', '主框架页-是否开启页脚', 'sys.index.footer', 'true', 'Y', 'admin', '2022-07-25 14:23:44', '', null, '是否开启底部页脚显示（true显示，false隐藏）');
INSERT INTO `sys_config` VALUES ('10', '主框架页-是否开启页签', 'sys.index.tagsView', 'true', 'Y', 'admin', '2022-07-25 14:23:44', '', null, '是否开启菜单多页签显示（true显示，false隐藏）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '马路科技', '0', '琳达', '15888888888', 'malu@163.com', '0', '0', 'admin', '2022-07-25 14:23:42', 'admin', '2022-07-25 14:35:56');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-07-25 14:23:44', '', null, '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-07-25 14:23:44', '', null, '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-07-25 14:23:44', '', null, '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-07-25 14:23:44', '', null, '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-07-25 14:23:44', '', null, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-07-25 14:23:44', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-07-25 14:23:44', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-07-25 14:23:44', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-07-25 14:23:44', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-07-25 14:23:44', '', null, '默认分组');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-07-25 14:23:44', '', null, '系统分组');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-07-25 14:23:44', '', null, '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-07-25 14:23:44', '', null, '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-07-25 14:23:44', '', null, '通知');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-07-25 14:23:44', '', null, '公告');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-07-25 14:23:44', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-07-25 14:23:44', '', null, '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('18', '99', '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-07-25 14:23:44', '', null, '其他操作');
INSERT INTO `sys_dict_data` VALUES ('19', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-07-25 14:23:44', '', null, '新增操作');
INSERT INTO `sys_dict_data` VALUES ('20', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-07-25 14:23:44', '', null, '修改操作');
INSERT INTO `sys_dict_data` VALUES ('21', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-07-25 14:23:44', '', null, '删除操作');
INSERT INTO `sys_dict_data` VALUES ('22', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-07-25 14:23:44', '', null, '授权操作');
INSERT INTO `sys_dict_data` VALUES ('23', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-07-25 14:23:44', '', null, '导出操作');
INSERT INTO `sys_dict_data` VALUES ('24', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-07-25 14:23:44', '', null, '导入操作');
INSERT INTO `sys_dict_data` VALUES ('25', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-07-25 14:23:44', '', null, '强退操作');
INSERT INTO `sys_dict_data` VALUES ('26', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-07-25 14:23:44', '', null, '生成操作');
INSERT INTO `sys_dict_data` VALUES ('27', '9', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-07-25 14:23:44', '', null, '清空操作');
INSERT INTO `sys_dict_data` VALUES ('28', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-07-25 14:23:44', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('29', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-07-25 14:23:44', '', null, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2022-07-25 14:23:44', '', null, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2022-07-25 14:23:44', '', null, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2022-07-25 14:23:44', '', null, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2022-07-25 14:23:44', '', null, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '任务分组', 'sys_job_group', '0', 'admin', '2022-07-25 14:23:44', '', null, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES ('6', '系统是否', 'sys_yes_no', '0', 'admin', '2022-07-25 14:23:44', 'admin', '2022-07-27 14:40:38', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知类型', 'sys_notice_type', '0', 'admin', '2022-07-25 14:23:44', '', null, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('8', '通知状态', 'sys_notice_status', '0', 'admin', '2022-07-25 14:23:44', '', null, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('9', '操作类型', 'sys_oper_type', '0', 'admin', '2022-07-25 14:23:44', '', null, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('10', '系统状态', 'sys_common_status', '0', 'admin', '2022-07-25 14:23:44', '', null, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-07-25 14:23:45', '', null, '');
INSERT INTO `sys_job` VALUES ('2', '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2022-07-25 14:23:45', '', null, '');
INSERT INTO `sys_job` VALUES ('3', '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2022-07-25 14:23:45', '', null, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-25 14:30:02');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-07-25 14:36:57');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-25 14:37:00');
INSERT INTO `sys_logininfor` VALUES ('103', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-25 15:53:04');
INSERT INTO `sys_logininfor` VALUES ('104', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-25 16:01:19');
INSERT INTO `sys_logininfor` VALUES ('105', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-25 16:05:14');
INSERT INTO `sys_logininfor` VALUES ('106', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-25 16:08:23');
INSERT INTO `sys_logininfor` VALUES ('107', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-25 17:04:57');
INSERT INTO `sys_logininfor` VALUES ('108', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-25 18:05:59');
INSERT INTO `sys_logininfor` VALUES ('109', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-25 18:08:01');
INSERT INTO `sys_logininfor` VALUES ('110', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-25 20:43:03');
INSERT INTO `sys_logininfor` VALUES ('111', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-25 20:45:57');
INSERT INTO `sys_logininfor` VALUES ('112', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-25 22:30:24');
INSERT INTO `sys_logininfor` VALUES ('113', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-25 22:45:19');
INSERT INTO `sys_logininfor` VALUES ('114', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-07-25 22:48:35');
INSERT INTO `sys_logininfor` VALUES ('115', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-25 22:48:36');
INSERT INTO `sys_logininfor` VALUES ('116', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-25 22:51:33');
INSERT INTO `sys_logininfor` VALUES ('117', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-26 11:33:40');
INSERT INTO `sys_logininfor` VALUES ('118', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-26 13:59:28');
INSERT INTO `sys_logininfor` VALUES ('119', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-26 14:29:00');
INSERT INTO `sys_logininfor` VALUES ('120', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-26 14:30:37');
INSERT INTO `sys_logininfor` VALUES ('121', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-26 14:41:51');
INSERT INTO `sys_logininfor` VALUES ('122', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-26 15:12:57');
INSERT INTO `sys_logininfor` VALUES ('123', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-26 15:34:11');
INSERT INTO `sys_logininfor` VALUES ('124', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-26 15:37:42');
INSERT INTO `sys_logininfor` VALUES ('125', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-26 16:01:33');
INSERT INTO `sys_logininfor` VALUES ('126', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-26 16:20:00');
INSERT INTO `sys_logininfor` VALUES ('127', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-27 11:02:02');
INSERT INTO `sys_logininfor` VALUES ('128', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-07-27 11:02:45');
INSERT INTO `sys_logininfor` VALUES ('129', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-27 11:03:27');
INSERT INTO `sys_logininfor` VALUES ('130', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-27 13:59:11');
INSERT INTO `sys_logininfor` VALUES ('131', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-27 14:40:16');
INSERT INTO `sys_logininfor` VALUES ('132', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-07-27 15:01:28');
INSERT INTO `sys_logininfor` VALUES ('133', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-27 15:01:29');
INSERT INTO `sys_logininfor` VALUES ('134', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-27 15:07:12');
INSERT INTO `sys_logininfor` VALUES ('135', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-27 15:09:02');
INSERT INTO `sys_logininfor` VALUES ('136', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-27 15:42:16');
INSERT INTO `sys_logininfor` VALUES ('137', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-27 16:02:48');
INSERT INTO `sys_logininfor` VALUES ('138', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-27 16:03:43');
INSERT INTO `sys_logininfor` VALUES ('139', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-27 16:37:36');
INSERT INTO `sys_logininfor` VALUES ('140', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-27 16:59:16');
INSERT INTO `sys_logininfor` VALUES ('141', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-27 17:07:23');
INSERT INTO `sys_logininfor` VALUES ('142', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-27 17:39:15');
INSERT INTO `sys_logininfor` VALUES ('143', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-27 17:40:35');
INSERT INTO `sys_logininfor` VALUES ('144', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-27 17:41:55');
INSERT INTO `sys_logininfor` VALUES ('145', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-27 17:42:59');
INSERT INTO `sys_logininfor` VALUES ('146', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-27 17:44:16');
INSERT INTO `sys_logininfor` VALUES ('147', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-27 17:46:40');
INSERT INTO `sys_logininfor` VALUES ('148', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-27 18:11:45');
INSERT INTO `sys_logininfor` VALUES ('149', 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2022-07-27 18:15:51');
INSERT INTO `sys_logininfor` VALUES ('150', 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2022-07-27 18:19:12');
INSERT INTO `sys_logininfor` VALUES ('151', 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2022-07-27 18:20:49');
INSERT INTO `sys_logininfor` VALUES ('152', 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2022-07-27 18:24:32');
INSERT INTO `sys_logininfor` VALUES ('153', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-27 18:26:39');
INSERT INTO `sys_logininfor` VALUES ('154', 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2022-07-27 18:29:29');
INSERT INTO `sys_logininfor` VALUES ('155', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-27 18:31:44');
INSERT INTO `sys_logininfor` VALUES ('156', 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2022-07-27 18:32:15');
INSERT INTO `sys_logininfor` VALUES ('157', 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2022-07-27 18:33:48');
INSERT INTO `sys_logininfor` VALUES ('158', 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2022-07-27 18:35:31');
INSERT INTO `sys_logininfor` VALUES ('159', 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2022-07-27 18:36:16');
INSERT INTO `sys_logininfor` VALUES ('160', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-28 09:50:09');
INSERT INTO `sys_logininfor` VALUES ('161', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-28 10:15:55');
INSERT INTO `sys_logininfor` VALUES ('162', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-28 11:03:18');
INSERT INTO `sys_logininfor` VALUES ('163', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-28 11:07:10');
INSERT INTO `sys_logininfor` VALUES ('164', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-28 11:36:05');
INSERT INTO `sys_logininfor` VALUES ('165', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-28 11:38:33');
INSERT INTO `sys_logininfor` VALUES ('166', 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2022-07-28 11:39:19');
INSERT INTO `sys_logininfor` VALUES ('167', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-28 13:45:18');
INSERT INTO `sys_logininfor` VALUES ('168', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-28 14:03:11');
INSERT INTO `sys_logininfor` VALUES ('169', 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2022-07-28 14:20:10');
INSERT INTO `sys_logininfor` VALUES ('170', 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2022-07-28 14:34:52');
INSERT INTO `sys_logininfor` VALUES ('171', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-28 14:36:57');
INSERT INTO `sys_logininfor` VALUES ('172', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-28 15:02:34');
INSERT INTO `sys_logininfor` VALUES ('173', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-07-28 15:04:34');
INSERT INTO `sys_logininfor` VALUES ('174', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-28 15:10:08');
INSERT INTO `sys_logininfor` VALUES ('175', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-28 17:56:31');
INSERT INTO `sys_logininfor` VALUES ('176', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-29 11:01:07');
INSERT INTO `sys_logininfor` VALUES ('177', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-07-29 11:48:29');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` char(1) DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2025 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', '#', '', 'M', '0', '1', '', 'fa fa-gear', 'admin', '2022-07-25 14:23:43', '', null, '系统管理目录');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', '/system/user', '', 'C', '0', '1', 'system:user:view', 'fa fa-user-o', 'admin', '2022-07-25 14:23:43', '', null, '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', '/system/role', '', 'C', '0', '1', 'system:role:view', 'fa fa-user-secret', 'admin', '2022-07-25 14:23:43', '', null, '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', '/system/menu', '', 'C', '0', '1', 'system:menu:view', 'fa fa-th-list', 'admin', '2022-07-25 14:23:43', '', null, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('1000', '用户查询', '100', '1', '#', '', 'F', '0', '1', 'system:user:list', '#', 'admin', '2022-07-25 14:23:43', '', null, '');
INSERT INTO `sys_menu` VALUES ('1001', '用户新增', '100', '2', '#', '', 'F', '0', '1', 'system:user:add', '#', 'admin', '2022-07-25 14:23:43', '', null, '');
INSERT INTO `sys_menu` VALUES ('1002', '用户修改', '100', '3', '#', '', 'F', '0', '1', 'system:user:edit', '#', 'admin', '2022-07-25 14:23:43', '', null, '');
INSERT INTO `sys_menu` VALUES ('1003', '用户删除', '100', '4', '#', '', 'F', '0', '1', 'system:user:remove', '#', 'admin', '2022-07-25 14:23:43', '', null, '');
INSERT INTO `sys_menu` VALUES ('1004', '用户导出', '100', '5', '#', '', 'F', '0', '1', 'system:user:export', '#', 'admin', '2022-07-25 14:23:43', '', null, '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导入', '100', '6', '#', '', 'F', '0', '1', 'system:user:import', '#', 'admin', '2022-07-25 14:23:43', '', null, '');
INSERT INTO `sys_menu` VALUES ('1006', '重置密码', '100', '7', '#', '', 'F', '0', '1', 'system:user:resetPwd', '#', 'admin', '2022-07-25 14:23:43', '', null, '');
INSERT INTO `sys_menu` VALUES ('1007', '角色查询', '101', '1', '#', '', 'F', '0', '1', 'system:role:list', '#', 'admin', '2022-07-25 14:23:43', '', null, '');
INSERT INTO `sys_menu` VALUES ('1008', '角色新增', '101', '2', '#', '', 'F', '0', '1', 'system:role:add', '#', 'admin', '2022-07-25 14:23:43', '', null, '');
INSERT INTO `sys_menu` VALUES ('1009', '角色修改', '101', '3', '#', '', 'F', '0', '1', 'system:role:edit', '#', 'admin', '2022-07-25 14:23:43', '', null, '');
INSERT INTO `sys_menu` VALUES ('1010', '角色删除', '101', '4', '#', '', 'F', '0', '1', 'system:role:remove', '#', 'admin', '2022-07-25 14:23:43', '', null, '');
INSERT INTO `sys_menu` VALUES ('1011', '角色导出', '101', '5', '#', '', 'F', '0', '1', 'system:role:export', '#', 'admin', '2022-07-25 14:23:43', '', null, '');
INSERT INTO `sys_menu` VALUES ('1012', '菜单查询', '102', '1', '#', '', 'F', '0', '1', 'system:menu:list', '#', 'admin', '2022-07-25 14:23:43', '', null, '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单新增', '102', '2', '#', '', 'F', '0', '1', 'system:menu:add', '#', 'admin', '2022-07-25 14:23:43', '', null, '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单修改', '102', '3', '#', '', 'F', '0', '1', 'system:menu:edit', '#', 'admin', '2022-07-25 14:23:43', '', null, '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单删除', '102', '4', '#', '', 'F', '0', '1', 'system:menu:remove', '#', 'admin', '2022-07-25 14:23:43', '', null, '');
INSERT INTO `sys_menu` VALUES ('2000', '奖品管理', '2006', '1', '/system/prize', 'menuItem', 'C', '0', '1', 'system:prize:view', '#', 'admin', '2022-07-25 15:57:23', 'admin', '2022-07-25 20:51:07', '奖品管理菜单');
INSERT INTO `sys_menu` VALUES ('2001', '奖品管理查询', '2000', '1', '#', '', 'F', '0', '1', 'system:prize:list', '#', 'admin', '2022-07-25 15:57:23', '', null, '');
INSERT INTO `sys_menu` VALUES ('2002', '奖品管理新增', '2000', '2', '#', '', 'F', '0', '1', 'system:prize:add', '#', 'admin', '2022-07-25 15:57:23', '', null, '');
INSERT INTO `sys_menu` VALUES ('2003', '奖品管理修改', '2000', '3', '#', '', 'F', '0', '1', 'system:prize:edit', '#', 'admin', '2022-07-25 15:57:23', '', null, '');
INSERT INTO `sys_menu` VALUES ('2004', '奖品管理删除', '2000', '4', '#', '', 'F', '0', '1', 'system:prize:remove', '#', 'admin', '2022-07-25 15:57:23', '', null, '');
INSERT INTO `sys_menu` VALUES ('2005', '奖品管理导出', '2000', '5', '#', '', 'F', '0', '1', 'system:prize:export', '#', 'admin', '2022-07-25 15:57:23', '', null, '');
INSERT INTO `sys_menu` VALUES ('2006', '奖品管理', '0', '2', '#', 'menuItem', 'M', '0', '1', '', 'fa fa-database', 'admin', '2022-07-25 20:50:45', 'admin', '2022-07-29 11:10:38', '');
INSERT INTO `sys_menu` VALUES ('2013', '抽奖用户管理', '2006', '1', '/system/mluser', '', 'C', '0', '1', 'system:mluser:view', '#', 'admin', '2022-07-25 22:46:19', '', null, '抽奖用户管理菜单');
INSERT INTO `sys_menu` VALUES ('2014', '抽奖用户管理查询', '2013', '1', '#', '', 'F', '0', '1', 'system:mluser:list', '#', 'admin', '2022-07-25 22:46:19', '', null, '');
INSERT INTO `sys_menu` VALUES ('2015', '抽奖用户管理新增', '2013', '2', '#', '', 'F', '0', '1', 'system:mluser:add', '#', 'admin', '2022-07-25 22:46:19', '', null, '');
INSERT INTO `sys_menu` VALUES ('2016', '抽奖用户管理修改', '2013', '3', '#', '', 'F', '0', '1', 'system:mluser:edit', '#', 'admin', '2022-07-25 22:46:19', '', null, '');
INSERT INTO `sys_menu` VALUES ('2017', '抽奖用户管理删除', '2013', '4', '#', '', 'F', '0', '1', 'system:mluser:remove', '#', 'admin', '2022-07-25 22:46:19', '', null, '');
INSERT INTO `sys_menu` VALUES ('2018', '抽奖用户管理导出', '2013', '5', '#', '', 'F', '0', '1', 'system:mluser:export', '#', 'admin', '2022-07-25 22:46:19', '', null, '');
INSERT INTO `sys_menu` VALUES ('2019', '奖品日志', '2006', '1', '/system/prizeLog', '', 'C', '0', '1', 'system:prizeLog:view', '#', 'admin', '2022-07-27 15:05:29', '', null, '奖品日志菜单');
INSERT INTO `sys_menu` VALUES ('2020', '奖品日志查询', '2019', '1', '#', '', 'F', '0', '1', 'system:prizeLog:list', '#', 'admin', '2022-07-27 15:05:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('2021', '奖品日志新增', '2019', '2', '#', '', 'F', '0', '1', 'system:prizeLog:add', '#', 'admin', '2022-07-27 15:05:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('2022', '奖品日志修改', '2019', '3', '#', '', 'F', '0', '1', 'system:prizeLog:edit', '#', 'admin', '2022-07-27 15:05:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('2023', '奖品日志删除', '2019', '4', '#', '', 'F', '0', '1', 'system:prizeLog:remove', '#', 'admin', '2022-07-27 15:05:29', '', null, '');
INSERT INTO `sys_menu` VALUES ('2024', '奖品日志导出', '2019', '5', '#', '', 'F', '0', '1', 'system:prizeLog:export', '#', 'admin', '2022-07-27 15:05:29', '', null, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) DEFAULT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2022-07-25 14:23:45', '', null, '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2022-07-25 14:23:45', '', null, '管理员');
INSERT INTO `sys_notice` VALUES ('10', '的', '1', '<p>手动阀手动阀</p>', '0', 'admin', '2022-07-25 21:13:14', '', null, null);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('100', '用户管理', '3', 'com.ruoyi.project.system.user.controller.UserController.remove()', 'POST', '1', 'admin', '研发部门', '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-25 14:34:18');
INSERT INTO `sys_oper_log` VALUES ('101', '部门管理', '2', 'com.ruoyi.project.system.dept.controller.DeptController.editSave()', 'POST', '1', 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"100\"],\"parentId\":[\"0\"],\"parentName\":[\"无\"],\"deptName\":[\"马路科技\"],\"orderNum\":[\"0\"],\"leader\":[\"琳达\"],\"phone\":[\"15888888888\"],\"email\":[\"malu@163.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-25 14:35:56');
INSERT INTO `sys_oper_log` VALUES ('102', '参数管理', '9', 'com.ruoyi.project.system.config.controller.ConfigController.refreshCache()', 'GET', '1', 'admin', null, '/system/config/refreshCache', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-25 14:38:00');
INSERT INTO `sys_oper_log` VALUES ('103', '代码生成', '6', 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"ml_prize\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-25 15:53:20');
INSERT INTO `sys_oper_log` VALUES ('104', '代码生成', '2', 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"ml_prize\"],\"tableComment\":[\"奖品管理\"],\"className\":[\"MlPrize\"],\"functionAuthor\":[\"pengz\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"name\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"prize\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"state\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"sys_normal_disable\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"创建者\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"createBy\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"创建时间\"],\"columns[5].javaType\":[\"Date\"],\"columns[5].javaField\":[\"createTime\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"datetime\"],\"columns[5].dictType\":[\"\"],\"c', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-25 15:54:31');
INSERT INTO `sys_oper_log` VALUES ('105', '代码生成', '8', 'com.ruoyi.project.tool.gen.controller.GenController.download()', 'GET', '1', 'admin', null, '/tool/gen/download/ml_prize', '127.0.0.1', '内网IP', '\"ml_prize\"', null, '0', null, '2022-07-25 15:54:34');
INSERT INTO `sys_oper_log` VALUES ('106', '奖品管理', '1', 'com.ruoyi.project.system.prize.controller.MlPrizeController.addSave()', 'POST', '1', 'admin', null, '/system/prize/add', '127.0.0.1', '内网IP', '{\"name\":[\"123\"],\"prize\":[\"123\"],\"state\":[\"123\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-25 16:01:35');
INSERT INTO `sys_oper_log` VALUES ('107', '代码生成', '2', 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"ml_prize\"],\"tableComment\":[\"奖品管理\"],\"className\":[\"MlPrize\"],\"functionAuthor\":[\"pengz\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"奖品名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"name\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"奖品金额\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"prize\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"状态\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"state\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"sys_normal_disable\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"创建者\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"createBy\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"创建时间\"],\"columns[5].javaType\":[\"Date\"],\"columns[5].javaField\":[\"createTime\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"datetime\"],\"columns[5].dictTyp', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-25 16:03:01');
INSERT INTO `sys_oper_log` VALUES ('108', '代码生成', '8', 'com.ruoyi.project.tool.gen.controller.GenController.download()', 'GET', '1', 'admin', null, '/tool/gen/download/ml_prize', '127.0.0.1', '内网IP', '\"ml_prize\"', null, '0', null, '2022-07-25 16:03:04');
INSERT INTO `sys_oper_log` VALUES ('109', '奖品管理', '1', 'com.ruoyi.project.system.prize.controller.MlPrizeController.addSave()', 'POST', '1', 'admin', null, '/system/prize/add', '127.0.0.1', '内网IP', '{\"name\":[\"323\"],\"prize\":[\"12.3\"],\"state\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-25 16:08:35');
INSERT INTO `sys_oper_log` VALUES ('110', '奖品管理', '1', 'com.ruoyi.project.system.prize.controller.MlPrizeController.addSave()', 'POST', '1', 'admin', null, '/system/prize/add', '127.0.0.1', '内网IP', '{\"name\":[\"12\"],\"prize\":[\"32.3\"],\"state\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-25 16:08:59');
INSERT INTO `sys_oper_log` VALUES ('111', '奖品管理', '3', 'com.ruoyi.project.system.prize.controller.MlPrizeController.remove()', 'POST', '1', 'admin', null, '/system/prize/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-25 16:09:02');
INSERT INTO `sys_oper_log` VALUES ('112', '奖品管理', '1', 'com.ruoyi.project.system.prize.controller.MlPrizeController.addSave()', 'POST', '1', 'admin', null, '/system/prize/add', '127.0.0.1', '内网IP', '{\"name\":[\"zhangsan\"],\"prize\":[\"23.3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-25 17:13:22');
INSERT INTO `sys_oper_log` VALUES ('113', '奖品管理', '1', 'com.ruoyi.project.system.prize.controller.MlPrizeController.addSave()', 'POST', '1', 'admin', null, '/system/prize/add', '127.0.0.1', '内网IP', '{\"name\":[\"3000\"],\"prize\":[\"30.2\"],\"state\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-25 17:14:58');
INSERT INTO `sys_oper_log` VALUES ('114', '奖品管理', '3', 'com.ruoyi.project.system.prize.controller.MlPrizeController.remove()', 'POST', '1', 'admin', null, '/system/prize/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-25 17:15:04');
INSERT INTO `sys_oper_log` VALUES ('115', '奖品管理', '2', 'com.ruoyi.project.system.prize.controller.MlPrizeController.editSave()', 'POST', '1', 'admin', null, '/system/prize/edit', '127.0.0.1', '内网IP', '{\"id\":[\"3\"],\"name\":[\"12\"],\"prize\":[\"323.22\"],\"state\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-25 17:25:31');
INSERT INTO `sys_oper_log` VALUES ('116', '用户管理', '1', 'com.ruoyi.project.system.user.controller.UserController.addSave()', 'POST', '1', 'admin', null, '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"userName\":[\"张三\"],\"email\":[\"\"],\"loginName\":[\"zhangsan\"],\"sex\":[\"0\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-25 18:11:18');
INSERT INTO `sys_oper_log` VALUES ('117', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/104', '127.0.0.1', '内网IP', '104', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":301}', '0', null, '2022-07-25 18:14:05');
INSERT INTO `sys_oper_log` VALUES ('118', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 'POST', '1', 'admin', null, '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"奖品管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-25 20:50:46');
INSERT INTO `sys_oper_log` VALUES ('119', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2000\"],\"parentId\":[\"2006\"],\"menuType\":[\"C\"],\"menuName\":[\"奖品管理\"],\"url\":[\"/system/prize\"],\"target\":[\"menuItem\"],\"perms\":[\"system:prize:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-25 20:51:07');
INSERT INTO `sys_oper_log` VALUES ('120', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/4', '127.0.0.1', '内网IP', '4', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', '0', null, '2022-07-25 20:52:59');
INSERT INTO `sys_oper_log` VALUES ('121', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 'POST', '1', 'admin', null, '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,111,112,113,3,114,115,1057,1058,1059,1060,1061,116\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-25 20:53:13');
INSERT INTO `sys_oper_log` VALUES ('122', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/4', '127.0.0.1', '内网IP', '4', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-25 20:53:17');
INSERT INTO `sys_oper_log` VALUES ('123', '奖品管理', '1', 'com.ruoyi.project.system.prize.controller.MlPrizeController.addSave()', 'POST', '1', 'admin', null, '/system/prize/add', '127.0.0.1', '内网IP', '{\"name\":[\"333232\"],\"prize\":[\"1231231231\"],\"state\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-25 21:09:15');
INSERT INTO `sys_oper_log` VALUES ('124', '奖品管理', '2', 'com.ruoyi.project.system.prize.controller.MlPrizeController.editSave()', 'POST', '1', 'admin', null, '/system/prize/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"name\":[\"323\"],\"prize\":[\"12.0\"],\"state\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-25 21:09:38');
INSERT INTO `sys_oper_log` VALUES ('125', '通知公告', '1', 'com.ruoyi.project.system.notice.controller.NoticeController.addSave()', 'POST', '1', 'admin', null, '/system/notice/add', '127.0.0.1', '内网IP', '{\"noticeTitle\":[\"的\"],\"noticeType\":[\"1\"],\"noticeContent\":[\"<p>手动阀手动阀</p>\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-25 21:13:14');
INSERT INTO `sys_oper_log` VALUES ('126', '奖品管理', '1', 'com.ruoyi.project.system.prize.controller.MlPrizeController.addSave()', 'POST', '1', 'admin', null, '/system/prize/add', '127.0.0.1', '内网IP', '{\"name\":[\"sssas\"],\"prize\":[\"10.3\"],\"state\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-25 21:19:44');
INSERT INTO `sys_oper_log` VALUES ('127', '用户管理', '2', 'com.ruoyi.project.system.user.controller.UserController.editSave()', 'POST', '1', 'admin', null, '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"userName\":[\"超级管理员\"],\"email\":[\"malu@163.com\"],\"loginName\":[\"admin\"],\"sex\":[\"1\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"\"]}', null, '1', '不允许操作超级管理员用户', '2022-07-25 21:27:26');
INSERT INTO `sys_oper_log` VALUES ('128', '代码生成', '6', 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"ml_user\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-25 22:38:36');
INSERT INTO `sys_oper_log` VALUES ('129', '代码生成', '2', 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"2\"],\"tableName\":[\"ml_user\"],\"tableComment\":[\"抽奖用户管理\"],\"className\":[\"MlUser\"],\"functionAuthor\":[\"malu\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"9\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"10\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"用户名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"userName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"11\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"抽奖次数\"],\"columns[2].javaType\":[\"Integer\"],\"columns[2].javaField\":[\"drawNum\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"12\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"创建者\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"createBy\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"13\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"创建时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"createTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"14\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"更新者\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"updateBy\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].isEdit\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"input\"],\"columns[5].dictType\":[\"\"],\"columns[6].columnId\":[\"15\"],\"columns[6].sort\"', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-25 22:40:43');
INSERT INTO `sys_oper_log` VALUES ('130', '代码生成', '8', 'com.ruoyi.project.tool.gen.controller.GenController.download()', 'GET', '1', 'admin', null, '/tool/gen/download/ml_user', '127.0.0.1', '内网IP', '\"ml_user\"', null, '0', null, '2022-07-25 22:42:47');
INSERT INTO `sys_oper_log` VALUES ('131', '代码生成', '2', 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"2\"],\"tableName\":[\"ml_user\"],\"tableComment\":[\"抽奖用户管理\"],\"className\":[\"MlUser\"],\"functionAuthor\":[\"malu\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"9\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"10\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"用户名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"userName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"11\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"抽奖次数\"],\"columns[2].javaType\":[\"Integer\"],\"columns[2].javaField\":[\"drawNum\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"12\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"创建者\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"createBy\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"13\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"创建时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"createTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"14\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"更新者\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"updateBy\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].isEdit\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"input\"],\"columns[5].dictType\":[\"\"],\"columns[6].columnId\":[\"15\"],\"columns[6].sort\"', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-25 22:43:57');
INSERT INTO `sys_oper_log` VALUES ('132', '代码生成', '8', 'com.ruoyi.project.tool.gen.controller.GenController.download()', 'GET', '1', 'admin', null, '/tool/gen/download/ml_user', '127.0.0.1', '内网IP', '\"ml_user\"', null, '0', null, '2022-07-25 22:43:59');
INSERT INTO `sys_oper_log` VALUES ('133', '抽奖用户管理', '1', 'com.ruoyi.project.system.mluser.controller.MlUserController.addSave()', 'POST', '1', 'admin', null, '/system/mluser/add', '127.0.0.1', '内网IP', '{\"userName\":[\"zhangsan\"],\"drawNum\":[\"21323\"]}', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [G:\\work_ml\\malu\\target\\classes\\mybatis\\system\\MlUserMapper.xml]\r\n### The error may involve com.ruoyi.project.system.mluser.mapper.MlUserMapper.insertMlUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ml_user          ( user_name,             draw_num,                          create_time )           values ( ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2022-07-25 22:51:52');
INSERT INTO `sys_oper_log` VALUES ('134', '抽奖用户管理', '1', 'com.ruoyi.project.system.mluser.controller.MlUserController.addSave()', 'POST', '1', 'admin', null, '/system/mluser/add', '127.0.0.1', '内网IP', '{\"userName\":[\"zhangsan\"],\"drawNum\":[\"2131\"]}', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [G:\\work_ml\\malu\\target\\classes\\mybatis\\system\\MlUserMapper.xml]\r\n### The error may involve com.ruoyi.project.system.mluser.mapper.MlUserMapper.insertMlUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ml_user          ( user_name,             draw_num,                          create_time )           values ( ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2022-07-25 22:52:00');
INSERT INTO `sys_oper_log` VALUES ('135', '抽奖用户管理', '1', 'com.ruoyi.project.system.mluser.controller.MlUserController.addSave()', 'POST', '1', 'admin', null, '/system/mluser/add', '127.0.0.1', '内网IP', '{\"userName\":[\"zhangsan\"],\"drawNum\":[\"2131\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-25 22:52:22');
INSERT INTO `sys_oper_log` VALUES ('136', '代码生成', '6', 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"ml_user_prize\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-26 11:33:50');
INSERT INTO `sys_oper_log` VALUES ('137', '代码生成', '2', 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"3\"],\"tableName\":[\"ml_user_prize\"],\"tableComment\":[\"抽奖用户与奖品之间的绑定\"],\"className\":[\"MlUserPrize\"],\"functionAuthor\":[\"malu\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"16\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"用户id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"userId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"17\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"奖品ID\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"prizeId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.project.system\"],\"moduleName\":[\"system\"],\"businessName\":[\"userPrize\"],\"functionName\":[\"抽奖用户与奖品之间的绑定\"],\"params[parentMenuId]\":[\"2006\"],\"params[parentMenuName]\":[\"奖品管理\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-26 11:35:18');
INSERT INTO `sys_oper_log` VALUES ('138', '代码生成', '8', 'com.ruoyi.project.tool.gen.controller.GenController.download()', 'GET', '1', 'admin', null, '/tool/gen/download/ml_user_prize', '127.0.0.1', '内网IP', '\"ml_user_prize\"', null, '0', null, '2022-07-26 11:35:23');
INSERT INTO `sys_oper_log` VALUES ('139', '代码生成', '8', 'com.ruoyi.project.tool.gen.controller.GenController.download()', 'GET', '1', 'admin', null, '/tool/gen/download/ml_user_prize', '127.0.0.1', '内网IP', '\"ml_user_prize\"', null, '0', null, '2022-07-26 15:07:04');
INSERT INTO `sys_oper_log` VALUES ('140', '抽奖用户管理', '1', 'com.ruoyi.project.system.mluser.controller.MlUserController.addSave()', 'POST', '1', 'admin', null, '/system/mluser/add', '127.0.0.1', '内网IP', '{\"userName\":[\"23232\"],\"drawNum\":[\"323\"],\"prizeIds\":[\"3,5\"]}', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'prize_id\' in \'field list\'\r\n### The error may exist in file [D:\\study\\malu\\target\\classes\\mybatis\\system\\MlUserPrizeMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user_role(user_id, prize_id) values                        (?,?)          ,              (?,?)\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'prize_id\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'prize_id\' in \'field list\'', '2022-07-26 15:21:46');
INSERT INTO `sys_oper_log` VALUES ('141', '抽奖用户管理', '1', 'com.ruoyi.project.system.mluser.controller.MlUserController.addSave()', 'POST', '1', 'admin', null, '/system/mluser/add', '127.0.0.1', '内网IP', '{\"userName\":[\"23232\"],\"drawNum\":[\"323\"],\"prizeIds\":[\"3,5\"]}', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'prize_id\' in \'field list\'\r\n### The error may exist in file [D:\\study\\malu\\target\\classes\\mybatis\\system\\MlUserPrizeMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user_role(user_id, prize_id) values                        (?,?)          ,              (?,?)\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'prize_id\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'prize_id\' in \'field list\'', '2022-07-26 15:32:04');
INSERT INTO `sys_oper_log` VALUES ('142', '抽奖用户管理', '1', 'com.ruoyi.project.system.mluser.controller.MlUserController.addSave()', 'POST', '1', 'admin', null, '/system/mluser/add', '127.0.0.1', '内网IP', '{\"userName\":[\"12\"],\"drawNum\":[\"22\"],\"prizeIds\":[\"3,5\"]}', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'prize_id\' in \'field list\'\r\n### The error may exist in file [D:\\study\\malu\\target\\classes\\mybatis\\system\\MlUserPrizeMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user_role(user_id, prize_id) values                        (?,?)          ,              (?,?)\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'prize_id\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'prize_id\' in \'field list\'', '2022-07-26 15:34:35');
INSERT INTO `sys_oper_log` VALUES ('143', '抽奖用户管理', '1', 'com.ruoyi.project.system.mluser.controller.MlUserController.addSave()', 'POST', '1', 'admin', null, '/system/mluser/add', '127.0.0.1', '内网IP', '{\"userName\":[\"123\"],\"drawNum\":[\"323\"],\"prizeIds\":[\"5,7\"]}', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'prize_id\' in \'field list\'\r\n### The error may exist in file [D:\\study\\malu\\target\\classes\\mybatis\\system\\MlUserPrizeMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user_role(user_id, prize_id) values                        (?,?)          ,              (?,?)\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'prize_id\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'prize_id\' in \'field list\'', '2022-07-26 15:37:52');
INSERT INTO `sys_oper_log` VALUES ('144', '抽奖用户管理', '1', 'com.ruoyi.project.system.mluser.controller.MlUserController.addSave()', 'POST', '1', 'admin', null, '/system/mluser/add', '127.0.0.1', '内网IP', '{\"userName\":[\"123\"],\"drawNum\":[\"123\"],\"prizeIds\":[\"5\"]}', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'prize_id\' in \'field list\'\r\n### The error may exist in file [D:\\study\\malu\\target\\classes\\mybatis\\system\\MlUserPrizeMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user_role(user_id, prize_id) values                        (?,?)\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'prize_id\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'prize_id\' in \'field list\'', '2022-07-26 16:01:42');
INSERT INTO `sys_oper_log` VALUES ('145', '抽奖用户管理', '1', 'com.ruoyi.project.system.mluser.controller.MlUserController.addSave()', 'POST', '1', 'admin', null, '/system/mluser/add', '127.0.0.1', '内网IP', '{\"userName\":[\"123\"],\"drawNum\":[\"123\"],\"prizeIds\":[\"5\"]}', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'prize_id\' in \'field list\'\r\n### The error may exist in file [D:\\study\\malu\\target\\classes\\mybatis\\system\\MlUserPrizeMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user_role(user_id, prize_id) values                        (?,?)\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'prize_id\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'prize_id\' in \'field list\'', '2022-07-26 16:11:00');
INSERT INTO `sys_oper_log` VALUES ('146', '抽奖用户管理', '1', 'com.ruoyi.project.system.mluser.controller.MlUserController.addSave()', 'POST', '1', 'admin', null, '/system/mluser/add', '127.0.0.1', '内网IP', '{\"userName\":[\"123\"],\"drawNum\":[\"123\"],\"prizeIds\":[\"5\"]}', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'prize_id\' in \'field list\'\r\n### The error may exist in file [D:\\study\\malu\\target\\classes\\mybatis\\system\\MlUserPrizeMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user_role(user_id, prize_id) values                        (?,?)\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'prize_id\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'prize_id\' in \'field list\'', '2022-07-26 16:12:10');
INSERT INTO `sys_oper_log` VALUES ('147', '抽奖用户管理', '1', 'com.ruoyi.project.system.mluser.controller.MlUserController.addSave()', 'POST', '1', 'admin', null, '/system/mluser/add', '127.0.0.1', '内网IP', '{\"userName\":[\"123\"],\"drawNum\":[\"1233\"],\"prizeIds\":[\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-26 16:20:14');
INSERT INTO `sys_oper_log` VALUES ('148', '抽奖用户管理', '2', 'com.ruoyi.project.system.mluser.controller.MlUserController.editSave()', 'POST', '1', 'admin', null, '/system/mluser/edit', '127.0.0.1', '内网IP', '{\"id\":[\"9\"],\"userName\":[\"123\"],\"drawNum\":[\"1233\"],\"prizeIds\":[\"3,6,7\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-27 11:02:13');
INSERT INTO `sys_oper_log` VALUES ('149', '抽奖用户管理', '2', 'com.ruoyi.project.system.mluser.controller.MlUserController.editSave()', 'POST', '1', 'admin', null, '/system/mluser/edit', '127.0.0.1', '内网IP', '{\"id\":[\"8\"],\"userName\":[\"123\"],\"drawNum\":[\"123\"],\"prizeIds\":[\"3,6\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-27 11:02:23');
INSERT INTO `sys_oper_log` VALUES ('150', '字典类型', '2', 'com.ruoyi.project.system.dict.controller.DictTypeController.editSave()', 'POST', '1', 'admin', null, '/system/dict/edit', '127.0.0.1', '内网IP', '{\"dictId\":[\"6\"],\"dictName\":[\"系统是否\"],\"dictType\":[\"sys_yes_no\"],\"status\":[\"0\"],\"remark\":[\"系统是否列表\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-27 14:40:38');
INSERT INTO `sys_oper_log` VALUES ('151', '代码生成', '6', 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"ml_prize_log\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-27 14:57:09');
INSERT INTO `sys_oper_log` VALUES ('152', '代码生成', '2', 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"4\"],\"tableName\":[\"ml_prize_log\"],\"tableComment\":[\"奖品日志\"],\"className\":[\"MlPrizeLog\"],\"functionAuthor\":[\"malu\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"18\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"19\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"抽奖用户\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"userName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"20\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"奖品金额\"],\"columns[2].javaType\":[\"Double\"],\"columns[2].javaField\":[\"prize\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"21\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"抽奖时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"createTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"22\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"发放奖品人员\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"updateBy\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"23\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"发奖时间\"],\"columns[5].javaType\":[\"Date\"],\"columns[5].javaField\":[\"updateTime\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].isEdit\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"datetime\"],\"columns[5].dictType\":[\"\"],\"columns', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-27 15:01:16');
INSERT INTO `sys_oper_log` VALUES ('153', '代码生成', '6', 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"ml_user_prize_log\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-27 15:03:03');
INSERT INTO `sys_oper_log` VALUES ('154', '代码生成', '2', 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"5\"],\"tableName\":[\"ml_user_prize_log\"],\"tableComment\":[\"用户与日志中间表\"],\"className\":[\"MlUserPrizeLog\"],\"functionAuthor\":[\"malu\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"25\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"用户id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"userId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"26\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"日志id\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"logId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.project.system\"],\"moduleName\":[\"system\"],\"businessName\":[\"userPrizeLog\"],\"functionName\":[\"日志与用户之间的关系\"],\"params[parentMenuId]\":[\"2006\"],\"params[parentMenuName]\":[\"奖品管理\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-27 15:04:38');
INSERT INTO `sys_oper_log` VALUES ('155', '代码生成', '8', 'com.ruoyi.project.tool.gen.controller.GenController.download()', 'GET', '1', 'admin', null, '/tool/gen/download/ml_prize_log', '127.0.0.1', '内网IP', '\"ml_prize_log\"', null, '0', null, '2022-07-27 15:04:45');
INSERT INTO `sys_oper_log` VALUES ('156', '代码生成', '2', 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"4\"],\"tableName\":[\"ml_prize_log\"],\"tableComment\":[\"奖品日志\"],\"className\":[\"MlPrizeLog\"],\"functionAuthor\":[\"malu\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"18\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"19\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"抽奖用户\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"userName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"20\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"奖品金额\"],\"columns[2].javaType\":[\"Double\"],\"columns[2].javaField\":[\"prize\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"21\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"抽奖时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"createTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"22\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"发放奖品人员\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"updateBy\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"23\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"发奖时间\"],\"columns[5].javaType\":[\"Date\"],\"columns[5].javaField\":[\"updateTime\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].isEdit\":[\"1\"],\"columns[5].isList\":[\"1\"],\"columns[5].queryType\"', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-27 15:11:02');
INSERT INTO `sys_oper_log` VALUES ('157', '代码生成', '8', 'com.ruoyi.project.tool.gen.controller.GenController.download()', 'GET', '1', 'admin', null, '/tool/gen/download/ml_prize_log', '127.0.0.1', '内网IP', '\"ml_prize_log\"', null, '0', null, '2022-07-27 15:11:07');
INSERT INTO `sys_oper_log` VALUES ('158', '奖品日志', '1', 'com.ruoyi.project.system.prizeLog.controller.MlPrizeLogController.addSave()', 'POST', '1', 'admin', null, '/system/prizeLog/add', '127.0.0.1', '内网IP', '{\"userName\":[\"12122\"],\"prize\":[\"12\"],\"falg\":[\"0\"]}', null, '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\study\\malu\\target\\classes\\mybatis\\system\\MlPrizeLogMapper.xml]\r\n### The error may involve com.ruoyi.project.system.prizeLog.mapper.MlPrizeLogMapper.insertMlPrizeLog-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ml_prize_log          ( user_name,             prize,             create_time,                                       falg )           values ( ?,             ?,             ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2022-07-27 15:12:31');
INSERT INTO `sys_oper_log` VALUES ('159', '奖品日志', '1', 'com.ruoyi.project.system.prizeLog.controller.MlPrizeLogController.addSave()', 'POST', '1', 'admin', null, '/system/prizeLog/add', '127.0.0.1', '内网IP', '{\"userName\":[\"32\"],\"prize\":[\"12\"],\"falg\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-27 15:13:31');
INSERT INTO `sys_oper_log` VALUES ('160', '代码生成', '2', 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"4\"],\"tableName\":[\"ml_prize_log\"],\"tableComment\":[\"奖品日志\"],\"className\":[\"MlPrizeLog\"],\"functionAuthor\":[\"malu\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"18\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"19\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"抽奖用户\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"userName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"20\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"奖品金额\"],\"columns[2].javaType\":[\"Double\"],\"columns[2].javaField\":[\"prize\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"21\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"抽奖时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"createTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"22\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"发放奖品人员\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"updateBy\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"23\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"发奖时间\"],\"columns[5].javaType\":[\"Date\"],\"columns[5].javaField\":[\"updateTime\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].isEdit\":[\"1\"],\"columns[5].isList\":[\"1\"],\"columns[5].queryType\"', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-27 15:13:54');
INSERT INTO `sys_oper_log` VALUES ('161', '代码生成', '2', 'com.ruoyi.project.tool.gen.controller.GenController.editSave()', 'POST', '1', 'admin', null, '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"4\"],\"tableName\":[\"ml_prize_log\"],\"tableComment\":[\"奖品日志\"],\"className\":[\"MlPrizeLog\"],\"functionAuthor\":[\"malu\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"18\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"19\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"抽奖用户\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"userName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"20\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"奖品金额\"],\"columns[2].javaType\":[\"Double\"],\"columns[2].javaField\":[\"prize\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"21\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"抽奖时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"createTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"22\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"发放奖品人员\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"updateBy\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"23\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"发奖时间\"],\"columns[5].javaType\":[\"Date\"],\"columns[5].javaField\":[\"updateTime\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].isEdit\":[\"1\"],\"columns[5].isList\":[\"1\"],\"columns[5].queryType\"', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-27 15:17:13');
INSERT INTO `sys_oper_log` VALUES ('162', '代码生成', '8', 'com.ruoyi.project.tool.gen.controller.GenController.download()', 'GET', '1', 'admin', null, '/tool/gen/download/ml_prize_log', '127.0.0.1', '内网IP', '\"ml_prize_log\"', null, '0', null, '2022-07-27 15:19:52');
INSERT INTO `sys_oper_log` VALUES ('163', '奖品日志', '2', 'com.ruoyi.project.system.prizeLog.controller.MlPrizeLogController.editSave()', 'POST', '1', 'admin', null, '/system/prizeLog/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"userName\":[\"32\"],\"prize\":[\"12.0\"],\"falg\":[\"Y\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-27 15:23:22');
INSERT INTO `sys_oper_log` VALUES ('164', '奖品日志', '2', 'com.ruoyi.project.system.prizeLog.controller.MlPrizeLogController.editSave()', 'POST', '1', 'admin', null, '/system/prizeLog/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"userName\":[\"32\"],\"prize\":[\"12.0\"],\"updateTime\":[\"2022-07-28 15:50:27\"],\"falg\":[\"Y\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-27 15:40:32');
INSERT INTO `sys_oper_log` VALUES ('165', '奖品日志', '2', 'com.ruoyi.project.system.prizeLog.controller.MlPrizeLogController.editSave()', 'POST', '1', 'admin', null, '/system/prizeLog/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"userName\":[\"32\"],\"prize\":[\"12.0\"],\"updateTime\":[\"2022-07-27 15:45:22\"],\"falg\":[\"Y\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-27 15:42:27');
INSERT INTO `sys_oper_log` VALUES ('166', '奖品日志', '2', 'com.ruoyi.project.system.prizeLog.controller.MlPrizeLogController.editSave()', 'POST', '1', 'admin', null, '/system/prizeLog/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"userName\":[\"32\"],\"prize\":[\"12.0\"],\"updateTime\":[\"2022-07-27 17:25:55\"],\"falg\":[\"Y\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-27 16:03:01');
INSERT INTO `sys_oper_log` VALUES ('167', '奖品日志', '2', 'com.ruoyi.project.system.prizeLog.controller.MlPrizeLogController.editSave()', 'POST', '1', 'admin', null, '/system/prizeLog/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"userName\":[\"32\"],\"prize\":[\"12.0\"],\"updateTime\":[\"2022-07-28 17:25:48\"],\"falg\":[\"Y\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-27 16:03:54');
INSERT INTO `sys_oper_log` VALUES ('168', '奖品日志', '2', 'com.ruoyi.project.system.prizeLog.controller.MlPrizeLogController.editSave()', 'POST', '1', 'admin', null, '/system/prizeLog/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"userName\":[\"32\"],\"prize\":[\"12.0\"],\"updateTime\":[\"2022-07-27 16:37:58\"],\"falg\":[\"Y\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-27 16:38:00');
INSERT INTO `sys_oper_log` VALUES ('169', '奖品日志', '2', 'com.ruoyi.project.system.prizeLog.controller.MlPrizeLogController.editSave()', 'POST', '1', 'admin', null, '/system/prizeLog/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"userName\":[\"32\"],\"prize\":[\"12.0\"],\"updateTime\":[\"2022-07-02 00:00:00\"],\"falg\":[\"Y\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-27 16:38:12');
INSERT INTO `sys_oper_log` VALUES ('170', '奖品日志', '2', 'com.ruoyi.project.system.prizeLog.controller.MlPrizeLogController.editSave()', 'POST', '1', 'admin', null, '/system/prizeLog/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"userName\":[\"32\"],\"prize\":[\"12.0\"],\"time\":[\"2022-07-27 16:59:30\"],\"falg\":[\"Y\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-27 16:59:32');
INSERT INTO `sys_oper_log` VALUES ('171', '奖品日志', '2', 'com.ruoyi.project.system.prizeLog.controller.MlPrizeLogController.editSave()', 'POST', '1', 'admin', null, '/system/prizeLog/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"userName\":[\"32\"],\"prize\":[\"12.0\"],\"time\":[\"2022-07-27 17:01:04\"],\"falg\":[\"Y\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-27 17:01:06');
INSERT INTO `sys_oper_log` VALUES ('172', '奖品日志', '2', 'com.ruoyi.project.system.prizeLog.controller.MlPrizeLogController.editSave()', 'POST', '1', 'admin', null, '/system/prizeLog/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"userName\":[\"32\"],\"prize\":[\"12.0\"],\"updateTime\":[\"2022-07-27 17:08:04\"],\"falg\":[\"Y\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-27 17:08:05');
INSERT INTO `sys_oper_log` VALUES ('173', '代码生成', '8', 'com.ruoyi.project.tool.gen.controller.GenController.download()', 'GET', '1', 'admin', null, '/tool/gen/download/ml_user_prize_log', '127.0.0.1', '内网IP', '\"ml_user_prize_log\"', null, '0', null, '2022-07-27 17:14:52');
INSERT INTO `sys_oper_log` VALUES ('174', '抽奖用户管理', '2', 'com.ruoyi.project.system.mluser.controller.MlUserController.editSave()', 'POST', '1', 'admin', null, '/system/mluser/edit', '127.0.0.1', '内网IP', '{\"id\":[\"3\"],\"userName\":[\"23232\"],\"drawNum\":[\"2\"],\"prizeIds\":[\"3,5,6\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-27 17:39:32');
INSERT INTO `sys_oper_log` VALUES ('175', '抽奖用户管理', '2', 'com.ruoyi.project.system.mluser.controller.MlUserController.editSave()', 'POST', '1', 'admin', null, '/system/mluser/edit', '127.0.0.1', '内网IP', '{\"id\":[\"5\"],\"userName\":[\"123\"],\"drawNum\":[\"2\"],\"prizeIds\":[\"3,5,6\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-27 17:40:49');
INSERT INTO `sys_oper_log` VALUES ('176', '抽奖用户管理', '2', 'com.ruoyi.project.system.mluser.controller.MlUserController.editSave()', 'POST', '1', 'admin', null, '/system/mluser/edit', '127.0.0.1', '内网IP', '{\"id\":[\"9\"],\"userName\":[\"123\"],\"drawNum\":[\"1233\"],\"prizeIds\":[\"2,3,6,7\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-27 17:41:25');
INSERT INTO `sys_oper_log` VALUES ('177', '抽奖用户管理', '2', 'com.ruoyi.project.system.mluser.controller.MlUserController.editSave()', 'POST', '1', 'admin', null, '/system/mluser/edit', '127.0.0.1', '内网IP', '{\"id\":[\"5\"],\"userName\":[\"123\"],\"drawNum\":[\"2\"],\"prizeIds\":[\"3,5,6,7\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-27 17:42:06');
INSERT INTO `sys_oper_log` VALUES ('178', '抽奖用户管理', '2', 'com.ruoyi.project.system.mluser.controller.MlUserController.editSave()', 'POST', '1', 'admin', null, '/system/mluser/edit', '127.0.0.1', '内网IP', '{\"id\":[\"9\"],\"userName\":[\"123\"],\"drawNum\":[\"1233\"],\"prizeIds\":[\"2,3,6\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-27 17:42:25');
INSERT INTO `sys_oper_log` VALUES ('179', '抽奖用户管理', '2', 'com.ruoyi.project.system.mluser.controller.MlUserController.editSave()', 'POST', '1', 'admin', null, '/system/mluser/edit', '127.0.0.1', '内网IP', '{\"id\":[\"9\"],\"userName\":[\"123\"],\"drawNum\":[\"2\"],\"prizeIds\":[\"2,3,6\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-27 17:43:07');
INSERT INTO `sys_oper_log` VALUES ('180', '抽奖用户管理', '2', 'com.ruoyi.project.system.mluser.controller.MlUserController.editSave()', 'POST', '1', 'admin', null, '/system/mluser/edit', '127.0.0.1', '内网IP', '{\"id\":[\"3\"],\"userName\":[\"23232\"],\"drawNum\":[\"2\"],\"prizeIds\":[\"3,5,6\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-27 17:44:22');
INSERT INTO `sys_oper_log` VALUES ('181', '抽奖用户管理', '1', 'com.ruoyi.project.system.mluser.controller.MlUserController.addSave()', 'POST', '1', 'admin', null, '/system/mluser/add', '127.0.0.1', '内网IP', '{\"userName\":[\"23\"],\"drawNum\":[\"2\"],\"prizeIds\":[\"2,5,6\"]}', '{\"msg\":\"抽奖次数与奖品数据不符\",\"code\":500}', '0', null, '2022-07-27 17:45:01');
INSERT INTO `sys_oper_log` VALUES ('182', '抽奖用户管理', '1', 'com.ruoyi.project.system.mluser.controller.MlUserController.addSave()', 'POST', '1', 'admin', null, '/system/mluser/add', '127.0.0.1', '内网IP', '{\"userName\":[\"23\"],\"drawNum\":[\"2\"],\"prizeIds\":[\"2,5,6\"]}', '{\"msg\":\"抽奖次数与奖品数据不符\",\"code\":500}', '0', null, '2022-07-27 17:45:12');
INSERT INTO `sys_oper_log` VALUES ('183', '抽奖用户管理', '1', 'com.ruoyi.project.system.mluser.controller.MlUserController.addSave()', 'POST', '1', 'admin', null, '/system/mluser/add', '127.0.0.1', '内网IP', '{\"userName\":[\"\"],\"drawNum\":[\"222222222\"],\"prizeIds\":[\"\"]}', '{\"msg\":\"抽奖次数与奖品数据不符\",\"code\":500}', '0', null, '2022-07-27 17:46:05');
INSERT INTO `sys_oper_log` VALUES ('184', '抽奖用户管理', '1', 'com.ruoyi.project.system.mluser.controller.MlUserController.addSave()', 'POST', '1', 'admin', null, '/system/mluser/add', '127.0.0.1', '内网IP', '{\"userName\":[\"\"],\"drawNum\":[\"3\"],\"prizeIds\":[\"2,3,5,6,7\"]}', '{\"msg\":\"抽奖次数与奖品数量不符\",\"code\":500}', '0', null, '2022-07-27 17:47:06');
INSERT INTO `sys_oper_log` VALUES ('185', '抽奖用户管理', '1', 'com.ruoyi.project.system.mluser.controller.MlUserController.addSave()', 'POST', '1', 'admin', null, '/system/mluser/add', '127.0.0.1', '内网IP', '{\"userName\":[\"zhangsan\"],\"drawNum\":[\"2\"],\"prizeIds\":[\"2,3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-27 18:12:08');
INSERT INTO `sys_oper_log` VALUES ('186', '抽奖用户管理', '2', 'com.ruoyi.project.system.mluser.controller.MlUserController.editSave()', 'POST', '1', 'admin', null, '/system/mluser/edit', '127.0.0.1', '内网IP', '{\"id\":[\"10\"],\"userName\":[\"zhangsan\"],\"drawNum\":[\"1\"],\"prizeIds\":[\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-27 18:31:54');
INSERT INTO `sys_oper_log` VALUES ('187', '抽奖用户管理', '2', 'com.ruoyi.project.system.mluser.controller.MlUserController.editSave()', 'POST', '1', 'admin', null, '/system/mluser/edit', '127.0.0.1', '内网IP', '{\"id\":[\"10\"],\"userName\":[\"zhangsan\"],\"drawNum\":[\"0\"],\"prizeIds\":[\"5,6\"]}', '{\"msg\":\"抽奖次数与奖品数量不符\",\"code\":500}', '0', null, '2022-07-28 09:50:24');
INSERT INTO `sys_oper_log` VALUES ('188', '抽奖用户管理', '2', 'com.ruoyi.project.system.mluser.controller.MlUserController.editSave()', 'POST', '1', 'admin', null, '/system/mluser/edit', '127.0.0.1', '内网IP', '{\"id\":[\"10\"],\"userName\":[\"zhangsan\"],\"drawNum\":[\"1\"],\"prizeIds\":[\"5,6\"]}', '{\"msg\":\"抽奖次数与奖品数量不符\",\"code\":500}', '0', null, '2022-07-28 09:50:30');
INSERT INTO `sys_oper_log` VALUES ('189', '抽奖用户管理', '2', 'com.ruoyi.project.system.mluser.controller.MlUserController.editSave()', 'POST', '1', 'admin', null, '/system/mluser/edit', '127.0.0.1', '内网IP', '{\"id\":[\"10\"],\"userName\":[\"zhangsan\"],\"drawNum\":[\"2\"],\"prizeIds\":[\"5,6\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-28 09:50:37');
INSERT INTO `sys_oper_log` VALUES ('190', '奖品管理', '1', 'com.ruoyi.project.system.prize.controller.MlPrizeController.addSave()', 'POST', '1', 'admin', null, '/system/prize/add', '127.0.0.1', '内网IP', '{\"name\":[\"奖品1.2\"],\"prize\":[\"1.2\"],\"state\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-28 09:52:56');
INSERT INTO `sys_oper_log` VALUES ('191', '抽奖用户管理', '1', 'com.ruoyi.project.system.mluser.controller.MlUserController.addSave()', 'POST', '1', 'admin', null, '/system/mluser/add', '127.0.0.1', '内网IP', '{\"userName\":[\"lisi\"],\"drawNum\":[\"2\"],\"prizeIds\":[\"3,6\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-28 14:20:03');
INSERT INTO `sys_oper_log` VALUES ('192', '奖品管理', '2', 'com.ruoyi.project.system.prize.controller.MlPrizeController.editSave()', 'POST', '1', 'admin', null, '/system/prize/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"name\":[\"333232\"],\"prize\":[\"1233\"],\"state\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-28 14:21:14');
INSERT INTO `sys_oper_log` VALUES ('193', '抽奖用户管理', '2', 'com.ruoyi.project.system.mluser.controller.MlUserController.editSave()', 'POST', '1', 'admin', null, '/system/mluser/edit', '127.0.0.1', '内网IP', '{\"id\":[\"11\"],\"userName\":[\"lisi\"],\"drawNum\":[\"1\"],\"prizeIds\":[\"3,6\"]}', '{\"msg\":\"抽奖次数与奖品数量不符\",\"code\":500}', '0', null, '2022-07-28 14:24:08');
INSERT INTO `sys_oper_log` VALUES ('194', '抽奖用户管理', '2', 'com.ruoyi.project.system.mluser.controller.MlUserController.editSave()', 'POST', '1', 'admin', null, '/system/mluser/edit', '127.0.0.1', '内网IP', '{\"id\":[\"11\"],\"userName\":[\"lisi\"],\"drawNum\":[\"1\"],\"prizeIds\":[\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-28 14:24:13');
INSERT INTO `sys_oper_log` VALUES ('195', '抽奖用户管理', '2', 'com.ruoyi.project.system.mluser.controller.MlUserController.editSave()', 'POST', '1', 'admin', null, '/system/mluser/edit', '127.0.0.1', '内网IP', '{\"id\":[\"10\"],\"userName\":[\"zhangsan\"],\"drawNum\":[\"1\"],\"prizeIds\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-28 14:24:19');
INSERT INTO `sys_oper_log` VALUES ('196', '抽奖用户管理', '2', 'com.ruoyi.project.system.mluser.controller.MlUserController.editSave()', 'POST', '1', 'admin', null, '/system/mluser/edit', '127.0.0.1', '内网IP', '{\"id\":[\"11\"],\"userName\":[\"lisi\"],\"drawNum\":[\"1\"],\"prizeIds\":[\"6\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-28 14:25:38');
INSERT INTO `sys_oper_log` VALUES ('197', '奖品管理', '1', 'com.ruoyi.project.system.prize.controller.MlPrizeController.addSave()', 'POST', '1', 'admin', null, '/system/prize/add', '127.0.0.1', '内网IP', '{\"name\":[\"奖品1\"],\"prize\":[\"2122\"],\"state\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-28 14:26:23');
INSERT INTO `sys_oper_log` VALUES ('198', '抽奖用户管理', '2', 'com.ruoyi.project.system.mluser.controller.MlUserController.editSave()', 'POST', '1', 'admin', null, '/system/mluser/edit', '127.0.0.1', '内网IP', '{\"id\":[\"10\"],\"userName\":[\"zhangsan\"],\"drawNum\":[\"1\"],\"prizeIds\":[\"15\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-28 14:26:38');
INSERT INTO `sys_oper_log` VALUES ('199', '抽奖用户管理', '2', 'com.ruoyi.project.system.mluser.controller.MlUserController.editSave()', 'POST', '1', 'admin', null, '/system/mluser/edit', '127.0.0.1', '内网IP', '{\"id\":[\"10\"],\"userName\":[\"zhangsan\"],\"drawNum\":[\"1\"],\"prizeIds\":[\"15\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-28 15:03:01');
INSERT INTO `sys_oper_log` VALUES ('200', '奖品管理', '3', 'com.ruoyi.project.system.prize.controller.MlPrizeController.remove()', 'POST', '1', 'admin', null, '/system/prize/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"15\"]}', '{\"msg\":\"存在已分配奖品，无法删除\",\"code\":500}', '0', null, '2022-07-28 15:03:20');
INSERT INTO `sys_oper_log` VALUES ('201', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 'POST', '1', 'admin', null, '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-29 11:01:33');
INSERT INTO `sys_oper_log` VALUES ('202', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 'GET', '1', 'admin', null, '/system/menu/remove/109', '127.0.0.1', '内网IP', '109', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":301}', '0', null, '2022-07-29 11:01:42');
INSERT INTO `sys_oper_log` VALUES ('203', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 'POST', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2006\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"奖品管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-database\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', '0', null, '2022-07-29 11:10:38');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2022-07-25 14:23:42', '', null, '');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '0', 'admin', '2022-07-25 14:23:42', '', null, '');
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '0', 'admin', '2022-07-25 14:23:42', '', null, '');
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', 'admin', '2022-07-25 14:23:42', '', null, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', 'admin', '1', '1', '0', '0', 'admin', '2022-07-25 14:23:43', '', null, '超级管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '2', '0', '0', 'admin', '2022-07-25 14:23:43', 'admin', '2022-07-29 11:01:33', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('2', '100');
INSERT INTO `sys_role_dept` VALUES ('2', '101');
INSERT INTO `sys_role_dept` VALUES ('2', '105');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '超级管理员', '00', 'malu@163.com', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2022-07-29 11:48:28', '2022-07-25 14:23:42', 'admin', '2022-07-25 14:23:42', '', '2022-07-29 11:48:28', '管理员');
INSERT INTO `sys_user` VALUES ('100', '18990170536', '张三', '00', '', '0', '', '45931d1dabd86c553b02b2f7c70d407a', '811a88', '0', '0', '', null, null, 'admin', '2022-07-25 18:11:18', '', null, null);

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线用户记录';

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('df349e8e-2c56-43c7-9e4d-dca16d4b1f62', 'admin', null, '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', 'on_line', '2022-07-29 11:48:26', '2022-07-29 11:48:29', '1800000');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
