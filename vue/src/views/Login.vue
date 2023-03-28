<template>
  <div :style="background" class="bgBackground">
    <div class="text"><h2>书是人类进步的阶梯。</h2><div>——高尔基</div></div>
    <div style="width: 350px;height:400px;margin: 150px auto; padding: 20px; margin-right: 10%; border-radius: 15px;float: right;background: rgba(255,255,255,0.3);">
      <div style="color: rgba(255,255,255,0.3);font-size: 30px;text-align: center; margin-bottom: 30px">欢迎登陆</div>
      <el-form style="margin-top: 50px" :model="form" ref="form" size="normal" :rules="rules"> <!--:rules="rules" 表单校验-->
        <el-form-item prop="username">
          <el-input prefix-icon="User" v-model="form.username" placeholder="请输入账号"/>
        </el-form-item>
        <el-form-item prop="password">
          <el-input prefix-icon="Lock" v-model="form.password" show-password placeholder="请输入密码"/>
        </el-form-item>
        <el-form-item>
          <div style="display: flex;margin-top: 10px">
            <el-input prefix-icon="Key" v-model="form.validCode" style="width: 50%" placeholder="请输入验证码"/>
            <ValidCode @input="createValidCode"></ValidCode>
          </div>
        </el-form-item>
        <div style="text-align: center;margin-top: 40px">
          <el-button style="width: 50%" type="primary" @click="login" @keyup.enter="login">
            <el-icon style="vertical-align: middle">
              <Search />
            </el-icon>
            <span style="vertical-align: middle">登录</span>
          </el-button>

          <el-button type="success" style="float:right; width: 40%" @click="$router.push('/register')">去注册&nbsp;<el-icon><Right /></el-icon></el-button>
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
  color: rgba(255,255,0,0.5);
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

  components:{
   ValidCode
  },
  name: "Login",
  data(){
    return {
      user:{},
      form:{},
      rules:{
        username:[
          {required: true, message: '请输入用户名', trigger: 'blur'},
        ],
        password:[
          {required: true, message: '请输入密码', trigger: 'blur'},
        ]
      },
      validcodes:'',

      // 顶部导航背景图片配置
      background: {
        // 背景图片地址
        backgroundImage: 'url(' + require('../assets/book6.jpg') + ')',
        // 背景图片是否重复
        backgroundRepeat: 'no-repeat',
        // 背景图片大小
        backgroundSize: 'cover',
        // 背景颜色
        // backgroundColor: '#000',
        // 背景图片位置
        backgroundPosition: 'center center'
      }
    }
  },
  methods:{
    //接收验证码组件提交的四位验证码
    createValidCode(data) {
      this.validcodes=data
    },

    login() {
      this.$refs['form'].validate((valid)=>{
        if(valid) { //验证规则合法才执行

          if(!this.form.validCode) {
            return this.$message.error("请输入验证码");
          }
          if(this.form.validCode.toLowerCase() !== this.validcodes.toLowerCase()) {
            return this.$message.error("验证码错误");
          }

          request.post("/user/login",this.form).then(res=>{
            console.log(res)
            if(res.code === '0') {
              this.$message.success("登录成功")
              sessionStorage.setItem("user",JSON.stringify(res.data))//缓存用户信息

              console.log(res.data)
              //请求服务端，确认当前登录用户的合法信息
              request.get("/user/" + this.user.id).then(res =>{
                if(res.code === '0') {
                  this.user = res.data
                }
              })

              if(this.form.role === 1) {
                this.$router.push("/user") //登陆成功通过router进行跳转
              }
                this.$router.push("/news") //登陆成功通过router进行跳转

            } else {
              this.$message.error(res.message)
            }
          })

        }
      })
    },
// 点击回车键登录
    keyDown(e) {
      // 回车则执行登录方法 enter键的ASCII是13
      if (e.keyCode === 13) {
        this.login(); // 定义的登录方法
      }
    },
  },
  mounted() {
    // 绑定监听事件
    window.addEventListener("keydown", this.keyDown);
  },
  destroyed() {
    // 销毁事件
    window.removeEventListener("keydown", this.keyDown, false);
  },
}

</script>

