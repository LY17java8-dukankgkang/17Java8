-- 查看商品类别表(Category)
select*from Category
-- 查看商品信息表（Ware）
select*from Ware
-- 查看员工表（Employee）
select*from Employee
-- 查看销售记录表（ SalesInfo）
select*from  SalesInfo

--添加商品类别
insert into Category (cname,Description)values('食物类','食物')
insert into Category (cname,Description)values('家电类','电器')
insert into Category (cname,Description)values('服装类','衣服')
insert into Category (cname,Description)values('日化类','日化')
--修改信息
--update Category set Description='饮食类' where Description='饮品类'

--添加商品信息
insert into Ware(Wname,Cid,PurchasePrice,SalesPrice,Amount)values('北京方便面','1','1','2','452')
insert into Ware(Wname,Cid,PurchasePrice,SalesPrice,Amount)values('鸡腿','1','2','3','435')
insert into Ware(Wname,Cid,PurchasePrice,SalesPrice,Amount)values('吹风机','2','15','20','68')
insert into Ware(Wname,Cid,PurchasePrice,SalesPrice,Amount)values('电风扇','2','45','60','53')
insert into Ware(Wname,Cid,PurchasePrice,SalesPrice,Amount)values('耐克鞋子','3','120','150','98')
insert into Ware(Wname,Cid,PurchasePrice,SalesPrice,Amount)values('花花公子外套','3','140','165','45')
insert into Ware(Wname,Cid,PurchasePrice,SalesPrice,Amount)values('纳爱斯牙膏','4','5','8','156')
insert into Ware(Wname,Cid,PurchasePrice,SalesPrice,Amount)values('镜子','4','3','5','135')

--添加员工信息
insert into Employee(Ename,Epassword,Remark)values('冬子','1234567','靓妹一枚')
insert into Employee(Ename,Epassword,Remark)values('小春','1234567','靓妹一枚')
insert into Employee(Ename,Epassword,Remark)values('秋香','1234567','靓妹一枚')
insert into Employee(Ename,Epassword,Remark)values('丁香','1234567','靓妹一枚')

--添加销售记录
update Ware set Amount=Amount-1 where Wname='吹风机'insert into SalesInfo values(3,'2017-10-03',1,1001)update Ware set Amount=Amount-1 where Wname='花花公子外套'insert into SalesInfo values(6,'2017-5-6',1,1004)update Ware set Amount=Amount-5 where Wname='北京方便面'insert into SalesInfo values(1,'2017-2-9',5,1003)update Ware set Amount=Amount-3 where Wname='纳爱斯牙膏'insert into SalesInfo values(7,'2017-6-17',3,1002)--1.冬子在2010-06-02销售了吹风机一个、纳爱斯牙膏一支、北京方便面三袋update Ware set Amount=Amount-1 where Wname='吹风机'insert into SalesInfo values(3,'2010-06-02',1,1001)update Ware set Amount=Amount-1 where Wname='纳爱斯牙膏'insert into SalesInfo values(3,'2010-06-02',1,1001)update Ware set Amount=Amount-3 where Wname='北京方便面'insert into SalesInfo values(3,'2010-06-02',3,1001)--2.查询库存量低于100的商品的基本信息select*from Ware where Amount<100--3.查询显示每件商品的编号,名称以及利润,按利润从高到低进行排序select Wid,Wname,SalesPrice-PurchasePrice as 利润from Ware order by 利润 desc--4.统计每件商品的销售量，显示商品名称及销售量，按销售量从高到低排序
select Wname,sum(SalesAmount) as 销售量
from Ware w,SalesInfo s
where w.Wid=s.Wid group by Wname order by sum(SalesAmount) desc
--5.统计每件商品的销售量，显示商品名称及销售量
select Cname,sum(SalesAmount) as 销售量
from Category c,Ware w,SalesInfo s
where w.cid=c.Cid and w.Wid=s.Wid group by c.cname
--6.查询每笔销售的详细信息，包括商品名，销售时间，销售数量，收银员
select W.wname,s.SalesDate,sum(s.SalesAmount),e.ename
from Ware w,Employee e,SalesAmount s
where w.Wid=s.Wid and e.Eid=s.Eid
--7.查询销售利润大于10元的商品编号、名称、进价、售价及利润
select Wid,Wname,PurchasePrice,SalesPrice,SalesPrice-PurchasePrice
from Ware where SalesPrice-PurchasePrice>10
