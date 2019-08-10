#设置客户端连接服务器端编码
SET NAMES UTF8;
#丢弃数据库，如果存在
DROP DATABASE IF EXISTS jy;
#创建数据库，设置存储的编码
CREATE DATABASE jy CHARSET=UTF8;
#进入该数据库
USE jy;
#创建保存用户信息表
CREATE TABLE jy_user(
  uid	INT	PRIMARY KEY  NOT NULL AUTO_INCREMENT,	#用户的ID，为用户的唯一标识，由系统自动生成
  uname	VARCHAR(32),   #用户名
  upwd	VARCHAR(32),  #用户密码
  phone	VARCHAR(16)	NOT NULL UNIQUE,	#手机号码
  avatar 	VARCHAR(128),		#头像图片路径
  user_name 	VARCHAR(32),		#用户名，如王小明
  gender 	INT 		#性别  0-女  1-男
);
#添加两条测试数据
INSERT INTO jy_user VALUES(null,'wyz',md5('123456'),'18388866850','img/02.jpg','吴彦祖',1);
INSERT INTO jy_user VALUES(null,'pyy',md5('123456'),'13094314233','img/01.jpg','彭于晏',1);

#创建个人中心提醒模块表
CREATE TABLE jy_remind(
  uid	INT	PRIMARY KEY  NOT NULL AUTO_INCREMENT,	#用户的ID，为用户的唯一标识，由系统自动生成
  avatar 	VARCHAR(128),		#图片路径
  title VARCHAR(12), #提醒标题
  opinion VARCHAR(288) #文字内容
);

#创建个人中心评论模块表
CREATE TABLE jy_comments(
  uid	INT	PRIMARY KEY  NOT NULL AUTO_INCREMENT,	#用户的ID，为用户的唯一标识，由系统自动生成
  content VARCHAR(128)  #评论字数
);

#创建个人中心关注模块表
CREATE TABLE jy_focus(
  uid	INT	PRIMARY KEY  NOT NULL AUTO_INCREMENT,	#用户的ID，为用户的唯一标识，由系统自动生成
  pid 	INT 	, #与设计者表ui一样，从设计者表里插入数据
  yid   INT   #同邮票id，从邮票里面拿取数据
);

#创建个人中心收藏表
CREATE TABLE jy_collection(
  uid	INT	PRIMARY KEY  NOT NULL AUTO_INCREMENT,	#用户的ID，为用户的唯一标识，由系统自动生成
  wid 	INT 	, #与设文章表ui一样，从设计者表里插入数据
  yid   INT,   #同邮票id，从邮票里面拿取数据
  jid   INT,   #集邮id
  sxid  INT   #赏析表id
);

#创建个人中心我的邮票表
CREATE TABLE jy_stamps(
  uid	INT	PRIMARY KEY  NOT NULL AUTO_INCREMENT,	#用户的ID，为用户的唯一标识，由系统自动生成
  yid   INT   #同邮票id，从邮票里面拿取数据
);

#创建个人中心想要的邮票表
CREATE TABLE jy_want(
  uid	INT	PRIMARY KEY  NOT NULL AUTO_INCREMENT,	#用户的ID，为用户的唯一标识，由系统自动生成
  yid   INT   #同邮票id，从邮票里面拿取数据
);

#创建个人中心我的投稿
CREATE TABLE jy_contribute(
  uid	INT	PRIMARY KEY  NOT NULL AUTO_INCREMENT,	#用户的ID，为用户的唯一标识，由系统自动生成
  wid   INT   #同文章id，从邮票里面拿取数据
);

#创建个人中心意见箱
CREATE TABLE jy_opinion(
  uid	INT	PRIMARY KEY  NOT NULL AUTO_INCREMENT,	#用户的ID，为用户的唯一标识，由系统自动生成
  opinion VARCHAR(288) #投诉的文字内容
);

#创建文章数据库
CREATE TABLE jy_article(
  wid	INT PRIMARY KEY AUTO_INCREMENT,
  avatar 	VARCHAR(128),		#图片路径
  opinion VARCHAR(288) #文字内容
);