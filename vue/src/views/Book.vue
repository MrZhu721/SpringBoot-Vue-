<template>
  <div style="padding: 10px;">

    <!--    搜索区域-->
    <div style="margin: 10px 0">
      <el-input v-model="search" placeholder="请输入书名关键字" style="width: 20%" clearable></el-input><!--clearable 清除按钮-->
      <el-button type="primary" style="margin-left: 5px;" @click="load">查询</el-button>
      <el-button type="primary" @click="add" v-if="user.role === 1">新增</el-button>
    </div>

<!--    表格主体-->
    <el-table :data="tableData" border stripe style="width: calc(100% - 40px)">
      <el-table-column prop="id" label="ID" sortable/>
      <el-table-column prop="name" label="书名" />
      <el-table-column prop="price" label="价格" />
      <el-table-column prop="author" label="作者" />
      <el-table-column prop="createTime" label="出版日期" />
      <el-table-column label="封面">
        <template #default="scope">
          <div class="demo-image__preview">
            <el-image
                style="width: 100px; height: 100px"
                :src="scope.row.cover"
                :preview-src-list=[scope.row.cover]
                preview-teleported="true" /> <!--将图像查看器附加到正文-->
          </div>
        </template>
      </el-table-column>
      <el-table-column align="right" width="150px" v-if="user.role === 1">
        <template #default="scope">
          <el-button type="primary" size="small" @click="handleEdit(scope.row)">编辑</el-button>
          <el-popconfirm title="该操作不可撤销,你确定要删除它吗?" @confirm="handleDelete(scope.row)">
            <template #reference>
              <el-button size="small" type="danger">删除</el-button>
            </template>
          </el-popconfirm>
        </template>
      </el-table-column>
<!--功能暂不完善-->
      <el-table-column align="center" width="150px" v-if="user.role === 2">
        <template #default="scope">
          <el-button type="primary" size="small" @click="addBookShelf(scope.row)">加入书架</el-button><br>
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
    <el-dialog v-model="dialogVisible" title="填写信息" width="30%" :before-close="handleClose">
<!--      信息填写区域-->
      <el-form :model="form" label-width="120px">
        <el-form-item label="书名">
          <el-input v-model="form.name" style="width: 80%;height: 70%"/></el-form-item>
        <el-form-item label="价格">
          <el-input v-model="form.price" style="width: 80%;height: 70%"/></el-form-item>
        <el-form-item label="作者">
          <el-input v-model="form.author" style="width: 80%;height: 70%"/></el-form-item>
        <el-form-item label="出版日期">
          <el-date-picker value-format="YYYY-MM-DD" type="date" v-model="form.createTime" clearable style="width: 80%;height: 70%" /></el-form-item>
        <el-form-item label="封面">
          <el-upload action="/api/files/upload" :on-success="fileUploadSuccess">
            <el-button type="primary">点击上传</el-button>
<!--            <template #tip>-->
<!--              <div class="el-upload__tip">-->
<!--                jpg/png files with a size less than 500KB.-->
<!--              </div>-->
<!--            </template>-->
          </el-upload>
        </el-form-item>
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="dialogVisible = false">取消</el-button>
          <el-button type="primary" @click="save">确定</el-button>
        </span>
      </template>
    </el-dialog>
  </div>
</template>

<script>


import request from "@/utils/request";

export default {
  name: 'Book',
  components: {

  },
  data() {
    return {
      user:{},
      form:{},
      bookShelf:{
      },
      dialogVisible:false,
      search:'',
      currentPage4:1,
      pageSize:5,
      total:0,
      tableData:[]
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
    fileUploadSuccess(res) {
      console.log(res)
      this.form.cover=res.data
    },
    load() {
      request.get("/book", {
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
    },
    save() {
      this.dialogVisible = false

      if(this.form.id) {//修改
        request.put("/book",this.form).then(res =>{
          console.log(res)

          if(res.code === '0') {
            this.$message.success("修改成功")
          } else {
            this.$message.error(res.message)
          }
        })
      } else {//新增
        request.post("/book",this.form).then(res =>{
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
    handleEdit(row) {
      this.form = JSON.parse(JSON.stringify(row))
      console.log(this.form)
      this.dialogVisible = true
    },
    handleDelete(book) {  //删除
      console.log(book.id)
      request.delete("/book/"+book.id).then(res=>{

        if(res.code === '0') {
          this.$message.success("删除成功")
        } else {
          this.$message.error(res.message)
        }
      })
      this.load()
    },
    //加入书架
    addBookShelf(row) {
      this.form = JSON.parse(JSON.stringify(row))
      console.log(this.form,this.user)
      //将数据封装
      this.bookShelf.bName = this.form.name
      this.bookShelf.bPrice = this.form.price
      this.bookShelf.bAuthor = this.form.author
      this.bookShelf.bCover = this.form.cover
      this.bookShelf.uId = this.user.id

      request.post("/bookShelf",this.form).then(res =>{
        console.log(res)

        if(res.code === '0') {
          this.$message.success("已加入书架")
        } else {
          this.$message.error(res.message)
        }
      })
    },
    //移除书架
    handleSizeChange() { //改变每页的个数触发
      this.load()
    },
    handleCurrentChange() { //改变当前页码触发
      this.load()
    }
  }
}
</script>
