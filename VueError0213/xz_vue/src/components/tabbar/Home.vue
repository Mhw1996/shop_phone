<template>
  <div id="app-home">
    <!-- 轮播图开始 -->
  <mt-swipe :auto="3000" id="ex01">
    <mt-swipe-item v-for="item of list"  :key="item.id">
      <router-link to="">
        <img :src="item.swipe_img" alt="">
      </router-link>
    </mt-swipe-item>
  </mt-swipe>
    <!-- 轮播图结束 -->
    <!-- 商品的展示开始部分 -->
    <div class="mui-card" v-for="prolist of pro" :key="prolist.id">
    <div class="mui-card-header mui-card-media" style="height:63vw;background-image:url(prolist.home_img)">
      <img :src="prolist.home_img" alt="" @click="jumpInfo" :data-pid="prolist.pid">
    </div>
    <div class="mui-card-content">
    <div class="mui-card-content-inner">
    <p style="color: #333;">{{prolist.title}}</p>
    </div>
    </div>
    <div class="mui-card-footer">
    <a class="mui-card-link"><h4 class="text">热卖中...</h4> </a>
    <a class="mui-card-link"><h4> ￥{{prolist.price.toFixed(2)}}$</h4></a>
    </div>
    </div>
    <!-- 商品的展示结束部分 -->
    <!-- 加载更多按钮 -->
    <mt-button class="btn" type="primary" size="large" @click="homepro">加载更多...</mt-button>
  </div>
</template>
<script>
export default {
  data(){
    return{
      list:[],//轮播展示商品的图片
      pro:[],//轮播图下面展示商品的图片
      pno:0,  //第一页，
      pageSize:6  //展示6件商品
    }
  },
  methods: {
    swipeImg(){
      var url="http://127.0.0.1:3000/swipe_img"
      this.axios.get(url).then(result=>{
        this.list=result.data;
        //console.log(this.list)
      })
    },
    homepro(){
      //当点击加载更多时，将第一页加一，变成第二页商品的展示；
      this.pno++;
      var url="http://127.0.0.1:3000";
          url+="/home_products?pno="+this.pno
          url+="&pageSize="+this.pageSize;
          this.axios.get(url).then(result=>{
            //获取分页对应的商品的信息，将其存放到，pro数组中，
          // this.pro=result.data.data
          //当点击加载更多后，加载后的商品与加载前的商品应同时都展示在页面中，
           var rows=this.pro.concat(result.data.data);//concat是指将两个数组进行拼接，
            this.pro=rows;//拼接完成后再将拼接后的商品放到pro这个数组中，
      })
    },
    //为图片绑定点击事件，跳转到商品的详情页
    jumpInfo(e){
      var pid=e.target.dataset.pid;
      this.$router.push("/GoodList?pid="+pid)
    }
  },
  created() {
    this.swipeImg(),
    this.homepro()
  },
}
</script>
<style scoped>
/* 轮播图 */
#app-home .mint-swipe[data-v-0d182a30]{
  height:200px;
}
.mint-swipe{
  height: 150px;
}
.mint-swipe img{
  margin-top: 45px;
  width: 100%;
  height: 155px;
  border: 1px solid rgb(19, 197, 188);
}
#app-home .mui-card-header > img:first-child{
  width:340px;
  height: 220px;
}
/* 商品的展示css */
#app-home .mui-card-content-inner{
  padding: 5px;
}
#app-home .mui-card{
  border:1px solid rgb(19, 197, 188);
}
/* 热卖中的样式 */
.text{
  color: rgb(187, 9, 18);
  font-family:"幼圆"
}
/* 加载更多 */
.btn{
  margin:0px 0 55px 0px; 
}
</style>
