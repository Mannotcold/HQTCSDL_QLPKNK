using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QLPKNK.KhachHang
{
    public partial class FormKhachHangChung : Form
    {

        string SĐT;
        public FormKhachHangChung(string sdt)
        {
            InitializeComponent();
            SĐT = sdt;
        }

        private void btnStatistic_Click(object sender, EventArgs e)
        {
            Form form = new DatLichHen(SĐT);

            this.Hide();
            form.ShowDialog();
            this.Close();
        }

        private void btnLogout_Click(object sender, EventArgs e)
        {
            Form form = new DangNhap();
            this.Hide();
            form.ShowDialog();
            this.Close();
        }

        private void btnAccount_Click(object sender, EventArgs e)
        {
            Form form = new XemThongTinCaNhan(SĐT);
            this.Hide();
            form.ShowDialog();
            this.Close();
        }
    }
}
