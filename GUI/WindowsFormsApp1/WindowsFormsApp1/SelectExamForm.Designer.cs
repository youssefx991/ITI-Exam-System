namespace WindowsFormsApp1
{
    partial class SelectExamForm
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
            this.button1 = new System.Windows.Forms.Button();
            this.crs_lbl = new System.Windows.Forms.Label();
            this.gen_exam_btn = new System.Windows.Forms.Button();
            this.crs_cb = new System.Windows.Forms.ComboBox();
            this.stname_tb = new System.Windows.Forms.TextBox();
            this.stemail_tb = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(268, 451);
            this.button1.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(204, 35);
            this.button1.TabIndex = 2;
            this.button1.Text = "Back to main";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // crs_lbl
            // 
            this.crs_lbl.AutoSize = true;
            this.crs_lbl.Location = new System.Drawing.Point(1, 206);
            this.crs_lbl.Name = "crs_lbl";
            this.crs_lbl.Size = new System.Drawing.Size(119, 20);
            this.crs_lbl.TabIndex = 4;
            this.crs_lbl.Text = "Choose Course";
            // 
            // gen_exam_btn
            // 
            this.gen_exam_btn.Location = new System.Drawing.Point(268, 384);
            this.gen_exam_btn.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.gen_exam_btn.Name = "gen_exam_btn";
            this.gen_exam_btn.Size = new System.Drawing.Size(204, 35);
            this.gen_exam_btn.TabIndex = 5;
            this.gen_exam_btn.Text = "Generate Exam";
            this.gen_exam_btn.UseVisualStyleBackColor = true;
            this.gen_exam_btn.Click += new System.EventHandler(this.gen_exam_btn_Click);
            // 
            // crs_cb
            // 
            this.crs_cb.FormattingEnabled = true;
            this.crs_cb.Location = new System.Drawing.Point(181, 203);
            this.crs_cb.Name = "crs_cb";
            this.crs_cb.Size = new System.Drawing.Size(549, 28);
            this.crs_cb.TabIndex = 7;
            // 
            // stname_tb
            // 
            this.stname_tb.Location = new System.Drawing.Point(181, 67);
            this.stname_tb.Name = "stname_tb";
            this.stname_tb.Size = new System.Drawing.Size(549, 26);
            this.stname_tb.TabIndex = 9;
            // 
            // stemail_tb
            // 
            this.stemail_tb.Location = new System.Drawing.Point(181, 142);
            this.stemail_tb.Name = "stemail_tb";
            this.stemail_tb.Size = new System.Drawing.Size(549, 26);
            this.stemail_tb.TabIndex = 10;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(1, 70);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(150, 20);
            this.label1.TabIndex = 11;
            this.label1.Text = "Enter Sudent Name";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(1, 142);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(147, 20);
            this.label2.TabIndex = 12;
            this.label2.Text = "Enter Sudent Email";
            // 
            // SelectExamForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(778, 544);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.stemail_tb);
            this.Controls.Add(this.stname_tb);
            this.Controls.Add(this.crs_cb);
            this.Controls.Add(this.gen_exam_btn);
            this.Controls.Add(this.crs_lbl);
            this.Controls.Add(this.button1);
            this.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.Name = "SelectExamForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "SelectExamForm";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.SelectExamForm_FormClosing);
            this.Load += new System.EventHandler(this.SelectExamForm_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Label crs_lbl;
        private System.Windows.Forms.Button gen_exam_btn;
        private System.Windows.Forms.ComboBox crs_cb;
        private System.Windows.Forms.TextBox stname_tb;
        private System.Windows.Forms.TextBox stemail_tb;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
    }
}