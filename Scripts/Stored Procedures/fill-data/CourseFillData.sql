USE ITI_ExamSystem;

-- ============================
-- Courses Seed Data
-- PKs start from 1
-- ============================

-- Track 1: Professional Web Development
EXEC sp_Course_Insert 1, 'HTML5 & CSS3 Fundamentals', 100, 1;
EXEC sp_Course_Insert 2, 'Advanced JavaScript & ES6+', 120, 1;
EXEC sp_Course_Insert 3, 'React.js & Modern Frontend', 130, 1;
EXEC sp_Course_Insert 4, 'Responsive Web Design & UI/UX', 100, 1;
EXEC sp_Course_Insert 5, 'Frontend Performance Optimization', 110, 1;

-- Track 2: Full Stack Development
EXEC sp_Course_Insert 6, 'Node.js & Express Backend', 120, 2;
EXEC sp_Course_Insert 7, 'RESTful APIs & GraphQL', 120, 2;
EXEC sp_Course_Insert 8, 'Database Design & MongoDB', 110, 2;
EXEC sp_Course_Insert 9, 'DevOps Basics for Full-Stack', 100, 2;
EXEC sp_Course_Insert 10,'Next.js & TypeScript', 140, 2;

-- Track 3: Software Testing
EXEC sp_Course_Insert 11,'Manual Testing & Test Cases', 100, 3;
EXEC sp_Course_Insert 12,'Automation Testing - Selenium', 130, 3;
EXEC sp_Course_Insert 13,'API Testing with Postman', 110, 3;
EXEC sp_Course_Insert 14,'Mobile App Testing (Android/iOS)', 120, 3;
EXEC sp_Course_Insert 15,'Performance & Load Testing', 120, 3;

-- Track 4: Business Intelligence
EXEC sp_Course_Insert 16,'Power BI - Data Visualization', 120, 4;
EXEC sp_Course_Insert 17,'SQL for Business Analysts', 110, 4;
EXEC sp_Course_Insert 18,'Data Modeling & DAX', 130, 4;
EXEC sp_Course_Insert 19,'Tableau Desktop & Prep', 120, 4;
EXEC sp_Course_Insert 20,'Business Intelligence Fundamentals', 100, 4;

-- Track 5: ERP and Enterprise Applications
EXEC sp_Course_Insert 21,'SAP ERP Overview & Navigation', 130, 5;
EXEC sp_Course_Insert 22,'Oracle ERP Cloud Fundamentals', 120, 5;
EXEC sp_Course_Insert 23,'Microsoft Dynamics 365', 130, 5;
EXEC sp_Course_Insert 24,'ERP Implementation Methodologies', 110, 5;
EXEC sp_Course_Insert 25,'Business Process Management', 100, 5;

-- Track 6: Open Source Development
EXEC sp_Course_Insert 26,'Linux & Open Source Tools', 100, 6;
EXEC sp_Course_Insert 27,'Git & GitHub Advanced', 110, 6;
EXEC sp_Course_Insert 28,'Contributing to Open Source', 100, 6;
EXEC sp_Course_Insert 29,'Python for Open Source Projects', 120, 6;
EXEC sp_Course_Insert 30,'Docker & Kubernetes Basics', 130, 6;

-- Track 7: Data Science
EXEC sp_Course_Insert 31,'Python for Data Science', 130, 7;
EXEC sp_Course_Insert 32,'Statistics & Probability', 120, 7;
EXEC sp_Course_Insert 33,'Data Cleaning & EDA', 110, 7;
EXEC sp_Course_Insert 34,'Machine Learning Fundamentals', 140, 7;
EXEC sp_Course_Insert 35,'Big Data with PySpark', 130, 7;

-- Track 8: Machine Learning
EXEC sp_Course_Insert 36,'Supervised Learning Algorithms', 140, 8;
EXEC sp_Course_Insert 37,'Deep Learning with TensorFlow', 150, 8;
EXEC sp_Course_Insert 38,'Model Deployment & MLOps', 120, 8;
EXEC sp_Course_Insert 39,'Computer Vision Basics', 130, 8;
EXEC sp_Course_Insert 40,'Natural Language Processing', 140, 8;

-- Track 9: AI Engineering
EXEC sp_Course_Insert 41,'AI Fundamentals & Ethics', 120, 9;
EXEC sp_Course_Insert 42,'Neural Networks & Deep Learning', 150, 9;
EXEC sp_Course_Insert 43,'Reinforcement Learning', 140, 9;
EXEC sp_Course_Insert 44,'Generative AI & LLMs', 130, 9;
EXEC sp_Course_Insert 45,'AI in Real-World Applications', 120, 9;

-- Track 10: Cybersecurity
EXEC sp_Course_Insert 46,'Cybersecurity Fundamentals', 120, 10;
EXEC sp_Course_Insert 47,'Ethical Hacking & Penetration Testing', 140, 10;
EXEC sp_Course_Insert 48,'Network Security & Firewalls', 130, 10;
EXEC sp_Course_Insert 49,'Cryptography & Secure Coding', 120, 10;
EXEC sp_Course_Insert 50,'Incident Response & Forensics', 130, 10;

-- Track 11: Network Infrastructure
EXEC sp_Course_Insert 51,'CCNA - Networking Fundamentals', 130, 11;
EXEC sp_Course_Insert 52,'Routing & Switching', 140, 11;
EXEC sp_Course_Insert 53,'Network Security & VPNs', 120, 11;
EXEC sp_Course_Insert 54,'Wireless Networking', 110, 11;
EXEC sp_Course_Insert 55,'Cloud Networking (AWS/Azure)', 130, 11;

-- Track 12: Embedded Systems
EXEC sp_Course_Insert 56,'Embedded C Programming', 120, 12;
EXEC sp_Course_Insert 57,'Microcontrollers (STM32/Arduino)', 130, 12;
EXEC sp_Course_Insert 58,'RTOS Concepts & FreeRTOS', 140, 12;
EXEC sp_Course_Insert 59,'Interfacing Sensors & Actuators', 120, 12;
EXEC sp_Course_Insert 60,'Embedded Linux Basics', 130, 12;

-- Track 13: IoT Systems
EXEC sp_Course_Insert 61,'IoT Fundamentals & Protocols', 120, 13;
EXEC sp_Course_Insert 62,'ESP32 & Arduino IoT Projects', 130, 13;
EXEC sp_Course_Insert 63,'MQTT & CoAP Protocols', 110, 13;
EXEC sp_Course_Insert 64,'IoT Security & Authentication', 120, 13;
EXEC sp_Course_Insert 65,'IoT Cloud Platforms (AWS IoT)', 130, 13;

EXEC sp_Course_Select;
