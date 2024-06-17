---AFTER INSERT-----------------------------------------------------------------------------------

CREATE TRIGGER tr_insert_employee
ON tbl_employees
AFTER INSERT
AS
BEGIN
    INSERT INTO tbl_job_histories (employee, start_date, status, job, department)
    SELECT i.id, i.hire_date, 'Active', i.job, i.department
    FROM INSERTED i;
END;
GO

--DROP TRIGGER tr_insert_employee;

---AFTER UPDATE-----------------------------------------------------------------------------------

CREATE TRIGGER tr_update_employee_job
ON tbl_employees
AFTER UPDATE
AS
BEGIN
    IF UPDATE(job)
    BEGIN
        INSERT INTO tbl_job_histories (employee, start_date, status, job, department)
        SELECT d.id, d.hire_date, 'Hand Over', d.job, d.department
        FROM DELETED d;
        
        INSERT INTO tbl_job_histories (employee, start_date, status, job, department)
        SELECT i.id, i.hire_date, 'Active', i.job, i.department
        FROM INSERTED i;
    END
END;
GO

--DROP TRIGGER tr_update_employee_job;

---AFTER DELETE-----------------------------------------------------------------------------------

CREATE TRIGGER tr_delete_employee
ON tbl_employees
AFTER DELETE
AS
BEGIN
    INSERT INTO tbl_job_histories (employee, start_date, status, job, department)
    SELECT d.id, d.hire_date, 'Resign', d.job, d.department
    FROM DELETED d;
END;
GO

--DROP TRIGGER tr_delete_employee;