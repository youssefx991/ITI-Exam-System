use ITI_ExamSystem

--generate 5 random courses for each track 

USE ITI_ExamSystem;

-- Track 11 ? 10
EXEC sp_Course_Insert 'HTML5 & CSS3 Fundamentals', 100, 10;
EXEC sp_Course_Insert 'Advanced JavaScript & ES6+', 120, 10;
EXEC sp_Course_Insert 'React.js & Modern Frontend', 130, 10;
EXEC sp_Course_Insert 'Node.js & Express Backend', 120, 10;
EXEC sp_Course_Insert 'Responsive Web Design & UI/UX', 100, 10;

-- Track 12 ? 16
EXEC sp_Course_Insert 'Full-Stack JavaScript (MERN)', 150, 16;
EXEC sp_Course_Insert 'Next.js & TypeScript', 140, 16;
EXEC sp_Course_Insert 'RESTful APIs & GraphQL', 120, 16;
EXEC sp_Course_Insert 'Database Design & MongoDB', 110, 16;
EXEC sp_Course_Insert 'DevOps Basics for Full-Stack', 100, 16;

-- Track 13 ? 4
EXEC sp_Course_Insert 'Manual Testing & Test Cases', 100, 4;
EXEC sp_Course_Insert 'Automation Testing - Selenium', 130, 4;
EXEC sp_Course_Insert 'API Testing with Postman', 110, 4;
EXEC sp_Course_Insert 'Mobile App Testing (Android/iOS)', 120, 4;
EXEC sp_Course_Insert 'Performance & Load Testing', 120, 4;

-- Track 14 ? 7
EXEC sp_Course_Insert 'Power BI - Data Visualization', 120, 7;
EXEC sp_Course_Insert 'SQL for Business Analysts', 110, 7;
EXEC sp_Course_Insert 'Data Modeling & DAX', 130, 7;
EXEC sp_Course_Insert 'Tableau Desktop & Prep', 120, 7;
EXEC sp_Course_Insert 'Business Intelligence Fundamentals', 100, 7;

-- Track 15 ? 8
EXEC sp_Course_Insert 'SAP ERP Overview & Navigation', 130, 8;
EXEC sp_Course_Insert 'Oracle ERP Cloud Fundamentals', 120, 8;
EXEC sp_Course_Insert 'Microsoft Dynamics 365', 130, 8;
EXEC sp_Course_Insert 'ERP Implementation Methodologies', 110, 8;
EXEC sp_Course_Insert 'Business Process Management', 100, 8;

-- Track 16 ? 9
EXEC sp_Course_Insert 'Linux & Open Source Tools', 100, 9;
EXEC sp_Course_Insert 'Git & GitHub Advanced', 110, 9;
EXEC sp_Course_Insert 'Contributing to Open Source', 100, 9;
EXEC sp_Course_Insert 'Python for Open Source Projects', 120, 9;
EXEC sp_Course_Insert 'Docker & Kubernetes Basics', 130, 9;

-- Track 17 ? 12
EXEC sp_Course_Insert 'Python for Data Science', 130, 12;
EXEC sp_Course_Insert 'Statistics & Probability', 120, 12;
EXEC sp_Course_Insert 'Data Cleaning & EDA', 110, 12;
EXEC sp_Course_Insert 'Machine Learning Fundamentals', 140, 12;
EXEC sp_Course_Insert 'Big Data with PySpark', 130, 12;

-- Track 18 ? 13
EXEC sp_Course_Insert 'Supervised Learning Algorithms', 140, 13;
EXEC sp_Course_Insert 'Deep Learning with TensorFlow', 150, 13;
EXEC sp_Course_Insert 'Computer Vision Basics', 130, 13;
EXEC sp_Course_Insert 'Natural Language Processing', 140, 13;
EXEC sp_Course_Insert 'Model Deployment & MLOps', 120, 13;

-- Track 19 ? 5
EXEC sp_Course_Insert 'AI Fundamentals & Ethics', 120, 5;
EXEC sp_Course_Insert 'Neural Networks & Deep Learning', 150, 5;
EXEC sp_Course_Insert 'Reinforcement Learning', 140, 5;
EXEC sp_Course_Insert 'Generative AI & LLMs', 130, 5;
EXEC sp_Course_Insert 'AI in Real-World Applications', 120, 5;

-- Track 20 ? 6
EXEC sp_Course_Insert 'Cybersecurity Fundamentals', 120, 6;
EXEC sp_Course_Insert 'Ethical Hacking & Penetration Testing', 140, 6;
EXEC sp_Course_Insert 'Network Security & Firewalls', 130, 6;
EXEC sp_Course_Insert 'Cryptography & Secure Coding', 120, 6;
EXEC sp_Course_Insert 'Incident Response & Forensics', 130, 6;

-- Track 21 ? 11
EXEC sp_Course_Insert 'CCNA - Networking Fundamentals', 130, 11;
EXEC sp_Course_Insert 'Routing & Switching', 140, 11;
EXEC sp_Course_Insert 'Network Security & VPNs', 120, 11;
EXEC sp_Course_Insert 'Wireless Networking', 110, 11;
EXEC sp_Course_Insert 'Cloud Networking (AWS/Azure)', 130, 11;

-- Track 22 ? 15
EXEC sp_Course_Insert 'Embedded C Programming', 120, 15;
EXEC sp_Course_Insert 'Microcontrollers (STM32/Arduino)', 130, 15;
EXEC sp_Course_Insert 'RTOS Concepts & FreeRTOS', 140, 15;
EXEC sp_Course_Insert 'Interfacing Sensors & Actuators', 120, 15;
EXEC sp_Course_Insert 'Embedded Linux Basics', 130, 15;

-- Track 23 ? 14
EXEC sp_Course_Insert 'IoT Fundamentals & Protocols', 120, 14;
EXEC sp_Course_Insert 'ESP32 & Arduino IoT Projects', 130, 14;
EXEC sp_Course_Insert 'MQTT & CoAP Protocols', 110, 14;
EXEC sp_Course_Insert 'IoT Security & Authentication', 120, 14;
EXEC sp_Course_Insert 'IoT Cloud Platforms (AWS IoT)', 130, 14;

EXEC sp_Course_Select

