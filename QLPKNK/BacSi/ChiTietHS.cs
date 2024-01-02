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
namespace QLPKNK.BacSi
{
    public partial class ChiTietHS : Form
    {
        string MaHS;
        public ChiTietHS(string Ma)
        {
            InitializeComponent();
            MaHS = Ma;
        }
        DataTable TT_HSBA;
        private void ChiTietHS_Load(object sender, EventArgs e)
        {
            string sql = "select * from CT_HoaDon WHERE MaHS = '" + MaHS + "'";
            TT_HSBA = Functions.GetDataToTable(sql);
            guna2DataGridView2.DataSource = TT_HSBA;
        }
    }
}
