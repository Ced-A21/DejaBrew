using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DejaBrew
{
    public partial class AdminCollection : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Panel2.Visible = false;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            Panel2.Visible = true;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Panel2.Visible = false;
            TextBox8.Text = "";
            TextBox9.Text = "";
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            Panel2.Visible = true;

            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\DejaBrew.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
            SqlDataAdapter sda = new SqlDataAdapter("SELECT OrderTotal from Orders", con);

            DataTable dt = new DataTable();
            sda.Fill(dt);

            

            TextBox8.Text = "0";
            for (int i = 0; i < GridView2.Rows.Count; i++)
            {

                TextBox8.Text = Convert.ToString(decimal.Parse(TextBox8.Text) + decimal.Parse(GridView2.Rows[i].Cells[1].Text.ToString()));

            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Panel2.Visible = false;

            TextBox9.Text = "0";
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {

                TextBox9.Text = Convert.ToString(decimal.Parse(TextBox9.Text) + decimal.Parse(GridView1.Rows[i].Cells[2].Text.ToString()));

            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gr = GridView1.SelectedRow;
            TextBox2.Text = gr.Cells[1].Text;
            TextBox3.Text = gr.Cells[2].Text;
            TextBox4.Text = gr.Cells[3].Text;
            TextBox5.Text = gr.Cells[4].Text;
            TextBox6.Text = gr.Cells[5].Text;
            TextBox7.Text = gr.Cells[6].Text;
        }

        protected void Button6_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\DejaBrew.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
            string sqlquery = "SELECT * from Orders where cast(DeliveryDate as Date) between '" + TextBox10.Text + "'and'" + TextBox11.Text + "'";
            SqlCommand sqlcomm = new SqlCommand(sqlquery, con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            SqlDataReader sdr = sqlcomm.ExecuteReader();
            if (sdr.Read())
            {
                GridView3.DataSource = dt;
                GridView3.DataBind();
            }
            else
            {

            }
            con.Close();




        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            TextBox12.Text = "0";
            for (int i = 0; i < GridView3.Rows.Count; i++)
            {

                TextBox12.Text = Convert.ToString(decimal.Parse(TextBox12.Text) + decimal.Parse(GridView3.Rows[i].Cells[1].Text.ToString()));

            }
        }
    }
}