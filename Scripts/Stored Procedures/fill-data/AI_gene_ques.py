import openai
import pyodbc
import json
import os 
from dotenv import load_dotenv



# =====================
# CONFIG
# =====================


load_dotenv()
openai.api_key = os.getenv("OPENAI_API_KEY")

PROMPT = """
Generate questions for the course "{course}".

Rules:
- {mcq} MCQ questions (A, B, C only)
- {tf} True/False questions
- Each question must include difficulty: Easy, Medium, or Hard
- Return VALID JSON ONLY
- Ensure all JSON keys and values are properly quoted

JSON format:
{{
  "mcq": [
    {{
      "question": "",
      "choices": {{
        "A": "",
        "B": "",
        "C": ""
      }},
      "answer": "A",
      "difficulty": "Medium"
    }}
  ],
  "tf": [
    {{
      "question": "",
      "answer": "T",
      "difficulty": "Easy"
    }}
  ]
}}
"""

MCQ_COUNT = 30
TF_COUNT = 15
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
    print(" SQL Server connection successful!")
except Exception as e:
    print(" SQL Server connection failed:", e)
    exit(1)



cursor.execute("EXEC sp_AllCourses_Select")
rows = cursor.fetchall()
courses = [{"course_id": row[0], "course_name": row[1]} for row in rows]

# =====================
# AI GENERATION
# =====================
for course in courses:
    CRS_ID = course["course_id"]
    COURSE_NAME = course["course_name"]

    print(f"\n Generating questions for: {COURSE_NAME}")

    prompt = PROMPT.format(
        course=COURSE_NAME,
        mcq=MCQ_COUNT,
        tf=TF_COUNT
    )

    # =====================
    # AI GENERATION
    # =====================
    try:
        response = openai.ChatCompletion.create(
            model="gpt-5-nano",
            messages=[{"role": "user", "content": prompt}]
        )

        content = response["choices"][0]["message"]["content"].strip()
        data = json.loads(content)

    except Exception as e:
        print(f" AI failed for {COURSE_NAME}:", e)
        continue

    # =====================
    # LOOP THROUGH QUESTIONS
    # =====================
    try:
        # ---- MCQ QUESTIONS ----
        for q in data.get("mcq", []):
            cursor.execute("""
                EXEC sp_Insert_AI_Question
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
                q["difficulty"],
                CRS_ID,
                q["choices"]["A"],
                q["choices"]["B"],
                q["choices"]["C"]
            )

        # ---- TRUE / FALSE QUESTIONS ----
        for q in data.get("tf", []):
            cursor.execute("""
                EXEC sp_Insert_AI_Question
                    @QText = ?,
                    @QType = 'TF',
                    @QAnswer = ?,
                    @Difficulty = ?,
                    @CrsId = ?
            """,
                q["question"],
                q["answer"],
                q["difficulty"],
                CRS_ID
            )

        conn.commit()
        print(f" Inserted questions for {COURSE_NAME}")

    except Exception as e:
        conn.rollback()
        print(f" Insert failed for {COURSE_NAME}:", e)


cursor.close()
conn.close()
print("\n All courses processed successfully!")