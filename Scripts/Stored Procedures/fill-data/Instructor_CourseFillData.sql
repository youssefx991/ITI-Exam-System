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

EXEC sp_Instructor_Course_Insert 11, 21;
EXEC sp_Instructor_Course_Insert 11, 22;

EXEC sp_Instructor_Course_Insert 12, 23;
EXEC sp_Instructor_Course_Insert 12, 24;

EXEC sp_Instructor_Course_Insert 13, 25;
EXEC sp_Instructor_Course_Insert 13, 26;

EXEC sp_Instructor_Course_Insert 14, 27;
EXEC sp_Instructor_Course_Insert 14, 28;

EXEC sp_Instructor_Course_Insert 15, 29;
EXEC sp_Instructor_Course_Insert 15, 30;

EXEC sp_Instructor_Course_Insert 16, 31;
EXEC sp_Instructor_Course_Insert 16, 32;

EXEC sp_Instructor_Course_Insert 17, 33;
EXEC sp_Instructor_Course_Insert 17, 34;

EXEC sp_Instructor_Course_Insert 18, 35;
EXEC sp_Instructor_Course_Insert 18, 36;

EXEC sp_Instructor_Course_Insert 19, 37;
EXEC sp_Instructor_Course_Insert 19, 38;

EXEC sp_Instructor_Course_Insert 20, 39;
EXEC sp_Instructor_Course_Insert 20, 40;

EXEC sp_Instructor_Course_Insert 21, 41;
EXEC sp_Instructor_Course_Insert 21, 42;

EXEC sp_Instructor_Course_Insert 22, 43;
EXEC sp_Instructor_Course_Insert 22, 44;

EXEC sp_Instructor_Course_Insert 23, 45;
EXEC sp_Instructor_Course_Insert 23, 46;

EXEC sp_Instructor_Course_Insert 24, 47;
EXEC sp_Instructor_Course_Insert 24, 48;

EXEC sp_Instructor_Course_Insert 25, 49;
EXEC sp_Instructor_Course_Insert 25, 50;

EXEC sp_Instructor_Course_Insert 26, 51;
EXEC sp_Instructor_Course_Insert 26, 52;

EXEC sp_Instructor_Course_Insert 27, 53;
EXEC sp_Instructor_Course_Insert 27, 54;

EXEC sp_Instructor_Course_Insert 28, 55;
EXEC sp_Instructor_Course_Insert 28, 56;

EXEC sp_Instructor_Course_Insert 29, 57;
EXEC sp_Instructor_Course_Insert 29, 58;

EXEC sp_Instructor_Course_Insert 30, 59;
EXEC sp_Instructor_Course_Insert 30, 60;

EXEC sp_Instructor_Course_Insert 31, 61;
EXEC sp_Instructor_Course_Insert 31, 62;

EXEC sp_Instructor_Course_Insert 32, 63;
EXEC sp_Instructor_Course_Insert 32, 64;

EXEC sp_Instructor_Course_Insert 33, 65;

------------------------------------------------
-- Verify
------------------------------------------------
EXEC sp_Instructor_Course_SelectAll;
GO

