<template>
<div class="notfound">
  <p><img src="../.././public/img_web/404/404_img1.png" alt="" id="img"><br>
  <img src="../.././public/img_web/404/404_img2.png" alt="">
  </p>
  <h1 class="notText">NotFound!!!</h1>
</div>
</template>

<script>
  export default {
    data(){
      return{}
    }
  }
</script>

<style scoped>
  #img{
    margin-top: 137px;
  }
  p,h1{
    text-align: center;
  }
  .notText{
    font-family: 'Courier New', Courier, monospace;
    color: rgb(236, 194, 27)
  }
</style>