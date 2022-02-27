using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace DejaBrew
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        string account_func = "Login.aspx";

        protected void Page_Load(object sender, EventArgs e)
        {
           if(Session["username"] != null)
            {
                account_btn.Text = (string)Session["username"];
                account_func = "UserProfile.aspx";
            }
            else
            {
                account_btn.Text = "Account";
            }
        }

        protected void account_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect(account_func);
        }
    }
}