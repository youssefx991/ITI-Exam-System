
import pyodbc  

MCQ_COUNT = 7

TF_COUNT = 3

try:
    # Establish a connection to the local SQL Server instance
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


try:
    cursor.execute("EXEC sp_Courses_SelectAll")

    rows = cursor.fetchall()

    courses = [{"course_id": row[0], "course_name": row[1]} for row in rows]

except Exception as e:
    print("Failed to fetch courses:", e)

    cursor.close()
    conn.close()

    exit(1)

print(f"Fetched {len(courses)} courses.")

for course in courses:


    course_id = course["course_id"]

    course_name = course["course_name"]

    try:

        sql = f"""
            DECLARE @ExamID INT;

            EXEC sp_Exam_Generation 
                @CourseName = ?,   -- Course name passed from Python
                @NumTF = ?,        -- Number of True/False questions
                @NumMC = ?,        -- Number of MCQ questions
                @ExamID = @ExamID OUTPUT;

            SELECT @ExamID;        -- Return generated ExamID
            """
        exam_id = cursor.execute(
            sql,
            course_name, 
            TF_COUNT,     
            MCQ_COUNT     
        ).fetchval()     

        conn.commit()

        print(f"Generated exam for {course_name} (ExamID: {exam_id})")

    except Exception as e:
        conn.rollback()

        print(f"Failed to generate exam for {course_name}:", e)


cursor.close()

conn.close()

print("\nAll courses processed successfully!")
