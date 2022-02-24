using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace DejaBrew
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CartActions shoppingCart = new CartActions();
            GridCart.DataSource = shoppingCart.GetCartItems();
            GridCart.DataBind();
        }

    }
}