using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace DejaBrew
{
    public partial class UserPassword : System.Web.UI.Page
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

        protected void peek_newpass_CheckedChanged(object sender, EventArgs e)
        {
            peek(newpass, peek_newpass);
        }

        protected void newpass_TextChanged(object sender, EventArgs e)
        {
            peek(newpass, peek_newpass);
            Validate_Newpass();
        }

        protected void peek_conpass_CheckedChanged(object sender, EventArgs e)
        {
            peek(conpass, peek_conpass);
        }

        protected void conpass_TextChanged(object sender, EventArgs e)
        {
            peek(conpass, peek_conpass);
        }



        protected void Validate_Newpass()
        {
            CustomValidator1.Validate();
            CustomValidator2.Validate();
            CustomValidator3.Validate();
            CustomValidator4.Validate();
            CustomValidator5.Validate();
            ValidationSummary1.ShowSummary = true;
        }
        protected void CustomValidator1_ServerValidate1(object source, ServerValidateEventArgs args)
        {
            if (newpass.Text.Length >= 8 && pass.Text.Length <= 50)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }

        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (newpass.Text.Any(char.IsUpper) == true)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void CustomValidator3_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (newpass.Text.Any(char.IsLower) == true)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void CustomValidator4_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (newpass.Text.Any(char.IsDigit) == true)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }
        protected void CustomValidator5_ServerValidate(object source, ServerValidateEventArgs args)
        {

            String regex = "[^a-zA-Z0-9]+";
            Regex rgex = new Regex(regex);
            MatchCollection matchedAuthors = rgex.Matches(newpass.Text);

            if (matchedAuthors.Count != 0)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserProfile.aspx");
        }

        protected void save_Click(object sender, EventArgs e)
        {
            
                string UserID = (string)Session["userid"];

                string cmd_text = $"select UserPass from Users where UserID = '{UserID}'";
                SqlCommand findpass_cmd = new SqlCommand(cmd_text, con);
                string sqlpass = findpass_cmd.ExecuteScalar() as string;


                if(sqlpass == pass.Text)
                {
                    cmd_text = $"update Users set UserPass = '{newpass.Text}' where UserID = '{UserID}'";
                    SqlCommand changefname_cmd = new SqlCommand(cmd_text, con);
                    changefname_cmd.ExecuteNonQuery();
                    Response.Redirect("userProfile.aspx");
                }
                else
                {
                    invalid_pass.Visible = true;
                }
        }


                
        
    }
}