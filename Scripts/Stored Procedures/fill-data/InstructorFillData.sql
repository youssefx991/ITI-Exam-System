use ITI_ExamSystem

-- 10 random instructors across different tracks

EXEC sp_Instructor_Insert 'Dr. Ahmed El-Sayed',     'ahmed.elsayed@iti.gov.eg',      11;
EXEC sp_Instructor_Insert 'Eng. Mariam Hassan',      'mariam.hassan@iti.gov.eg',      11;
EXEC sp_Instructor_Insert 'Prof. Khaled Mansour',    'khaled.mansour@iti.gov.eg',     12;
EXEC sp_Instructor_Insert 'Eng. Nour El-Din',        'nour.eldin@iti.gov.eg',         13;
EXEC sp_Instructor_Insert 'Dr. Rania Abdelrahman',   'rania.abdelrahman@iti.gov.eg',  14;
EXEC sp_Instructor_Insert 'Eng. Tamer Ibrahim',      'tamer.ibrahim@iti.gov.eg',      15;
EXEC sp_Instructor_Insert 'Dr. Hala Mostafa',        'hala.mostafa@iti.gov.eg',       17;
EXEC sp_Instructor_Insert 'Prof. Omar Farouk',       'omar.farouk@iti.gov.eg',        18;
EXEC sp_Instructor_Insert 'Eng. Sara Mahmoud',       'sara.mahmoud@iti.gov.eg',       20;
EXEC sp_Instructor_Insert 'Dr. Youssef Nagy',        'youssef.nagy@iti.gov.eg',       22;

EXEC sp_Instructor_Select