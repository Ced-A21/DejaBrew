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
    public partial class UserProfile : System.Web.UI.Page
    {
        static string conpath = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\DejaBrew.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework";
        SqlConnection con = new SqlConnection(conpath);

        string userfname = "";
        string userlname = "";
        string usermobile = "";
        string useremail = "";
        string UserID = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();

            try
            {
                UserID = (string)Session["userid"];

                string cmd_text = $"select UserFname from Users where UserID = '{UserID}'";
                SqlCommand findfname_cmd = new SqlCommand(cmd_text, con);
                userfname = findfname_cmd.ExecuteScalar() as string;

                cmd_text = $"select UserLname from Users where UserID = '{UserID}'";
                SqlCommand findlname_cmd = new SqlCommand(cmd_text, con);
                userlname = findlname_cmd.ExecuteScalar() as string;

                cmd_text = $"select UserMobile from Users where UserID = '{UserID}'";
                SqlCommand findmobile_cmd = new SqlCommand(cmd_text, con);
                usermobile = findmobile_cmd.ExecuteScalar() as string;

                cmd_text = $"select UserEmail from Users where UserID = '{UserID}'";
                SqlCommand findemail_cmd = new SqlCommand(cmd_text, con);
                useremail = findemail_cmd.ExecuteScalar() as string;


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
        
        protected void change_save_Click(object sender, EventArgs e)
        {

            if(fname.Text == userfname)
            {
                Response.Redirect("Home.aspx");
            }


        }
    }
}