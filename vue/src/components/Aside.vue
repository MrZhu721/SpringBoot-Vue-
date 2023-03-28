<template>
  <div>
    <el-menu
        background-color="#545c64"
        text-color="#fff"
        style="width: 200px; min-height: calc(100vh - 50px);"
        :default-active="path"
        router
        class="el-menu-vertical-demo">
      <!--router 路由跳转-->
      <el-sub-menu index="1">
        <template #title>
          <el-icon><Grid /></el-icon><span>系统管理</span>
        </template>
          <el-menu-item v-if="user.role === 1" index="/user"><el-icon><UserFilled /></el-icon>用户信息</el-menu-item>
<!--          <el-menu-item index="/data"><el-icon><Tools /></el-icon>数据信息</el-menu-item>-->
          <el-menu-item index="/news"><el-icon><Tools /></el-icon>新闻信息</el-menu-item>
      </el-sub-menu>

      <el-sub-menu index="2">
        <template #title>
          <el-icon><Grid /></el-icon><span>图书管理</span>
        </template>
        <el-menu-item index="/book"><el-icon><UserFilled /></el-icon>图书信息</el-menu-item>
        <el-menu-item v-if="user.role === 2" index="/bookshelf"><el-icon><GoodsFilled /></el-icon>我的书架</el-menu-item>
      </el-sub-menu>
      <div style="position: fixed;bottom: 0;text-align:center;">
        <h6 style="text-align: center;color: #cccccc">版权:2312394307@qq.com</h6>
      </div>
    </el-menu>


  </div>
</template>

<script>
import request from "@/utils/request";

export default {
  name: "Aside" ,
  data() {
    return{
      path:this.$route.path,
      user:{}
    }
  },
  created() {
    let useStr = sessionStorage.getItem("user") || "{}" //拿到前端缓存会话的json数据
    this.user = JSON.parse(useStr) //将json数据进行转换

    //请求服务端，确认当前登录用户的合法信息
    request.get("/user/" + this.user.id).then(res =>{
      if(res.code === '0') {
        this.user = res.data
      }
    })
  }
}
</script>

<style scoped>

</style>