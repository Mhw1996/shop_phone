<template>
  <div id="app">
    <!-- 1添加公共样式类header导航栏 -->
    <header id="header" class="mui-bar mui-bar-nav">
			<router-link to="" class="mui-action-back  mui-pull-left">
        <span class="mui-icon mui-icon-chat color"></span>
        </router-link> 
        <router-link to="/Select">
			<h1 class="mui-title">
        <span class="mui-icon mui-icon-search"></span> 
        搜索你想拥有商品
      </h1>
      </router-link>
      <router-link to="">
        <span class="mui-icon-extra mui-icon-extra-sweep Scan"></span>
      </router-link>
		</header>
    <!-- 1公共样式类header结束 -->
    <router-view></router-view>
    <!-- 2公共样式类tabber开始 -->
      <nav class="mui-bar mui-bar-tab">
   <a class="mui-tab-item" :style="{color:activeColor}"  @click="jumpHome()">
      <span class="mui-icon mui-icon-home"></span>
      <span class="mui-tab-label ">首页</span>
   </a>
   <a class="mui-tab-item " :style="{color:activeColor1}"  @click="jumpNewsInfo()">
      <span class="mui-icon mui-icon-eye"></span>
      <span class="mui-tab-label">发现新品</span>
   </a>
   <a class="mui-tab-item"  :style="{color:activeColor2}"  @click="jumpCart()">
      <span class=" mui-icon mui-icon-extra mui-icon-extra-cart">
      <span class="mui-badge">{{$store.getters.optCartCount}}</span>
   </span>
      <span class="mui-tab-label">购物车</span>
   </a>
   <a class="mui-tab-item" :style="{color:activeColor3}"  @click="jumpMyself()">
      <span class="mui-icon mui-icon-person"></span>
      <span class="mui-tab-label">我的</span>
   </a>
   </nav> 
    <!-- 2公共样式类tabber结束 -->
  </div>
</template>
<script>
export default {
  data(){
    return{
      activeColor:"red",
      activeColor1:"",
      activeColor2:"",
      activeColor3:""
    }
  },
  methods:{
    jumpHome(){
      this.$router.push("/Home");
      this.activeColor="red";
      this.activeColor1="";
      this.activeColor2="";
      this.activeColor3="";
    },
    jumpNewsInfo(){
      this.$router.push("/NewsList")
      this.activeColor="";
      this.activeColor1="red";
      this.activeColor2="";
      this.activeColor3="";
    },
    jumpMyself(){
      this.$router.push("/Myself")
      this.activeColor1="";
      this.activeColor="";
      this.activeColor2="";
      this.activeColor3="red";
    },
    jumpCart(){
      this.$router.push("/Cart")  
      this.activeColor2="red";
      this.activeColor1="";
      this.activeColor="";
      this.activeColor3="";
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
// vuex中测试

  },
  created() {
    this.getcart() 
  },
}
</script>
<style>
.color{color: rgb(78, 77, 77)}
#app .mui-title{
/* border:1px solid rgb(223, 219, 219); */
  line-height:30px;
  top:7px;
  text-align:left;
  font-size:15px;
  padding-left:10px;
  color: rgb(53, 52, 52);
  border-radius: 2px;
}
#app .Scan{
  float: right;
  margin-top: 12px;
  color: rgb(78, 77, 77)
}
.active{
  color: rgb(238, 0, 0);
}
</style>
