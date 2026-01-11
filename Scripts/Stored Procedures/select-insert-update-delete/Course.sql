CREATE OR ALTER PROCEDURE sp_Course_Insert
    @CrsId INT,
    @CrsName VARCHAR(100),
    @MaxDegree INT,
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

    -- Validate degree
    IF @MaxDegree <= 0
    BEGIN
        RAISERROR('MaxDegree must be greater than zero.', 16, 1);
        RETURN;
    END

    -- Validate unique ID (and optionally name)
    IF EXISTS (
        SELECT 1
        FROM Course
        WHERE CrsId = @CrsId
           OR LOWER(CrsName) = LOWER(@CrsName)
    )
    BEGIN
        RAISERROR('Course ID or name already exists.', 16, 1);
        RETURN;
    END

    INSERT INTO Course (CrsId, CrsName, MaxDegree, TrackID)
    VALUES (@CrsId, @CrsName, @MaxDegree, @TrackID);
END
GO


CREATE OR ALTER PROCEDURE sp_Course_Update
    @CrsId INT,
    @CrsName VARCHAR(100) = NULL,
    @MaxDegree INT = NULL,
    @TrackID INT = NULL
AS
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM Course WHERE CrsId = @CrsId
    )
    BEGIN
        RAISERROR('Course not found.', 16, 1);
        RETURN;
    END

    IF @TrackID IS NOT NULL
       AND NOT EXISTS (SELECT 1 FROM Track WHERE TrackID = @TrackID)
    BEGIN
        RAISERROR('Invalid Track ID.', 16, 1);
        RETURN;
    END

    IF @MaxDegree IS NOT NULL AND @MaxDegree <= 0
    BEGIN
        RAISERROR('MaxDegree must be greater than zero.', 16, 1);
        RETURN;
    END

    UPDATE Course
    SET CrsName   = ISNULL(@CrsName, CrsName),
        MaxDegree = ISNULL(@MaxDegree, MaxDegree),
        TrackID   = ISNULL(@TrackID, TrackID)
    WHERE CrsId = @CrsId;
END
GO


CREATE PROCEDURE sp_Course_Delete
    @CrsId INT
AS
BEGIN
    DELETE FROM Course
    WHERE CrsId = @CrsId
END
GO

CREATE PROCEDURE sp_Course_Select
    @CrsId INT = NULL  -- If NULL, return all courses; if provided, return specific one
AS
BEGIN
    SELECT 
        C.CrsId,
        C.CrsName,
        C.MaxDegree,
        C.TrackID,
        T.TrackName,
        D.DeptName
    FROM Course C
    JOIN Track T ON C.TrackID = T.TrackID
    JOIN Department D ON T.DeptID = D.DeptID
    WHERE (@CrsId IS NULL OR C.CrsId = @CrsId)
    ORDER BY C.CrsId
END
GO


--test cases

/*

-- Insert a new course
EXEC sp_Course_Insert 'Database Systems', 100, 2;

-- Update only the max degree
EXEC sp_Course_Update @CrsId = 5, @MaxDegree = 150;

-- Update only the course name
EXEC sp_Course_Update @CrsId = 5, @CrsName = 'Advanced Database';

-- Move course to a different track
EXEC sp_Course_Update @CrsId = 5, @TrackID = 4;

-- Update multiple fields
EXEC sp_Course_Update @CrsId = 5, 
                      @CrsName = 'SQL & NoSQL', 
                      @MaxDegree = 200;

-- Get all courses with track and department info
EXEC sp_Course_Select;

-- Get a specific course
EXEC sp_Course_Select @CrsId = 3;

-- Delete a course
EXEC sp_Course_Delete @CrsId = 10;

*/