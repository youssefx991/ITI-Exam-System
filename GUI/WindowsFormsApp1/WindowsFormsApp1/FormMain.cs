using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace WindowsFormsApp1
{
    public partial class FormMain : Form
    {
        SelectExamForm selectExamForm;
        SelectReportForm selectReportForm;

        string connectionString =
        @"Server=.\SQLEXPRESS;Database=ITI_ExamSystem;Trusted_Connection=True;";
        public FormMain()
        {
            InitializeComponent();

            selectExamForm = new SelectExamForm();
            selectReportForm = new SelectReportForm();

            selectExamForm.Owner = this;
            selectReportForm.Owner = this;
        }

        

        private void takeExam_btn_Click(object sender, EventArgs e)
        {
            selectExamForm.Show();
            selectExamForm.BringToFront();
            this.Hide();
        }

        private void reports_btn_Click(object sender, EventArgs e)
        {
            selectReportForm.Show();
            selectReportForm.BringToFront();
            this.Hide();
        }

        private void FormMain_FormClosing(object sender, FormClosingEventArgs e)
        {
            Application.Exit();
        }

        private void FormMain_Load(object sender, EventArgs e)
        {
            
        }
    }
}
