--DROP TABLE employees;
--DROP TABLE salaries;
--DROP TABLE departments;
--DROP TABLE dept_emp;
--DROP TABLE dept_manager;
--DROP TABLE titles;

-- titles table
CREATE TABLE titles (
    title_id varchar(30) NOT NULL primary key,
    title varchar(255)  NOT NULL
);

-- employees table
CREATE TABLE employees (
    emp_no int  not null primary key,
    emp_tit_id varchar(30) NOT NULL,
    birth_date varchar(30) NOT NULL,
    first_name varchar(30) NOT NULL,
    last_name varchar(30)  NOT NULL,
    sex varchar(1)         NOT NULL,
    hire_date varchar(30)  NOT NULL,
    FOREIGN KEY (emp_tit_id) REFERENCES titles(title_id)
);

--salaries table
CREATE TABLE salaries (
    emp_no integer   NOT NULL,
    salary integer   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--departments table
CREATE TABLE departments (
    dept_no varchar(30) NOT NULL primary key,
    dept_name varchar(255)  NOT NULL
);

--dep_emp junction table
CREATE TABLE dept_emp (
    emp_no integer NOT NULL,
    dept_no varchar(30) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

-- dept_manager junction table 
CREATE TABLE dept_manager (
    dept_no varchar(30)   NOT NULL,
    emp_no integer        NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no)  REFERENCES employees(emp_no),
	PRIMARY KEY (dept_no, emp_no)
);



