using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;


namespace WindowsFormsApp1
{
    public partial class SelectExamForm : Form
    {
        ExamSolveForm examSolveForm;
        int generatedExamID;
        string connectionString =
        @"Server=.\SQLEXPRESS;Database=ITI_ExamSystem;Trusted_Connection=True;";
        public SelectExamForm()
        {
            InitializeComponent();
            //LoadStudents();
            LoadCourses();

       

        }

        // load
        private void SelectExamForm_Load(object sender, EventArgs e)
        {
        }
        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            this.Owner.Show();
            this.Owner.BringToFront();
        }

        private void LoadCourses()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand("sp_Courses_SelectAll", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

                crs_cb.DataSource = dt;
                crs_cb.DisplayMember = "CrsName";
                crs_cb.ValueMember = "CrsId";
            }
        }


        


        private int GetStudentId()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand("sp_Student_SelectByNameEmail", con)) 
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@StName", stname_tb.Text.Trim());
                cmd.Parameters.AddWithValue("@StEmail", stemail_tb.Text.Trim());

                con.Open();

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        return reader.GetInt32(reader.GetOrdinal("StId"));
                    }
                    else
                    {
                        throw new Exception("Student not found.");
                    }
                }
            }
        }


        private void SelectExamForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            Application.Exit();
        }

        private void RegisterStudentInExam(int studentId, int examId)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand("sp_Student_Exam_Insert", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@StId", studentId);
                cmd.Parameters.AddWithValue("@ExId", examId);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        private void gen_exam_btn_Click(object sender, EventArgs e)
        {
            int generatedExamId;
            int selectedStudentId;

            try
            {
                selectedStudentId = GetStudentId();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message);
                return;
            }
            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand("sp_Exam_Generation", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@CourseName", crs_cb.Text);
                cmd.Parameters.AddWithValue("@NumTF", 5);
                cmd.Parameters.AddWithValue("@NumMC", 5);

                SqlParameter examIdParam = new SqlParameter
                {
                    ParameterName = "@ExamID",
                    SqlDbType = SqlDbType.Int,
                    Direction = ParameterDirection.Output
                };
                cmd.Parameters.Add(examIdParam);

                con.Open();
                cmd.ExecuteNonQuery();

                generatedExamId = (int)examIdParam.Value;
            }

            RegisterStudentInExam(selectedStudentId, generatedExamId);
            // OPEN EXAM SOLVING FORM
            ExamSolveForm examForm =
                new ExamSolveForm(generatedExamId, selectedStudentId);

            examForm.Show();
            this.Hide();
        }

        
    }
}
