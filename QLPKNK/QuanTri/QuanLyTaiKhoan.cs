using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QLPKNK.QuanTri
{
    public partial class QuanLyTaiKhoan : Form
    {
        public QuanLyTaiKhoan()
        {
            InitializeComponent();
        }
        string str = "Data Source=DESKTOP-6IATTTJ;Initial Catalog=DOANHQT;Integrated Security=True";
        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void themtk_qt_Click(object sender, EventArgs e)
        {

            using (SqlConnection connection = new SqlConnection(str))
            {
                if(txtBox_tendangnhap_DSTK.Text != "" && txtBox_matkhau_DSTK.Text != "" && txtBox_loaitaikhoan_DSTK.Text != "")
                {
                    connection.Open();
                    SqlCommand cmd = new SqlCommand("insert into TaiKhoan values ('" + txtBox_tendangnhap_DSTK.Text + "','" + txtBox_matkhau_DSTK.Text + "'," + txtBox_loaitaikhoan_DSTK.Text + ")", connection);
                    SqlDataReader reader = cmd.ExecuteReader();
                    MessageBox.Show("Thêm thành công");
                    connection.Close();
                }
                else
                {
                    MessageBox.Show("Điền đầy đủ thông tin");
                }
            }
        }

        private void xoatk_qt_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(str))
            {
                if(txtBox_tendangnhap_DSTK.Text != "")
                {
                    connection.Open();
                    SqlCommand cmd = new SqlCommand("delete from TaiKhoan where SDT = '" + txtBox_tendangnhap_DSTK.Text + "'", connection);
                    SqlDataReader reader = cmd.ExecuteReader();
                    MessageBox.Show("Xóa thành công");
                    connection.Close();
                }
                else
                {
                    MessageBox.Show("Điền tên tài khoản bạn muốn xóa");
                }    
                
            }
        }

        private void capnhattk_qt_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(str))
            {
                if (txtBox_tendangnhap_DSTK.Text != "" && txtBox_matkhau_DSTK.Text != "" && txtBox_loaitaikhoan_DSTK.Text =="")
                {
                    connection.Open();
                    SqlCommand cmd = new SqlCommand("update TaiKhoan set MatKhau ='"+txtBox_matkhau_DSTK.Text+"' where SDT = '" + txtBox_tendangnhap_DSTK.Text + "'", connection);
                    SqlDataReader reader = cmd.ExecuteReader();
                    MessageBox.Show("Cập nhật mật khẩu thành công");
                    connection.Close();
                }
                if(txtBox_tendangnhap_DSTK.Text != "" && txtBox_matkhau_DSTK.Text == "" && txtBox_loaitaikhoan_DSTK.Text != "")
                {
                    connection.Open();
                    SqlCommand cmd = new SqlCommand("update TaiKhoan set LoaiTK ='" + txtBox_loaitaikhoan_DSTK.Text + "' where SDT = '" + txtBox_tendangnhap_DSTK.Text + "'", connection);
                    SqlDataReader reader = cmd.ExecuteReader();
                    MessageBox.Show("Cập nhật loại tài khoản thành công");
                    connection.Close();
                }
                if(txtBox_tendangnhap_DSTK.Text != "" && txtBox_matkhau_DSTK.Text != "" && txtBox_loaitaikhoan_DSTK.Text != "")
                {
                    connection.Open();
                    SqlCommand cmd = new SqlCommand("update TaiKhoan set LoaiTK ='" + txtBox_loaitaikhoan_DSTK.Text + "', MatKhau = '" +txtBox_matkhau_DSTK.Text + "' where SDT = '" + txtBox_tendangnhap_DSTK.Text + "'", connection);
                    SqlDataReader reader = cmd.ExecuteReader();
                    MessageBox.Show("Cập nhật  tài khoản thành công");
                    connection.Close();
                }
                if(txtBox_tendangnhap_DSTK.Text == "")
                {
                    MessageBox.Show("Vui lòng điền tên tài khoản bạn muốn cập nhật");
                }    
            }
        }

        private void khoatk_qt_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(str))
            {
                if(txtBox_tendangnhap_DSTK.Text != "")
                {
                    connection.Open();
                    SqlCommand cmd = new SqlCommand("update TaiKhoan set LoaiTK = -1 where SDT ='" + txtBox_tendangnhap_DSTK.Text + "'", connection);
                    SqlDataReader reader = cmd.ExecuteReader();
                    MessageBox.Show("Khóa thành công");
                    connection.Close();
                }
                else
                {
                    MessageBox.Show("Vui lòng điền tên tài khoản bạn muốn khóa");
                }    
                
            }
        }

       

        private void xemthongtintaikhoan_click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(str))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("select * from TaiKhoan", connection);
                SqlDataReader reader = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                dGV_dstaikhoan_AD.DataSource = dt;
                connection.Close();
            }
        }
    }
}
