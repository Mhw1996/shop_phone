<template>
  <div id="app-select">
    <!--搜索提示框 -->
    <header id="header" class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" @click="jumpHome"></a>
			<h1 class="mui-title">
        <input type="text" placeholder="红米not7" autofocus="autofocus" v-model="pname">
      </h1>
      <router-link to="">
        <span class="Scan" @click="search">搜索</span>
      </router-link>
		</header>
    <!-- 搜索提示 -->
    <div class="search" >
      <p  v-for="item of list" :key="item.id">
        <span class="pname" @click="jump_select_info" :data-pid="item.pid">
          {{item.pname}}{{item.price}}
        </span> 
      </p>
    </div>
    <!-- 热门搜索 -->
    <div class="mui-card">
				<div class="mui-card-header">更多热门搜索...</div>
				<div class="mui-card-content">
					<div class="mui-card-content-inner">
						<img src="../../.././public/img_web/md/001.jpg" alt="">
            <img src="../../.././public/img_web/md/005.jpg" alt="">
            <img src="../../.././public/img_web/md/002.jpg" alt="">
            <img src="../../.././public/img_web/md/004.jpg" alt="">
					</div>
				</div>
				<div class="mui-card-footer">
          <span> <router-link to="">小米9为你而战...</router-link></span><br>
          <span> <router-link to="">三点晴雨伞...</router-link></span><br>
          <span> <router-link to="">净水滤芯免费领...</router-link></span><br>
          <span> <router-link to="">最生活毛巾...</router-link></span><br>
        </div>
			</div>
  </div>
</template>
<script>
import {Toast} from "mint-ui";
export default {
  data(){
    return{
      pname:'',
      list:[]
    }
  },
  methods: {
    jumpHome(){
     this.$router.push("/Home")
    },
    search(){
      var pname=this.pname
      if(!pname){
        Toast("请输入商品名称！！")
        return;
      }
      // console.log(pname)
      var url="http://127.0.0.1:3000/search?pname="+pname;
      this.axios.get(url).then(result=>{
        console.log(result)
        if(result.data.code==1){
          this.list=result.data.data
          console.log(this.list)
        }
      })
    },
    jump_select_info(e){
      var pid=e.target.dataset.pid
      // console.log(pid)
      this.$router.push("/Select_info?pid="+pid)
    }
    
  },
}

</script>
<style scoped>
  #app-select input{
    width:95%;
    height: 30px;
  }
 #app-select .mui-card{
   top:50px;
   margin-bottom: 200px
 }
 #app-select  img{
   width: 50%;
 }
 #app-select .mui-card-footer{
   display: block;
 }
 #app-select  .search{
   background: #fff;
   position:absolute;
    z-index: 99;
    top: 45px;
    border:1px solid #ddd;
    width: 100%;
    /* height: 100px; */
 }
  #app-select  .pname{
    font-family: "幼圆";
    font-size: 16px;
    padding: 9px 17px 12px 48px;
    color: #3e8c96;
    font-weight: 900;
  }
</style>


