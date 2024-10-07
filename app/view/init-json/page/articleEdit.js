const content = {
  pageType: "jh-page", pageId: "articleEdit", pageName: "文章列表", version: 'v2',
  resourceList: [
    /**
     * 	articleEdit	selectArticleInfo	✅文章编辑-查询文章详情	service	{}	{ "service": "article", "serviceFunction": "getArticleAndFillArticles" }
	articleEdit	useMaterial	✅文章编辑-使用素材	service	{}	{ "service": "article", "serviceFunction": "useMaterial" }
{ "before": [
{"service": "article", "serviceFunction": "fillInsertItemParamsBeforeHook"}
], "after": [
{"service": "article", "serviceFunction": "articleHistoryRecordAfterHook"}
] }	articleEdit	jhInsertItem	✅文章编辑-新增文章	sql	{}	{ "table": "article", "operation": "jhInsert" }
	articleEdit	selectItemList	✅文章编辑-查询文章	sql	{}	{ "table": "article", "operation": "select" }
{ "before": [
{"service": "article", "serviceFunction": "fillUpdateItemParamsBeforeHook"}
], "after": [
{"service": "article", "serviceFunction": "articleHistoryRecordAfterHook"}
] }	articleEdit	jhUpdateItem	✅文章编辑-更新文章	sql	{}	{ "table": "article", "operation": "jhUpdate" }
	articleEdit	deletedArticle	✅文章编辑-将文章移至回收站	service	{}	{ "service": "article", "serviceFunction": "deletedArticle" }
	articleEdit	restoreArticle	✅文章编辑-文章恢复	service	{}	{ "service": "article", "serviceFunction": "restoreArticle" }
     */
    {
      actionId: "selectArticleInfo",
      resourceType: "service",
      desc: "✅文章编辑-查询文章详情",
      resourceData: { service: "article", serviceFunction: "getArticleAndFillArticles" }
    },
    {
      actionId: "useMaterial",
      resourceType: "service",
      desc: "✅文章编辑-使用素材",
      resourceData: { service: "article", serviceFunction: "useMaterial" }
    },
    {
      actionId: "jhInsertItem",
      resourceType: "sql",
      desc: "✅文章编辑-新增文章",
      resourceData: { table: "article", operation: "jhInsert" },
      resourceHook: {
        before: [
          { service: "article", serviceFunction: "fillInsertItemParamsBeforeHook" }
        ],
        after: [
          { service: "article", serviceFunction: "articleHistoryRecordAfterHook" }
        ]
      }
    },
    {
      actionId: "selectItemList",
      resourceType: "sql",
      desc: "✅文章编辑-查询文章",
      resourceData: { table: "article", operation: "select" }
    },
    {
      actionId: "jhUpdateItem",
      resourceType: "sql",
      desc: "✅文章编辑-更新文章",
      resourceData: { table: "article", operation: "jhUpdate" },
      resourceHook: {
        before: [

          { service: "article", serviceFunction: "fillUpdateItemParamsBeforeHook" }
        ],
        after: [
          { service: "article", serviceFunction: "articleHistoryRecordAfterHook" }
        ]
      }
    },
    {
      actionId: "deletedArticle",
      resourceType: "service",
      desc: "✅文章编辑-将文章移至回收站",
      resourceData: { service: "article", serviceFunction: "deletedArticle" }
    },
    {
      actionId: "restoreArticle",
      resourceType: "service",
      desc: "✅文章编辑-文章恢复",
      resourceData: { service: "article", serviceFunction: "restoreArticle" }
    }
  ], // { actionId: '', resourceType: '', resourceData: {}, resourceHook: {}, desc: '' }
  headContent: [
    { tag: 'jh-page-title', value: "文章编辑", attrs: { cols: 12, sm: 6, md:4 }, helpBtn: true, slot: [] },
    { tag: 'v-spacer' },
    /*html*/`
    <v-btn v-if="editItem.articleId && editItem.articlePublishStatus !== 'deleted'"
      @click="doUiAction('deleteArticle') " color="error" class="mr-2" depressed small>
      <v-icon class="mr-1" small>mdi-trash-can</v-icon>
      <$ constantUiMap.common.moveToRecycleBin $>
    </v-btn>
    <v-btn v-if="editItem.articlePublishStatus === 'deleted'" @click="doUiAction('restoreArticle') "
      color="error" class="mr-2"
      depressed small>
      <v-icon class="mr-1" small>mdi-backburger</v-icon>
      <$ constantUiMap.article.recoverArticle $>
    </v-btn>
    <v-btn @click="doUiAction('save')" color="success" class="mr-2" depressed small>
      <v-icon class="mr-1" small>mdi-content-save-all</v-icon>
      <$ constantUiMap.common.save $>
    </v-btn>
    <v-btn @click="doUiAction('saveAndPreview') " color="success" depressed small>
      <v-icon class="mr-1" small>mdi-eye-refresh</v-icon>
      <$ constantUiMap.common.saveAndPreview $>
    </v-btn>
    `
  ],
  pageContent: [
    {
      tag: 'v-col',
      attrs: { md: 12, class: 'pa-0' },
      value: `
      <v-container class="pa-0">
        <v-card class="jh-fixed-table-height">
          <v-form ref="articleForm">
            <v-row dense no-gutters>
              <!-- 左边栏 -->
              <v-col cols="12" xs="12" sm="4" md="3" xl="2" class="pr-sm-2">
                <v-card flat class="pa-4 pl-0">
                  <v-toolbar flat dense height="25">
                    <p class="font-weight-medium mb-0 text-subtitle-2 text-subtitle-2">
                      基本信息
                    </p>
                  </v-toolbar>
                  <v-card-text class="px-0 pt-2 pb-0">
                    <span class="jh-font-size-3">
                      <$ constantUiMap.article.articleTitle $>
                    </span>
                    <v-text-field single-line dense filled color="success"
                      label="<$ constantUiMap.article.articleTitle $>" v-model="editItem.articleTitle"
                      :rules="validationRules.requireRules" hide-details class="mt-1">
                    </v-text-field>
                  </v-card-text>
                </v-card>

                <v-card class="mt-2" flat class="pa-4 pl-0">
                  <v-toolbar flat dense height="25">
                    <p class="font-weight-medium mb-0 text-subtitle-2">
                      封面
                    </p>
                    <v-spacer></v-spacer>
                    <v-btn outlined small fab
                      @click="doUiAction('selectImage')" class="mdi-upload-outline" color="success">
                      <v-icon small>mdi-upload-outline</v-icon>
                    </v-btn>
                    <v-btn outlined small fab class="ml-2 mdi-trash-can-outline" color="error"
                      @click.stop="doUiAction('deleteImage')" v-if="editItem.articleCoverImage">
                      <v-icon small>mdi-trash-can-outline</v-icon>
                    </v-btn>
                  </v-toolbar>
                  <v-card-text class="px-0 pt-2 pb-0 text-center">
                    <img v-if="editItem.articleCoverImage" :src="\`$\{appInfo.upload}$\{editItem.articleCoverImage}\`"
                      alt=""
                      style="width: 100%; height: 100%; object-fit: cover;">
                    <p v-else class="text-center">暂无封面~</p>
                  </v-card-text>
                </v-card>

                <v-card class="mt-2" flat class="pa-4 pl-0">
                  <v-toolbar flat dense height="25">
                    <p class="font-weight-medium mb-0 text-subtitle-2">
                      音频
                    </p>
                    <v-spacer></v-spacer>
                    <v-btn outlined small fab class="mdi-upload-outline" color="success"
                      @click="doUiAction('selectAudio')">
                      <v-icon small>mdi-upload-outline</v-icon>
                    </v-btn>
                    <v-btn outlined small fab class="ml-2 mdi-trash-can-outline" color="error"
                      @click.stop="doUiAction('deleteAudio')" v-if="editItem.articleAudioUrl">
                      <v-icon small>mdi-trash-can-outline</v-icon>
                    </v-btn>
                  </v-toolbar>
                  <v-card-text class="px-0 pt-2 pb-0 text-center">
                    <audio style="max-width: 100%;" v-if="editItem.articleAudioUrl"
                      :src="\`/<$ ctx.app.config.appId $>/upload$\{editItem.articleAudioUrl}?v=$\{new Date().getTime()}\`"
                      controls>
                      <source
                        :src="\`/<$ ctx.app.config.appId $>/upload$\{editItem.articleAudioUrl}?v=$\{new Date().getTime()}\`"
                        type="audio/mpeg">
                    </audio>
                    <p v-else class="text-center">暂无音频~</p>
                  </v-card-text>
                </v-card>

                <v-card class="mt-2" flat class="pa-4 pl-0">
                  <v-toolbar flat dense height="25">
                    <p class="font-weight-medium mb-0 text-subtitle-2">
                      视频
                    </p>
                    <v-spacer></v-spacer>
                    <v-btn outlined small fab class="mdi-upload-outline" color="success"
                      @click="doUiAction('selectVideo')">
                      <v-icon small>mdi-upload-outline</v-icon>
                    </v-btn>
                    <v-btn outlined small fab class="ml-2 mdi-trash-can-outline" color="error"
                      @click.stop="doUiAction('deleteVideo')" v-if="editItem.articleVideoUrl">
                      <v-icon small>mdi-trash-can-outline</v-icon>
                    </v-btn>
                  </v-toolbar>
                  <v-card-text class="px-0 pt-2 pb-0">
                    <video style="max-width: 100%;" v-if="editItem.articleVideoUrl"
                      :src="\`/<$ ctx.app.config.appId $>/upload$\{editItem.articleVideoUrl}?v=$\{new Date().getTime()}\`"
                      controls>
                      <source
                        :src="\`/<$ ctx.app.config.appId $>/upload$\{editItem.articleVideoUrl}?v=$\{new Date().getTime()}\`"
                        type="video/mp4">
                    </video>
                    <p v-else class="text-center">暂无视频~</p>
                  </v-card-text>
                </v-card>
              </v-col>

              <!-- markdown编辑 -->
              <v-col cols="12" xs="12" sm="8" md="9" xl="10" class="mt-2 mt-sm-0">
                <v-card flat class="jh-fixed-table-height">
                  <div id="editorMdContainer" class="mb-0">
                    <textarea style="display:none;">{{ editItem.articleContent }}</textarea>
                  </div>
                </v-card>
              </v-col>
            </v-row>
          </v-form>
        </v-card>
      </v-container>
      `
    }
  ],
  actionContent: [
    /*html*/`
    <v-dialog v-model="isMaterialDialogShown" hide-overlay fullscreen transition="dialog-bottom-transition">
      <v-card flat class="rounded-0">
        <v-toolbar width="100%">
          <div class="black--text ml-2 font-weight-medium text-subtitle-2">选择素材</div>
          <v-spacer></v-spacer>
          <v-btn fab text small class="mr-2" @click="isMaterialDialogShown = false">
            <v-icon class="black--text">mdi-close</v-icon>
          </v-btn>
        </v-toolbar>
        <v-divider style="border-color: #eff2f5;opacity:0.8;"></v-divider>
        <file-browser
          v-if="isMaterialDialogShown"
          :operation-config="operationConfig"
          :accessible-folder="accessibleFolder"
          :access-path="accessPath"
          :root-directory="rootDirectory"
          :root-directory-name="rootDirectoryName"
          @use-file="doUiAction('useMaterial', $event)"></file-browser>
      </v-card>
    </v-dialog>
    `
  ],
  includeList: [
    /**
     * 
{% include 'common/jianghuJs/fixedTableHeightV4.html' %}
{% include 'component/fileBrowser/fileBrowser.html' %}
{% include 'component/articleEditor/articleEditorCss.html' %}
     */
    { type: 'html', path: 'common/jianghuJs/fixedTableHeightV4.html' },
    { type: 'html', path: 'component/fileBrowser/fileBrowser.html' },
    { type: 'html', path: 'component/articleEditor/articleEditorCss.html' },

    { type: 'css', path: '/<$ ctx.app.config.appId $>/public/plugins/editor.md/css/editormd.min.css' },
    { type: 'css', path: '/<$ ctx.app.config.appId $>/public/articleViewer/font-awesome.min.css?v=6.0.0' },
    { type: 'js', path: '/<$ ctx.app.config.appId $>/public/js/lib/jquery.min.js' },
    { type: 'js', path: '/<$ ctx.app.config.appId $>/public/plugins/editor.md/editormd.js' },
  ], // { type: < js | css | html | vueComponent >, path: ''}
  common: { 
    
    data: {
      // 下拉选项
      constantObj: {
        articlePublishStatus: [
          { text: "公开", value: "public" },
          { text: "登录可见", value: "login" },
          { text: "草稿", value: "draft" },
          { text: "回收站", value: "deleted" },
        ]
      },
      validationRules: {
        requireRules: [
          v => !!v || '必填',
        ],
      },
      serverSearchWhereLike: { className: '' }, // 服务端like查询
      serverSearchWhere: { }, // 服务端查询
      serverSearchWhereIn: { }, // 服务端 in 查询
      filterMap: {}, // 结果筛选条件


      // file-browser 配置
      operationConfig: { 
        'markdown': false,
        'copy': false,
        'cut': false,
        'clearRecycle': false,
        'delete': false,
        'edit': false,
        'rename': false,
      },
      accessibleFolder: [{ groupId: "materialRepo" }],
      accessPath: "/materialRepo/",
      rootDirectory:  "",
      rootDirectoryName:  "<$ constantUiMap.fileExplorer.material $>",

      //文章相关
      articleRowId: null,
      articleId: null,
      editItem: {
        articlePublishStatus: 'public'
      },
      saveActionData: {},

      //素材相关
      isMaterialDialogShown: false,
      materialType: '',
      writeBackType: '',
      materialFilename: '',
      materialDownloadPath: '',

      //编辑器相关
      editor: null,
      isMDChange: false,
      toolbarIcons: [
        "undo", "redo", "|",
        "watch",
        "preview", "|",
        "h1", "h2", "h3", "h4", "h5", "bold", "del", "italic", "quote", "mark",
        "imageUpload", "audioUpload", "videoUpload", "attachmentUpload",
        "list-ul", "list-ol", "hr", "link", "|",
        "toggle", "articleQuery"
      ],
    },
    dataExpression: {
      isMobile: 'window.innerWidth < 500',
      appInfo: 'window.appInfo',
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
    async created() {
      await this.doUiAction('prepareData');
    },
    async mounted() {
      await this.doUiAction('getArticleData');
      await this.doUiAction('initEditorMd');
      await this.doUiAction('beforeUnloadCheckMDChange');
    },
    doUiAction: {
      /**
       * 
          case 'prepareData':
            await this.getUrlObj();
            break;
          case 'getArticleData':
            await this.getArticleData();
            break;
          case 'initEditorMd':
            await this.initEditorMd();
            break;
          case 'beforeUnloadCheckMDChange':
            await this.beforeUnloadCheckMDChange();
            break;
          case 'deleteArticle':
            await this.confirmDeleteItemDialog();
            await this.doDeleteItem();
            await this.getArticleData();
            break;
          case 'restoreArticle':
            await this.confirmRestoreItemDialog();
            await this.doRestoreItem();
            await this.getArticleData();
            break;
          case 'save':
            await this.prepareArticleFormValidate();
            await this.prepareDoSave();
            await this.doSave();
            await this.clearSave();
            await this.refreshPage();
            break;
          case 'saveAndPreview':
            await this.doUiAction('save');
            await this.previewArticle();
            break;
          case 'selectImage':
            await this.checkIsArticleExists();
            await this.prepareSelectImageData();
            await this.openMaterialDialog();
            break;
          case 'selectAudio':
            await this.checkIsArticleExists();
            await this.prepareSelectAudioData();
            await this.openMaterialDialog();
            break;
          case 'selectVideo':
            await this.checkIsArticleExists();
            await this.prepareSelectVideoData();
            await this.openMaterialDialog();
            break;
          case 'deleteImage':
            await this.deleteImage();
            break;
          case 'deleteAudio':
            await this.deleteAudio();
            break;
          case 'deleteVideo':
            await this.deleteVideo();
            break;
          case 'MDSelectImage':
            await this.checkIsArticleExists();
            await this.prepareMDSelectImageData();
            await this.openMaterialDialog();
            break;
          case 'MDSelectAudio':
            await this.checkIsArticleExists();
            await this.prepareMDSelectAudioData();
            await this.openMaterialDialog();
            break;
          case 'MDSelectVideo':
            await this.checkIsArticleExists();
            await this.prepareMDSelectVideoData();
            await this.openMaterialDialog();
            break;
          case 'MDSelectAttachment':
            await this.checkIsArticleExists();
            await this.prepareMDSelectAttachmentData();
            await this.openMaterialDialog();
            break;
          case 'MDChange':
            await this.setMDChanged();
            await this.setArticleContent();
            break;
          case 'useMaterial':
            await this.doUseMaterial(uiActionData);
            await this.renderMaterial();
            await this.clearUseMaterial();
            break;
       */
      prepareData: ['getUrlObj'],
      getArticleData: ['getArticleData'],
      initEditorMd: ['initEditorMd'],
      beforeUnloadCheckMDChange: ['beforeUnloadCheckMDChange'],
      deleteArticle: ['confirmDeleteItemDialog', 'doDeleteItem', 'getArticleData'],
      restoreArticle: ['confirmRestoreItemDialog', 'doRestoreItem', 'getArticleData'],
      save: ['prepareArticleFormValidate', 'prepareDoSave', 'doSave', 'clearSave', 'refreshPage'],
      saveAndPreview: ['doUiAction.save', 'previewArticle'],
      selectImage: ['checkIsArticleExists', 'prepareSelectImageData', 'openMaterialDialog'],
      selectAudio: ['checkIsArticleExists', 'prepareSelectAudioData', 'openMaterialDialog'],
      selectVideo: ['checkIsArticleExists', 'prepareSelectVideoData', 'openMaterialDialog'],
      deleteImage: ['deleteImage'],
      deleteAudio: ['deleteAudio'],
      deleteVideo: ['deleteVideo'],
      MDSelectImage: ['checkIsArticleExists', 'prepareMDSelectImageData', 'openMaterialDialog'],
      MDSelectAudio: ['checkIsArticleExists', 'prepareMDSelectAudioData', 'openMaterialDialog'],
      MDSelectVideo: ['checkIsArticleExists', 'prepareMDSelectVideoData', 'openMaterialDialog'],
      MDSelectAttachment: ['checkIsArticleExists', 'prepareMDSelectAttachmentData', 'openMaterialDialog'],
      MDChange: ['setMDChanged', 'setArticleContent'],
      useMaterial: ['doUseMaterial', 'renderMaterial', 'clearUseMaterial'],

    }, // 额外uiAction { [key]: [action1, action2]}
    methods: {
      
      // ---------- 文章未保存离开时提示 uiAction >>>>>>>>>> --------
      async beforeUnloadCheckMDChange() {
        const that = this;
        window.onbeforeunload = function () {
          if (that.isMDChange) {
            return 1;
          } else {
            return null;
          }
        }
      },
      // ---------- <<<<<<<<<<< 文章未保存离开时提示 uiAction  --------

      // ---------- prepareData uiAction >>>>>>>>>> --------
      async getUrlObj() {
        const urlObj = new URLSearchParams(location.search.substring(1));
        this.articleId = urlObj.get('articleId');
      },
      // ---------- <<<<<<<<<<< prepareData uiAction  --------

      // ---------- 获取数据 uiAction >>>>>>>>>> --------
      async getArticleData() {
        if (this.articleId) {
          const result = await window.jianghuAxios({
            data: {
              appData: {
                pageId: 'articleEdit',
                actionId: 'selectArticleInfo',
                actionData: {
                  articleId: this.articleId
                },
              }
            }
          });
          this.editItem = result.data.appData.resultData;
        }
      },
      // ---------- <<<<<<<<<<< 获取数据 uiAction  --------

      // ---------- 删除数据 uiAction >>>>>>>>>>>> --------
      async confirmDeleteItemDialog() {
        if (await window.confirmDialog({ title: "<$ constantUiMap.common.recycle $>", content: "<$ constantUiMap.article.recycleArticleConfirm $>？" }) === false) {
          throw new Error("[confirmDeleteItemDialog] 否");
        }
      },
      async doDeleteItem() {
        await window.vtoast.loading("<$ constantUiMap.article.recycleArticle $>");
        await window.jianghuAxios({
          data: {
            appData: {
              pageId: 'articleEdit',
              actionId: 'deletedArticle',
              actionData: { articleId: this.articleId }
            }
          }
        });
        await window.vtoast.success("<$ constantUiMap.article.recycleArticleSuccess $>");
      },
      // ---------- <<<<<<<<<<< 删除数据 uiAction  --------

      // ---------- 恢复数据 uiAction >>>>>>>>>>>> --------
      async confirmRestoreItemDialog() {
        if (await window.confirmDialog({ title: "<$ constantUiMap.common.recover $>", content: "<$ constantUiMap.article.recoverArticleConfirm $>？" }) === false) {
          throw new Error("[confirmRestoreItemDialog] 否");
        }
      },
      async doRestoreItem() {
        await window.vtoast.loading("<$ constantUiMap.article.recoverArticle $>");
        await window.jianghuAxios({
          data: {
            appData: {
              pageId: 'articleEdit',
              actionId: 'restoreArticle',
              actionData: { articleId: this.articleId }
            }
          }
        });
        await window.vtoast.success("<$ constantUiMap.article.recoverArticleSuccess $>");
      },
      // ---------- <<<<<<<<<<< 恢复数据 uiAction  --------

      // ---------- 保存数据 uiAction >>>>>>>>>>>> --------
      async prepareArticleFormValidate() {
        if (await this.$refs.articleForm.validate()) {
          return true;
        }
        throw new Error("请完善表单信息")
      },
      async prepareDoSave() {
        const { id, articleList, categoryName, ...data } = this.editItem;
        this.saveActionData = data;
      },
      async doSave() {
        if (this.articleId) {
          await this.doUpdateItem();
        } else {
          await this.doCreateItem();
          await this.getArticleByRowId();
        }
      },
      async doCreateItem() {
        await window.vtoast.loading("新增文章");
        const result = await window.jianghuAxios({
          data: {
            appData: {
              pageId: 'articleEdit',
              actionId: 'jhInsertItem',
              actionData: this.saveActionData
            }
          }
        });
        await window.vtoast.success("新增文章成功");

        this.articleRowId = result.data.appData.resultData.rows[0];
      },
      async getArticleByRowId() {
        const { rows } = (await window.jianghuAxios({
          data: {
            appData: {
              pageId: 'articleEdit',
              actionId: 'selectItemList',
              actionData: {},
              where: { id: this.articleRowId },
            }
          }
        })).data.appData.resultData;

        this.editItem = rows[0];
        this.articleId = this.editItem.articleId;
      },
      async doUpdateItem() {
        await window.vtoast.loading("修改文章");
        await window.jianghuAxios({
          data: {
            appData: {
              pageId: 'articleEdit',
              actionId: 'jhUpdateItem',
              actionData: this.saveActionData,
              where: {
                articleId: this.articleId
              }
            }
          }
        })
        await window.vtoast.success("修改文章成功");
      },
      async clearSave() {
        this.saveActionData = {};
        this.articleRowId = null;
        this.isMDChange = false;
      },
      async refreshPage() {
        const newUrl = `/${window.appInfo.appId}/page/articleEdit?articleId=${this.editItem.articleId}&title=${this.editItem.articleTitle}`;
        history.pushState({}, null, newUrl);
      },
      // ---------- <<<<<<<<<<< 保存数据 uiAction  --------

      // ---------- 保存并预览 uiAction >>>>>>>>>>>> --------
      async previewArticle() {
        window.location.href = `/${window.appInfo.appId}/page/article?id=${this.editItem.articleId}`;
      },
      // ---------- <<<<<<<<<<< 保存并预览 uiAction  --------

      // ---------- 选择素材公共方法 >>>>>>>>>>>> --------
      async checkIsArticleExists() {
        try {
          if (!this.articleId) {
            await this.doUiAction('save')
          }
        } catch (error) {
          window.vtoast.fail("请填写文章信息后,再点击上传文件!");
          throw new Error("[checkIsArticleExists] false");
        }
      },
      async openMaterialDialog() {
        this.isMaterialDialogShown = true;
      },
      // ---------- <<<<<<<<<<< 选择素材公共方法  --------

      // ---------- 文章选择封面 uiAction >>>>>>>>>>>> --------
      async prepareSelectImageData() {
        this.materialType = 'image';
        this.writeBackType = 'attachment';
        this.accessPath = "/materialRepo/image/";
      },
      // ---------- <<<<<<<<<<< 文章选择封面 uiAction  --------

      // ---------- 文章选择音频 uiAction >>>>>>>>>>>> --------
      async prepareSelectAudioData() {
        this.materialType = 'audio';
        this.writeBackType = 'attachment';
        this.accessPath = "/materialRepo/audio/";
      },
      // ---------- <<<<<<<<<<< 文章选择音频 uiAction  --------

      // ---------- 文章选择视频 uiAction >>>>>>>>>>>> --------
      async prepareSelectVideoData() {
        this.materialType = 'video';
        this.writeBackType = 'attachment';
        this.accessPath = "/materialRepo/video/";
      },
      // ---------- <<<<<<<<<<< 文章选择视频 uiAction  --------

      // ---------- 删除文章封面 uiAction >>>>>>>>>>>> --------
      async deleteImage() {
        this.editItem.articleCoverImage = null;
      },
      // ---------- <<<<<<<<<<< 删除文章封面 uiAction  --------

      // ---------- 删除文章音频 uiAction >>>>>>>>>>>> --------
      async deleteAudio() {
        this.editItem.articleAudioUrl = null;
      },
      // ---------- <<<<<<<<<<< 删除文章音频 uiAction  --------

      // ---------- 删除文章视频 uiAction >>>>>>>>>>>> --------
      async deleteVideo() {
        this.editItem.articleVideoUrl = null;
      },
      // ---------- <<<<<<<<<<< 删除文章视频 uiAction  --------

      // ---------- 初始化编辑器 uiAction >>>>>>>>>>>> --------
      async initEditorMd() {
        const that = this;
        this.$nextTick(() => {
          if (document.getElementById('editorMdContainer')) {
            document.getElementById('editorMdContainer').innerHTML = `<textarea style=\"display:none;\">${this.editItem['articleContent'] || ""}</textarea>`;
            that.editor = editormd('editorMdContainer', {
              watch: false,
              saveHTMLToTextarea: true,    // 保存 HTML 到 Textarea
              path: '/<$ ctx.app.config.appId $>/public/plugins/editor.md/lib/',
              toolbarIcons: that.toolbarIcons,
              toolbarIconsClass: {
                imageUpload: 'fa-image',
                audioUpload: 'fa-file-audio-o',
                videoUpload: 'fa-youtube-play',
                attachmentUpload: 'fa-upload',
              },
              toolbarIconTexts: {
                toggle: "<i class='fa fa-expand' name='toggle' unselectable='on' style='display: inline-block;'></i><span class='ml-1 jh-font-size-3'>收缩</span>",  // 如果没有图标，则可以这样直接插入内容，可以是字符串或HTML标签
                articleQuery: "<i class='fa fa-table' name='toggle' unselectable='on' style='display: inline-block;'></i><span class='ml-1 jh-font-size-3'>列表</span>",  // 如果没有图标，则可以这样直接插入内容，可以是字符串或HTML标签
              },
              toolbarHandlers: {
                imageUpload: function (cm, icon, cursor, selection) {
                  that.doUiAction('MDSelectImage')
                },
                audioUpload: function (cm, icon, cursor, selection) {
                  that.doUiAction('MDSelectAudio')
                },
                videoUpload: function (cm, icon, cursor, selection) {
                  that.doUiAction('MDSelectVideo')
                },
                attachmentUpload: function (cm, icon, cursor, selection) {
                  that.doUiAction('MDSelectAttachment')
                },
                toggle: function (cm, icon, cursor, selection) {
                  cm.replaceSelection(`\n[jh-toggle title=\"title\" default-open=\"true\"]\n请输入内容\n[/jh-toggle]\n`);
                },
                articleQuery: function (cm, icon, cursor, selection) {
                  cm.replaceSelection("\n[jh-article-query]\n" +
                    "{\n" +
                    " \"tableName\": \"数据表名称\",\n" +
                    " \"where\": \"where 字段名 = 字段值\",\n" +
                    " \"queryType\": \"order\",\n" +
                    " \"orderBy\": \"order by 字段名 asc\",\n" +
                    " \"limit\": 20\n" +
                    "}" +
                    "\n[/jh-article-query]\n");
                }
              },
              lang: {
                toolbar: {
                  toggle: "展开收起",
                  column: "横向排列",  // 自定义按钮的提示文本，即title属性
                  articleQuery: "数据列表",
                }
              },
              onchange: function () {
                that.doUiAction('MDChange')
              },
            });
          } else {
            requestAnimationFrame(() => {
              that.doUiAction('initEditorMd')
            })
          }
        })
      },
      // ---------- <<<<<<<<<<< 初始化编辑器 uiAction  --------

      // ---------- markdown 选择图片 uiAction >>>>>>>>>>>> --------
      async prepareMDSelectImageData() {
        this.materialType = 'image';
        this.writeBackType = 'editor';
        this.accessPath = "/materialRepo/image/";
      },
      // ---------- <<<<<<<<<<< markdown 选择图片 uiAction  --------

      // ---------- markdown 选择音频 uiAction >>>>>>>>>>>> --------
      async prepareMDSelectAudioData() {
        this.materialType = 'audio';
        this.writeBackType = 'editor';
        this.accessPath = "/materialRepo/audio/";
      },
      // ---------- <<<<<<<<<<< markdown 选择音频 uiAction  --------

      // ---------- markdown 选择视频 uiAction >>>>>>>>>>>> --------
      async prepareMDSelectVideoData() {
        this.materialType = 'video';
        this.writeBackType = 'editor';
        this.accessPath = "/materialRepo/video/";
      },
      // ---------- <<<<<<<<<<< markdown 选择视频 uiAction  --------

      // ---------- markdown 选择附件 uiAction >>>>>>>>>>>> --------
      async prepareMDSelectAttachmentData() {
        this.materialType = 'attachment';
        this.writeBackType = 'editor';
        this.accessPath = "/materialRepo/attachment/";
      },
      // ---------- <<<<<<<<<<< markdown 选择附件 uiAction  --------

      // ---------- markdown change uiAction >>>>>>>>>>>> --------
      async setMDChanged() {
        this.isMDChange = true;
      },
      async setArticleContent() {
        this.editItem.articleContent = this.editor.getMarkdown();
        this.editItem.articleContentForSeo = this.editor.getPreviewedHTML2();
      },
      // ---------- <<<<<<<<<<< markdown change uiAction --------

      // ---------- 使用素材 uiAction >>>>>>>>>>>> --------
      async doUseMaterial(path) {
        if (this.materialType === 'image') {
          const resultData = (await window.jianghuAxios({
            data: {
              appData: {
                pageId: 'articleEdit',
                actionId: 'useMaterial',
                actionData: {
                  articleId: this.articleId,
                  path,
                },
              }
            }
          })).data.appData.resultData;
          this.materialFilename = resultData.filename;
          this.materialDownloadPath = resultData.downloadPath;
        } else {
          this.materialFilename = path.substring(path.lastIndexOf('/') + 1);
          this.materialDownloadPath = `${this.rootDirectory}${path}`;
        }
      },
      async renderMaterial() {
        if (this.writeBackType === 'editor') {
          switch (this.materialType) {
            case 'image':
              if (this.materialDownloadPath) {
                this.editor.insertValue(`\n![${this.materialFilename}](/upload${this.materialDownloadPath})`);
              }
              break;
            case 'audio':
              if (this.materialDownloadPath) {
                this.editor.insertValue(`\n![=audio](/upload${this.materialDownloadPath})`);
              }
              break;
            case 'video':
              if (this.materialDownloadPath) {
                this.editor.insertValue(`\n![=video](/upload${this.materialDownloadPath})`);
              }
              break;
            case 'attachment':
              if (this.materialDownloadPath) {
                this.editor.insertValue(`\n[${this.materialFilename}](/upload${this.materialDownloadPath})`);
              }
              break;
          }
        } else {
          switch (this.materialType) {
            case 'image':
              if (this.materialDownloadPath) {
                this.editItem.articleCoverImage = this.materialDownloadPath
              }
              break;
            case 'audio':
              if (this.materialDownloadPath) {
                this.editItem.articleAudioUrl = this.materialDownloadPath
              }
              break;
            case 'video':
              if (this.materialDownloadPath) {
                this.editItem.articleVideoUrl = this.materialDownloadPath
              }
              break;
          }
        }
      },
      async clearUseMaterial() {
        this.materialFilename = null;
        this.materialDownloadPath = null;
        this.isMaterialDialogShown = false;
      },
      // ---------- <<<<<<<<<<< 使用素材 uiAction --------
    }
  },
  style: /*css*/`
  /* ---------- btn >>>>>>>>>> -------- */
  .mdi-upload-outline,
  .mdi-trash-can-outline{
    width: 20px !important;
    height: 20px !important;
  }
  /* ---------- <<<<<<<<<<< btn -------- */

  /* ---------- 弹窗 >>>>>>>>>> -------- */
  .v-dialog--fullscreen .v-sheet {
    height: auto;
    position: relative;
    background: #fff;
    display: block;
  }
  /* ---------- <<<<<<<<<<< 弹窗 -------- */

  /* ---------- 编辑器 >>>>>>>>>> -------- */
  .editormd, .CodeMirror-gutters, .editormd-toolbar, .editormd .CodeMirror, .editormd-menu > li.divider, .editormd-menu > li > a:hover, .editormd-menu > li > a.active{
    border-color: #eff2f5 !important;
  }
  .CodeMirror-gutter{
    background-color: #fff;
  }
  .CodeMirror-scroll{
    overflow-x: hidden !important;
  }
  .editormd-dialog-close{
    color: #3F4254 !important;
  }
  .editormd-preview-container ol.linenums li, .editormd-html-preview ol.linenums li {
      list-style-type: none;
  }
  .editormd-preview-container ol.linenums, .editormd-html-preview ol.linenums {
      color: #999;
      padding-left: 0;
  }
  .editormd-preview-close-btn {
    display: none; /* 默认隐藏 */
  }
  /* 仅在预览模式下显示关闭按钮 */
  .preview-mode .editormd-preview-close-btn {
      display: block;
  }
  /* ---------- <<<<<<<<<<< 编辑器 -------- */
  `
};

module.exports = content;
