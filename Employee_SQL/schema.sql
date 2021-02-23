-- Drop table if exists
-- DROP TABLE Employees;
-- DROP TABLE Titles;
-- DROP TABLE Dept_Manager;
-- DROP TABLE Dept_Emp;
-- DROP TABLE Salaries;

-- Create Titles table
CREATE TABLE Titles (
	title_id VARCHAR(255) PRIMARY KEY,
	title VARCHAR(255)
);

SELECT * 
FROM Titles

-- Create Employee table
CREATE TABLE Employees (
	emp_no int PRIMARY KEY,
	emp_title_id VARCHAR(255),
	birth_date VARCHAR(255),
	first_name VARCHAR(255),
	last_name VARCHAR(255),
	sex VARCHAR(1),
	hire_date VARCHAR(255),
	FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id)
);

SELECT * 
FROM Employees


-- Create Departments table
CREATE TABLE Departments (
	dept_no VARCHAR(255) PRIMARY KEY,
	dept_name VARCHAR(255)
);

SELECT * 
FROM Departments


-- Create Salaries table
CREATE TABLE Salaries (
	emp_no INT,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

SELECT * 
FROM Salaries

-- Create Dept_Manager table
CREATE TABLE Dept_Manager (
	dept_no VARCHAR(255) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
 	PRIMARY KEY (dept_no, emp_no) -- Composite key to ensure each record is uniquely referenced
);

SELECT * 
FROM Dept_Manager;

-- Create Dept_Employee table
CREATE TABLE Dept_Emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(255) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	PRIMARY KEY (emp_no,dept_no) -- Composite key to ensure each record is uniquely referenced
);

SELECT * 
FROM Dept_Emp

