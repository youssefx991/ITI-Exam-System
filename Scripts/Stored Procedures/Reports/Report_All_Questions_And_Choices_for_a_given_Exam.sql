use ITI_ExamSystem
go

CREATE or alter PROCEDURE sp_Exam_GetQuestionsAndChoices
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
        
        CASE 
            WHEN q.QType = 'TF' AND q.QAnswer = 'T' THEN 'A'
            WHEN q.QType = 'TF' AND q.QAnswer = 'F' THEN 'B'
            ELSE ch.ChoiceLabel
        END AS ChoiceLabel,

        CASE 
            WHEN q.QType = 'TF' AND q.QAnswer = 'T' THEN 'True'
            WHEN q.QType = 'TF' AND q.QAnswer = 'F' THEN 'False'
            ELSE ch.ChoiceText
        END AS ChoiceText
        
    FROM Exam_Question eq
    INNER JOIN Question q ON eq.QId = q.QId
    LEFT JOIN Choice ch ON q.QId = ch.QId  
    WHERE eq.ExId = @ExId
    ORDER BY eq.QOrder, ch.ChoiceLabel;
END
GO



EXEC sp_Exam_GetQuestionsAndChoices @ExId = 3;
