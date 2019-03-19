<template>
<div id="app-newsinfo">
  <div class="mui-card" v-for="item of list" :key="item.id">
      <div class="mui-card-content">
        <div class="mui-card-content-inner">
          <router-link :to="'/Newsinfo?pid='+item.pid">
            <img :src="item.newsimg_url" alt="">
          </router-link>
        </div>
      </div>
      <div class="mui-card-footer">{{item.title}}</div>
      <div class="news-footer"><span>{{item.ctime|datetimeFilter}} </span><span>{{item.point}}阅读</span></div>
    </div>
    <p class="bottom">我是有底线的...</p>
    <p class="bottom">我是有底线的...</p>
</div>
</template>
<script>
export default {
  data(){
    return{
      list:[]
    }
  },
  methods: {
    getnews(){
      var url="http://127.0.0.1:3000/news";
      this.axios.get(url).then(result=>{
        //  console.log(result.data.data)
        this.list=result.data.data;
      })
    },
    
  }, 
  created() {
    this.getnews()
  },
}
</script>
<style scoped>
#app-newsinfo .mui-card-content-inner{
  padding: 0px;
  text-align: center;
}
#app-newsinfo .mui-card{
  margin: 0px 0px 10px 0px;
  top:50px;
}
#app-newsinfo .mui-card-footer{
  color: black;
}
.news-footer{
  display: flex;
  justify-content:space-between;
  padding:3px 10px 4px 10px;
  color: rgb(151, 153, 155);
}
.bottom{margin-bottom: 50px}
</style>
