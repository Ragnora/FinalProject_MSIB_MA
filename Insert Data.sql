---------- Region ----------
INSERT INTO tbl_regions (name) VALUES
('Europe'),
('America'),
('Asia'),
('Middle East and Africa');

SELECT id, name FROM tbl_regions;

---------- Countries ----------
INSERT INTO tbl_countries (id, name, region) VALUES
('FRA', 'France', 1),
('USA', 'United States', 2),
('IDN', 'Indonesia', 3),
('NGR', 'Nigeria', 4),
('BLG', 'Belgium', 1),
('ARG', 'Argentina', 2),
('JPN', 'Japan', 3),
('ZBW', 'Zimbabwe', 4);

SELECT id, name, region FROM tbl_countries;

---------- Locations ----------
INSERT INTO tbl_locations (id, street_address, postal_code, city, state_province, country) VALUES
(1100, 'Jl. Ahmad Yani No.21', '67313', 'Surabaya', 'East Java', 'IDN'),
(1200, '22 Rue des Bernardins', 'YSW9T2', 'Paris', 'Île-de-France', 'FRA'),
(1300, '1600 Amphitheatre Parkway', '98199', 'Mountain View', 'California', 'USA'),
(1400, '2017 Shinjuku', '1689', 'Tokyo', 'Tokyo Prefecture', 'JPN'),
(1500, '2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 'USA');

SELECT id, street_address, postal_code, city, state_province, country FROM tbl_locations;

---------- Departments ----------
INSERT INTO tbl_departments (id, name, location) VALUES
(100, 'Data Administration', 1300),
(110, 'Research and Development', 1200),
(120, 'Sales and Marketing', 1400);

SELECT id, name, location FROM tbl_departments;

---------- Jobs ----------
INSERT INTO tbl_jobs (id, title, min_salary, max_salary) VALUES
('DA_DE', 'Data Engineer', 8000, 16000),
('RE_SCIENT', 'Research Scientist', 5000, 10000),
('SA_MAN', 'Sales Manager', 10000, 20000);

SELECT id, title, min_salary, max_salary FROM tbl_jobs;

---------- Employees ----------
INSERT INTO tbl_employees (id, first_name, last_name, gender, email, phone, hire_date, salary, manager, job, department) VALUES
(111010, 'Michael', 'Scott', 'Male', 'michael.scott@mail.com', '82683821390', '1995-03-15', 20000, NULL, 'SA_MAN', 120),
(111020, 'Sarah', 'Connor', 'Female', 'sarah.connor@mail.com', '82683821391', '1998-07-10', 9500, NULL, 'RE_SCIENT', 110),
(111030, 'James', 'Bond', 'Male', 'james.bond@mail.com', '82683821392', '2000-12-01', 15000, NULL, 'DA_DE', 100),
(111040, 'John', 'Doe', 'Male', 'john@mail.com', '82683821399', '2018-08-18', 10000, 111030, 'DA_DE', 100),
(111050, 'Jane', 'Smith', 'Female', 'jane@mail.com', '82683821400', '2020-05-12', 7000, NULL, 'RE_SCIENT', 110),
(111060, 'Emily', 'Johnson', 'Female', 'emily@mail.com', '82683821401', '2021-11-20', 12000, 111010, 'SA_MAN', 120);

SELECT id, first_name, last_name, gender, email, phone, hire_date, salary, manager, job, department FROM tbl_employees;

---------- Job Histories ----------
INSERT INTO tbl_job_histories (employee, start_date, end_date, status, job, department) VALUES
(111010, '1995-03-15', NULL, 'Active', 'SA_MAN', 120),
(111020, '1998-07-10', NULL, 'Hand Over', 'RE_SCIENT', 110),
(111030, '2000-12-01', NULL, 'Hand Over', 'DA_DE', 100),
(111040, '2018-08-18', NULL, 'Active', 'DA_DE', 100),
(111050, '2020-05-12', '2025-03-22', 'Resign', 'RE_SCIENT', 110),
(111060, '2021-11-20', NULL, 'Active','SA_MAN', 120);

SELECT employee, start_date, end_date, status, job, department FROM tbl_job_histories;

---------- Permissions ----------
INSERT INTO tbl_permissions (name) VALUES
('SELECT'),
('INSERT'),
('UPDATE'),
('DELETE'),
('ALTER'),
('EXECUTE');

SELECT id, name FROM tbl_permissions;

---------- Role Permissions ----------
INSERT INTO tbl_role_permissions (role, permission) VALUES
(1, 1), 
(1, 2), 
(1, 3), 
(1, 4), 
(1, 5), 
(1, 6),
(2, 1),
(2, 2),
(2, 3),
(2, 5),
(2, 6),
(3, 1),
(3, 3),
(3, 6),
(4, 3);

SELECT id, role, permission FROM tbl_role_permissions;

---------- Roles ----------
INSERT INTO tbl_roles(name) VALUES
('Super_Admin'),
('Admin'),
('Manager'),
('Employee');

SELECT id, name FROM tbl_roles;

---------- Account Roles ----------
INSERT INTO tbl_account_roles (account, role) VALUES
(111010, 1),
(111020, 2),
(111030, 3),
(111040, 4),
(111050, 4),
(111060, 4);

SELECT id, account, role FROM tbl_account_roles;

---------- Accounts ----------
INSERT INTO tbl_accounts (id, username, password, otp, is_expired, is_used) VALUES
(111010, 'michscott', 'Mich888_', 2446, '2024-01-08 08:00:00', 0),
(111020, 'sarahconr', 'Csarh123!', 6345, '2024-02-10 09:00:00', 0),
(111030, 'jamesbond', 'Jamsb007*', 5746, '2024-05-24 12:00:00', 0),
(111040, 'doejohn', 'Djohn2_!', 9987, '2024-06-11 10:00:00', 0),
(111050, 'janesm', 'SJane224$', 4637, '2024-02-01 07:00:00', 1),
(111060, 'johnemily', 'Jemeliy75!', 5567, '2024-03-04 04:00:00', 0);

SELECT id, username, password, otp, is_expired, is_used FROM tbl_accounts;