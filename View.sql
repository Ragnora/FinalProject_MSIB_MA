---REGION VIEW-----------------------------------------------------------------------------------

CREATE VIEW vw_region_details
AS
SELECT 
    id,
    name
FROM 
    tbl_regions;
GO

--DROP VIEW vw_regions_details;

---COUNTRY VIEW----------------------------------------------------------------------------------

CREATE VIEW vw_country_details
AS
SELECT 
    c.id,
    c.name,
    r.name AS region
FROM 
    tbl_countries c
	JOIN tbl_regions r ON c.region = r.id;
GO

--DROP VIEW vw_country_details;

---LOCATION VIEW---------------------------------------------------------------------------------

CREATE VIEW vw_location_details
AS
SELECT 
    l.id,
    l.street_address,
	l.postal_code,
	l.city,
	l.state_province,
    c.name AS country
FROM 
    tbl_locations l
	JOIN tbl_countries c ON l.city = c.id;
GO

--DROP VIEW vw_location_details;

---DEPARTMENT VIEW-------------------------------------------------------------------------------

CREATE VIEW vw_department_details
AS
SELECT 
    d.id,
    d.name,
    l.city AS location
FROM 
    tbl_departments d
	JOIN tbl_locations l ON d.location = l.id;
GO

--DROP VIEW vw_department_details;

---JOB VIEW--------------------------------------------------------------------------------------

CREATE VIEW vw_job_details
AS
SELECT 
    id,
    title,
	min_salary,
	max_salary
FROM 
    tbl_jobs;
GO

--DROP VIEW vw_job_details;

---ROLE VIEW-------------------------------------------------------------------------------------

CREATE VIEW vw_role_details
AS
SELECT 
    id,
    name
FROM 
    tbl_roles;
GO

--DROP VIEW vw_role_details;

---PERMISSION VIEW-------------------------------------------------------------------------------

CREATE VIEW vw_permission_details
AS
SELECT 
    id,
    name
FROM 
    tbl_permissions;
GO

--DROP VIEW vw_permission_details;

---ROLE PERMISSION VIEW--------------------------------------------------------------------------

CREATE VIEW vw_role_permission_details
AS
SELECT 
    rp.id,
    rl.name AS role,
	p.name AS permission
FROM 
    tbl_role_permissions rp
	JOIN tbl_roles rl ON rp.role = rl.id
	JOIN tbl_permissions p ON rp.permission = p.id;
GO

--DROP VIEW vw_role_permission_details;

---ACCOUNT VIEW----------------------------------------------------------------------------------

CREATE VIEW vw_account_details
AS
SELECT 
    e.id,
    a.username,
	a.password,
	a.otp,
	a.is_expired,
	a.is_used
FROM 
    tbl_accounts a
	JOIN tbl_employees e ON a.id = e.id
GO

--DROP VIEW vw_account_details;

---ACCOUNT ROLE VIEW-----------------------------------------------------------------------------

CREATE VIEW vw_account_role_details
AS
SELECT 
    ar.id,
	a.username AS account,
    rl.name AS role
FROM 
    tbl_account_roles ar
	JOIN tbl_accounts a ON ar.account = a.id
	JOIN tbl_roles rl ON ar.role = rl.id;
GO

--DROP VIEW vw_account_role_details;

---JOB HISTORY VIEW------------------------------------------------------------------------------

CREATE VIEW vw_job_histories_details
AS
SELECT 
    e.first_name + ' ' + e.last_name AS employee,
	e.hire_date AS start_date,
	jh.end_date AS end_date,
	jh.status AS status,
	j.title AS job,
    d.name AS department
FROM 
    tbl_job_histories jh
	JOIN tbl_employees e ON jh.employee = e.id
	JOIN tbl_jobs j ON jh.job = j.id
	JOIN tbl_departments d ON jh.department = d.id;
GO

--DROP VIEW vw_job_histories_details;

---EMPLOYEE VIEW---------------------------------------------------------------------------------

CREATE VIEW vw_employee_details
AS
SELECT 
    e.id AS id,
    a.username AS username,
    CONCAT(e.first_name, ' ', e.last_name) AS full_name,
    e.gender AS gender,
    e.email AS email,
    e.hire_date AS hire_date,
    e.salary AS salary,
    e.manager AS manager_id,
    CONCAT(m.first_name, ' ', m.last_name) AS manager_name,
    j.title AS job,
    d.name AS department,
    r.name AS role,
    l.city AS location,
    jh.status AS status
FROM 
    tbl_employees e
	JOIN tbl_accounts a ON e.id = a.id
	JOIN tbl_jobs j ON e.job = j.id
	JOIN tbl_departments d ON e.department = d.id
	JOIN tbl_locations l ON d.location = l.id
	JOIN tbl_account_roles ar ON a.id = ar.account
	JOIN tbl_roles r ON ar.role = r.id
	LEFT JOIN tbl_employees m ON e.manager = m.id
	LEFT JOIN 
		tbl_job_histories jh ON e.id = jh.employee AND jh.start_date = (
			SELECT MAX(start_date)
			FROM tbl_job_histories
			WHERE employee = e.id
		);
GO

--DROP VIEW vw_employee_details;

---PROFILE VIEW-----------------------------------------------------------------------------------

CREATE VIEW vw_profile_details AS
SELECT 
    a.username,
    CONCAT(e.first_name, ' ', e.last_name) AS full_name,
    e.phone,
    e.email,
    a.password,
    CONCAT(m.first_name, ' ', m.last_name) AS manager,
    e.job,
    e.department,
    l.city AS location,
    jh.status
FROM 
    tbl_accounts a
	JOIN tbl_employees e ON a.id = e.id
	LEFT JOIN tbl_employees m ON e.manager = m.id
	JOIN tbl_departments d ON e.department = d.id
	JOIN tbl_locations l ON d.location = l.id
	JOIN tbl_job_histories jh ON e.id = jh.employee
		WHERE 
			jh.start_date = (
				SELECT MAX(start_date)
				FROM tbl_job_histories
				WHERE employee = e.id
			);
GO

--DROP VIEW vw_profile_details;