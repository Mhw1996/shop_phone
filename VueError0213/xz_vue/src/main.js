import Vue from 'vue'
import App from './App.vue'
import router from './router'
// import store from './store'
//设置全局数据共享
//01引入vuex 
import Vuex from "vuex"
//02注册vuex组件
Vue.use(Vuex)
//03创建store对象
var  store=new Vuex.Store({
  state:{//保存全局数据的属性
    cartCount:sessionStorage.getItem("cartCount")||0 //共享的数据是指：购物车中商品的数量；初始值为零；
  },
  mutations:{//操作修改数据的属性
    // 购物车中数量加一，点击商品详情（加入购物车）
    increment(state){
      state.cartCount++;
    },
    //显示购物车列表时
    updatedCount(state,count) {
      state.cartCount=count;
      sessionStorage.setItem("cartCount",count)
    },
  },
  //获取购物车中数量的方法；
  getters:{//获取数据的方法
    optCartCount:function(state){
      return state.cartCount;//返回全局的共享数据
    }
  }
})



//引入mint-ui样式文件；
import 'mint-ui/lib/style.css'
import './lib/mui/css/mui.css'
import './lib/mui/css/icons-extra.css'
//引入mint-ui组件 
import {Swipe,SwipeItem,Button} from "mint-ui"
//注册mint-ui组件
Vue.component(Swipe.name,Swipe)//注册轮播图的组件
Vue.component(SwipeItem.name,SwipeItem)//注册轮播图的组件
Vue.component(Button.name,Button)//注册一个按钮的组件
Vue.config.productionTip = false
//使用axios的方式发送请求，三步
//（1）引入axios库；
  import axios from "axios";
//（2）配置跨域访问，并保存session信息
  axios.defaults.withCredentials=true;
//（3）将axios库配置到vue实例对象中
  Vue.prototype.axios=axios
//（4）当使用post请求时,可以引入qs模块的方式，解析成对象的形式
  import qs from "qs";
//（5）将qs模块配置到Vue实例对象中
  Vue.prototype.qs=qs
  //创建一个时间的过滤器
  Vue.filter("datetimeFilter",function(val){
    //创建日期对象
    var date=new Date(val);
    //获取年月日，时分秒，
    var y=date.getFullYear(); 
    var m=date.getMonth()+1;
    var d=date.getDate();
    var h=date.getHours();
    var mi=date.getMinutes();
    var s=date.getSeconds();
    //返回字符串y-m-d; h:mi:s
    m<10&&(m="0"+m)
    d<10&&(d="0"+d)
      return `${y}年${m}月${d}日 ${h}时${mi}分${s}秒`
  })
new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
