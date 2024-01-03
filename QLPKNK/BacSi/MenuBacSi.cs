using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QLPKNK
{
    public partial class MenuBacSi : Form
    {
        string SĐT;
        string Ma;
        public MenuBacSi(string sdt, string ma)
        {
            InitializeComponent();
            SĐT = sdt;
            Ma = ma;
        }


        // mở 1 form con
        private Form activeform = null;

        private void openChildForm(Form childForm)
        {
            if (activeform != null)
            {
                activeform.Close();
            }

            activeform = childForm;
            childForm.TopLevel = false;
            childForm.FormBorderStyle = FormBorderStyle.None;
            childForm.Dock = DockStyle.Fill;

            guna2Panel3.Controls.Clear(); // Xóa tất cả các controls hiện tại trong panel trước khi thêm form con mới
            guna2Panel3.Controls.Add(childForm);
            guna2Panel3.Tag = childForm;
            childForm.BringToFront();
            childForm.Show();
        }

        private void MenuBacSi_Load(object sender, EventArgs e)
        {
            
        }

        private void btnStatistic_Click(object sender, EventArgs e)
        {
            openChildForm(new QLHoSoBN(Ma));

        }

        private void btnAccount_Click(object sender, EventArgs e)
        {
            openChildForm(new ThongtinUser(SĐT));
        }

        private void guna2GradientButton1_Click(object sender, EventArgs e)
        {
            openChildForm(new AddHoSoBN(Ma));
        }

        private void guna2GradientButton2_Click(object sender, EventArgs e)
        {
            openChildForm(new QLLichHenCaNhan(Ma));
            
        }

        private void btnLogout_Click(object sender, EventArgs e)
        {
            Form form = new DangNhap();
            this.Hide();
            form.ShowDialog();
            this.Close();
        }

        private void guna2Panel3_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
