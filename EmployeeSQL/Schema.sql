CREATE TABLE TITLE (
	title_id VARCHAR(10) NOT NULL PRIMARY KEY,
	title    VARCHAR(30) NOT NULL
);

SELECT * FROM TITLE
	
CREATE TABLE DEPARTMENT(
	dept_no  VARCHAR(10) NOT NULL PRIMARY KEY,
	name     VARCHAR(30) NOT NULL
);

SELECT * FROM DEPARTMENT

CREATE TABLE EMPLOYEE(
	emp_no       integer     NOT NULL PRIMARY KEY,
	emp_title_id varchar(10) NOT NULL,
	birth_date   date        NOT NULL,
	first_name   varchar(30) NOT NULL,
	last_name    varchar(30) NOT NULL,
	sex          char(1)     NOT NULL,
	hire_date    date        NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES TITLE(title_id)	
);

SELECT * FROM EMPLOYEE

CREATE TABLE SALARY(
	emp_no      integer   NOT NULL PRIMARY KEY,
	salary      decimal   NOT NULL,
	FOREIGN KEY (emp_no)  REFERENCES EMPLOYEE(emp_no)
);

SELECT COUNT(*) FROM SALARY

CREATE TABLE DEPT_EMPLOYEE(
	emp_no integer        NOT NULL,
	dept_no VARCHAR(10)   NOT NULL,
	FOREIGN KEY (emp_no)  REFERENCES EMPLOYEE(emp_no),	
	FOREIGN KEY (dept_no) REFERENCES DEPARTMENT(dept_no),	
	PRIMARY KEY (emp_no, dept_no)
);

SELECT COUNT(*) FROM DEPT_EMPLOYEE

CREATE TABLE DEPT_MANAGER(
	dept_no VARCHAR(10)   NOT NULL,
	emp_no integer        NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES DEPARTMENT(dept_no),	
	FOREIGN KEY (emp_no)  REFERENCES EMPLOYEE(emp_no),	
	PRIMARY KEY (dept_no,emp_no)
);

SELECT COUNT(*) FROM DEPT_MANAGER