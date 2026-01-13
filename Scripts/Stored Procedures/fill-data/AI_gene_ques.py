import pyodbc
import json
import os

# =====================
# CONFIG
# =====================
CACHE_FOLDER = r"E:\\ITI\\itiprojects\sql\sql\\ITI-Exam-System\\cache"  # Change to your cache folder

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

# =====================
# LOOP THROUGH CACHE FILES
# =====================
for filename in os.listdir(CACHE_FOLDER):
    if not filename.endswith(".json"):
        continue

    file_path = os.path.join(CACHE_FOLDER, filename)
    course_id = int(os.path.splitext(filename)[0])  # filename without .json

    try:
        with open(file_path, "r", encoding="utf-8") as f:
            data = json.load(f)
    except json.JSONDecodeError:
        print(f"Skipping {filename}: invalid JSON")
        continue

    # First key is the course name
    course_name = list(data.keys())[0]
    content = data[course_name]

    # =====================
    # INSERT QUESTIONS
    # =====================
    if course_id == 3:
        try:
            # ---- MCQ QUESTIONS ----
            for q in content.get("mcq", []):
                cursor.execute("""
                    EXEC sp_Question_InsertAI
                        @QText = ?,
                        @QType = 'MCQ',
                        @QAnswer = ?,
                        @Difficulty = ?,
                        @CrsId = ?,
                        @ChoiceA = ?,
                        @ChoiceB = ?,
                        @ChoiceC = ?
                """,
                q["question"],
                q["answer"],
                q.get("difficulty", "Easy"),
                course_id,
                q["choices"]["A"],
                q["choices"]["B"],
                q["choices"]["C"]
                )

            # ---- TRUE / FALSE QUESTIONS ----
            for q in content.get("tf", []):
                cursor.execute("""
                    EXEC sp_Question_InsertAI
                        @QText = ?,
                        @QType = 'TF',
                        @QAnswer = ?,
                        @Difficulty = ?,
                        @CrsId = ?
                """,
                q["question"],
                q["answer"],
                q.get("difficulty", "Easy"),
                course_id
                )

            conn.commit()
            print(f"Inserted questions for {course_name} (Course ID: {course_id})")

        except Exception as e:
            conn.rollback()
            print(f"Insert failed for {course_name} (Course ID: {course_id}): {e}")

# =====================
# CLOSE CONNECTION
# =====================
cursor.close()
conn.close()
print("\nAll courses processed successfully!")
