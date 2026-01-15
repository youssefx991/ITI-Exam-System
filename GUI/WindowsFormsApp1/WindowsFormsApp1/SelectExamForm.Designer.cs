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
            this.st_lbl = new System.Windows.Forms.Label();
            this.crs_lbl = new System.Windows.Forms.Label();
            this.gen_exam_btn = new System.Windows.Forms.Button();
            this.st_cb = new System.Windows.Forms.ComboBox();
            this.crs_cb = new System.Windows.Forms.ComboBox();
            this.exid_lbl = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(465, 486);
            this.button1.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(204, 35);
            this.button1.TabIndex = 2;
            this.button1.Text = "Back to main";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // st_lbl
            // 
            this.st_lbl.AutoSize = true;
            this.st_lbl.Location = new System.Drawing.Point(422, 230);
            this.st_lbl.Name = "st_lbl";
            this.st_lbl.Size = new System.Drawing.Size(125, 20);
            this.st_lbl.TabIndex = 3;
            this.st_lbl.Text = "Choose Student";
            // 
            // crs_lbl
            // 
            this.crs_lbl.AutoSize = true;
            this.crs_lbl.Location = new System.Drawing.Point(422, 335);
            this.crs_lbl.Name = "crs_lbl";
            this.crs_lbl.Size = new System.Drawing.Size(119, 20);
            this.crs_lbl.TabIndex = 4;
            this.crs_lbl.Text = "Choose Course";
            // 
            // gen_exam_btn
            // 
            this.gen_exam_btn.Location = new System.Drawing.Point(465, 419);
            this.gen_exam_btn.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.gen_exam_btn.Name = "gen_exam_btn";
            this.gen_exam_btn.Size = new System.Drawing.Size(204, 35);
            this.gen_exam_btn.TabIndex = 5;
            this.gen_exam_btn.Text = "Generate Exam";
            this.gen_exam_btn.UseVisualStyleBackColor = true;
            this.gen_exam_btn.Click += new System.EventHandler(this.gen_exam_btn_Click);
            // 
            // st_cb
            // 
            this.st_cb.FormattingEnabled = true;
            this.st_cb.Location = new System.Drawing.Point(564, 227);
            this.st_cb.Name = "st_cb";
            this.st_cb.Size = new System.Drawing.Size(603, 28);
            this.st_cb.TabIndex = 6;
            // 
            // crs_cb
            // 
            this.crs_cb.FormattingEnabled = true;
            this.crs_cb.Location = new System.Drawing.Point(564, 332);
            this.crs_cb.Name = "crs_cb";
            this.crs_cb.Size = new System.Drawing.Size(603, 28);
            this.crs_cb.TabIndex = 7;
            // 
            // exid_lbl
            // 
            this.exid_lbl.AutoSize = true;
            this.exid_lbl.Location = new System.Drawing.Point(560, 606);
            this.exid_lbl.Name = "exid_lbl";
            this.exid_lbl.Size = new System.Drawing.Size(79, 20);
            this.exid_lbl.TabIndex = 8;
            this.exid_lbl.Text = "exid_label";
            // 
            // SelectExamForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1200, 692);
            this.Controls.Add(this.exid_lbl);
            this.Controls.Add(this.crs_cb);
            this.Controls.Add(this.st_cb);
            this.Controls.Add(this.gen_exam_btn);
            this.Controls.Add(this.crs_lbl);
            this.Controls.Add(this.st_lbl);
            this.Controls.Add(this.button1);
            this.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.Name = "SelectExamForm";
            this.Text = "SelectExamForm";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.SelectExamForm_FormClosing);
            this.Load += new System.EventHandler(this.SelectExamForm_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Label st_lbl;
        private System.Windows.Forms.Label crs_lbl;
        private System.Windows.Forms.Button gen_exam_btn;
        private System.Windows.Forms.ComboBox st_cb;
        private System.Windows.Forms.ComboBox crs_cb;
        private System.Windows.Forms.Label exid_lbl;
    }
}