<template>
  <div style="height: 50px; line-height: 50px; border-bottom: 1px solid #ccc; display: flex;">
    <span :style="background" class="bgBackground"></span>
    <div style="width: 200px; padding-left: 10px; font-width: blod; color: dodgerblue">电子书城后台管理</div>
    <div style="flex: 1"></div>
    <div style="width: 100px">
      <el-dropdown>
        <span class="el-dropdown-link">
          <br>
          <el-icon><Avatar /></el-icon>
          {{user.nickName}}<el-icon class="right"><ArrowDown /></el-icon>
        </span>
        <template #dropdown>
          <el-dropdown-menu>
            <el-dropdown-item @click="$router.push('/person')"><el-icon><User /></el-icon>个人信息</el-dropdown-item>
            <el-dropdown-item @click="quit"><el-icon><TurnOff /></el-icon>退出系统</el-dropdown-item>
          </el-dropdown-menu>
        </template>
      </el-dropdown>
    </div>
  </div>
</template>

<script>
import request from "@/utils/request";
import {createRouter as $router} from "vue-router";
import router from "@/router";

export default {
  name: "Header",
  data() {
    return{
      user:{},
      background: {
        // 背景图片地址
        backgroundImage: 'url(' + require('../assets/logo2.png') + ')',
        // 背景图片是否重复
        backgroundRepeat: 'no-repeat',
        // 背景图片大小
        backgroundSize: 'cover',
        // 背景图片位置
        // backgroundPosition: 'center top'
      }
    }
  },
  methods:{
    quit() {
      // $router.push('/login')
      router.push('/login')
      sessionStorage.clear()
    }
  },
  created() {
    let userStr = sessionStorage.getItem("user") || "{}"
    this.user = JSON.parse(userStr)
  }
}
</script>

<style scoped>
.bgBackground{
  margin: 15px;
  margin-right: 0px;
  width: 25px;
  height: 25px;
}
</style>