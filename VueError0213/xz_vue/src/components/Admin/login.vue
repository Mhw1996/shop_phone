
<template>
<div id="app-login">
  <input type="text" placeholder="用户名" v-model="uname" id="uname"><br>
  <input type="password" placeholder="密码" v-model="upwd" id="upwd"><br>
  <mt-button type="primary" size="large" @click="login">登录</mt-button>
  <div class="span1">
    <router-link to="/Unknown"><span>忘记密码?</span></router-link>  
    <router-link to="/Sigin"><span style="float: right;">注册一下</span></router-link> 
  </div>
</div>
</template>
<script>
  import {Toast} from "mint-ui";
export default {
  data(){
    return{
      uname:'',
      upwd:'',
      myself:''
    }
  },
  methods: {
    login(){
      var uname=this.uname;
      var upwd=this.upwd;
      if(uname.trim().length==0){
        Toast("请输入用户名!!!");
        return;
      }
      if(upwd.trim().length==0){
        Toast("请输入密码!!!");
        return;
      }
      var url="http://127.0.0.1:3000";
          url+="/login?uname="+uname;
          url+="&upwd="+upwd
      this.axios.get(url).then(result=>{
        if(result.data.code==1){
          Toast("登录成功!!!");
             this.getcart()
          this.$router.push("/Home")
          // this.myself=result.data.code
          // console.log(this.myself)
        }else{
          Toast("登录失败,请检查用户名及密码")
        }
      })
    },



// vuex测试
getcart(){
            var url="http://127.0.0.1:3000/cartlist";
            this.axios.get(url).then(result=>{
                // console.log(result)
                this.list1=result.data.data
                //设置底部导航栏中的数据
                if(result.data.code==-1){
                 
                     this.$store.commit("updatedCount",0)
                }else{
                    var s=this.list1.length;
                    this.$store.commit("updatedCount",s)
                }
                // console.log(this.list)
                // console.log(this.list[0].monery)
                // 计算商品价格的总和;
                for(var i of this.list1){
                    // console.log(i.monery)
                    var m=parseInt(i.monery)
                    this.num+=m
                    // this.num+=monery;
                }
            })
        }

// vuex测试
  },
  created() {
    this.getcart()
  },
}
</script>
<style scoped>
  #app-login{
    position: relative;
    top: 50px;
    /* border: 1px solid rebeccapurple; */
    background-color: #fff;
    margin: 0px 10px 0px 10px;
    padding:20px 10px 20px 10px;
    box-shadow:1px 2px 4px #ddd;
    border-radius: 4px;
  }
  #app-login input{
    width: 100%;
  }
  .span1{
    padding-top: 18px
  }

</style>
