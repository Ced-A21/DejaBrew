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
            CartActions shoppingCart = new CartActions();
            GridCheckout.DataSource = shoppingCart.GetCartItems();
            GridCheckout.DataBind();
            Label10.Text = String.Format("{0:C}", shoppingCart.GetCartTotal());
        }

    }
}