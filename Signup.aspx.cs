using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Data;
using System.Data.SqlClient;

namespace DejaBrew
{
    public partial class Signup : System.Web.UI.Page
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
;

            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void CustomValidator1_ServerValidate1(object source, ServerValidateEventArgs args)
        {
            if (pass.Text.Length >= 8 && pass.Text.Length <= 50)
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
            if (pass.Text.Any(char.IsUpper) == true)
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
            if (pass.Text.Any(char.IsLower) == true)
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
            if (pass.Text.Any(char.IsDigit) == true)
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
            MatchCollection matchedAuthors = rgex.Matches(pass.Text);

            if (matchedAuthors.Count != 0)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }
        protected void reset()
        {
            fname.Text = "";
            lname.Text = "";
            email.Text = "";
            mobile.Text = "";
            pass.Text = "";
            conpass.Text = "";
            agree.Checked = false;
            pass_peek.Checked = false;
            conpass_peek.Checked = false;
            peek(pass, pass_peek);
            peek(conpass, conpass_peek);
            ValidationSummary1.ShowSummary = false;
            agree.Text = null;
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
        protected void pass_TextChanged(object sender, EventArgs e)
        {
            peek(pass, pass_peek);
            
            CustomValidator1.Validate();
            CustomValidator2.Validate();
            CustomValidator3.Validate();
            CustomValidator4.Validate();
            CustomValidator5.Validate();
            ValidationSummary1.ShowSummary = true;
        }

        protected void pass_peek_CheckedChanged(object sender, EventArgs e)
        {
            peek(pass, pass_peek);
        }

        protected void conpass_peek_CheckedChanged(object sender, EventArgs e)
        {
            peek(conpass, conpass_peek);
        }

        protected void clear_Click(object sender, EventArgs e)
        {
            reset();
        }



        protected void submit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid && agree.Checked)
            {
                string find_text = $"select UserEmail from Users where UserEmail = '{email.Text.Trim()}'";
                SqlCommand findcmd = new SqlCommand(find_text, con);
                SqlDataAdapter sd = new SqlDataAdapter(findcmd);
                DataTable dt = new DataTable();
                sd.Fill(dt);

                if(dt.Rows.Count > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Uh-0h, this email is already registered');", true);
                }
                else
                {
                    Guid id = Guid.NewGuid();

                    string insert_text = $"insert into Users (UserID, UserFname, UserLname, UserEmail, UserMobile, UserPass)" +
                                       $"values('{id.ToString()}', '{fname.Text.ToUpper()}', '{lname.Text.ToUpper()}', '{email.Text.Trim()}', '{mobile.Text}', '{pass.Text}')";

                    SqlCommand insertcmd = new SqlCommand(insert_text, con);
                    insertcmd.ExecuteNonQuery();
                    reset();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully Inserted');", true);
                    Response.Redirect("Home.aspx");
                }                
            }
            else
            {
                agree.Text = " *";
            }

        }
    }
}