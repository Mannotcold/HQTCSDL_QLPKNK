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
            // Kiểm tra xem dataGridViewDestination có cột không
            if (guna2DataGridView2.Columns.Count == 0)
            {
                // Nếu không có cột, thêm các cột từ dataGridViewSource (hoặc thêm cột theo ý của bạn)
                foreach (DataGridViewColumn column in guna2DataGridView1.Columns)
                {
                    DataGridViewTextBoxColumn col1 = new DataGridViewTextBoxColumn();
                    col1.Name = "ColumnName1";
                    col1.HeaderText = "Column Header 1";
                    guna2DataGridView2.Columns.Add(col1);

                    DataGridViewTextBoxColumn col2 = new DataGridViewTextBoxColumn();
                    col2.Name = "ColumnName2";
                    col2.HeaderText = "Column Header 2";
                    guna2DataGridView2.Columns.Add(col2);
                }
            }

            // Duyệt qua từng hàng trong dataGridViewSource
            foreach (DataGridViewRow sourceRow in guna2DataGridView1.Rows)
            {
                // Kiểm tra nếu checkbox được chọn trong cột có index là 0
                DataGridViewCheckBoxCell checkboxCell = sourceRow.Cells[0] as DataGridViewCheckBoxCell;
                if (checkboxCell != null && Convert.ToBoolean(checkboxCell.Value))
                {
                    // Clone hàng từ dataGridViewSource
                    DataGridViewRow newRow = (DataGridViewRow)sourceRow.Clone();

                    // Duyệt qua từng ô trong hàng và copy giá trị sang newRow
                    for (int i = 0; i < sourceRow.Cells.Count; i++)
                    {
                        newRow.Cells[i].Value = sourceRow.Cells[i].Value;
                    }

                    // Thêm hàng mới vào dataGridViewDestination
                    guna2DataGridView2.Rows.Add(newRow);
                }
            }
        }

        DataTable TT_CTHD;
        private void AddHoSoBN_Load(object sender, EventArgs e)
        {
            string sql = "SELECT MaDV_Thuoc, TenDV, TenThuoc, LoaiDV, ThanhTien, MaHD, MaHS FROM CT_HoaDon; ";
            TT_CTHD = Functions.GetDataToTable(sql);
            guna2DataGridView2.DataSource = TT_CTHD;
        }
    }
}
