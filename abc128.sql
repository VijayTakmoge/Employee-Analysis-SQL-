show databases ;

use pga46;
create database pga46 ;

create table empy_details(
empy_name varchar (20),
age int,
id int) ;

show tables ;

select * from empy_details ;

insert into empy_details (empy_name,age,id) values
('vijay',23,'123'),
('anand',24,'124');

select *from empy_details ;

create table salaries (
 id int,
 salary int,
 city varchar (12) );
 
 insert into salaries (id,salary,city) values
 ('123',28000,'pune'),
 (124,25000,'mumbai');

create table customes (
cust_name varchar (23),
cust_id int,
primary key (cust_id) );

insert into customes (cust_name, cust_id) values
('vijay',123),
('anand',234);

select *from customes ;

create table shirt (
brand varchar (10),
size enum ('s','m','l','xl'),
price int );

insert into shirt (brand, size,price) values
('us polo','l',2300),
('bonkares', 'xl',2400);

select *from shirt ;

create table bank_detail(
cust_name varchar (20),
id int,
country varchar (10) default ('india')) ;

insert into bank_detail( cust_name,id) values 
('vijay',121),
('anand',123);

use pga46;

select * from bank_detail;

select * from products ;

select count(*) from products ;

select max(price) from products ;

select min(price) from products;

select sum(price) from products;

select distinct (prod_name) from products;_

select count(distinct (prod_name)) from products;

select count(distinct (prod_name)) as dist_count from products;

select * , price*quantity as sales_value from products ;

select avg (quantity) from products ;

select prod_name , max(price) from products group by 1  order by 2;

select prod_name , round(avg(price) ) as avg_price from products group by 1  ;

select count(*) from sales_data_sample ;

select distinct country from sales_data_sample ;

select count(distinct( country ))from sales_data_sample ;

select status ,count(status) from sales_data_sample group by 1 order by 2;

select sum(sales) as net_sales from sales_data_sample ;

select round(sum(sales)/1000000,2) as net_sales from sales_data_sample;

select country , round(sum(sales) ,1) from sales_data_sample group by 1 order by 2;

select count(distinct(productline)) from sales_data_sample ;

select country ,avg(sales) from sales_data_sample group by 1;

select distinct(country), count(distinct(sales)) from sales_data_sample group by 1 order by 2;

select * from sales_data_sample where country='usa';

select * from sales_data_sample where country='usa'or
  country='france' or
  country='spain';
  
  select count(*) from sales_data_sample where country in ('usa','france','spain');
  
  select * from sales_data_sample where country in ('usa','france','spain') 
  and sales > 5000 and status='shipped' ;
  
  select productline , round(sum(sales)) from sales_data_sample group by 1 order by 2;
  
  select sum(quantityordered) from sales_data_sample where status='on hold';
  
  select round(avg(sales)) from sales_data_sample ;
  
  select sales,
  case 
  when sales < 1000 then 'lowervalue'
  when sales >=1000 and sales<=5000 then 'midvalues'
  else 'highvalues'
  end as 'sales_in_category'
  from sales_data_sample ;
  
  select distinct(country), territory from sales_data_sample where territory='enam';
  
  select count(*) from super_store ;
  
  select (state), round(sum(profit)) from super_store group by 1 order by 2 desc ;
  
  select segment, round(sum(sales)) from super_store where state='illinois' group by 1
 order by 2 desc ;
  
  select segment ,round(max(sales)) from super_store
  where state='illinois'
  group by 1 
  order by 2 desc ;
  
  
  ########--------------------------------------------------------------------------- 12/8/23
  use employees ;
  
select count(*) from employees; # 300024
  select count(*) from departments ; #9
  select count(*) from dept_manager; #24
  select count(*) from dept_emp; #331603
select count(*) from  salaries ; # 967330
select count(*) from titles ; # 443308
  
  ###########
  select * from  employees limit 5; 
  select * from salaries limit 5;
  select * from dept_manager ;
  select * from titles limit 100 ;
  select * from departments ;
  select * from dept_emp limit 100;
  
  #write a query to get the count of all the unique names present in employees table
  
  select (first_name) ,count(first_name) from employees group by 1 order by 2 desc   ;
  
 # like function % = all
 select * from employees where first_name like 'sanj%';
 
 # under scrol __ 2 times, it gives more char. how much we apply under scrol.
  select * from employees where first_name like 'sanj__';
   select * from employees where first_name like 'sanj____';
 
 # requirement to select only year part from date
 #starting position and length 
 select substr(birth_date,1,4) from  employees;
 
 select substr(birth_date,6,2) from  employees; 
 
 #and a new column ( age_at_hiring)  based on hire_date and birth_datre 
 #only using year part for calculation.
 select *, substr(hire_date,1,4)-substr(birth_date,1,4) from employees ;
 
 select  *,
 case 
  when salary > 50000 then 'low'
  when salary <=50000 and salary >=75000 then 'mid'
  else 'high'
  end as 'salary_category'
  from salaries ;


select distinct(title) from titles ;

#eng ,staff or ass eng ---> entrylevel
#sen staff, senor engg---> mid lvl
#tech lead and manager---> mgmt lvl

select *,
case 
when  title in ('engineer','staff','assistant engineer ') then 'entrylevel'
when title in ('senior engineer','senior staff') then 'midlevel'
else 'mgmtlvl' 
end as category
from titles;

create table tabA (
item varchar(20),
price int );

insert into tabA (item,price) values
('a',100),
('b',200),
('a',150),
('c',60),
('c',70),
('d',90),
('f',200),
('b',190);


create table tabB (
item varchar(20),
price int );

insert into tabB(item,price) values
('g',600),
('g',700),
('c',80),
('d',90),
('a',700),
('h', 190);

#more than 1 table

#1inner join
select tabA.item ,tabA.price ,tabB.item,tabB.price
from tabA
inner join
tabB 
on (tabA.item = tabB.item); # 2 tables

#2 left join
select tabA.item ,tabA.price ,tabB.item,tabB.item
from tabA
left join
tabB 
on (tabA.item = tabB.item); # 2 tables 

#3 right join 
select tabA.item ,tabA.price ,tabB.item,tabB.item
from tabA
right join
tabB 
on (tabA.item = tabB.item); #2 tables 

# get the emp_no , first name ,last name ,for all managers

select employees.emp_no, employees.first_name,employees.last_name
from employees
inner join
dept_manager
on (employees.emp_no= dept_manager.emp_no);

select e.emp_no, e.first_name,e.last_name
from employees as e
inner join
dept_manager as dm
on (e.emp_no= dm.emp_no);

select e.emp_no,e.first_name,e.last_name
from employees as e
inner join
dept_manager as dm
on (e.emp_no= dm.emp_no)
where  gender='f';


select e.emp_no,e.first_name,e.last_name, e.gender
from employees as e
inner join
dept_manager as dm
on (e.emp_no= dm.emp_no)
where  gender='f';
    
    #select all, the column ,join --> more than 2 tables 
    #where, group by, order by--> only for 1 table
    
    #get the emp_no,first_name ,last_name, title
    #from all the employees who are either engineer or asst enginer
select t.title,e.emp_no,e.first_name,e.last_name
from employees as e
inner join
titles as t
on (e.emp_no= t.emp_no)
where  t.title='engineer' or t.title='assistant engineer';

select t.title,e.emp_no,e.first_name,e.last_name
from employees as e
inner join
titles as t
on (e.emp_no= t.emp_no)
where  t.title in ('engineer','assistant engineer');


#########-----------------------------------------------------------------------------13/8/23
#emp_no, first_name,last_name avg salary for all employees
select e.emp_no,e.first_name,e.last_name,round(avg(s.salary),2) as avg_salary
from employees as e
inner join salaries as s on (e.emp_no=s.emp_no)
group by 1 order by 4 ; # group by 1 for name e.emp_no#  order by 4 for salary

#joins = inner joins
#beautify ---> looks good tool bar 


select e.emp_no,e.first_name,e.last_name, round(avg(s.salary))
from employees as e
inner join salaries as s on (e.emp_no=s.emp_no)
inner join dept_manager as dm on (e.emp_no=dm.emp_no)
group by 1 order by 4 desc ;

#emp_no, first_name,last_name ,avg(salary) only for those employees
#who are manager

select e.emp_no,e.first_name,e.last_name, t.title, round(avg(s.salary))
from employees as e
inner join salaries as s on (e.emp_no=s.emp_no)
inner join titles as t on (e.emp_no=t.emp_no)
where t.title = 'manager'
group by 1 order by  5 desc ;


# get the details )first_name ,last_name ,birthdate )for 
#all employeed who are senior engg and working in production department


select e.emp_no,e.first_name, e.last_name ,e.birth_date, t.title,dm.dept_no
from employees as e
inner join titles  as t on( e.emp_no=t.emp_no)
inner join dept_emp as dm on (t.emp_no=dm.emp_no)
where dm.dept_no ='d004' and t.title ='senior engineer';

select * from departments;
select e.first_name, e.last_name ,e.birth_date, t.title, d.dept_name
from employees as e
inner join titles  as t on(e.emp_no=t.emp_no)
inner join dept_emp as dm on (t.emp_no=dm.emp_no)
inner join departments as d on (d.dept_no=dm.dept_no)
where t.title='senior engineer' and d.dept_name='production';

# get the details )first_name ,last_name ,birthdate, avg_salary )for 
#all employeed who are senior engg and working in production department

select e.emp_no,e.first_name, e.last_name ,e.birth_date, t.title, d.dept_name, 
round(avg(s.salary))
from employees as e
inner join titles  as t on (e.emp_no = t.emp_no)
inner join dept_emp as dm on (e.emp_no = dm.emp_no)
inner join departments as d on (d.dept_no = dm.dept_no)
inner join salaries as s on (e.emp_no = s.emp_no)
where t.title='senior engineer' and d.dept_name='production'
group by 1 order by 7;

#case study:- departments
select * from departments;
#dept_no,dept_name,min,max,avg for salaary

select d.dept_no,d.dept_name,max(s.salary),min(s.salary),round(avg(s.salary))
from dept_emp as de
inner join salaries as s on (s.emp_no=de.emp_no)
inner join departments as d on (d.dept_no=de.dept_no) 
group by 1 order by 5;

select sysdate();
select * from employees;
#hire date tells when person join
#emp_no,f_name,l_name, salary ,new_salary
#for all employee who have join after 1990 and still working in company give them 25% hike

select e.emp_no,e.first_name,e.last_name ,s.salary,e.hire_date,
s.salary*1.25 as new_salary
from employees as e
inner join salaries as s on (e.emp_no=s.salary )
inner join dept_emp as de on (de.emp_no=e.emp_no)
group by 1
having max(de.to_date)> sysdate()
and e.hire_date>'1990-01-01' limit 100;



select * from salaries having salary > 100000;
select * from salaries where salary > 100000;

select first_name , count(first_name) from employees
where count(first_name) >210
group by 1
order by 2;
# where does not works on aggregate function 
#having should be used after group by and before order by


select first_name , count(first_name) from employees
group by 1
having  count(first_name) >210
order by 2;

#######------------------------------------------------------------14/8/23

#sub query (nested queries )
select salary from salaries order by salary desc limit 10;
select salary from salaries order by salary desc limit 1,1; #2nd higest salary 
# leve one and show 1(limit 1,1)
#leve 4 and show 1 (limit 4,1)
select max(salary) from salaries
where salary < 158220;        # 2nd higest salary less then 158220


select salary from salaries
where salary < 158220;       # all salary less then 158220           #1


select max(salary) from salaries
where salary < (select max(salary) from salaries);        # 2nd higest         #2 are same o/p


#write a sub query to find 3rd higest salary

select max(salary) from salaries
where salary <(select max(salary) from salaries
where salary < (select max(salary) from salaries));

create table markes(
id int ,
student_name varchar(20),
markes int) ;

insert into markes ( id,student_name,markes) values
(2,	'mohan',	70),
(3	,'bob',	71),
(10,	'peter'	,45),
(11	,'ruplai',	80),
(25	,'bindu',	65),
(123,	'rajendra',	83),
(55,	'san'	,65);

select * from markes;

# write a sub query to get thoes records who have scored markes 
#less than markes scored by ruplai

select * from markes
where markes<(select markes from markes where student_name = 'ruplai' ); 
# need to do coding in desc order for more than 1 select 

#emp_no,first_name,last_name
#only for manager but not using the join ues sub queary

select emp_no,first_name,last_name from employees 
where emp_no in(select emp_no from dept_manager);

select emp_no,first_name,last_name from employees 
where emp_no in(select emp_no from titles where title ='manager');

#get the 'emp_no' and salary of all the employees who belong to the department where
#where pradeep is the first name and Makrucki Is last name
#emp_no, salary use only sub query

#employees table - emp_no
#emp_no in dept_emp and get the dept_no
#use this dept_no to get all emp_no who are working in the same dept and now 
#use the above emp_no and get the salaries

select emp_no, salary from salaries where emp_no in(
select emp_no from dept_emp where dept_no=(
select dept_no from dept_emp where emp_no=
(select emp_no from employees
where first_name='pradeep'and last_name='makrucki')));


#write a sub query and get emp_no and avg salary which is more than grand averag
select  avg(salary) from salaries;

select emp_no,avg(salary) from salaries 
group by 1
having avg(salary) > (select avg(salary) from salaries);


#joins on composties key--->more than 1 column 
 #join more than 1 column #yes
select * from base_deatils;
select * from comp_deatils;

select b.upc, b.brand,b.model_number,
c.upc,c.brand,c.model_number
from base_deatils as b
inner join comp_deatils as c
on (b.upc=c.upc and b.brand=c.brand and b.model_number=c.model_number);


select * from dept_manager;


#match b.upc=c.upc
use employees;
select  de.dept_no, de.dept_name,  avg(s.salary) from 
departments as de
inner join dept_emp as d on (de.dept_no=d.dept_no)
inner join salaries as s on (d.emp_no=s.emp_no)
group by 1;


select e.emp_no,e.first_name,e.last_name ,e.hire_date,
s.salary*1.25 as new_salary
from employees as e
inner join salaries as s on(e.emp_no=s.emp_no)
inner join dept_manager as dm on(e.emp_no=dm.emp_no)
group by 1
having max(dm.to_date)>sysdate()
and e.hire_date>'1990-01-01'
order by 5;

set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');

##----------------------------------------------------------------------20/8/23

create table emp_details1(
emp_id int,
emp_name varchar (20),
mobile_no bigint check (mobile_no between 1000000000 and 9999999999));

insert into emp_details1 (emp_id,emp_name,mobile_no)values
(123,'vijay',1111111111),
(124,'anand',1222222222),
(125,'prashant',1333333333),
(126,'raj',1444444444);
select * from emp_details1;
# 2147483647 (small int)
#bigint ----(big number)

create table emp_details2(
emp_id int,
emp_name varchar (20),
mobile_no bigint check (mobile_no between 1000000000 and 9999999999));

insert into emp_details2 (emp_id,emp_name,mobile_no)values
(123,'vijay',1111111111),
(124,'anand',1222222222),
(125,'prashant',1333333333),
(126,'raj',1444444444),
(126,'raj',1444444444);

select * from emp_details;

select * from salesman; # salesman_id,name,city,commision
select * from orders;# ord_no,purch_amt,ord_date,customer_id,salesman_id
select * from customer;# custemor_id,cust_name,city,grade,salesman

#op 
 #salesman name,id,total_commision
 #sort them in descending order
 
select s.salesman_id,s.name,s.commision ,
round(sum(o.purch_amt))as total_sale,
  round(sum(o.purch_amt)* s.commision )
as total_commision
from salesman as s
inner join orders as o on(s.salesman_id=o.salesman_id)
group by 1
order by total_commision desc ;

#viwes
#our req to get emp_id of those employees and their latest dept_no
#who have more than 1 entry in table
select *from dept_emp;

select emp_no, dept_no,count(emp_no) , to_date from dept_emp
group by 1
having  count(emp_no)>1 and to_date > sysdate()order by emp_no;

create view v_latest_emp_dept_aug20 as
select emp_no, dept_no,count(emp_no) , to_date from dept_emp
group by 1
having  count(emp_no)>1 and to_date > sysdate()order by emp_no;

drop view v_latest_emp_dept_aug20;

#create a view name (v_avg_manager_salary) which show
#avg salary of all the managers

create view v_avg_manager_salary1 as 
select s.emp_no,round(avg(s.salary)) from salaries as s
inner join dept_manager as dm on (s.emp_no=dm.emp_no)
group by s.emp_no;

drop view v_avg_manager_salary1;

#

CREATE TABLE SALES_aug20 (
    purchase_id INT NOT NULL PRIMARY KEY,
    date_of_sale DATE NOT NULL,
    cust_id INT,
    item_code VARCHAR(10)
);
insert into SALES_aug20 values(1, "2020-01-01",  111 ,'phone'),
            (2,"2020-01-01",112 ,'tv'),
            (3,"2020-01-01",113 ,'tablet'),
               (4,"2020-01-01",114 ,'phone'),
                    (5,"2020-01-01",115 ,'per'),
          (6,"2020-01-01",116 ,'food'),
                  (7,"2020-01-01",117 ,'cloth'),
           (8,"2020-01-01",118 ,'shoes');
           
select * from SALES_aug20;

CREATE TABLE SALES_dup_aug20 (
    purchase_id INT NOT NULL PRIMARY KEY,
    date_of_sale DATE NOT NULL,
    cust_id INT,
    item_code VARCHAR(10)
);

insert into SALES_dup_aug20 values(1,"2020-01-01",211 ,'phone'),
          (2,"2020-01-01",212 ,'tv'),
       (3,"2020-01-01",213 ,'tablet'),
            (4,"2020-01-01",114 ,'phone'),
      (5,"2020-01-01",115 ,'per'),
     (6,"2020-01-01",116 ,'food'),
         (7,"2020-01-01",217 ,'cloth'),
          (8,"2020-01-01",218 ,'shoes');
          
  select * from SALES_dup_aug20;    
  
  #union 
  
  select item_code from SALES_aug20
  union 
  select item_code from SALES_dup_aug20;
  
  #union all
  select item_code from SALES_aug20
  union all
  select item_code from SALES_dup_aug20;
  
  create table students1
( stud_name varchar( 20) ,
  marks   int) ;

insert into students1 values
('rupali' ,90),
('geeta' , 50),
('mohan' , 87),
('tom' , 67),
('peter' , 76);



create table students2
( stud_name varchar( 20) ,
  marks   int) ;

insert into students2 values
('mac' , 66) ,
('rupali' , 98),
('ram' , 60),
('mohan' , 45),
('tom' , 69) ;

#those student and marks which are there in students but not in  students1
# left anti join #right anti join

select stud_name , marks 
from students1
where stud_name not in (select stud_name from students2);

select stud_name , marks 
from students2
where stud_name not in (select stud_name from students1);

#########--------------------------------------------------------------21/8/23

select * from orders;

set @cumulativesum :=0;
select ord_date,
purch_amt,round((@cumulativesum :=@cumulativesum +purch_amt))as cumsum
from orders;

create table cumulative_example
(month char(10),
sales int);

insert into cumulative_example values
('1',1000),
('2',1231),
('3',2000),
('4',2200),
('5',4000),
('6',3890);

select * from cumulative_example;

select month,
sales,
sum(sales) over (order by month) as cumulative_sales
from cumulative_example;

create table rank_exm1(
name varchar(10),
marks int );

insert into  rank_exm1 values( 'a' , 50 ),
                            ( 'b' , 59 ),
                            ( 'c' , 60 ),
                            ( 'd' , 45 ),
                            ( 'e' , 70 ),
                            ( 'f' , 60 ),
                            ( 'g' , 80 ),
                            ( 'h' , 64 ),
                            ( 'i' ,  80);
#122456669 ranks
select name, marks,
rank() over (order by marks) as marks_rank
from rank_exm1;

#12223445 ranks
select name, marks, dense_rank() 
over (order by marks)
as marks_rank from rank_exm1;


# alter command

create table alter_example(
id int,
emply_name varchar(20));

describe  alter_example;

alter table alter_example add constraint id primary key (id);

alter table alter_example drop primary key;
# alter can be used to drop the existing col

create table alter_example2(
id int ,
emply_name varchar(20),
age int,
country varchar(20));
delete emp_no from salaries;
select * from salaries;
drop table alter_example2;
# and u want to delete the country col
alter table alter_example2 drop country ;

select * from alter_example2;

#alter can also be used to change the name of existing col
#req is to change the name from id to emp_no
alter table alter_example2
change column id emp_no int ;

select * from  alter_example2;

# alter can used to add  unique constarint
alter table alter_example2 add constraint emp_no unique (emp_no);
select * from alter_example2;

# update is used to update the date based on some condtion

create table update_exam(
item_code varchar(20),
price int);

insert into update_exam values
('mouse',600),
('car',120),
('watch',2000),
('iphone',50000);

select* from update_exam ;
# consider i want to update price car----> 120 to 123456
update update_exam
set price = 1234567
where item_code = 'car'; 

set sql_safe_updates = 0 ;

# delete is use to delete the record from the existing table 
#based on same condition

delete from update_exam where item_code ='car';
describe update_exam;

# hire_date for person A was 1990 --> 2023
# emp_no, first_name , last_name , hire_date , years_In_company
#but only for those who are still working in the company

select e.emp_no,e.first_name,e.last_name,e.hire_date ,
(substr(sysdate(),1,4)-substr(hire_date,1,4)) as years_in_comapny
from employees as e
inner join dept_emp as d on (e.emp_no=d.emp_no)
group by 1
having  max(to_date)> sysdate();

# index ---fast check
select * from salaries where salary > 80000;

show index from salaries ; # to see the existing index in your data;

create index a_salary_1 on salaries(salary);
select * from salaries where salary>80000;