using System;
using System.Collections.Specialized;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace DejaBrew
{
    public partial class ProductList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string currCategory = Request.QueryString["ctg"];
            if (currCategory == "HotDrinks")
            {
                CategoryLabel.Text = "Hot Drinks";
            }
            else if (currCategory == "ColdDrinks")
            {
                CategoryLabel.Text = "Cold Drinks";
            }
            else if (currCategory == "Pastries")
            {
                CategoryLabel.Text = "Pastries";
            }
            else if (currCategory == "Frappuccino")
            {
                CategoryLabel.Text = "Frappuccino";
            }
        }

        protected void AddCartItem(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Cart" && !string.IsNullOrEmpty(HttpContext.Current.Session["userid"] as string))
            {
                CartActions shoppingCart = new CartActions();
                shoppingCart.AddCartItem(Convert.ToInt32(e.CommandArgument));
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }
        }
    }
}