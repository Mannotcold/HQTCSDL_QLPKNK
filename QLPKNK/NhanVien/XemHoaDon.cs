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

        string Ma;
        
        public XemHoaDon(string ma)
        {
            InitializeComponent();
            Ma = ma;
        }
        DataTable TCHD;
        DataTable THD;
        private void xemtatcahd_Click(object sender, EventArgs e)
        {
            string xtchd = "select * from CT_HoaDon";
            TCHD = Functions.GetDataToTable(xtchd);
            Bangxemtatcahd.DataSource = TCHD;

        }

        private void xemhoadonkh_Click(object sender, EventArgs e)
        {
            string thd = "select * from CT_HoaDon where MaHS = '" + mahoso.Text + "'";
            THD = Functions.GetDataToTable(thd);
            Banghoadonkh.DataSource = THD;
        }
    }
}
