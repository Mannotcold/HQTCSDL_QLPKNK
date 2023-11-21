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
    public partial class ThongtinUser : Form
    {
        string SĐT;
        DataTable TT_NhaSi;
        public ThongtinUser(string sdt)
        {
            InitializeComponent();
            SĐT = sdt;
        }

        private void ThongtinUser_Load(object sender, EventArgs e)
        {
            //Functions.Connect(Functions.get_ConnectString(1));
            string sql = "SELECT * FROM NHASI WHERE SDTNS = " + "'" + SĐT + "'";
            TT_NhaSi = Functions.GetDataToTable(sql);

            // Lấy dữ liệu từ bảng và gán vào các TextBox
            txtMans.Text = TT_NhaSi.Rows[0][0].ToString();
            txtName.Text = TT_NhaSi.Rows[0][1].ToString();
            txtNgaySinh.Text = TT_NhaSi.Rows[0][2].ToString();
            txtAddress.Text = TT_NhaSi.Rows[0][3].ToString();
            txtPhoneNumber.Text = TT_NhaSi.Rows[0][4].ToString();
            txtEmail.Text = TT_NhaSi.Rows[0][5].ToString();

        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            DialogResult rs = MessageBox.Show("Bạn có muốn cập nhật hay không", "Thông báo", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question);
            if (rs == DialogResult.Yes)
            {
                try
                {

                    Functions.RunSQL("Update NHASI set HOTENNS = N'" + txtName.Text.ToString() + "', NGAYSINHNS = '" + txtNgaySinh.Text.ToString() + "', DIACHINS = N'" + txtAddress.Text.ToString() + "', EMAILNS = N'" + txtEmail.Text.ToString() + "' where SDTNS = N'" + SĐT + "'");
                    MessageBox.Show("Cập nhật thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);

                }
                catch (Exception)
                {
                    MessageBox.Show("Cập nhật không thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Stop);

                }
            }
        }

        private void btnChangePassword_Click(object sender, EventArgs e)
        {
            if (txtNewPassword.Text.ToString() == txtRepeatPassword.Text.ToString())
            {
                DialogResult rs = MessageBox.Show("Bạn có muốn thay đổi mật khẩu hay không", "Thông báo", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question);
                if (rs == DialogResult.Yes)
                {
                    try
                    {

                        Functions.RunSQL("Update TAIKHOAN set MatKhau = '" + txtNewPassword.Text.ToString() + "' where SDTNS = N'" + SĐT + "'");
                        

                    }
                    catch (Exception)
                    {
                        MessageBox.Show("Cập nhật không thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Stop);

                    }
                }
            }
            else
            {
                MessageBox.Show("Mật khẩu nhập lại không trùng với mật khẩu mới!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Stop);
            }
        }
    }
}
