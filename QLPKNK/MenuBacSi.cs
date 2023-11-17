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
    public partial class MenuBacSi : Form
    {
        string SĐT;
        public MenuBacSi(string sdt)
        {
            InitializeComponent();
            SĐT = sdt;
        }


        // mở 1 form con
        private Form activeform = null;

        private void openChildForm(Form childForm)
        {
            if (activeform != null)
                activeform.Close();
            activeform = childForm;
            childForm.TopLevel = false;
            childForm.FormBorderStyle = FormBorderStyle.None;
            childForm.Dock = DockStyle.Fill;
            guna2Panel1.Controls.Add(childForm);
            guna2Panel1.Tag = childForm;
            childForm.BringToFront();
            childForm.Show();
        }

        private void MenuBacSi_Load(object sender, EventArgs e)
        {

        }

        private void btnStatistic_Click(object sender, EventArgs e)
        {

            
        }

        private void btnAccount_Click(object sender, EventArgs e)
        {
            openChildForm(new ThongtinUser(SĐT));
        }
    }
}
