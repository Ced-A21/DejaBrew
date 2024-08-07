﻿using System;
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
            if (!IsPostBack)
            {
                if (shoppingCart.GetCartItems().HasRows)
                {
                    DivCheckoutBtn.Attributes["class"] = "show";
                }
                else
                {
                    DivCheckoutBtn.Attributes["class"] = "hide";
                }
                GridCart.DataSource = shoppingCart.GetCartItems();
                GridCart.DataBind();
            }
        }

        protected void GridCart_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            CartActions shoppingCart = new CartActions();
            string cartItemID = GridCart.DataKeys[e.RowIndex].Values[0].ToString();
            shoppingCart.RemoveCartItem(cartItemID);
            if (shoppingCart.GetCartItems().HasRows)
            {
                DivCheckoutBtn.Attributes["class"] = "show";
            }
            else
            {
                DivCheckoutBtn.Attributes["class"] = "hide";
            }
            GridCart.DataSource = shoppingCart.GetCartItems();
            GridCart.DataBind();
        }

        protected void qty_TextChanged(object sender, EventArgs e)
        {
            CartActions shoppingCart = new CartActions();
            TextBox TBqty = sender as TextBox;
            GridViewRow gvr = TBqty.NamingContainer as GridViewRow;
            string cartItemID = GridCart.DataKeys[gvr.RowIndex].Values[0].ToString();
            decimal price = Convert.ToDecimal(GridCart.DataKeys[gvr.RowIndex].Values[1]);
            int qty = Convert.ToInt32(TBqty.Text);
            shoppingCart.ChangeQuantity(cartItemID, qty, price);
            GridCart.DataSource = shoppingCart.GetCartItems();
            GridCart.DataBind();
        }

        protected void GridCart_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            CartActions shoppingCart = new CartActions();
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TextBox tb = e.Row.FindControl("qty") as TextBox;
                GridViewRow gvr = tb.NamingContainer as GridViewRow;
                string cartItemID = GridCart.DataKeys[gvr.RowIndex].Values[0].ToString();
                tb.Attributes.Add("min", "1");
                tb.Attributes.Add("max", shoppingCart.GetStock(cartItemID).ToString());
            }
        }
    }
}