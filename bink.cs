using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace Baitaplon
{
    public class bink
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["Data Source=DAOCUONG\\SQLEXPRESS;Initial Catalog=QLQA;Integrated Security=True"].ToString();

        public DataTable GetProducts()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand("SELECT * FROM SanPham", connection))
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    return dataTable;
                }
            }
        }
    }
}