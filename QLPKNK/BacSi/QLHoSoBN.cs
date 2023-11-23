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
    public partial class QLHoSoBN : Form
    {
        public QLHoSoBN()
        {
            InitializeComponent();
        }


        DataTable TT_HSBA;
        private void QLHoSoBN_Load(object sender, EventArgs e)
        {
            string sql = "SELECT * FROM HoSoBN ";
            TT_HSBA = Functions.GetDataToTable(sql);
            dgvHSBA.DataSource = TT_HSBA;
            
        }

        private void dgvHSBA_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            int i;
            i = dgvHSBA.CurrentRow.Index;

            Datekham.Text = dgvHSBA.Rows[i].Cells[1].Value.ToString();
            txtmahs.Text = dgvHSBA.Rows[i].Cells[0].Value.ToString();
            txtNguoiKham.Text = dgvHSBA.Rows[i].Cells[2].Value.ToString();
            txtdvsd.Text = dgvHSBA.Rows[i].Cells[3].Value.ToString();
            txtKH.Text = dgvHSBA.Rows[i].Cells[4].Value.ToString();
            txtmans.Text = dgvHSBA.Rows[i].Cells[5].Value.ToString();
        }

        private void btnsua_Click(object sender, EventArgs e)
        {
            DialogResult rs = MessageBox.Show("Bạn có muốn cập nhật hay không", "Thông báo", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question);
            if (rs == DialogResult.Yes)
            {
                try
                {

                    Functions.RunSQL("UPDATE HoSoBN SET NgayKham = '" + Datekham.Text + "', MaKH = '" + txtKH.Text + "' WHERE MaHS = '" + txtmahs.Text + "'");
                   

                }
                catch (Exception)
                {
                    MessageBox.Show("Cập nhật không thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Stop);

                }
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            DialogResult rs = MessageBox.Show("Bạn có muốn cập nhật hay không", "Thông báo", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question);
            if (rs == DialogResult.Yes)
            {
                try
                {
                    MessageBox.Show(txtmahs.Text, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Stop);
                    Functions.RunSQL("DELETE FROM HoSoBN WHERE MaHS = 'HS001'");



                }
                catch (Exception)
                {
                    MessageBox.Show("Xóa không thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Stop);

                }
            }
        }
    }
}
