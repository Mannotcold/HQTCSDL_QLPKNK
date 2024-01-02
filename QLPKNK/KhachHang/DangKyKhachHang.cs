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
    public partial class DangKyKhachHang : Form
    {
        public DangKyKhachHang()
        {
            InitializeComponent();
        }

        private void btnsua_Click(object sender, EventArgs e)
        {
            Form form = new DangNhap();

            this.Hide();
            form.ShowDialog();
            this.Close();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            Functions.Connect("Data Source =.; Initial Catalog = DOANHQTCSDL; Integrated Security = True");
            string HoTenKH = textBox1.Text;
            //int SDT = int.Parse(username);
            string NgaySinhKH = dateTimePicker1.Text;
            string DiaChiKH = textBox5.Text;
            string SDTKH = textBox2.Text;
            string MatKhau = textBox3.Text;
            string EmailKH = textBox4.Text;
            DialogResult rs = MessageBox.Show("Bạn có muốn đăng ký tài khoản hay không", "Thông báo", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question);
            if (rs == DialogResult.Yes)
            {
                try
                {
                    Functions.RunSQL("insert into KHACHHANG(HoTenKH,NgaySinhKH,DiaChiKH,SDTKH,MatKhau,EmailKH) VALUES (" + HoTenKH + " ,'" + NgaySinhKH + "','" + DiaChiKH + "','" + SDTKH + "','" + MatKhau + "','" + EmailKH + "')");
                    Functions.RunSQL("EXEC sp_addlogin " + SDTKH + " ,'" + MatKhau + "', 'DOANHQT' ");
                    Functions.RunSQL("CREATE USER [" + SDTKH + "] FOR LOGIN [" + SDTKH + "]");
                    Functions.RunSQL("EXEC sp_addrolemember 'BENHNHANROLE', [" + SDTKH + "];");

                }
                catch (Exception)
                {
                    MessageBox.Show("Đăng ký không thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Stop);

                }
            }
        }

 
    }
}
