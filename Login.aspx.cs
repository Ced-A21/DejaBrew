using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace DejaBrew
{
    public partial class Login : System.Web.UI.Page
    {
        static string conpath = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\DejaBrew.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework";
        SqlConnection con = new SqlConnection(conpath);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();


            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string find_text = $"select UserEmail, UserPass from Users where UserEmail = '{email.Text.Trim()}' and UserPass = '{pass.Text}'";
            SqlCommand findcmd = new SqlCommand(find_text, con);
            SqlDataAdapter sd = new SqlDataAdapter(findcmd);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Response.Redirect("Home.aspx");
            }
            else
            {
                error_text1.Visible = true;
                error_text2.Visible = true;
            }
        }

        protected void peek(TextBox x, CheckBox box)
        {
            if (box.Checked)
            {
                box.Text = $" {x.Text}";
            }
            else
            {
                box.Text = " Show password";
            }
        }

        protected void peek_pass_CheckedChanged(object sender, EventArgs e)
        {
            peek(pass, peek_pass);
        }

        protected void pass_TextChanged(object sender, EventArgs e)
        {
            peek(pass, peek_pass);
        }

        protected void signup_Click(object sender, EventArgs e)
        {
            Response.Redirect("Signup.aspx");
        }
    }
}