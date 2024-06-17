---------- EMAIL FORMAT ----------

CREATE FUNCTION func_email_format (
    @Email VARCHAR(50)
)
RETURNS INT
AS
BEGIN
    IF @Email LIKE '%@%._%'
      RETURN 1;
    RETURN 2;
END;

--DROP FUNCTION func_email_format

---------- PASSWORD POLICY ----------
CREATE FUNCTION func_password_policy (
    @Password VARCHAR(255)
)
RETURNS INT
AS
BEGIN
    IF LEN(@Password) >= 8 
      AND @Password LIKE '%[A-Z]%'
      AND @Password LIKE '%[a-z]%'
      AND @Password LIKE '%[0-9]%'
      AND @Password LIKE '%[!@#$%^&*()]%'
      RETURN 1;
    RETURN 2;
END;

--DROP FUNCTION func_password_policy

---------- PASSWORD MATCH ----------
CREATE FUNCTION func_password_match (
    @NewPassword VARCHAR(255),
    @ConfirmPassword VARCHAR(255)
)
RETURNS INT
AS
BEGIN
    IF @NewPassword = @ConfirmPassword
      RETURN 1;
    RETURN 2;
END;

--DROP FUNCTION func_password_match

---------- GENDER ----------
CREATE FUNCTION func_gender (
    @Gender VARCHAR(10)
)
RETURNS INT
AS
BEGIN
    IF @Gender IN ('Male', 'Female')
      RETURN 1;
    RETURN 2;
END;

--DROP FUNCTION func_gender

---------- PHONE NUMBER ----------
CREATE FUNCTION func_phone_number (
    @Phone VARCHAR(20)
)
RETURNS INT
AS
BEGIN
    IF @Phone NOT LIKE '%[^0-9]%' AND LEFT(@Phone, 1) <> '0'
        RETURN 1;
    RETURN 2;
END;

--DROP FUNCTION func_phone_number

---------- SALARY ----------
CREATE FUNCTION func_salary (
    @JobId VARCHAR(10),
    @Salary INT
)
RETURNS INT
AS
BEGIN
    DECLARE @MinSalary INT, @MaxSalary INT
    SELECT @MinSalary = min_salary, @MaxSalary = max_salary 
    FROM tbl_jobs 
    WHERE id = @JobId;
    
    IF @Salary BETWEEN @MinSalary AND @MaxSalary
        RETURN 1;
    RETURN 2;
END;

--DROP FUNCTION func_salary

---------- VALID OTP ----------
CREATE FUNCTION func_valid_otp (
    @AccountId INT,
    @Otp INT
)
RETURNS INT
AS
BEGIN
    DECLARE @ExpectedOtp INT
    SELECT @ExpectedOtp = otp FROM tbl_accounts WHERE id = @AccountId

    IF @Otp = @ExpectedOtp
        RETURN 1;
    RETURN 2;
END;

--DROP FUNCTION func_valid_otp

---------- JOB ID ----------
CREATE FUNCTION func_job_id (
    @JobId VARCHAR(10)
)
RETURNS INT
AS
BEGIN
    IF @JobId LIKE '[A-Z][A-Z]_[A-Z]%' AND LEN(@JobId) <= 10
        RETURN 1;
    RETURN 2;
END;

--DROP FUNCTION func_job_id