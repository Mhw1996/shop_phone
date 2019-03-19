<template>
    <div id="app-myself">
    <br><br>
    <div class="header1">
        <img src="../../.././public/img_web/myself/用户.png" alt="" class="img">
        <router-link to="/Login" v-if="!uname">
            <span class="span1">未登录/登录一下</span>
        </router-link>
        <span v-else>{{uname}}
            <span  class="logout" @click="logout()">
            退出登录
        </span></span>
        
    </div>
    <div class="body1">
        <p style="color:#000;padding:10px;margin:0px;font-size:15px">我的订单</p>
    </div>
    <div class="box">
        <div class="imgbox">
           <router-link to="/Unknown"> <img src="../../.././public/img_web/myself/q01.png" alt=""><p>待付款</p></router-link>
        </div>
        <div class="imgbox">
           <router-link to="/Unknown"> <img src="../../.././public/img_web/myself/s01.png" alt=""><p>待收货</p></router-link>
        </div>
        <div class="imgbox">
           <router-link to="/Unknown"> <img src="../../.././public/img_web/myself/d01.png" alt=""><p>待评价</p></router-link> 
         </div>   
        <div class="imgbox">
           <router-link to="/Unknown"> <img src="../../.././public/img_web/myself/x01.png" alt=""><p>退换修</p></router-link>
        </div>
    </div>
    <!-- 轮播子组件 -->
    <mt-swipe :auto="3000" id="ex01">
    <mt-swipe-item v-for="item of list"  :key="item.id">
      <router-link to="">
        <img :src="item.swipe_img" alt="">
      </router-link>
    </mt-swipe-item>
  </mt-swipe>
  <!-- 优惠卷列表 -->
<div class="title">
</div>
<ul class="mui-table-view mui-table-view-chevron">
<li class="mui-table-view-cell mui-media">
    <a class="mui-navigate-right" @click="jumpUnknown()">
        <img class="mui-media-object mui-pull-left" src="../../.././public/img_web/myself/wodeyouhuijuan01.png">
        <div class="mui-media-body">
            <p class='mui-ellipsis'>优惠卷</p>
        </div>
    </a>
</li>
<li class="mui-table-view-cell mui-media">
    <a class='mui-navigate-right'  @click="jumpUnknown()">
        <img class="mui-media-object mui-pull-left" src="../../.././public/img_web/myself/我的钱包.png">
        <div class="mui-media-body">
            <p class='mui-ellipsis'>我的钱包</p>
        </div>
    </a>
</li>
<li class="mui-table-view-cell mui-media">
    <a class="mui-navigate-right" @click="jumpUnknown()">
        <img class="mui-media-object mui-pull-left" src="../../.././public/img_web/myself/会员中心.png">
        <div class="mui-media-body">
            <p class='mui-ellipsis'>会员中心</p>
        </div>
    </a>
</li>
<li class="mui-table-view-cell mui-media">
    <a class="mui-navigate-right" @click="jumpUnknown()">
        <img class="mui-media-object mui-pull-left" src="../../.././public/img_web/myself/服务中心.png">
        <div class="mui-media-body">
         <p class='mui-ellipsis'>服务中心</p>
        </div>
    </a>
</li>
<li class="mui-table-view-cell mui-media">
    <a class="mui-navigate-right" @click="jumpUnknown()">
        <img class="mui-media-object mui-pull-left" src="../../.././public/img_web/myself/家居.png">
        <div class="mui-media-body">
        <p class='mui-ellipsis'>小米之家</p>
        </div>
    </a>
</li>
<li class="mui-table-view-cell mui-media">
    <a class="mui-navigate-right"  @click="jumpUnknown()">
        <img class="mui-media-object mui-pull-left" src="../../.././public/img_web/myself/会员中心.png">
        <div class="mui-media-body">
            <p class='mui-ellipsis'>会员中心</p>
        </div>
    </a>
</li>
<li class="mui-table-view-cell mui-media" >
    <a class="mui-navigate-right" @click="jumpUnknown()">
        <img class="mui-media-object mui-pull-left" src="../../.././public/img_web/myself/更多.png">
        <div class="mui-media-body">
            <p class='mui-ellipsis'>更多...</p>
        </div>
    </a>
</li>
</ul>
    <br><br>
    </div>
</template>
<script>
  import {Toast} from "mint-ui";
export default {
data(){
    return{
        list:[],
        uname:''
    }
},
methods: {
    getuname(){
//获取用户登录后的用户名,已经获取到了,只需要根据用户的用户名是否获取到来判断用户的状态,从而显示用户此时的信息
//当用户登录后通过sessionStrage.setItem("uname",this.uname)来发送用户的信息
//通过sessionStorage.getItem("uname")来接收信息,
//通过sessionStorage.removeItem("uname")来移除用户的信息;
//登录后发送->任意一个页面接收->退出登录
    // var uname=sessionStorage.getItem("uname");
    // console.log(uname)
    var url="http://127.0.0.1:3000/myself";
    this.axios.get(url).then(result=>{
        if(result.data.code==-1){
            // console.log("没有登录")
            return;
        }else{
            // console.log(result)
            this.uname=result.data.data[0].uname;
        }
    })
    },
swipeImg(){
    var url="http://127.0.0.1:3000/swipe_img"
    this.axios.get(url).then(result=>{
    this.list=result.data;
    //console.log(this.list)
    })
},
jumpUnknown(){
    this.$router.push("/Unknown")
},
logout(){
    var url="http://127.0.0.1:3000/logout"
    this.axios.get(url).then(result=>{
        this.$router.go(0)
        Toast("已退出!")
    })
}
},
created() {
    this.getuname();
    this.swipeImg()

    },
}
</script>
<style scoped>
#app-myself .header1{
    background: #ffa250;
}
#app-myself .img{
    vertical-align:middle;
    padding: 12px;
}
#app-myself .span1{
    color: aliceblue;
}
#app-myself .body1{
    background: #fff;
    box-shadow:1px 2px 4px #ddd;
}
#app-myself .box{
    display: flex;
    flex-wrap:wrap;
    justify-content:space-around;
    background: #fff;
    box-shadow:1px 2px 4px #ddd;
}
#app-myself .imgbox{
    flex-direction:flex;
    justify-content:space-around;
    align-items: center;
    padding-top:10px;
}
#app-myself .mint-swipe[data-v-0d182a30]{
  height:200px;
}
#app-myself .mint-swipe{
  height: 120px;
}
#app-myself .mint-swipe img{
  width: 100%;
  height: 120px;
  border: 1px solid rgb(226, 225, 225);
}
#app-myself ul p{
    margin-top:10px;
}
/*退出登录*/
#app-myself .logout{
    float:right;margin-top:26px; margin-right:10px;color:#eee
}
</style>
