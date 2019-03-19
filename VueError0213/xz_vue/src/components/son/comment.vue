<template>
<div class="app-comment">
<div class="mui-card">
<div class="mui-card-content">
<div class="mui-card-content-inner">
  <textarea name=""  v-model="msg" cols="5" rows="3" placeholder="请输入评论内容最多120字..." maxlength="120">
</textarea>
  <mt-button type="primary" size="large" @click="comment">发表评论</mt-button>
</div>
</div>
</div>
<div class="mui-card-footer" style="background:#fff;margin:0px 10px 2px 10px;box-shadow:0 1px 2px rgba(0, 0, 0, .3)" v-for="item of list" :key="item.id">
  <div class="cmt-list">
    <div class="cmt-item">
      <div><span style="color:#0aaeed">评论员:</span>
        <span class="ctm-col" style="color:#300;font-size:17px">{{item.uname}}</span> <br>
        <span style="color:#0aaeed">发表时间:</span> 
        
        <span style="font-size:15px">{{item.ctime|datetimeFilter}}</span>
      </div>
      <span style="color:#0aaeed;font-size:17px">发表内容:</span>
      <span class="cmt-com1"> {{item.content}}</span>
    </div>
  </div>
</div> 
    <br><br><br>
</div>
</template>
<script>
import {Toast} from "mint-ui";
export default {
data(){
  return{
    msg:'',
    list:[]
  }
},
methods: {
comment(){
  // 评论不能为空！
  var msg=this.msg;
  if(msg.trim().length==0){
    Toast("请说出你的真心话白");
    return;
  }
  //登录后在进行评论！！
  var pid=this.$route.query.pid
  var url="http://127.0.0.1:3000"
      url+="/comment?msg="+this.msg;
      url+="&pid="+pid;
      // console.log(url)
  this.axios.get(url).then(result=>{
    if(result.data.code==0){
      Toast("请先登录后在评论吧")
      return;
    }else{
      Toast("评论成功！！")
      this.msg="";
      this.getcomment()
    }
  })
  },
  //获取用户评论的内容！！
  getcomment(){
  var pid=this.$route.query.pid
  var url="http://127.0.0.1:3000/getcomment?pid="+pid;
  this.axios.get(url).then(result=>{
      // console.log(result)
      this.list=result.data.data
  })
  }
},
created() {
  this.getcomment()
},
}
</script>
<style scoped>
#app-comment .mui-card-footer{
  background: teal !important;
}
</style>

