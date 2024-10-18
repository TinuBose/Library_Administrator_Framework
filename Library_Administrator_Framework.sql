create database Library;
use Library;

# creating each table structures.
create table Branch(
	Branch_no int primary key,
    Manager_id int,
    Branch_address varchar(50) not null,
    Contact_no bigint not null
);
desc Branch;

create table Employee(
	Emp_id int primary key,
    Emp_name varchar(20) not null,
    Position varchar(20) not null,
    Salary int not null,
    Branch_no int,
    foreign key(Branch_no) references Branch(Branch_no) on delete cascade
);
desc Employee;

create table Books(
	ISBN varchar(20) primary key,
    Title varchar(50) not null,
    Category varchar(20) not null,
    Rental_price int not null,
	Status varchar(3) check (Status IN ('yes', 'no')) not null
);
desc Books;

create table Customer(
	Customer_id int primary key,
    Customer_name varchar(20) not null,
    Customer_address varchar(50) not null,
    Reg_date date not null
);
desc Customer;

create table Issue_status(
	Issue_id int primary key,
    Issued_cust int,
    foreign key(Issued_cust) references Customer(Customer_id) on delete cascade,
    Issued_book_name varchar(50) not null,
    ISBN_book varchar(20),
    foreign key(ISBN_book) references Books(ISBN) on delete cascade
    
);
desc Issued_status;

create table Return_status(
	Return_id int primary key,
    Return_cust int,
    foreign key(Return_cust) references Customer(Customer_id) on delete cascade,	
    Return_book_name varchar(50) not null,
    Return_date date not null,
    ISBN_book2 varchar(20),
    foreign key(ISBN_book2) references Books(ISBN) on delete cascade
    
);
desc Return_status;

#inserting values to each table.

INSERT INTO Branch (Branch_no, Manager_id, Branch_address, Contact_no)
VALUES 
(1, 101, '123 Elm Street', 9876543210),
(2, 102, '456 Maple Avenue', 9123456780),
(3, 103, '789 Oak Road', 9988776655),
(4, 104, '12 Birch Lane', 9871234560),
(5, 105, '34 Cedar Street', 9125678901),
(6, 106, '78 Spruce Road', 9983456721),
(7, 107, '99 Pine Avenue', 9876789012),
(8, 108, '56 Ash Boulevard', 9129876543),
(9, 109, '29 Palm Drive', 9985672341),
(10, 110, '101 Willow Circle', 9878901234);

INSERT INTO Employee (Emp_id, Emp_name, Position, Salary, Branch_no)
VALUES 
(201, 'Alice', 'Manager', 60000, 1),
(202, 'Bob', 'Assistant', 45000, 1),
(203, 'Charlie', 'Manager', 65000, 2),
(204, 'David', 'Cashier', 30000, 2),
(205, 'Eve', 'Manager', 70000, 3),
(206, 'Frank', 'Assistant', 48000, 3),
(207, 'Grace', 'Librarian', 55000, 1),
(208, 'Henry', 'Manager', 62000, 4),
(209, 'Ivy', 'Cashier', 32000, 4),
(210, 'Jack', 'Assistant', 47000, 5),
(211, 'Kate', 'Manager', 71000, 5),
(212, 'Leo', 'Librarian', 52000, 6),
(213, 'Mia', 'Assistant', 49000, 6),
(214, 'Nick', 'Manager', 60000, 7),
(215, 'Olivia', 'Cashier', 31000, 7),
(216, 'Paul', 'Librarian', 56000, 8),
(217, 'Quincy', 'Manager', 68000, 9),
(218, 'Rachel', 'Assistant', 46000, 9),
(219, 'Steve', 'Cashier', 33000, 10),
(220, 'Tom', 'Manager', 75000, 10),
(221, 'Uma', 'Librarian', 57000, 1),
(222, 'Vera', 'Assistant', 41000, 2),
(223, 'Will', 'Manager', 78000, 3),
(224, 'Xander', 'Cashier', 35000, 4),
(225, 'Yasmin', 'Assistant', 49500, 5),
(226, 'Zane', 'Librarian', 52500, 6),
(227, 'Adam', 'Manager', 76000, 7),
(228, 'Ben', 'Cashier', 38000, 8),
(229, 'Cara', 'Librarian', 59000, 9),
(230, 'Dina', 'Assistant', 45500, 10);


INSERT INTO Books (ISBN, Title, Category, Rental_price, Status)
VALUES 
('978-3-16-148410-0', 'Data Science Handbook', 'Science', 50, 'yes'),
('978-1-4028-9462-6', 'Machine Learning Basics', 'Technology', 40, 'yes'),
('978-0-596-52068-7', 'Python Programming', 'Technology', 35, 'no'),
('978-0-545-01022-1', 'The History of Time', 'History', 45, 'yes'),
('978-1-2345-6789-7', 'History of World Wars', 'History', 60, 'no'),
('978-0-316-76978-0', 'Advanced Algorithms', 'Technology', 70, 'yes'),
('978-0-684-84328-5', 'Quantum Mechanics', 'Science', 80, 'no'),
('978-0-7432-7356-0', 'Classical Physics', 'Science', 55, 'yes'),
('978-0-321-76768-7', 'Operating Systems', 'Technology', 65, 'no'),
('978-1-86092-049-8', 'Digital Electronics', 'Technology', 75, 'yes');


INSERT INTO Customer (Customer_id, Customer_name, Customer_address, Reg_date)
VALUES 
(301, 'John Doe', '789 Cedar Lane', '2021-05-15'),
(302, 'Jane Smith', '456 Oak Street', '2023-06-05'),
(303, 'Samuel Green', '123 Pine Avenue', '2020-12-30'),
(304, 'Lucy Brown', '321 Maple Avenue', '2021-10-10'),
(305, 'Harry White', '654 Elm Street', '2022-11-01'),
(306, 'Emma Black', '789 Ash Boulevard', '2022-09-09'),
(307, 'Sophia Blue', '123 Birch Lane', '2022-03-15'),
(308, 'Liam Gray', '234 Spruce Road', '2020-01-01'),
(309, 'Noah Green', '789 Pine Avenue', '2023-02-22'),
(310, 'Mason Yellow', '321 Maple Avenue', '2021-07-20');


INSERT INTO Issue_status (Issue_id, Issued_cust, Issued_book_name, ISBN_book)
VALUES 
(401, 301, 'Data Science Handbook', '978-3-16-148410-0'),
(402, 302, 'Machine Learning Basics', '978-1-4028-9462-6'),
(403, 303, 'The History of Time', '978-0-545-01022-1'),
(404, 304, 'Quantum Mechanics', '978-0-684-84328-5'),
(405, 305, 'Python Programming', '978-0-596-52068-7'),
(406, 306, 'Advanced Algorithms', '978-0-316-76978-0'),
(407, 307, 'Digital Electronics', '978-1-86092-049-8'),
(408, 308, 'History of World Wars', '978-1-2345-6789-7'),
(409, 309, 'Classical Physics', '978-0-7432-7356-0'),
(410, 310, 'Operating Systems', '978-0-321-76768-7');


INSERT INTO Return_status (Return_id, Return_cust, Return_book_name, Return_date, ISBN_book2)
VALUES 
(501, 301, 'Data Science Handbook', '2023-06-15', '978-3-16-148410-0'),
(502, 302, 'Machine Learning Basics', '2023-07-10', '978-1-4028-9462-6'),
(503, 303, 'The History of Time', '2023-08-05', '978-0-545-01022-1'),
(504, 304, 'Quantum Mechanics', '2023-09-20', '978-0-684-84328-5'),
(505, 305, 'Python Programming', '2023-10-05', '978-0-596-52068-7'),
(506, 306, 'Advanced Algorithms', '2023-11-10', '978-0-316-76978-0'),
(507, 307, 'Digital Electronics', '2023-12-15', '978-1-86092-049-8'),
(508, 308, 'History of World Wars', '2024-01-10', '978-1-2345-6789-7'),
(509, 309, 'Classical Physics', '2024-02-15', '978-0-7432-7356-0'),
(510, 310, 'Operating Systems', '2024-03-20', '978-0-321-76768-7');

#displaying all the tables

select * from Branch;
select * from Employee;
select * from Books;
select * from Customer;
select * from Issue_status;
select * from Return_status;

# 1. Retrieve the book title, category, and rental price of all available books. 
select Title,Category,Rental_price from Books;

# 2. List the employee names and their respective salaries in descending order of salary.
select Emp_name,Salary from Employee order by Salary desc;

# 3. Retrieve the book titles and the corresponding customers who have issued those books.
select I.Issued_book_name,I.Issued_cust,C.customer_name from 
Customer C inner join Issue_status I on C.Customer_id = I.Issued_cust;

# 4. Display the total count of books in each category. 
select Category,count(ISBN) as Book_count from Books 
group by Category;

# 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 
select Emp_name,Position,Salary from Employee
where Salary > 50000;


# 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
select Customer_id from Customer where Reg_date < "2022-01-01" and 
Customer_id not in
(select Issued_cust from Issue_status);

# 7. Display the branch numbers and the total count of employees in each branch. 
create view the_Employee_View as select B.Branch_no,count(E.Emp_id) as Total_Employee from Branch B inner join Employee E
where E.Branch_no = B.Branch_no group by Branch_no;
select * from the_Employee_View;

# 8. Display the names of customers who have Returned books in the month of June 2023.
select Customer_name from Customer where Customer_id = 
(select Return_cust from Return_status where month(Return_date)="6" and year(Return_date)="2023");

# 9. Retrieve book_title from book table containing history.
delimiter $$ 
create procedure book_title_history()
begin
	select Title from Books where Category = "History";
end $$
delimiter ;

call book_title_history();



# 10.Retrieve the branch numbers along with the count of employees for branches having more than 2 employees
delimiter $$
create procedure branch_n_count(IN the_count int)
begin
	select B.Branch_no,count(E.Emp_id) as Total_Employee from Branch B inner join Employee E
	where E.Branch_no = B.Branch_no group by Branch_no having count(E.Emp_id)>the_count;
end $$
delimiter ;
call branch_n_count(2);

# 11. Retrieve the names of employees who manage branches and their respective branch addresses. 
select E.Emp_name,B.Branch_address,E.Position from Employee E inner join Branch B
on B.Branch_no = E.Branch_no where E.Position = "Manager";

# 12. Display the names of customers who have issued books with a rental price higher than Rs. 25.
select Customer_name as Rental_greater_than_25 from Customer where Customer_id in
(select Issued_cust from Issue_status where ISBN_book in
(select ISBN from books where Rental_price > 25)
);
