"use strict";(self["webpackChunkspring_vue_demo"]=self["webpackChunkspring_vue_demo"]||[]).push([[375],{5375:function(e,l,a){a.r(l),a.d(l,{default:function(){return C}});var o=a(6252);const t={style:{padding:"10px"}},d={style:{margin:"10px 0"}},s=(0,o.Uk)("查询"),r=(0,o.Uk)("新增"),i={key:0},m={key:1},n=(0,o.Uk)("编辑"),u=(0,o.Uk)("删除"),p={style:{margin:"10px 0"}},h=(0,o.Uk)("男"),g=(0,o.Uk)("女"),c={class:"dialog-footer"},f=(0,o.Uk)("取消"),b=(0,o.Uk)("确定");function w(e,l,a,w,V,W){const k=(0,o.up)("el-input"),_=(0,o.up)("el-button"),C=(0,o.up)("el-table-column"),y=(0,o.up)("el-popconfirm"),U=(0,o.up)("el-table"),z=(0,o.up)("el-pagination"),x=(0,o.up)("el-form-item"),v=(0,o.up)("el-radio"),S=(0,o.up)("el-form"),D=(0,o.up)("el-dialog");return(0,o.wg)(),(0,o.iD)("div",t,[(0,o._)("div",d,[(0,o.Wm)(k,{modelValue:V.search,"onUpdate:modelValue":l[0]||(l[0]=e=>V.search=e),placeholder:"请输入用户名关键字",style:{width:"20%"},clearable:""},null,8,["modelValue"]),(0,o.Wm)(_,{type:"primary",style:{"margin-left":"5px"},onClick:W.load},{default:(0,o.w5)((()=>[s])),_:1},8,["onClick"]),(0,o.Wm)(_,{type:"primary",onClick:W.add},{default:(0,o.w5)((()=>[r])),_:1},8,["onClick"])]),(0,o.Wm)(U,{data:V.tableData,border:"",stripe:"",style:{width:"98%"}},{default:(0,o.w5)((()=>[(0,o.Wm)(C,{prop:"id",label:"ID",sortable:""}),(0,o.Wm)(C,{prop:"username",label:"用户名"}),(0,o.Wm)(C,{prop:"password",label:"密码"}),(0,o.Wm)(C,{prop:"nickName",label:"昵称"}),(0,o.Wm)(C,{prop:"age",label:"年龄"}),(0,o.Wm)(C,{prop:"sex",label:"性别"}),(0,o.Wm)(C,{prop:"address",label:"地址"}),(0,o.Wm)(C,{prop:"role",label:"角色"},{default:(0,o.w5)((e=>[1===e.row.role?((0,o.wg)(),(0,o.iD)("span",i,"管理员")):(0,o.kq)("",!0),2===e.row.role?((0,o.wg)(),(0,o.iD)("span",m,"普通用户")):(0,o.kq)("",!0)])),_:1}),(0,o.Wm)(C,{align:"right",width:"140px"},{default:(0,o.w5)((e=>[(0,o.Wm)(_,{type:"primary",size:"small",onClick:l=>W.handleEdit(e.row)},{default:(0,o.w5)((()=>[n])),_:2},1032,["onClick"]),(0,o.Wm)(y,{title:"该操作不可撤销,你确定要删除它吗?",onConfirm:l=>W.handleDelete(e.row)},{reference:(0,o.w5)((()=>[(0,o.Wm)(_,{size:"small",type:"danger"},{default:(0,o.w5)((()=>[u])),_:1})])),_:2},1032,["onConfirm"])])),_:1})])),_:1},8,["data"]),(0,o._)("div",p,[(0,o.Wm)(z,{currentPage:V.currentPage4,"onUpdate:currentPage":l[1]||(l[1]=e=>V.currentPage4=e),"page-size":V.pageSize,"onUpdate:page-size":l[2]||(l[2]=e=>V.pageSize=e),"page-sizes":[5,10,15,20],small:e.small,disabled:e.disabled,background:e.background,layout:"total, sizes, prev, pager, next, jumper",total:V.total,onSizeChange:W.handleSizeChange,onCurrentChange:W.handleCurrentChange},null,8,["currentPage","page-size","small","disabled","background","total","onSizeChange","onCurrentChange"])]),(0,o.Wm)(D,{modelValue:V.dialogVisible,"onUpdate:modelValue":l[11]||(l[11]=e=>V.dialogVisible=e),title:"填写信息",width:"30%","before-close":e.handleClose},{footer:(0,o.w5)((()=>[(0,o._)("span",c,[(0,o.Wm)(_,{onClick:l[10]||(l[10]=e=>V.dialogVisible=!1)},{default:(0,o.w5)((()=>[f])),_:1}),(0,o.Wm)(_,{type:"primary",onClick:W.save},{default:(0,o.w5)((()=>[b])),_:1},8,["onClick"])])])),default:(0,o.w5)((()=>[(0,o.Wm)(S,{model:V.form,"label-width":"120px"},{default:(0,o.w5)((()=>[(0,o.Wm)(x,{label:"用户名"},{default:(0,o.w5)((()=>[(0,o.Wm)(k,{modelValue:V.form.username,"onUpdate:modelValue":l[3]||(l[3]=e=>V.form.username=e),style:{width:"80%",height:"70%"}},null,8,["modelValue"])])),_:1}),(0,o.Wm)(x,{label:"密码"},{default:(0,o.w5)((()=>[(0,o.Wm)(k,{modelValue:V.form.password,"onUpdate:modelValue":l[4]||(l[4]=e=>V.form.password=e),style:{width:"80%",height:"70%"}},null,8,["modelValue"])])),_:1}),(0,o.Wm)(x,{label:"昵称"},{default:(0,o.w5)((()=>[(0,o.Wm)(k,{modelValue:V.form.nickName,"onUpdate:modelValue":l[5]||(l[5]=e=>V.form.nickName=e),style:{width:"80%",height:"70%"}},null,8,["modelValue"])])),_:1}),(0,o.Wm)(x,{label:"年龄"},{default:(0,o.w5)((()=>[(0,o.Wm)(k,{modelValue:V.form.age,"onUpdate:modelValue":l[6]||(l[6]=e=>V.form.age=e),style:{width:"80%",height:"70%"}},null,8,["modelValue"])])),_:1}),(0,o.Wm)(x,{label:"性别"},{default:(0,o.w5)((()=>[(0,o.Wm)(v,{modelValue:V.form.sex,"onUpdate:modelValue":l[7]||(l[7]=e=>V.form.sex=e),label:"男"},{default:(0,o.w5)((()=>[h])),_:1},8,["modelValue"]),(0,o.Wm)(v,{modelValue:V.form.sex,"onUpdate:modelValue":l[8]||(l[8]=e=>V.form.sex=e),label:"女"},{default:(0,o.w5)((()=>[g])),_:1},8,["modelValue"])])),_:1}),(0,o.Wm)(x,{label:"地址"},{default:(0,o.w5)((()=>[(0,o.Wm)(k,{type:"textarea",modelValue:V.form.address,"onUpdate:modelValue":l[9]||(l[9]=e=>V.form.address=e),style:{width:"80%",height:"70%"}},null,8,["modelValue"])])),_:1})])),_:1},8,["model"])])),_:1},8,["modelValue","before-close"])])}var V=a(4471),W={name:"User",components:{},data(){return{form:{},dialogVisible:!1,search:"",currentPage4:1,pageSize:10,total:0,tableData:[]}},created(){this.load()},methods:{load(){V.Z.get("/user",{params:{pageNum:this.currentPage4,pageSize:this.pageSize,search:this.search}}).then((e=>{this.tableData=e.data.records,this.total=e.data.total}))},add(){this.dialogVisible=!0,this.form={}},save(){this.dialogVisible=!1,this.form.id?V.Z.put("/user",this.form).then((e=>{console.log(e),"0"===e.code?this.$message.success("修改成功"):this.$message.error(e.message)})):V.Z.post("/user",this.form).then((e=>{console.log(e),"0"===e.code?this.$message.success("添加成功"):this.$message.error(e.message)})),this.load()},handleEdit(e){this.form=JSON.parse(JSON.stringify(e)),this.dialogVisible=!0},handleDelete(e){console.log(e.id),V.Z["delete"]("/user/"+e.id).then((e=>{"0"===e.code?this.$message.success("删除成功"):this.$message.error(e.message)})),this.load()},handleSizeChange(){this.load()},handleCurrentChange(){this.load()}}},k=a(3744);const _=(0,k.Z)(W,[["render",w]]);var C=_}}]);
//# sourceMappingURL=375.622430bc.js.map