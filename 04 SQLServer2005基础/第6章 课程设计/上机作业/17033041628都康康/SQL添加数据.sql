-- �鿴��Ʒ����(Category)
select*from Category
-- �鿴��Ʒ��Ϣ��Ware��
select*from Ware
-- �鿴Ա����Employee��
select*from Employee
-- �鿴���ۼ�¼�� SalesInfo��
select*from  SalesInfo

--�����Ʒ���
insert into Category (cname,Description)values('ʳ����','ʳ��')
insert into Category (cname,Description)values('�ҵ���','����')
insert into Category (cname,Description)values('��װ��','�·�')
insert into Category (cname,Description)values('�ջ���','�ջ�')
--�޸���Ϣ
--update Category set Description='��ʳ��' where Description='��Ʒ��'

--�����Ʒ��Ϣ
insert into Ware(Wname,Cid,PurchasePrice,SalesPrice,Amount)values('����������','1','1','2','452')
insert into Ware(Wname,Cid,PurchasePrice,SalesPrice,Amount)values('����','1','2','3','435')
insert into Ware(Wname,Cid,PurchasePrice,SalesPrice,Amount)values('�����','2','15','20','68')
insert into Ware(Wname,Cid,PurchasePrice,SalesPrice,Amount)values('�����','2','45','60','53')
insert into Ware(Wname,Cid,PurchasePrice,SalesPrice,Amount)values('�Ϳ�Ь��','3','120','150','98')
insert into Ware(Wname,Cid,PurchasePrice,SalesPrice,Amount)values('������������','3','140','165','45')
insert into Ware(Wname,Cid,PurchasePrice,SalesPrice,Amount)values('�ɰ�˹����','4','5','8','156')
insert into Ware(Wname,Cid,PurchasePrice,SalesPrice,Amount)values('����','4','3','5','135')

--���Ա����Ϣ
insert into Employee(Ename,Epassword,Remark)values('����','1234567','����һö')
insert into Employee(Ename,Epassword,Remark)values('С��','1234567','����һö')
insert into Employee(Ename,Epassword,Remark)values('����','1234567','����һö')
insert into Employee(Ename,Epassword,Remark)values('����','1234567','����һö')

--������ۼ�¼
update Ware set Amount=Amount-1 where Wname='�����'insert into SalesInfo values(3,'2017-10-03',1,1001)update Ware set Amount=Amount-1 where Wname='������������'insert into SalesInfo values(6,'2017-5-6',1,1004)update Ware set Amount=Amount-5 where Wname='����������'insert into SalesInfo values(1,'2017-2-9',5,1003)update Ware set Amount=Amount-3 where Wname='�ɰ�˹����'insert into SalesInfo values(7,'2017-6-17',3,1002)--1.������2010-06-02�����˴����һ�����ɰ�˹����һ֧����������������update Ware set Amount=Amount-1 where Wname='�����'insert into SalesInfo values(3,'2010-06-02',1,1001)update Ware set Amount=Amount-1 where Wname='�ɰ�˹����'insert into SalesInfo values(3,'2010-06-02',1,1001)update Ware set Amount=Amount-3 where Wname='����������'insert into SalesInfo values(3,'2010-06-02',3,1001)--2.��ѯ���������100����Ʒ�Ļ�����Ϣselect*from Ware where Amount<100--3.��ѯ��ʾÿ����Ʒ�ı��,�����Լ�����,������Ӹߵ��ͽ�������select Wid,Wname,SalesPrice-PurchasePrice as ����from Ware order by ���� desc--4.ͳ��ÿ����Ʒ������������ʾ��Ʒ���Ƽ������������������Ӹߵ�������
select Wname,sum(SalesAmount) as ������
from Ware w,SalesInfo s
where w.Wid=s.Wid group by Wname order by sum(SalesAmount) desc
--5.ͳ��ÿ����Ʒ������������ʾ��Ʒ���Ƽ�������
select Cname,sum(SalesAmount) as ������
from Category c,Ware w,SalesInfo s
where w.cid=c.Cid and w.Wid=s.Wid group by c.cname
--6.��ѯÿ�����۵���ϸ��Ϣ��������Ʒ��������ʱ�䣬��������������Ա
select W.wname,s.SalesDate,sum(s.SalesAmount),e.ename
from Ware w,Employee e,SalesAmount s
where w.Wid=s.Wid and e.Eid=s.Eid
--7.��ѯ�����������10Ԫ����Ʒ��š����ơ����ۡ��ۼۼ�����
select Wid,Wname,PurchasePrice,SalesPrice,SalesPrice-PurchasePrice
from Ware where SalesPrice-PurchasePrice>10
