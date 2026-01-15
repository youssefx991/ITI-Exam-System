use ITI_ExamSystem
-- 2. Report: All Questions + Choices for a given Exam
-- (freeform style - shows question text, type, degree, correct answer + all choices)
CREATE PROCEDURE sp_Exam_GetQuestionsAndChoices
    @ExId INT
AS
BEGIN
    SELECT 
        eq.QOrder,
        q.QId,
        q.QText,
        q.QType,
        q.QDegree,
        q.QAnswer AS CorrectAnswer,
        
        -- Choices (will repeat for each choice of the question)
        ch.ChoiceLabel,
        ch.ChoiceText
    FROM Exam_Question eq
    INNER JOIN Question q ON eq.QId = q.QId
    LEFT JOIN Choice ch ON q.QId = ch.QId   -- LEFT because TF questions have no choices
    WHERE eq.ExId = @ExId
    ORDER BY eq.QOrder, ch.ChoiceLabel;
END
GO


-- 2. Get all questions + choices of exam number 3
EXEC sp_Exam_GetQuestionsAndChoices @ExId = 3;
