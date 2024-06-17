---------------------- ROLE ----------------------
USE db_EmployeeManagement;
CREATE ROLE Super_Admin;
CREATE ROLE Admin;
CREATE ROLE Manager;
CREATE ROLE Employee;

--DROP ROLE Super_Admin;
--DROP ROLE Admin;
--DROP ROLE Manager;
--DROP ROLE Employee;


---------- TBL EMPLOYEE ---------- 
GRANT SELECT, INSERT, UPDATE, DELETE, ALTER ON [dbo].[tbl_employees] TO Super_Admin;
GRANT SELECT, INSERT, UPDATE, DELETE, ALTER ON [dbo].[tbl_employees] TO Admin;
GRANT SELECT, UPDATE ON [dbo].[tbl_employees] TO Manager;
GRANT SELECT, UPDATE ON [dbo].[tbl_employees] TO Employee;

---------- TBL JOB ---------- 
GRANT INSERT, UPDATE, DELETE, ALTER ON [dbo].[tbl_jobs] TO Super_Admin;
GRANT INSERT, UPDATE, DELETE, ALTER ON [dbo].[tbl_jobs] TO Admin;

---------- TBL DEPARTMENT ---------- 
GRANT INSERT, UPDATE, DELETE, ALTER ON [dbo].[tbl_departments] TO Super_Admin;
GRANT INSERT, UPDATE, DELETE, ALTER ON [dbo].[tbl_departments] TO Admin;

---------- TBL LOCATION ----------
GRANT INSERT, UPDATE, DELETE, ALTER ON [dbo].[tbl_locations] TO Super_Admin;
GRANT INSERT, UPDATE, DELETE, ALTER ON [dbo].[tbl_locations] TO Admin;

---------- TBL COUNTRY ----------
GRANT INSERT, UPDATE, DELETE, ALTER ON [dbo].[tbl_countries] TO Super_Admin;
GRANT INSERT, UPDATE, ALTER ON [dbo].[tbl_countries] TO Admin;

---------- TBL REGION ----------
GRANT INSERT, UPDATE, DELETE, ALTER ON [dbo].[tbl_regions] TO Super_Admin;
GRANT INSERT, UPDATE, ALTER ON [dbo].[tbl_regions] TO Admin;

---------- TBL ROLE ----------
GRANT INSERT, UPDATE, DELETE, ALTER ON [dbo].[tbl_roles] TO Super_Admin;
GRANT INSERT, UPDATE, ALTER ON [dbo].[tbl_roles] TO Admin;

---------- TBL PERMISSION ----------
GRANT INSERT, UPDATE, DELETE, ALTER ON [dbo].[tbl_Permissions] TO Super_Admin;


---------- SP EMPLOYEE ---------- 

-- ADD Employee --
GRANT EXECUTE ON OBJECT::[dbo].[usp_AddEmployee] TO Super_Admin;
GRANT EXECUTE ON OBJECT::[dbo].[usp_AddEmployee] TO Admin;

-- EDIT Employee --
GRANT EXECUTE ON OBJECT::[dbo].[usp_UpdateEmployee] TO Super_Admin;
GRANT EXECUTE ON OBJECT::[dbo].[usp_UpdateEmployee] TO Admin;
GRANT EXECUTE ON OBJECT::[dbo].[usp_UpdateEmployee] TO Manager;

-- DELETE Employee --
GRANT EXECUTE ON OBJECT::[dbo].[usp_DeleteEmployee] TO Super_Admin;
GRANT EXECUTE ON OBJECT::[dbo].[usp_DeleteEmployee] TO Admin;

-- DETAIL Employee --
GRANT EXECUTE ON OBJECT::[dbo].[usp_GetEmployeeDetails] TO Super_Admin;
GRANT EXECUTE ON OBJECT::[dbo].[usp_GetEmployeeDetails] TO Admin;
GRANT EXECUTE ON OBJECT::[dbo].[usp_GetEmployeeDetails] TO Manager;


---------- SP JOB ---------- 

-- ADD Job --
GRANT EXECUTE ON OBJECT::[dbo].[usp_AddJob] TO Super_Admin;
GRANT EXECUTE ON OBJECT::[dbo].[usp_AddJob] TO Admin;

-- EDIT Job --
GRANT EXECUTE ON OBJECT::[dbo].[usp_UpdateJob] TO Super_Admin;
GRANT EXECUTE ON OBJECT::[dbo].[usp_UpdateJob] TO Admin;

-- DELETE Job --
GRANT EXECUTE ON OBJECT::[dbo].[usp_DeleteJob] TO Super_Admin;
GRANT EXECUTE ON OBJECT::[dbo].[usp_DeleteJob] TO Admin;


---------- SP DEPARTMENT ---------- 

-- ADD Department --
GRANT EXECUTE ON OBJECT::[dbo].[usp_AddDepartment] TO Super_Admin;
GRANT EXECUTE ON OBJECT::[dbo].[usp_AddDepartment] TO Admin;

-- EDIT Department --
GRANT EXECUTE ON OBJECT::[dbo].[usp_UpdateDepartment] TO Super_Admin;
GRANT EXECUTE ON OBJECT::[dbo].[usp_UpdateDepartment] TO Admin;

-- DELETE Department --
GRANT EXECUTE ON OBJECT::[dbo].[usp_DeleteDepartment] TO Super_Admin;
GRANT EXECUTE ON OBJECT::[dbo].[usp_DeleteDepartment] TO Admin;


---------- SP LOCATION ----------

-- ADD Location --
GRANT EXECUTE ON OBJECT::[dbo].[usp_AddLocation] TO Super_Admin;
GRANT EXECUTE ON OBJECT::[dbo].[usp_AddLocation] TO Admin;

-- EDIT Location --
GRANT EXECUTE ON OBJECT::[dbo].[usp_UpdateLocation] TO Super_Admin;
GRANT EXECUTE ON OBJECT::[dbo].[usp_UpdateLocation] TO Admin;

-- DELETE Location --
GRANT EXECUTE ON OBJECT::[dbo].[usp_DeleteLocation] TO Super_Admin;
GRANT EXECUTE ON OBJECT::[dbo].[usp_DeleteLocation] TO Admin;


---------- SP COUNTRY ----------

-- ADD Country --
GRANT EXECUTE ON OBJECT::[dbo].[usp_AddCountry] TO Super_Admin;
GRANT EXECUTE ON OBJECT::[dbo].[usp_AddCountry] TO Admin;

-- EDIT Country --
GRANT EXECUTE ON OBJECT::[dbo].[usp_UpdateCountry] TO Super_Admin;
GRANT EXECUTE ON OBJECT::[dbo].[usp_UpdateCountry] TO Admin;

-- DELETE Country --
GRANT EXECUTE ON OBJECT::[dbo].[usp_DeleteCountry] TO Super_Admin;


---------- SP REGION ----------

-- ADD Region --
GRANT EXECUTE ON OBJECT::[dbo].[usp_AddRegion] TO Super_Admin;
GRANT EXECUTE ON OBJECT::[dbo].[usp_AddRegion] TO Admin;

-- EDIT Region --
GRANT EXECUTE ON OBJECT::[dbo].[usp_UpdateRegion] TO Super_Admin;
GRANT EXECUTE ON OBJECT::[dbo].[usp_UpdateRegion] TO Admin;

-- DELETE Region --
GRANT EXECUTE ON OBJECT::[dbo].[usp_DeleteRegion] TO Super_Admin;


---------- SP ROLE ----------

-- ADD Role --
GRANT EXECUTE ON OBJECT::[dbo].[usp_AddRole] TO Super_Admin;
GRANT EXECUTE ON OBJECT::[dbo].[usp_AddRole] TO Admin;

-- EDIT Role --
GRANT EXECUTE ON OBJECT::[dbo].[usp_UpdateRole] TO Super_Admin;
GRANT EXECUTE ON OBJECT::[dbo].[usp_UpdateRole] TO Admin;

-- DELETE Role --
GRANT EXECUTE ON OBJECT::[dbo].[usp_DeleteRole] TO Super_Admin;


---------- SP PERMISSION ----------

-- ADD Permission --
GRANT EXECUTE ON OBJECT::[dbo].[usp_AddPermission] TO Super_Admin;

-- EDIT Permission --
GRANT EXECUTE ON OBJECT::[dbo].[usp_UpdatePermission] TO Super_Admin;

-- DELETE Permission --
GRANT EXECUTE ON OBJECT::[dbo].[usp_DeletePermission] TO Super_Admin;


---------- SP PROFILE ----------

-- EDIT Permission --
GRANT EXECUTE ON OBJECT::[dbo].[usp_UpdateProfile] TO Manager;
GRANT EXECUTE ON OBJECT::[dbo].[usp_UpdateProfile] TO Employee;

-- DETAIL Employee --
GRANT EXECUTE ON OBJECT::[dbo].[usp_GetProfileDetails] TO Manager;
GRANT EXECUTE ON OBJECT::[dbo].[usp_GetProfileDetails] TO Employee;