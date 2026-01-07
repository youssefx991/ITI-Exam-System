USE ITI_ExamSystem
GO

-------------------------------------------------QUESTION Table constrains-----------------------------------------------------------

ALTER TABLE Question
ADD CONSTRAINT CK_QText_NoEmpty
CHECK (LEN(LTRIM(RTRIM(QText))) > 0);

ALTER TABLE Question
ALTER COLUMN QType VARCHAR(10) NOT NULL;

ALTER TABLE Question
ADD CONSTRAINT CK_QType
CHECK (QType IN ('MCQ', 'TF'));

ALTER TABLE Question
ADD CONSTRAINT CK_QDegree
CHECK (QDegree BETWEEN 1 AND 3);
GO

CREATE OR ALTER TRIGGER trg_Validate_QAnswer
ON Question
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Validate MCQ answers
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE QType = 'MCQ'
          AND QAnswer NOT IN ('A','B','C')
    )
    THROW 50001, 'For MCQ questions, QAnswer must be A, B, or C.', 1;
 

    -- Validate True/False answers
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE QType = 'TF'
          AND QAnswer NOT IN ('T','F')
    )
    THROW 50002, 'For True/False questions, QAnswer must be T or F.', 1;
END;

GO