using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApp1
{
    public partial class ExamSolveForm : Form
    {
        int examId;
        int studentId;

        int currentIndex = 0;

        string connectionString =
            @"Server=.\SQLEXPRESS;Database=ITI_ExamSystem;Trusted_Connection=True;";

        List<ExamQuestion> questions = new List<ExamQuestion>();
        Dictionary<int, string> answers = new Dictionary<int, string>();


        public ExamSolveForm(int examId, int studentId)
        {
            InitializeComponent();

            this.examId = examId; // For testing purposes
            this.studentId = studentId; // For testing purposes


            LoadExamQuestions();

            if (questions.Count == 0)
            {
                MessageBox.Show("No questions found for this exam.");
                this.Close();
                return;
            }

            DisplayQuestion();
        }
        private void LoadExamQuestions()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(@"
        SELECT q.QId, q.QText, q.QType
        FROM Exam_Question eq
        JOIN Question q ON eq.QId = q.QId
        WHERE eq.ExId = @ExamID
        ORDER BY eq.QOrder", con))
            {
                cmd.Parameters.AddWithValue("@ExamID", examId);
                con.Open();

                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    var q = new ExamQuestion
                    {
                        QuestionId = (int)rdr["QId"],
                        QuestionText = rdr["QText"].ToString(),
                        QuestionType = rdr["QType"].ToString()
                    };

                    questions.Add(q);
                }
            }

            // Load choices for MCQ questions only
            foreach (var q in questions)
            {
                if (q.QuestionType == "MCQ")
                    LoadChoicesForQuestion(q);
            }
        }

        void LoadChoicesForQuestion(ExamQuestion q)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(
                "SELECT ChoiceLabel, ChoiceText FROM Choice WHERE QId = @QId", con))
            {
                cmd.Parameters.AddWithValue("@QId", q.QuestionId);
                con.Open();

                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    q.Choices.Add(
                        rdr["ChoiceLabel"].ToString(),
                        rdr["ChoiceText"].ToString()
                    );
                }
            }
        }

        void DisplayQuestion()
        {
            progress_lbl.Text =
    $"Question {currentIndex + 1} of {questions.Count}";

            var q = questions[currentIndex];

            QText_lbl.Text = q.QuestionText;

            ClearSelection();

            if (q.QuestionType == "MCQ")
            {
                A_rb.Text = q.Choices["A"];
                B_rb.Text = q.Choices["B"];
                C_rb.Text = q.Choices["C"];

                A_rb.Visible = B_rb.Visible = C_rb.Visible = true;

            }
            else // TF
            {
                A_rb.Text = "True";
                B_rb.Text = "False";

                A_rb.Visible = B_rb.Visible = true;
                C_rb.Visible = false;
            }

            RestoreAnswerIfExists(q.QuestionId);
        }

        private void SaveAnswer()
        {
            var q = questions[currentIndex];

            if (q.QuestionType == "MCQ")
            {
                if (A_rb.Checked) answers[q.QuestionId] = "A";
                else if (B_rb.Checked) answers[q.QuestionId] = "B";
                else if (C_rb.Checked) answers[q.QuestionId] = "C";
            }
            else // TF
            {
                if (A_rb.Checked) answers[q.QuestionId] = "T"; // True
                else if (B_rb.Checked) answers[q.QuestionId] = "F"; // False
            }
        }

        private void RestoreAnswerIfExists(int qid)
        {
            if (!answers.ContainsKey(qid)) return;

            string ans = answers[qid];
            var q = questions[currentIndex];

            if (q.QuestionType == "MCQ")
            {
                A_rb.Checked = ans == "A";
                B_rb.Checked = ans == "B";
                C_rb.Checked = ans == "C";
            }
            else // TF
            {
                A_rb.Checked = ans == "T";
                B_rb.Checked = ans == "F";
            }
        }

        private void ClearSelection()
        {
            A_rb.Checked = B_rb.Checked = C_rb.Checked = false;
        }


        // load
        private void ExamSolveForm_Load(object sender, EventArgs e)
        {

        }

        private void ExamSolveForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            Application.Exit();
        }

        private void next_btn_Click(object sender, EventArgs e)
        {
            SaveAnswer();

            if (currentIndex < questions.Count - 1)
            {
                currentIndex++;
                DisplayQuestion();
            }
        }

        private void prev_btn_Click(object sender, EventArgs e)
        {
            SaveAnswer();

            if (currentIndex > 0)
            {
                currentIndex--;
                DisplayQuestion();
            }
        }

        private void submit_btn_Click(object sender, EventArgs e)
        {
            SaveAnswer();

            if (answers.Count != questions.Count)
            {
                MessageBox.Show("Please answer all questions.");
                return;
            }

            try
            {
                char[] ans = BuildAnswerArray();
                SubmitAnswersToDatabase(ans);

                float finalGrade = CorrectExamAndGetGrade();

                MessageBox.Show($"Exam submitted successfully.\nFinal Grade: {finalGrade:F2}%");

                this.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }

        private void SubmitAnswersToDatabase(char[] ans)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand("sp_Exam_Answers", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@ExId", examId);
                cmd.Parameters.AddWithValue("@StudentName", GetStudentName());

                cmd.Parameters.AddWithValue("@Ans1", ans[0]);
                cmd.Parameters.AddWithValue("@Ans2", ans[1]);
                cmd.Parameters.AddWithValue("@Ans3", ans[2]);
                cmd.Parameters.AddWithValue("@Ans4", ans[3]);
                cmd.Parameters.AddWithValue("@Ans5", ans[4]);
                cmd.Parameters.AddWithValue("@Ans6", ans[5]);
                cmd.Parameters.AddWithValue("@Ans7", ans[6]);
                cmd.Parameters.AddWithValue("@Ans8", ans[7]);
                cmd.Parameters.AddWithValue("@Ans9", ans[8]);
                cmd.Parameters.AddWithValue("@Ans10", ans[9]);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        private string GetStudentName()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd =
                new SqlCommand("SELECT StName FROM Student WHERE StId=@Id", con))
            {
                cmd.Parameters.AddWithValue("@Id", studentId);
                con.Open();
                return cmd.ExecuteScalar().ToString();
            }
        }

        private char[] BuildAnswerArray()
        {
            char[] result = new char[10];

            for (int i = 0; i < 10; i++)
            {
                int qId = questions[i].QuestionId;

                if (!answers.ContainsKey(qId))
                    throw new Exception("All questions must be answered.");

                result[i] = answers[qId][0]; // 'A', 'B', 'C', 'T', 'F'
            }

            return result;
        }

        private float CorrectExamAndGetGrade()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand("sp_Exam_Correction", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@ExId", examId);
                cmd.Parameters.AddWithValue("@StudentName", GetStudentName());

                con.Open();

                object result = cmd.ExecuteScalar();
                return Convert.ToSingle(result);
            }
        }


    }

    class ExamQuestion
    {
        public int QuestionId;
        public string QuestionText;
        public string QuestionType;
        public Dictionary<string, string> Choices = new Dictionary<string, string>();
    }

}
