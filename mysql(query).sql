#create databse database_NAME

create database student;
use student;

#table
#create table table_name(col_name1 dtype primary key,col_name2 dtype not null,..........);

create table  student(student_id varchar(20) primary key,student_name char(20) not null,tamil int,english int,maths int,science int,soical int);

#show table                               
#select * from table_name;

select * from student;

#insert values
#insert into table_name(col_name........) values (),()..........;

insert into student(student_id,student_name,tamil,english,maths,science,soical) values ("AUG001","CJ",78,88,67,98,45),("AUG002","MAC",89,88,67,57,45),("AUG003","PRAVEEN",89,76,56,67,45);

#delete the database or table
#drop database database_name;
#drop table table_name;

drop table mark;
drop database student;


#ALTER
#alter table table_name add new_col_name dtype;
alter table student add total_mark int;


#update
#update table_name set new_col_name=(+,-) where primary key;

update student set total_mark=(tamil+english+maths+science+soical) where student_id="AUG001";
update student set total_mark=(tamil+english+maths+science+soical) where student_id="AUG002";
update student set total_mark=(tamil+english+maths+science+soical) where student_id="AUG003";


#logical operators
             #AND------------given two condition will be true
             #OR-------------given two condition(any one condition need to true)
             #NOT-------------react opposite reaction(what we are given)
             
#select col_name from table_name where cond_1 AND cond_2;
#select col_name from table_name where cond_1 OR cond_2;
#select col_name from table_name where NOT cond_1;

select student_id,student_name,tamil,english from mark where tamil>60 and english>70;
select student_id,student_name,tamil,english from mark where tamil>60 or english>200;
select student_id,student_name,tamil,english from mark where not tamil=78;


#case statement
        #IN
        #BETWEEN
        #LIKE
        #ISNULL
SELECT * from mark where student_name in ("cj");
SELECT * from mark where tamil between 60 and 80;
SELECT * from mark where student_name like 'c%';
SELECT * from mark where student_name like '%c';
SELECT * from mark where student_name is null;



#column aliase
#given tempory name for column 
#select col_name AS new_col_name ...........from table_name;

select student_id  as id,student_name as name,tamil+english as total_mark from mark;


#table_Aliase
##given temporary name for table
#select s.col_name,.............from table_name as new_table_name;

select m.student_id,m.student_name from mark as m;


#CONCAT---------combine two col and show in new col
#select concat (col_name,", - /",col_name) as new_col_name from table_name;

select concat(student_id,'-',student_name) as student_details from mark;






#string function
#select upper(col_name) as new_col_name from table_name;
#select lower(col_name) as new_col_name from table_name;
#select len(col_name) as new_col_name from table_name;
#select replace(col_name,"","") as new_col_name from table_name;

select upper(student_name) as name_upper from mark;
select lower(student_name) as name_lower from mark;
select length(student_name) as name_len from mark;
select replace(student_name,"C","z") as name_replace from mark;

#order by----------ASC,desc

#select col_name from table_name order by col_name asc	;
#select col_name from table_name order by col_name desc	;

select student_id,student_name,tamil from mark order by student_name asc;
select student_id,student_name,tamil from mark order by student_name desc;

#JOINS
    #right joins
    #LEFT JOIN
    #FULL JOIN
    #INNER JOIN
    #SELF JOIN
    
    
# create second table 
CREATE TABLE classroom(student_id VARCHAR(10),class_name VARCHAR(20));
INSERT INTO classroom VALUES("AUG001","X-A"),("AUG002","X-B"); 
 select * from classroom;
SELECT student.student_id, student.student_name, classroom.class_name FROM student INNER 
JOIN classroom ON student.student_id = classroom.student_id; 
 
 
#left join 
#Returns all rows from the left table, and matching rows from the right 
SELECT columns FROM table1 LEFT JOIN table2 ON table1.common_column = table2.common_column; 
SELECT student.student_id, student.student_name, classroom.class_name FROM student LEFT JOIN classroom ON student.student_id = classroom.student_id; 



 
#right join 
#Returns all rows from the right table, and matching rows from the left. 
 
 
SELECT columns FROM table1 RIGHT JOIN table2 ON table1.common_column = table2.common_column; 
SELECT student.student_id, student.student_name, classroom.class_name FROM student RIGHT  JOIN classroom ON student.student_id = classroom.student_id; 
 
 
# self join 
#A table joins with itself. 
#SELECT A.columns, B.columns FROM table A JOIN table B ON A.common_column = B.common_column; 


SELECT A.student_name AS Student1,B.student_name AS Student2,A.total_mark FROM student A JOIN student B ON A.total_mark = B.total_mark ;
 
#full join 
#But we can simulate it using LEFT JOIN + RIGHT JOIN with UNION. 
 
 
#SELECT columns FROM table1 FULL OUTER JOIN table2 ON table1.col = table2.col; 
SELECT * 
FROM student s 
LEFT JOIN classroom c ON s.student_id = c.student_id 
UNION 
SELECT * 
FROM student s 
RIGHT JOIN classroom c ON s.student_id = c.student_id; 
 
 
# ON 
#ON tells SQL exactly how two tables should be matched when joining 
#SELECT column_list FROM table1 JOIN table2 ON table1.column = table2.column; 
 
 
#USING 
#SELECT column_list FROM table1 JOIN table2 USING (column_name); 
#USING is a shortcut for joins when both tables have a column with the exact same name. 
 
SELECT student_id, student_name, class_name FROM student INNER JOIN classroom USING (student_id); 


SELECT student.student_id, student.student_name, classroom.class_name FROM student 
INNER JOIN classroom 
ON student.student_id = classroom.student_id; 
 


#aggregate function
            #sum 
            #min
            #max
            #avg
            #count
#select sum(col_name) as new_col_name from table_name;
#select min(col_name) as new_col_name from table_name;
#select max(col_name) as new_col_name from table_name;
#select avg(col_name) as new_col_name from table_name;
#select count(*) as new_col_name from table_name;

select sum(total_mark) as sum_of_total_mark from student;
select min(tamil) as min_tamil_mark from student;
select max(tamil) as max_tamil_mark from student;
select avg(tamil) as avg_mark from student;
select count(*) as total_members from student;

#filtering
select min(tamil) as min_tamil_mark from student where tamil>80;

#group by
#select col_name,count(*) from table_name group by commn col_name;

SELECT class_name, COUNT(*) AS total_students 
FROM classroom 
GROUP BY class_name; 



#subquery
#IN 
#EXIST
#NOT EXIST

#subquery 
#A subquery (also called inner query or nested query) is a query inside another SQL query. SELECT AVG(tamil) FROM student; 
 
SELECT AVG(tamil) FROM student ;

SELECT student_name, tamil 
FROM student 
WHERE tamil > (SELECT AVG(tamil) FROM student); 
#Outer query selects only students whose Tamil mark is above that average 


#IN,EXISTS,NOT EXISTS #IN 
#Checks if a value is inside a list. 
SELECT * FROM student WHERE student_name IN ('CJ'); 
 
 
#EXISTS 
#Checks if a related record exists in another table. 
SELECT column_name(s) 
FROM table_name t1 
WHERE EXISTS ( 
SELECT 1 
FROM table_name2 t2 
WHERE t2.common_column = t1.common_column); 
 
 
SELECT student_name,student_id,tamil  FROM student s  WHERE EXISTS (SELECT 1 FROM classroom c  WHERE c.student_id = s.student_id); 
 
 
#NOT EXISTS 
#Checks if a related record DOES NOT exist. 
SELECT column_name(s) 
FROM table_name t1 
WHERE NOT EXISTS ( SELECT 1 
FROM table_name2 t2 
WHERE t2.common_column = t1.common_column); 
 
 
 
 
SELECT student_name 
FROM student s 
WHERE NOT EXISTS ( 
SELECT 1 FROM classroom c 
WHERE c.student_id = s.student_id); 



#windows function:
         #rank
         #Dense_rank
         #row_numbers
         #running_total
         #moving_avg


#window function #RANK,DENSE_RANK,ROW_NMBERS 
 
#RANK 
#RANK() OVER (ORDER BY column_name) 
#Gives the same rank for ties, but skips the next rank number 
 
 
#DENSE_RANK 
#DENSE_RANK() OVER (ORDER BY column_name) 
#Gives the same rank for ties, but does NOT skip rank numbers. #ROW_NUMBER 
#Assigns a unique number to each row (no duplicates). 
#ROW_NUMBER() OVER (ORDER BY column_name) 
 
 
 
#Gives a unique serial number to each row in the result set based on the order you define. 
SELECT student_id, student_name, tamil, english, total_mark, ROW_NUMBER()
 OVER (ORDER BY total_mark DESC) AS rn FROM student; 
 
 
#Gives a rank to each row based on the order. 
SELECT student_id, student_name, 
tamil, english, total_mark, 
RANK() OVER (ORDER BY total_mark DESC) AS rank_no 
FROM student; 
 
#Similar to RANK(), but does not skip ranks. 
SELECT student_id, student_name, 
tamil, english, total_mark, 
DENSE_RANK() OVER (ORDER BY total_mark DESC) AS dense_rank_no 
FROM student; 
SELECT * from student; 
 
 
 
 
#RUNNING TOTAL 
#Adds values row by row 
#SUM(column) OVER (ORDER BY column) 
SELECT student_id, student_name, total_mark, 
SUM(total_mark) OVER (ORDER BY student_id) AS running_total FROM student; 
 
 
 
#MOVING AVERAGE (Rolling Average) 
#Average of current row + previous rows 
#AVG(column) OVER (ORDER BY column ROWS BETWEEN n PRECEDING AND CURRENT ROW) 
 
SELECT student_id, student_name, total_mark, 
AVG(total_mark) OVER ( 
ORDER BY student_id 
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW 
) AS moving_avg 
FROM student; 
 
 
 
#SELECT column1,column2,ROW_NUMBER() OVER (PARTITION BY column_name ORDER BY column_name AS row_no FROM table_name; 
 
 
 
SELECT student_id, student_name, result,
ROW_NUMBER() OVER ( 
PARTITION BY result ORDER 
BY total_mark DESC 
) AS row_no FROM student;

#transaction management:
            #commit-----------store data permently
            #rollback------------undo option

commit;
rollback;


#truncate and delete

#trucate ----delete the table data permantly
#truncate table table_name;

select * from student;

truncate table student;


#delete----delete any rows by using delete command
#DELETE FROM table_name WHERE condition;
delete  from student where student_id="AUG001";






 