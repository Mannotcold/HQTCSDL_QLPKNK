using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using QLPKNK.QuanTri;

namespace QLPKNK.QuanTri
{
    public partial class MenuAdmin : Form
    {

        string SĐT;
        string Ma;
       
        public MenuAdmin(string sdt, string ma)
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

            guna2Panel1.Controls.Clear(); // Xóa tất cả các controls hiện tại trong panel trước khi thêm form con mới
            guna2Panel1.Controls.Add(childForm);
            guna2Panel1.Tag = childForm;
            childForm.BringToFront();
            childForm.Show();
        }

        private void btnStatistic_Click(object sender, EventArgs e)
        {

        }

        

        private void btnAccount_Click(object sender, EventArgs e)
        {
            openChildForm(new ThongTinQuanTri(SĐT));
        }

        private void guna2GradientButton5_Click(object sender, EventArgs e)
        {
            openChildForm(new QLDichVu());
        }

        private void guna2GradientButton3_Click(object sender, EventArgs e)
        {
            openChildForm(new QLThuoc(Ma));
        }

        private void guna2Panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void guna2GradientButton1_Click(object sender, EventArgs e)
        {
            openChildForm(new QuanLyTaiKhoan(Ma));
        }

        private void btnLogout_Click(object sender, EventArgs e)
        {
            Form form = new DangNhap();
            this.Hide();
            form.ShowDialog();
            this.Close();
        }
    }
}
