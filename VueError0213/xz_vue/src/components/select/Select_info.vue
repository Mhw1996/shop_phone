<template>
    <div id="select_info">
        <br><br>
    <div class="mui-card" v-for="item of list" :key="item.id">
    <div class="mui-card-header mui-card-media" style="height:63vw;background-image:url(prolist.home_img)">
      <img :src="item.home_img" alt="" class="img1">
    </div>
    <div class="mui-card-content">
    <div class="mui-card-content-inner">
    <p style="color: #333;">{{item.title}}</p>
    </div>
    </div>
    <div class="mui-card-footer">
    <a class="mui-card-link"><h4 class="text">热卖中...</h4> </a>
    <a class="mui-card-link"><h4> ￥{{item.price.toFixed(2)}}$</h4></a>
    </div>
    </div>
    </div>
</template>
<script>
export default {
    data(){
        return{
            list:[]
        }    
    } ,
    methods: {
    getSelect(){
       var pid=this.$route.query.pid
        // console.log(pid)
        var url="http://127.0.0.1:3000/getSelect?pid="+pid;
        this.axios.get(url).then(result=>{
            this.list=result.data.data
        })
        } 
    },
     created() {
         this.getSelect()
     },
}
</script>
<style scoped>
#select_info .img1{
    width: 100%;
    height: 200px;
}
</style>
