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

namespace nhanvien
{
    public partial class XemHoSo : Form
    {
        string str = "Data Source=DESKTOP-6IATTTJ;Initial Catalog=DOANHQT;Integrated Security=True";
        public XemHoSo()
        {
            InitializeComponent();
        }

        private void xemtatcahs_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(str))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("select * from HoSoBN", connection);
                SqlDataReader reader = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                Bangxemtatcahs.DataSource = dt;
                connection.Close();
            }
        }

        private void xemhosokh_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(str))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("select * from HoSoBN where MaKH = '" + makhachhang.Text + "'", connection);
                SqlDataReader reader = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                Bangxemhosokh.DataSource = dt;
                connection.Close();
            }
        }
    }
}
