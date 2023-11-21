using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using QLPKNK;

namespace QLPKNK
{
    public partial class DangNhap : Form
    {
        public DangNhap()
        {
            InitializeComponent();
        }

        public int user_type = -1;
        string LoaiTK = null;
        string tendangnhap;
        string matkhau;

        private void resetvalue_DN()
        {
            txtBox_tendangnhap.Text = "";
            txtBox_matkhau.Text = "";
        }

        SqlConnection connection;
        SqlCommand command;
        string str = "Data Source =.; Initial Catalog = DOANHQT; Integrated Security = True";
        SqlDataAdapter adapter = new SqlDataAdapter();
        DataTable table = new DataTable();


        public static SqlConnection Con;
        public void Connect()
        {

            connection = new SqlConnection(str);
            connection.Open();

        }

        private void Run_SP_DangNhap()
        {
            try
            {
                Connect();

                using (command = new SqlCommand("Sp_DangNhap", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    // Thêm tham số đầu vào
                    command.Parameters.AddWithValue("@SDT", txtBox_tendangnhap.Text); // Thay thế giá trị thực tế
                    command.Parameters.AddWithValue("@MatKhau", txtBox_matkhau.Text); // Thay thế giá trị thực tế

                    // Thêm tham số đầu ra
                    SqlParameter loaiTKParameter = new SqlParameter("@LoaiTK", SqlDbType.Int);
                    loaiTKParameter.Direction = ParameterDirection.Output;
                    command.Parameters.Add(loaiTKParameter);

                    // Thực thi stored procedure
                    int result = command.ExecuteNonQuery();

                    // Kiểm tra giá trị đầu ra và xử lý kết quả
                    if (result > 0 && (int)loaiTKParameter.Value != 0)
                    {
                        Console.WriteLine("Đăng nhập thành công. Loại tài khoản: " + loaiTKParameter.Value);
                    }
                    else
                    {
                        Console.WriteLine("Đăng nhập không thành công.");
                    }
                    LoaiTK = loaiTKParameter.Value.ToString();
                }
            }

            catch (Exception)
            {
                MessageBox.Show("Tên đăng nhập hoặc mật khẩu không chính xác !!!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);

            }




        }

        private void DangNhap_Load(object sender, EventArgs e)
        {

        }


        // xử lí đăng nhập

        private void btndangnhap_Click(object sender, EventArgs e)
        {
            tendangnhap = txtBox_tendangnhap.Text.Trim().ToString();
            matkhau = txtBox_matkhau.Text.Trim().ToString();

            // nếu chưa có dữ liệu 
            if (tendangnhap.Length == 0 | matkhau.Length == 0)
            {
                MessageBox.Show("Vui lòng nhập đầy đủ dữ liệu !!!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            // chạy SP đăng nhập, lấy LOAIACC
            Run_SP_DangNhap();

            // nếu tên đăng nhập hoặc mật khẩu sai
            if (LoaiTK == null)
            {
                //MessageBox.Show("Tên đăng nhập hoặc mật khẩu không chính xác !!!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                //resetvalue_DN();
                return;
            }

            // chuyển loại acc sang int
            user_type = Int32.Parse(LoaiTK);

            // nếu acc này bị khóa
            if (user_type == -1)
            {
                MessageBox.Show("Tài khoản này đã bị khóa !!!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }


            // kết nối với database tương ứng với loại acc
            Functions.Connect(Functions.get_ConnectString(tendangnhap, matkhau));
            open_FormMain(user_type);
        }


        // xử lí mở form tương ứng từng loại acc      
        public void open_FormMain(object obj)
        {
            switch (user_type)
            {
                case 0:
                    {
                       
                        break;
                    }
                case 1:
                    {
                        Form Menu = new MenuBacSi(txtBox_tendangnhap.Text);
                        this.Hide();
                        Menu.ShowDialog();
                        this.Close();
                        break;
                    }
                case 2:
                    {
                        break;
                    }
                
            }
        }

        private void btndangky_Click(object sender, EventArgs e)
        {
            Form form = new DangKy();

            this.Hide();
            form.ShowDialog();
            this.Close();
        }
    }
}
