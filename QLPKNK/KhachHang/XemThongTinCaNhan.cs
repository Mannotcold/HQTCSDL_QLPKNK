using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml.Linq;

namespace QLPKNK.KhachHang
{
    public partial class XemThongTinCaNhan : Form
    {
        string SĐT;
        DataTable TT_KhachHang;
        public XemThongTinCaNhan(string sdt)
        {
            InitializeComponent();
            SĐT = sdt;
        }
        public XemThongTinCaNhan()
        {
            InitializeComponent();
            
        }
        private void XemThongTinCaNhan_Load(object sender, EventArgs e)
        {
            //Functions.Connect(Functions.get_ConnectString(1));
            string sql = "SELECT * FROM KHACHHANG WHERE SDTKH = " + "'" + SĐT + "'";
            TT_KhachHang = Functions.GetDataToTable(sql);

            // Lấy dữ liệu từ bảng và gán vào các TextBox
            HoTenKhachHang.Text = TT_KhachHang.Rows[0][1].ToString();
            SDTKH.Text = TT_KhachHang.Rows[0][4].ToString();
            NgaySinh.Text = TT_KhachHang.Rows[0][2].ToString();
            EmailKH.Text = TT_KhachHang.Rows[0][5].ToString();
            DiaChiKH.Text = TT_KhachHang.Rows[0][3].ToString();
            
        }

        private void guna2GradientButton1_Click(object sender, EventArgs e)
        {
            DialogResult rs = MessageBox.Show("Bạn có muốn cập nhật hay không", "Thông báo", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question);
            if (rs == DialogResult.Yes)
            {
                try
                {

                    Functions.RunSQL("Update KHACHHANG set HoTenKH = N'" + HoTenKhachHang.Text.ToString() + "', NgaySinhKH = '" + NgaySinh.Text.ToString() + "', DiaChiKH = N'" + DiaChiKH.Text.ToString() + "', EmailKH = N'" + EmailKH.Text.ToString() + "' where SDTKH = N'" + SĐT + "'");
                    MessageBox.Show("Cập nhật thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);

                }
                catch (Exception)
                {
                    MessageBox.Show("Cập nhật không thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Stop);

                }
            }
        }

        private void guna2GradientButton2_Click(object sender, EventArgs e)
        {

        }
    }
}
