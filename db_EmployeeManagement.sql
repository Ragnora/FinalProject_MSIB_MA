CREATE DATABASE db_EmployeeManagement;
USE db_EmployeeManagement;

------------------------------------------------------------------------------------------

CREATE TABLE tbl_regions (
	id INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	name VARCHAR (25) NOT NULL
);

--DROP TABLE tbl_regions;

------------------------------------------------------------------------------------------

CREATE TABLE tbl_countries (
	id CHAR (3) PRIMARY KEY NOT NULL,
	name VARCHAR (40) NOT NULL,
	region INT NOT NULL,
	FOREIGN KEY (region) REFERENCES tbl_regions (id)
);

--DROP TABLE tbl_countries;

------------------------------------------------------------------------------------------

CREATE TABLE tbl_locations (
	id INT PRIMARY KEY NOT NULL,
	street_address VARCHAR (40),
	postal_code VARCHAR (12),
	city VARCHAR (30) NOT NULL,
	state_province VARCHAR (25),
	country CHAR (3) NOT NULL,
	FOREIGN KEY (country) REFERENCES tbl_countries (id)
);

--DROP TABLE tbl_locations;

------------------------------------------------------------------------------------------

CREATE TABLE tbl_departments (
	id INT PRIMARY KEY NOT NULL,
	name VARCHAR (30) NOT NULL,
	location INT NOT NULL,
	FOREIGN KEY (location) REFERENCES tbl_locations (id)
);

--DROP TABLE tbl_departments;

------------------------------------------------------------------------------------------

CREATE TABLE tbl_jobs (
	id VARCHAR (10) PRIMARY KEY NOT NULL,
	title VARCHAR (35) NOT NULL,
	min_salary INT,
	max_salary INT
);

--DROP TABLE tbl_jobs;

------------------------------------------------------------------------------------------

CREATE TABLE tbl_employees (
    id INT PRIMARY KEY NOT NULL,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25),
    gender VARCHAR(10) NOT NULL,
    email VARCHAR(25) UNIQUE NOT NULL,
    phone VARCHAR(20),
    hire_date DATE NOT NULL,
    salary INT,
	manager INT,
	job VARCHAR (10) NOT NULL,
	department INT NOT NULL,
	FOREIGN KEY (manager) REFERENCES tbl_employees (id),
	FOREIGN KEY (job) REFERENCES tbl_jobs (id),
	FOREIGN KEY (department) REFERENCES tbl_departments (id)
);

--DROP TABLE tbl_employees;

------------------------------------------------------------------------------------------

CREATE TABLE tbl_roles (
	id INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	name VARCHAR (50) NOT NULL,
);

--DROP TABLE tbl_roles;

------------------------------------------------------------------------------------------

CREATE TABLE tbl_permissions (
	id INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	name VARCHAR (100) NOT NULL
);

--DROP TABLE tbl_permissions;

------------------------------------------------------------------------------------------

CREATE TABLE tbl_role_permissions (
	id INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	role INT NOT NULL,
	permission INT NOT NULL,
	FOREIGN KEY (permission) REFERENCES tbl_permissions (id),
	FOREIGN KEY (role) REFERENCES tbl_roles (id)
);

--DROP TABLE tbl_role_permissions;

------------------------------------------------------------------------------------------

CREATE TABLE tbl_accounts (
    id INT PRIMARY KEY NOT NULL,
    username VARCHAR(25),
    password VARCHAR(255) NOT NULL,
    otp INT NOT NULL,
    is_expired DATETIME NOT NULL,
    is_used BIT NOT NULL,
    FOREIGN KEY (id) REFERENCES tbl_employees(id)
);

--DROP TABLE tbl_accounts;

------------------------------------------------------------------------------------------

CREATE TABLE tbl_account_roles(
	id INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	account INT NOT NULL,
	role INT NOT NULL,
	FOREIGN KEY (account) REFERENCES tbl_accounts (id),
	FOREIGN KEY (role) REFERENCES tbl_roles (id)
);

--DROP TABLE tbl_account_roles;

------------------------------------------------------------------------------------------

CREATE TABLE tbl_job_histories (
    employee INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    status VARCHAR(10) NOT NULL,
    job VARCHAR(10) NOT NULL,
    department INT NOT NULL,
    PRIMARY KEY (employee, start_date),
    FOREIGN KEY (employee) REFERENCES tbl_employees(id),
    FOREIGN KEY (job) REFERENCES tbl_jobs(id),
    FOREIGN KEY (department) REFERENCES tbl_departments(id)
);

--DROP TABLE tbl_job_histories;