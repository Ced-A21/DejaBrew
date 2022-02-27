using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace DejaBrew
{
    public partial class UserProfile : System.Web.UI.Page
    {
        static string conpath = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\DejaBrew.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework";
        SqlConnection con = new SqlConnection(conpath);


        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();

            if (!IsPostBack)
            {
                try
                {

                    string UserID = (string)Session["userid"];

                    string cmd_text = $"select UserFname from Users where UserID = '{UserID}'";
                    SqlCommand findfname_cmd = new SqlCommand(cmd_text, con);
                    string userfname = findfname_cmd.ExecuteScalar() as string;

                    cmd_text = $"select UserLname from Users where UserID = '{UserID}'";
                    SqlCommand findlname_cmd = new SqlCommand(cmd_text, con);
                    string userlname = findlname_cmd.ExecuteScalar() as string;

                    cmd_text = $"select UserMobile from Users where UserID = '{UserID}'";
                    SqlCommand findmobile_cmd = new SqlCommand(cmd_text, con);
                    string usermobile = findmobile_cmd.ExecuteScalar() as string;

                    cmd_text = $"select UserEmail from Users where UserID = '{UserID}'";
                    SqlCommand findemail_cmd = new SqlCommand(cmd_text, con);
                    string useremail = findemail_cmd.ExecuteScalar() as string;


                    fname.Text = userfname;
                    lname.Text = userlname;
                    mobile.Text = usermobile;
                    email.Text = useremail;

                }
                catch
                {
                    Response.Redirect("Home.aspx");
                }
            }
            else
            {
                fname.Text = fname.Text.ToUpper();
                lname.Text = lname.Text.ToUpper();
            }
            

        }
        
        protected void change_save_Click(object sender, EventArgs e)
        {
            string message = "Are you sure you want to save changes?";
            string caption = "Dejabrew";
            MessageBoxButtons buttons = MessageBoxButtons.OKCancel;
            DialogResult result;

            result = MessageBox.Show(message, caption, buttons, MessageBoxIcon.Question);
            
            if(result == System.Windows.Forms.DialogResult.OK)
            {
                string UserID = (string)Session["userid"];

                string cmd_text = $"update Users set UserFname = '{fname.Text.ToUpper()}' where UserID = '{UserID}'";
                SqlCommand changefname_cmd = new SqlCommand(cmd_text, con);
                changefname_cmd.ExecuteNonQuery();

                cmd_text = $"update Users set UserLname = '{lname.Text.ToUpper()}' where UserID = '{UserID}'";
                SqlCommand changelname_cmd = new SqlCommand(cmd_text, con);
                changelname_cmd.ExecuteNonQuery();

                cmd_text = $"update Users set UserMobile = '{mobile.Text}' where UserID = '{UserID}'";
                SqlCommand changemobile_cmd = new SqlCommand(cmd_text, con);
                changemobile_cmd.ExecuteNonQuery();

                cmd_text = $"update Users set UserEmail = '{email.Text.Trim()}' where UserID = '{UserID}'";
                SqlCommand changeemail_cmd = new SqlCommand(cmd_text, con);
                changeemail_cmd.ExecuteNonQuery();

                Session["username"] = fname.Text;
            }
            

        }

        protected void change_pass_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserPassword.aspx");
        }
    }
}