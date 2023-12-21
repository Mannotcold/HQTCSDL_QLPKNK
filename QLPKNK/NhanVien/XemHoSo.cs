using QLPKNK;
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
        string Ma;
        public XemHoSo(string ma)
        {
            InitializeComponent();
            Ma = ma;
        }
        DataTable TCHS;
        DataTable THS;
        private void xemtatcahs_Click(object sender, EventArgs e)
        {
            string xtchs = "select * from HoSoBN";
            TCHS = Functions.GetDataToTable(xtchs);
            Bangxemtatcahs.DataSource = TCHS;
        }

        private void xemhosokh_Click(object sender, EventArgs e)
        {
            string ths = "select * from HoSoBN where MaKH = '" + makhachhang.Text + "'";
            THS = Functions.GetDataToTable(ths);
            Bangxemhosokh.DataSource = THS;
        }
    }
}
