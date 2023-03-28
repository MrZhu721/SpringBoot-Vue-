<template>
  <div style="padding: 10px">

    <!--    搜索区域-->
    <div style="margin: 10px 0">
      <el-input v-model="search" placeholder="请输入用户名关键字" style="width: 20%" clearable></el-input><!--clearable 清除按钮-->
      <el-button type="primary" style="margin-left: 5px;" @click="load">查询</el-button>
      <el-button type="primary" @click="add">新增</el-button>
    </div>

<!--    表格主体-->
    <el-table :data="tableData" border stripe style="width: 98%">
      <el-table-column prop="id" label="ID" sortable/>
      <el-table-column prop="username" label="用户名" />
      <el-table-column prop="password" label="密码" />
      <el-table-column prop="nickName" label="昵称" />
      <el-table-column prop="age" label="年龄" />
      <el-table-column prop="sex" label="性别" />
      <el-table-column prop="address" label="地址" />
      <el-table-column prop="role" label="角色">
        <template #default="scope">
          <span v-if="scope.row.role === 1">管理员</span>
          <span v-if="scope.row.role === 2">普通用户</span>
        </template>
      </el-table-column>

      <el-table-column align="right" width="140px">
        <template #default="scope">
          <el-button type="primary" size="small" @click="handleEdit(scope.row)">编辑</el-button>
          <el-popconfirm title="该操作不可撤销,你确定要删除它吗?" @confirm="handleDelete(scope.row)">
            <template #reference>
              <el-button size="small" type="danger">删除</el-button>
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

<!--    辅助功能-->
<!--    <div style="margin: 10px 0; float: right">-->
<!--      <el-button type="primary">导入</el-button>-->
<!--      <el-button type="primary">导出</el-button>-->
<!--    </div>-->

<!--    新增对话框-->
    <el-dialog v-model="dialogVisible" title="填写信息" width="30%" :before-close="handleClose">
<!--      信息填写区域-->
      <el-form :model="form" label-width="120px">
        <el-form-item label="用户名">
          <el-input v-model="form.username" style="width: 80%;height: 70%"/></el-form-item>
        <el-form-item label="密码">
          <el-input v-model="form.password" style="width: 80%;height: 70%"/></el-form-item>
        <el-form-item label="昵称">
          <el-input v-model="form.nickName" style="width: 80%;height: 70%"/></el-form-item>
        <el-form-item label="年龄">
          <el-input v-model="form.age" style="width: 80%;height: 70%"/></el-form-item>
        <el-form-item label="性别">
          <el-radio v-model="form.sex" label="男">男</el-radio>
          <el-radio v-model="form.sex" label="女">女</el-radio></el-form-item>
        <el-form-item label="地址">
          <el-input type="textarea" v-model="form.address" style="width: 80%;height: 70%"/></el-form-item>
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
  name: 'User',
  components: {

  },
  data() {
    return {
      form:{
      },
      dialogVisible:false,
      search:'',

      currentPage4:1,//当前页
      pageSize:10,//每页展示数据个数
      total:0,//总页数

      tableData:[]
    }
  },

  created() {//生命周期（钩子）函数
    this.load()
  },

  methods:{
    load() {
      request.get("/user", {
        params:{
          pageNum:this.currentPage4,
          pageSize:this.pageSize,
          search:this.search
        }
      }).then(res =>{
        // console.log(res)
        this.tableData = res.data.records
        this.total = res.data.total
        // console.log(this.currentPage4)
      })
    },
    add() {
      this.dialogVisible=true
      this.form={}
    },
    save() {
      this.dialogVisible = false

      if(this.form.id) {//修改
        request.put("/user",this.form).then(res =>{
          console.log(res)

          if(res.code === '0') {
            this.$message.success("修改成功")
          } else {
            this.$message.error(res.message)
          }
        })
      } else {//新增
        request.post("/user",this.form).then(res =>{
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
      this.dialogVisible = true
    },
    handleDelete(user) {  //删除
      console.log(user.id)
      request.delete("/user/"+user.id).then(res=>{

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
