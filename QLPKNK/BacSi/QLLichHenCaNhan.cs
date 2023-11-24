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
    public partial class QLLichHenCaNhan : Form
    {
        string Ma;
        string malh;
        public QLLichHenCaNhan(string ma)
        {
            InitializeComponent();
            Ma = ma;
            TimeKham.ShowUpDown = true;
        }
        DataTable TT_QLLichHen;


        private void QLLichHenCaNhan_Load(object sender, EventArgs e)
        {
            string sql = "SELECT * FROM LichCaNhanNS WHERE MaNS = '" + Ma + "'";
            TT_QLLichHen = Functions.GetDataToTable(sql);
            dgvLHCN.DataSource = TT_QLLichHen;
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            DialogResult rs = MessageBox.Show("Bạn có muốn cập nhật hay không", "Thông báo", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question);
            if (rs == DialogResult.Yes)
            {
                try
                {
                    Functions.RunSQL(" INSERT INTO LichCaNhanNS(Ngay, ThoiGian, MaNS) VALUES ('" + Datekham.Text + "', '" + TimeKham.Text + "', '" + Ma + "')");


                }
                catch (Exception)
                {
                    MessageBox.Show("Cập nhật không thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Stop);

                }
            }
        }
        private void dgvHSBA_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            int i;
            i = dgvLHCN.CurrentRow.Index;
            malh = dgvLHCN.Rows[i].Cells[1].Value.ToString();
            Datekham.Text = dgvLHCN.Rows[i].Cells[2].Value.ToString();
            TimeKham.Text = dgvLHCN.Rows[i].Cells[3].Value.ToString();

        }

        private void btnsua_Click(object sender, EventArgs e)
        {
            DialogResult rs = MessageBox.Show("Bạn có muốn cập nhật hay không", "Thông báo", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question);
            if (rs == DialogResult.Yes)
            {
                try
                {

                    Functions.RunSQL("UPDATE LichCaNhanNS SET Ngay = '" + Datekham.Text + "', ThoiGian = '" + TimeKham.Text + "' WHERE MaLichCaNhan = '" + malh + "'");


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

                    Functions.RunSQL("DELETE FROM LichCaNhanNS WHERE MaLichCaNhan = '" + malh + "'");


                }
                catch (Exception)
                {
                    MessageBox.Show("Cập nhật không thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Stop);

                }
            }
        }
    }
}
