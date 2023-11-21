using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using QLPKNK;

namespace QLPKNK
{
    public partial class DangKy : Form
    {
        public DangKy()
        {
            InitializeComponent();
        }

        private void back_Click(object sender, EventArgs e)
        {
            Form form = new DangNhap();

            this.Hide();
            form.ShowDialog();
            this.Close();
        }



        private void button1_Click(object sender, EventArgs e)
        {
            Functions.Connect("Data Source =.; Initial Catalog = DOANHQT; Integrated Security = True");
            string username = textBox1.Text;
            //int SDT = int.Parse(username);
            string password = textBox3.Text;
            DialogResult rs = MessageBox.Show("Bạn có muốn đăng ký tài khoản hay không", "Thông báo", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question);
            if (rs == DialogResult.Yes)
            {
                try
                {

                    Functions.RunSQL("insert into TAIKHOAN(SDT,MATKHAU,LoaiTK) VALUES ("+ username + " ,'" + password + "','3')");
                    Functions.RunSQL("EXEC sp_addlogin " + username + " ,'" + password + "', 'DOANHQT' ");
                    Functions.RunSQL("CREATE USER [" + username + "] FOR LOGIN [" + username + "]");
                    Functions.RunSQL("EXEC sp_addrolemember 'BENHNHANROLE', [" + username + "];");
                    MessageBox.Show("Đăng ký thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);

                }
                catch (Exception)
                {
                    MessageBox.Show("Đăng ký không thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Stop);

                }
            }
        }
    }
}
