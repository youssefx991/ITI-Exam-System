USE ITI_ExamSystem
GO

CREATE OR ALTER PROCEDURE sp_Exam_Generation
    @CourseName VARCHAR(50),
    @NumTF INT,
    @NumMC INT,
    @ExamID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON; -- no message of # rows affected for better preformance

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Validate total questions
        IF (@NumTF + @NumMC <> 10) -- in student answer will take 10 paramters
            THROW 50001, 'Total number of questions must be exactly 10', 1;

        DECLARE @CourseID INT;

        SELECT @CourseID = CrsId
        FROM Course
        WHERE CrsName = @CourseName;

        IF @CourseID IS NULL
            THROW 50002, 'Course does not exist', 1;

        -- not identity
        SELECT @ExamID = ISNULL(MAX(ExId), 0) + 1
        FROM Exam;

        -- Insert Exam
        INSERT INTO Exam (ExId, ExDate, CrsId)
        VALUES (@ExamID, GETDATE(), @CourseID);

        DECLARE @Order INT = 1;

        -- Insert True/False questions
        INSERT INTO Exam_Question (ExId, QId, QOrder)
        SELECT TOP (@NumTF)
               @ExamID,
               QId,
               ROW_NUMBER() OVER (ORDER BY NEWID()) + @Order - 1
        FROM Question
        WHERE CrsId = @CourseID
          AND QType = 'TF';
        --select @@ROWCOUNT;

        IF @@ROWCOUNT <> @NumTF
            THROW 50003, 'Not enough True/False questions', 1;

        SET @Order = @Order + @NumTF;

        -- Insert MCQ questions
        INSERT INTO Exam_Question (ExId, QId, QOrder)
        SELECT TOP (@NumMC)
               @ExamID,
               QId,
               ROW_NUMBER() OVER (ORDER BY NEWID()) + @Order - 1
        FROM Question
        WHERE CrsId = @CourseID
          AND QType = 'MCQ';
         -- select @@ROWCOUNT
        IF @@ROWCOUNT <> @NumMC
            THROW 50004, 'Not enough MCQ questions', 1;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
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
