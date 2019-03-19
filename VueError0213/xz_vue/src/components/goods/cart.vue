<template>
<div class="app-cart">
<br><br>
<div class="mui-card">  
<div class="mui-card-content">
<div class="mui-card-content-inner">
    <div class="mui-card-header">
    <!-- allcb为全选的状态，true为选中，为false为清空； -->
    <h5><input type="checkbox" name="" id="" class="inp_left" disabled>全选</h5> 
    购物车列表清单
</div>
<ul class="mui-table-view">
<li class="mui-table-view-cell mui-media pad" style="padding:10px 9px 10px 5px" v-for="(item,i) of list" :key="item.id">
    <a href="javascript:;">
        <img class="mui-media-object mui-pull-left">
        <div class="mui-media-body">
            <p class='mui-ellipsis'>	
            <input type="checkbox" disabled>
                <img :src="item.home_img" alt="" style="width:60px;height:45px;">
            <span class="text">{{item.pname}} </span> 
             共:<span style="color:red">{{item.count}}</span>个     
             ￥:<span style="color:red">{{item.price.toFixed(2)}}</span>   
            <span class="btn_link btn1" :data-id="item.id" :data-arrid="i"  @click="deletelist" >删除</span>
            </p>
        </div>
    </a>
</li>
</ul>
</div>
</div>
<div class="mui-card-footer">
    <button @click="dis">删除选中的商品</button>
    <span style="color:red;font-size:19px"><span style="black;">合计:</span> {{num.toFixed(2)}}</span>    
</div>
<mt-button class="btn" style="background:rgb(255, 121, 55);color:white"  size="large" >去结算</mt-button>
</div>
</div>
</template>
<script>
 import {Toast} from "mint-ui";
export default {
    data(){
        return{
            list:[],
            num:0
        }
    },
    methods: {
        getcart(){
            var url="http://127.0.0.1:3000/cartlist";
            this.axios.get(url).then(result=>{
                // console.log(result)
                this.list=result.data.data
                //设置底部导航栏中的数据
                if(result.data.code==-1){
                    // console.log("成都")
                     this.$store.commit("updatedCount",0)
                }else{
                    var s=this.list.length;
                    this.$store.commit("updatedCount",s)
                }
                // console.log(this.list)
                // console.log(this.list[0].monery)
                // 计算商品价格的总和;
                for(var i of this.list){
                    // console.log(i.monery)
                    var m=parseInt(i.monery)
                    this.num+=m
                    // this.num+=monery;
                }
            })
        },
        deletelist(e){
            var id=e.target.dataset.id //获取此商品在购物车中的id,用于删除数据库中对应的商品
            var arrid=e.target.dataset.arrid;   //获取此购物车数组的下标的id,用于删除数组中的元素,
            // console.log(id)
            // console.log("数组的arrid="+arrid)
            var url="http://127.0.0.1:3000/deletelist?id="+id;
            this.axios.get(url).then(result=>{
                // console.log(result)
                if(result.data.code==1){
                    Toast(result.data.msg);                 
                    this.list.splice(arrid,1);
                     history.go(0)
                }else{
                    Toast(result.data.msg)
                }
            })
        },
        dis(){
            Toast("此功能暂时未开放!!!")
        }
    },
    created() {
        this.getcart()
    }
    }
</script>
<style scoped>
  #app-cart  .pad{
      padding:0px;
  }
#app-cart  .text{
    /* padding: 0px */
    padding: 100px
}
.btn_link{
    float:right;
    display: inline;
    padding-top: 30px;
    color: rgb(212, 74, 24);
    font-weight: bold;
    border:0px;
    background: #fff
}
</style>
