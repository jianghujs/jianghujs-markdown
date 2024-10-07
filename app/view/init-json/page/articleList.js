const content = {
  pageType: "jh-page", pageId: "articleList", pageName: "文章列表", version: 'v2',
  resourceList: [
    {
      actionId: "selectItemList",
      resourceType: "sql",
      desc: "✅查询列表",
      resourceData: { table: "view01_article", operation: "select" }
    },
    {
      actionId: "deletedArticle",
      resourceType: "service",
      desc: "✅文章列表-将文章移至回收站",
      resourceData: { service: "article", serviceFunction: "deletedArticle" }
    },
    {
      actionId: "restoreArticle",
      resourceType: "service",
      desc: "✅文章列表-文章恢复",
      resourceData: { service: "article", serviceFunction: "restoreArticle" }
    }
  ], // { actionId: '', resourceType: '', resourceData: {}, resourceHook: {}, desc: '' }
  headContent: [
    { tag: 'jh-page-title', value: "文章列表", attrs: { cols: 12, sm: 6, md:4 }, helpBtn: true, slot: [] },
    { tag: 'v-spacer' },
  ],
  pageContent: [
    {
      tag: 'jh-table',
      attrs: {  },
      colAttrs: { clos: 12 },
      cardAttrs: { class: 'rounded-lg elevation-0' },
      headActionList: [
        { tag: 'v-btn', value: '<$ constantUiMap.common.add $>', attrs: { color: 'success', class: 'mr-2', '@click': 'doUiAction("createItem")', small: true } },
        { tag: 'v-spacer' },
        // 默认筛选
        {
          tag: 'v-col',
          attrs: { cols: '12', sm: '6', md: '3', xs: 8, class: 'pa-0' },
          value: [
            { tag: 'v-text-field', attrs: {prefix: '筛选', 'v-model': 'searchInput', class: 'jh-v-input', ':dense': true, ':filled': true, ':single-line': true} },
          ],
        }
      ],
      headers: [
        { text: "<$ constantUiMap.article.articleID $>", value: "articleId", width: 80 },
        { text: "<$ constantUiMap.article.articleTitle $>", value: "articleTitle", width: 250 },
        { text: "<$ constantUiMap.article.publishStatus $>", value: "articlePublishStatus", width: 120, type: 'select', required: true },
        { text: "<$ constantUiMap.article.releaseTime $>", value: "articlePublishTime", width: 150 },
        { text: "<$ constantUiMap.article.audioURL $>", value: "articleAudioUrl", width: 300 },
        { text: "<$ constantUiMap.article.videoURL $>", value: "articleVideoUrl", width: 300 },
        { text: "<$ constantUiMap.article.editor $>", value: "articleUpdateUsername", width: 120, edit: false },
        { text: "<$ constantUiMap.article.updateTime $>", value: "articleUpdateTime", width: 150, edit: false },
        { text: "<$ constantUiMap.article.creator $>", value: "articleCreateUsername", width: 120, edit: false },
        { text: "<$ constantUiMap.article.creationTime $>", value: "articleCreateTime", width: 150, edit: false },
        {text: '<$ constantUiMap.common.operate $>', value: 'action', align: 'center', sortable: false, width: 'window.innerWidth < 500 ? 80 : 200', class: 'fixed', cellClass: 'fixed'},

        // width 表达式需要使用字符串包裹
      ],
      value: [
        // vuetify table custom slot
      ],
      rowActionList: [
        { text: '<$ constantUiMap.common.view $>', icon: 'mdi-text-box-multiple-outline', color: 'success', click: 'doUiAction("previewItem", item)' }, // 简写支持 pc 和 移动端折叠
        { text: '<$ constantUiMap.common.modify $>', icon: 'mdi-note-edit-outline', color: 'success', click: 'doUiAction("updateItem", item)' }, // 简写支持 pc 和 移动端折叠
        { text: '<$ constantUiMap.common.recycle $>', icon: 'mdi-trash-can-outline', color: 'error', click: 'doUiAction("deleteItem", item)', attrs: {vIf: "item.articlePublishStatus !== 'deleted'"} }, // 简写支持 pc 和 移动端折叠
        { text: '<$ constantUiMap.common.recover $>', icon: 'mdi-backburger', color: 'success', click: 'doUiAction("restoreItem", item)', attrs: {vIf: "item.articlePublishStatus === 'deleted'"} } // 简写支持 pc 和 移动端折叠
      ],
    }
  ],
  actionContent: [
  ],
  includeList: [], // { type: < js | css | html | vueComponent >, path: ''}
  common: { 
    
    data: {
      constantObj: {},
      validationRules: {
        requireRules: [
          v => !!v || '必填',
        ],
      },
      serverSearchWhereLike: { className: '' }, // 服务端like查询
      serverSearchWhere: { }, // 服务端查询
      serverSearchWhereIn: { }, // 服务端 in 查询
      filterMap: {}, // 结果筛选条件
    },
    dataExpression: {
      isMobile: 'window.innerWidth < 500'
    }, // data 表达式
    watch: {},
    computed: {
      tableDataComputed() {
        if(this.filterMap) {
          return this.tableData.filter(row => {
            for (const key in this.filterMap) {
              if (this.filterMap[key] && row[key] !== this.filterMap[key]) {
                return false;
              }
            }
            return true;
          });
        } else {
          return this.tableData;
        }
      },
    },
    doUiAction: {
      /**
       * 
          case 'previewItem':
            await this.jumpToPreviewArticle(uiActionData);
            break;
          case 'createItem':
            await this.jumpToCreateArticle(uiActionData);
            break;
          case 'updateItem':
            await this.jumpToUpdateArticle(uiActionData);
            break;
          case 'deleteItem':
            await this.prepareDeleteFormData(uiActionData);
            await this.confirmDeleteItemDialog();
            await this.prepareDoDeleteItem();
            await this.doDeleteItem();
            await this.clearDeleteItem();
            await this.getTableData();
            break;
          case 'restoreItem':
            await this.prepareRestoreFormData(uiActionData);
            await this.confirmRestoreItemDialog();
            await this.prepareDoRestoreItem();
            await this.doRestoreItem();
            await this.clearRestoreItem();
            await this.getTableData();
            break;
       */
      previewItem: ['jumpToPreviewArticle'],
      createItem: ['jumpToCreateArticle'],
      updateItem: ['jumpToUpdateArticle'],
      deleteItem: ['prepareDeleteFormData', 'confirmDeleteItemDialog', 'prepareDoDeleteItem', 'doDeleteItem', 'clearDeleteItem', 'doUiAction.getTableData'],
      restoreItem: ['prepareRestoreFormData', 'confirmRestoreItemDialog', 'prepareDoRestoreItem', 'doRestoreItem', 'clearRestoreItem', 'doUiAction.getTableData'],
    }, // 额外uiAction { [key]: [action1, action2]}
    methods: {
      formatTableData() {
        let tableData = this.tableDataFromBackend.map(row => {
          row.operationAt = row.operationAt ? dayjs(row.operationAt).format('YYYY-MM-DD HH:mm:ss') : '';
          row.articlePublishTime = row.articlePublishTime ? dayjs(row.articlePublishTime).format('YYYY-MM-DD HH:mm:ss') : '';
          row.articleUpdateTime = row.articleUpdateTime ? dayjs(row.articleUpdateTime).format('YYYY-MM-DD HH:mm:ss') : '';
          row.articleCreateTime = row.articleCreateTime ? dayjs(row.articleCreateTime).format('YYYY-MM-DD HH:mm:ss') : '';
          return row;
        });
        this.tableData = tableData;
      },
      // ---------- 预览文章 uiAction >>>>>>>>>>>> --------
      async jumpToPreviewArticle(funObj) {
        window.open(`/${window.appInfo.appId}/page/article?id=${funObj.articleId}`, '_blank');
      },
      // ---------- <<<<<<<<<<< 预览文章 uiAction  --------

      // ---------- 新建文章 uiAction >>>>>>>>>>>> --------
      async jumpToCreateArticle(funObj) {
        window.open(`/${window.appInfo.appId}/page/articleEdit?title=未命名`, '_blank');
      },
      // ---------- <<<<<<<<<<< 新建文章 uiAction  --------

      // ---------- 编辑文章 uiAction >>>>>>>>>>>> --------
      async jumpToUpdateArticle(funObj) {
        window.open(`/${window.appInfo.appId}/page/articleEdit?articleId=${funObj.articleId}&title=${funObj.articleTitle}`, '_blank');
      },
      // ---------- <<<<<<<<<<< 编辑文章 uiAction  --------

      async confirmDeleteItemDialog() {
        if (await window.confirmDialog({ title: "<$ constantUiMap.common.recycle $>", content: "<$ constantUiMap.article.recycleArticleConfirm $>？" }) === false) {
          throw new Error("[confirmDeleteItemDialog] 否");
        }
      },
      async prepareDoDeleteItem() {
        const { articleId } = this.deleteItem;
        this.deleteItemId = articleId;
      },
      async doDeleteItem() {
        await window.vtoast.loading("<$ constantUiMap.article.recycleArticle $>");
        await window.jianghuAxios({
          data: {
            appData: {
              pageId: 'articleList',
              actionId: 'deletedArticle',
              actionData: { articleId: this.deleteItemId }
            }
          }
        });
        await window.vtoast.success("<$ constantUiMap.article.recycleArticleSuccess $>");
      },

      // ---------- 恢复数据 uiAction >>>>>>>>>>>> --------
      async prepareRestoreFormData(funObj) {
        this.restoreItem = _.cloneDeep(funObj);
      },
      async confirmRestoreItemDialog() {
        if (await window.confirmDialog({ title: "<$ constantUiMap.common.recover $>", content: "<$ constantUiMap.article.recoverArticleConfirm $>？" }) === false) {
          throw new Error("[confirmRestoreItemDialog] 否");
        }
      },
      async prepareDoRestoreItem() {
        const { articleId } = this.restoreItem;
        this.restoreItemId = articleId;
      },
      async doRestoreItem() {
        await window.vtoast.loading("<$ constantUiMap.article.recoverArticle $>");
        await window.jianghuAxios({
          data: {
            appData: {
              pageId: 'articleList',
              actionId: 'restoreArticle',
              actionData: { articleId: this.restoreItemId }
            }
          }
        });
        await window.vtoast.success("<$ constantUiMap.article.recoverArticleSuccess $>");
      },
      async clearRestoreItem() {
        this.restoreItem = {};
        this.restoreItemId = null;
      },
      // ---------- <<<<<<<<<<< 恢复数据 uiAction  --------
    }
  },
  
};

module.exports = content;
