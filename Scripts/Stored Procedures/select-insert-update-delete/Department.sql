USE ITI_ExamSystem;
GO

/* =========================
   Department INSERT
   ========================= */
CREATE OR ALTER PROC SP_Department_Insert
    @DeptID INT,
    @Department_Name VARCHAR(100)
AS
BEGIN
    IF @Department_Name IS NULL OR LTRIM(RTRIM(@Department_Name)) = ''
    BEGIN
        RAISERROR('Department name cannot be empty.', 16, 1);
        RETURN;
    END

    IF EXISTS (
        SELECT 1
        FROM Department
        WHERE DeptID = @DeptID
           OR LOWER(DeptName) = LOWER(@Department_Name)
    )
    BEGIN
        RAISERROR('Department ID or name already exists.', 16, 1);
        RETURN;
    END

    INSERT INTO Department (DeptID, DeptName)
    VALUES (@DeptID, @Department_Name);
END
GO

/* =========================
   Department SELECT ALL
   ========================= */
CREATE OR ALTER PROC SP_Department_SelectAll
AS
BEGIN
    SELECT DeptID AS Department_ID,
           DeptName AS Department_Name
    FROM Department;
END
GO

/* =========================
   Department SELECT BY ID
   ========================= */
CREATE OR ALTER PROC SP_Department_SelectByID
    @DeptID INT
AS
BEGIN
    SELECT DeptID AS Department_ID,
           DeptName AS Department_Name
    FROM Department
    WHERE DeptID = @DeptID;
END
GO

/* =========================
   Department UPDATE
   ========================= */
CREATE OR ALTER PROC SP_Department_Update
    @DeptID INT,
    @New_Name VARCHAR(100)
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Department
        WHERE LOWER(DeptName) = LOWER(@New_Name)
          AND DeptID <> @DeptID
    )
    BEGIN
        RAISERROR('Department name already exists.', 16, 1);
        RETURN;
    END

    UPDATE Department
    SET DeptName = @New_Name
    WHERE DeptID = @DeptID;
END
GO

/* =========================
   Department DELETE
   ========================= */
CREATE OR ALTER PROC SP_Department_Delete
    @DeptID INT
AS
BEGIN
    DELETE FROM Department
    WHERE DeptID = @DeptID;
END
GO
