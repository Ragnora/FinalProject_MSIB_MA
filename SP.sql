---------- EMPLOYEE ---------- 

-- ADD Employee --
CREATE PROCEDURE usp_AddEmployee
    @FirstName VARCHAR(25),
    @LastName VARCHAR(25),
    @Gender VARCHAR(10),
    @Email VARCHAR(25),
    @Phone VARCHAR(20),
    @HireDate DATE,
    @Salary INT,
    @Manager INT,
    @Job VARCHAR(10),
    @Department INT
AS
BEGIN
    INSERT INTO tbl_employees (first_name, last_name, gender, email, phone, hire_date, salary, manager, job, department)
    VALUES (@FirstName, @LastName, @Gender, @Email, @Phone, @HireDate, @Salary, @Manager, @Job, @Department);
END;
GO

-- EDIT Employee --
CREATE PROCEDURE usp_UpdateEmployee
    @EmployeeID INT,
    @FirstName VARCHAR(25),
    @LastName VARCHAR(25),
    @Gender VARCHAR(10),
    @Email VARCHAR(25),
    @Phone VARCHAR(20),
    @HireDate DATE,
    @Salary INT,
    @Manager INT,
    @Job VARCHAR(10),
    @Department INT
AS
BEGIN
    UPDATE tbl_employees
    SET 
        first_name = @FirstName,
        last_name = @LastName,
        gender = @Gender,
        email = @Email,
        phone = @Phone,
        hire_date = @HireDate,
        salary = @Salary,
        manager = @Manager,
        job = @Job,
        department = @Department
    WHERE id = @EmployeeID;
END;
GO

-- DELETE Employee --
CREATE PROCEDURE usp_DeleteEmployee
    @EmployeeID INT
AS
BEGIN
    DELETE FROM tbl_employees
    WHERE id = @EmployeeID;
END;
GO

-- DETAIL Employee --
CREATE PROCEDURE usp_GetEmployeeDetails
    @EmployeeID INT
AS
BEGIN
    SELECT id, first_name, last_name, gender, email, phone, hire_date, salary, manager, job, department
    FROM tbl_employees
    WHERE id = @EmployeeID;
END;
GO


---------- JOB ---------- 

-- ADD Job --
CREATE PROCEDURE usp_AddJob
    @JobID VARCHAR(10),
    @Title VARCHAR(35),
    @MinSalary INT,
    @MaxSalary INT
AS
BEGIN
    INSERT INTO tbl_jobs (id, title, min_salary, max_salary)
    VALUES (@JobID, @Title, @MinSalary, @MaxSalary);
END;
GO

-- EDIT Job --
CREATE PROCEDURE usp_UpdateJob
    @JobID VARCHAR(10),
    @Title VARCHAR(35),
    @MinSalary INT,
    @MaxSalary INT
AS
BEGIN
    UPDATE tbl_jobs
    SET 
        title = @Title,
        min_salary = @MinSalary,
        max_salary = @MaxSalary
    WHERE id = @JobID;
END;
GO

-- DELETE Job --
CREATE PROCEDURE usp_DeleteJob
    @JobID VARCHAR(10)
AS
BEGIN
    DELETE FROM tbl_jobs
    WHERE id = @JobID;
END;
GO


---------- DEPARTMENT ---------- 

-- ADD Department --
CREATE PROCEDURE usp_AddDepartment
    @Name VARCHAR(30),
    @Location INT
AS
BEGIN
    INSERT INTO tbl_departments (name, location)
    VALUES (@Name, @Location);
END;
GO

-- EDIT Department --
CREATE PROCEDURE usp_UpdateDepartment
    @DepartmentID INT,
    @Name VARCHAR(30),
    @Location INT
AS
BEGIN
    UPDATE tbl_departments
    SET 
        name = @Name,
        location = @Location
    WHERE id = @DepartmentID;
END;
GO

-- DELETE Department --
CREATE PROCEDURE usp_DeleteDepartment
    @DepartmentID INT
AS
BEGIN
    DELETE FROM tbl_departments
    WHERE id = @DepartmentID;
END;
GO


---------- LOCATION ----------

-- ADD Location --
CREATE PROCEDURE usp_AddLocation
    @StreetAddress VARCHAR(40),
    @PostalCode VARCHAR(12),
    @City VARCHAR(30),
    @StateProvince VARCHAR(25),
    @Country CHAR(3)
AS
BEGIN
    INSERT INTO tbl_locations (street_address, postal_code, city, state_province, country)
    VALUES (@StreetAddress, @PostalCode, @City, @StateProvince, @Country)
END
GO

-- EDIT Location --
CREATE PROCEDURE usp_EditLocation
    @LocationID INT,
    @StreetAddress VARCHAR(40),
    @PostalCode VARCHAR(12),
    @City VARCHAR(30),
    @StateProvince VARCHAR(25),
    @Country CHAR(3)
AS
BEGIN
    UPDATE tbl_locations
    SET 
        street_address = @StreetAddress,
        postal_code = @PostalCode,
        city = @City,
        state_province = @StateProvince,
        country = @Country
    WHERE id = @LocationID
END
GO

-- DELETE Location --
CREATE PROCEDURE usp_DeleteLocation
    @LocationID INT
AS
BEGIN
    DELETE FROM tbl_locations
    WHERE id = @LocationID
END
GO


---------- COUNTRY ----------

-- ADD Country --
CREATE PROCEDURE usp_AddCountry
    @CountryID CHAR(3),
    @CountryName VARCHAR(40),
    @RegionID INT
AS
BEGIN
    INSERT INTO tbl_countries (id, name, region)
    VALUES (@CountryID, @CountryName, @RegionID)
END
GO

-- EDIT Country --
CREATE PROCEDURE usp_EditCountry
    @CountryID CHAR(3),
    @CountryName VARCHAR(40),
    @RegionID INT
AS
BEGIN
    UPDATE tbl_countries
    SET 
        name = @CountryName,
        region = @RegionID
    WHERE id = @CountryID
END
GO

-- DELETE Country --
CREATE PROCEDURE usp_DeleteCountry
    @CountryID CHAR(3)
AS
BEGIN
    DELETE FROM tbl_countries
    WHERE id = @CountryID
END
GO


---------- REGION ----------

-- ADD Region --
CREATE PROCEDURE usp_AddRegion
    @RegionName VARCHAR(25)
AS
BEGIN
    INSERT INTO tbl_regions (name)
    VALUES (@RegionName)
END
GO

-- EDIT Region --
CREATE PROCEDURE usp_EditRegion
    @RegionID INT,
    @RegionName VARCHAR(25)
AS
BEGIN
    UPDATE tbl_regions
    SET name = @RegionName
    WHERE id = @RegionID
END
GO

-- DELETE Region --
CREATE PROCEDURE usp_DeleteRegion
    @RegionID INT
AS
BEGIN
    DELETE FROM tbl_regions
    WHERE id = @RegionID
END
GO


---------- ROLE ----------

-- ADD Role --
CREATE PROCEDURE usp_AddRole
    @Name VARCHAR(50)
AS
BEGIN
    INSERT INTO tbl_roles (name)
    VALUES (@Name)
END;
GO

-- EDIT Role --
CREATE PROCEDURE usp_UpdateRole
    @RoleID INT,
    @Name VARCHAR(50)
AS
BEGIN
    UPDATE tbl_roles
    SET name = @Name
    WHERE id = @RoleID
END;
GO

-- DELETE Role --
CREATE PROCEDURE usp_DeleteRole
    @RoleID INT
AS
BEGIN
    DELETE FROM tbl_roles 
    WHERE id = @RoleID
END;
GO


---------- PERMISSION ----------

-- ADD Permission --
CREATE PROCEDURE usp_AddPermission
    @Name VARCHAR(100)
AS
BEGIN
    INSERT INTO tbl_permissions(name)
    VALUES (@Name)
END;
GO

-- EDIT Permission --
CREATE PROCEDURE usp_UpdatePermission
    @PermissionID INT,
    @Name VARCHAR(100)
AS
BEGIN
    UPDATE tbl_permissions
    SET name = @Name
    WHERE id = @PermissionID
END;
GO

-- DELETE Permission --
CREATE PROCEDURE usp_DeletePermission
    @PermissionID INT
AS
BEGIN
    DELETE FROM tbl_permissions
    WHERE id = @PermissionID
END;
GO


---------- GENERATE OTP ----------
CREATE PROCEDURE usp_GenerateOTP
@OTP INT OUTPUT
AS
BEGIN
    SET @OTP = CAST(FLOOR(RAND() * 9000) + 1000 AS INT);
END;
GO


---------- IS EXPIRED ----------
CREATE PROCEDURE usp_ExpiredOTP
    @AccountId INT,
    @Result INT OUTPUT
AS
BEGIN
    DECLARE @IsUsed DATETIME;
    DECLARE @CurrentTime DATETIME;

    SET @CurrentTime = GETDATE();

    SELECT @IsUsed = is_used
    FROM tbl_accounts
    WHERE id = @AccountId;

    IF @IsUsed IS NOT NULL AND DATEDIFF(MINUTE, @IsUsed, @CurrentTime) > 5
    BEGIN
        UPDATE tbl_accounts
        SET is_expired = 1
        WHERE id = @AccountId;

        SET @Result = 1;
    END
    ELSE
    BEGIN
        UPDATE tbl_accounts
        SET is_expired = 0
        WHERE id = @AccountId;

        SET @Result = 2;
    END
END;
GO