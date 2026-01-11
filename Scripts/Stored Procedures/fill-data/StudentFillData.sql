USE ITI_ExamSystem;

-- ============================
-- Students Seed Data (50 rows)
-- ============================

-- Software Engineering (Tracks 1,2,3)
EXEC sp_Student_Insert 1,  'Ahmed Mohamed',    'ahmed.mohamed@iti.gov.eg',   1;
EXEC sp_Student_Insert 2,  'Sara Khaled',      'sara.khaled@iti.gov.eg',     1;
EXEC sp_Student_Insert 3,  'Mohamed Ali',      'mohamed.ali@iti.gov.eg',     2;
EXEC sp_Student_Insert 4,  'Fatma Hassan',     'fatma.hassan@iti.gov.eg',    2;
EXEC sp_Student_Insert 5,  'Omar Youssef',     'omar.youssef@iti.gov.eg',    3;
EXEC sp_Student_Insert 6,  'Nourhan Ibrahim',  'nourhan.ibrahim@iti.gov.eg', 3;

-- Information Systems (Tracks 4,5)
EXEC sp_Student_Insert 7,  'Youssef Amr',      'youssef.amr@iti.gov.eg',     4;
EXEC sp_Student_Insert 8,  'Mariam Tarek',     'mariam.tarek@iti.gov.eg',    4;
EXEC sp_Student_Insert 9,  'Kareem Adel',      'kareem.adel@iti.gov.eg',     5;
EXEC sp_Student_Insert 10, 'Laila Mostafa',    'laila.mostafa@iti.gov.eg',   5;

-- Computer Science (Tracks 6,7)
EXEC sp_Student_Insert 11, 'Hassan Reda',      'hassan.reda@iti.gov.eg',     6;
EXEC sp_Student_Insert 12, 'Rana Sherif',      'rana.sherif@iti.gov.eg',     6;
EXEC sp_Student_Insert 13, 'Ziad Farouk',      'ziad.farouk@iti.gov.eg',     7;
EXEC sp_Student_Insert 14, 'Dina Samir',       'dina.samir@iti.gov.eg',      7;

-- Artificial Intelligence (Tracks 8,9)
EXEC sp_Student_Insert 15, 'Mahmoud Gamal',    'mahmoud.gamal@iti.gov.eg',   8;
EXEC sp_Student_Insert 16, 'Asmaa Nader',      'asmaa.nader@iti.gov.eg',     8;
EXEC sp_Student_Insert 17, 'Tamer Hosny',      'tamer.hosny@iti.gov.eg',     9;
EXEC sp_Student_Insert 18, 'Reem Bassem',      'reem.bassem@iti.gov.eg',     9;

-- Networks & Cybersecurity (Tracks 10,11)
EXEC sp_Student_Insert 19, 'Karim Wael',       'karim.wael@iti.gov.eg',      10;
EXEC sp_Student_Insert 20, 'Salma Hatem',      'salma.hatem@iti.gov.eg',     10;
EXEC sp_Student_Insert 21, 'Amr Shokry',       'amr.shokry@iti.gov.eg',      11;
EXEC sp_Student_Insert 22, 'Nadine Fathy',     'nadine.fathy@iti.gov.eg',    11;

-- Embedded Systems (Tracks 12,13)
EXEC sp_Student_Insert 23, 'Omar Khaled',      'omar.khaled@iti.gov.eg',     12;
EXEC sp_Student_Insert 24, 'Hagar Mahmoud',    'hagar.mahmoud@iti.gov.eg',   12;
EXEC sp_Student_Insert 25, 'Yara Ahmed',       'yara.ahmed@iti.gov.eg',      13;
EXEC sp_Student_Insert 26, 'Mostafa Saber',    'mostafa.saber@iti.gov.eg',   13;

-- Additional students (distributed correctly)
EXEC sp_Student_Insert 27, 'Rania Essam',      'rania.essam@iti.gov.eg',     1;
EXEC sp_Student_Insert 28, 'Ibrahim Nagy',     'ibrahim.nagy@iti.gov.eg',    2;
EXEC sp_Student_Insert 29, 'Menna Allah',      'menna.allah@iti.gov.eg',     3;
EXEC sp_Student_Insert 30, 'Sherif Osama',     'sherif.osama@iti.gov.eg',    4;
EXEC sp_Student_Insert 31, 'Aya Tamer',        'aya.tamer@iti.gov.eg',       5;
EXEC sp_Student_Insert 32, 'Hussein Ramadan',  'hussein.ramadan@iti.gov.eg', 6;
EXEC sp_Student_Insert 33, 'Lamiaa Galal',     'lamiaa.galal@iti.gov.eg',    7;
EXEC sp_Student_Insert 34, 'Fady Emad',        'fady.emad@iti.gov.eg',       8;
EXEC sp_Student_Insert 35, 'Nour Eldin',       'nour.eldin@iti.gov.eg',      9;
EXEC sp_Student_Insert 36, 'Radwa Sameh',      'radwa.sameh@iti.gov.eg',     10;
EXEC sp_Student_Insert 37, 'Mina Adel',        'mina.adel@iti.gov.eg',       11;
EXEC sp_Student_Insert 38, 'Samar Wael',       'samar.wael@iti.gov.eg',      12;
EXEC sp_Student_Insert 39, 'Basma Hany',       'basma.hany@iti.gov.eg',      13;
EXEC sp_Student_Insert 40, 'Hatem Zaki',       'hatem.zaki@iti.gov.eg',      1;
EXEC sp_Student_Insert 41, 'Doaa Magdy',       'doaa.magdy@iti.gov.eg',      2;
EXEC sp_Student_Insert 42, 'Yassin Mohsen',    'yassin.mohsen@iti.gov.eg',   3;
EXEC sp_Student_Insert 43, 'Hala Farid',       'hala.farid@iti.gov.eg',      4;
EXEC sp_Student_Insert 44, 'Taha Abdelrahman', 'taha.abdelrahman@iti.gov.eg',5;
EXEC sp_Student_Insert 45, 'Rasha Nabil',      'rasha.nabil@iti.gov.eg',     6;
EXEC sp_Student_Insert 46, 'Amir Hossam',      'amir.hossam@iti.gov.eg',     7;
EXEC sp_Student_Insert 47, 'Shaimaa Anwar',    'shaimaa.anwar@iti.gov.eg',   8;
EXEC sp_Student_Insert 48, 'Mazen Refaat',     'mazen.refaat@iti.gov.eg',    9;
EXEC sp_Student_Insert 49, 'Lara Ehab',        'lara.ehab@iti.gov.eg',       10;
EXEC sp_Student_Insert 50, 'Khaled Mamdouh',   'khaled.mamdouh@iti.gov.eg',  11;

EXEC sp_Student_Select;
