<template>
<!-- 商品的详情页 -->
<div class="app-goodlist">
  <!-- 商品的详情 -->
    <div class="mui-card" v-for="item of list" :key="item.pid">
      <div class="mui-card-header mui-card-media" style="height:65vw;">
        <img :src="item.home_img" alt="">
      </div>
      <div class="mui-card-content">
      <div class="mui-card-content-inner">
      <p style="color:#c33c4b">{{item.title}}</p>
      <p style="color: #333;font-size:12px">{{item.content}}</p>
      </div>
      </div>
      <div class="mui-card-footer">
      <a class="mui-card-link">{{item.pname}}</a>
      <a class="mui-card-link">￥：<span style="color:#f00">{{item.price.toFixed(2)}}</span><span styl="color:#000">钢镚</span></a>
      </div>
    <hr>
 
 <!-- 加入购物车加减样式 -->
 <div class="app-btn">
    <div class="mui-numbox" style="margin:10px 10px 0px 10px">
        <button class="mui-btn mui-btn-numbox-minus" type="button" @click="goodsub()" >-</button>
        <input class="mui-input-numbox" type="number" v-model="val" value="0"/>
        <button class="mui-btn mui-btn-numbox-plus" type="button" @click="goodAdd()">+</button>
    </div> 
    <div style="font-size:17px;margin:15px 10px 0px 6px">总计: <span style="color:red">{{monery}}</span>钢镚</div>
</div> 
<mt-button type="danger" size="small" @click="addcart" style="float:right;margin:0px 10px 10px 0px">加入购物车</mt-button>
</div>
<br><br><br><br><br>
</div>
</template>
<script>
 import {Toast} from "mint-ui";
export default {
  data(){
    return{
      list:[],
      pid:this.$route.query.pid,//从地址栏中获取从Home.vue传过来的pid
      val:'1',
      monery:'0.00'
    }
  },
  methods: {
    //根据商品的编号对应的获取商品的详情
    getInfo(){
      var url="http://127.0.0.1:3000/findProduct?pid="+this.pid;
      this.axios.get(url).then(result=>{
        this.list=result.data.data
        // console.log(this.list)
      })
    },
    //点击加号时商品的数量加一
    goodAdd(){
      this.val++;
      this.monery=(this.val*this.list[0].price).toFixed(2)
      // console.log(this.monery)
      // console.log(this.val)
    },
    //点击减号时商品的数量减一;
    goodsub(){
      this.val--;
      this.monery=(this.val*this.list[0].price).toFixed(2)
      // console.log(this.monery)
      if(this.val<1){
        this.val=1;
      }
    },
    //将商品添加至购物车;
    //只需要将商品的pid,购买数量val ,发送给服务器端就行
    addcart(){
      var pid=this.pid;
      var price=this.list[0].price;
      var pname=this.list[0].pname;
      var val=this.val;
      var monery=this.monery;
      // console.log(pid,price,pname,val,monery)
      var url=`http://127.0.0.1:3000/addcart?pid=${pid}&price=${price}&pname=${pname}&val=${val}&monery=${monery}`
      // console.log(url)
      this.axios.get(url).then(result=>{
        // console.log(result)
        //请正确选择商品的数量;
        if(result.data.code==0){
          Toast(result.data.msg);
          return;
        }
        // console.log(result)
        if(result.code>0){
          
          Toast(result.data.msg)
           
        }else{
          Toast(result.data.msg)
          this.getcart()
        }
      })
    },


  // vuex实验

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

  // vuex实验

  },
  created() {
    this.getInfo()
    this.getcart()
  },
}
</script>
<style scoped>
.app-goodlist{
  margin-top: 50px;
}
/* 设置商品展示的样式 */
.app-goodlist .mui-card-header > img:first-child{
    width: 336px;
    height: 226px;
}
/* 添加购物车的样式 */
.app-btn{
  display: flex;
  justify-content:space-between;
  margin-bottom: 10px;
}
</style>
