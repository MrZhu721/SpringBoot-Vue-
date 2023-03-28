<template>
<div>
  <div style="margin: 10px 10px; text-align: center">
    <el-row :gutter="10">
      <el-col :span="5" v-for="item in tableData" :key="item.id" style="margin: 10px 10px;">
        <div style="border: 1px solid #ccc; padding-bottom: 10px; width: 200px;height: 300px;background-color: lightyellow;border-radius: 15px; overflow: hidden">
          <img :src="item.bcover" alt="" style="width: 200px;height: 200px;"/>
          <div style="color: #666; padding: 5px;font-size: 18px;">{{item.bname}}</div>
          <div style="color: #cccccc; padding: 5px;font-size: 20px;">{{item.bprice}} ￥</div>
          <el-popconfirm title="该操作不可撤销,你确定要移除它吗?" @confirm="delBookShelf(scope.row)">
            <template #reference>
              <el-button size="small" type="danger">移除书架</el-button>
            </template>
          </el-popconfirm>
        </div>
      </el-col>
    </el-row>
  </div>
</div>
</template>

<script>


import request from "@/utils/request";

export default {
  name: 'BookShelf',
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
    load() {
      request.get("/bookShelf", {
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
    //移除
    delBookShelf() {

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

<style scoped>

</style>