using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Baitaplon
{
    public partial class Giohang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCart();
            }
        }
        private void BindCart()
        {
            List<string> cart = Session["Cart"] as List<string>;
            if (cart != null)
            {
                List<Product> productsInCart = GetProductsInCart(cart);
                rptProductsInCart.DataSource = productsInCart;
                rptProductsInCart.DataBind();
            }
        }
        private List<Product> GetProductsInCart(List<string> productIds)
        {
            List<Product> products = new List<Product>();
            string connectionString = "Data Source=DAOCUONG\\SQLEXPRESS;Initial Catalog=QLQA;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                foreach (string productId in productIds)
                {
                    string query = "SELECT MaSanPham, TenSanPham, GiaSanPham ,HinhAnh FROM SanPham WHERE MaSanPham = @ProductId";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@ProductId", productId);

                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        Product product = new Product();
                        product.HinhAnh = reader["HinhAnh"].ToString();
                        product.MaSanPham = reader["MaSanPham"].ToString();
                        product.TenSanPham = reader["TenSanPham"].ToString();
                        product.GiaSanPham = Convert.ToDecimal(reader["GiaSanPham"]);

                        products.Add(product);
                    }
                    reader.Close();
                }
            }
            return products;
        }
        public class Product
        {
            public string HinhAnh { get; set; }
            public string MaSanPham { get; set; }
            public string TenSanPham { get; set; }
            public decimal GiaSanPham { get; set; }

        }
        public void Bxoa_click(object sender, EventArgs e)
        {
            Button Bxoa = (Button)sender;
            string productId = Bxoa.CommandArgument;

            List<string> cart;
            if (Session["Cart"] == null)
            {
                cart = new List<string>();
            }
            else
            {
                cart = (List<string>)Session["Cart"];
            }

            // Loại bỏ sản phẩm khỏi danh sách giỏ hàng
            cart.Remove(productId);

            // Cập nhật Session với danh sách giỏ hàng đã được cập nhật
            Session["Cart"] = cart;

            // Chuyển hướng trang để tải lại
            Response.Redirect(Request.RawUrl);
        }
    }
}