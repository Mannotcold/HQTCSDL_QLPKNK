﻿using nhanvien;

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
using QLPKNK.KhachHang;
namespace QLPKNK
{
    public partial class NhanVien : Form
    {
        SqlConnection connection;
        SqlCommand command;
        SqlDataAdapter adapter = new SqlDataAdapter();
        DataTable table = new DataTable();

        string str = "Data Source=DESKTOP-6IATTTJ;Initial Catalog=DOANHQT;Integrated Security=True";
        string SĐT;
        string Ma;
        public NhanVien(string sdt, string ma)
        {
            InitializeComponent();
            SĐT = sdt;
            Ma = ma;
        }
        
        private Form activeform = null;
        private void openChildForm(Form childForm)
        {
            if (activeform != null)
                activeform.Close();
            activeform = childForm;
            childForm.TopLevel = false;
            childForm.FormBorderStyle = FormBorderStyle.None;
            childForm.Dock = DockStyle.Fill;
            guna2Panel2.Controls.Add(childForm);
            guna2Panel2.Tag = childForm;
            childForm.BringToFront();
            childForm.Show();
        }
        private void nv4_Click(object sender, EventArgs e)
        {
            openChildForm(new XemHoaDon(Ma));
        }

        private void nv1_Click(object sender, EventArgs e)
        {
            openChildForm(new DatLichHen(SĐT));
        }

        private void nv2_Click(object sender, EventArgs e)
        {
            openChildForm(new DangKyKhachHang());
        }

        private void nv3_Click(object sender, EventArgs e)
        {
            openChildForm(new XemHoSo(Ma));
        }
    }
}
