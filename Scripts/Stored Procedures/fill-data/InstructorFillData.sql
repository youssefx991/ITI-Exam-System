use ITI_ExamSystem

-- 10 random instructors across different tracks

-- TrackID 11 → 10
EXEC sp_Instructor_Insert 'Dr. Ahmed El-Sayed',     'ahmed.elsayed@iti.gov.eg',      10;
EXEC sp_Instructor_Insert 'Eng. Mariam Hassan',    'mariam.hassan@iti.gov.eg',      10;

-- TrackID 12 → 16
EXEC sp_Instructor_Insert 'Prof. Khaled Mansour',  'khaled.mansour@iti.gov.eg',     16;

-- TrackID 13 → 4
EXEC sp_Instructor_Insert 'Eng. Nour El-Din',      'nour.eldin@iti.gov.eg',         4;

-- TrackID 14 → 7
EXEC sp_Instructor_Insert 'Dr. Rania Abdelrahman', 'rania.abdelrahman@iti.gov.eg',  7;

-- TrackID 15 → 8
EXEC sp_Instructor_Insert 'Eng. Tamer Ibrahim',    'tamer.ibrahim@iti.gov.eg',      8;

-- TrackID 17 → 12
EXEC sp_Instructor_Insert 'Dr. Hala Mostafa',      'hala.mostafa@iti.gov.eg',       12;

-- TrackID 18 → 13
EXEC sp_Instructor_Insert 'Prof. Omar Farouk',     'omar.farouk@iti.gov.eg',        13;

-- TrackID 20 → 6
EXEC sp_Instructor_Insert 'Eng. Sara Mahmoud',    'sara.mahmoud@iti.gov.eg',       6;

-- TrackID 22 → 15
EXEC sp_Instructor_Insert 'Dr. Youssef Nagy',     'youssef.nagy@iti.gov.eg',       15;


EXEC sp_Instructor_Select