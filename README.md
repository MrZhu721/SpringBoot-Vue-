# SpringBoot-Vue 的简易实现

## 项目介绍
- 该项目是一个练手级的项目，适合刚入门学习SpringBoot的同学。
- 技术选型经典，采用的都是我们耳熟能详的几大框架进行开发。
- 项目待优化的地方。

## 项目需求
该项目的实现是在线书店的背景下进行研发，旨在解决传统书店运营为人诟病的缺点，优化对大量书籍的管理。

## 技术架构及选型
该项目采用 `B/S` 架构，通过浏览器打开对应端口访问 web 页面，调用对应服务端API进行页面渲染。

- 服务端

|名称|版本|
|:------:|:------:|
|SpringBoot|2.6.6|
|mybatis-plus|3.5.1|
|mysql|5.7|
|maven|3.8.4|
|hutool-all|5.8.0|
|lombok||

- Web端

|名称|版本|
|:------:|:------:|
|Vue|^3.2.~|
|vue-router|^4.0.~|
|vue-cli|^5.0.~|
|node||
|element-plus|^2.2.0|

#### 项目启动
`git` 克隆项目到本地后。

1. 服务端（9090）

```
配置运行主启动类
```
或
```
打成jar包，运行 `java -jar ***.jar`
```

2. 修改数据库连接
```yaml
spring:
  datasource:
    driver-class-name: com.mysql.cj.jdbc.Driver
    url: jdbc:mysql://localhost:3306/数据库名?serverTimezone=UTC&characterEncoding=utf8&Unicode=useSSL=false
    username: 用户名
    password: 密码
```


3. Web端(8080)
```
npm install
npm run serve
```
4. 跨域解决
```js
// 跨域配置
module.exports = {
    devServer: { //记住，别写错了devServer//设置本地默认端口  选填
        // port: 9876,
        proxy: { //设置代理，必须填
            '/api': { //设置拦截器  拦截器格式   斜杠+拦截器名字，名字可以自己定
                target: 'http://localhost:9090', //代理的目标地址
                changeOrigin: true, //是否设置同源，输入是的
                pathRewrite: { //路径重写
                    '^/api': '' //选择忽略拦截器里面的内容
                }
            }
        }
    }
}
```

## 项目心得
- 通过这个项目可以加深对 `springboot` 的理解和 `vue` 框架组件化开发的使用，应付实际应用开发。
- 项目待优化的地方，1.`登录鉴权`，2.`页面懒加载`，3.`数据缓存`。
