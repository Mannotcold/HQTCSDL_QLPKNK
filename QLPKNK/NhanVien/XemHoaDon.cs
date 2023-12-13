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

namespace QLPKNK
{
    public partial class XemHoaDon : Form
    {
       

        string str = "Data Source=DESKTOP-6IATTTJ;Initial Catalog=DOANHQT;Integrated Security=True";
        public XemHoaDon()
        {
            InitializeComponent();
        }

        private void xemtatcahd_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(str) )
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("select * from CT_HoaDon", connection);
                SqlDataReader reader= cmd.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                Bangxemtatcahd.DataSource = dt;
                connection.Close();
            }
        }

        private void xemhoadonkh_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(str))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("select * from CT_HoaDon where MaHS = '" + mahoso.Text +"'", connection);
                SqlDataReader reader = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(reader);
                Banghoadonkh.DataSource = dt;
                connection.Close();
            }
        }
    }
}
