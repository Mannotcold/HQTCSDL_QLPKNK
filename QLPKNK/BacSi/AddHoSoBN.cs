using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using System.Data.SqlClient;
namespace QLPKNK
{
    public partial class AddHoSoBN : Form
    {
        string Ma;
        public AddHoSoBN(string ma)
        {
            InitializeComponent();
            Ma = ma;
        }
        public static SqlConnection connection;
        private void btnThem_Click(object sender, EventArgs e)
        {

            // Duyệt qua từng hàng trong dataGridViewSource
            foreach (DataGridViewRow sourceRow in guna2DataGridView1.Rows)
            {
                DataGridViewCheckBoxCell checkboxCell = sourceRow.Cells[0] as DataGridViewCheckBoxCell;
                if (checkboxCell != null && Convert.ToBoolean(checkboxCell.Value))
                {
                    // Clone hàng từ dataGridViewSource
                    DataGridViewRow newRow = (DataGridViewRow)sourceRow.Clone();

                    // Duyệt qua từng ô trong hàng và copy giá trị sang newRow
                    string SL = sourceRow.Cells["SL"].Value.ToString();
                    string maDV_DichVu = sourceRow.Cells["MaDV"].Value.ToString();
                    string tenDV_DichVu = sourceRow.Cells["TenDV"].Value.ToString();
                    string loai_DichVu = sourceRow.Cells["Loai"].Value.ToString();
                    string tien_DichVu = sourceRow.Cells["Tien"].Value.ToString();

                    guna2DataGridView2.Rows.Add(maDV_DichVu.ToString(), tenDV_DichVu.ToString(), "null", SL.ToString(), loai_DichVu.ToString(), tien_DichVu.ToString());
                }
            }


        }

        


        private void btnXoa_Click(object sender, EventArgs e)
        {
            // Assuming your DataGridView is named guna2DataGridView2
            if (guna2DataGridView2.SelectedRows.Count > 0)
            {
                // Get the index of the selected row and remove it
                int selectedIndex = guna2DataGridView2.SelectedRows[0].Index;
                guna2DataGridView2.Rows.RemoveAt(selectedIndex);

            }
            else
            {
                MessageBox.Show("Please select a row to delete.");
            }
        }


        //MaThuoc, TenThuoc, DonViTinh, ChiDinh, SLTonKho, NgayHetHan,Tien, MaQT
        private void btnThemThuoc_Click(object sender, EventArgs e)
        {
            // Duyệt qua từng hàng trong dataGridViewSource
            foreach (DataGridViewRow sourceRow in guna2DataGridView3.Rows)
            {
                DataGridViewCheckBoxCell checkboxCell = sourceRow.Cells[0] as DataGridViewCheckBoxCell;
                if (checkboxCell != null && Convert.ToBoolean(checkboxCell.Value))
                {
                    // Clone hàng từ dataGridViewSource
                    DataGridViewRow newRow = (DataGridViewRow)sourceRow.Clone();

                    // Duyệt qua từng ô trong hàng và copy giá trị sang newRow
                    string SLThuoc = sourceRow.Cells["SLTHUOC"].Value.ToString();
                    string maThuoc = sourceRow.Cells["MaThuoc"].Value.ToString();
                    string tenthuoc = sourceRow.Cells["TenThuoc"].Value.ToString();
                    string loaiChiDinh = sourceRow.Cells["ChiDinh"].Value.ToString();
                    string tienthuoc = sourceRow.Cells["Tien"].Value.ToString();
                    //Functions.RunSQL(" INSERT INTO CT_HoaDon(MaDV_Thuoc, TenDV, TenThuoc, SL, LoaiDV, ThanhTien , MaHD, MaHS) " +
                    //    "VALUES ('" + maDV_DichVu.ToString() + "', '" + tenDV_DichVu.ToString() + "', 'null' , '" + SL.ToString() + "', '" + loai_DichVu.ToString() + "' , '" + tien_DichVu.ToString() + "' , '2', '1')");

                    guna2DataGridView2.Rows.Add(maThuoc.ToString(), "null", tenthuoc.ToString(), SLThuoc.ToString(), loaiChiDinh.ToString(), tienthuoc.ToString());
                }
            }
        }

        string maHS;
        void GetMaHSByMaKHMaNS()
        {

                // Giá trị mặc định hoặc giá trị lỗi
                string maKH = comboBoxKH.Text;
                string maNS = txtNK.Text;
                string Sql = "SELECT MaHS FROM HoSoBN WHERE MaKH =  '" + maKH.ToString() + "' AND MaNS =  '" + maNS.ToString() + "'";
                maHS = Functions.GetFieldValues(Sql);


        }

        void InsertCT_HOADON()
        {
            GetMaHSByMaKHMaNS();
            foreach (DataGridViewRow sourceRow in guna2DataGridView2.Rows)
            {
                string maDV_Thuoc = sourceRow.Cells["MaDV_Thuoc"].Value.ToString();
                string tenDV = sourceRow.Cells["TenDV"].Value.ToString();
                string tenThuoc = sourceRow.Cells["TenThuoc"].Value.ToString();
                int soLuong = Convert.ToInt32(sourceRow.Cells["SLSD"].Value);
                string loaiDV = sourceRow.Cells["LoaiDV"].Value.ToString();
                decimal thanhTien = Convert.ToDecimal(sourceRow.Cells["ThanhTien"].Value);
                //string maHD = sourceRow.Cells["MaHD"].Value.ToString();
                

                // Thêm vào CSDL SQL Server
                Functions.RunSQL(" INSERT INTO CT_HoaDon(MaDV_Thuoc, TenDV, TenThuoc, SL, LoaiDV, ThanhTien , MaHD, MaHS) " +
                    "VALUES ('" + maDV_Thuoc.ToString() + "', '" + tenDV.ToString() + "', '" + tenThuoc.ToString() + "' , '" + soLuong.ToString() + "', '" + loaiDV.ToString() + "' , '" + thanhTien.ToString() + "' , null, '" + maHS.ToString() + "')");

            }

        }

        private void btnThemHS_Click(object sender, EventArgs e)
        {
            string mans = txtNK.Text;
            string ngaykham = Datekham.Text;
            string makh = comboBoxKH.Text;
            string sql = "INSERT INTO HoSoBN (NgayKham, NguoiKham, MaKH, MaNS) " +
               "VALUES ('" + ngaykham.ToString() + "', '" + Ma + "', '" + makh.ToString() + "' , '" + Ma + "')";
            Functions.RunSQL1(sql);
           InsertCT_HOADON();
            loadform();
        }


        DataTable TT_CTHD;
        DataTable TT;
        DataTable Thuoc;

        void loadform()
        {
            txtNK.Text = Ma;

            //fill combobox Khach hang
            string sql0 = "SELECT * FROM KHACHHANG  ";
            Functions.FillCombo(sql0, comboBoxKH, "MaKH");


            //string sql = "SELECT MaDV_Thuoc, TenDV, TenThuoc, SL, LoaiDV, ThanhTien, MaHD, MaHS FROM CT_HoaDon  ";
            //TT_CTHD = Functions.GetDataToTable(sql);
            //guna2DataGridView2.DataSource = TT_CTHD;


            string sql1 = "SELECT MaDV,TenDV, Loai, Tien FROM DichVu  ";
            TT = Functions.GetDataToTable(sql1);
            guna2DataGridView1.DataSource = TT;


            string sql3 = "SELECT MaThuoc, TenThuoc, DonViTinh, ChiDinh, SLTonKho, NgayHetHan,Tien FROM Thuoc";
            Thuoc = Functions.GetDataToTable(sql3);
            guna2DataGridView3.DataSource = Thuoc;
        }
        private void AddHoSoBN_Load(object sender, EventArgs e)
        {
            loadform();



        }
    }
}
