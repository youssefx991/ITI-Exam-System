-- choice Label --> A, B , C
-- Choice Text --> NotEmpty
-- ---------------------------------------------
USE ITI_ExamSystem
GO
-------------------------------------------------
ALTER TABLE Choice
ADD CONSTRAINT CK_Choice_Label
CHECK (ChoiceLabel IN ('A','B','C'));
---------------------------------------------------
ALTER TABLE Choice
ADD CONSTRAINT CK_Choice_Text_NotEmpty
CHECK (LEN(LTRIM(RTRIM(ChoiceText))) > 0);
------------------------------------------------------
ALTER TABLE Choice
ADD CONSTRAINT UQ_Choice_QId_ChoiceText
UNIQUE (QId, ChoiceText);