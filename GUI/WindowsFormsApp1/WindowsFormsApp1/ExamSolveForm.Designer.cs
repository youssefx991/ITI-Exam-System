namespace WindowsFormsApp1
{
    partial class ExamSolveForm
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
            this.progress_lbl = new System.Windows.Forms.Label();
            this.QText_lbl = new System.Windows.Forms.Label();
            this.choices_gb = new System.Windows.Forms.GroupBox();
            this.C_rb = new System.Windows.Forms.RadioButton();
            this.B_rb = new System.Windows.Forms.RadioButton();
            this.A_rb = new System.Windows.Forms.RadioButton();
            this.prev_btn = new System.Windows.Forms.Button();
            this.submit_btn = new System.Windows.Forms.Button();
            this.next_btn = new System.Windows.Forms.Button();
            this.choices_gb.SuspendLayout();
            this.SuspendLayout();
            // 
            // progress_lbl
            // 
            this.progress_lbl.AutoSize = true;
            this.progress_lbl.Location = new System.Drawing.Point(311, 22);
            this.progress_lbl.Name = "progress_lbl";
            this.progress_lbl.Size = new System.Drawing.Size(72, 20);
            this.progress_lbl.TabIndex = 0;
            this.progress_lbl.Text = "Progress";
            // 
            // QText_lbl
            // 
            this.QText_lbl.AutoSize = true;
            this.QText_lbl.Location = new System.Drawing.Point(47, 94);
            this.QText_lbl.Name = "QText_lbl";
            this.QText_lbl.Size = new System.Drawing.Size(107, 20);
            this.QText_lbl.TabIndex = 1;
            this.QText_lbl.Text = "Question Text";
            // 
            // choices_gb
            // 
            this.choices_gb.Controls.Add(this.C_rb);
            this.choices_gb.Controls.Add(this.B_rb);
            this.choices_gb.Controls.Add(this.A_rb);
            this.choices_gb.Location = new System.Drawing.Point(44, 153);
            this.choices_gb.Name = "choices_gb";
            this.choices_gb.Size = new System.Drawing.Size(722, 197);
            this.choices_gb.TabIndex = 2;
            this.choices_gb.TabStop = false;
            this.choices_gb.Text = "Choose the correct answer";
            // 
            // C_rb
            // 
            this.C_rb.AutoSize = true;
            this.C_rb.Location = new System.Drawing.Point(7, 135);
            this.C_rb.Name = "C_rb";
            this.C_rb.Size = new System.Drawing.Size(126, 24);
            this.C_rb.TabIndex = 2;
            this.C_rb.TabStop = true;
            this.C_rb.Text = "radioButton3";
            this.C_rb.UseVisualStyleBackColor = true;
            // 
            // B_rb
            // 
            this.B_rb.AutoSize = true;
            this.B_rb.Location = new System.Drawing.Point(7, 90);
            this.B_rb.Name = "B_rb";
            this.B_rb.Size = new System.Drawing.Size(126, 24);
            this.B_rb.TabIndex = 1;
            this.B_rb.TabStop = true;
            this.B_rb.Text = "radioButton2";
            this.B_rb.UseVisualStyleBackColor = true;
            // 
            // A_rb
            // 
            this.A_rb.AutoSize = true;
            this.A_rb.Location = new System.Drawing.Point(7, 43);
            this.A_rb.Name = "A_rb";
            this.A_rb.Size = new System.Drawing.Size(126, 24);
            this.A_rb.TabIndex = 0;
            this.A_rb.TabStop = true;
            this.A_rb.Text = "radioButton1";
            this.A_rb.UseVisualStyleBackColor = true;
            // 
            // prev_btn
            // 
            this.prev_btn.Location = new System.Drawing.Point(28, 389);
            this.prev_btn.Name = "prev_btn";
            this.prev_btn.Size = new System.Drawing.Size(149, 49);
            this.prev_btn.TabIndex = 3;
            this.prev_btn.Text = "Previous Question";
            this.prev_btn.UseVisualStyleBackColor = true;
            this.prev_btn.Click += new System.EventHandler(this.prev_btn_Click);
            // 
            // submit_btn
            // 
            this.submit_btn.Location = new System.Drawing.Point(315, 389);
            this.submit_btn.Name = "submit_btn";
            this.submit_btn.Size = new System.Drawing.Size(149, 49);
            this.submit_btn.TabIndex = 4;
            this.submit_btn.Text = "Submit Exam";
            this.submit_btn.UseVisualStyleBackColor = true;
            this.submit_btn.Click += new System.EventHandler(this.submit_btn_Click);
            // 
            // next_btn
            // 
            this.next_btn.Location = new System.Drawing.Point(617, 389);
            this.next_btn.Name = "next_btn";
            this.next_btn.Size = new System.Drawing.Size(149, 49);
            this.next_btn.TabIndex = 5;
            this.next_btn.Text = "Next Question";
            this.next_btn.UseVisualStyleBackColor = true;
            this.next_btn.Click += new System.EventHandler(this.next_btn_Click);
            // 
            // ExamSolveForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.next_btn);
            this.Controls.Add(this.submit_btn);
            this.Controls.Add(this.prev_btn);
            this.Controls.Add(this.choices_gb);
            this.Controls.Add(this.QText_lbl);
            this.Controls.Add(this.progress_lbl);
            this.Name = "ExamSolveForm";
            this.Text = "ExamSolveForm";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.ExamSolveForm_FormClosing);
            this.Load += new System.EventHandler(this.ExamSolveForm_Load);
            this.choices_gb.ResumeLayout(false);
            this.choices_gb.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label progress_lbl;
        private System.Windows.Forms.Label QText_lbl;
        private System.Windows.Forms.GroupBox choices_gb;
        private System.Windows.Forms.RadioButton C_rb;
        private System.Windows.Forms.RadioButton B_rb;
        private System.Windows.Forms.RadioButton A_rb;
        private System.Windows.Forms.Button prev_btn;
        private System.Windows.Forms.Button submit_btn;
        private System.Windows.Forms.Button next_btn;
    }
}