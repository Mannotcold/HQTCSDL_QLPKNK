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
                    Functions.RunSQL("DELETE FROM HoSoBN WHERE MaHS = '" + txtmahs.Text + "'");



                }
                catch (Exception)
                {
                    MessageBox.Show("Xóa không thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Stop);

                }
            }
        }

        private Form activeform = null;
        private void openChildForm(Form childForm)
        {
            if (activeform != null)
            {
                activeform.Close();
            }

            activeform = childForm;
            childForm.TopLevel = false;
            childForm.FormBorderStyle = FormBorderStyle.None;
            childForm.Dock = DockStyle.Fill;

            guna2Panel3.Controls.Clear(); // Xóa tất cả các controls hiện tại trong panel trước khi thêm form con mới
            guna2Panel3.Controls.Add(childForm);
            guna2Panel3.Tag = childForm;
            childForm.BringToFront();
            childForm.Show();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            openChildForm(new AddHoSoBN());
        }

        private void btnTraCuu_Click(object sender, EventArgs e)
        {
            DialogResult rs = MessageBox.Show("Bạn có muốn tìm kiếm hay không", "Thông báo", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question);
            if (rs == DialogResult.Yes)
            {
                try
                {
                    MessageBox.Show(txtmahs.Text, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Stop);
                    Functions.RunSQL("select * from HoSoBN WHERE MaHS LIKE '" + txtTuKhoa.Text + "'");



                }
                catch (Exception)
                {
                    MessageBox.Show("Xóa không thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Stop);

                }
            }
        }
    }
}
