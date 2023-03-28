<template>
  <div :style="background" class="bgBackground">
    <div class="text"><h2>真正的书籍应是黑夜和沉默的产物，<br/>而不是白昼和闲聊的果实。</h2><div>——马塞尔•普鲁斯特</div></div>
    <div style="width: 350px;height:400px;margin: 150px auto; padding: 20px; margin-right: 10%; border-radius: 15px;float: right;background: rgba(255,255,255,0.3);">
      <div style="color: rgba(255,255,255,0.3);font-size: 30px;text-align: center; margin-bottom: 30px">欢迎注册</div>
      <el-form :model="form" ref="form" size="normal" :rules="rules">
        <el-form-item prop="username">
          <el-input style="width: 80%" prefix-icon="User" v-model="form.username" placeholder="请输入用户名"></el-input>
        </el-form-item>
        <el-form-item prop="password">
          <el-input style="width: 80%"  prefix-icon="Lock" v-model="form.password" show-password placeholder="请输入密码"/>
        </el-form-item>
        <el-form-item prop="confirm">
          <el-input style="width: 80%" prefix-icon="Lock" v-model="form.confirm" show-password placeholder="请再次输入密码"/>
        </el-form-item>
        <el-form-item>
          <div style="display: flex;margin-top: 10px">
            <el-input prefix-icon="Key" v-model="form.validCode" style="width: 70%" placeholder="请输入验证码"/>
            <ValidCode @input="createValidCode"></ValidCode>
          </div>
        </el-form-item>
        <div style="text-align: center;margin-top: 40px">
        <el-button style="width: 50%" type="primary" @click="register" @keyup.enter="register">
          <el-icon style="vertical-align: middle">
            <Search />
          </el-icon>
          <span style="vertical-align: middle">注册</span>
        </el-button>
          <el-button type="success" style="float:right;width: 40%" @click="$router.push('/login')">去登录&nbsp;<el-icon><RefreshLeft /></el-icon></el-button>
        </div>
      </el-form>
    </div>
  </div>
</template>

<style scoped>
/*@import url(../125/125.css);!*导入css样式*!*/
.bgBackground{
  width: 100%;
  height: 750px;
  position: relative;
  background-blend-mode: multiply;
  background-color: rgba(0,0,0,0.3);
}
.text{
  color: rgba(255,255,255,0.5);
  position: absolute;
  left: 300px;
  top: 250px;
}
.text div{
  margin-top: 15px;
  float: right;
}
</style>

<script>
import request from "@/utils/request";
import ValidCode from "@/components/ValidCode";

export default {
  name: "Register",
  components: {ValidCode},
  data(){
    return {
      form:{
        address:'长沙市',
        nickName:'游客',
        role:2
      },
      rules:{
        username:[
          {required: true, message: '请输入用户名', trigger: 'blur'},
        ],
        password:[
          {required: true, message: '请输入密码', trigger: 'blur'},
        ],
        confirm:[
          {required: true, message: '请确认密码', trigger: 'blur'},
        ]
      },
      background: {
        // 背景图片地址
        backgroundImage: 'url(' + require('../assets/book5.jpg') + ')',
        // 背景图片是否重复
        backgroundRepeat: 'no-repeat',
        // 背景图片大小
        backgroundSize: 'cover',
        // 背景颜色
        // backgroundColor: '#000',
        // 背景图片位置
        backgroundPosition: 'center top'
      },

      validcodes:'',
    }
  },
  methods:{

    //接收验证码组件提交的四位验证码
    createValidCode(data) {
      this.validcodes=data
    },

    register() {

      if(this.form.password !== this.form.confirm) {
        this.$message.error("两次密码输入不一致")
        return
      }

      this.$refs['form'].validate((valid)=>{
        if(valid) { //验证规则合法才执行

          if(!this.form.validCode) {
            return this.$message.error("请输入验证码");
          }
          if(this.form.validCode.toLowerCase() !== this.validcodes.toLowerCase()) {
            return this.$message.error("验证码错误");
          }

          request.post("/user/register",this.form).then(res=>{
            console.log(res)
            if(res.code === '0') {
              this.$message.success("注册成功")
              this.$router.push("/") //登陆成功通过router进行跳转
            } else {
              this.$message.error(res.message)
              this.$router.replace("/register")
            }
          })
        }
      })

    },
    //点击回车键登录
    keyDown(e) {
      if(e.keyCode === 13) {
          this.register()
      }
    }
  },
  //挂载前绑定监听事件
  mounted() {
    window.addEventListener("keydown",this.keyDown);
  },
  //销毁后销毁监听事件
  destroyed() {
    window.removeEventListener("keydown",this.keyDown,false);
  }
}

</script>

