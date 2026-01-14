import pyodbc      # Library to connect Python with SQL Server
import json        # Used to read JSON files
import os          # Used for file and folder operations

# =====================
# CONFIG
# =====================

# Absolute path to the cache folder that contains course JSON files
CACHE_FOLDER = r"E:\\ITI\\itiprojects\\sql\\sql\\ITI-Exam-System\\cache"

# =====================
# SQL Server CONNECTION
# =====================

try:
    # Create a connection to the local SQL Server instance
    conn = pyodbc.connect(
        "DRIVER={SQL Server};"            # SQL Server driver
        "SERVER=localhost\\SQLEXPRESS;"  # SQL Server instance name
        "DATABASE=ITI_ExamSystem;"        # Target database
        "Trusted_Connection=yes;"         # Use Windows Authentication
    )

    # Create a cursor to execute SQL commands
    cursor = conn.cursor()

    # Confirm successful connection
    print("SQL Server connection successful!")

except Exception as e:
    # Print error message if connection fails
    print("SQL Server connection failed:", e)

    # Stop execution if connection cannot be established
    exit(1)

# =====================
# LOOP THROUGH CACHE FILES
# =====================

# Iterate over every file inside the cache folder
for filename in os.listdir(CACHE_FOLDER):

    # Skip any file that is not a JSON file
    if not filename.endswith(".json"):
        continue

    # Build full file path (e.g., cache/3.json)
    file_path = os.path.join(CACHE_FOLDER, filename)

    # Extract course ID from file name (e.g., "3.json" -> 3)
    course_id = int(os.path.splitext(filename)[0])

    try:
        # Open and read the JSON file
        with open(file_path, "r", encoding="utf-8") as f:
            data = json.load(f)

    except json.JSONDecodeError:
        # Skip file if JSON format is invalid
        print(f"Skipping {filename}: invalid JSON")
        continue

    # The first (and only) key in the JSON is the course name
    course_name = list(data.keys())[0]

    # Get the content (questions) for this course
    content = data[course_name]

    # =====================
    # INSERT QUESTIONS
    # =====================

    try:
        # ---- MCQ QUESTIONS ----

        # Loop through all MCQ questions (if any)
        for q in content.get("mcq", []):

            # Call stored procedure to insert MCQ question
            cursor.execute("""
                EXEC sp_Question_InsertAI
                    @QText = ?,       -- Question text
                    @QType = 'MCQ',   -- Question type
                    @QAnswer = ?,     -- Correct answer key (A/B/C)
                    @Difficulty = ?,  -- Difficulty level
                    @CrsId = ?,       -- Course ID
                    @ChoiceA = ?,     -- Choice A text
                    @ChoiceB = ?,     -- Choice B text
                    @ChoiceC = ?      -- Choice C text
            """,
            q["question"],                  # Question text
            q["answer"],                    # Correct answer
            q.get("difficulty", "Easy"),    # Difficulty (default = Easy)
            course_id,                      # Course ID
            q["choices"]["A"],              # Choice A
            q["choices"]["B"],              # Choice B
            q["choices"]["C"]               # Choice C
            )

        # ---- TRUE / FALSE QUESTIONS ----

        # Loop through all True/False questions (if any)
        for q in content.get("tf", []):

            # Call stored procedure to insert TF question
            cursor.execute("""
                EXEC sp_Question_InsertAI
                    @QText = ?,      -- Question text
                    @QType = 'TF',   -- Question type
                    @QAnswer = ?,    -- Correct answer (True/False)
                    @Difficulty = ?, -- Difficulty level
                    @CrsId = ?       -- Course ID
            """,
            q["question"],                  # Question text
            q["answer"],                    # Correct answer
            q.get("difficulty", "Easy"),    # Difficulty (default = Easy)
            course_id                       # Course ID
            )

        # Commit all inserts for this course
        conn.commit()

        # Print success message
        print(f"Inserted questions for {course_name} (Course ID: {course_id})")

    except Exception as e:
        # Roll back all changes if any insert fails
        conn.rollback()

        # Print error message for this course
        print(f"Insert failed for {course_name} (Course ID: {course_id}): {e}")

# =====================
# CLOSE CONNECTION
# =====================

# Close the cursor
cursor.close()

# Close the database connection
conn.close()

# Final success message
print("\nAll courses processed successfully!")

