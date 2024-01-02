using Guna.UI2.WinForms;
using Guna.UI2.WinForms.Suite;
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
using static System.Windows.Forms.VisualStyles.VisualStyleElement.TrackBar;


namespace QLPKNK.KhachHang
{
    
    public partial class DatLichHen : Form
    {
        string SĐT;
        string Ma;
        public DatLichHen(string sdt)
        {
            InitializeComponent();
            SĐT = sdt;
            
        }
        public DatLichHen()
        {
            InitializeComponent();
        }
         

        private void dgvLHCN_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            
        }

        private void guna2Panel3_Paint(object sender, PaintEventArgs e)
        {

        }
        private void btnThem_Click(object sender, EventArgs e)
        {
            Form form = new FormKhachHangChung(SĐT);

            this.Hide();
            form.ShowDialog();
            this.Close();
        }

        private void btnsua_Click(object sender, EventArgs e)
        {
            //Functions.Connect("Data Source =.; Initial Catalog = DOANHQTCSDL; Integrated Security = True");
            DialogResult rs = MessageBox.Show("Bạn có muốn đăng ký tài khoản hay không", "Thông báo", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question);
            if (rs == DialogResult.Yes)
            {
                try
                {
                    Functions.RunSQL("insert into LichHen(NgayHen,ThoiGianHen,MaKH,MaNS) VALUES (" + NgayKham + " ,'" + GioKham + " ," + MaKH + ",'1')");
                    

                }
                catch (Exception)
                {
                    MessageBox.Show("Đăng ký không thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Stop);

                }
            }
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
        DataTable DichVu;
        DataTable LichCaNhanNS;
        private void DatLichHen_Load(object sender, EventArgs e)
        {
            
            DataTable TT_KhachHang;
            string sql = "SELECT * FROM KHACHHANG WHERE SDTKH = " + "'" + SĐT + "'";
            TT_KhachHang = Functions.GetDataToTable(sql);
            MaKH.Text = TT_KhachHang.Rows[0][0].ToString();
            string tcdv = "select * from DichVu";
            DichVu = Functions.GetDataToTable(tcdv);
            DSDV.DataSource = DichVu;


            string dsns = "SELECT MaNS, Ngay  FROM LichCaNhanNS";
            LichCaNhanNS = Functions.GetDataToTable(dsns);
            DSNS.DataSource = LichCaNhanNS;
            
        }
    }
}
