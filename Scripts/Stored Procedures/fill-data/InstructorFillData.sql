USE ITI_ExamSystem;

-- ============================
-- Instructors Seed Data
-- ============================

EXEC sp_Instructor_Insert 1, 'Dr. Ahmed El-Sayed',     'ahmed.elsayed@iti.gov.eg',     10;
EXEC sp_Instructor_Insert 2, 'Eng. Mariam Hassan',    'mariam.hassan@iti.gov.eg',     10;

EXEC sp_Instructor_Insert 3, 'Prof. Khaled Mansour',  'khaled.mansour@iti.gov.eg',    12;

EXEC sp_Instructor_Insert 4, 'Eng. Nour El-Din',      'nour.eldin@iti.gov.eg',        4;

EXEC sp_Instructor_Insert 5, 'Dr. Rania Abdelrahman', 'rania.abdelrahman@iti.gov.eg', 7;

EXEC sp_Instructor_Insert 6, 'Eng. Tamer Ibrahim',    'tamer.ibrahim@iti.gov.eg',     8;

EXEC sp_Instructor_Insert 7, 'Dr. Hala Mostafa',      'hala.mostafa@iti.gov.eg',      12;

EXEC sp_Instructor_Insert 8, 'Prof. Omar Farouk',     'omar.farouk@iti.gov.eg',       13;

EXEC sp_Instructor_Insert 9, 'Eng. Sara Mahmoud',     'sara.mahmoud@iti.gov.eg',      6;

EXEC sp_Instructor_Insert 10,'Dr. Youssef Nagy',      'youssef.nagy@iti.gov.eg',      5;

EXEC sp_Instructor_Select;
