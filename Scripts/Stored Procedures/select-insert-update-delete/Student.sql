use ITI_ExamSystem
go


CREATE OR ALTER PROCEDURE sp_Student_Insert
    @StId INT,
    @StName VARCHAR(100),
    @StEmail VARCHAR(100),
    @TrackID INT
AS
BEGIN
    -- Validate Track
    IF NOT EXISTS (
        SELECT 1 FROM Track WHERE TrackID = @TrackID
    )
    BEGIN
        RAISERROR('Invalid Track ID.', 16, 1);
        RETURN;
    END

    -- Validate unique ID and Email
    IF EXISTS (
        SELECT 1 FROM Student
        WHERE StId = @StId OR StEmail = @StEmail
    )
    BEGIN
        RAISERROR('Student ID or Email already exists.', 16, 1);
        RETURN;
    END

    INSERT INTO Student (StId, StName, StEmail, TrackID)
    VALUES (@StId, @StName, @StEmail, @TrackID);
END
GO

CREATE OR ALTER PROCEDURE sp_Student_Update
    @StId INT,
    @StName VARCHAR(100) = NULL,
    @StEmail VARCHAR(100) = NULL,
    @TrackID INT = NULL
AS
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM Student WHERE StId = @StId
    )
    BEGIN
        RAISERROR('Student not found.', 16, 1);
        RETURN;
    END

    IF @TrackID IS NOT NULL
       AND NOT EXISTS (SELECT 1 FROM Track WHERE TrackID = @TrackID)
    BEGIN
        RAISERROR('Invalid Track ID.', 16, 1);
        RETURN;
    END

    UPDATE Student
    SET StName  = ISNULL(@StName, StName),
        StEmail = ISNULL(@StEmail, StEmail),
        TrackID = ISNULL(@TrackID, TrackID)
    WHERE StId = @StId;
END
GO


CREATE PROCEDURE sp_Student_Delete
    @StId INT
AS
BEGIN
    DELETE FROM Student
    WHERE StId = @StId
END
GO

CREATE PROCEDURE sp_Student_Select
    @StId INT = NULL  -- If NULL, return all students, if provided, return specific one
AS
BEGIN
    SELECT 
        S.StId,
        S.StName,
        S.StEmail,
        S.TrackID,
        T.TrackName,
        D.DeptName
    FROM Student S
    JOIN Track T ON S.TrackID = T.TrackID
    JOIN Department D ON T.DeptID = D.DeptID
    WHERE (@StId IS NULL OR S.StId = @StId)
    ORDER BY S.StId
END
GO

-- select by student id
create or alter procedure sp_Student_SelectById
    @StId INT
as
begin
    select *
    from Student S
    where S.StId = @StId
end
go


-- exec sp_Student_SelectById 2;