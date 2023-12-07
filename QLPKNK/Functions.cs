using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace QLPKNK
{
    class Functions
    {
        // server chính xác
        private static string exactly_server_name = ".";
        
       

        

        //Khai báo đối tượng kết nối  

        public static SqlConnection connection;
        public static void Connect(string ConnectString)
        {
            SqlCommand command;
            //string str = "Data Source=.;Initial Catalog=QLTC;Integrated Security=True";
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataTable table = new DataTable();

            connection = new SqlConnection(ConnectString);
            connection.Open();
            //Kiểm tra kết nối
            if (connection.State == ConnectionState.Open)
            {
                MessageBox.Show("Đăng nhập thành công");
            }
            else MessageBox.Show("Đăng nhập thất bại");

        }

        public static void Disconnect()
        {
            if (connection.State == ConnectionState.Open)
            {
                //Đóng kết nối
                connection.Close();

                //Giải phóng tài nguyên
                connection.Dispose();
                connection = null;

                //Kiểm tra kết nối
                //MessageBox.Show("Đóng Kết nối DB thành công");
            }
        }

        // lấy ConnectString với mỗi loại user
        public static string get_ConnectString(string tendangnhap, string matkhau)
        {
            string s = "";
            s = "Data Source=.;Initial Catalog=DOANHQT;User ID=" + tendangnhap + ";Password=" + matkhau + "";
            return s;
        }

        public static DataTable GetDataToTable(string sql) //Lấy dữ liệu đổ vào bảng
        {
            SqlDataAdapter dap = new SqlDataAdapter();
            dap.SelectCommand = new SqlCommand();

            //Kết nối cơ sở dữ liệu
            dap.SelectCommand.Connection = Functions.connection;
            dap.SelectCommand.CommandText = sql;

            DataTable table = new DataTable();
            dap.Fill(table);
            return table;
        }

        public static bool CheckKey(string sql) // kiểm tra xem có trùng khóa hay không
        {
            SqlDataAdapter dap = new SqlDataAdapter(sql, connection);
            DataTable table = new DataTable();
            dap.Fill(table);
            if (table.Rows.Count > 0)
                return true;
            else return false;
        }

        public static void RunSQL(string sql) // chạy câu lệnh sql
        {

            SqlCommand com = new SqlCommand();
            //Lấy dữ liệu về từ kết quả câu lệnh trên
            //ExecuteReader() dùng với select
            //ExecuteNonquery(); với inserrt update delete
            //com.ExecuteNonQuery();
            com.CommandType = CommandType.Text;
            com.CommandText = sql;
            com.Connection = connection;
            //loaddata_PhieuThu();
            int kq = com.ExecuteNonQuery();
            if (kq > 0)
            {
                MessageBox.Show("Thực hiện thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Thực hiện không thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Stop);
            }


            //Giải phóng bộ nhớ
            com.Dispose();
            com = null;
        }

        public static void RunSQL1(string sql) // chạy câu lệnh sql
        {

            SqlCommand com = new SqlCommand();
            //Lấy dữ liệu về từ kết quả câu lệnh trên
            //ExecuteReader() dùng với select
            //ExecuteNonquery(); với inserrt update delete
            //com.ExecuteNonQuery();
            com.CommandType = CommandType.Text;
            com.CommandText = sql;
            com.Connection = connection;
            //loaddata_PhieuThu();
            int kq = com.ExecuteNonQuery();

            //Giải phóng bộ nhớ
            com.Dispose();
            com = null;
        }
        public static void FillCombo(string sql, ComboBox cbo, string ma) // đổ dữ liệu vào comboBox
        {
            SqlDataAdapter dap = new SqlDataAdapter(sql, connection);
            DataTable table = new DataTable();
            dap.Fill(table);
            cbo.DataSource = table;
            cbo.ValueMember = ma;
        }

        public static string GetFieldValues(string sql) // lấy dữ liệu từ câu lệnh sql
        {
            string ma = "";
            SqlCommand cmd = new SqlCommand(sql, connection);
            SqlDataReader reader;
            reader = cmd.ExecuteReader();
            while (reader.Read())
                ma = reader.GetValue(0).ToString();
            reader.Close();
            return ma;
        }
    }
}
