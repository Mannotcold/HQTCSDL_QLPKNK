using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QLPKNK.QuanTri
{
    public partial class QLThuoc : Form
    {
        string Ma;
        public QLThuoc(string ma)
        {
            InitializeComponent();

            Ma = ma;
        }
        DataTable TT;
        void Load_form()
        {
            string sql1 = "SELECT MaThuoc, TenThuoc, DonViTinh, ChiDinh, SLTonKho, NgayHetHan,Tien FROM THUOC  ";
            TT = Functions.GetDataToTable(sql1);
            dgvthuoc.DataSource = TT;

        }

        private void dgvthuoc_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            //MaThuoc, TenThuoc, DonViTinh, ChiDinh, SLTonKho, NgayHetHan,Tien, MaQT
            int i;
            i = dgvthuoc.CurrentRow.Index;
            txtmadv.Text = dgvthuoc.Rows[i].Cells[0].Value.ToString();
            txttendv.Text = dgvthuoc.Rows[i].Cells[1].Value.ToString();
            txtloaidv.Text = dgvthuoc.Rows[i].Cells[2].Value.ToString();
            txtcd.Text = dgvthuoc.Rows[i].Cells[3].Value.ToString();

            txtsl.Text = dgvthuoc.Rows[i].Cells[4].Value.ToString();

            Datehh.Text = dgvthuoc.Rows[i].Cells[5].Value.ToString();
            txttien.Text = dgvthuoc.Rows[i].Cells[6].Value.ToString();
        }

        

        
        private void QLThuoc_Load(object sender, EventArgs e)
        {
            Load_form();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            DialogResult rs = MessageBox.Show("Bạn có muốn thêm hay không", "Thông báo", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question);
            if (rs == DialogResult.Yes)
            {
                try
                {
                    string sql = "INSERT INTO Thuoc (MaThuoc, TenThuoc, DonViTinh, ChiDinh, SLTonKho, NgayHetHan, Tien, MaQT) " +
               "VALUES ('" + txtmadv.Text + "','" + txttendv.Text + "', '" + txtloaidv.Text + "', '" + txtcd.Text + "', '" + txtsl.Text + "', '" + Datehh.Text + "', '" + txttien.Text + "', '" + Ma + "')";


                   Functions.RunSQL(sql);


                }
                catch (Exception)
                {
                    MessageBox.Show("Thêm không thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Stop);

                }
                Load_form();
            }
        }

        private void btnsua_Click(object sender, EventArgs e)
        {
            DialogResult rs = MessageBox.Show("Bạn có muốn cập nhật hay không", "Thông báo", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question);
            if (rs == DialogResult.Yes)
            {
                try
                {
                    string sql = "UPDATE Thuoc " +
               "SET TenThuoc = '" + txttendv.Text + "', DonViTinh = '" + txtloaidv.Text + "', ChiDinh = '" + txtcd.Text + "', " +
               "    SLTonKho = '" + txtsl.Text + "', NgayHetHan = '" + Datehh.Text + "', Tien = '" + txttien.Text + "' " +
               "WHERE MaThuoc = '" + txtmadv.Text + "'";
                    Functions.RunSQL(sql);
                }
                catch (Exception)
                {
                    MessageBox.Show("Cập nhật không thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Stop);

                }
                Load_form();
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            DialogResult rs = MessageBox.Show("Bạn có muốn xóa hay không", "Thông báo", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question);
            if (rs == DialogResult.Yes)
            {
                try
                {
                    Functions.RunSQL("DELETE FROM THUOC WHERE MaTHUOC ='" + txtmadv.Text + "'");



                }
                catch (Exception)
                {
                    MessageBox.Show("Xóa không thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Stop);

                }
                Load_form();
            }
        }
    }
}
