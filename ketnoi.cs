using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace Baitaplon
{
        public class Ketnoi
        {
            private string query = "Data Source=DAOCUONG\\SQLEXPRESS;Initial Catalog=QLQA;Integrated Security=True";
            public SqlConnection con;
            private SqlCommand cmd;
            private SqlDataAdapter da;
            public void Open()
            {
                
                con = new SqlConnection(query);
                con.Open();
            }
            public void close()
            {
                con.Close();
            }
            public DataTable laydulieu(string sql)
            {
                cmd = new SqlCommand(sql, con);
                da = new SqlDataAdapter(cmd);
                DataTable db = new DataTable();
                da.Fill(db);
                return db;
            }
            public void xuly(string sql)
            {

                cmd = new SqlCommand(sql, con);
                cmd.ExecuteNonQuery();
            }

        }
    }
