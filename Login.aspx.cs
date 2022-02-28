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
            string findacc = $"select UserID from Users where UserEmail = '{email.Text.Trim()}' and UserPass = '{pass.Text}'";
            SqlCommand findacc_cmd = new SqlCommand(findacc, con);
            string UserID = findacc_cmd.ExecuteScalar() as string;

            if (UserID != null)
            {
                string findname = $"select UserFname from Users where UserID = '{UserID}'";
                SqlCommand findname_cmd = new SqlCommand(findname, con);
                string Name = findname_cmd.ExecuteScalar() as string;

                Session["userid"] = UserID;
                Session["username"] = Name;

                SqlCommand addCart = new SqlCommand("INSERT INTO ShoppingCarts(Id, CartTotal)" +
                    "VALUES(@ParamCartID, 0)", con);
                addCart.Parameters.AddWithValue("@ParamCartID", UserID);

                SqlCommand userIDExists = new SqlCommand("SELECT Id FROM ShoppingCarts WHERE Id = @ParamCartID", con);
                userIDExists.Parameters.AddWithValue("@ParamCartID", UserID);

                if (userIDExists.ExecuteNonQuery() == 0)
                {
                    addCart.ExecuteNonQuery();
                }
                else
                {
                    Response.Redirect("UserProfile.aspx");
                }

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