USE ITI_ExamSystem;
GO


------------------------------------------------
-- Each instructor teaches 2 courses
------------------------------------------------

EXEC sp_Instructor_Course_Insert 1, 1;
EXEC sp_Instructor_Course_Insert 1, 2;

EXEC sp_Instructor_Course_Insert 2, 3;
EXEC sp_Instructor_Course_Insert 2, 4;

EXEC sp_Instructor_Course_Insert 3, 5;
EXEC sp_Instructor_Course_Insert 3, 6;

EXEC sp_Instructor_Course_Insert 4, 7;
EXEC sp_Instructor_Course_Insert 4, 8;

EXEC sp_Instructor_Course_Insert 5, 9;
EXEC sp_Instructor_Course_Insert 5, 10;

EXEC sp_Instructor_Course_Insert 6, 11;
EXEC sp_Instructor_Course_Insert 6, 12;

EXEC sp_Instructor_Course_Insert 7, 13;
EXEC sp_Instructor_Course_Insert 7, 14;

EXEC sp_Instructor_Course_Insert 8, 15;
EXEC sp_Instructor_Course_Insert 8, 16;

EXEC sp_Instructor_Course_Insert 9, 17;
EXEC sp_Instructor_Course_Insert 9, 18;

EXEC sp_Instructor_Course_Insert 10, 19;
EXEC sp_Instructor_Course_Insert 10, 20;





