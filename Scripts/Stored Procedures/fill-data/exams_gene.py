# This file fills the Exam and ExamQuestion tables by calling stored procedures

import pyodbc  # Library used to connect Python with SQL Server

# Number of MCQ questions per exam
MCQ_COUNT = 7

# Number of True/False questions per exam
TF_COUNT = 3

# =====================
# SQL Server CONNECTION
# =====================

try:
    # Establish a connection to the local SQL Server instance
    conn = pyodbc.connect(
        "DRIVER={SQL Server};"            # Specify SQL Server driver
        "SERVER=localhost\\SQLEXPRESS;"  # Name of the SQL Server instance
        "DATABASE=ITI_ExamSystem;"        # Target database name
        "Trusted_Connection=yes;"         # Use Windows authentication
    )

    # Create a cursor object to execute SQL commands
    cursor = conn.cursor()

    # Print confirmation message if connection succeeds
    print("SQL Server connection successful!")

except Exception as e:
    # Print error message if connection fails
    print("SQL Server connection failed:", e)

    # Stop the program if connection cannot be established
    exit(1)

# =====================
# GET ALL COURSES
# =====================

try:
    # Execute stored procedure that returns all courses
    cursor.execute("EXEC sp_Courses_SelectAll")

    # Fetch all returned rows from the procedure
    rows = cursor.fetchall()

    # Convert each row into a dictionary (course_id, course_name)
    courses = [{"course_id": row[0], "course_name": row[1]} for row in rows]

except Exception as e:
    # Print error if fetching courses fails
    print("Failed to fetch courses:", e)

    # Close database cursor
    cursor.close()

    # Close database connection
    conn.close()

    # Stop execution since courses are required
    exit(1)

# Print how many courses were fetched
print(f"Fetched {len(courses)} courses.")

# =====================
# LOOP THROUGH COURSES AND GENERATE EXAMS
# =====================

# Iterate over each course returned from the database
for course in courses:

    # Extract course ID from dictionary
    course_id = course["course_id"]

    # Extract course name from dictionary
    course_name = course["course_name"]

    try:
        # SQL block to call exam generation stored procedure
        # It declares a variable to receive the generated ExamID
        sql = f"""
            DECLARE @ExamID INT;

            EXEC sp_Exam_Generation 
                @CourseName = ?,   -- Course name passed from Python
                @NumTF = ?,        -- Number of True/False questions
                @NumMC = ?,        -- Number of MCQ questions
                @ExamID = @ExamID OUTPUT;

            SELECT @ExamID;        -- Return generated ExamID
            """

        # Execute the SQL with parameterized values
        exam_id = cursor.execute(
            sql,
            course_name,  # Matches @CourseName
            TF_COUNT,     # Matches @NumTF
            MCQ_COUNT     # Matches @NumMC
        ).fetchval()      # Fetch the returned ExamID value

        # Commit the transaction to save changes in the database
        conn.commit()

        # Print success message with course name and generated exam ID
        print(f"Generated exam for {course_name} (ExamID: {exam_id})")

    except Exception as e:
        # Roll back any changes if an error occurs
        conn.rollback()

        # Print failure message for the current course
        print(f"Failed to generate exam for {course_name}:", e)

# =====================
# CLEANUP
# =====================

# Close the cursor to free database resources
cursor.close()

# Close the database connection
conn.close()

# Final message indicating completion
print("\nAll courses processed successfully!")
