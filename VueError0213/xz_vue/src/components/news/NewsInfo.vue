<template>
  <div id="news-info">
    <div class="mui-card" v-for="item of list" :key="item.nid">
				<div class="mui-card-header">{{item.title}}</div>
				<div class="mui-card-content">
					<div class="mui-card-content-inner">
            <img :src="item.newsimg_url" alt="">
						<img :src="item.newinfo1_url" alt="">
            <img :src="item.newinfo2_url" alt="">
            <img :src="item.newinfo3_url" alt="">
            <img :src="item.newinfo4_url" alt="">
					</div>
				</div>
				<div class="mui-card-footer">
         {{item.content}}
        </div>
			</div>
    <!-- 评论的子组件加载地 -->
    <!-- // 3.调用子组件 -->
    <comment-box></comment-box> 
  </div>
</template>
<script>
// 1；引入子组件
import comment from "../son/comment.vue"
export default {
  data(){
    return{
      list:[],
    }
  },
  methods: {
    getnewsInfos(){
      var pid=this.$route.query.pid
      // console.log(pid)
      var url="http://127.0.0.1:3000/newsInfo?pid="+pid;
      this.axios.get(url).then(result=>{
       this.list=result.data.data;
      //  console.log(this.list)
      })
    }
  },
  created() {
    this.getnewsInfos()
  },
   // 2.注册子组件
    components:{"comment-box":comment }
}
</script>
<style scoped>
  #news-info  .mui-card{
     top:40px;
  }
 #news-info .mui-card-content-inner{
   padding: 2px;
 }
</style>

