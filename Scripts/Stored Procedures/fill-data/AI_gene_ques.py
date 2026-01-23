import pyodbc      # Library to connect Python with SQL Server
import json        # Used to read JSON files
import os          # Used for file and folder operations


CACHE_FOLDER = r"E:\\ITI\\itiprojects\\sql\\sql\\ITI-Exam-System\\cache"


# try connecting to SQL Server
try:
    # Create a connection to the local SQL Server instance
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

for filename in os.listdir(CACHE_FOLDER):

    if not filename.endswith(".json"):
        continue

    file_path = os.path.join(CACHE_FOLDER, filename)

    course_id = int(os.path.splitext(filename)[0])

    try:
   
        with open(file_path, "r", encoding="utf-8") as f:
            data = json.load(f)

    except json.JSONDecodeError:
        print(f"Skipping {filename}: invalid JSON")
        continue

    course_name = list(data.keys())[0]

    content = data[course_name]


    try:
        # ---- MCQ QUESTIONS ----
        for q in content.get("mcq", []):
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
                    @QText = ?,      -- Question text
                    @QType = 'TF',   -- Question type
                    @QAnswer = ?,    -- Correct answer (True/False)
                    @Difficulty = ?, -- Difficulty level
                    @CrsId = ?       -- Course ID
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


cursor.close()

conn.close()

print("\nAll courses processed successfully!")

