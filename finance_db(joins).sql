CREATE DATABASE my_finance_db;
USE my_finance_db;

CREATE TABLE bank_info (
    bank_id INT,
    bank_name VARCHAR(100),
    bank_loc VARCHAR(100),
    ifsc_code VARCHAR(20),
    no_of_cust INT
);

CREATE TABLE cust_info (
    cust_id INT,
    cust_name VARCHAR(100),
    acc_no VARCHAR(20),
    bank_id INT,
    balance DECIMAL(15, 2)
);

CREATE TABLE loan_info (
    loan_id INT,
    loan_name VARCHAR(100),
    bank_id INT,
    cust_id INT,
    loan_amount DECIMAL(15, 2)
);

CREATE TABLE insurance_info (
    insr_id INT,
    insr_type VARCHAR(50),
    policy_no VARCHAR(50),
    bank_id INT,
    cust_id INT,
    loan_id INT
);


INSERT INTO bank_info VALUES (1, 'State Bank of India', 'Bangalore', 'SBIN0001234', 5000);
INSERT INTO bank_info VALUES (2, 'HDFC Bank', 'Mysore', 'HDFC0004567', 3000);
INSERT INTO bank_info VALUES (3, 'ICICI Bank', 'Chennai', 'ICIC0007890', 4000);
INSERT INTO bank_info VALUES (4, 'Axis Bank', 'Hyderabad', 'AXIS0011223', 2500);
INSERT INTO bank_info VALUES (5, 'Canara Bank', 'Mumbai', 'CNRB0012345', 3500);
INSERT INTO bank_info VALUES (6, 'Punjab National Bank', 'Delhi', 'PNB0023456', 2700);
INSERT INTO bank_info VALUES (7, 'Union Bank', 'Kolkata', 'UBIN0034567', 1500);
INSERT INTO bank_info VALUES (8, 'Kotak Mahindra', 'Pune', 'KKBK0045678', 3200);
INSERT INTO bank_info VALUES (9, 'Yes Bank', 'Nagpur', 'YESB0056789', 2100);
INSERT INTO bank_info VALUES (10, 'IDBI Bank', 'Coimbatore', 'IBKL0067890', 1800);

INSERT INTO cust_info VALUES (101, 'Ravi Kumar', 'ACC12345', 1, 25000.00);
INSERT INTO cust_info VALUES (102, 'Anjali Sharma', 'ACC23456', 2, 45000.50);
INSERT INTO cust_info VALUES (103, 'Megha Reddy', 'ACC34567', 3, 18000.75);
INSERT INTO cust_info VALUES (104, 'Suresh Babu', 'ACC45678', 4, 22000.00);
INSERT INTO cust_info VALUES (105, 'Pooja Nair', 'ACC56789', 5, 55000.25);
INSERT INTO cust_info VALUES (106, 'Ajay Singh', 'ACC67890', 6, 31000.00);
INSERT INTO cust_info VALUES (107, 'Neha Joshi', 'ACC78901', 7, 40000.60);
INSERT INTO cust_info VALUES (108, 'Karthik Rao', 'ACC89012', 8, 17000.90);
INSERT INTO cust_info VALUES (109, 'Divya Shetty', 'ACC90123', 9, 28000.00);
INSERT INTO cust_info VALUES (110, 'Rohit Das', 'ACC01234', 10, 36000.75);

INSERT INTO loan_info VALUES (201, 'Home Loan', 1, 101, 500000.00);
INSERT INTO loan_info VALUES (202, 'Car Loan', 2, 102, 300000.00);
INSERT INTO loan_info VALUES (203, 'Education Loan', 3, 103, 200000.00);
INSERT INTO loan_info VALUES (204, 'Personal Loan', 4, 104, 150000.00);
INSERT INTO loan_info VALUES (205, 'Gold Loan', 5, 105, 100000.00);
INSERT INTO loan_info VALUES (206, 'Home Loan', 6, 106, 480000.00);
INSERT INTO loan_info VALUES (207, 'Car Loan', 7, 107, 310000.00);
INSERT INTO loan_info VALUES (208, 'Education Loan', 8, 108, 250000.00);
INSERT INTO loan_info VALUES (209, 'Personal Loan', 9, 109, 180000.00);
INSERT INTO loan_info VALUES (210, 'Gold Loan', 10, 110, 120000.00);

INSERT INTO insurance_info VALUES (301, 'Life Insurance', 'POL1234', 1, 101, 201);
INSERT INTO insurance_info VALUES (302, 'Vehicle Insurance', 'POL2345', 2, 102, 202);
INSERT INTO insurance_info VALUES (303, 'Health Insurance', 'POL3456', 3, 103, 203);
INSERT INTO insurance_info VALUES (304, 'Travel Insurance', 'POL4567', 4, 104, 204);
INSERT INTO insurance_info VALUES (305, 'Life Insurance', 'POL5678', 5, 105, 205);
INSERT INTO insurance_info VALUES (306, 'Vehicle Insurance', 'POL6789', 6, 106, 206);
INSERT INTO insurance_info VALUES (307, 'Health Insurance', 'POL7890', 7, 107, 207);
INSERT INTO insurance_info VALUES (308, 'Travel Insurance', 'POL8901', 8, 108, 208);
INSERT INTO insurance_info VALUES (309, 'Life Insurance', 'POL9012', 9, 109, 209);
INSERT INTO insurance_info VALUES (310, 'Health Insurance', 'POL0123', 10, 110, 210);


//INNER JOIN: 
SELECT * FROM table1 inner join table2 on table1.column_name = table2.column_name;

SELECT * FROM bank_info inner join cust_info
on bank_info.bank_id = cust_info.bank_id;

SELECT * FROM bank_info b inner join cust_info c
on b.bank_id = c.bank_id inner join loan_info l
on l.bank_id = c.bank_id inner join
insurance_info i on i.bank_id = l.bank_id;

SELECT * FROM bank_info b inner join cust_info c
on b.bank_id = c.bank_id inner join loan_info l
on l.cust_id = c.cust_id inner join
insurance_info i on i.cust_id = l.cust_id;

SELECT * FROM bank_info b INNER JOIN cust_info c 
ON b.bank_id = c.bank_id INNER JOIN loan_info l 
ON l.cust_id = c.cust_id INNER JOIN insurance_info i
ON i.loan_id = l.loan_id;