drop table Admin cascade constraints;
drop table Manager cascade constraints;
drop table Customer cascade constraints;
drop table Login cascade constraints;
drop table Delivery cascade constraints;
drop table Delivery_Place cascade constraints;
drop table Courier cascade constraints;
drop table Bill cascade constraints;
drop table Cust_Phno cascade constraints;
drop table Mgr_phno cascade constraints;
drop table Admin_Phno cascade constraints;

create table Admin
(
  id varchar2(20) primary key,
  Fname varchar2(20),
  Lname varchar2(20),
  Address varchar2(20)
);

create table Manager
(
  id varchar2(20) primary key,
  Fname varchar2(20),
  Lname varchar2(20),
  address varchar2(20),
  Admin_id varchar2(20),
  foreign key(Admin_id) references Admin(id)
);

create table Customer
(
  id varchar2(20) primary key,
  Fname varchar2(20),
  Lname varchar2(20),
  address varchar2(30),
  Admin_id varchar2(20),
  Mgr_id varchar2(20),
  foreign key(Admin_id) references Admin(id),
  foreign key(Mgr_id) references Manager(id)
);

create table Login
(
  Loginid varchar2(20) primary key,
  password varchar2(20),
  Mgr_id varchar2(20),
  Cust_id varchar2(20),
  Admin_id varchar2(20),
  foreign key (Mgr_id) references Manager(id),
  foreign key (Cust_id) references Customer(id),
  foreign key (Admin_id) references Admin(id)
);


create table Delivery
(
  id varchar2(20) primary key,
  Del_date date,
  Admin_id varchar2(20),
  Mgr_id varchar2(20),
  foreign key(Admin_id) references Admin(id),
  foreign key(Mgr_id) references Manager(id)
  
);

create table Delivery_Place
(
  House_no int primary key,
  city varchar2(30),
  Dest_pincode int,
  Del_id varchar2(20),
  foreign key(Del_id) references Delivery(id)
);

create table Courier
(
  id varchar2(20) primary key,
  weight_in_grams float,
  Admin_id varchar2(20),
  Mgr_id varchar2(20),
  Cust_id varchar2(20),
  foreign key (Admin_id) references Admin(id),
  foreign key (Mgr_id) references Manager(id),
  foreign key (Cust_id) references Customer(id)
);

create table Bill
(
  id varchar2(20),
  Cust_id varchar2(20),
  amount float,
  Mgr_id varchar2(20),
  foreign key(Mgr_id) references Manager(id),
  foreign key(Cust_id) references Customer(id),
  primary key(id,Cust_id)
);

create table Admin_Phno
(
  Admin_id varchar2(20),
  Phno varchar2(20),
  foreign key(Admin_id) references Admin(id)
);

create table Mgr_Phno
(
  Mgr_id varchar2(20),
  Phno varchar2(20),
  foreign key(Mgr_id) references Manager (id)
);

create table Cust_Phno
(
  Cust_id varchar2(20),
  Phno varchar2(20),
  foreign key(Cust_id) references Customer (id)
);


insert into Admin values('A200','Sucheta','Mehta','Mumbai');

insert into Manager values('Mg001','Harshad','Mehta','hubli','A200');
insert into Manager values('Mg002','Uma','Pawar','Bengaluru','A200');
insert into Manager values('Mg003','John','Geller','Mysore','A200');
insert into Manager values('Mg004','Ramesh','Nayak','Dharwad','A200');
insert into Manager values('Mg005','Ram','Patil','Hubli','A200');
insert into Manager values('Mg006','Kavana','Patil','Dharwad','A200');
insert into Manager values('Mg007','Sania','Vasishta','Bengaluru','A200');
insert into Manager values('Mg008','Michel','Green','Mysore','A200');
insert into Manager values('Mg009','Sham','Nayak','Mysore','A200');
insert into Manager values('Mg010','Geeta','Patil','Hubli','A200');

insert into Customer values('C321','Shiva','Kulkarni','#8 vidyanagar hubli','A200','Mg001'); 
insert into Customer values('C322','Pratiksha','Deshpande','#23 Malleshwaram Bengaluru','A200','Mg002'); 
insert into Customer values('C323','Pratyusha','Patil','#56 Ganesh Nagar Mysore','A200','Mg003'); 
insert into Customer values('C324','Sangeeta','Joshi','#58 vidyanagr Dharwad','A200','Mg004'); 
insert into Customer values('C325','Yamini','Parmar','#78 Unkal Road hubli','A200','Mg005'); 
insert into Customer values('C326','Sahana','Tiwari','#12 Maratha colony Dharwad','A200','Mg006'); 
insert into Customer values('C327','Arpita','Talpade','#89 VijayNagar Bengaluru','A200','Mg007'); 
insert into Customer values('C328','Sachin','Deshmukh','#123 hospete mysore','A200','Mg008'); 
insert into Customer values('C329','Shyam','Vasishta','#71 Gokul Road Mysore','A200','Mg009'); 
insert into Customer values('C330','Santosh','Kulkarni','#98 vidyanagar Hubli','A200','Mg010');

insert into Login values('A2000@gmail.com','abc123*','','','A200');
insert into Login values('Mg001@gmail.com','ghty45#','Mg001','','');
insert into Login values('Mg002@gmail.com','jkyu9*','Mg002','','');
insert into Login values('Mg003@gmail.com','ghty56er','Mg003','','');
insert into Login values('Mg004@gmail.com','dfGtrr5','Mg004','','');
insert into Login values('Mg005@gmail.com','hjyuiro*','Mg005','','');
insert into Login values('Mg006@gmail.com','ui89ty','Mg006','','');
insert into Login values('Mg007@gmail.com','Hy56RE','Mg007','','');
insert into Login values('Mg008@gmail.com','KL98Vb','Mg008','','');
insert into Login values('Mg009@gmail.com','IO98sd','Mg009','','');
insert into Login values('Mg010@gmail.com','nm67Gh','Mg010','','');
insert into Login values('C321@gmail.com','yu89Sd','','C321','');
insert into Login values('C322@gmail.com','Qw34Er','','C322','');
insert into Login values('C323@gmail.com','MnVcd4#','','C323','');
insert into Login values('C324@gmail.com','Sgh67ty','','C324','');
insert into Login values('C325@gmail.com','Kl239hd','','C325','');
insert into Login values('C326@gmail.com','Ao9Xc','','C326','');
insert into Login values('C327@gmail.com','Peck78','','C327','');
insert into Login values('C328@gmail.com','Bntg6h','','C328','');
insert into Login values('C329@gmail.com','Bt56dh','','C329','');
insert into Login values('C330@gmail.com','Rd92Kj','','C330','');

insert into Courier values('Cr567',600.9,'A200','Mg001','C321');  
insert into Courier values('Cr568',200.6,'A200','Mg002','C322');
insert into Courier values('Cr569',156.8,'A200','Mg003','C323');
insert into Courier values('Cr570',459.8,'A200','Mg004','C324');
insert into Courier values('Cr571',758.89,'A200','Mg005','C325');
insert into Courier values('Cr572',328.90,'A200','Mg006','C326');
insert into Courier values('Cr573',997.8,'A200','Mg007','C327');
insert into Courier values('Cr574',78.0,'A200','Mg008','C328');
insert into Courier values('Cr575',678.2,'A200','Mg009','C329');
insert into Courier values('Cr576',235.9,'A200','Mg010','C330');

insert into Bill values('BL034','C321','901','Mg001');
insert into Bill values('BL035','C322','300','Mg002');
insert into Bill values('BL036','C323','235','Mg003');
insert into Bill values('BL037','C324','688','Mg004');
insert into Bill values('BL038','C325','1137','Mg005');
insert into Bill values('BL039','C326','492','Mg006');
insert into Bill values('BL040','C327','1495','Mg007');
insert into Bill values('BL041','C328','117','Mg008');
insert into Bill values('BL042','C329','1017','Mg009');
insert into Bill values('BL043','C330','352','Mg010');

insert into Admin_Phno values('A200','9756432189');
insert into Admin_Phno values('A200','1234567890');

insert into Mgr_Phno values('Mg001','23455735489');
insert into Mgr_Phno values('Mg001','9845673426');
insert into Mgr_Phno values('Mg002','8975655778');
insert into Mgr_Phno values('Mg003','4563728910');
insert into Mgr_Phno values('Mg004','7684658305');
insert into Mgr_Phno values('Mg004','8856483467');
insert into Mgr_Phno values('Mg005','9084473454');
insert into Mgr_Phno values('Mg006','6783542535');
insert into Mgr_Phno values('Mg007','3679877235');
insert into Mgr_Phno values('Mg007','3476589012');
insert into Mgr_Phno values('Mg008','7865439067');
insert into Mgr_Phno values('Mg009','6589350123');
insert into Mgr_Phno values('Mg009','7650981276');
insert into Mgr_Phno values('Mg010','7034521678');

insert into Cust_Phno values('C321','7890456342');
insert into Cust_Phno values('C322','5678904321');
insert into Cust_Phno values('C323','9756342510');
insert into Cust_Phno values('C324','1234746589');
insert into Cust_Phno values('C325','9876405321');
insert into Cust_Phno values('C326','9056132477');
insert into Cust_Phno values('C327','4563728190');
insert into Cust_Phno values('C328','7856394021');
insert into Cust_Phno values('C329','9563792749');
insert into Cust_Phno values('C330','1243546577');
insert into Cust_Phno values('C321','6543890890');
insert into Cust_Phno values('C322','2124354656');
insert into Cust_Phno values('C323','6576879809');
insert into Cust_Phno values('C324','7687980921');
insert into Cust_Phno values('C325','4354576879');


insert into Delivery values('DEL101','03-feb-2021','A200','Mg001');
insert into Delivery values('DEL102','04-mar-2021','A200','Mg002');
insert into Delivery values('DEL103','04-jun-2021','A200','Mg003');
insert into Delivery values('DEL104','04-mar-2021','A200','Mg004');
insert into Delivery values('DEL105','04-Aug-2021','A200','Mg005');
insert into Delivery values('DEL106','09-Sep-2021','A200','Mg006');
insert into Delivery values('DEL107','12-Nov-2021','A200','Mg007');
insert into Delivery values('DEL108','08-Dec-2021','A200','Mg008');
insert into Delivery values('DEL109','03-Jan-2021','A200','Mg009');
insert into Delivery values('DEL110','11-Oct-2021','A200','Mg010');


insert into Delivery_Place values(435,'chennamma circle kittur',591303,'DEL101');
insert into Delivery_Place values(987,'KK colony Dharwad',591230,'DEL102');
insert into Delivery_Place values(167,'SG Circle Bailhongal',567892,'DEL103');
insert into Delivery_Place values(965,'KR Colony Halyal',543281,'DEL104');
insert into Delivery_Place values(345,'vidyanagar hubli',456371,'DEL105');
insert into Delivery_Place values(986,'indiranagar mysore',981761,'DEL106');
insert into Delivery_Place values(154,'Nehru circle raichur',543981,'DEL107');
insert into Delivery_Place values(789,'Gandhinagar Belagum',583421,'DEL108');
insert into Delivery_Place values(302,'HR Colony Gulbarga',908651,'DEL109');
insert into Delivery_Place values(463,'Sardar Colony Hossur',954219,'DEL110');

select * from Admin;
select * from Manager;
select * from Customer;
select * from Mgr_Phno;
select * from Cust_Phno;
select * from Admin_Phno;
select * from Bill;
select * from courier;
select * from Delivery;
select * from Delivery_Place;


                             /*MULTIPLE TABLE JOIN OPERATIONS*/

/*1.retrieve details of delivery place whose manager id is Mg001*/
select a.HOUSE_NO,a.CITY,a.DEL_ID
from Delivery d,Delivery_Place a,Manager m
where a.del_id=d.id and d.Mgr_id=m.id and d.Mgr_id like'Mg001';

/*2.retrieve details of courier whose mgr_id=Mg006*/
select a.ID,a.WEIGHT_IN_GRAMS,a.MGR_ID,a.CUST_ID,a.ADMIN_ID
from courier a,Manager m
where a.Mgr_id=m.ID and m.ID='Mg006';

/*3.retrieve the name and id of customer and the manager name he is assigned to*/
select c.Fname,c.Lname,c.id,m.Fname,m.Lname
from Customer c
join Manager m on m.id=c.Mgr_id;

/*4.retrieve the name and id customer and his Login id*/
select c.Fname,c.Lname,l.Loginid
from Customer c
join Login l on l.Cust_id=c.id;

/*5.Querying Manager And Customers*/
select * from Manager,Customer
where Manager.id=Customer.Mgr_id and Customer.Lname like 'Kulkarni';
 

                         /*ARITHMETIC AND LOGIC OPERATIONS*/
/*1.retrieve details whose courier is delivered on date 4/3/21 */
select *
from delivery d
where Del_date like '04-03-21';

/*2.retrieve details of the customer whose phone no is 9756342510*/
select c.id,c.fname,c.lname,c.address
from Customer c,Cust_Phno d
where d.PHNO = 9756342510 and d.CUST_ID=c.id;

/*3.Retrieve id and first name of all customers whose courier weight is more than 200grams*/
select c.id,c.Fname
from Customer c,Courier cr
where c.id=cr.Cust_id and cr.weight_in_grams>200;

/*4.Retrieve Customer name of all customers whose bill amount is more than 500rs. also print respective bill id*/
select c.Fname,c.Lname,b.id
from Customer c ,Bill b
where c.id=b.Cust_id and b.amount>500;

/*5.manager who is from hubli or last name is patil*/
select * from manager
where manager.lname like 'Patil'  or address like 'hubli';

/*6.Query Courier and Delivery Info */
select * from Courier,Delivery,Delivery_Place
where Courier.Mgr_id=Delivery.Mgr_id and Delivery.id=Delivery_Place.del_id and Delivery_Place.Dest_Pincode=591303;

/*7.query Delivery info which is managed by managers along with respective Customer info*/
select  Delivery.id,Delivery_Place.Dest_pincode,Customer.id,Cust_Phno.Phno
from Delivery,Delivery_Place,Customer,Cust_Phno
where Delivery.id=Delivery_Place.Del_id and Customer.id=Cust_Phno.Cust_id and Delivery.Mgr_id=Customer.Mgr_id;

/*8.Courier And Its Bill*/
select Bill.amount,Bill.id,Courier.id from Courier,Bill,Customer
where  Courier.Mgr_id=Bill.Mgr_id and Courier.Mgr_id=Customer.Mgr_id;

                           /*DIFFERENT CLAUSES AND FUNCTIONS*/

/*1.select no of managers under admin id =A200*/
select count(*)
from manager
where Admin_id='A200';

/*2.select no of courier that are delivered on date 3/2/21 */
select count(*)
from Delivery
where Del_date like '04-03-21';

/*3.retrieve name and id of managers who have more than one phone number*/
select m.Fname,m.Lname,m.id 
from Manager m,Mgr_Phno mp
where m.id=mp.Mgr_id 
group by m.Fname,m.Lname,m.id
having count(mp.Phno)>1;

/*4.Retrieve sum of amount of all couriers delivered after 04-june-2021 */
select SUM(b.amount)
from Delivery d,Bill b
where b.Mgr_id=d.Mgr_id
and Del_date>'04-june-2021';

/*5.query Customers having more than one phone number with phone numbers*/
select c.id,c.fname
from Customer c,Cust_Phno p
where c.id=p.Cust_id
group by c.id,c.fname
having count(Cust_id);

                                /*SUB QUERY*/
/*retrieve details manager whose couriers are placed weight_in_grams is >500*/
select m.id,m.fname,m.lname,m.ADDRESS
from manager m
where m.id IN(select MGR_ID
            from courier
            where WEIGHT_IN_GRAMS>500
            GROUP BY MGR_ID);
            
/*2.retrieve details of the customer whose courier is with maximum weight*/
select c.ID,c.FNAME,c.LNAME,c.ADDRESS,c.ADMIN_ID
from Customer c
where c.ID= (select a.cust_id
             from courier a
             where a.WEIGHT_IN_GRAMS=(select max(WEIGHT_IN_GRAMS)
                                       from courier));
                                       
/*3.Retrieve bill id and amount of all bills having bill amount more than average amount*/
select id,amount
from Bill
where amount>(select avg(amount)
              from Bill);
              
/*4.Retrieve Courier id and weight of all curiers whose weight is less than average weight of all couriers*/
select id,weight_in_grams
from Courier 
where weight_in_grams<(select avg(weight_in_grams)
                        from Courier);
              
              
                                   /*VIEWS*/
/*1. Create a view to store the Customer name and Customer id of all customers who's courier bill is more than Rs.2000*/
create view Customer_Bill as
select C.Fname,C.Lname,C.id
from Customer C,Bill B
where C.id=B.Cust_id;

/*2.Create a view to store the details of all managers having more than one phone number*/
create view Mgr_Contact_details as
select *
from Manager,Mgr_Phno
where id=Mgr_id;

/*3.create view to store  bill info along with courier info*/
create view bill_Courier as
select b.id,c.id as cor_id
from Bill b ,Courier c
where b.Cust_id=c.Cust_id;

/*4.create view to store courier and its customer info*/
create view courier_customer as
select courier.id,Customer.id as C_id
from courier ,Customer 
where courier.cust_id=Customer.id;

/*5.create view to store delivery and respective customer info*/
create view delivery_customer as
select  Delivery.id,Delivery_Place.Dest_pincode,Customer.id as c_id,Cust_Phno.Phno
from Delivery,Delivery_Place,Customer,Cust_Phno
where Delivery.id=Delivery_Place.Del_id and Customer.id=Cust_Phno.Cust_id and Delivery.Mgr_id=Customer.Mgr_id;

/*6.create view to store login id of managers*/
create view  loginid_mgr as
select loginid
from login
where loginid like 'Mg___@gmail.com';

/*7.create view to store login id of Customers*/
create view  loginid_Cust as
select loginid
from login
where loginid like 'C___@gmail.com';





  



              