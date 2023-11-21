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

        }
    }
}
