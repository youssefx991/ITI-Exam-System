USE ITI_ExamSystem;
GO

-- =========================
-- 3 topics per course
-- =========================

-- Course 1: HTML5 & CSS3 Fundamentals
EXEC sp_Topic_Insert 1, 'HTML Document Structure', 1;
EXEC sp_Topic_Insert 2, 'CSS Box Model', 1;
EXEC sp_Topic_Insert 3, 'Flexbox & Grid Layouts', 1;

-- Course 2: Advanced JavaScript & ES6+
EXEC sp_Topic_Insert 4, 'ES6 Syntax & Features', 2;
EXEC sp_Topic_Insert 5, 'Closures & Scope', 2;
EXEC sp_Topic_Insert 6, 'Async Programming', 2;

-- Course 3: React.js & Modern Frontend
EXEC sp_Topic_Insert 7, 'JSX & Components', 3;
EXEC sp_Topic_Insert 8, 'State & Props', 3;
EXEC sp_Topic_Insert 9, 'Hooks & Lifecycle', 3;

-- Course 4: Responsive Web Design & UI/UX
EXEC sp_Topic_Insert 10, 'Responsive Layout Techniques', 4;
EXEC sp_Topic_Insert 11, 'Mobile-First Design', 4;
EXEC sp_Topic_Insert 12, 'Accessibility Principles', 4;

-- Course 5: Frontend Performance Optimization
EXEC sp_Topic_Insert 13, 'Critical Rendering Path', 5;
EXEC sp_Topic_Insert 14, 'Lazy Loading Assets', 5;
EXEC sp_Topic_Insert 15, 'Browser Performance Tools', 5;

-- Course 6: Node.js & Express Backend
EXEC sp_Topic_Insert 16, 'Node.js Event Loop', 6;
EXEC sp_Topic_Insert 17, 'Express Routing', 6;
EXEC sp_Topic_Insert 18, 'Middleware & APIs', 6;

-- Course 7: RESTful APIs & GraphQL
EXEC sp_Topic_Insert 19, 'REST Architecture', 7;
EXEC sp_Topic_Insert 20, 'GraphQL Queries', 7;
EXEC sp_Topic_Insert 21, 'API Security', 7;

-- Course 8: Database Design & MongoDB
EXEC sp_Topic_Insert 22, 'Schema Design', 8;
EXEC sp_Topic_Insert 23, 'MongoDB CRUD', 8;
EXEC sp_Topic_Insert 24, 'Indexes & Aggregation', 8;

-- Course 9: DevOps Basics for Full-Stack
EXEC sp_Topic_Insert 25, 'CI/CD Pipelines', 9;
EXEC sp_Topic_Insert 26, 'Docker Fundamentals', 9;
EXEC sp_Topic_Insert 27, 'Deployment Automation', 9;

-- Course 10: Next.js & TypeScript
EXEC sp_Topic_Insert 28, 'Next.js Routing', 10;
EXEC sp_Topic_Insert 29, 'TypeScript Typing', 10;
EXEC sp_Topic_Insert 30, 'Server-Side Rendering', 10;

-- Course 11: Manual Testing & Test Cases
EXEC sp_Topic_Insert 31, 'Testing Fundamentals', 11;
EXEC sp_Topic_Insert 32, 'Test Case Design', 11;
EXEC sp_Topic_Insert 33, 'Bug Reporting', 11;

-- Course 12: Automation Testing – Selenium
EXEC sp_Topic_Insert 34, 'Selenium WebDriver', 12;
EXEC sp_Topic_Insert 35, 'Test Automation Frameworks', 12;
EXEC sp_Topic_Insert 36, 'CI Integration', 12;

-- Course 13: API Testing with Postman
EXEC sp_Topic_Insert 37, 'REST API Validation', 13;
EXEC sp_Topic_Insert 38, 'Postman Collections', 13;
EXEC sp_Topic_Insert 39, 'Automated API Testing', 13;

-- Course 14: Mobile App Testing
EXEC sp_Topic_Insert 40, 'Mobile Testing Types', 14;
EXEC sp_Topic_Insert 41, 'Android & iOS Testing', 14;
EXEC sp_Topic_Insert 42, 'Device Compatibility', 14;

-- Course 15: Performance & Load Testing
EXEC sp_Topic_Insert 43, 'Load Testing Concepts', 15;
EXEC sp_Topic_Insert 44, 'JMeter Tools', 15;
EXEC sp_Topic_Insert 45, 'Performance Metrics', 15;

-- Course 16: Power BI – Data Visualization
EXEC sp_Topic_Insert 46, 'Power BI Desktop', 16;
EXEC sp_Topic_Insert 47, 'Data Modeling', 16;
EXEC sp_Topic_Insert 48, 'Dashboard Design', 16;

-- Course 17: SQL for Business Analysts
EXEC sp_Topic_Insert 49, 'SQL Queries', 17;
EXEC sp_Topic_Insert 50, 'Joins & Subqueries', 17;
EXEC sp_Topic_Insert 51, 'Business Reporting', 17;

-- Course 18: Data Modeling & DAX
EXEC sp_Topic_Insert 52, 'Star Schema Design', 18;
EXEC sp_Topic_Insert 53, 'DAX Calculations', 18;
EXEC sp_Topic_Insert 54, 'Measures & KPIs', 18;

-- Course 19: Tableau Desktop & Prep
EXEC sp_Topic_Insert 55, 'Tableau Prep', 19;
EXEC sp_Topic_Insert 56, 'Visual Analytics', 19;
EXEC sp_Topic_Insert 57, 'Interactive Dashboards', 19;

-- Course 20: Business Intelligence Fundamentals
EXEC sp_Topic_Insert 58, 'BI Architecture', 20;
EXEC sp_Topic_Insert 59, 'ETL Concepts', 20;
EXEC sp_Topic_Insert 60, 'BI Reporting', 20;

-- Course 21: SAP ERP Overview
EXEC sp_Topic_Insert 61, 'SAP Modules Overview', 21;
EXEC sp_Topic_Insert 62, 'Navigation & Transactions', 21;
EXEC sp_Topic_Insert 63, 'Business Process Flow', 21;

-- Course 22: Oracle ERP Cloud
EXEC sp_Topic_Insert 64, 'Oracle ERP Architecture', 22;
EXEC sp_Topic_Insert 65, 'Cloud Configuration', 22;
EXEC sp_Topic_Insert 66, 'Analytics & Reports', 22;

-- Course 23: Microsoft Dynamics 365
EXEC sp_Topic_Insert 67, 'Dynamics Modules', 23;
EXEC sp_Topic_Insert 68, 'Customization Tools', 23;
EXEC sp_Topic_Insert 69, 'Power Platform Integration', 23;

-- Course 24: ERP Implementation Methodologies
EXEC sp_Topic_Insert 70, 'ERP Lifecycle Phases', 24;
EXEC sp_Topic_Insert 71, 'Requirement Analysis', 24;
EXEC sp_Topic_Insert 72, 'Go-Live Planning', 24;

-- Course 25: Business Process Management
EXEC sp_Topic_Insert 73, 'Process Modeling', 25;
EXEC sp_Topic_Insert 74, 'BPM Tools', 25;
EXEC sp_Topic_Insert 75, 'Process Optimization', 25;

-- Course 26: Linux & Open Source Tools
EXEC sp_Topic_Insert 76, 'Linux Command Line', 26;
EXEC sp_Topic_Insert 77, 'Package Management', 26;
EXEC sp_Topic_Insert 78, 'Open Source Licenses', 26;

-- Course 27: Git & GitHub Advanced
EXEC sp_Topic_Insert 79, 'Branching Strategies', 27;
EXEC sp_Topic_Insert 80, 'Merge & Rebase', 27;
EXEC sp_Topic_Insert 81, 'GitHub Actions', 27;

-- Course 28: Contributing to Open Source
EXEC sp_Topic_Insert 82, 'Finding Projects', 28;
EXEC sp_Topic_Insert 83, 'Pull Requests', 28;
EXEC sp_Topic_Insert 84, 'Issue Tracking', 28;

-- Course 29: Python for Open Source Projects
EXEC sp_Topic_Insert 85, 'Python Project Structure', 29;
EXEC sp_Topic_Insert 86, 'Scripting Automation', 29;
EXEC sp_Topic_Insert 87, 'Collaboration Tools', 29;

-- Course 30: Docker & Kubernetes Basics
EXEC sp_Topic_Insert 88, 'Docker Containers', 30;
EXEC sp_Topic_Insert 89, 'Kubernetes Architecture', 30;
EXEC sp_Topic_Insert 90, 'Container Orchestration', 30;

-- Course 31: Python for Data Science
EXEC sp_Topic_Insert 91, 'NumPy & Pandas', 31;
EXEC sp_Topic_Insert 92, 'Data Analysis', 31;
EXEC sp_Topic_Insert 93, 'Visualization Libraries', 31;

-- Course 32: Statistics & Probability
EXEC sp_Topic_Insert 94, 'Descriptive Statistics', 32;
EXEC sp_Topic_Insert 95, 'Probability Theory', 32;
EXEC sp_Topic_Insert 96, 'Statistical Distributions', 32;

-- Course 33: Data Cleaning & EDA
EXEC sp_Topic_Insert 97, 'Handling Missing Data', 33;
EXEC sp_Topic_Insert 98, 'Outlier Detection', 33;
EXEC sp_Topic_Insert 99, 'Exploratory Analysis', 33;

-- Course 34: Machine Learning Fundamentals
EXEC sp_Topic_Insert 100, 'Supervised Learning', 34;
EXEC sp_Topic_Insert 101, 'Unsupervised Learning', 34;
EXEC sp_Topic_Insert 102, 'Model Evaluation', 34;

-- Course 35: Big Data with PySpark
EXEC sp_Topic_Insert 103, 'Spark Architecture', 35;
EXEC sp_Topic_Insert 104, 'RDDs & DataFrames', 35;
EXEC sp_Topic_Insert 105, 'Big Data Processing', 35;

-- Course 36: Supervised Learning Algorithms
EXEC sp_Topic_Insert 106, 'Regression Models', 36;
EXEC sp_Topic_Insert 107, 'Classification Algorithms', 36;
EXEC sp_Topic_Insert 108, 'Hyperparameter Tuning', 36;

-- Course 37: Deep Learning with TensorFlow
EXEC sp_Topic_Insert 109, 'Neural Network Basics', 37;
EXEC sp_Topic_Insert 110, 'TensorFlow APIs', 37;
EXEC sp_Topic_Insert 111, 'Model Training', 37;

-- Course 38: Model Deployment & MLOps
EXEC sp_Topic_Insert 112, 'Model Serving', 38;
EXEC sp_Topic_Insert 113, 'CI/CD for ML', 38;
EXEC sp_Topic_Insert 114, 'Monitoring Models', 38;

-- Course 39: Computer Vision Basics
EXEC sp_Topic_Insert 115, 'Image Processing', 39;
EXEC sp_Topic_Insert 116, 'OpenCV', 39;
EXEC sp_Topic_Insert 117, 'Vision Models', 39;

-- Course 40: Natural Language Processing
EXEC sp_Topic_Insert 118, 'Text Preprocessing', 40;
EXEC sp_Topic_Insert 119, 'Word Embeddings', 40;
EXEC sp_Topic_Insert 120, 'NLP Models', 40;

-- Course 41: AI Fundamentals & Ethics
EXEC sp_Topic_Insert 121, 'AI Concepts', 41;
EXEC sp_Topic_Insert 122, 'Ethical AI', 41;
EXEC sp_Topic_Insert 123, 'AI Applications', 41;

-- Course 42: Neural Networks & Deep Learning
EXEC sp_Topic_Insert 124, 'Perceptrons', 42;
EXEC sp_Topic_Insert 125, 'Backpropagation', 42;
EXEC sp_Topic_Insert 126, 'Deep Architectures', 42;

-- Course 43: Reinforcement Learning
EXEC sp_Topic_Insert 127, 'MDPs', 43;
EXEC sp_Topic_Insert 128, 'Q-Learning', 43;
EXEC sp_Topic_Insert 129, 'Policy Gradients', 43;

-- Course 44: Generative AI & LLMs
EXEC sp_Topic_Insert 130, 'GANs', 44;
EXEC sp_Topic_Insert 131, 'Transformers', 44;
EXEC sp_Topic_Insert 132, 'LLM Applications', 44;

-- Course 45: AI in Real-World Applications
EXEC sp_Topic_Insert 133, 'AI in Healthcare', 45;
EXEC sp_Topic_Insert 134, 'AI in Finance', 45;
EXEC sp_Topic_Insert 135, 'Industrial AI', 45;

-- Course 46: Cybersecurity Fundamentals
EXEC sp_Topic_Insert 136, 'Security Principles', 46;
EXEC sp_Topic_Insert 137, 'Threat Models', 46;
EXEC sp_Topic_Insert 138, 'Risk Management', 46;

-- Course 47: Ethical Hacking & Penetration Testing
EXEC sp_Topic_Insert 139, 'Penetration Testing Phases', 47;
EXEC sp_Topic_Insert 140, 'Exploitation Tools', 47;
EXEC sp_Topic_Insert 141, 'Reporting Findings', 47;

-- Course 48: Network Security & Firewalls
EXEC sp_Topic_Insert 142, 'Firewall Technologies', 48;
EXEC sp_Topic_Insert 143, 'IDS/IPS', 48;
EXEC sp_Topic_Insert 144, 'Network Hardening', 48;

-- Course 49: Cryptography & Secure Coding
EXEC sp_Topic_Insert 145, 'Encryption Algorithms', 49;
EXEC sp_Topic_Insert 146, 'Secure Coding Practices', 49;
EXEC sp_Topic_Insert 147, 'Key Management', 49;

-- Course 50: Incident Response & Forensics
EXEC sp_Topic_Insert 148, 'Incident Handling', 50;
EXEC sp_Topic_Insert 149, 'Digital Forensics', 50;
EXEC sp_Topic_Insert 150, 'Post-Incident Review', 50;

-- Course 51: CCNA – Networking Fundamentals
EXEC sp_Topic_Insert 151, 'OSI Model', 51;
EXEC sp_Topic_Insert 152, 'IP Addressing', 51;
EXEC sp_Topic_Insert 153, 'Routing Basics', 51;

-- Course 52: Routing & Switching
EXEC sp_Topic_Insert 154, 'Switching Concepts', 52;
EXEC sp_Topic_Insert 155, 'VLANs', 52;
EXEC sp_Topic_Insert 156, 'Routing Protocols', 52;

-- Course 53: Network Security & VPNs
EXEC sp_Topic_Insert 157, 'VPN Technologies', 53;
EXEC sp_Topic_Insert 158, 'Firewall Rules', 53;
EXEC sp_Topic_Insert 159, 'Secure Tunneling', 53;

-- Course 54: Wireless Networking
EXEC sp_Topic_Insert 160, 'Wi-Fi Standards', 54;
EXEC sp_Topic_Insert 161, 'Wireless Security', 54;
EXEC sp_Topic_Insert 162, 'Troubleshooting WLANs', 54;

-- Course 55: Cloud Networking (AWS/Azure)
EXEC sp_Topic_Insert 163, 'AWS Networking', 55;
EXEC sp_Topic_Insert 164, 'Azure Networking', 55;
EXEC sp_Topic_Insert 165, 'Hybrid Cloud Design', 55;

-- Course 56: Embedded C Programming
EXEC sp_Topic_Insert 166, 'C Memory Management', 56;
EXEC sp_Topic_Insert 167, 'Pointers & Structures', 56;
EXEC sp_Topic_Insert 168, 'Embedded C Libraries', 56;

-- Course 57: Microcontrollers (STM32/Arduino)
EXEC sp_Topic_Insert 169, 'MCU Architecture', 57;
EXEC sp_Topic_Insert 170, 'GPIO & Timers', 57;
EXEC sp_Topic_Insert 171, 'Peripheral Interfacing', 57;

-- Course 58: RTOS Concepts & FreeRTOS
EXEC sp_Topic_Insert 172, 'RTOS Scheduling', 58;
EXEC sp_Topic_Insert 173, 'Tasks & Queues', 58;
EXEC sp_Topic_Insert 174, 'RTOS Synchronization', 58;

-- Course 59: Interfacing Sensors & Actuators
EXEC sp_Topic_Insert 175, 'Sensor Types', 59;
EXEC sp_Topic_Insert 176, 'Actuator Control', 59;
EXEC sp_Topic_Insert 177, 'Signal Conditioning', 59;

-- Course 60: Embedded Linux Basics
EXEC sp_Topic_Insert 178, 'Linux Kernel Basics', 60;
EXEC sp_Topic_Insert 179, 'Device Drivers', 60;
EXEC sp_Topic_Insert 180, 'Embedded Applications', 60;

-- Course 61: IoT Fundamentals & Protocols
EXEC sp_Topic_Insert 181, 'IoT Architecture', 61;
EXEC sp_Topic_Insert 182, 'Communication Protocols', 61;
EXEC sp_Topic_Insert 183, 'Edge Devices', 61;

-- Course 62: ESP32 & Arduino IoT Projects
EXEC sp_Topic_Insert 184, 'ESP32 Architecture', 62;
EXEC sp_Topic_Insert 185, 'Arduino Programming', 62;
EXEC sp_Topic_Insert 186, 'IoT Project Design', 62;

-- Course 63: MQTT & CoAP Protocols
EXEC sp_Topic_Insert 187, 'MQTT Messaging', 63;
EXEC sp_Topic_Insert 188, 'CoAP Protocol', 63;
EXEC sp_Topic_Insert 189, 'Protocol Security', 63;

-- Course 64: IoT Security & Authentication
EXEC sp_Topic_Insert 190, 'IoT Authentication', 64;
EXEC sp_Topic_Insert 191, 'Device Encryption', 64;
EXEC sp_Topic_Insert 192, 'Secure Firmware Updates', 64;

-- Course 65: IoT Cloud Platforms (AWS IoT)
EXEC sp_Topic_Insert 193, 'AWS IoT Core', 65;
EXEC sp_Topic_Insert 194, 'Device Management', 65;
EXEC sp_Topic_Insert 195, 'Cloud Integrations', 65;

GO


