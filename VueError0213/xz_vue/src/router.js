import Vue from 'vue'
import Router from 'vue-router'
//ES6

//import App from './App.vue'
import Home from './components/tabbar/Home.vue'
import GoodList from './components/goods/GoodList.vue'
//notfont不存在
import NotFound from './components/NotFound.vue'
// 搜索页面Select
import Select from "./components/select/Select.vue"
//新闻消息展示页面
import NewsList from "./components/news/NewsList.vue"
//新闻消息的详情页
import NewsInfo from "./components/news/NewsInfo.vue"
//用户注册
import Sigin from "./components/Admin/sigin.vue"
//登录页面
import Login from "./components/Admin/login.vue"
//用户的详情页
import Myself from "./components/Admin/myself.vue"
//购物车中的商品
import Cart from "./components/goods/cart.vue"
//此功能暂未开放
import Unknown from "./components/Admin/Unknown.vue"
//搜索的详情页
import Select_info from "./components/select/Select_info.vue"
Vue.use(Router)

export default new Router({
  // base: process.env.BASE_URL,
  routes: [
    {path:'/',redirect:"/Home"},
    {path:'/Home',component:Home},
    {path:'/GoodList',component:GoodList},
    {path:'/Select',component:Select},
    {path:'/NewsList',component:NewsList},
    {path:'/NewsInfo',component:NewsInfo},
    {path:'/Sigin',component:Sigin},
    {path:'/Login',component:Login},
    {path:'/Myself',component:Myself},
    {path:'/Cart',component:Cart},
    {path:'/Unknown',component:Unknown},
    {path:'/Select_info',component:Select_info},
    { path:'/*', component:NotFound}
  ]
})
