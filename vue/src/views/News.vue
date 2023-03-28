<template>
  <div style="padding: 10px">

    <!--    搜索区域-->
    <div style="margin: 10px 0">
      <el-input v-model="search" placeholder="请输入标题关键字" style="width: 20%" clearable></el-input><!--clearable 清除按钮-->
      <el-button type="primary" style="margin-left: 5px;" @click="load">查询</el-button>
      <el-button type="primary" @click="add">新增</el-button>
    </div>

<!--    表格主体-->
    <el-table :data="tableData" border stripe style="width: calc(100% - 40px)">
      <el-table-column prop="id" label="ID" sortable/>
      <el-table-column prop="title" label="标题" />
      <el-table-column prop="author" label="作者" />
      <el-table-column prop="time" label="发行日期" />
      <el-table-column align="right" width="140px">
        <template #default="scope">
          <el-button type="primary" size="small" @click="details(scope.row)">详情</el-button>
          <el-button type="primary" size="small" @click="handleEdit(scope.row)" v-if="user.role === 1">编辑</el-button>

          <el-popconfirm title="该操作不可撤销,你确定要删除它吗?" @confirm="handleDelete(scope.row)">
            <template #reference>
              <el-button size="small" type="danger" v-if="user.role === 1">删除</el-button>
            </template>
          </el-popconfirm>

        </template>
      </el-table-column>
    </el-table>

<!--    分页栏-->
    <div style="margin: 10px 0">
      <el-pagination
          v-model:currentPage="currentPage4"
          v-model:page-size="pageSize"
          :page-sizes="[5, 10, 15, 20]"
          :page-size="pageSize"
          :small="small"
          :disabled="disabled"
          :background="background"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total"
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
      />
    </div>

<!--    新增对话框-->
    <el-dialog v-model="dialogVisible" title="填写信息" width="60%" :before-close="handleClose">
<!--      信息填写区域-->
      <el-form :model="form" label-width="120px">
        <el-form-item label="标题">
          <el-input v-model="form.title" style="width: 50%;height: 70%"/></el-form-item>
<!--        <el-form-item label="内容">-->
<!--          <el-input v-model="form.content" style="width: 80%;height: 70%"/></el-form-item>-->
        <div id="toolbar-container"></div>
        <div id="editor-container"></div>
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="dialogVisible = false">取消</el-button>
          <el-button type="primary" @click="save">确定</el-button>
        </span>
      </template>
    </el-dialog>

    <el-dialog v-model="vis" title="详情" width="50%">
      <el-card>
        <div v-html="detail.content" style="min-height: 100px"></div>
      </el-card>
    </el-dialog>
  </div>
</template>


<script>
//富文本引入
import '@wangeditor/editor/dist/css/style.css'
import { createEditor, createToolbar, IEditorConfig, IDomEditor } from '@wangeditor/editor'
import request from "@/utils/request";

// 编辑器配置
const editorConfig= {}
editorConfig.placeholder = '请输入内容'
// 工具栏配置
const toolbarConfig = {}

let editor

export default {
  name: 'News',
  components: {

  },
  data() {
    return {
      user:{},
      form:{},
      dialogVisible:false,
      search:'',
      currentPage4:1,
      pageSize:10,
      total:0,
      tableData:[],
      detail:{},
      vis:false
    }
  },

  created() {//生命周期（钩子）函数
    let userStr = sessionStorage.getItem("user") || "{}"
    this.user = JSON.parse(userStr)

    //请求服务端，确认当前登录用户的合法信息
    request.get("/user/" + this.user.id).then(res =>{
      if(res.code === '0') {
        this.user = res.data
      }
    })

    this.load()
  },

  methods:{
    details(row) {
      this.detail=row
      this.vis=true

    },
    fileUploadSuccess(res) {
      console.log(res)
      this.form.cover=res.data
    },
    load() {
      request.get("/news", {
        params:{
          pageNum:this.currentPage4,
          pageSize:this.pageSize,
          search:this.search
        }
      }).then(res =>{
        console.log(res)
        this.tableData = res.data.records
        this.total = res.data.total
      })
    },
    add() {
      this.dialogVisible=true
      this.form={}

      //缓冲加载
      this.$nextTick(() =>{

        if(editor) {
          editor.destroy();
          this.createEdit();
        } else {
          this.createEdit();
        }
      })
    },
    save() {
      if(editor.getHtml()) {
        console.log(editor.getHtml())
        this.form.content = editor.getHtml() //获取文本字符
      }

      this.dialogVisible = false

      if(this.form.id) {//修改
        request.put("/news",this.form).then(res =>{
          console.log(res)

          if(res.code === '0') {
            this.$message.success("修改成功")
          } else {
            this.$message.error(res.message)
          }
        })
      } else {//新增
        let userStr = sessionStorage.getItem("user") || "{}"
        let user = JSON.parse(userStr)
        this.form.author = user.nickName //获取用户的昵称赋给author

        request.post("/news",this.form).then(res =>{
          console.log(res)

          if(res.code === '0') {
            this.$message.success("添加成功")
          } else {
            this.$message.error(res.message)
          }
        })
      }
      this.load()
    },

    //创建富文本
    createEdit() {
      // 创建编辑器
      editor = createEditor({
        html:this.form.content, //设置默认内容
        selector: '#editor-container',
        config: editorConfig,
        mode: 'default' // 或 'simple' 参考下文
      })
      // 创建工具栏
      toolbar = createToolbar({
        editor,
        selector: '#toolbar-container',
        config: toolbarConfig,
        mode: 'default' // 或 'simple' 参考下文
      })
    },
    //编辑
    handleEdit(row) {
      this.form = JSON.parse(JSON.stringify(row))
      this.dialogVisible = true
      //缓冲加载
      this.$nextTick(() =>{

        if(editor) {
          editor.destroy();
          this.createEdit();
        } else {
          this.createEdit();
        }
      })
    },
    handleDelete(news) {  //删除
      console.log(news.id)
      request.delete("/news/"+news.id).then(res=>{

        if(res.code === '0') {
          this.$message.success("删除成功")
        } else {
          this.$message.error(res.message)
        }
      })
      this.load()
    },
    handleSizeChange() { //改变每页的个数触发
      this.load()
    },
    handleCurrentChange() { //改变当前页码触发
      this.load()
    }
  }
}
</script>
