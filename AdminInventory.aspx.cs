using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace DejaBrew
{
    public partial class AdminInventory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void BtnShowDiv_Click(object sender, EventArgs e)
        {
            Button clickedButton = sender as Button;
            if (clickedButton.ID == "BtnAddStock")
            {
                if (DivAddProdStock.Attributes["class"] == "hide")
                    DivAddProdStock.Attributes["class"] = "show";
                else
                    DivAddProdStock.Attributes["class"] = "hide";
            }
        }
        protected void GridProdList_SelectedIndexChanged(object sender, EventArgs e)
        {
            TBStock.Text = GridProdList.SelectedRow.Cells[3].Text;
        }

        protected void BtnAddToStock_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\DejaBrew.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
            conn.Open();
            SqlCommand cmd = new SqlCommand("UPDATE[Products] SET ProductStock = @ParamStock WHERE Id = @Id", conn);
            cmd.Parameters.AddWithValue("@Id", GridProdList.SelectedRow.Cells[1].Text);
            cmd.Parameters.AddWithValue("@ParamStock", int.Parse(TBStock.Text));
            cmd.ExecuteNonQuery();
            conn.Close();
            GridProdList.DataBind();
        }
    }
}