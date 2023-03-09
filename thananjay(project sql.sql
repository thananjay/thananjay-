create database exam1;
use exam1;
create table customer(customer_id int, cust_name char(30), city char(30), grade int, salesman int);
insert into customer values(3002,'roshan','pune',100,5001),
                            (3007,'sameer','pune',200,5001),
                            (3005,'josh','mumbai',200,5001),
                            (3008,'ajeem','nagpur',300,5002),
                            (3004,'ravi','jaipur',300,5006),
                            (3009,'pooja','kolkata',100,5003),
                            (3003,'atul','banglore',200,5007),
                            (3001,'tom','delhi',400,5005);
                           
            

create table salesman(salesman_id int,name char(30),city char(30),commission float);
insert into salesman values(5001,'ashish','mumbai',0.15),
                    (5002,'amol','amristar',0.13),
                    (5005,'ritesh','delhi',0.11),
                    (5006,'rajesh','pune',0.14),
                    (5003,'omkar','jaipur',0.12),
                    (5007,'abhi','nagpur',0.13);
                    
create table orders (ord_no int,purch_amt float,ord_date date,customer_id int, salesman_id int);
insert into orders values(70001,150.5,"2012-10-05",3005,5002),
                           (70009,270.65,"2012-09-10",3001,5005),
                           (70002,65.26,"2012-10-05",3002,5001),
                           (70004,110.5,"2012-08-17",3009,5003),
                           (70007,948.5,"2012-09-10",3005,5002),
                           (70005,2400.6,"2012-07-27",3007,5001),
              (70008,5760.0,"2012-09-10",3002,5001),
                            (70010,1983.43,"2012-10-10",3004,5006),
                     (70003,2480.4,"2012-10-10",3009,5003),
                 (70012,250.45,"2012-06-27",3008,5002),
                 (70011,75.29,"2012-08-17",3003,5007),
                      (70013,3045.6,"2012-04-25",3002,5001);
                      
SELECT customer.cust_name AS "Customer", customer.grade AS "Grade"
FROM orders, salesman, customer
WHERE orders.customer_id = customer.customer_id AND orders.salesman_id = salesman.salesman_id AND salesman.city IS NOT NULL
AND customer.grade IS NOT NULL;
                      
                    
SELECT ord_no, purch_amt, ord_date, salesman_id FROM orders
WHERE salesman_id IN( SELECT salesman_id FROM salesman
WHERE commission = ( SELECT MAX(commission) FROM salesman));


SELECT ord_no, purch_amt, ord_date, ord_date, salesman_id FROM orders
WHERE salesman_id NOT IN(
SELECT salesman_id FROM salesman WHERE city='nagpur');

SELECT ord_date, SUM(purch_amt),
SUM(purch_amt)*.15 FROM orders
GROUP BY ord_date ORDER BY ord_date;


SELECT ord_no, purch_amt, ord_date, ord_date, salesman_id FROM Orders WHERE purch_amt>
(SELECT AVG(purch_amt) FROM Orders);




