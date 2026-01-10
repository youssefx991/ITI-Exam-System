USE ITI_ExamSystem;

-- ============================
-- Tracks Seed Data
-- ============================

-- Software Engineering (DeptID = 1)
EXEC SP_Track_Insert 1, 'Professional Web Development', 1;
EXEC SP_Track_Insert 2, 'Full Stack Development', 1;
EXEC SP_Track_Insert 3, 'Software Testing', 1;

-- Information Systems (DeptID = 2)
EXEC SP_Track_Insert 4, 'Business Intelligence', 2;
EXEC SP_Track_Insert 5, 'ERP and Enterprise Applications', 2;

-- Computer Science (DeptID = 3)
EXEC SP_Track_Insert 6, 'Open Source Development', 3;
EXEC SP_Track_Insert 7, 'Data Science', 3;

-- Artificial Intelligence (DeptID = 4)
EXEC SP_Track_Insert 8, 'Machine Learning', 4;
EXEC SP_Track_Insert 9, 'Artificial Intelligence Engineering', 4;

-- Networks and Cybersecurity (DeptID = 5)
EXEC SP_Track_Insert 10, 'Cybersecurity', 5;
EXEC SP_Track_Insert 11, 'Network Infrastructure', 5;

-- Embedded Systems (DeptID = 6)
EXEC SP_Track_Insert 12, 'Embedded Systems Development', 6;
EXEC SP_Track_Insert 13, 'IoT Systems', 6;
