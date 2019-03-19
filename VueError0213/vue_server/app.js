//app.js
//1:加载模块 express pool.js
const express = require("express");
const pool = require("./pool");

//2:创建服务器端对象
var app = express();
//3:监听 3000
app.listen(3000,()=>{
  console.log("服务器创建成功")
});
//4:指定静态目录  public 
app.use(express.static("public"));
//引入cros进行跨域请求
const cors=require("cors")
//配置跨域访问模块，哪个域名跨域访问允许
//脚手架8080允许；
//origin:指允许跨域访问域名的列表；
//credentials跨域访问保存session id
app.use(cors({
  origin:["http://127.0.0.1:8080","http://localhost:8080"],
  credentials:true
}))  
//配置express-session，用于保存用户的uid从而判断用户是否登录
//只需在用户登录成功前获取用户的uid并将其保存在session对象中
//可以使用：var id=result[0].id,req.session.iod=id;
const session=require("express-session");
app.use(session({
  secret:"128位随机字符",//获取安全字符串共128位；
  resave:false,       //是否每次请求的时候都要更新数据，不更新
  saveUninitialized:true,//初始化时保存数据
  cookie:{
    maxAge:1000*60*60*8 //定义保存用户在浏览器浏览的过程中保存的时间是8个小时
  }
}))
//引入模块body-parser，可以进行post请求
const bodyParser=require("body-parser");
//配置对特殊的json是否自动转换-->不转化
app.use(bodyParser.urlencoded({extended:false}))

//功能一、创建轮播图的组件，从phone_shop中获取轮播图的图片
app.get("/swipe_img",(req,res)=>{
  var sql="SELECT * FROM swipe_img";
  pool.query(sql,[],(err,result)=>{
    if(err) throw err
    if(result.length>0){
      res.send(result)
    }else{
      res.send("轮播图片不存在！！！")
    }
   
  })
})
//功能二、home页面中的商品的分页显示；多表查询
//查询home_img中的商品图片的hid,图片home_img与pro_info表中的pid,pname,price,title;
app.get("/home_products",(req,res)=>{
  //分页显示需要用到的两个参数，
  var pno=req.query.pno;
  var pageSize=req.query.pageSize;
  // console.log(pno,pageSize)
  //允许只用默认值
  if(!pno){pno=1};
  if(!pageSize){pageSize=6};
  //创建sql语句
  var sql="SELECT h.hid,h.home_img,p.pid,p.price,p.title FROM home_img h,pro_info p WHERE h.pid=p.pid LIMIT ?,?"
  var qs=parseInt(pageSize);
  var offset=(pno-1)*pageSize;
  // console.log(qs,offset)
  pool.query(sql,[offset,qs],(err,result)=>{
    if(err)throw err;
    res.send({code:1,data:result})
  })
})
//商品的详情页为：GoodList.vue,从Home.vue中拿到商品的pid后，根据拿到的对应商品的pid找到对应的商品
//商品的详情页也包括，当点击添加购物车时，将商品添加至购物车中，
//此为功能三，获取商品的详细信息
app.get("/findProduct",(req,res)=>{
  //先获取地址栏中商品编号pid
  var pid=req.query.pid;
  // console.log(pid)
  var sql="SELECT h.home_img,p.pid,p.price,p.title,p.content,p.pname FROM home_img h,pro_info p  WHERE h.pid=p.pid AND p.pid=?"
  pool.query(sql,[pid],(err,result)=>{
   if(err)throw err;
   if(result.length>0){
     res.send({code:1,data:result})
   }
  })
})
//功能四，新闻展示页
app.get("/news",(req,res)=>{
  var sql="SELECT *FROM news n,newsinfo p WHERE n.nid=p.pid"
  pool.query(sql,[],(err,result)=>{
    // console.log(result);
    if(err) throw err;
    if(result.length>0){
      res.send({code:1,data:result})
    }else{
      res.send({code:0,data:"数据库数据获取出错"})
    }
    
  })
})
//功能五，新闻详情页
app.get("/newsInfo",(req,res)=>{
  var pid=req.query.pid;
  // console.log(pid)
  var sql="SELECT *FROM news n,newsinfo p WHERE n.nid=p.pid AND p.pid=?"
  pool.query(sql,[pid],(err,result)=>{
   if(err) throw err;
   res.send({code:1,data:result})
  })  
})
//功能六、用户的注册post请求，
app.post("/sigin",(req,res)=>{
  var obj=req.body;
  var $uname=obj.uname;
  var $email=obj.email;
  var $upwd=obj.upwd;
  var $upwds=obj.upwds;
  var sql="INSERT INTO sigin VALUES(?,?,?,md5(?),md5(?))";
  pool.query(sql,[null,$uname,$email,$upwd,$upwds],(err,result)=>{
    if(err)throw err;
    if(result.affectedRows>0){
      res.send({code:1,data:"恭喜注册成功！！！"})
    }else{
      res.send({code:0,data:"注册失败，请重新注册！！！"})
    }
  })
})
//功能七、用户的登录功能
app.get("/login",(req,res)=>{
  var obj=req.query;
  var $uname=obj.uname;
  var $upwd=obj.upwd;
  var sql="SELECT * FROM sigin WHERE uname=? AND upwd=md5(?)";
  pool.query(sql,[$uname,$upwd],(err,result)=>{
  if(err)throw err;
  if(result.length>0){
    var uid=result[0].uid;
    // console.log(uid)
    req.session.uid=uid;
    // console.log(req.session.uid)
    res.send({code:1,data:"登录成功!!!"})
  }else{
    res.send({code:0,msg:"登录失败！！！"})
  }
  })
})
//功能八、用户对刚发布的新品进行评论
app.get("/comment",(req,res)=>{
  var obj=req.query;
  var $msg=obj.msg;
  var $pid=obj.pid;
  // console.log($msg,$pid)
  var uid=parseInt(req.session.uid)
  //当用户没有登陆的返回的是nan，当用户登陆后返回的是当前用户的uid
  // res.send("1")
  if(isNaN(uid)){
   res.send({code:0,msg:"请登录后评论"})
    return;
  }else{
    // console.log("登陆成功！！")
    // res.send({code:1,msg:"登录成功！！！"})
    var sql="INSERT INTO news_comment VALUES(?,?,?,now(),?)";
    pool.query(sql,[null,$msg,$pid,uid],(err,result)=>{
      if(err)throw err;
      if(result.affectedRows>0){
        res.send({code:1,msg:"评论成功！！！"})
      }else{
        res.send({code:-1,msg:"评论失败！！！"})
      }
    })
  }
})
//功能九，将用户评论的内容对应的放到评论商品的下面；
app.get("/getcomment",(req,res)=>{
  var $pid=req.query.pid;
  // console.log($pid)
  var sql="SELECT s.uname,n.content,n.ctime FROM news_comment n,sigin s WHERE n.uid=s.uid AND pid=?";
  pool.query(sql,[$pid],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send({code:1,data:result})
    }else{
      res.send({code:-1,date:"小垃圾"})
    }
  })  
})
//功能十、加入购物车，
//(1)没有登陆的用户不能将商品添加至购物车，
//(2)判断购物车中是否已经有了此件商品
//(3)如果已将有了此件商品，将不会再次将此件商品添加至购物车，而是将此件商品的数量增加
//(4)如果没有此件商品，将此件商品添加至购物车中，
//需要获得的信息
//商品的编号pid，添加购物车的用户的uid，商品的价格prices，商品的数量count，商品的名称lname;
app.get("/addcart",(req,res)=>{
  var obj=req.query;
  // console.log(obj)
  var pid=parseInt(obj.pid);
  var uid=parseInt(req.session.uid)
  var count=parseInt(obj.val)
  var pname=obj.pname;
  var price=parseInt(obj.price);
  var monery=parseInt(obj.monery);
  if(monery==0){
    // console.log("禁止加入购物车")
    res.send({code:0,msg:"请正确选择商品数量!!!"})
    return;
  }
  
  //先判断用户是否登录,
  if(isNaN(uid)){
    // console.log("请先登录后再添加购物车中的商品")
    res.send({code:0,msg:"请登录后再进行添加商品!!!"})
    return;
  }else{
    // console.log(pid,uid,count,pname,monery)
    //判断购物车中是否已经添加了此件商品;
    var sql="SELECT id FROM shop_cart WHERE uid=? AND pid=?";
    pool.query(sql,[uid,pid],(err,result)=>{
      if(err) throw err;
      // console.log(result)
      if(result.length==0){
        // res.send({code:-1,msg:"购物车中无此件商品"})
        var sql=`INSERT INTO shop_cart VALUES(?,?,?,?,?,?,?)`
        pool.query(sql,[null,pname,count,price,pid,uid,monery],(err,result)=>{
          if(err) throw err;
          // if(result.affectedRows>0){
          res.send({code:1,msg:"商品添加成功!!!"})
          // }else{
          // res.send({code:-1,msg:"商品添加失败!!"})
          // }
          return;
        })
      }else{
        // res.send({code:1,msg:"购物车中已经存在了此件商品!!!"})
        var sql=`UPDATE shop_cart SET count=${count},monery=${monery} WHERE pid=? AND uid=?`
        pool.query(sql,[pid,uid],(err,result)=>{
          // console.log(result)
          if(err) throw err;
          // if(result.affectedRows>0){
            res.send({code:-1,msg:"商品的数量修改成功!!!"})
          // }else{
          //   res.send({code:-1,msg:"商品数目修改失败!!!"})
          // }
          return;  
        })
      }
    })
  }
})
//功能十一、购物车中的列表清单
app.get("/cartlist",(req,res)=>{
  var uid=req.session.uid;
  var sql="SELECT * FROM shop_cart s,home_img h WHERE s.pid=h.pid AND uid=?"
  pool.query(sql,[uid],(err,result)=>{
    // console.log(result)
    if(err) throw err;
    if(result.length>0){
      res.send({code:1,data:result})
    }else{
      res.send({code:-1,data:result})
    }
  })
})
// 功能十二 删除购物车中的某一件商品
//根据用户的uid,删除其购物车中的某一件商品的id
app.get("/deletelist",(req,res)=>{
    var uid=req.session.uid
    var id=req.query.id;
    // console.log(uid,id)
    var sql="DELETE FROM shop_cart WHERE uid=? AND id=? ";
    pool.query(sql,[uid,id],(err,result)=>{
      if(err) throw err;
      // console.log(result)
      if(result.affectedRows>0){
        res.send({code:1,msg:"删除成功!!!"})
      }else{
        res.send({code:-1,msg:"删除失败!!!"})
      }
    })
})
//功能十三\myself中判断用户登录获取用户登录后的信息
app.get("/myself",(req,res)=>{
  var uid=req.session.uid;
  if(!uid){
    res.send({code:-1,msg:"请登录"})
    return;
  }
  // console.log(uid)
  var sql="SELECT *FROM sigin WHERE uid=?"
  pool.query(sql,[uid],(err,result)=>{
   if(err) err;
   res.send({code:1,data:result})
  })
})
//功能十四\退出登录logout
app.get("/logout",(req,res)=>{
  req.session.uid=null;
  res.send({code:-1,msg:"退出登录成功!!!"})
})
//功能十五:搜索商品
app.get("/search",(req,res)=>{
  var pname=req.query.pname;
  var sql="SELECT pname,price,title,pid FROM pro_info  WHERE pname LIKE ?"
  pool.query(sql,["%"+pname+"%"],(err,result)=>{
    // console.log(result)
    if(err) throw err;
    if(result.length>0){
      res.send({code:1,data:result})
    }else{
      res.send({colde:-1,msg:"此商品不存在！！！"})
    }
  })
})
//功能十六； 根据用户输入的商品的名称查询对应的商品的信息
app.get("/getSelect",(req,res)=>{
  var pid=parseInt(req.query.pid);
  // console.log(pid)  
  var sql="SELECT * FROM home_img h,pro_info p WHERE h.pid=p.pid AND p.pid=?";
  pool.query(sql,[pid],(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result})
  })
})