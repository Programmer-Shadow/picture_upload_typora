/*
 Navicat Premium Data Transfer

 Source Server         : 2023年2月16日--84开发mysql
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : 172.29.67.84:3306
 Source Schema         : zxzs4

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 17/05/2023 09:39:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for call_base_statistical
-- ----------------------------
DROP TABLE IF EXISTS `call_base_statistical`;
CREATE TABLE `call_base_statistical`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `tenant_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id',
  `primary_uuid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主流水号',
  `sub_uuid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子流水号',
  `seat_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '坐席id',
  `check_score` double NULL DEFAULT NULL COMMENT '复核得分',
  `appeal_count` int(11) NULL DEFAULT NULL COMMENT '申诉次数',
  `appeal_time` datetime(0) NULL DEFAULT NULL COMMENT '申诉时间',
  `appeal_status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申诉状态',
  `appeal_handler` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前处理人',
  `appeal_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前处理人id',
  `customer_statistical_flag` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '客户之声统计标识 Y/N',
  `statistical_flag` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '统计分析标识 Y/N',
  `gmt_create` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modify` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for call_detail_statistical
-- ----------------------------
DROP TABLE IF EXISTS `call_detail_statistical`;
CREATE TABLE `call_detail_statistical`  (
  `id` bigint(20) NOT NULL COMMENT '主键id	',
  `seat_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '坐席id	',
  `seat_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '坐席信息	',
  `seat_group_id` bigint(20) NULL DEFAULT NULL COMMENT '坐席班组id	',
  `seat_group_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '坐席班组名称	',
  `call_year` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通话年份	',
  `call_quarter` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通话季度	',
  `call_month` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通话月份	',
  `call_week` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '周',
  `call_day` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '天',
  `call_hour` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小时',
  `call_total_duration` bigint(20) NULL DEFAULT NULL COMMENT '通话总时长	',
  `call_count` int(11) NULL DEFAULT NULL COMMENT '通话量	',
  `call_avg_duration` int(11) NULL DEFAULT NULL COMMENT '平均通话时长	',
  `violate_call_count` int(11) NULL DEFAULT NULL COMMENT '违规通话量	',
  `template_violate_count` int(11) NULL DEFAULT NULL COMMENT '实时违规通话量	',
  `flow_violate_count` int(11) NULL DEFAULT NULL COMMENT '流程违规通话量	',
  `violate_call_rate` float(6, 2) NULL DEFAULT NULL COMMENT '违规通话率	',
  `violate_count` int(11) NULL DEFAULT NULL COMMENT '违规次数	',
  `violate_template_count` int(11) NULL DEFAULT NULL COMMENT '模板违规次数	',
  `violate_flow_count` int(11) NULL DEFAULT NULL COMMENT '流程违规次数	',
  `template_count` int(11) NULL DEFAULT NULL COMMENT '模板数量	',
  `flow_count` int(11) NULL DEFAULT NULL COMMENT '流程数量	',
  `template_total_score` int(11) NULL DEFAULT NULL COMMENT '模板总分	',
  `flow_total_score` int(11) NULL DEFAULT NULL COMMENT '流程总分	',
  `template_avg_score` float(6, 2) NULL DEFAULT NULL COMMENT '模板平均分	',
  `flow_avg_score` float(6, 2) NULL DEFAULT NULL COMMENT '流程平均分	',
  `seat_sentences_num` bigint(20) NULL DEFAULT NULL COMMENT '坐席句子总数	',
  `seat_total_speed` int(11) NULL DEFAULT NULL COMMENT '坐席总语速	',
  `seat_avg_speed` double(32, 2) NULL DEFAULT NULL COMMENT '坐席平均语速	',
  `seat_total_volume` int(11) NULL DEFAULT NULL COMMENT '坐席总音量	',
  `seat_avg_volume` double(32, 2) NULL DEFAULT NULL COMMENT '坐席平均音量	',
  `grab_words_count` int(11) NULL DEFAULT NULL COMMENT '抢插话次数	',
  `risk_pop_screen_count` int(11) NULL DEFAULT NULL COMMENT '弹屏总量	',
  `mute_count` int(11) NULL DEFAULT NULL COMMENT '静音次数	',
  `gmt_create` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间	',
  `gmt_modify` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `template_pop_screen_count` int(11) NULL DEFAULT NULL COMMENT '质检弹屏次数',
  `flow_pop_screen_count` int(11) NULL DEFAULT NULL COMMENT '流程弹屏次数',
  `splicing_time` int(11) NULL DEFAULT NULL COMMENT '拼接时间（用于查询）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for call_summary_statistical
-- ----------------------------
DROP TABLE IF EXISTS `call_summary_statistical`;
CREATE TABLE `call_summary_statistical`  (
  `id` bigint(20) NOT NULL COMMENT '主键id	',
  `call_year` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通话年份	',
  `statistical_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '统计类型	',
  `statistical_type_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '统计类型id	',
  `statistical_type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '统计类型信息	',
  `statistical_time_demension` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '统计时间维度	',
  `demension_time` int(11) NULL DEFAULT NULL COMMENT '时间维度下的时间 \n日1-366 月1-12 季度1-4 周1-57',
  `call_total_duration` bigint(20) NULL DEFAULT NULL COMMENT '通话总时长	',
  `call_count` bigint(20) NULL DEFAULT NULL COMMENT '通话量	',
  `call_avg_duration` int(11) NULL DEFAULT NULL COMMENT '平均通话时长	',
  `violate_call_count` bigint(20) NULL DEFAULT NULL COMMENT '违规通话量	',
  `template_violate_count` bigint(20) NULL DEFAULT NULL COMMENT '实时违规通话量	',
  `flow_violate_count` bigint(20) NULL DEFAULT NULL COMMENT '流程违规通话量	',
  `violate_call_rate` float(6, 2) NULL DEFAULT NULL COMMENT '违规通话率	',
  `violate_count` bigint(20) NULL DEFAULT NULL COMMENT '违规次数	',
  `violate_template_count` bigint(20) NULL DEFAULT NULL COMMENT '模板违规次数	',
  `violate_flow_count` bigint(20) NULL DEFAULT NULL COMMENT '流程违规次数	',
  `template_count` bigint(20) NULL DEFAULT NULL COMMENT '模板数量	',
  `flow_count` bigint(20) NULL DEFAULT NULL COMMENT '流程数量	',
  `template_total_score` bigint(20) NULL DEFAULT NULL COMMENT '模板总分	',
  `flow_total_score` bigint(20) NULL DEFAULT NULL COMMENT '流程总分	',
  `template_avg_score` float(6, 2) NULL DEFAULT NULL COMMENT '模板平均分	',
  `flow_avg_score` float(6, 2) NULL DEFAULT NULL COMMENT '流程平均分	',
  `seat_sentences_num` bigint(20) NULL DEFAULT NULL COMMENT '坐席句子总数	',
  `seat_total_speed` bigint(20) NULL DEFAULT NULL COMMENT '坐席总语速	',
  `seat_avg_speed` double(12, 2) NULL DEFAULT NULL COMMENT '坐席平均语速	',
  `seat_total_volume` bigint(20) NULL DEFAULT NULL COMMENT '坐席总音量	',
  `seat_avg_volume` double(12, 2) NULL DEFAULT NULL COMMENT '坐席平均音量	',
  `grab_words_count` bigint(20) NULL DEFAULT NULL COMMENT '抢插话次数	',
  `risk_pop_screen_count` bigint(20) NULL DEFAULT NULL COMMENT '弹屏总量	',
  `mute_count` bigint(20) NULL DEFAULT NULL COMMENT '静音次数	',
  `gmt_create` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间	',
  `gmt_modify` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间	',
  `template_pop_screen_count` int(11) NULL DEFAULT NULL COMMENT '模板弹屏总次数',
  `flow_pop_screen_count` int(11) NULL DEFAULT NULL COMMENT '流程弹屏总次数',
  `splicing_time` int(11) NULL DEFAULT NULL COMMENT '拼接时间（用于查询）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for call_violate_detail_statistical
-- ----------------------------
DROP TABLE IF EXISTS `call_violate_detail_statistical`;
CREATE TABLE `call_violate_detail_statistical`  (
  `id` bigint(20) NOT NULL COMMENT '	主键id',
  `seat_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '坐席id',
  `seat_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '坐席信息',
  `seat_group_id` bigint(20) NULL DEFAULT NULL COMMENT '坐席班组id',
  `seat_group_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '坐席班组名称',
  `call_year` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '	通话年份',
  `call_quarter` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通话季度',
  `call_month` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通话月份',
  `call_week` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '周',
  `call_day` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '天',
  `call_hour` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小时',
  `template_violate_num` int(11) NULL DEFAULT NULL COMMENT '模板违规总数量',
  `template_violate_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '模板违规信息',
  `template_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '模板信息',
  `rule_violate_num` int(11) NULL DEFAULT NULL COMMENT '规则违规总量',
  `rule_violate_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '规则违规信息',
  `rule_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '规则信息',
  `flow_violate_num` int(11) NULL DEFAULT NULL COMMENT '流程违规总量',
  `flow_violate_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '	流程违规信息',
  `flow_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '	流程信息',
  `flow_node_vioalte_num` int(11) NULL DEFAULT NULL COMMENT '流程节点违规量',
  `flow_node_violate_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '	流程节点违规信息',
  `flow_node_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '流程节点信息',
  `gmt_create` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '	创建时间',
  `gmt_modify` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `splicing_time` int(11) NULL DEFAULT NULL COMMENT '拼接时间（用于查询）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for call_violate_summary_statistical
-- ----------------------------
DROP TABLE IF EXISTS `call_violate_summary_statistical`;
CREATE TABLE `call_violate_summary_statistical`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `summary_id` bigint(20) NULL DEFAULT NULL COMMENT '汇总分析表id',
  `call_year` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通话年份',
  `statistical_type_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '统计类型id',
  `statistical_type_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '统计类型信息',
  `statistical_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '统计类型',
  `statistical_time_dimension` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '统计时间维度',
  `dimension_time` int(11) NULL DEFAULT NULL COMMENT '时间维度对应的时间',
  `template_violate_num` int(11) NULL DEFAULT NULL COMMENT '模板违规总数量',
  `template_violate_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '模板违规信息',
  `template_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '模板信息',
  `rule_violate_num` int(11) NULL DEFAULT NULL COMMENT '	规则违规总量',
  `rule_violate_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '规则违规信息',
  `rule_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '规则信息',
  `flow_violate_num` int(11) NULL DEFAULT NULL COMMENT '流程违规总量',
  `flow_violate_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '流程违规信息',
  `flow_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '流程信息',
  `flow_node_vioalte_num` int(11) NULL DEFAULT NULL COMMENT '流程节点违规量',
  `flow_node_violate_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '流程节点违规信息',
  `flow_node_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '流程节点信息',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modify` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `splicing_time` int(11) NULL DEFAULT NULL COMMENT '拼接时间（用于查询）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for chat_history_call_reason
-- ----------------------------
DROP TABLE IF EXISTS `chat_history_call_reason`;
CREATE TABLE `chat_history_call_reason`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `primary_uuid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '流水号',
  `call_reason` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '来电原因',
  `hit_time` datetime(0) NOT NULL COMMENT '命中时间',
  `gmt_cteate` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modify` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `sub_uuid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子流水号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for chat_history_workorder
-- ----------------------------
DROP TABLE IF EXISTS `chat_history_workorder`;
CREATE TABLE `chat_history_workorder`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `primary_uuid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '流水号',
  `workorder_template_id` bigint(20) NOT NULL COMMENT '工单id',
  `workorder_tempalte` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工单名称',
  `workorder_info` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '命中工单信息',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modify` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `sub_uuid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子流水号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for da_biz_info
-- ----------------------------
DROP TABLE IF EXISTS `da_biz_info`;
CREATE TABLE `da_biz_info`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `biz_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '业务名称',
  `extension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '扩展字段',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `modifier` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modify` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '业务信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for da_biz_prod_rel
-- ----------------------------
DROP TABLE IF EXISTS `da_biz_prod_rel`;
CREATE TABLE `da_biz_prod_rel`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `biz_id` bigint(20) NOT NULL COMMENT '业务id',
  `product_id` bigint(20) NOT NULL COMMENT '产品id',
  `delete_flag` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '删除标识：默认N，Y是删除',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `modifier` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modify` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '产品信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for da_biz_prod_rule_rel
-- ----------------------------
DROP TABLE IF EXISTS `da_biz_prod_rule_rel`;
CREATE TABLE `da_biz_prod_rule_rel`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `rule_id` bigint(20) NOT NULL COMMENT '规则id',
  `biz_id` bigint(20) NOT NULL COMMENT '归属业务id',
  `product_id` bigint(20) NOT NULL COMMENT '归属产品id',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `modifier` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '修改人',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modify` datetime(0) NOT NULL COMMENT '修改时间	',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '业务产品规则关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for da_call_min_stat
-- ----------------------------
DROP TABLE IF EXISTS `da_call_min_stat`;
CREATE TABLE `da_call_min_stat`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `tenant_id` bigint(20) NOT NULL COMMENT '租户id',
  `call_year` int(6) NOT NULL COMMENT '通话年份',
  `call_month` int(6) NOT NULL COMMENT '通话月份',
  `call_week` int(6) NOT NULL COMMENT '通话周',
  `call_day` int(6) NOT NULL COMMENT '通话天',
  `call_hour` int(6) NOT NULL COMMENT '通话小时',
  `call_min` int(6) NOT NULL COMMENT '通话分钟',
  `group_dim` int(6) NOT NULL COMMENT '分组类型：坐席/班组/全量',
  `group_dim_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组id：坐席/班组 id，全量字符0',
  `rel_prod_id` bigint(20) NOT NULL COMMENT '关联产品id：保险/存款/全部',
  `call_tag_dim` int(6) NULL DEFAULT NULL COMMENT '通话标签维度：投诉/咨询/全部',
  `call_total_dur` int(11) NOT NULL COMMENT '通话总时长（标签维度）',
  `call_count` int(11) NOT NULL COMMENT '通话量（标签维度）',
  `call_avg_dur` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '通话平均时长（标签维度）',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modify` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通话分钟统计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for da_call_stat
-- ----------------------------
DROP TABLE IF EXISTS `da_call_stat`;
CREATE TABLE `da_call_stat`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `tenant_id` bigint(20) NOT NULL COMMENT '租户id',
  `call_year` int(6) NOT NULL COMMENT '通话年份',
  `group_dim` int(6) NOT NULL COMMENT '分组类型：坐席/班组/全量',
  `group_dim_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组id：坐席/班组 id，全量字符0',
  `date_dim` int(6) NULL DEFAULT NULL COMMENT '统计时间维度：天/周/月/年',
  `date_dim_value` int(6) NULL DEFAULT NULL COMMENT '统计时间维度值',
  `rel_prod_id` bigint(20) NOT NULL COMMENT '关联产品：保险/存款/全部',
  `call_tag_dim` int(6) NULL DEFAULT NULL COMMENT '通话标签维度：投诉/咨询/全部',
  `call_total_dur` int(11) NOT NULL COMMENT '通话总时长（标签）',
  `call_count` int(11) NOT NULL COMMENT '通话量（标签）',
  `call_avg_dur` int(11) NOT NULL COMMENT '通话平均时长（标签）',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modify` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通话汇总统计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for da_call_word_rel
-- ----------------------------
DROP TABLE IF EXISTS `da_call_word_rel`;
CREATE TABLE `da_call_word_rel`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `word_id` bigint(20) NOT NULL COMMENT '词id',
  `call_year` int(6) NOT NULL COMMENT '通话年份',
  `call_month` int(6) NOT NULL COMMENT '通话月份',
  `primary_uuid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主流水号',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modify` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通话词汇关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for da_product_info
-- ----------------------------
DROP TABLE IF EXISTS `da_product_info`;
CREATE TABLE `da_product_info`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品名称',
  `extension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '扩展字段',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `modifier` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modify` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '产品信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for da_rule_info
-- ----------------------------
DROP TABLE IF EXISTS `da_rule_info`;
CREATE TABLE `da_rule_info`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `rule_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则名称',
  `rule_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '规则内容：List<String>，多个词之前或关系',
  `rule_type` int(6) NOT NULL COMMENT '规则类型：黑名单/标签/投诉/告警',
  `match_type` int(6) NOT NULL COMMENT '关键词匹配模式：精准匹配/智能匹配',
  `warn_mode` int(6) NULL DEFAULT NULL COMMENT '首次/再次累计/时间范围内统计，告警规则才有该字段',
  `warn_count_threshold` int(6) NULL DEFAULT NULL COMMENT '告警次数阈值',
  `warn_time_threshold` int(6) NULL DEFAULT NULL COMMENT '告警时间阈值：1/6/12/24小时',
  `history_effective` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '历史生效：Y/N，默认N',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `modifier` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '修改人',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modify` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '规则信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for da_task_info
-- ----------------------------
DROP TABLE IF EXISTS `da_task_info`;
CREATE TABLE `da_task_info`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `task_type` int(6) NOT NULL COMMENT '任务类型：导出/配置',
  `task_status` int(6) NOT NULL COMMENT '任务状态：未开始/进行中/失败/成功',
  `rule_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则id（配置类任务，字段非空）',
  `file_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件路径（下载文件在MinIO上存储路径）',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modify` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for da_warn_stat
-- ----------------------------
DROP TABLE IF EXISTS `da_warn_stat`;
CREATE TABLE `da_warn_stat`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `tenant_id` bigint(20) NOT NULL COMMENT '租户id',
  `rule_id` bigint(20) NOT NULL COMMENT '规则id',
  `call_year` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '通话年份',
  `call_month` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '通话月',
  `call_week` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '通话周',
  `call_day` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '通话天',
  `call_hour` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '通话小时',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modify` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '告警统计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for da_word_info
-- ----------------------------
DROP TABLE IF EXISTS `da_word_info`;
CREATE TABLE `da_word_info`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `word` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通话词汇',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modify` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '基础词汇表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for da_word_min_stat
-- ----------------------------
DROP TABLE IF EXISTS `da_word_min_stat`;
CREATE TABLE `da_word_min_stat`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `tenant_id` bigint(20) NOT NULL COMMENT '租户id',
  `call_word` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '通话词汇',
  `call_word_count` int(11) NOT NULL COMMENT '通话词汇统计次数',
  `call_year` int(8) NOT NULL COMMENT '通话年份',
  `call_month` int(6) NOT NULL COMMENT '通话月份',
  `call_week` int(6) NOT NULL COMMENT '通话周',
  `call_day` int(6) NOT NULL COMMENT '通话天',
  `call_hour` int(6) NOT NULL COMMENT '通话小时',
  `call_min` int(6) NOT NULL COMMENT '通话分钟',
  `group_dim` int(6) NOT NULL COMMENT '分组类型：坐席/班组/全量',
  `group_dim_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组id：坐席/班组 id，全量字符0',
  `rel_prod_id` bigint(20) NOT NULL COMMENT '关联产品id：保险/存款/全部',
  `call_tag_dim` int(6) NULL DEFAULT NULL COMMENT '通话标签维度：投诉/咨询/全部',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modify` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '词汇分钟统计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for da_word_stat
-- ----------------------------
DROP TABLE IF EXISTS `da_word_stat`;
CREATE TABLE `da_word_stat`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `tenant_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id',
  `call_word` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通话词汇',
  `call_word_count` int(11) NULL DEFAULT NULL COMMENT '通话词汇统计次数',
  `call_year` int(6) NULL DEFAULT NULL COMMENT '通话年份',
  `call_month` int(6) NOT NULL COMMENT '通话月份',
  `call_week` int(6) NOT NULL COMMENT '通话周',
  `call_day` int(6) NOT NULL COMMENT '通话天',
  `call_hour` int(6) NOT NULL COMMENT '通话小时',
  `group_dim` int(6) NOT NULL COMMENT '分组类型：坐席/班组/全量',
  `group_dim_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组id：坐席/班组 id，全量字符0',
  `date_dim` int(6) NULL DEFAULT NULL COMMENT '统计时间维度：天/周/月/年',
  `date_dim_value` int(6) NULL DEFAULT NULL COMMENT '统计时间维度值',
  `rel_prod_id` bigint(20) NOT NULL COMMENT '关联产品id：保险/存款/全部',
  `call_tag_dim` int(6) NULL DEFAULT NULL COMMENT '通话标签维度：投诉/咨询/全部',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modify` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `call_word_index`(`call_word`) USING BTREE,
  INDEX `tenant_id_index`(`tenant_id`) USING BTREE,
  INDEX `date_dim_index`(`date_dim`) USING BTREE,
  INDEX `date_dim_value_index`(`date_dim_value`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '词汇汇总统计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for group_info
-- ----------------------------
DROP TABLE IF EXISTS `group_info`;
CREATE TABLE `group_info`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `group_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班组名称',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改日期',
  `status` int(11) NULL DEFAULT NULL COMMENT '0-已删除 1-未删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for group_member
-- ----------------------------
DROP TABLE IF EXISTS `group_member`;
CREATE TABLE `group_member`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `group_id` bigint(20) NULL DEFAULT NULL COMMENT '班组Id',
  `member_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户登录名',
  `group_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班组名称',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `role` int(20) NULL DEFAULT NULL COMMENT '角色 0-班组 1-坐席',
  `status` int(11) NULL DEFAULT NULL COMMENT '0-已删除 1-未删除',
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户Id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改日志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for knowledge_recommend
-- ----------------------------
DROP TABLE IF EXISTS `knowledge_recommend`;
CREATE TABLE `knowledge_recommend`  (
  `id` bigint(22) NOT NULL COMMENT '主键id',
  `seat_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '坐席id',
  `primary_uuid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主流水号',
  `sub_uuid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子流水号',
  `type` int(11) NOT NULL COMMENT '知识类型 0自动推送 1主动搜索',
  `dialog_order` int(11) NULL DEFAULT NULL COMMENT '自动推送的句子序号',
  `knowledge_id` bigint(22) NOT NULL COMMENT '知识推荐id',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `question_std` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `score` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `answer_contents` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `knowledge_type` int(11) NULL DEFAULT NULL COMMENT '知识推荐类型',
  `traditional_knowledge_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `evaluate_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评价内容',
  `evaluate_state` int(11) NOT NULL DEFAULT 0 COMMENT '推荐状态',
  `inaccurate_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '不准确类型',
  `evaluate_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评价时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for online_element_check_import_info
-- ----------------------------
DROP TABLE IF EXISTS `online_element_check_import_info`;
CREATE TABLE `online_element_check_import_info`  (
  `id` bigint(20) NOT NULL,
  `serial_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sentence_no` int(11) NULL DEFAULT NULL,
  `dialogue_role` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dialogue_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `element_mark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `job_id` bigint(20) NULL DEFAULT NULL,
  `check_result` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `detection_check_result` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `online_element_check_import_info_job_id`(`job_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for online_element_check_job
-- ----------------------------
DROP TABLE IF EXISTS `online_element_check_job`;
CREATE TABLE `online_element_check_job`  (
  `id` bigint(20) NOT NULL,
  `job_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `import_num` int(11) NULL DEFAULT NULL,
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `job_status` smallint(6) NULL DEFAULT NULL,
  `import_file_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `average_accuracy_rate` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `average_recall_rate` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `check_element` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `mark_element_count` int(11) NULL DEFAULT NULL,
  `detection_element_count` int(11) NULL DEFAULT NULL,
  `f1` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for online_element_check_result_info
-- ----------------------------
DROP TABLE IF EXISTS `online_element_check_result_info`;
CREATE TABLE `online_element_check_result_info`  (
  `id` bigint(20) NOT NULL,
  `element_name` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `check_result_type` smallint(6) NULL DEFAULT NULL,
  `job_id` bigint(20) NULL DEFAULT NULL,
  `serial_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sentence_no` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `element_type` smallint(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `online_element_check_result_info_job_id`(`job_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for online_element_check_result_statistics
-- ----------------------------
DROP TABLE IF EXISTS `online_element_check_result_statistics`;
CREATE TABLE `online_element_check_result_statistics`  (
  `id` bigint(20) NOT NULL,
  `element_name` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mark_count` int(11) NULL DEFAULT NULL,
  `detection_count` int(11) NULL DEFAULT NULL,
  `accuracy_rate` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `recall_rate` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `online_element_check_result_statistics_job_id`(`job_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for online_element_check_serial_info
-- ----------------------------
DROP TABLE IF EXISTS `online_element_check_serial_info`;
CREATE TABLE `online_element_check_serial_info`  (
  `id` bigint(20) NOT NULL,
  `serial_no` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mark_count` int(11) NULL DEFAULT NULL,
  `detection_count` int(11) NULL DEFAULT NULL,
  `correct_count` int(11) NULL DEFAULT NULL,
  `error_count` int(11) NULL DEFAULT NULL,
  `miss_count` int(11) NULL DEFAULT NULL,
  `recall_rate` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `accuracy_rate` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `online_element_check_serial_info_job_id`(`job_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for photo
-- ----------------------------
DROP TABLE IF EXISTS `photo`;
CREATE TABLE `photo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `images` varchar(100) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1003 CHARACTER SET = utf8 COLLATE = utf8_czech_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for preference_config
-- ----------------------------
DROP TABLE IF EXISTS `preference_config`;
CREATE TABLE `preference_config`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `seat_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '坐席id',
  `user_info_status` int(11) NULL DEFAULT NULL COMMENT '用户画像',
  `talk_map_status` int(11) NULL DEFAULT NULL COMMENT '话术地图',
  `knowledge_recommend_status` int(11) NULL DEFAULT NULL COMMENT '知识推荐',
  `ai_transcript_status` int(11) NULL DEFAULT NULL COMMENT 'ai转写',
  `work_order_status` int(11) NULL DEFAULT NULL COMMENT '智能工单',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for preference_config_ai_transcript
-- ----------------------------
DROP TABLE IF EXISTS `preference_config_ai_transcript`;
CREATE TABLE `preference_config_ai_transcript`  (
  `id` bigint(20) NOT NULL,
  `seat_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '唯一坐席id',
  `preference_config_id` bigint(20) NULL DEFAULT NULL COMMENT 'preference_config表中的id,外键',
  `ai_risk_quality_status` int(11) NULL DEFAULT NULL COMMENT '风控质检展示状态',
  `ai_flow_quality_status` int(11) NULL DEFAULT NULL COMMENT '流程质检展示状态',
  `ai_knowledge_recommend_status` int(11) NULL DEFAULT NULL COMMENT '知识推荐展示状态',
  `ai_user_info_status` int(11) NULL DEFAULT NULL COMMENT '用户画像展示状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `waijian`(`preference_config_id`) USING BTREE,
  CONSTRAINT `preference_config_ai_transcript_ibfk_1` FOREIGN KEY (`preference_config_id`) REFERENCES `preference_config` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for quality_flow
-- ----------------------------
DROP TABLE IF EXISTS `quality_flow`;
CREATE TABLE `quality_flow`  (
  `id` bigint(20) NOT NULL,
  `flow_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `flow_num` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `operator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `flow_status` smallint(6) NULL DEFAULT NULL,
  `flow_version` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `line_show` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `flow_des` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `last_operator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bootnode_flag` smallint(6) NULL DEFAULT NULL,
  `applied_range` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for quality_flow_node
-- ----------------------------
DROP TABLE IF EXISTS `quality_flow_node`;
CREATE TABLE `quality_flow_node`  (
  `id` bigint(20) NOT NULL,
  `flow_id` bigint(20) NULL DEFAULT NULL,
  `node_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `node_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `node_type` smallint(6) NULL DEFAULT NULL,
  `node_des` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `flag_num` int(11) NULL DEFAULT NULL,
  `node_show` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `flow_version` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `flag_coord` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `necessary_flag` smallint(6) NULL DEFAULT NULL COMMENT '是否必经（1是，0否）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for quality_flow_node_condition
-- ----------------------------
DROP TABLE IF EXISTS `quality_flow_node_condition`;
CREATE TABLE `quality_flow_node_condition`  (
  `id` bigint(20) NOT NULL,
  `flow_id` bigint(20) NULL DEFAULT NULL,
  `node_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subnode_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `condition_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rule_condition` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `interface_condition` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `element_condition` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `variable_condition` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `configuration_type` int(11) NULL DEFAULT NULL,
  `condition_type` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for quality_flow_node_detail
-- ----------------------------
DROP TABLE IF EXISTS `quality_flow_node_detail`;
CREATE TABLE `quality_flow_node_detail`  (
  `id` bigint(20) NOT NULL,
  `flow_id` bigint(20) NULL DEFAULT NULL,
  `node_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subnode_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subnode_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `postnode_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `prenode_ids` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rule_entry` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `template_entry` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `interface_entry` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ivr_label` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `relation` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `condition_element` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `trace_rule` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `satisfy_execute` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `dissatisfy_execute` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `subnode_show` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `post_rule` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `necessary_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `enter_relation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `trace_relation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for quality_template
-- ----------------------------
DROP TABLE IF EXISTS `quality_template`;
CREATE TABLE `quality_template`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `template_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板名称',
  `creator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `applied_range` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `used_rule_count` int(11) NULL DEFAULT NULL,
  `curseat_count` int(11) NULL DEFAULT NULL,
  `update_time` datetime(0) NOT NULL,
  `business_label` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` int(11) NULL DEFAULT NULL,
  `score_type` smallint(6) NULL DEFAULT NULL,
  `update_user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for quality_template_application_scope
-- ----------------------------
DROP TABLE IF EXISTS `quality_template_application_scope`;
CREATE TABLE `quality_template_application_scope`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `applicable_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0 质检模板 1流程质检 2话术地图',
  `associate_Id` bigint(20) NOT NULL COMMENT '关联主键id',
  `group_id` bigint(20) NULL DEFAULT NULL,
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `is_all_staff` int(4) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1657014966524522500 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for quality_template_rule_config
-- ----------------------------
DROP TABLE IF EXISTS `quality_template_rule_config`;
CREATE TABLE `quality_template_rule_config`  (
  `id` bigint(20) NOT NULL,
  `template_id` bigint(20) NULL DEFAULT NULL,
  `rule_type_id` bigint(20) NULL DEFAULT NULL,
  `rule_id` bigint(20) NULL DEFAULT NULL,
  `rule_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `score_type` smallint(6) NULL DEFAULT NULL,
  `score` int(11) NULL DEFAULT NULL,
  `risk_level` smallint(6) NULL DEFAULT NULL,
  `fatal_error` smallint(6) NULL DEFAULT NULL,
  `tip_msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tip_open` smallint(6) NULL DEFAULT NULL,
  `tip_role` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pop_screen_type_id` bigint(20) NULL DEFAULT NULL,
  `pop_screen_type_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pop_screen_tip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pop_screen_type_msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `quality_template_rule_config_rule_type_id`(`rule_type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for quality_template_rule_type_config
-- ----------------------------
DROP TABLE IF EXISTS `quality_template_rule_type_config`;
CREATE TABLE `quality_template_rule_type_config`  (
  `id` bigint(20) NOT NULL,
  `template_id` bigint(20) NULL DEFAULT NULL,
  `rule_type_id` bigint(20) NULL DEFAULT NULL,
  `rule_type_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `score_type` smallint(6) NULL DEFAULT NULL,
  `score` int(11) NULL DEFAULT NULL,
  `pop_screen_msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for receive_messages
-- ----------------------------
DROP TABLE IF EXISTS `receive_messages`;
CREATE TABLE `receive_messages`  (
  `id` bigint(20) NOT NULL,
  `recipient_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `recipient_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `send_message_id` bigint(20) NULL DEFAULT NULL,
  `read_status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for script_map_template
-- ----------------------------
DROP TABLE IF EXISTS `script_map_template`;
CREATE TABLE `script_map_template`  (
  `id` bigint(20) NOT NULL,
  `template_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板名称',
  `status` int(11) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `script_map_id` bigint(50) NULL DEFAULT NULL,
  `entry_mode` int(11) NULL DEFAULT NULL,
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_create` datetime(0) NULL DEFAULT NULL,
  `gmt_modify` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for seat_plugin
-- ----------------------------
DROP TABLE IF EXISTS `seat_plugin`;
CREATE TABLE `seat_plugin`  (
  `id` bigint(20) NOT NULL COMMENT '表id',
  `seat_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '坐席id',
  `user_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户画像',
  `talk_map` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '话术地图',
  `knowledge_recommend` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '知识推荐',
  `ai_transcript` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ai转写',
  `work_order` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '智能工单',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for send_message
-- ----------------------------
DROP TABLE IF EXISTS `send_message`;
CREATE TABLE `send_message`  (
  `id` bigint(20) NOT NULL,
  `message_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `sender_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sender_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `message_type` int(11) NULL DEFAULT NULL,
  `recipient_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_action_log
-- ----------------------------
DROP TABLE IF EXISTS `t_action_log`;
CREATE TABLE `t_action_log`  (
  `id` bigint(20) UNSIGNED NOT NULL COMMENT '主键id',
  `operator_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人id',
  `operator_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作人',
  `action_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作对象代码，与操作对象对应',
  `action_type` tinyint(4) NOT NULL COMMENT '操作类型(1:add, 2:update, 3:delete, 4-6批量)',
  `ip_addr` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作ip地址兼容ipv4与ipv6',
  `action_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '操作内容',
  `action_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_operator_id`(`operator_id`) USING BTREE,
  INDEX `idx_action_code`(`action_code`) USING BTREE,
  INDEX `idx_ip_addr`(`ip_addr`) USING BTREE,
  INDEX `idx_action_time`(`action_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_evaluate_log
-- ----------------------------
DROP TABLE IF EXISTS `t_evaluate_log`;
CREATE TABLE `t_evaluate_log`  (
  `id` bigint(20) NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `curSeat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `evaluateState` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `evaluateType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `knowledgeId` bigint(20) NULL DEFAULT NULL,
  `knowledgeName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `evaluateTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `t_inaccurate_recommend_reason_faqthumb_id`(`knowledgeId`) USING BTREE,
  INDEX `t_inaccurate_recommend_reason_inaccurate_type`(`evaluateState`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_event_tracking
-- ----------------------------
DROP TABLE IF EXISTS `t_event_tracking`;
CREATE TABLE `t_event_tracking`  (
  `id` bigint(20) NOT NULL,
  `event_date` date NOT NULL COMMENT '统计日期',
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `role_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色id',
  `menu_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单/插件代码',
  `dimension` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '统计维度',
  `count` int(11) NULL DEFAULT NULL COMMENT '统计次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_faqthumb_log
-- ----------------------------
DROP TABLE IF EXISTS `t_faqthumb_log`;
CREATE TABLE `t_faqthumb_log`  (
  `id` bigint(20) NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `knowledge_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `knowledgepoint_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `recommend` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uuid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_inaccurate_recommend_reason
-- ----------------------------
DROP TABLE IF EXISTS `t_inaccurate_recommend_reason`;
CREATE TABLE `t_inaccurate_recommend_reason`  (
  `id` bigint(20) NOT NULL,
  `create_person` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `inaccurate_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_edit_time` datetime(0) NULL DEFAULT NULL,
  `last_editor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `inaccurate_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `knowledge_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `faqthumb_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `t_inaccurate_recommend_reason_faqthumb_id`(`faqthumb_id`) USING BTREE,
  INDEX `t_inaccurate_recommend_reason_inaccurate_type`(`inaccurate_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_inaccurate_recommend_type
-- ----------------------------
DROP TABLE IF EXISTS `t_inaccurate_recommend_type`;
CREATE TABLE `t_inaccurate_recommend_type`  (
  `id` bigint(20) NOT NULL,
  `inaccurate_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_model_function
-- ----------------------------
DROP TABLE IF EXISTS `t_model_function`;
CREATE TABLE `t_model_function`  (
  `id` bigint(20) NOT NULL,
  `function_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `function_type` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_platform_workorder_element
-- ----------------------------
DROP TABLE IF EXISTS `t_platform_workorder_element`;
CREATE TABLE `t_platform_workorder_element`  (
  `id` bigint(20) NOT NULL,
  `color` smallint(6) NULL DEFAULT NULL,
  `color_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `curseat` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `element_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `third_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` smallint(6) NOT NULL,
  `type_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `flag` int(11) NULL DEFAULT 1,
  `is_delete` smallint(6) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_platform_workorder_element_template
-- ----------------------------
DROP TABLE IF EXISTS `t_platform_workorder_element_template`;
CREATE TABLE `t_platform_workorder_element_template`  (
  `id` bigint(20) NOT NULL,
  `element_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `template_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_delete` smallint(6) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_platform_workorder_template
-- ----------------------------
DROP TABLE IF EXISTS `t_platform_workorder_template`;
CREATE TABLE `t_platform_workorder_template`  (
  `id` bigint(20) NOT NULL,
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rule_id` bigint(20) NULL DEFAULT NULL,
  `template_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `template_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `third_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` smallint(6) NULL DEFAULT NULL,
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `conjunctions` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `flag` smallint(6) NOT NULL,
  `form_type` int(11) NULL DEFAULT NULL,
  `business_category` int(11) NULL DEFAULT NULL,
  `business_item` int(11) NULL DEFAULT NULL,
  `business_itemiv` int(11) NULL DEFAULT NULL,
  `business_itemv` int(11) NULL DEFAULT NULL,
  `is_delete` smallint(6) NULL DEFAULT 0 COMMENT '1已删除 0未删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_platform_workorder_type
-- ----------------------------
DROP TABLE IF EXISTS `t_platform_workorder_type`;
CREATE TABLE `t_platform_workorder_type`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_quality_function_copy1
-- ----------------------------
DROP TABLE IF EXISTS `t_quality_function_copy1`;
CREATE TABLE `t_quality_function_copy1`  (
  `id` bigint(20) NOT NULL,
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `function_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `function_type` int(11) NULL DEFAULT NULL,
  `module_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `module_type` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_repeat_call_color_config
-- ----------------------------
DROP TABLE IF EXISTS `t_repeat_call_color_config`;
CREATE TABLE `t_repeat_call_color_config`  (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '提示颜色',
  `insert_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `repeat_count` smallint(6) NULL DEFAULT NULL COMMENT '重复次数',
  `time_range` smallint(6) NOT NULL COMMENT '时间间隔 1-24小时 2 -48小时',
  `enable_status` smallint(6) NOT NULL COMMENT '是否重启 1 -启用 0-未启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_risk_pop_screen_type_config
-- ----------------------------
DROP TABLE IF EXISTS `t_risk_pop_screen_type_config`;
CREATE TABLE `t_risk_pop_screen_type_config`  (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `pop_screen_type_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '弹屏类型名称',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `pop_screen_scene_code` int(11) NULL DEFAULT NULL COMMENT '弹屏场景编码',
  `pop_screen_scene_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '弹屏场景名称',
  `pop_screen_interface_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '弹屏显示界面编码',
  `pop_screen_interface_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '弹屏显示界面名称',
  `close_way_code` int(11) NULL DEFAULT NULL COMMENT '关闭方式编码',
  `close_way_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关闭方式名称',
  `show_duration` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示时长（秒）',
  `pop_screen_position_code` int(11) NULL DEFAULT NULL COMMENT '弹屏位置编码',
  `pop_screen_position_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '弹屏位置名称',
  `pop_screen_tip_color` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '弹屏提示颜色',
  `last_edit_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后编辑时间',
  `last_editor` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后编辑人员',
  `pop_screen_msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reference_number` int(11) NULL DEFAULT 0 COMMENT '被引用次数',
  `is_delete` tinyint(4) NULL DEFAULT 0 COMMENT '是否被删除  1：被删除 0：未被删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_variable_manage
-- ----------------------------
DROP TABLE IF EXISTS `t_variable_manage`;
CREATE TABLE `t_variable_manage`  (
  `id` bigint(20) NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `default_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `variable_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `variable_rule` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `variable_source` int(11) NULL DEFAULT NULL,
  `variable_type` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for task_info
-- ----------------------------
DROP TABLE IF EXISTS `task_info`;
CREATE TABLE `task_info`  (
  `id` bigint(20) NOT NULL,
  `task_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务id',
  `task_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名',
  `task_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `task_params` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '条件查询的json参数',
  `call_num` int(11) NULL DEFAULT NULL,
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `module_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `module_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_storage_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `file_format` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件格式',
  `file_size` int(11) NULL DEFAULT NULL COMMENT '文件大小',
  `file_create_time` datetime(0) NULL DEFAULT NULL COMMENT '文件创建时间',
  `task_start_time` datetime(0) NULL DEFAULT NULL COMMENT '任务开始时间',
  `task_end_time` datetime(0) NULL DEFAULT NULL COMMENT '任务结束时间',
  `task_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_profile_po
-- ----------------------------
DROP TABLE IF EXISTS `user_profile_po`;
CREATE TABLE `user_profile_po`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `customer_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户号码',
  `hour_count_24` int(11) NULL DEFAULT NULL COMMENT '24小时内来电次数',
  `hour_count_48` int(11) NULL DEFAULT NULL COMMENT '48小时内来电次数',
  `customer_label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户标签',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `call_count` int(100) NULL DEFAULT NULL COMMENT '联络次数',
  `update_person` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1643075075796008961 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
