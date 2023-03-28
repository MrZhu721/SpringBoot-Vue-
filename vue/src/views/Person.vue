<template>
  <div>
    <el-card style="width: 40%; margin: 10px">
      <el-form ref="form" :model="form" label-width="80px" >
        <el-form-item label="用户名">
          <el-input v-model="form.username" disabled/>
        </el-form-item>
        <el-form-item label="昵称">
          <el-input v-model="form.nickName" disabled/>
        </el-form-item>
        <el-form-item label="年龄">
          <el-input v-model="form.age"/>
        </el-form-item>
        <el-form-item label="性别">
          <el-input v-model="form.sex"/>
        </el-form-item>
        <el-form-item label="地址">
          <el-input v-model="form.address" @blur="blur"/>
        </el-form-item>
        <el-form-item label="密码">
          <el-input v-model="form.password" show-password @blur="blur"/>
        </el-form-item>
      </el-form>
      <div style="text-align: center">
        <el-button type="primary" @click="update" :disabled="blur()">保存</el-button>
      </div>
    </el-card>
  </div>
</template>

<script>
import request from "@/utils/request";


export default {
  name: "Person",
  data() {
    return {
      form:{},
      dis:0
    }
  },
  created() {
    let str = sessionStorage.getItem("user") || "{}"
    this.form = JSON.parse(str)
  },
  methods:{
    update() {
      request.put("/user",this.form).then(res =>{
        console.log(res)

        if(res.code === '0') {
          this.$message.success("修改成功")
          sessionStorage.setItem("user",JSON.stringify(this.form))
        } else {
          this.$message.error(res.message)
        }
      })
    },
    blur() {
      if(this.form.address && this.form.password) {
          // console.log(this.form.address,this.form.password,this.dis)
          return 0
      }else {
        // console.log(this.form.address,this.form.password,this.dis)
          return 1
      }
    }
  }

}
</script>

<style scoped>

</style>