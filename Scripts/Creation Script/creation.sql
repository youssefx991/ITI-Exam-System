/* =========================================
   ITI Examination System – Final Schema
   ========================================= */

CREATE DATABASE ITI_ExamSystem;
GO

USE ITI_ExamSystem;
GO

/* =======================
   Department
   ======================= */
CREATE TABLE Department (
    DeptID INT IDENTITY PRIMARY KEY,
    DeptName VARCHAR(100) NOT NULL UNIQUE
);

/* =======================
   Track
   ======================= */
CREATE TABLE Track (
    TrackID INT IDENTITY PRIMARY KEY,
    TrackName VARCHAR(50) NOT NULL UNIQUE,
    DeptID INT NOT NULL,
    CONSTRAINT FK_Track_Department
        FOREIGN KEY (DeptID)
        REFERENCES Department(DeptID)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

/* =======================
   Student
   ======================= */
CREATE TABLE Student (
    StId INT IDENTITY PRIMARY KEY,
    StName VARCHAR(100) NOT NULL,
    StEmail VARCHAR(100) NOT NULL UNIQUE,
    TrackID INT NOT NULL,
    CONSTRAINT FK_Student_Track
        FOREIGN KEY (TrackID)
        REFERENCES Track(TrackID)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

/* =======================
   Instructor
   ======================= */
CREATE TABLE Instructor (
    InsId INT IDENTITY PRIMARY KEY,
    InsName VARCHAR(100) NOT NULL,
    InsEmail VARCHAR(100) NOT NULL UNIQUE,
    TrackID INT NOT NULL,
    CONSTRAINT FK_Instructor_Track
        FOREIGN KEY (TrackID)
        REFERENCES Track(TrackID)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

/* =======================
   Course
   ======================= */
CREATE TABLE Course (
    CrsId INT IDENTITY PRIMARY KEY,
    CrsName VARCHAR(100) NOT NULL,
    MaxDegree INT NOT NULL,
    TrackID INT NOT NULL,
    CONSTRAINT FK_Course_Track
        FOREIGN KEY (TrackID)
        REFERENCES Track(TrackID)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

/* =======================
   Instructor_Course (M:N)
   ======================= */
CREATE TABLE Instructor_Course (
    InsId INT,
    CrsId INT,
    CONSTRAINT PK_Instructor_Course PRIMARY KEY (InsId, CrsId),
    CONSTRAINT FK_IC_Instructor
        FOREIGN KEY (InsId)
        REFERENCES Instructor(InsId)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    CONSTRAINT FK_IC_Course
        FOREIGN KEY (CrsId)
        REFERENCES Course(CrsId)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

/* =======================
   Topic
   ======================= */
CREATE TABLE Topic (
    TopicID INT IDENTITY PRIMARY KEY,
    TopicName VARCHAR(100) NOT NULL,
    CrsId INT NOT NULL,
    CONSTRAINT FK_Topic_Course
        FOREIGN KEY (CrsId)
        REFERENCES Course(CrsId)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

/* =======================
   Question
   (ModelAnswer merged – 1:1 total)
   ======================= */
CREATE TABLE Question (
    QId INT IDENTITY PRIMARY KEY,
    QText VARCHAR(MAX) NOT NULL,
    QType VARCHAR(10) CHECK (QType IN ('TF', 'MCQ')),
    QDegree INT NOT NULL,
    QAnswer VARCHAR(10) NOT NULL,
    CrsId INT NOT NULL,
    CONSTRAINT FK_Question_Course
        FOREIGN KEY (CrsId)
        REFERENCES Course(CrsId)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

/* =======================
   Choice
   ======================= */
CREATE TABLE Choice (
    ChoiceLabel CHAR(1),
    ChoiceText VARCHAR(200) NOT NULL,
    QId INT NOT NULL,
    CONSTRAINT PK_Choice PRIMARY KEY (ChoiceLabel, QId),
    CONSTRAINT FK_Choice_Question
        FOREIGN KEY (QId)
        REFERENCES Question(QId)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

/* =======================
   Exam
   ======================= */
CREATE TABLE Exam (
    ExId INT IDENTITY PRIMARY KEY,
    ExDate DATETIME NOT NULL DEFAULT GETDATE(),
    CrsId INT NOT NULL,
    CONSTRAINT FK_Exam_Course
        FOREIGN KEY (CrsId)
        REFERENCES Course(CrsId)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

/* =======================
   Exam_Question
   ======================= */
CREATE TABLE Exam_Question (
    ExId INT,
    QId INT,
    QOrder INT NOT NULL,
    CONSTRAINT PK_Exam_Question PRIMARY KEY (ExId, QId),
    CONSTRAINT FK_EQ_Exam
        FOREIGN KEY (ExId)
        REFERENCES Exam(ExId)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    CONSTRAINT FK_EQ_Question
        FOREIGN KEY (QId)
        REFERENCES Question(QId)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

/* =======================
   Student_Exam
   ======================= */
CREATE TABLE Student_Exam (
    StId INT,
    ExId INT,
    FinalGrade DECIMAL(5,2),
    CONSTRAINT PK_Student_Exam PRIMARY KEY (StId, ExId),
    CONSTRAINT FK_SE_Student
        FOREIGN KEY (StId)
        REFERENCES Student(StId)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    CONSTRAINT FK_SE_Exam
        FOREIGN KEY (ExId)
        REFERENCES Exam(ExId)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

/* =======================
   StudentAnswer (Weak Entity)
   ======================= */
CREATE TABLE StudentAnswer (
    StId INT,
    ExId INT,
    QId INT,
    Answer VARCHAR(10) NOT NULL,
    CONSTRAINT PK_StudentAnswer PRIMARY KEY (StId, ExId, QId),
    CONSTRAINT FK_SA_StudentExam
        FOREIGN KEY (StId, ExId)
        REFERENCES Student_Exam(StId, ExId)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    CONSTRAINT FK_SA_Question
        FOREIGN KEY (QId)
        REFERENCES Question(QId)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);
