using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DejaBrew
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CartActions checkout = new CartActions();
                GridCheckout.DataSource = checkout.GetCartItems();
                GridCheckout.DataBind();
                Label10.Text = String.Format("{0:C}", checkout.GetCartTotal());
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            CartActions checkout = new CartActions();
            checkout.CheckoutCart();
            Response.Redirect("~/Home.aspx");
        }
    }
}