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
    public partial class AdminProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void BtnShowDiv_Click(object sender, EventArgs e)
        {
            Button clickedButton = sender as Button;
            if (clickedButton.ID == "BtnCreateNewProd")
            {
                if (DivCreateNewProd.Attributes["class"] == "hide")
                    DivCreateNewProd.Attributes["class"] = "show";
                else
                    DivCreateNewProd.Attributes["class"] = "hide";
            }
            else if (clickedButton.ID == "BtnUpdateNewProd")
            {
                if (DivUpdateProd.Attributes["class"] == "hide")
                    DivUpdateProd.Attributes["class"] = "show";
                else
                    DivUpdateProd.Attributes["class"] = "hide";
            }
        }

        protected void BtnSaveNewProd_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\DejaBrew.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
            conn.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO [Products](ProductName, ProductCategory, ProductPrice, ProductStock) " +
                "VALUES(@ParamName, @ParamCateg, @ParamPrice, @ParamStock)", conn);
            cmd.Parameters.AddWithValue("@ParamName", TBProdName.Text);
            cmd.Parameters.AddWithValue("@ParamCateg", DropNewProdCateg.SelectedValue);
            cmd.Parameters.AddWithValue("@ParamPrice", decimal.Parse(TBNewProdPrice.Text));
            cmd.Parameters.AddWithValue("@ParamStock", int.Parse(TBNewProdStock.Text));
            cmd.ExecuteNonQuery();
            conn.Close();
            GridUpProdList.DataBind();
            ClearAllTB(sender);
        }

        protected void ClearAllTB(object sender)
        {
            Button clickedButton = sender as Button;
            if (clickedButton.ID == "BtnSaveNewProd" || clickedButton.ID == "BtnClearNewProd")
            {
                TBProdName.Text = "";
                DropNewProdCateg.SelectedIndex = 0;
                TBNewProdPrice.Text = "";
                TBNewProdStock.Text = "";
            }
            else if (clickedButton.ID == "BtnUpdateProd" || clickedButton.ID == "BtnClearUpProd")
            {
                TBUpProdName.Text = GridUpProdList.SelectedRow.Cells[2].Text;
                DropProdCateg.SelectedValue = GridUpProdList.SelectedRow.Cells[3].Text;
                TBUpProdPrice.Text = GridUpProdList.SelectedRow.Cells[4].Text;
                ProdStat.SelectedValue = GridUpProdList.SelectedRow.Cells[6].Text;
            }
        }

        protected void GridUpProdList_SelectedIndexChanged(object sender, EventArgs e)
        {
            TBUpProdName.Text = GridUpProdList.SelectedRow.Cells[2].Text;
            DropProdCateg.SelectedValue = GridUpProdList.SelectedRow.Cells[3].Text;
            TBUpProdPrice.Text = GridUpProdList.SelectedRow.Cells[4].Text;
            ProdStat.SelectedValue = GridUpProdList.SelectedRow.Cells[6].Text;
        }

        protected void BtnUpdateProd_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\DejaBrew.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
            conn.Open();
            SqlCommand cmd = new SqlCommand("UPDATE [Products] SET ProductName = @ParamName, ProductCategory = @ParamCateg, ProductPrice = @ParamPrice, ProductStatus = @ParamStatus WHERE Id = @Id", conn);
            cmd.Parameters.AddWithValue("@Id", GridUpProdList.SelectedRow.Cells[1].Text);
            cmd.Parameters.AddWithValue("@ParamName", TBUpProdName.Text);
            cmd.Parameters.AddWithValue("@ParamCateg", DropProdCateg.SelectedValue);
            cmd.Parameters.AddWithValue("@ParamPrice", decimal.Parse(TBUpProdPrice.Text));
            cmd.Parameters.AddWithValue("@ParamStatus", ProdStat.SelectedValue);
            cmd.ExecuteNonQuery();
            conn.Close();
            GridUpProdList.DataBind();
            ClearAllTB(sender);
        }

        protected void BtnClearNewProd_Click(object sender, EventArgs e)
        {
            ClearAllTB(sender);
        }

        protected void BtnClearUpProd_Click(object sender, EventArgs e)
        {
            ClearAllTB(sender);
        }
    }
}