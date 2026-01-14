-- Switch context to the ITI_ExamSystem database
USE ITI_ExamSystem
GO

-- Create or update the exam generation stored procedure
CREATE OR ALTER PROCEDURE sp_Exam_Generation
    @CourseName VARCHAR(50),  -- Name of the course for which the exam is generated
    @NumTF INT,               -- Number of True/False questions
    @NumMC INT,               -- Number of MCQ questions
    @ExamID INT OUTPUT        -- Output parameter to return the generated Exam ID
AS
BEGIN
    -- Prevents "X rows affected" messages for better performance
    SET NOCOUNT ON;

    BEGIN TRY
        -- Start a database transaction to ensure atomicity
        BEGIN TRANSACTION;

        -- =====================
        -- VALIDATION
        -- =====================

        -- Ensure total number of questions equals 10
        -- Student answers procedure expects exactly 10 questions
        IF (@NumTF + @NumMC <> 10)
            THROW 50001, 'Total number of questions must be exactly 10', 1;

        -- Declare variable to store course ID
        DECLARE @CourseID INT;

        -- Retrieve Course ID based on course name
        SELECT @CourseID = CrsId
        FROM Course
        WHERE CrsName = @CourseName;

        -- If course does not exist, stop execution
        IF @CourseID IS NULL
            THROW 50002, 'Course does not exist', 1;

        -- =====================
        -- EXAM INSERTION
        -- =====================

        -- Generate a new Exam ID manually (table is not IDENTITY)
        SELECT @ExamID = ISNULL(MAX(ExId), 0) + 1
        FROM Exam;

        -- Insert new exam record
        INSERT INTO Exam (ExId, ExDate, CrsId)
        VALUES (@ExamID, GETDATE(), @CourseID);

        -- Initialize question order counter
        DECLARE @Order INT = 1;

        -- =====================
        -- INSERT TRUE / FALSE QUESTIONS
        -- =====================

        -- Insert random True/False questions for the exam
        INSERT INTO Exam_Question (ExId, QId, QOrder)
        SELECT TOP (@NumTF)
               @ExamID,                              -- Exam ID
               QId,                                  -- Question ID
               ROW_NUMBER() OVER (ORDER BY NEWID())  -- Random order
               + @Order - 1                          -- Maintain correct sequence
        FROM Question
        WHERE CrsId = @CourseID
          AND QType = 'TF';

        -- Ensure enough True/False questions were inserted
        IF @@ROWCOUNT <> @NumTF
            THROW 50003, 'Not enough True/False questions', 1;

        -- Update order counter for next question type
        SET @Order = @Order + @NumTF;

        -- =====================
        -- INSERT MCQ QUESTIONS
        -- =====================

        -- Insert random MCQ questions for the exam
        INSERT INTO Exam_Question (ExId, QId, QOrder)
        SELECT TOP (@NumMC)
               @ExamID,                              -- Exam ID
               QId,                                  -- Question ID
               ROW_NUMBER() OVER (ORDER BY NEWID())  -- Random order
               + @Order - 1                          -- Continue ordering
        FROM Question
        WHERE CrsId = @CourseID
          AND QType = 'MCQ';

        -- Ensure enough MCQ questions were inserted
        IF @@ROWCOUNT <> @NumMC
            THROW 50004, 'Not enough MCQ questions', 1;

        -- Commit transaction if everything succeeds
        COMMIT TRANSACTION;

    END TRY
    BEGIN CATCH
        -- Roll back all changes if any error occurs
        ROLLBACK TRANSACTION;

        -- Re-throw the original error for the caller (Python, etc.)
        THROW;
    END CATCH
END;
GO

---------------------------------TESTINNG PART---------------------------------------------
/*select count(*) from Question where CrsId =1 and QType = 'MCQ'; --- courses id 1---4 qid 1-43
select * from choice 
select * from Course -- HTML5 & CSS3 Fundamentals

delete from exam
delete from Exam_Question
select * from exam
select * from Exam_Question
select QType from Question join Exam_Question on Question.QId = Exam_Question.QId
DECLARE @NewExamID INT;
EXEC sp_GenerateExam
    @CourseName = 'HTML5 & CSS3 Fundamentals',
    @NumTF = 5,
    @NumMC = 5,
    @ExamID = @NewExamID OUTPUT;*/
