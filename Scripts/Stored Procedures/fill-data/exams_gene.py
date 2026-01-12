import pyodbc

MCQ_COUNT = 7
TF_COUNT = 3

# =====================
# SQL Server CONNECTION
# =====================
try:
    conn = pyodbc.connect(
        "DRIVER={SQL Server};"
        "SERVER=localhost\\SQLEXPRESS;"
        "DATABASE=ITI_ExamSystem;"
        "Trusted_Connection=yes;"
    )
    cursor = conn.cursor()
    print("SQL Server connection successful!")
except Exception as e:
    print("SQL Server connection failed:", e)
    exit(1)

#get all courses
try:
    cursor.execute("EXEC sp_AllCourses_Select")
    rows = cursor.fetchall()
    courses = [{"course_id": row[0], "course_name": row[1]} for row in rows]
except Exception as e:
    print("Failed to fetch courses:", e)
    cursor.close()
    conn.close()
    exit(1)

# =====================
# LOOP THROUGH COURSES AND GENERATE EXAMS
# =====================
for course in courses:
    course_id = course["course_id"]
    course_name = course["course_name"]

    try:
        sql = f"""
            DECLARE @ExamID INT;

            EXEC GenerateExam 
                @CourseName = ?,
                @NumTF = ?,
                @NumMC = ?,
                @ExamID = @ExamID OUTPUT;

            SELECT @ExamID;
            """

        # Call the stored procedure
        exam_id = cursor.execute(sql, course_name, TF_COUNT, MCQ_COUNT).fetchval()
        conn.commit()
        print(f"Generated exam for {course_name} (ExamID: {exam_id})")

    except Exception as e:
        conn.rollback()
        print(f"Failed to generate exam for {course_name}:", e)

# =====================
# CLEANUP
# =====================
cursor.close()
conn.close()
print("\nAll courses processed successfully!")
