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
using QLPKNK.QuanTri;
using QLPKNK.KhachHang;
namespace QLPKNK.QuanTri
{
    public partial class QLDichVu : Form
    {
        public QLDichVu()
        {
            InitializeComponent();
        }

        DataTable TT;

        private void LoadForm()
        {
            string sql1 = "SELECT MaDV,TenDV, Loai, Tien FROM DichVu  ";
            TT = Functions.GetDataToTable(sql1);
            dgvHSBA.DataSource = TT;
        }
        private void guna2Panel3_Paint(object sender, PaintEventArgs e)
        {
            LoadForm();
        }
        private void dgvHSBA_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            int i;
            i = dgvHSBA.CurrentRow.Index;
            txtmadv.Text = dgvHSBA.Rows[i].Cells[0].Value.ToString();
            txttendv.Text = dgvHSBA.Rows[i].Cells[1].Value.ToString();

            txtloaidv.Text = dgvHSBA.Rows[i].Cells[2].Value.ToString();
            txttien.Text = dgvHSBA.Rows[i].Cells[3].Value.ToString();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            DialogResult rs = MessageBox.Show("Bạn có muốn thêm hay không", "Thông báo", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question);
            if (rs == DialogResult.Yes)
            {
                try
                {
                    string sql = "INSERT INTO DichVu (Madv,TenDV,loai,tien) " +
               "VALUES (MaDV = '" + txtmadv.Text + "',TenDV = '" + txttendv.Text + "', LOAI = '" + txtloaidv.Text + "' , TIEN = '" + txttien.Text + "')";

                    Functions.RunSQL(sql);
                    LoadForm();

                }
                catch (Exception)
                {
                    MessageBox.Show("Thêm không thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Stop);

                }
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            DialogResult rs = MessageBox.Show("Bạn có muốn xóa hay không", "Thông báo", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question);
            if (rs == DialogResult.Yes)
            {
                try
                {
                    Functions.RunSQL("DELETE FROM DichVu WHERE MaDV = '" + txtmadv.Text + "'");
                    LoadForm();


                }
                catch (Exception)
                {
                    MessageBox.Show("Xóa không thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Stop);

                }
            }
        }

        

        private void btnsua_Click(object sender, EventArgs e)
        {
            DialogResult rs = MessageBox.Show("Bạn có muốn cập nhật hay không", "Thông báo", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question);
            if (rs == DialogResult.Yes)
            {
                try
                {

                    //Functions.RunSQL2("EXEC Sp_UpdateDichVu_2_FIX '"txtmadv.Text"', '{txttendv.Text}', '{txtloaidv.Text}', {txttien.Text}");
                    Functions.Sp_UpdateDichVu_2_FIX(txtmadv.Text, txttendv.Text, txtloaidv.Text, txttien.Text);
                    LoadForm();
                }
                catch (Exception)
                {
                    MessageBox.Show("Cập nhật không thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Stop);

                }
            }
        }
    }
}
