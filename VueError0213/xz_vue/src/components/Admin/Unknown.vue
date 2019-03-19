<template>
    <div id="app-unknown">
        <br><br>
        <img src="../../.././public/img_web/myself/lookforward_img1.png" alt="">
        <p style="color:black;font-size:15px;">此功能暂时未开放,敬请期待!!!</p>
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
    #app-unknown{
        text-align: center;
    }
    #app-unknown img{
        margin-top:130px;
    }
  
    img,p{
        animation-name:jump;
        animation-duration:2s;
        animation-timing-function:ease-in-out;
        /* animation-iteration-count:infinite; */
        animation-direction:alternate;
    }  
    @keyframes jump{
        0%{transform:translateY(0)}
        10%{transform:translateY(-20px)}
        20%{transform:translateY(0)}
        30%{transform:translateY(-20px)}
        40%{transform:translateY(0)} 
        50%{transform:translateY(-15px)}
        60%{transform:translateY(0)}
        70%{transform:translateY(-5px)}
        80%{transform:translateY(0)}
        90%{transform:translateY(-1px)} 
        100%{transform:translateY(0px)}
	}
</style>

