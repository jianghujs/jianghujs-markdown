"use strict";

module.exports.tableEnum = Object.freeze({
  // ========================江湖表============================
  _cache: "_cache",
  _constant: "_constant",
  _constant_ui: "_constant_ui",
  _group: "_group",
  _page: "_page",
  _record_history: "_record_history",
  _resource: "_resource",
  _role: "_role",
  _user: "_user",
  _user_group_role: "_user_group_role",
  _user_group_role_page: "_user_group_role_page",
  _user_group_role_resource: "_user_group_role_resource",
  _user_session: "_user_session",
  // ========================业务表============================
  article: "article",
  article_history: "article_history",
  category: "category",
  // ========================基础 View============================
  _view01_user: "_view01_user",
  view01_article: "view01_article",
  view01_category: "view01_category",
  // ========================高级 View============================
});

module.exports.articlePublishStatusEnum = Object.freeze({
  login: "login",
  draft: "draft",
  deleted: "deleted",
});

