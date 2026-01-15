use ITI_ExamSystem
-- 3. Report: Student's answers for a specific exam
CREATE PROCEDURE sp_StudentExam_GetAnswers
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

        ch.ChoiceLabel,
        ch.ChoiceText   -- optional: show choices too
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


-- 3. Get student 7 answers in exam 3 (with calculated score per question)
EXEC sp_StudentExam_GetAnswers @StId = 7, @ExId = 3;