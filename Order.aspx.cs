using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace DejaBrew
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\DejaBrew.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
            conn.Open();

            if (!IsPostBack)
            {
                if (!this.IsPostBack)
                {
                    this.BindGrid();
                }
          
            }

        }

        private void BindGrid()
        {

            using (SqlCommand cmd = new SqlCommand("SELECT Id as 'Order ID', OrderTotal as 'Total Price', CompletionDate as 'Date Ordered', DeliveryDate as 'Date Delivered', DeliveryStatus as 'Status' FROM Orders  WHERE Orders.CartID = @ParamCurrentCart"))
            {
                cmd.Parameters.AddWithValue("@ParamCurrentCart", HttpContext.Current.Session["userid"].ToString());
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = conn;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridOrder.DataSource = dt;
                        GridOrder.DataBind();

                    }
                }
            }
        }
    }
}