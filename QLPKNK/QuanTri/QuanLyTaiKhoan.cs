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
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace QLPKNK.QuanTri
{
    public partial class QuanLyTaiKhoan : Form
    {
        string Ma;
        public QuanLyTaiKhoan(string ma)
        {
            InitializeComponent();
            Ma = ma;
        }
        
     

        private void themtk_qt_Click(object sender, EventArgs e)
        {
            if(txtBox_tendangnhap_DSTK.Text != "" && txtBox_matkhau_DSTK.Text != "" && ComboBox1.SelectedItem.ToString() != "")
            {
                Functions.RunSQL("insert into TaiKhoan values ('" + txtBox_tendangnhap_DSTK.Text + "','" + txtBox_matkhau_DSTK.Text + "'," + ComboBox1.SelectedItem.ToString() + ")");    
                MessageBox.Show("Thêm thành công");
            }
            else
            {
                MessageBox.Show("Điền đầy đủ thông tin");
            }
        }

        private void xoatk_qt_Click(object sender, EventArgs e)
        {    
            if(txtBox_tendangnhap_DSTK.Text != "")
            {
                Functions.RunSQL("delete from TaiKhoan where SDT = '" + txtBox_tendangnhap_DSTK.Text + "'");   
                MessageBox.Show("Xóa thành công");                   
            }
            else
            {
                MessageBox.Show("Điền tên tài khoản bạn muốn xóa");
            }              
        }

        private void capnhattk_qt_Click(object sender, EventArgs e)
        {
            
            if (txtBox_tendangnhap_DSTK.Text != "" && txtBox_matkhau_DSTK.Text != "" && ComboBox1.SelectedItem == null)
            {
                Functions.RunSQL("update TaiKhoan set MatKhau ='" + txtBox_matkhau_DSTK.Text + "' where SDT = '" + txtBox_tendangnhap_DSTK.Text + "'");
                MessageBox.Show("Cập nhật mật khẩu thành công");
                    
            }
            if(txtBox_tendangnhap_DSTK.Text != "" && txtBox_matkhau_DSTK.Text == "" && ComboBox1.SelectedItem != null)
            {
                Functions.RunSQL("update TaiKhoan set LoaiTK ='" + ComboBox1.SelectedItem.ToString() + "' where SDT = '" + txtBox_tendangnhap_DSTK.Text + "'");
                MessageBox.Show("Cập nhật loại tài khoản thành công");
                    
            }
            if(txtBox_tendangnhap_DSTK.Text != "" && txtBox_matkhau_DSTK.Text != "" && ComboBox1.SelectedItem != null)
            {
                Functions.RunSQL("update TaiKhoan set LoaiTK ='" + ComboBox1.SelectedItem.ToString() + "', MatKhau = '" + txtBox_matkhau_DSTK.Text + "' where SDT = '" + txtBox_tendangnhap_DSTK.Text + "'");    
                MessageBox.Show("Cập nhật tài khoản thành công");
                    
            }
            if(txtBox_tendangnhap_DSTK.Text == "")
            {
                MessageBox.Show("Vui lòng điền tên tài khoản bạn muốn cập nhật");
            }    
            
        }

        private void khoatk_qt_Click(object sender, EventArgs e)
        {


            if (txtBox_tendangnhap_DSTK.Text != "")
            {
                Functions.RunSQL("update TaiKhoan set LoaiTK = -1 where SDT ='" + txtBox_tendangnhap_DSTK.Text + "'");


                MessageBox.Show("Khóa thành công");
            }
            else
            {
                MessageBox.Show("Vui lòng điền tên tài khoản bạn muốn khóa");
            }    
                
            
        }


        DataTable TCTK;
        private void xemthongtintaikhoan_click(object sender, EventArgs e)
        {
            string xtctk = "select * from TaiKhoan";
         
            TCTK = Functions.GetDataToTable(xtctk);
            dGV_dstaikhoan_AD.DataSource = TCTK;
              
        }
    }
}
