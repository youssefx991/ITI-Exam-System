/* =========================
   Track INSERT
   ========================= */
CREATE OR ALTER PROC SP_Track_Insert
    @TrackID INT,
    @Track_Name VARCHAR(50),
    @Department_ID INT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Track
        WHERE TrackID = @TrackID
           OR LOWER(TrackName) = LOWER(@Track_Name)
    )
    BEGIN
        RAISERROR('Track ID or name already exists.', 16, 1);
        RETURN;
    END

    IF NOT EXISTS (
        SELECT 1
        FROM Department
        WHERE DeptID = @Department_ID
    )
    BEGIN
        RAISERROR('Invalid Department ID.', 16, 1);
        RETURN;
    END

    INSERT INTO Track (TrackID, TrackName, DeptID)
    VALUES (@TrackID, @Track_Name, @Department_ID);
END
GO

/* =========================
   Track SELECT ALL
   ========================= */
CREATE OR ALTER PROC SP_Track_SelectAll
AS
BEGIN
    SELECT TrackID,
           TrackName AS Track_Name,
           DeptID AS Department_ID
    FROM Track;
END
GO

/* =========================
   Track SELECT BY ID
   ========================= */
CREATE OR ALTER PROC SP_Track_SelectByID
    @TrackID INT
AS
BEGIN
    SELECT TrackID,
           TrackName AS Track_Name,
           DeptID AS Department_ID
    FROM Track
    WHERE TrackID = @TrackID;
END
GO

/* =========================
   Track UPDATE NAME
   ========================= */
CREATE OR ALTER PROC SP_Track_Update
    @TrackID INT,
    @Track_New_Name VARCHAR(50)
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Track
        WHERE LOWER(TrackName) = LOWER(@Track_New_Name)
          AND TrackID <> @TrackID
    )
    BEGIN
        RAISERROR('Track name already exists.', 16, 1);
        RETURN;
    END

    UPDATE Track
    SET TrackName = @Track_New_Name
    WHERE TrackID = @TrackID;
END
GO

/* =========================
   Track UPDATE DEPARTMENT
   ========================= */
CREATE OR ALTER PROC SP_Track_UpdateDept
    @TrackID INT,
    @New_Department_ID INT
AS
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM Department
        WHERE DeptID = @New_Department_ID
    )
    BEGIN
        RAISERROR('Invalid Department ID.', 16, 1);
        RETURN;
    END

    UPDATE Track
    SET DeptID = @New_Department_ID
    WHERE TrackID = @TrackID;
END
GO

/* =========================
   Track DELETE
   ========================= */
CREATE OR ALTER PROC SP_Track_Delete
    @TrackID INT
AS
BEGIN
    DELETE FROM Track
    WHERE TrackID = @TrackID;
END
GO
