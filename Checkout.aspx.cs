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
    public partial class WebForm5 : System.Web.UI.Page
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

                CartActions checkout = new CartActions();
                GridCheckout.DataSource = checkout.GetCartItems();
                GridCheckout.DataBind();
                Label10.Text = String.Format("{0:C}", checkout.GetCartTotal());

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

                    TextBox1.Text = userfname;
                    TextBox2.Text = userlname;
                    TextBox4.Text = usermobile;
                    TextBox3.Text = useremail;


                }
                catch
                {
                    Response.Redirect("Home.aspx");
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            CartActions checkout = new CartActions();
            checkout.CheckoutCart();
            Response.Redirect("~/Order.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Cart.aspx");
        }

    }
}