-- Using the actual sp_Student_Insert procedure (50 students)

use ITI_ExamSystem




EXEC sp_Student_Insert 'Ahmed Mohamed',     'ahmed.mohamed@iti.gov.eg',      10;
EXEC sp_Student_Insert 'Sara Khaled',       'sara.khaled@iti.gov.eg',        10;
EXEC sp_Student_Insert 'Mohamed Ali',       'mohamed.ali@iti.gov.eg',        10;

-- TrackID 12 → 16
EXEC sp_Student_Insert 'Fatma Hassan',      'fatma.hassan@iti.gov.eg',       16;
EXEC sp_Student_Insert 'Omar Youssef',      'omar.youssef@iti.gov.eg',       16;
EXEC sp_Student_Insert 'Nourhan Ibrahim',   'nourhan.ibrahim@iti.gov.eg',    16;

-- TrackID 13 → 4
EXEC sp_Student_Insert 'Youssef Amr',       'youssef.amr@iti.gov.eg',        4;
EXEC sp_Student_Insert 'Mariam Tarek',      'mariam.tarek@iti.gov.eg',       4;
EXEC sp_Student_Insert 'Kareem Adel',       'kareem.adel@iti.gov.eg',        4;

-- TrackID 11 → 10
EXEC sp_Student_Insert 'Laila Mostafa',     'laila.mostafa@iti.gov.eg',      10;
EXEC sp_Student_Insert 'Hassan Reda',       'hassan.reda@iti.gov.eg',        10;

-- TrackID 14 → 7
EXEC sp_Student_Insert 'Rana Sherif',       'rana.sherif@iti.gov.eg',        7;
EXEC sp_Student_Insert 'Ziad Farouk',       'ziad.farouk@iti.gov.eg',        7;
EXEC sp_Student_Insert 'Dina Samir',        'dina.samir@iti.gov.eg',         7;

-- TrackID 15 → 8
EXEC sp_Student_Insert 'Mahmoud Gamal',     'mahmoud.gamal@iti.gov.eg',      8;
EXEC sp_Student_Insert 'Asmaa Nader',       'asmaa.nader@iti.gov.eg',        8;
EXEC sp_Student_Insert 'Tamer Hosny',       'tamer.hosny@iti.gov.eg',        8;

-- TrackID 16 → 9
EXEC sp_Student_Insert 'Reem Bassem',       'reem.bassem@iti.gov.eg',        9;
EXEC sp_Student_Insert 'Karim Wael',        'karim.wael@iti.gov.eg',         9;
EXEC sp_Student_Insert 'Salma Hatem',       'salma.hatem@iti.gov.eg',        9;

-- TrackID 17 → 12
EXEC sp_Student_Insert 'Amr Shokry',        'amr.shokry@iti.gov.eg',         12;
EXEC sp_Student_Insert 'Nadine Fathy',      'nadine.fathy@iti.gov.eg',       12;
EXEC sp_Student_Insert 'Omar Khaled',       'omar.khaled2@iti.gov.eg',       12;

-- TrackID 18 → 13
EXEC sp_Student_Insert 'Hagar Mahmoud',     'hagar.mahmoud@iti.gov.eg',      13;
EXEC sp_Student_Insert 'Yara Ahmed',        'yara.ahmed@iti.gov.eg',         13;
EXEC sp_Student_Insert 'Mostafa Saber',     'mostafa.saber@iti.gov.eg',      13;

-- TrackID 19 → 5
EXEC sp_Student_Insert 'Rania Essam',       'rania.essam@iti.gov.eg',        5;
EXEC sp_Student_Insert 'Ibrahim Nagy',      'ibrahim.nagy@iti.gov.eg',       5;
EXEC sp_Student_Insert 'Menna Allah',       'menna.allah@iti.gov.eg',        5;

-- TrackID 20 → 6
EXEC sp_Student_Insert 'Sherif Osama',      'sherif.osama@iti.gov.eg',       6;
EXEC sp_Student_Insert 'Aya Tamer',         'aya.tamer@iti.gov.eg',          6;
EXEC sp_Student_Insert 'Hussein Ramadan',   'hussein.ramadan@iti.gov.eg',    6;

-- TrackID 21 → 11
EXEC sp_Student_Insert 'Lamiaa Galal',      'lamiaa.galal@iti.gov.eg',       11;
EXEC sp_Student_Insert 'Fady Emad',         'fady.emad@iti.gov.eg',          11;
EXEC sp_Student_Insert 'Nour Eldin',        'nour.eldin@iti.gov.eg',         11;

-- TrackID 22 → 15
EXEC sp_Student_Insert 'Radwa Sameh',       'radwa.sameh@iti.gov.eg',        15;
EXEC sp_Student_Insert 'Mina Adel',         'mina.adel@iti.gov.eg',          15;
EXEC sp_Student_Insert 'Samar Wael',        'samar.wael@iti.gov.eg',         15;

-- TrackID 23 → 14
EXEC sp_Student_Insert 'Basma Hany',        'basma.hany@iti.gov.eg',         14;
EXEC sp_Student_Insert 'Hatem Zaki',        'hatem.zaki@iti.gov.eg',         14;
EXEC sp_Student_Insert 'Doaa Magdy',        'doaa.magdy@iti.gov.eg',         14;

-- TrackID 11 → 10
EXEC sp_Student_Insert 'Yassin Mohsen',     'yassin.mohsen@iti.gov.eg',      10;

-- TrackID 12 → 16
EXEC sp_Student_Insert 'Hala Farid',        'hala.farid@iti.gov.eg',         16;

-- TrackID 13 → 4
EXEC sp_Student_Insert 'Taha Abdelrahman',  'taha.abdelrahman@iti.gov.eg',   4;

-- TrackID 14 → 7
EXEC sp_Student_Insert 'Rasha Nabil',       'rasha.nabil@iti.gov.eg',        7;

-- TrackID 15 → 8
EXEC sp_Student_Insert 'Amir Hossam',       'amir.hossam@iti.gov.eg',        8;

-- TrackID 16 → 9
EXEC sp_Student_Insert 'Shaimaa Anwar',     'shaimaa.anwar@iti.gov.eg',      9;

-- TrackID 17 → 12
EXEC sp_Student_Insert 'Mazen Refaat',      'mazen.refaat@iti.gov.eg',       12;

-- TrackID 18 → 13
EXEC sp_Student_Insert 'Lara Ehab',         'lara.ehab@iti.gov.eg',          13;

-- TrackID 19 → 5
EXEC sp_Student_Insert 'Khaled Mamdouh',    'khaled.mamdouh@iti.gov.eg',     5;


EXEC sp_Student_Select