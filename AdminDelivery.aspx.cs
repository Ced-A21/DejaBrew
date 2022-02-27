using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace DejaBrew
{
    public partial class AdminDelivery : System.Web.UI.Page
    {
        protected void Button_Update_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\DejaBrew.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
            conn.Open();
            SqlCommand cmd = new SqlCommand("UPDATE [Orders] SET DeliveryDate = @DeliveryDate WHERE Id = @Id", conn);
            cmd.Parameters.AddWithValue("@Id", Grid_Delivery.SelectedRow.Cells[1].Text);
            cmd.Parameters.AddWithValue("@DeliveryDate", TextBox_Date.Text);
            cmd.ExecuteNonQuery();
            conn.Close();
            Grid_Delivery.DataBind();
            Rewrite(sender);
        }

        protected void Grid_Delivery_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox_ID.Text = Grid_Delivery.SelectedRow.Cells[1].Text;
            
        }
        
        protected void Rewrite(object sender)
        {
            Button rewrite = sender as Button;
            if (rewrite.ID == "Button_Update")
            {
                TextBox_ID.Text = Grid_Delivery.SelectedRow.Cells[1].Text;
                TextBox_Date.Text = "";
            }
        }

        protected void Button_Undelivered_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\DejaBrew.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
            conn.Open();
            SqlCommand adaptData = new SqlCommand("SELECT Id, DeliveryStatus FROM Orders WHERE DeliveryStatus = 'Undelivered'", conn);
            SqlDataReader displayData = adaptData.ExecuteReader();
            if (displayData.HasRows == true)
            {
                Grid_Undelivered.DataSource = displayData;
                Grid_Undelivered.DataBind();
            }
        }

        protected void Button_Quantity_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\DejaBrew.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
            conn.Open();
            SqlCommand adaptData = new SqlCommand("SELECT OrderID, ProductID, ItemQty FROM OrderItems", conn);
            SqlDataReader displayData = adaptData.ExecuteReader();
            if (displayData.HasRows == true)
            {
                Grid_Quantity.DataSource = displayData;
                Grid_Quantity.DataBind();
            }
        }
    }
}