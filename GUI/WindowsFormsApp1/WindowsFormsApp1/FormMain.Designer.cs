namespace WindowsFormsApp1
{
    partial class FormMain
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.reports_btn = new System.Windows.Forms.Button();
            this.takeExam_btn = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // reports_btn
            // 
            this.reports_btn.Location = new System.Drawing.Point(387, 163);
            this.reports_btn.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.reports_btn.Name = "reports_btn";
            this.reports_btn.Size = new System.Drawing.Size(326, 175);
            this.reports_btn.TabIndex = 1;
            this.reports_btn.Text = "Reports";
            this.reports_btn.UseVisualStyleBackColor = true;
            this.reports_btn.Click += new System.EventHandler(this.reports_btn_Click);
            // 
            // takeExam_btn
            // 
            this.takeExam_btn.Location = new System.Drawing.Point(34, 163);
            this.takeExam_btn.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.takeExam_btn.Name = "takeExam_btn";
            this.takeExam_btn.Size = new System.Drawing.Size(326, 175);
            this.takeExam_btn.TabIndex = 2;
            this.takeExam_btn.Text = "Take Exam";
            this.takeExam_btn.UseVisualStyleBackColor = true;
            this.takeExam_btn.Click += new System.EventHandler(this.takeExam_btn_Click);
            // 
            // FormMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 449);
            this.Controls.Add(this.takeExam_btn);
            this.Controls.Add(this.reports_btn);
            this.Name = "FormMain";
            this.Text = "Form1";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FormMain_FormClosing);
            this.Load += new System.EventHandler(this.FormMain_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button reports_btn;
        private System.Windows.Forms.Button takeExam_btn;
    }
}

