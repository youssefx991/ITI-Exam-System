use ITI_ExamSystem
go

CREATE or alter PROCEDURE sp_StudentExam_GetAnswers
    @StId INT,
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
        
        sa.Answer AS StudentAnswer,
        
        CASE 
            WHEN q.QType = 'TF' THEN 
                CASE WHEN sa.Answer = q.QAnswer THEN 1 ELSE 0 END
            WHEN q.QType = 'MCQ' THEN 
                CASE WHEN sa.Answer = q.QAnswer THEN q.QDegree ELSE 0 END
            ELSE 0
        END AS EarnedDegree,

        CASE
            WHEN q.QType = 'TF' THEN
                CASE sa.Answer
                    WHEN 'T' THEN 'A'
                    WHEN 'F' THEN 'B'
                END
            ELSE ch.ChoiceLabel
        END AS ChoiceLabel,

        CASE
            WHEN q.QType = 'TF' THEN
                CASE sa.Answer
                    WHEN 'T' THEN 'True'
                    WHEN 'F' THEN 'False'
                END
            ELSE ch.ChoiceText
        END AS ChoiceText

    FROM Exam_Question eq
    INNER JOIN Question q ON eq.QId = q.QId
    LEFT JOIN StudentAnswer sa ON sa.ExId = eq.ExId 
                              AND sa.QId = eq.QId 
                              AND sa.StId = @StId
    LEFT JOIN Choice ch ON q.QId = ch.QId
    WHERE eq.ExId = @ExId
    ORDER BY eq.QOrder, ch.ChoiceLabel;
END
GO



EXEC sp_StudentExam_GetAnswers @StId = 7, @ExId = 3;