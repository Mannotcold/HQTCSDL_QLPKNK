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
    public partial class AddHoSoBN : Form
    {
        public AddHoSoBN()
        {
            InitializeComponent();
        }

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
                    string maDV_DichVu = sourceRow.Cells["MaDV"].Value.ToString();
                    string tenDV_DichVu = sourceRow.Cells["TenDV"].Value.ToString();
                    string loai_DichVu = sourceRow.Cells["Loai"].Value.ToString();
                    decimal tien_DichVu = Convert.ToDecimal(sourceRow.Cells["Tien"].Value);

                    
                    // Thêm vào CSDL SQL Server
                    //AddRowToSQL(maDV, tenDV, tenThuoc, loaiDV, thanhTien, maHD, maHS);
                }
            }
        }

        DataTable TT_CTHD;
        DataTable TT;
        DataTable Thuoc;
        private void AddHoSoBN_Load(object sender, EventArgs e)
        {
            string sql = "SELECT MaDV_Thuoc, TenDV, TenThuoc, LoaiDV, ThanhTien, MaHD, MaHS FROM CT_HoaDon  ";
            TT_CTHD = Functions.GetDataToTable(sql);
            guna2DataGridView2.DataSource = TT_CTHD;


            string sql1 = "SELECT MaDV,TenDV, Loai, Tien FROM DichVu  ";
            TT = Functions.GetDataToTable(sql1);
            guna2DataGridView1.DataSource = TT;


            string sql3 = "SELECT MaThuoc, TenThuoc, DonViTinh, ChiDinh, SLTonKho, NgayHetHan,Tien FROM Thuoc";
            Thuoc = Functions.GetDataToTable(sql3);
            guna2DataGridView3.DataSource = Thuoc;

        }
    }
}
