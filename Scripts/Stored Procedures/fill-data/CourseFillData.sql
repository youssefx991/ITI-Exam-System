use ITI_ExamSystem

--generate 5 random courses for each track 

-- Track 11 - Professional Web Dev
EXEC sp_Course_Insert 'HTML5 & CSS3 Fundamentals', 100, 11;
EXEC sp_Course_Insert 'Advanced JavaScript & ES6+', 120, 11;
EXEC sp_Course_Insert 'React.js & Modern Frontend', 130, 11;
EXEC sp_Course_Insert 'Node.js & Express Backend', 120, 11;
EXEC sp_Course_Insert 'Responsive Web Design & UI/UX', 100, 11;

-- Track 12 - Full Stack Development
EXEC sp_Course_Insert 'Full-Stack JavaScript (MERN)', 150, 12;
EXEC sp_Course_Insert 'Next.js & TypeScript', 140, 12;
EXEC sp_Course_Insert 'RESTful APIs & GraphQL', 120, 12;
EXEC sp_Course_Insert 'Database Design & MongoDB', 110, 12;
EXEC sp_Course_Insert 'DevOps Basics for Full-Stack', 100, 12;

-- Track 13 - Software Testing
EXEC sp_Course_Insert 'Manual Testing & Test Cases', 100, 13;
EXEC sp_Course_Insert 'Automation Testing - Selenium', 130, 13;
EXEC sp_Course_Insert 'API Testing with Postman', 110, 13;
EXEC sp_Course_Insert 'Mobile App Testing (Android/iOS)', 120, 13;
EXEC sp_Course_Insert 'Performance & Load Testing', 120, 13;

-- Track 14 - Business Intelligence
EXEC sp_Course_Insert 'Power BI - Data Visualization', 120, 14;
EXEC sp_Course_Insert 'SQL for Business Analysts', 110, 14;
EXEC sp_Course_Insert 'Data Modeling & DAX', 130, 14;
EXEC sp_Course_Insert 'Tableau Desktop & Prep', 120, 14;
EXEC sp_Course_Insert 'Business Intelligence Fundamentals', 100, 14;

-- Track 15 - ERP and Enterprise Applications
EXEC sp_Course_Insert 'SAP ERP Overview & Navigation', 130, 15;
EXEC sp_Course_Insert 'Oracle ERP Cloud Fundamentals', 120, 15;
EXEC sp_Course_Insert 'Microsoft Dynamics 365', 130, 15;
EXEC sp_Course_Insert 'ERP Implementation Methodologies', 110, 15;
EXEC sp_Course_Insert 'Business Process Management', 100, 15;

-- Track 16 - Open Source Development
EXEC sp_Course_Insert 'Linux & Open Source Tools', 100, 16;
EXEC sp_Course_Insert 'Git & GitHub Advanced', 110, 16;
EXEC sp_Course_Insert 'Contributing to Open Source', 100, 16;
EXEC sp_Course_Insert 'Python for Open Source Projects', 120, 16;
EXEC sp_Course_Insert 'Docker & Kubernetes Basics', 130, 16;

-- Track 17 - Data Science
EXEC sp_Course_Insert 'Python for Data Science', 130, 17;
EXEC sp_Course_Insert 'Statistics & Probability', 120, 17;
EXEC sp_Course_Insert 'Data Cleaning & EDA', 110, 17;
EXEC sp_Course_Insert 'Machine Learning Fundamentals', 140, 17;
EXEC sp_Course_Insert 'Big Data with PySpark', 130, 17;

-- Track 18 - Machine Learning
EXEC sp_Course_Insert 'Supervised Learning Algorithms', 140, 18;
EXEC sp_Course_Insert 'Deep Learning with TensorFlow', 150, 18;
EXEC sp_Course_Insert 'Computer Vision Basics', 130, 18;
EXEC sp_Course_Insert 'Natural Language Processing', 140, 18;
EXEC sp_Course_Insert 'Model Deployment & MLOps', 120, 18;

-- Track 19 - Artificial Intelligence
EXEC sp_Course_Insert 'AI Fundamentals & Ethics', 120, 19;
EXEC sp_Course_Insert 'Neural Networks & Deep Learning', 150, 19;
EXEC sp_Course_Insert 'Reinforcement Learning', 140, 19;
EXEC sp_Course_Insert 'Generative AI & LLMs', 130, 19;
EXEC sp_Course_Insert 'AI in Real-World Applications', 120, 19;

-- Track 20 - Cybersecurity
EXEC sp_Course_Insert 'Cybersecurity Fundamentals', 120, 20;
EXEC sp_Course_Insert 'Ethical Hacking & Penetration Testing', 140, 20;
EXEC sp_Course_Insert 'Network Security & Firewalls', 130, 20;
EXEC sp_Course_Insert 'Cryptography & Secure Coding', 120, 20;
EXEC sp_Course_Insert 'Incident Response & Forensics', 130, 20;

-- Track 21 - Network Infrastructure
EXEC sp_Course_Insert 'CCNA - Networking Fundamentals', 130, 21;
EXEC sp_Course_Insert 'Routing & Switching', 140, 21;
EXEC sp_Course_Insert 'Network Security & VPNs', 120, 21;
EXEC sp_Course_Insert 'Wireless Networking', 110, 21;
EXEC sp_Course_Insert 'Cloud Networking (AWS/Azure)', 130, 21;

-- Track 22 - Embedded Systems Development
EXEC sp_Course_Insert 'Embedded C Programming', 120, 22;
EXEC sp_Course_Insert 'Microcontrollers (STM32/Arduino)', 130, 22;
EXEC sp_Course_Insert 'RTOS Concepts & FreeRTOS', 140, 22;
EXEC sp_Course_Insert 'Interfacing Sensors & Actuators', 120, 22;
EXEC sp_Course_Insert 'Embedded Linux Basics', 130, 22;

-- Track 23 - IoT Systems
EXEC sp_Course_Insert 'IoT Fundamentals & Protocols', 120, 23;
EXEC sp_Course_Insert 'ESP32 & Arduino IoT Projects', 130, 23;
EXEC sp_Course_Insert 'MQTT & CoAP Protocols', 110, 23;
EXEC sp_Course_Insert 'IoT Security & Authentication', 120, 23;
EXEC sp_Course_Insert 'IoT Cloud Platforms (AWS IoT)', 130, 23;


EXEC sp_Course_Select
