/*
 Navicat Premium Data Transfer

 Source Server         : openjianghu02_db
 Source Server Type    : MySQL
 Source Server Version : 50738
 Source Host           : localhost:43302
 Source Schema         : jianghujs_markdown

 Target Server Type    : MySQL
 Target Server Version : 50738
 File Encoding         : 65001

 Date: 22/02/2023 23:02:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for _cache
-- ----------------------------
DROP TABLE IF EXISTS `_cache`;
CREATE TABLE `_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '用户Id',
  `content` longtext COLLATE utf8mb4_bin COMMENT '缓存数据',
  `recordStatus` varchar(255) COLLATE utf8mb4_bin DEFAULT 'active',
  `operation` varchar(255) COLLATE utf8mb4_bin DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='缓存表';

-- ----------------------------
-- Records of _cache
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for _constant
-- ----------------------------
DROP TABLE IF EXISTS `_constant`;
CREATE TABLE `_constant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `constantKey` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `constantType` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '常量类型; object, array',
  `desc` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述',
  `constantValue` text COLLATE utf8mb4_bin COMMENT '常量内容; object, array',
  `operation` varchar(255) COLLATE utf8mb4_bin DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='常量表;';

-- ----------------------------
-- Records of _constant
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for _constant_ui
-- ----------------------------
DROP TABLE IF EXISTS `_constant_ui`;
CREATE TABLE `_constant_ui` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `constantKey` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `constantType` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '常量类型; object, array',
  `pageId` varchar(255) COLLATE utf8mb4_bin DEFAULT 'all' COMMENT '页面id',
  `desc` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述',
  `en` text COLLATE utf8mb4_bin COMMENT '常量内容; object, array',
  `zh` text COLLATE utf8mb4_bin COMMENT '常量内容; object, array',
  `operation` varchar(255) COLLATE utf8mb4_bin DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `pageId_constantKey_unique` (`constantKey`,`pageId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='常量表;';

-- ----------------------------
-- Records of _constant_ui
-- ----------------------------
BEGIN;
INSERT INTO `_constant_ui` (`id`, `constantKey`, `constantType`, `pageId`, `desc`, `en`, `zh`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (1, 'common', 'object', 'all', '公共', '{\n\"add\":\"add\",\n\"view\":\"view\",\n\"modify\":\"modify\",\n\"delete\":\"delete\",\n\"recycle\":\"recycle\",\n\"recover\":\"recover\",\n\"cancel\":\"cancel\",\n\"sure\":\"sure\",\n\"manage\":\"manage\",\n\"save\":\"save\",\n\"saveAndPreview\":\"saveAndPreview\",\n\"moveToRecycleBin\":\"move to recycle bin\",\n\"operate\":\"operate\",\n\"select\":\"select\"\n}', '{\n\"add\":\"新增\",\n\"view\":\"查看\",\n\"modify\":\"修改\",\n\"delete\":\"删除\",\n\"recycle\":\"回收站\",\n\"recover\":\"恢复\",\n\"cancel\":\"取消\",\n\"sure\":\"确定\",\n\"manage\":\"管理\",\n\"save\":\"保存\",\n\"saveAndPreview\":\"保存并预览\",\n\"moveToRecycleBin\":\"移到回收站\",\n\"operate\":\"操作\",\n\"select\":\"选择\",\n\"search\":\"搜索\",\n\"action\":\"操作\"\n}', 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_constant_ui` (`id`, `constantKey`, `constantType`, `pageId`, `desc`, `en`, `zh`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (2, 'article', 'object', 'all', '文章', '{\n\"articleID\":\"article ID\",\n\"articleTitle\":\"article title\",\n\"releaseTime\":\"release time\",\n\"publishStatus\":\"publish status\",\n\"audioURL\":\"audio URL\",\n\"videoURL\":\"video URL\",\n\"editor\":\"editor\",\n\"updateTime\":\"update time\",\n\"creator\":\"creator\",\n\"creationTime\":\"creation time\",\n\"recycleArticle\":\"recycle article\",\n\"recycleArticleConfirm\":\"Are you sure you want to move the article to the trash\",\n\"recycleArticleSuccess\":\"Recycle article successfully\",\n\"recoverArticle\":\"recover article\",\n\"recoverArticleConfirm\":\"Are you sure you want to recover the article\",\n\"recoverArticleSuccess\":\"Recover article successfully\"\n}', '{\n\"articleID\":\"文章ID\",\n\"articleTitle\":\"文章标题\",\n\"releaseTime\":\"发布时间\",\n\"publishStatus\":\"发布状态\",\n\"audioURL\":\"音频URL\",\n\"videoURL\":\"视频URL\",\n\"editor\":\"修改者\",\n\"updateTime\":\"修改时间\",\n\"creator\":\"创建者\",\n\"creationTime\":\"创建时间\",\n\"recycleArticle\":\"回收文章\",\n\"recycleArticleConfirm\":\"确定将文章移到回收站吗\",\n\"recycleArticleSuccess\":\"回收文章成功\",\n\"recoverArticle\":\"恢复文章\",\n\"recoverArticleConfirm\":\"确定将文章恢复吗\",\n\"recoverArticleSuccess\":\"恢复文章成功\"\n}', 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_constant_ui` (`id`, `constantKey`, `constantType`, `pageId`, `desc`, `en`, `zh`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (3, 'fileExplorer', 'object', 'all', '文件管理', '{\n    \"upload\":\"upload\",\n    \"createFolder\":\"create folder\",\n    \"material\":\"material\",\n    \"rename\":\"rename\",\n    \"cancel\":\"cancel\",\n    \"paste\":\"paste\",\n    \"create\":\"create\",\n    \"fileName\":\"file name\",\n    \"useFile\":\"use file\",\n    \"file\":\"file\",\n    \"fileRename\":\"file rename\",\n    \"fileRenameSuccess\":\"File renamed successfully\",\n    \"uploadProgress\":\"upload progress\",\n    \"uploadTo\":\"upload to\",\n    \"maxFileSize\":\"Max file size\",\n    \"maxFileCount\":\"Max file count\",\n    \"folder\":\"folder\",\n    \"uploadAll\":\"upload all\",\n    \"removeAll\":\"remove all\",\n    \"copyPath\":\"copy path\",\n		\"copySuccess\":\"copy success\",\n		\"cutSuccess\":\"cut success\"\n}', '{\n    \"upload\":\"上传\",\n    \"createFolder\":\"创建文件夹\",\n    \"material\":\"素材\",\n    \"rename\":\"重命名\",\n    \"cancel\":\"取消\",\n    \"paste\":\"粘贴\",\n    \"create\":\"创建\",\n    \"fileName\":\"文件名\",\n    \"useFile\":\"使用文件\",\n    \"file\":\"文件\",\n    \"fileRename\":\"文件重命名\",\n    \"fileRenameSuccess\":\"文件重命名成功\",\n    \"uploadProgress\":\"上传进度\",\n    \"uploadTo\":\"上传至\",\n    \"maxFileSize\":\"最大文件大小\",\n    \"maxFileCount\":\"最大文件数\",\n    \"folder\":\"文件夹\",\n    \"uploadAll\":\"全部上传\",\n    \"removeAll\":\"全部移除\",\n    \"copyPath\":\"复制路径\",\n		\"copySuccess\":\"复制成功\",\n		\"cutSuccess\":\"剪切成功\"\n}', 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
COMMIT;

-- ----------------------------
-- Table structure for _group
-- ----------------------------
DROP TABLE IF EXISTS `_group`;
CREATE TABLE `_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'groupId',
  `groupName` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '群组名',
  `groupDesc` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '群组描述',
  `groupAvatar` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '群logo',
  `groupExtend` varchar(1024) COLLATE utf8mb4_bin DEFAULT '{}' COMMENT '拓展字段; { groupNotice: ''xx'' }',
  `operation` varchar(255) COLLATE utf8mb4_bin DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `groupId_index` (`groupId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='群组表; 软删除未启用;';

-- ----------------------------
-- Records of _group
-- ----------------------------
BEGIN;
INSERT INTO `_group` (`id`, `groupId`, `groupName`, `groupDesc`, `groupAvatar`, `groupExtend`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (1, 'adminGroup', '管理组', '管理组', NULL, '{}', 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
COMMIT;

-- ----------------------------
-- Table structure for _page
-- ----------------------------
DROP TABLE IF EXISTS `_page`;
CREATE TABLE `_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pageId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'pageId',
  `pageName` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'page name',
  `pageFile` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `pageType` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '页面类型; showInMenu, dynamicInMenu',
  `sort` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `pageHook` text COLLATE utf8mb4_bin COMMENT '{\n  "beforeHook":[\n  {"field": "doc", "service": "doc", "serviceFunc": "getDoc"}\n  ]\n}',
  `operation` varchar(255) COLLATE utf8mb4_bin DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='页面表; 软删除未启用;';

-- ----------------------------
-- Records of _page
-- ----------------------------
BEGIN;
INSERT INTO `_page` (`id`, `pageId`, `pageName`, `pageFile`, `pageType`, `sort`, `pageHook`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (1, 'help', '帮助', 'helpV4', 'dynamicInMenu', '11', NULL, 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_page` (`id`, `pageId`, `pageName`, `pageFile`, `pageType`, `sort`, `pageHook`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (2, 'login', '登录', 'loginV4', '', '', NULL, 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_page` (`id`, `pageId`, `pageName`, `pageFile`, `pageType`, `sort`, `pageHook`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (3, 'articleList', '文章列表', NULL, 'showInMenu', '1', '{\n  \"beforeHook\":[\r\n    {\"field\": \"constantUiMap\", \"service\": \"constantUi\", \"serviceFunc\": \"getConstantUiMap\"}\n  ]\n}', 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_page` (`id`, `pageId`, `pageName`, `pageFile`, `pageType`, `sort`, `pageHook`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (4, 'articleEdit', '文章编辑', NULL, 'dynamicInMenu', '2', '{\n  \"beforeHook\":[\n    {\"field\": \"constantUiMap\", \"service\": \"constantUi\", \"serviceFunc\": \"getConstantUiMap\"},\n		{\"field\": \"userInfo\", \"service\": \"user\", \"serviceFunc\": \"userInfo\"}\n  ]\n}', 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_page` (`id`, `pageId`, `pageName`, `pageFile`, `pageType`, `sort`, `pageHook`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (5, 'article', '文章详情', 'articleViewer', 'seo', NULL, '{\n  \"beforeHook\":[\n		{\"field\": \"constantUiMap\", \"service\": \"constantUi\", \"serviceFunc\": \"getConstantUiMap\"}\n  ]\n}', 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_page` (`id`, `pageId`, `pageName`, `pageFile`, `pageType`, `sort`, `pageHook`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (6, 'materialList', '素材列表', NULL, 'showInMenu', '3', '{\n  \"beforeHook\":[\r\n    {\"field\": \"constantUiMap\", \"service\": \"constantUi\", \"serviceFunc\": \"getConstantUiMap\"},\n		{\"field\": \"userInfo\", \"service\": \"user\", \"serviceFunc\": \"userInfo\"}\n  ]\n}', 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
COMMIT;

-- ----------------------------
-- Table structure for _record_history
-- ----------------------------
DROP TABLE IF EXISTS `_record_history`;
CREATE TABLE `_record_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '表',
  `recordId` int(11) DEFAULT NULL COMMENT '数据在table中的主键id; recordContent.id',
  `recordContent` longtext COLLATE utf8mb4_bin COMMENT '数据JSON',
  `packageContent` longtext COLLATE utf8mb4_bin COMMENT '当时请求的 package JSON',
  `operation` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作; jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者userId; recordContent.operationByUserId',
  `operationByUser` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者用户名; recordContent.operationByUser',
  `operationAt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作时间; recordContent.operationAt; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_record_id` (`recordId`) USING BTREE,
  KEY `index_table_action` (`table`,`operation`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='数据历史表';

-- ----------------------------
-- Table structure for _resource
-- ----------------------------
DROP TABLE IF EXISTS `_resource`;
CREATE TABLE `_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accessControlTable` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '数据规则控制表',
  `resourceHook` text COLLATE utf8mb4_bin COMMENT '{ "before": [{"service": "xx", "serviceFunction": "xxx"}], "after": [] }',
  `pageId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'page id; E.g: index',
  `actionId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'action id; E.g: selectXXXByXXX',
  `desc` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述',
  `resourceType` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'resource 类型; E.g: auth service sql',
  `appDataSchema` text COLLATE utf8mb4_bin COMMENT 'appData 参数校验',
  `resourceData` text COLLATE utf8mb4_bin COMMENT 'resource 数据; { "service": "auth", "serviceFunction": "passwordLogin" } or  { "table": "${tableName}", "action": "select", "whereCondition": ".where(function() {this.whereNot( { recordStatus: \\"active\\" })})" }',
  `requestDemo` text COLLATE utf8mb4_bin COMMENT '请求Demo',
  `responseDemo` text COLLATE utf8mb4_bin COMMENT '响应Demo',
  `operation` varchar(255) COLLATE utf8mb4_bin DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=507 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='请求资源表; 软删除未启用; resourceId=`${appId}.${pageId}.${actionId}`';

-- ----------------------------
-- Records of _resource
-- ----------------------------
BEGIN;
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (1, NULL, NULL, 'allPage', 'getChunkInfo', '✅ 文件分片下载-获取分片信息', 'service', '{}', '{ \"service\": \"file\", \"serviceFunction\": \"getChunkInfo\" }', '', '', 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (2, NULL, NULL, 'allPage', 'uploadFileDone', '✅ 文件分片上传-所有分片上传完毕', 'service', '{}', '{ \"service\": \"file\", \"serviceFunction\": \"uploadFileDone\" }', '', '', 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (3, NULL, NULL, 'allPage', 'httpUploadByStream', '✅ 文件分片上传-http文件流', 'service', '{}', '{ \"service\": \"file\", \"serviceFunction\": \"uploadFileChunkByStream\" }', '', '', 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (4, NULL, NULL, 'allPage', 'httpUploadByBase64', '✅ 文件分片上传-http base64', 'service', '{}', '{ \"service\": \"file\", \"serviceFunction\": \"uploadFileChunkByBase64\" }', '', '', 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (5, NULL, NULL, 'allPage', 'httpDownloadByBase64', '✅ 文件分片下载-http base64', 'service', '{}', '{ \"service\": \"file\", \"serviceFunction\": \"downloadFileChunkByBase64\" }', '', '', 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (6, NULL, NULL, 'login', 'passwordLogin', '✅登录', 'service', '{}', '{ \"service\": \"user\", \"serviceFunction\": \"passwordLogin\" }', '', '', 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (7, NULL, NULL, 'allPage', 'logout', '✅登出', 'service', '{}', '{ \"service\": \"user\", \"serviceFunction\": \"logout\" }', '', '', 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (8, NULL, NULL, 'allPage', 'userInfo', '✅获取用户信息', 'service', '{}', '{ \"service\": \"user\", \"serviceFunction\": \"userInfo\" }', '', '', 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (9, NULL, NULL, 'allPage', 'getConstantList', '✅查询常量', 'sql', '{}', '{ \"table\": \"_constant\", \"operation\": \"select\" }', '', '', 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (10, NULL, NULL, 'articleList', 'selectItemList', '✅文章列表-查询列表', 'sql', '{}', '{ \"table\": \"view01_article\", \"operation\": \"select\" }', '', '', 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (11, NULL, NULL, 'articleList', 'deletedArticle', '✅文章列表-将文章移至回收站', 'service', '{}', '{ \"service\": \"article\", \"serviceFunction\": \"deletedArticle\" }', '', '', 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (12, NULL, NULL, 'articleList', 'restoreArticle', '✅文章列表-文章恢复', 'service', '{}', '{ \"service\": \"article\", \"serviceFunction\": \"restoreArticle\" }', '', '', 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (13, NULL, NULL, 'articleEdit', 'selectArticleInfo', '✅文章编辑-查询文章详情', 'service', '{}', '{ \"service\": \"article\", \"serviceFunction\": \"getArticleAndFillArticles\" }', '', '', 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (14, NULL, NULL, 'articleEdit', 'useMaterial', '✅文章编辑-使用素材', 'service', '{}', '{ \"service\": \"article\", \"serviceFunction\": \"useMaterial\" }', '', '', 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (15, NULL, '{ \"before\": [\n{\"service\": \"article\", \"serviceFunction\": \"fillInsertItemParamsBeforeHook\"}\n], \"after\": [\n{\"service\": \"article\", \"serviceFunction\": \"articleHistoryRecordAfterHook\"}\n] }', 'articleEdit', 'jhInsertItem', '✅文章编辑-新增文章', 'sql', '{}', '{ \"table\": \"article\", \"operation\": \"jhInsert\" }', '', '', 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (16, NULL, NULL, 'articleEdit', 'selectItemList', '✅文章编辑-查询文章', 'sql', '{}', '{ \"table\": \"article\", \"operation\": \"select\" }', '', '', 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (17, NULL, '{ \"before\": [\n{\"service\": \"article\", \"serviceFunction\": \"fillUpdateItemParamsBeforeHook\"}\n], \"after\": [\n{\"service\": \"article\", \"serviceFunction\": \"articleHistoryRecordAfterHook\"}\n] }', 'articleEdit', 'jhUpdateItem', '✅文章编辑-更新文章', 'sql', '{}', '{ \"table\": \"article\", \"operation\": \"jhUpdate\" }', '', '', 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (18, NULL, '', 'articleEdit', 'deletedArticle', '✅文章编辑-将文章移至回收站', 'service', '{}', '{ \"service\": \"article\", \"serviceFunction\": \"deletedArticle\" }', '', '', 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (19, NULL, NULL, 'articleEdit', 'restoreArticle', '✅文章编辑-文章恢复', 'service', '{}', '{ \"service\": \"article\", \"serviceFunction\": \"restoreArticle\" }', '', '', 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (20, NULL, NULL, 'article', 'selectItemList', '✅文章预览-文章列表', 'service', NULL, '{ \"service\": \"article\", \"serviceFunction\": \"getArticleListFromArticleQuery\" }', '', '', 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (21, NULL, NULL, 'article', 'selectArticleInfo', '✅文章预览-文章详情', 'service', NULL, '{ \"service\": \"article\", \"serviceFunction\": \"getArticleAndFillArticles\" }', '', '', 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (22, NULL, NULL, 'cloud_drive', 'getUserCloudDriveList', '✅云盘-获取用户云盘', 'service', '{}', '{ \"service\": \"cloudDrive\", \"serviceFunction\": \"getUserCloudDriveList\" }', NULL, NULL, 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (23, NULL, NULL, 'cloud_drive', 'saveMarkdown', '✅云盘-保存markdown文件', 'service', '{}', '{ \"service\": \"cloudDrive\", \"serviceFunction\": \"saveMarkdown\" }', NULL, NULL, 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (24, NULL, NULL, 'cloud_drive', 'moveFile', '✅云盘-移动文件', 'service', '{}', '{ \"service\": \"cloudDrive\", \"serviceFunction\": \"moveFile\" }', NULL, NULL, 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (25, NULL, NULL, 'cloud_drive', 'copyFile', '✅云盘-复制文件', 'service', '{}', '{ \"service\": \"cloudDrive\", \"serviceFunction\": \"copyFile\" }', NULL, NULL, 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (26, NULL, NULL, 'cloud_drive', 'getDirItemList', '✅云盘-文件列表', 'service', '{}', '{ \"service\": \"cloudDrive\", \"serviceFunction\": \"getDirItemList\" }', NULL, NULL, 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (27, NULL, NULL, 'cloud_drive', 'deleteDirOrFile', '✅云盘-删除文件', 'service', '{}', '{ \"service\": \"cloudDrive\", \"serviceFunction\": \"deleteDirOrFile\" }', NULL, NULL, 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (28, NULL, NULL, 'cloud_drive', 'getMarkdownContent', '✅云盘-获取markdown内容', 'service', '{}', '{ \"service\": \"cloudDrive\", \"serviceFunction\": \"getMarkdownContent\" }', NULL, NULL, 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (29, NULL, NULL, 'cloud_drive', 'renameFile', '✅云盘- 重命名文件', 'service', '{}', '{ \"service\": \"cloudDrive\", \"serviceFunction\": \"renameFile\" }', NULL, NULL, 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (30, NULL, NULL, 'cloud_drive', 'mkdir', '✅云盘-创建文件目录', 'service', '{}', '{ \"service\": \"cloudDrive\", \"serviceFunction\": \"mkdir\" }', NULL, NULL, 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_resource` (`id`, `accessControlTable`, `resourceHook`, `pageId`, `actionId`, `desc`, `resourceType`, `appDataSchema`, `resourceData`, `requestDemo`, `responseDemo`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (31, NULL, NULL, 'cloud_drive', 'clearRecycle', '✅云盘-清空回收站', 'service', '{}', '{ \"service\": \"cloudDrive\", \"serviceFunction\": \"clearRecycle\" }', NULL, NULL, 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
COMMIT;

-- ----------------------------
-- Table structure for _role
-- ----------------------------
DROP TABLE IF EXISTS `_role`;
CREATE TABLE `_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'roleId',
  `roleName` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'role name',
  `roleDesc` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'role desc',
  `operation` varchar(255) COLLATE utf8mb4_bin DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='角色表; 软删除未启用;';

-- ----------------------------
-- Records of _role
-- ----------------------------
BEGIN;
INSERT INTO `_role` (`id`, `roleId`, `roleName`, `roleDesc`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (1, 'administrator', '系统管理员', '', 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_role` (`id`, `roleId`, `roleName`, `roleDesc`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (2, 'editor', '可编辑', NULL, 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_role` (`id`, `roleId`, `roleName`, `roleDesc`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (3, 'viewer', '可查看', NULL, 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
COMMIT;

-- ----------------------------
-- Table structure for _test_case
-- ----------------------------
DROP TABLE IF EXISTS `_test_case`;
CREATE TABLE `_test_case` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pageId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '页面Id',
  `testId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '测试用例Id; 10000 ++',
  `testName` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '测试用例名',
  `uiActionIdList` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'uiAction列表; 一个测试用例对应多个uiActionId',
  `testOpeartion` text COLLATE utf8mb4_bin COMMENT '测试用例步骤;',
  `expectedResult` text COLLATE utf8mb4_bin COMMENT '期望结果',
  `operation` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作; jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者userId; recordContent.operationByUserId',
  `operationByUser` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者用户名; recordContent.operationByUser',
  `operationAt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作时间; recordContent.operationAt; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='测试用例表';

-- ----------------------------
-- Records of _test_case
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for _ui
-- ----------------------------
DROP TABLE IF EXISTS `_ui`;
CREATE TABLE `_ui` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pageId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'page id; E.g: index',
  `uiActionType` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'ui 动作类型，如：fetchData, postData, changeUi',
  `uiActionId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'action id; E.g: selectXXXByXXX',
  `desc` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述',
  `uiActionConfig` text COLLATE utf8mb4_bin COMMENT 'ui 动作数据',
  `appDataSchema` text COLLATE utf8mb4_bin COMMENT 'ui 校验数据',
  `operation` varchar(255) COLLATE utf8mb4_bin DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='ui 施工方案';

-- ----------------------------
-- Records of _ui
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for _user
-- ----------------------------
DROP TABLE IF EXISTS `_user`;
CREATE TABLE `_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idSequence` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `userId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户id',
  `username` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户名',
  `userAvatar` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户头像',
  `contactNumber` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '联系方式',
  `gender` varchar(255) COLLATE utf8mb4_bin DEFAULT 'male' COMMENT '性别; male, female',
  `birthday` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '生日E.g: 2021-05-28T10:24:54+08:00 ',
  `signature` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '签名',
  `email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '邮箱',
  `clearTextPassword` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '初始明文密码',
  `password` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'password',
  `md5Salt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'md5Salt',
  `userType` varchar(255) COLLATE utf8mb4_bin DEFAULT 'common' COMMENT '用户类型; common, xiaochengxu',
  `userStatus` varchar(255) COLLATE utf8mb4_bin DEFAULT 'active' COMMENT '用户类型; active, banned',
  `config` mediumtext COLLATE utf8mb4_bin COMMENT '置顶信息',
  `operation` varchar(255) COLLATE utf8mb4_bin DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `userId_unique` (`userId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户表;';

-- ----------------------------
-- Records of _user
-- ----------------------------
BEGIN;
INSERT INTO `_user` (`id`, `idSequence`, `userId`, `username`, `userAvatar`, `contactNumber`, `gender`, `birthday`, `signature`, `email`, `clearTextPassword`, `password`, `md5Salt`, `userType`, `userStatus`, `config`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (1, '26260000\r', 'admin', '武林盟主', '/userAvatar/2022/4/4//1649055579149_130916_1.gif', '17177777001', 'male', '2022-04-15T00:00:00.000Z', 'nothing is impossible', '123@qq.com', '123456', '9d868aad4af212de6a26e39efbdd86ee', '4ThJGJbAPe5m', 'common', 'active', NULL, 'update', 'm3611F', 'Colin', '2022-05-05T15:55:27+08:00');
INSERT INTO `_user` (`id`, `idSequence`, `userId`, `username`, `userAvatar`, `contactNumber`, `gender`, `birthday`, `signature`, `email`, `clearTextPassword`, `password`, `md5Salt`, `userType`, `userStatus`, `config`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (2, '26260001\r', '10000Q', '伽勒', '/userAvatar/2022/4/8//1649422517016_792036_11.jpeg', '17177777001', 'male', '2022-04-15T00:00:00.000Z', 'nothing is impossible', '123@qq.com', '123456', '9d868aad4af212de6a26e39efbdd86ee', '4ThJGJbAPe5m', 'common', 'active', NULL, 'jhUpdate', 'admin', '武林盟主', '2022-04-08T20:55:17+08:00');
INSERT INTO `_user` (`id`, `idSequence`, `userId`, `username`, `userAvatar`, `contactNumber`, `gender`, `birthday`, `signature`, `email`, `clearTextPassword`, `password`, `md5Salt`, `userType`, `userStatus`, `config`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (3, '26260002\r', 'm3995Q', '雪园', '/userAvatar/2022/4/8//1649422517016_792036_11.jpeg', '17177777001', 'male', '2022-04-15T00:00:00.000Z', 'nothing is impossible', '123@qq.com', '123456', '9d868aad4af212de6a26e39efbdd86ee', '4ThJGJbAPe5m', 'common', 'active', NULL, 'jhUpdate', 'admin', '武林盟主', '2022-04-08T20:55:17+08:00');
INSERT INTO `_user` (`id`, `idSequence`, `userId`, `username`, `userAvatar`, `contactNumber`, `gender`, `birthday`, `signature`, `email`, `clearTextPassword`, `password`, `md5Salt`, `userType`, `userStatus`, `config`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (4, '26260003\r', 'm3862G', 'louis', '/userAvatar/2022/4/8//1649422517016_792036_11.jpeg', '17177777001', 'male', '2022-04-15T00:00:00.000Z', 'nothing is impossible', '123@qq.com', '123456', '9d868aad4af212de6a26e39efbdd86ee', '4ThJGJbAPe5m', 'common', 'active', NULL, 'jhUpdate', 'admin', '武林盟主', '2022-04-08T20:55:17+08:00');
INSERT INTO `_user` (`id`, `idSequence`, `userId`, `username`, `userAvatar`, `contactNumber`, `gender`, `birthday`, `signature`, `email`, `clearTextPassword`, `password`, `md5Salt`, `userType`, `userStatus`, `config`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (5, '26260004\r', 'm3662X', '张超', '/userAvatar/2022/4/8//1649422517016_792036_11.jpeg', '17177777001', 'male', '2022-04-15T00:00:00.000Z', 'nothing is impossible', '123@qq.com', '123456', '9d868aad4af212de6a26e39efbdd86ee', '4ThJGJbAPe5m', 'common', 'active', NULL, 'jhUpdate', 'admin', '武林盟主', '2022-04-08T20:55:17+08:00');
INSERT INTO `_user` (`id`, `idSequence`, `userId`, `username`, `userAvatar`, `contactNumber`, `gender`, `birthday`, `signature`, `email`, `clearTextPassword`, `password`, `md5Salt`, `userType`, `userStatus`, `config`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (6, '26260005\r', 'm3659N', '汗蒸', '/userAvatar/2022/4/8//1649422517016_792036_11.jpeg', '17177777001', 'male', '2022-04-15T00:00:00.000Z', 'nothing is impossible', '123@qq.com', '123456', '9d868aad4af212de6a26e39efbdd86ee', '4ThJGJbAPe5m', 'common', 'active', NULL, 'jhUpdate', 'admin', '武林盟主', '2022-04-08T20:55:17+08:00');
INSERT INTO `_user` (`id`, `idSequence`, `userId`, `username`, `userAvatar`, `contactNumber`, `gender`, `birthday`, `signature`, `email`, `clearTextPassword`, `password`, `md5Salt`, `userType`, `userStatus`, `config`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (7, '26260006\r', 'm3658K', '本善', '/userAvatar/2022/4/8//1649422517016_792036_11.jpeg', '17177777001', 'male', '2022-04-15T00:00:00.000Z', 'nothing is impossible', '123@qq.com', '123456', '9d868aad4af212de6a26e39efbdd86ee', '4ThJGJbAPe5m', 'common', 'active', NULL, 'jhUpdate', 'admin', '武林盟主', '2022-04-08T20:55:17+08:00');
INSERT INTO `_user` (`id`, `idSequence`, `userId`, `username`, `userAvatar`, `contactNumber`, `gender`, `birthday`, `signature`, `email`, `clearTextPassword`, `password`, `md5Salt`, `userType`, `userStatus`, `config`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (8, '26260007\r', 'm3611F', 'Colin', '/userAvatar/2022/4/8//1649422517016_792036_11.jpeg', '17177777001', 'male', '2022-04-15T00:00:00.000Z', 'nothing is impossible', '123@qq.com', '123456', '9d868aad4af212de6a26e39efbdd86ee', '4ThJGJbAPe5m', 'common', 'active', NULL, 'jhUpdate', 'm3611F', 'Colin', '2022-05-05T15:52:43+08:00');
INSERT INTO `_user` (`id`, `idSequence`, `userId`, `username`, `userAvatar`, `contactNumber`, `gender`, `birthday`, `signature`, `email`, `clearTextPassword`, `password`, `md5Salt`, `userType`, `userStatus`, `config`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (9, '26260008\r', '100005W', '安宁', '/userAvatar/2022/4/8//1649422517016_792036_11.jpeg', '17177777001', 'male', '2022-04-15T00:00:00.000Z', 'nothing is impossible', '123@qq.com', '123456', '9d868aad4af212de6a26e39efbdd86ee', '4ThJGJbAPe5m', 'common', 'active', NULL, 'insert', 'admin', '武林盟主', '2022-04-28T17:03:01+08:00');
INSERT INTO `_user` (`id`, `idSequence`, `userId`, `username`, `userAvatar`, `contactNumber`, `gender`, `birthday`, `signature`, `email`, `clearTextPassword`, `password`, `md5Salt`, `userType`, `userStatus`, `config`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (10, '26260009\r', '100002D', '王番', '/userAvatar/2022/4/8//1649422517016_792036_11.jpeg', '17177777001', 'male', '2022-04-15T00:00:00.000Z', 'nothing is impossible', '123@qq.com', '123456', '9d868aad4af212de6a26e39efbdd86ee', '4ThJGJbAPe5m', 'common', 'active', NULL, 'insert', '100005W', '安宁', '2022-05-15T23:10:47+08:00');
INSERT INTO `_user` (`id`, `idSequence`, `userId`, `username`, `userAvatar`, `contactNumber`, `gender`, `birthday`, `signature`, `email`, `clearTextPassword`, `password`, `md5Salt`, `userType`, `userStatus`, `config`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (11, '26260010\r', '100062Y', '雅飒', '/userAvatar/2022/4/8//1649422517016_792036_11.jpeg', '17177777001', 'male', '2022-04-15T00:00:00.000Z', 'nothing is impossible', '123@qq.com', '123456', '9d868aad4af212de6a26e39efbdd86ee', '4ThJGJbAPe5m', 'common', 'active', NULL, 'insert', '100005W', '安宁', '2022-05-15T23:11:31+08:00');
COMMIT;

-- ----------------------------
-- Table structure for _user_group_role
-- ----------------------------
DROP TABLE IF EXISTS `_user_group_role`;
CREATE TABLE `_user_group_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '用户id',
  `groupId` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '群组Id',
  `roleId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '角色Id',
  `operation` varchar(255) COLLATE utf8mb4_bin DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `groupId_index` (`groupId`) USING BTREE,
  KEY `userId_index` (`userId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户群组角色关联表; 软删除未启用;';

-- ----------------------------
-- Records of _user_group_role
-- ----------------------------
BEGIN;
INSERT INTO `_user_group_role` (`id`, `userId`, `groupId`, `roleId`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (1, 'admin', 'adminGroup', 'administrator', 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
COMMIT;

-- ----------------------------
-- Table structure for _user_group_role_page
-- ----------------------------
DROP TABLE IF EXISTS `_user_group_role_page`;
CREATE TABLE `_user_group_role_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'userId 或者 通配符; 通配符: *',
  `group` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'groupId 或者 通配符; 通配符: *',
  `role` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'roleId 或者 通配符; 通配符: *',
  `page` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'pageId id',
  `allowOrDeny` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户群组角色 匹配后 执行动作; allow、deny',
  `desc` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '映射描述',
  `operation` varchar(255) COLLATE utf8mb4_bin DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户群组角色 - 页面 映射表; 软删除未启用;';

-- ----------------------------
-- Records of _user_group_role_page
-- ----------------------------
BEGIN;
INSERT INTO `_user_group_role_page` (`id`, `user`, `group`, `role`, `page`, `allowOrDeny`, `desc`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (1, '*', 'public', '*', 'login', 'allow', '登陆页面; 开放所有用户;', 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_user_group_role_page` (`id`, `user`, `group`, `role`, `page`, `allowOrDeny`, `desc`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (2, '*', 'login', '*', 'help,manual', 'allow', '工具页; 开放给登陆用户;', 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_user_group_role_page` (`id`, `user`, `group`, `role`, `page`, `allowOrDeny`, `desc`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (3, '*', 'login', '*', '*', 'allow', '所有页面; 开放给登陆用户;', 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
COMMIT;

-- ----------------------------
-- Table structure for _user_group_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `_user_group_role_resource`;
CREATE TABLE `_user_group_role_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'userId 或者 通配符; 通配符: *',
  `group` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'groupId 或者 通配符; 通配符: *',
  `role` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'roleId 或者 通配符; 通配符: *',
  `resource` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'resourceId 或者 通配符; 通配符: *, !resourceId',
  `allowOrDeny` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户群组角色 匹配后 执行动作; allow、deny',
  `desc` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '映射描述',
  `operation` varchar(255) COLLATE utf8mb4_bin DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户群组角色 - 请求资源 映射表; 软删除未启用;';

-- ----------------------------
-- Records of _user_group_role_resource
-- ----------------------------
BEGIN;
INSERT INTO `_user_group_role_resource` (`id`, `user`, `group`, `role`, `resource`, `allowOrDeny`, `desc`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (1, '*', 'public', '*', 'login.passwordLogin', 'allow', '登陆resource, 开放给所有用户', 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_user_group_role_resource` (`id`, `user`, `group`, `role`, `resource`, `allowOrDeny`, `desc`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (2, '*', 'login', '*', 'allPage.*', 'allow', '工具类resource, 开放给所有登陆成功的用户', 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
INSERT INTO `_user_group_role_resource` (`id`, `user`, `group`, `role`, `resource`, `allowOrDeny`, `desc`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (3, '*', 'login', '*', '*', 'allow', '所有resource, 开放给所有登陆成功的用户', 'insert', 'admin', '系统管理员', '2022-09-15T23:46:04+08:00');
COMMIT;

-- ----------------------------
-- Table structure for _user_session
-- ----------------------------
DROP TABLE IF EXISTS `_user_session`;
CREATE TABLE `_user_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户id',
  `userIp` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户ip',
  `userAgent` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '请求的 agent',
  `deviceId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '设备id',
  `deviceType` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '设备类型',
  `userIpRegion` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `socketStatus` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT 'offline' COMMENT 'socket状态',
  `authToken` varchar(2048) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'auth token',
  `refreshToken` varchar(2048) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'refresh token',
  `operation` varchar(255) COLLATE utf8mb4_bin DEFAULT 'insert' COMMENT '操作; insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00 ',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userId_index` (`userId`) USING BTREE,
  KEY `userId_deviceId_unique` (`userId`,`deviceId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户session表; deviceId 维度;软删除未启用;';

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `articleId` bigint(20) DEFAULT NULL COMMENT '文章id, 10000 ++',
  `categoryId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '分类id',
  `articleGroupName` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '文章所属分组名',
  `articleTagList` text COLLATE utf8mb4_bin COMMENT '标签; 用, 拼接',
  `articlePublishStatus` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '文章类型(状态)：public, login, draft, deleted',
  `articlePublishTime` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '文章发布时间',
  `articleTitle` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '标题',
  `articleCoverImage` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '封面',
  `articleContent` longtext COLLATE utf8mb4_bin COMMENT '编辑的内容',
  `articleContentForSeo` longtext COLLATE utf8mb4_bin COMMENT 'HTML 用于渲染',
  `articleAssignmentList` text COLLATE utf8mb4_bin COMMENT '文章作业 [{ }]',
  `articleAssignmentListWithAnswer` text COLLATE utf8mb4_bin COMMENT '文章作业答案 [{ }]',
  `articleAudioUrl` varchar(1023) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '默认音频URL唯一的',
  `articleVideoUrl` varchar(1023) COLLATE utf8mb4_bin DEFAULT '' COMMENT '默认视频URL',
  `articleCreateTime` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建时间',
  `articleCreateUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者用户ID',
  `articleCreateUsername` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '创建者用户名',
  `articleUpdateTime` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新时间',
  `articleUpdateUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者用户ID',
  `articleUpdateUsername` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '更新者用户名',
  `operation` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '操作: insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '操作者userId',
  `operationByUser` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '操作者用户名',
  `operationAt` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `article_unique` (`articleId`) USING BTREE,
  KEY `categoryId_index` (`categoryId`) USING BTREE,
  KEY `articlePublishTime` (`articlePublishTime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1421 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of article
-- ----------------------------
BEGIN;
INSERT INTO `article` (`id`, `articleId`, `categoryId`, `articleGroupName`, `articleTagList`, `articlePublishStatus`, `articlePublishTime`, `articleTitle`, `articleCoverImage`, `articleContent`, `articleContentForSeo`, `articleAssignmentList`, `articleAssignmentListWithAnswer`, `articleAudioUrl`, `articleVideoUrl`, `articleCreateTime`, `articleCreateUserId`, `articleCreateUsername`, `articleUpdateTime`, `articleUpdateUserId`, `articleUpdateUsername`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (1, 10000, '10000', '测试组', '测试分类', 'public', '2022-04-20T00:00:00+08:00', '快速入门', NULL, '## 江湖JS的愿景？\n\n> 小白也容易学习的企业级的框架\n\n## 帮助小白，系统学习企业应用开发的整体框架\n\n* 先从整体框架入手，便于小白学习\n* 先入门，基本概念清楚了，需要其他的工具就可以自行探索了\n\n## 构建能够开发系统的最短学习路径\n\n* 用到的学，不用的先放一放\n* 学制要缩短，教育要革命\n\n## 应用协议统一，不同通讯通道无缝切换\n\n* 长连接，短连接\n* http, websocket, ftp, ...\n* 自主可扩展\n\n## 适合企业的登录与权限模型\n\n* 用户，组织，角色，符合企业实际尝试的三种维度，在权限配置灵活使用\n\n## 数据库配置驱动程序，接口自动生成\n\n## 江湖代码生成器，页面自动生成\n\n## 接口与页面权限，通过数据库配置，快速实现\n\n## 数据访问权限，通过数据库配置，快速实现\n\n## 数据历史，每条数据的每一个版本进行存档\n\n## 应用间物理级的隔离与解耦\n\n## 基于江湖JS的生态体系，开箱即用的江湖应用\n\n', '<h2 id=\"h2-u6C5Fu6E56jsu7684u613Fu666FuFF1F\"><a class=\"reference-link\" name=\"江湖JS的愿景？\"></a><span class=\"header-link octicon octicon-link\"></span>江湖JS的愿景？</h2><blockquote class=\"default\">\n<p>小白也容易学习的企业级的框架</p>\n</blockquote>\n<h2 id=\"h2-u5E2Eu52A9u5C0Fu767DuFF0Cu7CFBu7EDFu5B66u4E60u4F01u4E1Au5E94u7528u5F00u53D1u7684u6574u4F53u6846u67B6\"><a class=\"reference-link\" name=\"帮助小白，系统学习企业应用开发的整体框架\"></a><span class=\"header-link octicon octicon-link\"></span>帮助小白，系统学习企业应用开发的整体框架</h2><ul>\n<li>先从整体框架入手，便于小白学习</li><li>先入门，基本概念清楚了，需要其他的工具就可以自行探索了</li></ul>\n<h2 id=\"h2-u6784u5EFAu80FDu591Fu5F00u53D1u7CFBu7EDFu7684u6700u77EDu5B66u4E60u8DEFu5F84\"><a class=\"reference-link\" name=\"构建能够开发系统的最短学习路径\"></a><span class=\"header-link octicon octicon-link\"></span>构建能够开发系统的最短学习路径</h2><ul>\n<li>用到的学，不用的先放一放</li><li>学制要缩短，教育要革命</li></ul>\n<h2 id=\"h2-u5E94u7528u534Fu8BAEu7EDFu4E00uFF0Cu4E0Du540Cu901Au8BAFu901Au9053u65E0u7F1Du5207u6362\"><a class=\"reference-link\" name=\"应用协议统一，不同通讯通道无缝切换\"></a><span class=\"header-link octicon octicon-link\"></span>应用协议统一，不同通讯通道无缝切换</h2><ul>\n<li>长连接，短连接</li><li>http, websocket, ftp, …</li><li>自主可扩展</li></ul>\n<h2 id=\"h2-u9002u5408u4F01u4E1Au7684u767Bu5F55u4E0Eu6743u9650u6A21u578B\"><a class=\"reference-link\" name=\"适合企业的登录与权限模型\"></a><span class=\"header-link octicon octicon-link\"></span>适合企业的登录与权限模型</h2><ul>\n<li>用户，组织，角色，符合企业实际尝试的三种维度，在权限配置灵活使用</li></ul>\n<h2 id=\"h2-u6570u636Eu5E93u914Du7F6Eu9A71u52A8u7A0Bu5E8FuFF0Cu63A5u53E3u81EAu52A8u751Fu6210\"><a class=\"reference-link\" name=\"数据库配置驱动程序，接口自动生成\"></a><span class=\"header-link octicon octicon-link\"></span>数据库配置驱动程序，接口自动生成</h2><h2 id=\"h2-u6C5Fu6E56u4EE3u7801u751Fu6210u5668uFF0Cu9875u9762u81EAu52A8u751Fu6210\"><a class=\"reference-link\" name=\"江湖代码生成器，页面自动生成\"></a><span class=\"header-link octicon octicon-link\"></span>江湖代码生成器，页面自动生成</h2><h2 id=\"h2-u63A5u53E3u4E0Eu9875u9762u6743u9650uFF0Cu901Au8FC7u6570u636Eu5E93u914Du7F6EuFF0Cu5FEBu901Fu5B9Eu73B0\"><a class=\"reference-link\" name=\"接口与页面权限，通过数据库配置，快速实现\"></a><span class=\"header-link octicon octicon-link\"></span>接口与页面权限，通过数据库配置，快速实现</h2><h2 id=\"h2-u6570u636Eu8BBFu95EEu6743u9650uFF0Cu901Au8FC7u6570u636Eu5E93u914Du7F6EuFF0Cu5FEBu901Fu5B9Eu73B0\"><a class=\"reference-link\" name=\"数据访问权限，通过数据库配置，快速实现\"></a><span class=\"header-link octicon octicon-link\"></span>数据访问权限，通过数据库配置，快速实现</h2><h2 id=\"h2-u6570u636Eu5386u53F2uFF0Cu6BCFu6761u6570u636Eu7684u6BCFu4E00u4E2Au7248u672Cu8FDBu884Cu5B58u6863\"><a class=\"reference-link\" name=\"数据历史，每条数据的每一个版本进行存档\"></a><span class=\"header-link octicon octicon-link\"></span>数据历史，每条数据的每一个版本进行存档</h2><h2 id=\"h2-u5E94u7528u95F4u7269u7406u7EA7u7684u9694u79BBu4E0Eu89E3u8026\"><a class=\"reference-link\" name=\"应用间物理级的隔离与解耦\"></a><span class=\"header-link octicon octicon-link\"></span>应用间物理级的隔离与解耦</h2><h2 id=\"h2-u57FAu4E8Eu6C5Fu6E56jsu7684u751Fu6001u4F53u7CFBuFF0Cu5F00u7BB1u5373u7528u7684u6C5Fu6E56u5E94u7528\"><a class=\"reference-link\" name=\"基于江湖JS的生态体系，开箱即用的江湖应用\"></a><span class=\"header-link octicon octicon-link\"></span>基于江湖JS的生态体系，开箱即用的江湖应用</h2>', NULL, NULL, NULL, '', '2022-04-21T21:03:42+08:00', 'm3611F', '刘计', '2022-04-23T13:35:07+08:00', 'm3611F', '刘计', 'jhUpdate', 'm3611F', '刘计', '2022-04-23T13:35:07+08:00');
INSERT INTO `article` (`id`, `articleId`, `categoryId`, `articleGroupName`, `articleTagList`, `articlePublishStatus`, `articlePublishTime`, `articleTitle`, `articleCoverImage`, `articleContent`, `articleContentForSeo`, `articleAssignmentList`, `articleAssignmentListWithAnswer`, `articleAudioUrl`, `articleVideoUrl`, `articleCreateTime`, `articleCreateUserId`, `articleCreateUsername`, `articleUpdateTime`, `articleUpdateUserId`, `articleUpdateUsername`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (2, 10001, '10000', '测试组', '测试分类', 'login', '2022-04-20T00:00:00+08:00', '测试分类01-文章02', NULL, '## 1\n\n## 2\n\n## 3\n\n> 1111', '<h2 id=\"h2-1\"><a class=\"reference-link\" name=\"1\"></a><span class=\"header-link octicon octicon-link\"></span>1</h2><h2 id=\"h2-2\"><a class=\"reference-link\" name=\"2\"></a><span class=\"header-link octicon octicon-link\"></span>2</h2><h2 id=\"h2-3\"><a class=\"reference-link\" name=\"3\"></a><span class=\"header-link octicon octicon-link\"></span>3</h2><blockquote class=\"default\">\n<p>1111</p>\n</blockquote>\n', NULL, NULL, NULL, '', '2022-04-21T21:03:42+08:00', 'm3611F', '刘计', '2022-04-21T21:05:55+08:00', 'm3611F', '刘计', 'update', 'admin', '武林盟主', '2023-02-02T21:24:07+08:00');
INSERT INTO `article` (`id`, `articleId`, `categoryId`, `articleGroupName`, `articleTagList`, `articlePublishStatus`, `articlePublishTime`, `articleTitle`, `articleCoverImage`, `articleContent`, `articleContentForSeo`, `articleAssignmentList`, `articleAssignmentListWithAnswer`, `articleAudioUrl`, `articleVideoUrl`, `articleCreateTime`, `articleCreateUserId`, `articleCreateUsername`, `articleUpdateTime`, `articleUpdateUserId`, `articleUpdateUsername`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (3, 10002, '10000', '', '测试分类', 'public', '2022-04-20T00:00:00+08:00', '测试分类01-文章03', NULL, '## 1\n\n## 2\n\n## 3\n\n> 1111', '<h2 id=\"h2-1\"><a class=\"reference-link\" name=\"1\"></a><span class=\"header-link octicon octicon-link\"></span>1</h2><h2 id=\"h2-2\"><a class=\"reference-link\" name=\"2\"></a><span class=\"header-link octicon octicon-link\"></span>2</h2><h2 id=\"h2-3\"><a class=\"reference-link\" name=\"3\"></a><span class=\"header-link octicon octicon-link\"></span>3</h2><blockquote class=\"default\">\n<p>1111</p>\n</blockquote>\n', NULL, NULL, NULL, '', '2022-04-21T21:03:42+08:00', 'm3611F', '刘计', '2022-04-21T21:05:55+08:00', 'm3611F', '刘计', 'jhUpdate', 'm3611F', '刘计', '2022-04-21T21:05:55+08:00');
INSERT INTO `article` (`id`, `articleId`, `categoryId`, `articleGroupName`, `articleTagList`, `articlePublishStatus`, `articlePublishTime`, `articleTitle`, `articleCoverImage`, `articleContent`, `articleContentForSeo`, `articleAssignmentList`, `articleAssignmentListWithAnswer`, `articleAudioUrl`, `articleVideoUrl`, `articleCreateTime`, `articleCreateUserId`, `articleCreateUsername`, `articleUpdateTime`, `articleUpdateUserId`, `articleUpdateUsername`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (4, 10003, '10000', '', '分类测试01-文章04', 'public', '2022-04-22T14:00:05+08:00', '江湖JS白皮书', NULL, '江湖JS的愿景？\n--------\n \n> 小白也容易学习的企业级的框架\n \n帮助小白，系统学习企业应用开发的整体框架\n--------------------\n \n*   先从整体框架入手，便于小白学习\n    \n*   先入门，基本概念清楚了，需要其他的工具就可以自行探索了\n    \n \n构建能够开发系统的最短学习路径\n---------------\n \n*   用到的学，不用的先放一放\n    \n*   学制要缩短，教育要革命\n    \n \n应用协议统一，不同通讯通道无缝切换\n-----------------\n \n*   长连接，短连接\n    \n*   http, websocket, ftp, …\n    \n*   自主可扩展\n    \n \n适合企业的登录与权限模型\n------------\n \n*   用户，组织，角色，符合企业实际尝试的三种维度，在权限配置灵活使用\n    \n \n数据库配置驱动程序，接口自动生成\n----------------\n \n江湖代码生成器，页面自动生成\n--------------\n \n接口与页面权限，通过数据库配置，快速实现\n--------------------\n \n数据访问权限，通过数据库配置，快速实现\n-------------------\n \n数据历史，每条数据的每一个版本进行存档\n-------------------\n \n应用间物理级的隔离与解耦\n------------\n \n基于江湖JS的生态体系，开箱即用的江湖应用\n---------------------\n', '<h2 id=\"h2-u6C5Fu6E56jsu7684u613Fu666FuFF1F\"><a class=\"reference-link\" name=\"江湖JS的愿景？\"></a><span class=\"header-link octicon octicon-link\"></span>江湖JS的愿景？</h2><blockquote class=\"default\">\n<p>小白也容易学习的企业级的框架</p>\n</blockquote>\n<h2 id=\"h2-u5E2Eu52A9u5C0Fu767DuFF0Cu7CFBu7EDFu5B66u4E60u4F01u4E1Au5E94u7528u5F00u53D1u7684u6574u4F53u6846u67B6\"><a class=\"reference-link\" name=\"帮助小白，系统学习企业应用开发的整体框架\"></a><span class=\"header-link octicon octicon-link\"></span>帮助小白，系统学习企业应用开发的整体框架</h2><ul>\n<li>先从整体框架入手，便于小白学习</li><li>  先入门，基本概念清楚了，需要其他的工具就可以自行探索了</li></ul>\n<h2 id=\"h2-u6784u5EFAu80FDu591Fu5F00u53D1u7CFBu7EDFu7684u6700u77EDu5B66u4E60u8DEFu5F84\"><a class=\"reference-link\" name=\"构建能够开发系统的最短学习路径\"></a><span class=\"header-link octicon octicon-link\"></span>构建能够开发系统的最短学习路径</h2><ul>\n<li>用到的学，不用的先放一放</li><li>  学制要缩短，教育要革命</li></ul>\n<h2 id=\"h2-u5E94u7528u534Fu8BAEu7EDFu4E00uFF0Cu4E0Du540Cu901Au8BAFu901Au9053u65E0u7F1Du5207u6362\"><a class=\"reference-link\" name=\"应用协议统一，不同通讯通道无缝切换\"></a><span class=\"header-link octicon octicon-link\"></span>应用协议统一，不同通讯通道无缝切换</h2><ul>\n<li>长连接，短连接</li><li>http, websocket, ftp, …</li><li>  自主可扩展</li></ul>\n<h2 id=\"h2-u9002u5408u4F01u4E1Au7684u767Bu5F55u4E0Eu6743u9650u6A21u578B\"><a class=\"reference-link\" name=\"适合企业的登录与权限模型\"></a><span class=\"header-link octicon octicon-link\"></span>适合企业的登录与权限模型</h2><ul>\n<li>  用户，组织，角色，符合企业实际尝试的三种维度，在权限配置灵活使用</li></ul>\n<h2 id=\"h2-u6570u636Eu5E93u914Du7F6Eu9A71u52A8u7A0Bu5E8FuFF0Cu63A5u53E3u81EAu52A8u751Fu6210\"><a class=\"reference-link\" name=\"数据库配置驱动程序，接口自动生成\"></a><span class=\"header-link octicon octicon-link\"></span>数据库配置驱动程序，接口自动生成</h2><h2 id=\"h2-u6C5Fu6E56u4EE3u7801u751Fu6210u5668uFF0Cu9875u9762u81EAu52A8u751Fu6210\"><a class=\"reference-link\" name=\"江湖代码生成器，页面自动生成\"></a><span class=\"header-link octicon octicon-link\"></span>江湖代码生成器，页面自动生成</h2><h2 id=\"h2-u63A5u53E3u4E0Eu9875u9762u6743u9650uFF0Cu901Au8FC7u6570u636Eu5E93u914Du7F6EuFF0Cu5FEBu901Fu5B9Eu73B0\"><a class=\"reference-link\" name=\"接口与页面权限，通过数据库配置，快速实现\"></a><span class=\"header-link octicon octicon-link\"></span>接口与页面权限，通过数据库配置，快速实现</h2><h2 id=\"h2-u6570u636Eu8BBFu95EEu6743u9650uFF0Cu901Au8FC7u6570u636Eu5E93u914Du7F6EuFF0Cu5FEBu901Fu5B9Eu73B0\"><a class=\"reference-link\" name=\"数据访问权限，通过数据库配置，快速实现\"></a><span class=\"header-link octicon octicon-link\"></span>数据访问权限，通过数据库配置，快速实现</h2><h2 id=\"h2-u6570u636Eu5386u53F2uFF0Cu6BCFu6761u6570u636Eu7684u6BCFu4E00u4E2Au7248u672Cu8FDBu884Cu5B58u6863\"><a class=\"reference-link\" name=\"数据历史，每条数据的每一个版本进行存档\"></a><span class=\"header-link octicon octicon-link\"></span>数据历史，每条数据的每一个版本进行存档</h2><h2 id=\"h2-u5E94u7528u95F4u7269u7406u7EA7u7684u9694u79BBu4E0Eu89E3u8026\"><a class=\"reference-link\" name=\"应用间物理级的隔离与解耦\"></a><span class=\"header-link octicon octicon-link\"></span>应用间物理级的隔离与解耦</h2><h2 id=\"h2-u57FAu4E8Eu6C5Fu6E56jsu7684u751Fu6001u4F53u7CFBuFF0Cu5F00u7BB1u5373u7528u7684u6C5Fu6E56u5E94u7528\"><a class=\"reference-link\" name=\"基于江湖JS的生态体系，开箱即用的江湖应用\"></a><span class=\"header-link octicon octicon-link\"></span>基于江湖JS的生态体系，开箱即用的江湖应用</h2>', NULL, NULL, NULL, '', '2022-04-22T14:00:05+08:00', 'm3611F', '刘计', '2022-04-22T22:36:19+08:00', 'W00001', '张三丰', 'jhUpdate', 'W00001', '张三丰', '2022-04-22T22:36:19+08:00');
INSERT INTO `article` (`id`, `articleId`, `categoryId`, `articleGroupName`, `articleTagList`, `articlePublishStatus`, `articlePublishTime`, `articleTitle`, `articleCoverImage`, `articleContent`, `articleContentForSeo`, `articleAssignmentList`, `articleAssignmentListWithAnswer`, `articleAudioUrl`, `articleVideoUrl`, `articleCreateTime`, `articleCreateUserId`, `articleCreateUsername`, `articleUpdateTime`, `articleUpdateUserId`, `articleUpdateUsername`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (5, 10004, '10004', '01新手指南', '', 'public', '2022-04-23T13:39:26+08:00', '江湖JS白皮书', '/articleMaterial/10004/1673861243632_yz1ssovgppe (2)的副本2.jpg', '![=video](/upload/materialRepo/video/it-training-level03-lesson01-2022-02-02.mp4)\n![=audio](/upload/materialRepo/audio/11582.mp3)\n\n![车子.png](/upload/articleMaterial/10004/1674029575683_车子.png)\n![yz1ssovgppe (1).jpg](/upload/articleMaterial/10004/1673861173471_yz1ssovgppe (1).jpg)\n> 小白也容易学习的企业级的框架\n> 框架界的五菱宏光\n![yz1ssovgppe (2)的副本2.jpg](/upload/articleMaterial/10004/1673861457988_yz1ssovgppe (2)的副本2.jpg)\n\n![93f6aba4-65e9-45be-aad3-5c254a763516.jpg](/upload/articleMaterial/10004/1675439849188_93f6aba4-65e9-45be-aad3-5c254a763516.jpg)\n\n## 帮助小白，系统学习企业应用开发的整体框架\n\n![6e3117cf492e42d482d7441501f1ec33!400x400.png](/upload/articleMaterial/10004/1673960989069_6e3117cf492e42d482d7441501f1ec33!400x400.png)\n* 先从整体框架入手，便于小白学习\n* 先入门，基本概念清楚了，需要其他的工具就可以自行探索了\n\n## 构建能够开发系统的最短学习路径\n\n* 用到的学，不用的先放一放\n* 学制要缩短，教育要革命\n\n## 应用协议统一，不同通讯通道无缝切换\n\n* 长连接，短连接\n* http, websocket, ftp, ...\n* 自主可扩展\n\n## 适合企业的登录与权限模型\n\n* 用户，组织，角色，符合企业实际尝试的三种维度，在权限配置灵活使用\n\n## 数据库配置驱动程序，接口自动生成\n\n## 江湖代码生成器，页面自动生成\n\n## 接口与页面权限，通过数据库配置，快速实现\n\n## 数据访问权限，通过数据库配置，快速实现\n\n## 数据历史，每条数据的每一个版本进行存档\n\n## 应用间物理级的隔离与解耦\n\n## 基于江湖JS的生态体系，开箱即用的江湖应用\n\n', '<p><video width=\"500\" preload=\"\" controls=\"controls\" src=\"/upload/materialRepo/video/it-training-level03-lesson01-2022-02-02.mp4\"></video><br><audio controls=\"controls\" src=\"/upload/materialRepo/audio/11582.mp3\"></audio></p>\n<p><img alt=\"车子.png\" title=\"null\" src=\"/upload/articleMaterial/10004/1674029575683_车子.png\"><br>![yz1ssovgppe (1).jpg](/upload/articleMaterial/10004/1673861173471_yz1ssovgppe (1).jpg)</p>\n<blockquote class=\"default\">\n<p>小白也容易学习的企业级的框架<br>框架界的五菱宏光<br>![yz1ssovgppe (2)的副本2.jpg](/upload/articleMaterial/10004/1673861457988_yz1ssovgppe (2)的副本2.jpg)</p>\n</blockquote>\n<p><img alt=\"93f6aba4-65e9-45be-aad3-5c254a763516.jpg\" title=\"null\" src=\"/upload/articleMaterial/10004/1675439849188_93f6aba4-65e9-45be-aad3-5c254a763516.jpg\"></p>\n<h2 id=\"h2-u5E2Eu52A9u5C0Fu767DuFF0Cu7CFBu7EDFu5B66u4E60u4F01u4E1Au5E94u7528u5F00u53D1u7684u6574u4F53u6846u67B6\"><a class=\"reference-link\" name=\"帮助小白，系统学习企业应用开发的整体框架\"></a><span class=\"header-link octicon octicon-link\"></span>帮助小白，系统学习企业应用开发的整体框架</h2><p><img alt=\"6e3117cf492e42d482d7441501f1ec33!400x400.png\" title=\"null\" src=\"/upload/articleMaterial/10004/1673960989069_6e3117cf492e42d482d7441501f1ec33!400x400.png\"></p>\n<ul>\n<li>先从整体框架入手，便于小白学习</li><li>先入门，基本概念清楚了，需要其他的工具就可以自行探索了</li></ul>\n<h2 id=\"h2-u6784u5EFAu80FDu591Fu5F00u53D1u7CFBu7EDFu7684u6700u77EDu5B66u4E60u8DEFu5F84\"><a class=\"reference-link\" name=\"构建能够开发系统的最短学习路径\"></a><span class=\"header-link octicon octicon-link\"></span>构建能够开发系统的最短学习路径</h2><ul>\n<li>用到的学，不用的先放一放</li><li>学制要缩短，教育要革命</li></ul>\n<h2 id=\"h2-u5E94u7528u534Fu8BAEu7EDFu4E00uFF0Cu4E0Du540Cu901Au8BAFu901Au9053u65E0u7F1Du5207u6362\"><a class=\"reference-link\" name=\"应用协议统一，不同通讯通道无缝切换\"></a><span class=\"header-link octicon octicon-link\"></span>应用协议统一，不同通讯通道无缝切换</h2><ul>\n<li>长连接，短连接</li><li>http, websocket, ftp, ...</li><li>自主可扩展</li></ul>\n<h2 id=\"h2-u9002u5408u4F01u4E1Au7684u767Bu5F55u4E0Eu6743u9650u6A21u578B\"><a class=\"reference-link\" name=\"适合企业的登录与权限模型\"></a><span class=\"header-link octicon octicon-link\"></span>适合企业的登录与权限模型</h2><ul>\n<li>用户，组织，角色，符合企业实际尝试的三种维度，在权限配置灵活使用</li></ul>\n<h2 id=\"h2-u6570u636Eu5E93u914Du7F6Eu9A71u52A8u7A0Bu5E8FuFF0Cu63A5u53E3u81EAu52A8u751Fu6210\"><a class=\"reference-link\" name=\"数据库配置驱动程序，接口自动生成\"></a><span class=\"header-link octicon octicon-link\"></span>数据库配置驱动程序，接口自动生成</h2><h2 id=\"h2-u6C5Fu6E56u4EE3u7801u751Fu6210u5668uFF0Cu9875u9762u81EAu52A8u751Fu6210\"><a class=\"reference-link\" name=\"江湖代码生成器，页面自动生成\"></a><span class=\"header-link octicon octicon-link\"></span>江湖代码生成器，页面自动生成</h2><h2 id=\"h2-u63A5u53E3u4E0Eu9875u9762u6743u9650uFF0Cu901Au8FC7u6570u636Eu5E93u914Du7F6EuFF0Cu5FEBu901Fu5B9Eu73B0\"><a class=\"reference-link\" name=\"接口与页面权限，通过数据库配置，快速实现\"></a><span class=\"header-link octicon octicon-link\"></span>接口与页面权限，通过数据库配置，快速实现</h2><h2 id=\"h2-u6570u636Eu8BBFu95EEu6743u9650uFF0Cu901Au8FC7u6570u636Eu5E93u914Du7F6EuFF0Cu5FEBu901Fu5B9Eu73B0\"><a class=\"reference-link\" name=\"数据访问权限，通过数据库配置，快速实现\"></a><span class=\"header-link octicon octicon-link\"></span>数据访问权限，通过数据库配置，快速实现</h2><h2 id=\"h2-u6570u636Eu5386u53F2uFF0Cu6BCFu6761u6570u636Eu7684u6BCFu4E00u4E2Au7248u672Cu8FDBu884Cu5B58u6863\"><a class=\"reference-link\" name=\"数据历史，每条数据的每一个版本进行存档\"></a><span class=\"header-link octicon octicon-link\"></span>数据历史，每条数据的每一个版本进行存档</h2><h2 id=\"h2-u5E94u7528u95F4u7269u7406u7EA7u7684u9694u79BBu4E0Eu89E3u8026\"><a class=\"reference-link\" name=\"应用间物理级的隔离与解耦\"></a><span class=\"header-link octicon octicon-link\"></span>应用间物理级的隔离与解耦</h2><h2 id=\"h2-u57FAu4E8Eu6C5Fu6E56jsu7684u751Fu6001u4F53u7CFBuFF0Cu5F00u7BB1u5373u7528u7684u6C5Fu6E56u5E94u7528\"><a class=\"reference-link\" name=\"基于江湖JS的生态体系，开箱即用的江湖应用\"></a><span class=\"header-link octicon octicon-link\"></span>基于江湖JS的生态体系，开箱即用的江湖应用</h2>', NULL, NULL, '/materialRepo/audio/11582.mp3', '/materialRepo/video/it-training-level03-lesson01-2022-02-02.mp4', '2022-04-23T13:39:26+08:00', 'm3611F', '刘计', '2023-02-03T23:57:32+08:00', 'admin', '武林盟主', 'jhUpdate', 'admin', '武林盟主', '2023-02-03T23:57:32+08:00');
COMMIT;

-- ----------------------------
-- Table structure for article_history
-- ----------------------------
DROP TABLE IF EXISTS `article_history`;
CREATE TABLE `article_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `articleId` bigint(20) DEFAULT NULL COMMENT '文章id, 10000 ++',
  `categoryId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '分类id',
  `articleGroupName` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '文章所属分组名',
  `articleTagList` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '标签; 用, 拼接',
  `articlePublishStatus` varchar(255) COLLATE utf8mb4_bin DEFAULT 'login' COMMENT '文章类型(状态)：public, login, draft, deleted',
  `articlePublishTime` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '文章发布时间',
  `articleTitle` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '标题',
  `articleCoverImage` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '封面',
  `articleContent` longtext COLLATE utf8mb4_bin COMMENT '编辑的内容',
  `articleContentForSeo` longtext COLLATE utf8mb4_bin COMMENT 'HTML 用于渲染',
  `articleAssignmentList` text COLLATE utf8mb4_bin COMMENT '文章作业 [{ }]',
  `articleAssignmentListWithAnswer` text COLLATE utf8mb4_bin COMMENT '文章作业答案 [{ }]',
  `articleAudioUrl` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '默认音频URL唯一的',
  `articleVideoUrl` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '默认视频URL',
  `articleCreateTime` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建时间',
  `articleCreateUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者用户ID',
  `articleCreateUsername` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者用户名',
  `articleUpdateTime` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新时间',
  `articleUpdateUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者用户ID',
  `articleUpdateUsername` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者用户名',
  `operation` varchar(255) COLLATE utf8mb4_bin DEFAULT 'insert' COMMENT '操作: insert, update, jhInsert, jhUpdate, jhDelete jhRestore',
  `operationByUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者userId',
  `operationByUser` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作者用户名',
  `operationAt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作时间; E.g: 2021-05-28T10:24:54+08:00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of article_history
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryId` bigint(255) DEFAULT NULL COMMENT '分类id',
  `categoryName` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  `categoryArticleIgnoreTiltle` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '目录中需要省略的文字',
  `categoryIntro` text COLLATE utf8mb4_bin,
  `categoryGroup` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `categoryGroupSort` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `categoryPublishStatus` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  `categoryCreateTime` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  `categoryCreateUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  `categoryCreateUsername` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  `categoryUpdateTime` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  `categoryUpdateUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  `categoryUpdateUsername` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  `operation` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  `operationByUserId` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  `operationByUser` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  `operationAt` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `categoryId_unique` (`categoryId`) USING BTREE,
  KEY `categoryName_unique` (`categoryName`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of category
-- ----------------------------
BEGIN;
INSERT INTO `category` (`id`, `categoryId`, `categoryName`, `categoryArticleIgnoreTiltle`, `categoryIntro`, `categoryGroup`, `categoryGroupSort`, `categoryPublishStatus`, `categoryCreateTime`, `categoryCreateUserId`, `categoryCreateUsername`, `categoryUpdateTime`, `categoryUpdateUserId`, `categoryUpdateUsername`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (1, 10000, '测试分类01', NULL, '测试分类01', '测试分类', '1', 'deleted', '2022-04-21T21:01:43+08:00', 'm3611F', '刘计', '2022-04-23T13:38:09+08:00', 'm3611F', '刘计', 'jhUpdate', 'm3611F', '刘计', '2022-04-23T13:38:09+08:00');
INSERT INTO `category` (`id`, `categoryId`, `categoryName`, `categoryArticleIgnoreTiltle`, `categoryIntro`, `categoryGroup`, `categoryGroupSort`, `categoryPublishStatus`, `categoryCreateTime`, `categoryCreateUserId`, `categoryCreateUsername`, `categoryUpdateTime`, `categoryUpdateUserId`, `categoryUpdateUsername`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (2, 10001, '测试分类02', NULL, '测试分类02', '测试分类', '2', 'deleted', '2022-04-21T21:02:03+08:00', 'm3611F', '刘计', '2022-04-23T13:38:13+08:00', 'm3611F', '刘计', 'jhUpdate', 'm3611F', '刘计', '2022-04-23T13:38:13+08:00');
INSERT INTO `category` (`id`, `categoryId`, `categoryName`, `categoryArticleIgnoreTiltle`, `categoryIntro`, `categoryGroup`, `categoryGroupSort`, `categoryPublishStatus`, `categoryCreateTime`, `categoryCreateUserId`, `categoryCreateUsername`, `categoryUpdateTime`, `categoryUpdateUserId`, `categoryUpdateUsername`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (3, 10002, '测试分类03', NULL, '测试分类03', '测试分类', '3', 'deleted', '2022-04-21T21:02:44+08:00', 'm3611F', '刘计', '2022-04-23T13:38:16+08:00', 'm3611F', '刘计', 'jhUpdate', 'm3611F', '刘计', '2022-04-23T13:38:16+08:00');
INSERT INTO `category` (`id`, `categoryId`, `categoryName`, `categoryArticleIgnoreTiltle`, `categoryIntro`, `categoryGroup`, `categoryGroupSort`, `categoryPublishStatus`, `categoryCreateTime`, `categoryCreateUserId`, `categoryCreateUsername`, `categoryUpdateTime`, `categoryUpdateUserId`, `categoryUpdateUsername`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (4, 10003, '测试分类04', NULL, '测试分类04', '测试分类', '4', 'deleted', '2022-04-22T13:57:53+08:00', 'm3611F', '刘计', '2022-04-23T13:38:19+08:00', 'm3611F', '刘计', 'jhUpdate', 'm3611F', '刘计', '2022-04-23T13:38:19+08:00');
INSERT INTO `category` (`id`, `categoryId`, `categoryName`, `categoryArticleIgnoreTiltle`, `categoryIntro`, `categoryGroup`, `categoryGroupSort`, `categoryPublishStatus`, `categoryCreateTime`, `categoryCreateUserId`, `categoryCreateUsername`, `categoryUpdateTime`, `categoryUpdateUserId`, `categoryUpdateUsername`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (5, 10004, '江湖JS', NULL, '小白也容易学习的企业级框架', '江湖JS', '0', 'public', '2022-04-23T13:37:19+08:00', 'm3611F', '刘计', '2022-04-23T13:37:58+08:00', 'm3611F', '刘计', 'jhUpdate', 'm3611F', '刘计', '2022-04-23T13:37:58+08:00');
INSERT INTO `category` (`id`, `categoryId`, `categoryName`, `categoryArticleIgnoreTiltle`, `categoryIntro`, `categoryGroup`, `categoryGroupSort`, `categoryPublishStatus`, `categoryCreateTime`, `categoryCreateUserId`, `categoryCreateUsername`, `categoryUpdateTime`, `categoryUpdateUserId`, `categoryUpdateUsername`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (6, 10005, '多星-即时通讯', NULL, '暂无文集简介', '多星-即时通讯', '5', 'public', '2022-04-23T20:24:44+08:00', 'm3611F', '刘计', '2022-05-03T21:49:35+08:00', 'm3611F', '刘计', 'jhUpdate', 'm3611F', '刘计', '2022-05-03T21:49:35+08:00');
INSERT INTO `category` (`id`, `categoryId`, `categoryName`, `categoryArticleIgnoreTiltle`, `categoryIntro`, `categoryGroup`, `categoryGroupSort`, `categoryPublishStatus`, `categoryCreateTime`, `categoryCreateUserId`, `categoryCreateUsername`, `categoryUpdateTime`, `categoryUpdateUserId`, `categoryUpdateUsername`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (7, 10006, ' 江湖JS-工具', NULL, '暂无文集简介', ' 江湖JS-工具', '4', 'deleted', '2022-04-23T22:01:57+08:00', 'W00001', '张三丰', '2022-05-03T21:47:36+08:00', 'm3611F', '刘计', 'jhUpdate', 'm3611F', '刘计', '2022-05-03T21:47:36+08:00');
INSERT INTO `category` (`id`, `categoryId`, `categoryName`, `categoryArticleIgnoreTiltle`, `categoryIntro`, `categoryGroup`, `categoryGroupSort`, `categoryPublishStatus`, `categoryCreateTime`, `categoryCreateUserId`, `categoryCreateUsername`, `categoryUpdateTime`, `categoryUpdateUserId`, `categoryUpdateUsername`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (8, 10007, '江湖JS-部署', NULL, '暂无文集简介', '江湖JS-部署', '6', 'deleted', '2022-04-23T22:07:49+08:00', 'W00001', '张三丰', '2022-05-03T21:49:17+08:00', 'm3611F', '刘计', 'jhUpdate', 'm3611F', '刘计', '2022-05-03T21:49:17+08:00');
INSERT INTO `category` (`id`, `categoryId`, `categoryName`, `categoryArticleIgnoreTiltle`, `categoryIntro`, `categoryGroup`, `categoryGroupSort`, `categoryPublishStatus`, `categoryCreateTime`, `categoryCreateUserId`, `categoryCreateUsername`, `categoryUpdateTime`, `categoryUpdateUserId`, `categoryUpdateUsername`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (9, 10008, '机器学习训练营 - 资料', NULL, '暂无文集简介', '机器学习训练营 - 资料', '4', 'deleted', '2022-04-23T22:14:30+08:00', 'W00001', '张三丰', '2022-04-23T22:17:35+08:00', 'W00001', '张三丰', 'jhUpdate', 'W00001', '张三丰', '2022-04-23T22:17:35+08:00');
INSERT INTO `category` (`id`, `categoryId`, `categoryName`, `categoryArticleIgnoreTiltle`, `categoryIntro`, `categoryGroup`, `categoryGroupSort`, `categoryPublishStatus`, `categoryCreateTime`, `categoryCreateUserId`, `categoryCreateUsername`, `categoryUpdateTime`, `categoryUpdateUserId`, `categoryUpdateUsername`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (10, 10009, '旋风-内容管理', NULL, '旋风-内容管理', '旋风', '7', 'login', '2022-05-03T21:51:52+08:00', 'm3611F', '刘计', '2022-05-03T21:51:52+08:00', 'm3611F', '刘计', 'jhInsert', 'm3611F', '刘计', '2022-05-03T21:51:52+08:00');
INSERT INTO `category` (`id`, `categoryId`, `categoryName`, `categoryArticleIgnoreTiltle`, `categoryIntro`, `categoryGroup`, `categoryGroupSort`, `categoryPublishStatus`, `categoryCreateTime`, `categoryCreateUserId`, `categoryCreateUsername`, `categoryUpdateTime`, `categoryUpdateUserId`, `categoryUpdateUsername`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (11, 10010, '武林-直播课堂', NULL, '武林-直播课堂', '武林', '8', 'login', '2022-05-03T21:52:21+08:00', 'm3611F', '刘计', '2022-05-03T21:52:21+08:00', 'm3611F', '刘计', 'jhInsert', 'm3611F', '刘计', '2022-05-03T21:52:21+08:00');
INSERT INTO `category` (`id`, `categoryId`, `categoryName`, `categoryArticleIgnoreTiltle`, `categoryIntro`, `categoryGroup`, `categoryGroupSort`, `categoryPublishStatus`, `categoryCreateTime`, `categoryCreateUserId`, `categoryCreateUsername`, `categoryUpdateTime`, `categoryUpdateUserId`, `categoryUpdateUsername`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (12, 10011, 'Training', NULL, 'Collection of IT Training tutorials and documents.', 'Training', '1', 'public', '2022-05-10T19:06:25+08:00', '100005W', '安宁', '2022-05-10T19:06:25+08:00', '100005W', '安宁', 'jhInsert', '100005W', '安宁', '2022-05-10T19:06:25+08:00');
INSERT INTO `category` (`id`, `categoryId`, `categoryName`, `categoryArticleIgnoreTiltle`, `categoryIntro`, `categoryGroup`, `categoryGroupSort`, `categoryPublishStatus`, `categoryCreateTime`, `categoryCreateUserId`, `categoryCreateUsername`, `categoryUpdateTime`, `categoryUpdateUserId`, `categoryUpdateUsername`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (13, 10012, 'IT初级编程培训', '【学习方法课程】IT初级编程', 'IT中文初级编程培训', 'IT培训', '1', 'public', '2022-05-15T23:32:29+08:00', '100002D', '王番', '2022-06-12T14:42:05+08:00', 'm3611F', 'Colin', 'jhUpdate', 'm3611F', 'Colin', '2022-06-12T14:42:05+08:00');
INSERT INTO `category` (`id`, `categoryId`, `categoryName`, `categoryArticleIgnoreTiltle`, `categoryIntro`, `categoryGroup`, `categoryGroupSort`, `categoryPublishStatus`, `categoryCreateTime`, `categoryCreateUserId`, `categoryCreateUsername`, `categoryUpdateTime`, `categoryUpdateUserId`, `categoryUpdateUsername`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (14, 10013, '江湖JS框架编程培训', '【学习方法课程】IT高级编程', 'IT江湖JS框架编程培训', 'IT培训', '3', 'public', '2022-05-15T23:42:35+08:00', '100002D', '王番', '2022-06-12T14:59:11+08:00', 'm3611F', 'Colin', 'jhUpdate', 'm3611F', 'Colin', '2022-06-12T14:59:11+08:00');
INSERT INTO `category` (`id`, `categoryId`, `categoryName`, `categoryArticleIgnoreTiltle`, `categoryIntro`, `categoryGroup`, `categoryGroupSort`, `categoryPublishStatus`, `categoryCreateTime`, `categoryCreateUserId`, `categoryCreateUsername`, `categoryUpdateTime`, `categoryUpdateUserId`, `categoryUpdateUsername`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (15, 10014, 'IT中级编程培训', NULL, 'IT中文中级编程培训', 'IT培训', '2', 'public', '2022-06-03T00:00:46+08:00', '100005W', '安宁', '2022-06-03T00:01:19+08:00', '100005W', '安宁', 'jhUpdate', '100005W', '安宁', '2022-06-03T00:01:19+08:00');
INSERT INTO `category` (`id`, `categoryId`, `categoryName`, `categoryArticleIgnoreTiltle`, `categoryIntro`, `categoryGroup`, `categoryGroupSort`, `categoryPublishStatus`, `categoryCreateTime`, `categoryCreateUserId`, `categoryCreateUsername`, `categoryUpdateTime`, `categoryUpdateUserId`, `categoryUpdateUsername`, `operation`, `operationByUserId`, `operationByUser`, `operationAt`) VALUES (16, 10015, '江湖JS-草稿', NULL, '江湖JS-草稿', '江湖JS', '9', 'login', '2022-06-12T16:14:55+08:00', 'm3611F', 'Colin', '2022-06-12T16:14:55+08:00', 'm3611F', 'Colin', 'jhInsert', 'm3611F', 'Colin', '2022-06-12T16:14:55+08:00');
COMMIT;

-- ----------------------------
-- View structure for view01_article
-- ----------------------------
DROP VIEW IF EXISTS `view01_article`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view01_article` AS select `article`.`id` AS `id`,`article`.`articleId` AS `articleId`,`article`.`categoryId` AS `categoryId`,`article`.`articleGroupName` AS `articleGroupName`,`article`.`articleTagList` AS `articleTagList`,`article`.`articlePublishStatus` AS `articlePublishStatus`,`article`.`articlePublishTime` AS `articlePublishTime`,`article`.`articleTitle` AS `articleTitle`,`article`.`articleCoverImage` AS `articleCoverImage`,`article`.`articleAudioUrl` AS `articleAudioUrl`,`article`.`articleVideoUrl` AS `articleVideoUrl`,`article`.`articleCreateTime` AS `articleCreateTime`,`article`.`articleCreateUserId` AS `articleCreateUserId`,`article`.`articleCreateUsername` AS `articleCreateUsername`,`article`.`articleUpdateTime` AS `articleUpdateTime`,`article`.`articleUpdateUserId` AS `articleUpdateUserId`,`article`.`articleUpdateUsername` AS `articleUpdateUsername`,`article`.`operation` AS `operation`,`article`.`operationByUserId` AS `operationByUserId`,`article`.`operationByUser` AS `operationByUser`,`article`.`operationAt` AS `operationAt`,`category`.`categoryName` AS `categoryName`,`category`.`categoryIntro` AS `categoryIntro`,`category`.`categoryGroup` AS `categoryGroup`,`category`.`categoryGroupSort` AS `categoryGroupSort` from (`article` left join `category` on((`article`.`categoryId` = `category`.`categoryId`)));

-- ----------------------------
-- View structure for view01_category
-- ----------------------------
DROP VIEW IF EXISTS `view01_category`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view01_category` AS select count((`article`.`articlePublishStatus` in ('public','login'))) AS `count`,`category`.`id` AS `id`,`category`.`categoryId` AS `categoryId`,`category`.`categoryName` AS `categoryName`,`category`.`categoryArticleIgnoreTiltle` AS `categoryArticleIgnoreTiltle`,`category`.`categoryGroup` AS `categoryGroup`,`category`.`categoryGroupSort` AS `categoryGroupSort`,concat('<',`category`.`categoryGroup`,`category`.`categoryGroupSort`,'>') AS `categoryGroupConcat`,`category`.`categoryIntro` AS `categoryIntro`,`category`.`categoryPublishStatus` AS `categoryPublishStatus`,`category`.`categoryCreateTime` AS `categoryCreateTime`,`category`.`categoryCreateUserId` AS `categoryCreateUserId`,`category`.`categoryCreateUsername` AS `categoryCreateUsername`,`category`.`categoryUpdateTime` AS `categoryUpdateTime`,`category`.`categoryUpdateUserId` AS `categoryUpdateUserId`,`category`.`categoryUpdateUsername` AS `categoryUpdateUsername`,`category`.`operation` AS `operation`,`category`.`operationByUserId` AS `operationByUserId`,`category`.`operationByUser` AS `operationByUser`,`category`.`operationAt` AS `operationAt` from (`category` left join `article` on((`category`.`categoryId` = `article`.`categoryId`))) group by `category`.`categoryId`;

-- ----------------------------
-- View structure for _view01_user
-- ----------------------------
DROP VIEW IF EXISTS `_view01_user`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `_view01_user` AS select `_user`.`id` AS `id`,`_user`.`userId` AS `userId`,`_user`.`username` AS `username`,`_user`.`userAvatar` AS `userAvatar`,`_user`.`contactNumber` AS `contactNumber`,`_user`.`gender` AS `gender`,`_user`.`birthday` AS `birthday`,`_user`.`signature` AS `signature`,`_user`.`email` AS `email`,`_user`.`password` AS `password`,`_user`.`md5Salt` AS `md5Salt`,`_user`.`userType` AS `userType`,`_user`.`userStatus` AS `userStatus`,`_user`.`config` AS `config`,`_user`.`operation` AS `operation`,`_user`.`operationByUserId` AS `operationByUserId`,`_user`.`operationByUser` AS `operationByUser`,`_user`.`operationAt` AS `operationAt` from `_user`;

SET FOREIGN_KEY_CHECKS = 1;
