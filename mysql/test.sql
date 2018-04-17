mysql> source  c:/php/www/test.sql         --导入SQL文件语句到数据库
mysql> use database ；mcd时告诉数据库要使用哪一个库。不使用ust时。  select * from test.te_test;   使用时可用    select * from te_test;
mysql> describe tablename; 显示具体的表结构
mysql> alter table 表名 rename 新表名;   #修改表名
mysql> select database();  查看use选定的数据库。
mysql> update 表 set column=新  where column=某；  更新特定的
mysql> alter table 表名 add 新增字段名 int(8);   在表中增加字段;
mysql> update g set xxx=981;  更新表xxx列全为981

-------事物------------innoDB
mysql> set autocommit=0;    #关闭当前会话（连接）关闭自动提交功能。236页。。保持该连接，用另一个查询会发现数据库没有改、、具有排他性
mysql> commit;            #完成事物后使用commit将其提交给库
mysql> rollback;   #用这可以将事物返回数据库以前的状态。


mysql> update g set txt1=0009 ,ff="ddd"  where id =27;



php yiic.php web  ../admin 回车 yes  安装yii框架



注意！所以sql语句都必须加;号结束
命令   show  为查看
       show  databases              查看数据库
       show tables from xin2;       查看xin2库中所有表。
       show columns from xin2.xin;  查看xin2库中xin表的数据结构；

mysql> sd
    -> ff
    -> \c   取消更多输入
mysql> 
mysql 校对集，就是排序使用的标准

explain
mysql> explain  select * from y \G    查看sql语句的影响。
mysql> rename table f to Y;#改表明f为Y
\G......
mysql> show table status \G;  #查看库表所有详细信息
mysql> show table status where name='f'\G  #查看当前库中特定表的详细信息
unsigned 和 zerofill 是在数据类型后面！
mysql> alter table f add w tinyint unsigned ;#控制tinyint数据类型不能为负
mysql> alter table f add v tinyint(5) unsigned zerofill; #zerofill 自动填充0  少于5就前面添0
mysql> set names gbk; #查询和插入的字符集
mysql> show create table f;#查看创建这个表的sql语句
mysql> show create view  rr;  #查看创建这个view的sql语句
mysql> drop view rr;  #删除视图rr
mysql> drop talbe f;  #删除表
mysql> truncate y ;#清空表
mysql> create view rr as select  name,sj,v,w from f;  #创建视图 rr
mysql> select * from rr; #直接查询视图得到的。。
mysql> select version();  版本号 
mysql> create database G; 创建数据库 G
mysql> select user();
mysql> show index from zl \G 查看表zl的索引
mysql> explain select * from zl where txt='crea%' \G 查看sql语句使用索引情况
+----------------+
| user()         |
+----------------+
| root@localhost |
+----------------+
1 row in set (0.00 sec)

group by  按组分


create table tan (
id int(7) not null unique auto_increment,
xe varchar(19) not null unsigned  zerofill
)


mysql> create table F(
    ->
    -> sj datetime not null,
    -> id int(4) not null unique auto_increment,
    -> name text,
    -> x text)
    -> ;#创建表

not null           不接受null，
auto_increment     自增
unique  	   唯一

unsigned ----》column不能为负

------------索引----
unique key  唯一索引
primary key  主键索引
             全文索引

create table s(
id int(4) not null auto_increment unique,
h tinyint(7) unsigned  zerofill  not null ,
sj  datetime not null,
n text,
key h(h(4))
);


 
create table shang(
 id int not null auto_increment unique,
 n text not null,
 s tinyint UNSIGNED not null
);
create table dan(
 id int not null unique auto_increment,
idS int not null ,
s tinyint unsigned not null ,
sj  DATETIME 
);

create view shitu select shang.id,shang.n as shang_pingname ,shang.s as shangliang，
dan.id as danID, dan.s as danliang,dan.sj as dansj from dan inner join shang ON
dan.id = shang.ids

# default
# sj datetime not null  getdate()
# 韩顺平



mysql> select * from f;
+---------------------+----+------+------+
| sj                  | id | name | x    |
+---------------------+----+------+------+
| 2015-09-19 11:31:09 |  1 | 2343 | 22   |
| 2015-09-19 12:08:36 |  2 | 2343 |      |
| 2015-09-19 12:08:37 |  3 | 2343 |      |
| 2015-09-19 12:09:08 |  4 | 2343 | NULL |
| 2015-09-19 12:13:56 |  5 | 2343 | NULL |
| 2015-09-19 12:13:57 |  6 | 2343 | NULL |
| 2015-09-19 12:28:37 |  7 | 16   | 9    |
| 2015-09-19 12:29:21 |  8 | 16   | 2    |
| 2015-09-19 12:29:34 |  9 | 16   | 7    |
+---------------------+----+------+------+
理解为column 理解为变量名。column中的内容理解为值
看下面sql

mysql> select * from f where x=name-id;    #因为是变量，所以这是可以加减乘除的。。
这sql就是取出name-id=x的值
+---------------------+----+------+------+
| sj                  | id | name | x    |
+---------------------+----+------+------+
| 2015-09-19 12:28:37 |  7 | 16   | 9    |
| 2015-09-19 12:29:34 |  9 | 16   | 7    |
+---------------------+----+------+------+

mysql> select * from f where x is null;  #取出x为null的。
+---------------------+----+------+------+
| sj                  | id | name | x    |
+---------------------+----+------+------+
| 2015-09-19 12:09:08 |  4 | 2343 | NULL |
| 2015-09-19 12:13:56 |  5 | 2343 | NULL |
| 2015-09-19 12:13:57 |  6 | 2343 | NULL |
+---------------------+----+------+------+

mysql> select *,name-x as 减 from f;
+---------------------+----+------+------+------+
| sj                  | id | name | x    | 减   |
+---------------------+----+------+------+------+
| 2015-09-19 11:31:09 |  1 | 2343 | 22   | 2321 |
| 2015-09-19 12:08:36 |  2 | 2343 |      | 2343 |
| 2015-09-19 12:08:37 |  3 | 2343 |      | 2343 |
| 2015-09-19 12:09:08 |  4 | 2343 | NULL | NULL |
| 2015-09-19 12:13:56 |  5 | 2343 | NULL | NULL |
| 2015-09-19 12:13:57 |  6 | 2343 | NULL | NULL |
| 2015-09-19 12:28:37 |  7 | 16   | 9    |    7 |
| 2015-09-19 12:29:21 |  8 | 16   | 2    |   14 |
| 2015-09-19 12:29:34 |  9 | 16   | 7    |    9 |
+---------------------+----+------+------+------+

mysql> select sum(id+x) from f where x  is not null and x!='' ;  #取出所有id+x的总和，且x不=null  and  ‘’
+-----------+
| sum(id+x) |
+-----------+
|        65 |
+-----------+
mysql> select * from f where x  is not null 	and x!='' ;
+---------------------+----+------+------+
| sj                  | id | name | x    |
+---------------------+----+------+------+
| 2015-09-19 11:31:09 |  1 | 2343 | 22   |
| 2015-09-19 12:28:37 |  7 | 16   | 9    |
| 2015-09-19 12:29:21 |  8 | 16   | 2    |
| 2015-09-19 12:29:34 |  9 | 16   | 7    |
+---------------------+----+------+------+



---------eiw  视图----------


mysql> select * from f;  #f原表数据
+---------------------+----+--------+------+------+------+-------+
| sj                  | id | name   | x    | z    | w    | v     |
+---------------------+----+--------+------+------+------+-------+
| 2015-09-19 11:31:09 |  1 | 2343   | 22   | NULL | NULL |  NULL |
| 2015-09-19 12:08:36 |  2 | 2343   |      | NULL | NULL |  NULL |
| 2015-09-19 12:08:37 |  3 | 2343   |      | NULL | NULL |  NULL |
| 2015-09-19 12:09:08 |  4 | 2343   | NULL | NULL | NULL |  NULL |
| 2015-09-19 12:13:56 |  5 | 2343   | NULL | NULL | NULL |  NULL |
| 2015-09-20 11:30:48 | 13 | 谭金星 | 23   |    4 |    5 | 00003 |
+---------------------+----+--------+------+------+------+-------+
6 rows in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.06 sec)

mysql> create view rr as select  name,sj,v,w from f;  #创建视图 rr   卧槽注意 view rr  as！！！as必须加不加出错
Query OK, 0 rows affected (0.16 sec)

mysql> select * from rr; #直接查询视图得到的。。
+--------+---------------------+-------+------+
| name   | sj                  | v     | w    |
+--------+---------------------+-------+------+
| 2343   | 2015-09-19 11:31:09 |  NULL | NULL |
| 2343   | 2015-09-19 12:08:36 |  NULL | NULL |
| 2343   | 2015-09-19 12:08:37 |  NULL | NULL |
| 2343   | 2015-09-19 12:09:08 |  NULL | NULL |
| 2343   | 2015-09-19 12:13:56 |  NULL | NULL |
| 谭金星 | 2015-09-20 11:30:48 | 00003 |    5 |
+--------+---------------------+-------+------+
6 rows in set (0.12 sec)

mysql>


mysql> show table status \G; #当前库中所有详细信息
*************************** 1. row ***************************
           Name: f
         Engine: InnoDB
        Version: 10
     Row_format: Compact
           Rows: 0
 Avg_row_length: 0
    Data_length: 16384
Max_data_length: 0
   Index_length: 0
      Data_free: 7340032
 Auto_increment: 14
    Create_time: 2015-09-19 11:25:27
    Update_time: NULL
     Check_time: NULL
      Collation: latin1_swedish_ci
       Checksum: NULL
 Create_options:
        Comment:
1 row in set (0.00 sec)

ERROR:
No query specified



mysql> set names gbk; #查询和插入的字符集
Query OK, 0 rows affected (0.00 sec)

mysql> select * from y;
+---------------------+----+------------------+------+------+------+-------+
| sj                  | id | name             | x    | z    | w    | v     |
+---------------------+----+------------------+------+------+------+-------+
| 2015-09-20 12:47:34 |  1 | 3d               | NULL | NULL | NULL | 00032 |
| 2015-09-20 13:13:45 |  2 | 谈打的俄方同然而 | NULL | NULL | NULL |  NULL |
+---------------------+----+------------------+------+------+------+-------+
2 rows in set (0.00 sec)

mysql> set names utf8;#改变了原有字符集就出现乱码
Query OK, 0 rows affected (0.00 sec)

mysql> select * from y;
+---------------------+----+--------------------------+------+------+------+-------+
| sj                  | id | name                     | x    | z    | w    | v     |
+---------------------+----+--------------------------+------+------+------+-------+
| 2015-09-20 12:47:34 |  1 | 3d                       | NULL | NULL | NULL | 00032 |
| 2015-09-20 13:13:45 |  2 | 璋堟墦鐨勪縿鏂瑰悓鐒惰?? | NULL | NULL | NULL |  NULL |
+---------------------+----+--------------------------+------+------+------+-------+
2 rows in set (0.00 sec)

mysql>



mysql> source  c:/php/www/test.sql         --导入SQL文件语句到数据库
mysql> ust database ；mcd时告诉数据库要使用哪一个库。不使用ust时。  select * from test.te_test;   使用时可用    select * from te_test;
mysql> describe tablename; 显示具体的表结构
mysql> alter table 表名 rename 新表名;   #修改表名
mysql> select database();  查看use选定的数据库。
mysql> update 表 set column=新  where column=某；  更新特定的
mysql> alter table 表名 add 新增字段名 int(8);   在表中增加字段;
mysql> update g set xxx=981;  更新表xxx列全为981

-------事物------------innoDB
mysql> set autocommit=0;    #关闭当前会话（连接）关闭自动提交功能。236页。。保持该连接，用另一个查询会发现数据库没有改、、具有排他性
mysql> commit;            #完成事物后使用commit将其提交给库
mysql> rollback;   #用这可以将事物返回数据库以前的状态。



---------外键-------------



mysql> update g set txt1=0009  where id =27;
ERROR 1205 (HY000): Lock wait timeout exceeded; try restarting transaction 


=============================
rename   xx.gif    eee.php    --将xx.gif 改名为eee.php
powercfg -h off      关闭休眠
powercfg -h on       开启休眠

php yiic.php web  ../admin 回车 yes  安装yii框架




-- 9999999999999999999999999999999999999999999999999999999999


CREATE DATABASE chu;
create table o(  # goo
id int ,
name varchar(10),
num smallint

);

create table d(   # ord
id int,
ido int,
much smallint


);
/*
create 创建
trigger 触发器 
view 视图  
procedure 存储过程
 什么变量 ---> declare  
格式     declare   变量名  变量类型 default  默认值   # 默认值可以不选   ,default 声明默认值
*/

# 触发器
# delimiter 自定义sql语句结束符
# show triggers
# drop triggers 触发器名称   new 新 insert   old旧  以前的 delete   trigger  triggers
# 删除触发器  DROP TRIGGER IF EXISTS  `chufaqi1`
# declare #  声明变量
# into #赋值
# select num into yyyy from o whrer id=new.ido; # 取出o表中的num，并赋值给yyyy
# for each row 是 行级触发器的意思，mysql不支持 语句级触发器。
/* 在oracle触发器中 分语句级触发器，和行集触发器

*/
delimiter  $
CREATE  trigger chufaqi
after 
insert
on d
for each row
begin
update  o set num=num - new.much where id=new.ido ;
end$


# ===解
# 有俩个之前和之后
#  new 和 old------->new 表示update ,insert  动作之后。old则是 update ，insert ，delete 之前 
# before 和 after ---》after 则是所监控动作之后，before与之相反
#  befor

delimiter  $ # 自定义sql结束符
CREATE  trigger chufaqi  # trigger  触发器    chufaqi触发器名称
after   # after： 已 insert  update  delete 后。  before  之前
insert # 被监控的动作
on d  # on d 被监控的表
for each row # mysql必加，
begin # begin   ****** end$ 动作块。 监控到后的动作语句，可包含多个语句
update  o set num=num - new.much where id=new.ido ; # new 是抓取新的 update insert   old 是旧的，旧的就是被delete的数据
end$


# 当update d表是将触发chufaqi1 。o表的num列加 =num +（ 这触发器就行修改d表将先将修改前的数据减去修改后的数据，）
# old.much 代表修改前的much数据-new.much 修改后的数据 + num
delimiter  $
CREATE  trigger chufaqi1
after 
update
on d
for each row
begin
update  o set num=num +（old.much - new.much) where id=new.ido ;
end$

delimiter  $
CREATE  trigger chufaqi2
after 
delete
on d
for each row
begin
update  o set num=num + old.much where id=old.ido ;
end$







/*
 mysql> select * from o;
+------+------+------+
| id   | name | num  |
+------+------+------+
|    1 | ya   |   84 |
|    2 | niao |    8 |
|    3 | bi   |   12 |
+------+------+------+
    
*/






delimiter  $
CREATE  trigger chufaqi2
before 
insert
on d
declare #  声明变量
yyyy int #  变量名为yyyy  int型
for each row
begin
select num into yyyy from o whrer id=new.ido; # 取出o表中的num，并赋值给yyyy
if new.mach > yyyy then  # then  {} end fi ==else
  set new.muc;
end if
update  o set num=num + old.much where id=old.ido ;
end$

 
# 存储过程
/*
 过程： 封装了若干条语句，调用时集中执行
函数  是有返回值
过程没有
把若干条sql语句取个名称叫过程
把这些过程存储起来的叫   存储过程
存储过程的创建语法
*/
create procedure  nameee() -- 声明 存储过程 procedure
begin
 select 34*3;
end$
#  ======
create procedure hanshu()
begin
  declare  i int default 12 ;  # ；必加
select concat(i);
end$







# 存储过程是可以引入变量滴
create procedure hanshu1()
begin
  declare  i int default 12 ;  # ；必加
  if i >112 then   # then ---> {
      select '你已成年';
else # ---> }else{
  select '未成年';
end if;  # --->}
end$
# 传参数


#  name( varName  int,varName2  int )
#  (变量名称  变量类型,,,,,,),像c
create procedure hanshu2(kuan int  , gao int)
begin
 if kuan >1 and gao >1 then
  select kuan * gao  as cheng;  # 别名 成
else 
 select 'buhefa' as cheng;
end if;
end$



create procedure xun()
begin
declare i int default 0;
declare if_ int default 100;
declare u int default 0;
 while i < if_ do
set i := i+1; --  := 符号  等于php的赋值符 =
set  u := u + i;
end while;
 select u;
end$

 ------------------



create procedure xun1(in i int , out u int , in if_ int) --  in  输入型，out 是输出型变量   ，inout  为输入输出型变量
begin
set u=0;
  while i < if_ do
set i := i+1;
set  u := u + i;
end while;
-- select u;
end$



-----  用法
call  xun1(0,@yy,100)$  # @ 不加报错
select @yy$ # 调用时@也要
/*
游标  感觉类似数组指针   
声明游标  
02000错误是游标到底。
*/
 create  procedure youbiao()
begin
 declare  y int
end$


/*
mysql> call hanshu2(123,32)$
+-------+
| cheng |
+-------+
|  3936 |
+-------+
1 row in set (0.00 sec)



C:\Documents and Settings\jinxing.tan>mysql -h192.168.1.111  -uroot -p
Enter password:
ERROR 2003 (HY000): Can't connect to MySQL server on '192.168.1.111' (10060)

*/
 CREATE USER 'tan'@'localhost' IDENTIFIED BY '123456'; --创建用户



flush privileges;  # 冲刷权限
explain  ！！！！
grant # 授权
revoke # 收回权限
grant  [权限1,权限2……]  *.* to  username@'' 
 grant all *.* to tan@'192.168.3.141' identified by 'wahaha'; # 全局权限，所有库都有权限。
revoke all on *.* from  tan@'192.168.3.141'  # 注意，收回权限是不能用被收回权限账号来收，自己不能收回自己权限
#  *.*    第一个*代表什么库，第二个库代表库中的什么表

revoke all on *.* to tan@'xxxxx';
revoke delete on *.* to tan@'xxxxx'; 收回所有表delete权限
收回权限  什么权限  on 什么库.什么表 to  name@'host'  
赋予权限 什么权限  on 什么库.什么表  to name@'host'
 



# 被收回所有权限后
/*mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| test               |
+--------------------+
2 rows in set (0.00 sec)*/
grant all on h .* to tan@'192.168.3.141'  ;  # 针对某库做授权
/*
授予h库权限后
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| h                  |
| test               |
+--------------------+
3 rows in set (0.02 sec)
*/

# revoke all on h.* to tan@'192.168.3.141'  ; # 收回某库权限

grant insert,select,update  on h.ii to tan@'192.168.3.141'; # 授予h库ii表 insert，select，update权限

# ===============总合练======
create table shang(
 id int not null auto_increment unique,
 n text not null, # 名称
 s tinyint UNSIGNED not null， # 货存量
 m int,# 单价
);
create table dan(
 id int not null unique auto_increment,
idS int not null , # 商ID
s1 tinyint unsigned not null ,  # 订货存量
sj  DATETIME # 时间
);

# 视图
CREATE view  shitu AS select dan.id as dID, shang.id ,shang.n as shangN ,shang.s as shangS,
 dan.s1 as danS,dan.sj as danSJ , round(shang.m*dan.s1,3)  as heji  from dan inner join shang ON
 dan.idS =shang.id;



# 触发器
delimiter  $
create trigger chu
before
insert 
on dan
for each row
begin
  update shang set s=s-new.s1 where id=new.idS;
end$
# ----------

create trigger kk
before
delete
on dan
for each row
begin
  update shang set s=s+old.s1 where id=old.idS;
end$


#  case  

create # 声明建立什么
trigger  # 触发器
begin  end    # 包含
delimiter  # 自定义sql语句结束符
before  # 之前  
after # 之后
create # 创建
trigger # 触发器 
view # 视图  
procedure # 存储过程
declare #  什么变量 ---> declare  
old  # 新数据之前
new  #  新数据之后
drop #  删除什么    drop  view name     删除名称叫name的视图

delimiter  $
create  table  zl(
id int not null   auto_increment unique,
txt char(30) not null ,
js char(100) ,
index txt(txt(4))
) engine innodb character SET utf8 COLLATE utf8_unicode_ci $
 #engine innodb charset utf8_unicode_ci  $  # 都可以




create table ip(
id int(8) not null unique auto_increment,
sj datetime not null,
tm_wday varchar(1) not null,
IP varchar(15) ,
wh ENUM('1','2')   
)engine innodb character SET utf8 COLLATE utf8_unicode_ci;
 
select * from ip where sj >= (select concat(date(now()),' 17:00:00')) || tm_wday =0



create table ii(
id int(3) not null unique auto_increment ,
na varchar(10) not null,
me varchar(10) not null,
sj datetime,
nei  varchar(200) not null,
index ee(na,me(2))
)engine innodb character SET utf8 COLLATE utf8_unicode_ci;


unique  唯一索引 #  所在 column的value 不许重复，叫唯一索引
fulltext # 全文索引 中文无效
key 
index 
unique key   唯一索引
primary key() 主键索引。一张变只能有一个主键索引

# 多列索引就是把2列或多列看成一个整体的索引，然后建索引
key(column1,column2)  # 多列索引
memcached


红包表1（
Hid      Hzong          zongf       lingf           ksj         jsj               LHzong
ID红包   红包总金额  红包分成的份数 已经领取的份数  红包开始时间  红包结束时间   红包已经领取总金额

）
领红包表2（
 Lid                    openid         lzong
领取红包表2的ID  领取红包的openID  领红包总金额【包含不同开始时间红包】

 unique key openID(openID)
）

详情表3（
Lid                 Hid                 j                           sj
领红包表2的ID   领取红包表1的ID   领红包金额【本次抽取的】     领红包时间【微信没有返回时间，以收到数据时间为领取时间】 

key(id2,id1)
）

drop table hong;
drop table ling;
drop table xiang;

create table liang(
sj  datetime not null,
l TINYINT(8) UNSIGNED

);



create table hong(
Hid int(9) not null unique auto_increment,
Hzong FLOAT(9,3) UNSIGNED  not null,
zongf int(8) UNSIGNED not null,
lingf int(8) UNSIGNED,
ksj  datetime  ,
jsj  datetime ,
LHzong   FLOAT(9,3) 
)engine innodb character SET utf8 COLLATE utf8_unicode_ci;

create table ling(
Lid int(8) not null unique auto_increment,
Lzong  FLOAT(9,3) UNSIGNED  not null,
openid varchar(64) not null,
unique  openid(openid)
)engine innodb character SET utf8 COLLATE utf8_unicode_ci;

create table  xiang(
Lid   int(9) not null ,
Hid int(9) not null,
j  FLOAT(9,3) UNSIGNED  not null,
sj datetime not null,
 key(Lid ,Hid) 
)engine innodb character SET utf8 COLLATE utf8_unicode_ci;

--  select hid.hong,ksj.hong,hzong.hong,Lzong.ling,openid.ling as lingqumingc from 
-- hong INNER JOIN ling
-- where Lid.hong=

select hong.Hid,hong.

desc select  xiang.Hid,xiang.Lid,xiang.j,ling.Lzong,ling.openid from ling
inner join  xiang 
ON xiang.Lid=ling.Lid





 insert into ling (Lzong,openid)values(1212.324,'reererer');
insert into hong(Hzong,zongf,ksj,jsj,LHzong) values(10000 , 100, now(),now(),12);
 insert into xiang(Lid,Hid,sj,j) values(2,1,now(),23.32);

#　　主从服务器
/*
主服务器执行sql并将语句写入   binlog 日志 -> insert update delete 主服务器信息
从服务器   读取binlog   ,将读来的数据化为 relavlog  再写入从服务器

从服务器如何读取主服务器有权读取binlog（binlog是敏感信息。）

一主多从
主主赋值
 server  ip防止

*/


show variables like 'autocommit'; # 查看事务状态
alter table   tablename  enging =innodb;  # 修改表引擎

mysql 存储引擎
myslSAM 引擎 坏处：不支持事务，行级锁。缺陷崩溃后无法完全恢复    myslSAM引擎用于只读数据或表小的
myd 为数据文件   myl为索引文件

 

 *************************** 1. row ***************************
       Table: user
Create Table: CREATE TABLE `user` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Password` char(41) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '
',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Reload_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Shutdown_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Process_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `File_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_db_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Super_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',

  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Repl_slave_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Repl_client_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_user_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tablespace_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N'
,
  `ssl_type` enum('','ANY','X509','SPECIFIED') CHARACTER SET utf8 NOT NULL DEFAU
LT '',
  `ssl_cipher` blob NOT NULL,
  `x509_issuer` blob NOT NULL,
  `x509_subject` blob NOT NULL,
  `max_questions` int(11) unsigned NOT NULL DEFAULT '0',
  `max_updates` int(11) unsigned NOT NULL DEFAULT '0',
  `max_connections` int(11) unsigned NOT NULL DEFAULT '0',
  `max_user_connections` int(11) unsigned NOT NULL DEFAULT '0',
  `plugin` char(64) COLLATE utf8_bin DEFAULT '',
  `authentication_string` text COLLATE utf8_bin,
  PRIMARY KEY (`Host`,`User`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and global
privileges'
1 row in set (0.00 sec)