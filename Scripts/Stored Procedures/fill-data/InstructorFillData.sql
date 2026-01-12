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

EXEC sp_Instructor_Insert 11, 'Dr. Khaled Abdelrahman', 'khaled.abdelrahman@iti.gov.eg', 11; -- Network Infrastructure

EXEC sp_Instructor_Insert 12, 'Eng. Aya Mostafa',      'aya.mostafa@iti.gov.eg',        12; -- Embedded Systems Development

EXEC sp_Instructor_Insert 13, 'Dr. Mahmoud Saeed',     'mahmoud.saeed@iti.gov.eg',      13; -- IoT Systems

EXEC sp_Instructor_Insert 14, 'Dr. Mostafa Adel',      'mostafa.adel@iti.gov.eg',      1;
EXEC sp_Instructor_Insert 15, 'Eng. Salma Fathy',      'salma.fathy@iti.gov.eg',       1;

EXEC sp_Instructor_Insert 16, 'Dr. Karim Hassan',      'karim.hassan@iti.gov.eg',      2;
EXEC sp_Instructor_Insert 17, 'Eng. Nada Sherif',      'nada.sherif@iti.gov.eg',       2;

EXEC sp_Instructor_Insert 18, 'Dr. Amr Mahmoud',       'amr.mahmoud@iti.gov.eg',       3;
EXEC sp_Instructor_Insert 19, 'Eng. Dina Youssef',     'dina.youssef@iti.gov.eg',      3;

EXEC sp_Instructor_Insert 20, 'Prof. Ahmed Samir',     'ahmed.samir@iti.gov.eg',       4;
EXEC sp_Instructor_Insert 21, 'Eng. Reem Khaled',      'reem.khaled@iti.gov.eg',       4;

EXEC sp_Instructor_Insert 22, 'Dr. Hossam Ibrahim',    'hossam.ibrahim@iti.gov.eg',    5;
EXEC sp_Instructor_Insert 23, 'Eng. Rana Ali',         'rana.ali@iti.gov.eg',          5;

EXEC sp_Instructor_Insert 24, 'Dr. Mohamed Zaki',      'mohamed.zaki@iti.gov.eg',      6;
EXEC sp_Instructor_Insert 25, 'Eng. Yasmin Nabil',     'yasmin.nabil@iti.gov.eg',      6;

EXEC sp_Instructor_Insert 26, 'Prof. Tarek Fouad',     'tarek.fouad@iti.gov.eg',       7;
EXEC sp_Instructor_Insert 27, 'Eng. Heba Mostafa',     'heba.mostafa@iti.gov.eg',      7;

EXEC sp_Instructor_Insert 28, 'Dr. Samer Lotfy',       'samer.lotfy@iti.gov.eg',       8;
EXEC sp_Instructor_Insert 29, 'Eng. Farah Ayman',      'farah.ayman@iti.gov.eg',       8;

EXEC sp_Instructor_Insert 30, 'Prof. Wael Hamdy',      'wael.hamdy@iti.gov.eg',        9;
EXEC sp_Instructor_Insert 31, 'Eng. Nourhan Said',     'nourhan.said@iti.gov.eg',      9;

EXEC sp_Instructor_Insert 32, 'Dr. Islam Refaat',      'islam.refaat@iti.gov.eg',      10;
EXEC sp_Instructor_Insert 33, 'Eng. Mai Abdelaziz',    'mai.abdelaziz@iti.gov.eg',     11;

EXEC sp_Instructor_Select;
