<template>
<div id="app-sigin">
<div class="form">
  <input type="text" placeholder="用户名(3-10个字符)" id="uname" v-model="uname"><br>
  <input type="text" placeholder="你的邮箱" id="email" v-model="email"><br>
  <input type="password" placeholder="新密码(6-8位)" id="upwd" v-model="upwd"><br>
  <input type="password" placeholder="确认密码" id="upwds" v-model="upwds"><br>
  <mt-button type="primary" size="large" @click="sigin">注册</mt-button>
</div>
</div>
</template>
<script>
import {Toast} from "mint-ui";
export default {
data(){
  return{
    uname:'',
    email:'',
    upwd:'',
    upwds:''
  }
},
methods: {
  sigin(){
    var postData=this.qs.stringify({
    uname:this.uname,
    email:this.email,
    upwd:this.upwd,
    upwds:this.upwds
    });
    var uname=this.uname;
    var email=this.email;
    var upwd=this.upwd;
    var upwds=this.upwds;
    var u=/^[a-z]{3,6}$/
    if(uname.trim().length==0){
      Toast("用户名3-10位字母")
      return ;
    }
    var reg=/^\w+@[a-zA-Z0-9]{2,10}(?:\.[a-z]{2,4}){1,3}$/
    if(!reg.test(email)){
      Toast("用户邮箱不能为空！并且注意使用@和.")
      return;
    }
    var p=/^(\w){6,20}$/
    if(!p.test(upwd)){
      Toast("用户密码不能为空，并包含字母，数字，下划线的6到8位字符")
      return;
    }
    if(upwds!=upwd){
      Toast("两次密码不一致！！")
      return
    }
    var url="http://127.0.0.1:3000/sigin";
    this.axios.post(url,postData).then(result=>{
      if(result.data.code==1){
        Toast("恭喜注册成功,并跳转到登录页面!")
        uname="";
        email="";
        upwd="";
        upwds="";
        this.$router.push("/Login")
      }else{
        Toast("注册失败！！！")
      }
    })
  }
  },
}
</script>
<style scoped>
#app-sigin .mui-card-content-inner{
  top:20px;
}
.form{
  margin: 50px 10px 10px 10px;
  background: #fff;
  border-radius: 4px;
  text-align: center;
}
#app-sigin input{
  margin-top: 14px;
  width: 90%;
}
</style>
