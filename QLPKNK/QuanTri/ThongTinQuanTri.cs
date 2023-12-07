using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QLPKNK.QuanTri
{
    public partial class ThongTinQuanTri : Form
    {
        string SĐT;
        public ThongTinQuanTri(string sdt)
        {
            InitializeComponent();
            SĐT = sdt;
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            DialogResult rs = MessageBox.Show("Bạn có muốn cập nhật hay không", "Thông báo", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question);
            if (rs == DialogResult.Yes)
            {
                try
                {

                    Functions.RunSQL("Update QUANTRI set HOTENQT = N'" + txtName.Text.ToString() + "', NGAYSINHQT = '" + txtNgaySinh.Text.ToString() + "', DIACHIQT = N'" + txtAddress.Text.ToString() + "', EMAILQT = N'" + txtEmail.Text.ToString() + "' where SDTQT = N'" + SĐT + "'");
                    MessageBox.Show("Cập nhật thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);

                }
                catch (Exception)
                {
                    MessageBox.Show("Cập nhật không thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Stop);

                }
            }
        }
        DataTable TT_QT;
        private void ThongTinQuanTri_Load(object sender, EventArgs e)
        {
            //Functions.Connect(Functions.get_ConnectString(1));
            string sql = "SELECT * FROM QuanTri WHERE SDTQT = " + "'" + SĐT + "'";
            TT_QT = Functions.GetDataToTable(sql);

            // Lấy dữ liệu từ bảng và gán vào các TextBox
            txtMans.Text = TT_QT.Rows[0][0].ToString();
            txtName.Text = TT_QT.Rows[0][1].ToString();
            txtNgaySinh.Text = TT_QT.Rows[0][2].ToString();
            txtAddress.Text = TT_QT.Rows[0][3].ToString();
            txtPhoneNumber.Text = TT_QT.Rows[0][4].ToString();
            txtEmail.Text = TT_QT.Rows[0][5].ToString();

        }
    }
}
