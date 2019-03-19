SET NAMES UTF8;
DROP DATABASE IF EXISTS phone_shop;
CREATE DATABASE phone_shop CHARSET=UTF8;
USE phone_shop;
CREATE TABLE swipe_img(
  #创建一个轮播图的表，名为：swipe_img;
  sid INT PRIMARY KEY AUTO_INCREMENT,
  swipe_img VARCHAR(500)
);
INSERT INTO swipe_img  VALUES(null,"http://127.0.0.1:3000/img/swipe_img/s_img1.jpg");
INSERT INTO swipe_img  VALUES(null,"http://127.0.0.1:3000/img/swipe_img/s_img2.jpg");
INSERT INTO swipe_img  VALUES(null,"http://127.0.0.1:3000/img/swipe_img/s_img3.jpg");
INSERT INTO swipe_img  VALUES(null,"http://127.0.0.1:3000/img/swipe_img/s_img4.jpg");
INSERT INTO swipe_img  VALUES(null,"http://127.0.0.1:3000/img/swipe_img/s_img5.jpg");
INSERT INTO swipe_img  VALUES(null,"http://127.0.0.1:3000/img/swipe_img/s_img6.jpg");
INSERT INTO swipe_img  VALUES(null,"http://127.0.0.1:3000/img/swipe_img/s_img7.jpg");

#创建一个首页商品展示的表，表名为home_img 
#pid指的是首页跳转到商品详情页面中对应商品的id
#hid指的是首页中展示商品图片的id,
CREATE TABLE home_img(
  hid INT PRIMARY KEY AUTO_INCREMENT,
  pid INT ,
  home_img VARCHAR(128)
);
#插入home中的商品图片，在首页进行展示；
INSERT INTO home_img  VALUES(null,1,"http://127.0.0.1:3000/img/home_img/note7.png");
INSERT INTO home_img  VALUES(null,2,"http://127.0.0.1:3000/img/home_img/mi6.png");
INSERT INTO home_img  VALUES(null,3,"http://127.0.0.1:3000/img/home_img/min6A.png");
INSERT INTO home_img  VALUES(null,4,"http://127.0.0.1:3000/img/home_img/mi8se.png");
INSERT INTO home_img  VALUES(null,5,"http://127.0.0.1:3000/img/home_img/miplay.png");
INSERT INTO home_img  VALUES(null,6,"http://127.0.0.1:3000/img/home_img/mix3.png");
INSERT INTO home_img  VALUES(null,7,"http://127.0.0.1:3000/img/home_img/note5.png");
INSERT INTO home_img  VALUES(null,8,"http://127.0.0.1:3000/img/home_img/note8.png");
INSERT INTO home_img  VALUES(null,9,"http://127.0.0.1:3000/img/home_img/pro.png");
INSERT INTO home_img  VALUES(null,10,"http://127.0.0.1:3000/img/home_img/qingchun8.png");
#电脑
INSERT INTO home_img  VALUES(null,11,"http://127.0.0.1:3000/img/home_img/001.jpg");
INSERT INTO home_img  VALUES(null,12,"http://127.0.0.1:3000/img/home_img/002.jpg");
INSERT INTO home_img  VALUES(null,13,"http://127.0.0.1:3000/img/home_img/003.jpg");
INSERT INTO home_img  VALUES(null,14,"http://127.0.0.1:3000/img/home_img/004.jpg");
INSERT INTO home_img  VALUES(null,15,"http://127.0.0.1:3000/img/home_img/005.jpg");
INSERT INTO home_img  VALUES(null,16,"http://127.0.0.1:3000/img/home_img/006.jpg");
INSERT INTO home_img  VALUES(null,17,"http://127.0.0.1:3000/img/home_img/007.jpg");
INSERT INTO home_img  VALUES(null,18,"http://127.0.0.1:3000/img/home_img/008.jpg");

#创建一个商品详情表，包括商品的编号pid,商品的名字pname,商品的价格price，商品的标题title,商品的基本信息content

CREATE TABLE pro_info(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  pname VARCHAR(120),
  price INT,
  title VARCHAR(200),
  content VARCHAR(1000)
);
INSERT INTO pro_info VALUES(null,"红米Note7",999,"4800万拍照千元机18个月超长质保","旗舰相机4800万超清,双摄满血性能骁龙660,[满血版],超长续航4000mAh,大电量旗舰屏幕6.3,水滴全面屏潮流外观幻彩渐变,玻璃机身品质小金刚18,个月超便捷耐用USB-C,接口手机就是遥控器红外遥控,金刚品质康宁®️第五代大猩猩®️玻璃QuickCharge支持快充协议");
INSERT INTO pro_info VALUES(null,"红米6",729,"红米6AI双摄,小屏高性能后置1200万,AI双摄,12nm八核处理器,5.45高清全面屏,AI,人脸解锁","后置120万+500万,AI双摄，拍照更出色,全新12nm八核处理器,抢红包快人一步,5.45英寸全面屏,高清高屏占比，震撼视野,小“杨柳腰”机身,优雅弧度，爱不释手,AI 人像模式,实时背景虚化，凸显你的美,AI人脸解锁,抬手亮屏，刷脸解锁更便捷,AI 语音助理,一句话搞定手机复杂操作,3选2 卡槽,最高可扩展 256GB");
INSERT INTO pro_info VALUES(null,"红米6A",549,"AI人脸解锁，小屏高性能 12nm高性能处理器｜5.45小巧全面屏1300万高清相机小杨柳腰机身","全新12n制程工艺,2.0GHz高性能处理器,5.45英寸全面屏,高清高屏占比，震撼视野,1300万高清相机,细腻画质，拍出动人好照片,“小杨柳腰”机身,优雅弧度，爱不释手,AI人脸解锁,抬手亮屏，刷脸解锁更便捷,AI 智能识物,随手一拍，识别好物,AI 语音助理一句话搞定手机复杂操作3 选 2 卡槽最高可扩展 256GB");
INSERT INTO pro_info VALUES(null,"小米8se",1599,"骁龙710全球首发小屏旗舰","骁龙710 全球首发,骁龙准旗舰处理器,5.88'' 全面屏,相当于传统 5.2'' 机身握感,三星 AMOLED 屏幕,色彩鲜艳通透，功耗更低,AI 超感光双摄,12MP + 5MP,前置2000万柔光自拍,梦幻般背景虚化,3120mAh 长续航,一整天充沛电量");
INSERT INTO pro_info VALUES(null,"小米Play",1099,"内含高速流量 10GB/月|高颜值流光渐变色 5.84小水滴全面屏|八核高性能处理器","一年流量放心用内置每月10GB高速流量,5.84 小水滴全面屏,19:9 屏幕比例，小机身大视野,高颜值流光渐变色,圆润轻薄，绝佳手感,后置 1200万 AI 双摄,前置 800万 美颜自拍,八核 12nm 处理器,双 Turbo 智能加速,小爱同学语音助理,新增“语音抢票”功能");
INSERT INTO pro_info VALUES(null,"小米MIX3",3299,"磁动力滑盖全面屏丨前后旗舰 AI 双摄四曲面彩色陶瓷机身丨故宫特别版","AI 场景相机人景分离，12 类场景美化,AI 影棚光效,口袋里的影棚级打光,AI 梦境虚化,梦幻的动态虚化效果,AI 视频实时美颜,智能追踪人脸，动态美颜,AI 裸妆美颜,轻补自然裸妆,AI 天使眼神光,款眼神光，眼眸精灵动人");
INSERT INTO pro_info VALUES(null,"红米Note5",839,"红米Note5 AI 双摄千元机里的拍照专家","迄今拍照最好的红米手机*，1.4μm超大像素，暗光拍照更晰。Dual PD 双核对焦，让你更快地抓拍精彩瞬间。还有AI人像模式，让你拍出前景清晰背景虚化的人像大片。更有13MP前置柔光自拍，暗光下自动开启柔光灯，照亮面部每个细节。");
INSERT INTO pro_info VALUES(null,"红米note8",2299,"8周年旗舰手机全球首款双频 GPS|骁龙845|AI 变焦双摄|红外人脸识别","骁龙845处理器超旗舰性能,全球首款双频GPS,超精准定位,红外人脸识别,全黑环境疾速解锁,三星 AMOLED 屏,广色域，高对比度,超轻四曲面,轻薄圆润，舒适手感,前置2000万,「微整形」美颜,AI 变焦双摄,1200万 + 1200万");
INSERT INTO pro_info VALUES(null,"红米6 Pro",999,"AI 人像模式,5.84 异形全面屏,后置1200万+500万","5.84 异形全面屏19:9 FHD+，高屏占比,后置1200万+500万,AI 双摄，随手拍大片,骁龙625 八核处理器,4nm制程，强劲性能,4000mAh大电量,畅快使用，精彩不断,AI 人像模式,单反般背景虚化,AI人脸识别,瞬息间，解锁你的手机,AI语音助理,一句话搞定手机复杂操作,2+1 卡槽,最高可扩展256GB");
INSERT INTO pro_info VALUES(null,"小米8 青春版",1299,"潮流镜面渐变色给你不一样的颜色看看","2400万超高解析力，1.8μm 大像素，配合 AI 场景相机与 AI 屏幕智能补光，白天夜晚随手拍，张张惊艳出彩。SONY IMX 576索尼旗舰感光元件,1.8 μm 感光像素,暗光环境智能 4合1,2480 万像,实际像素");
#插入电脑信息
INSERT INTO pro_info VALUES(null,"AppleMacBookAir",6988,"5月焕新季，领券买新机！神券满6000减600！一体成型金属机身，纤薄轻巧，长达12小时续航","Apple MacBook Air 13.3英寸笔记本 银色(Core i5 处理器/8GB内存/128GB SSD闪存 MMGF2CH/A)");
INSERT INTO pro_info VALUES(null,"小米Air","【i5 独立显卡】全高清窄边框 8G内存 256G固态硬盘 支持SSD硬盘扩容 薄至14.8mm 轻至1.28kg！AKG扬声器！",7488,"小米(MI)Air 13.3英寸全金属超轻薄笔记本(i5-6200U 8G 256G PCIE固态 940MX独显 FHD WIN10)银");
INSERT INTO pro_info VALUES(null,"ThinkPadE480C",3599,"2019年经典款新！精致小黑！22.3mm轻薄体验，180度开合灵活耐用，高效稳健办公最长可达5小时！","联想(ThinkPad)轻薄系列E480c(20H3A00GCD)14英寸笔记本(i3-6006U 4G 500G 2G独显 Win10)黑色");
INSERT INTO pro_info VALUES(null,"华硕RX310UQ",3499,"【铝镁合金 纯固态 轻至1.45kg 金属超极本 】双尺寸可选","华硕(ASUS)13.3英寸RX310UQ金属超极本 学生 商务手提轻薄便携超薄笔记本电脑 玫瑰金 13.3英寸I3-7100U/4G/128G固态','【铝镁合金 纯固态 轻至1.45kg 金属超极本 】双尺寸可选',4299,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','13.3英寸I3-7100U/4G/128G固态");
INSERT INTO pro_info VALUES(null,"联想小新700",5199,"【小新家族2017闪耀换新！晒单得E卡！12期免息！】小新700电竞版！经典之选","联想(Lenovo)小新700电竞版 15.6英寸游戏笔记本电脑(i5-6300HQ 8G 500G+128G SSD GTX950M 4G IPS)黑','【小新家族2017闪耀换新！晒单得E卡！12期免息！】小新700电竞版！经典之选',5199,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','小新700【i5 双硬盘 GTX950M】");
INSERT INTO pro_info VALUES(null,"戴尔燃7000",6099,"【轻薄微边框、燃7000】七代i5双核CPU、128GSSD+500G双硬盘、IPS全高清显示屏，动力强劲性能澎湃！","戴尔DELL灵越燃7000 R1525S 14.0英寸轻薄窄边框笔记本电脑(i5-7200U 4G 128GSSD+500G 940MX 2G独显 FHD)银','【轻薄微边框、燃7000】七代i5双核CPU、128GSSD+500G双硬盘、IPS全高清显示屏，动力强劲性能澎湃！',5299,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','【流光银】i5-7200u 4G 128 500G','戴尔燃7000','Windows 10','4G','全高清屏(1920×1080)','入门级游戏独立显卡','Intel i5低功耗版");
INSERT INTO pro_info VALUES(null,"戴尔灵越15PR-5745B",5999,"【强力散热保性能】 960M 4G独显 预装128SSD 双硬盘游戏更劲爽 我们比大多数产品 散热好一些","戴尔DELL灵越游匣15PR-5745SE 15.6英寸游戏笔记本电脑(i7-7700HQ 8G 128GSSD+1T GTX1050 4G独显 FHD)枪弹版','游匣枪弹版精装上市 3D立体喷涂画面 机身更酷炫 七代四核CPU ,GTX1050 4G独显,FHD全高清屏,热血出击！");
INSERT INTO pro_info VALUES(null,"ThinkPadE470",4799,"点击进入5月大促，超值满千减百品牌周',3998,'*30天无忧退货 *48小时快速退款","联想(ThinkPad)轻薄系列E470c(20H3A000CD)14英寸笔记本电脑(i5-6200U 4G 500G 2G独显 Win10)黑色','点击进入5月大促，超值满千减百品牌周',3998,'*30天无忧退货 *48小时快速退款");
#发现新消息的表为news
CREATE TABLE news(
  nid INT PRIMARY KEY AUTO_INCREMENT,
  pid INT,
  title VARCHAR(120), #标题
  newsimg_url VARCHAR(120), #图片
  point int(11),  #阅读量
  ctime DATETIME  #时间
);
#新消息的详情表
INSERT  INTO news VALUES(null,1,"小米9战斗天使好看又能打！几家风透明机身，骁龙855+12G内存...","http://127.0.0.1:3000/img/news_info/小米9.jpg","100",now());
INSERT  INTO news VALUES(null,2,"小米9SE小屏旗舰骁龙 712 全球首发，4800 万超广角三摄","http://127.0.0.1:3000/img/news_info/小米9se.jpg","320",now());
INSERT  INTO news VALUES(null,3," 争做优等生2.15-2.22开学换新季，轻薄，学习两不误","http://127.0.0.1:3000/img/news_info/优等生.jpg","320",now());
INSERT  INTO news VALUES(null,4,"全面均衡的国民轻薄本第八代酷睿™ 四核处理器","http://127.0.0.1:3000/img/news_info/小米笔记本pg.jpg","320",now());
INSERT  INTO news VALUES(null,5,"小米电视4C 55英寸人工智能/4K HDR/超窄边/大内存/钢琴烤漆/杜比音效/高性能/海量片源","http://127.0.0.1:3000/img/news_info/电视4A.jpg","320",now());

CREATE TABLE newsinfo(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  nid INt,
  content VARCHAR(1000),
  newinfo1_url VARCHAR(200),
  newinfo2_url VARCHAR(200),
  newinfo3_url VARCHAR(200),
  newinfo4_url VARCHAR(200)
);
INSERT INTO newsinfo VALUES(null,1,"全球首批骁龙855,年度超旗舰处理器,索尼 4800 万像素三摄,DxOMark 拍照世界前三,支持超广角、微距拍摄,开启手机三摄时代,全球首款 20W 无线闪充,速度堪比有线快充,全息幻彩玻璃机身,手心中的梦幻彩虹光,全曲面轻薄设计,怦然心动的好手感,第五代极速屏下指纹,快25% 解锁超灵敏,三星 AMOLED 屏幕,90.7% 超高屏占比,标配27W 有线快充,充满只需 60 分钟,蓝宝石玻璃镜片,超硬耐磨，长久保护","http://127.0.0.1:3000/img/news_info/小米9/index1.jpg","http://127.0.0.1:3000/img/news_info/小米9/noline.png","http://127.0.0.1:3000/img/news_info/小米9/play.jpg","http://127.0.0.1:3000/img/news_info/小米9/storage.jpg");
INSERT INTO newsinfo VALUES(null,2,"小米9SE专为小屏“铁粉”精心打造它几乎就是一个小屏版的小米9它保留了小米9 众多旗舰功能三星 AMOLED屏幕、第五代屏幕指纹识别、索尼 4800 万相机、全息幻彩机身工艺。更有全球首发的骁龙 712，NFC、红外遥控等旗舰配置","http://127.0.0.1:3000/img/news_info/小米9se/camera.jpg","http://127.0.0.1:3000/img/news_info/小米9se/fingerprint.jpg","http://127.0.0.1:3000/img/news_info/小米9se/index-bg.jpg","http://127.0.0.1:3000/img/news_info/小米9se/screen.jpg");
INSERT INTO newsinfo VALUES(null,3,"争做优等生2.15-2.22开学换新季，轻薄，学习两不误","http://127.0.0.1:3000/img/news_info/争做优等生/01.jpg","http://127.0.0.1:3000/img/news_info/争做优等生/02.jpg","http://127.0.0.1:3000/img/news_info/争做优等生/03.jpg","http://127.0.0.1:3000/img/news_info/争做优等生/04.jpg");
INSERT INTO newsinfo VALUES(null,4,"全新第八代英特尔® 酷睿™ 处理器GeForce® MX110独立显卡，2GB 显存双风扇散热系统双出风口，2+2 热管布局双内存大硬盘可扩展。128GB SSD + 1TB 机械硬盘7大接口，即插即用，无需转接器独立数字键盘数字录入快捷高效","http://127.0.0.1:3000/img/news_info/小米笔记本/milaptop-01.jpg","http://127.0.0.1:3000/img/news_info/小米笔记本/milaptop-04.jpg","http://127.0.0.1:3000/img/news_info/小米笔记本/milaptop-05.jpg","http://127.0.0.1:3000/img/news_info/小米笔记本/milaptop-06.jpg");
INSERT INTO newsinfo VALUES(null,5,"小米电视4C 55英寸人工智能 / 4K HDR / 超窄边 / 大内存 / 钢琴烤漆 / 杜比音效/高性能 / 海量片源小米自营","http://127.0.0.1:3000/img/news_info/小米电视/11.png","http://127.0.0.1:3000/img/news_info/小米电视/12.png","http://127.0.0.1:3000/img/news_info/小米电视/13.png","http://127.0.0.1:3000/img/news_info/小米电视/14.png");


#评论的表，根据某一件商品的pid进行评论，表名为：news_comment,需要有
#评论的 id ,评论的内容content,评论的时间ctime,以及评论的商品的编号pid
CREATE TABLE news_comment(
  id INT PRIMARY KEY AUTO_INCREMENT,
  content VARCHAR(150),
  pid INT,
  ctime DATETIME,
  uid INT
);


#用户注册sigin
#用户的uid ,用户名uname,用户的邮箱email,用户的密码upwd,用户确认密码upwds,用户的头像uimg
 CREATE TABLE sigin(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),
  email VARCHAR(32),
  upwd  VARCHAR(32),
  upwds VARCHAR(32)
);

#创建一个购物车的表shop_cart
#包含的字段为:购物车的id,购物车的中某一件商品的数量count,商品的价格price,商品的编号pid,是哪一个用户的购物车,用户的uid
CREATE TABLE shop_cart(
  id INT PRIMARY KEY AUTO_INCREMENT,
  pname VARCHAR(200),
  count INT,
  price DECIMAL(15,2),
  pid INT,
  uid INT
);
