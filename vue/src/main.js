import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
//组件中文
import 'dayjs/locale/zh-cn'
import locale from 'element-plus/lib/locale/lang/zh-cn'

import '@/assets/css/global.css'
import axios from '@/utils/axios-0.18.0.js'
import SlideVerify from 'vue-monoplasty-slide-verify'


// 如果您正在使用CDN引入，请删除下面一行。
import * as ElementPlusIconsVue from '@element-plus/icons-vue'
const app = createApp(App)

app.use(store).use(router).use(SlideVerify).use(ElementPlus,{locale,size:'small'}).mount('#app')

for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
    app.component(key, component)
}

// 前端跨域访问后端接口, 在浏览器的安全策略下默认是不携带cookie的, 所以每次请求都开启了一次新的会话
axios.defaults.withCredentials = true; //开启携带cookie

