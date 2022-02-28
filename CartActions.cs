using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DejaBrew
{
    public class CartActions
    {
        public string cartID { get; set; }
        public const string cartSessionID = "cartId";

        public string GetCartID()
        {
            if (HttpContext.Current.Session[cartSessionID] == null)
            { 
                if (!string.IsNullOrEmpty(HttpContext.Current.Session["userid"] as string))
                {
                    HttpContext.Current.Session[cartSessionID] = HttpContext.Current.Session["userid"];
                }
            }
            return HttpContext.Current.Session[cartSessionID].ToString();
        }
        public void AddCartItem(int productID)
        {
            cartID = GetCartID();

            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\DejaBrew.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
            conn.Open();
            SqlCommand getCartItem = new SqlCommand("SELECT Id, ProductID, CartID, ItemQty, ItemPrice FROM CartItems WHERE CartID = @ParamCartID AND ProductID = @ParamProductID", conn);
            getCartItem.Parameters.AddWithValue("@ParamCartID", cartID);
            getCartItem.Parameters.AddWithValue(@"ParamProductID", productID);
            var cartItem = getCartItem.ExecuteReader();
            cartItem.Read();

            //Find price per product
            SqlCommand findPrice = new SqlCommand("SELECT ProductPrice FROM Products WHERE Id = @ParamProdID", conn);
            findPrice.Parameters.AddWithValue("@ParamProdID", productID);
            decimal? price = findPrice.ExecuteScalar() as decimal?;

            if (!cartItem.HasRows)
            {
                // Then add cart item
                SqlCommand addCartItem = new SqlCommand("INSERT INTO CartItems(Id, ProductID, CartID, ItemQty, ItemPrice)" +
                    "VALUES(@ParamCartItemID, @ParamProductId, @ParamCartID, @ParamItemQty, @ParamItemPrice)", conn);
                addCartItem.Parameters.AddWithValue("@ParamProductID", productID);
                addCartItem.Parameters.AddWithValue("@ParamCartID", cartID);
                addCartItem.Parameters.AddWithValue("@ParamItemQty", 1);
                addCartItem.Parameters.AddWithValue("@ParamItemPrice", price);
                addCartItem.Parameters.AddWithValue("@ParamCartItemID", Guid.NewGuid().ToString());
                addCartItem.ExecuteNonQuery();
            }
            else
            {
                // Increment ItemQty and update product price
                SqlCommand updateQty = new SqlCommand("UPDATE CartItems SET ItemQty = ItemQty + 1 WHERE Id = @ParamId;" +
                    "UPDATE CartItems SET ItemPrice = @ParamPrice * ItemQty WHERE Id = @ParamId;", conn);
                    /*"UPDATE Products SET ProductStock = ProductStock - 1 FROM Products INNER JOIN CartItems ON Products.Id = CartItems.ProductID", conn);*/ // Separate with a semi-colon so the ItemQty update executes first
                updateQty.Parameters.AddWithValue("@ParamId", cartItem[0].ToString());
                updateQty.Parameters.AddWithValue("ParamPrice", price);
                updateQty.ExecuteNonQuery();
            }
            conn.Close();
        }

        public void RemoveCartItem(string cartItemID)
        {
            cartID = GetCartID();

            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\DejaBrew.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
            conn.Open();
            SqlCommand removeCartItem = new SqlCommand("DELETE FROM CartItems WHERE Id = @ParamCartItemID", conn);
            removeCartItem.Parameters.AddWithValue("@ParamCartItemID", cartItemID);
            removeCartItem.ExecuteNonQuery();
            conn.Close();
        }

        public void ChangeQuantity(string cartItemID, int qty, decimal price)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\DejaBrew.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
            conn.Open();
            SqlCommand updateQty = new SqlCommand("UPDATE CartItems SET ItemQty = @ParamSetQty WHERE Id = @ParamId;" +
                "UPDATE CartItems SET ItemPrice = @ParamPrice * ItemQty WHERE Id = @ParamId;", conn);
                //"UPDATE Products SET ProductStock = ProductStock - @ParamSetQty FROM Products INNER JOIN CartItems ON Products.Id = CartItems.ProductID", conn);
            updateQty.Parameters.AddWithValue("@ParamSetQty", qty);
            updateQty.Parameters.AddWithValue("@ParamId", cartItemID);
            updateQty.Parameters.AddWithValue("@ParamPrice", price);
            updateQty.ExecuteNonQuery();
            conn.Close();
        }
        public decimal GetCartTotal()
        {
            cartID = GetCartID();

            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\DejaBrew.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
            conn.Open();
            SqlCommand getTotal = new SqlCommand("SELECT SUM(ItemPrice) FROM CartItems WHERE CartID = @ParamCartID", conn);
            getTotal.Parameters.AddWithValue("@ParamCartID", cartID);
            decimal? total = decimal.Zero;
            total = getTotal.ExecuteScalar() as decimal?;
            SqlCommand setTotal = new SqlCommand("UPDATE ShoppingCarts SET CartTotal = @ParamCartTotal WHERE Id = @ParamCartID", conn);
            setTotal.Parameters.AddWithValue("@ParamCartTotal", total);
            setTotal.Parameters.AddWithValue("@ParamCartID", cartID);
            setTotal.ExecuteNonQuery();
            conn.Close();
            return total ?? decimal.Zero;
        }
        public int GetStock(string cartItemID)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\DejaBrew.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
            conn.Open();
            SqlCommand getStock = new SqlCommand("SELECT ProductStock FROM Products JOIN CartItems ON Products.Id = CartItems.ProductID WHERE CartItems.Id = @ParamCartItemID", conn);
            getStock.Parameters.AddWithValue("@ParamCartItemID", cartItemID);
            int stock = (int)getStock.ExecuteScalar();
            conn.Close();
            return stock;
        }
        public SqlDataReader GetCartItems()
        {
            cartID = GetCartID();

            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\DejaBrew.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
            conn.Open();
            SqlCommand getCartItem = new SqlCommand("SELECT CartItems.Id, Products.ProductPrice, Products.ProductName, ItemQty, ItemPrice FROM CartItems INNER JOIN Products ON CartItems.ProductID = Products.Id WHERE CartID = @ParamCartID", conn);
            getCartItem.Parameters.AddWithValue("@ParamCartID", cartID);
            var cartItems = getCartItem.ExecuteReader();
            return cartItems;
        }

        public void CheckoutCart()
        {
            cartID = GetCartID();
            DateTime myDateTime = DateTime.Now;
            string completionDate = myDateTime.ToString("yyyy-MM-dd HH:mm:ss.fff");

            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\DejaBrew.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
            conn.Open();
            SqlCommand insertIntoOrders = new SqlCommand("INSERT INTO Orders(CartID, OrderTotal, CompletionDate)" +
                    "SELECT Id, CartTotal, @ParamCompletion FROM ShoppingCarts WHERE Id = @ParamCartID;", conn);
            insertIntoOrders.Parameters.AddWithValue("@ParamCompletion", completionDate);
            insertIntoOrders.Parameters.AddWithValue("@ParamCartID", cartID);

            SqlCommand insertIntoOrderItems = new SqlCommand("INSERT INTO OrderItems(Id, ProductID, OrderID, ItemQty, ItemPrice)" +
                    "SELECT CartItems.Id, CartItems.ProductID, MAX(Orders.Id), CartItems.ItemQty, CartItems.ItemPrice FROM CartItems INNER JOIN Orders ON Orders.CartID = CartItems.CartID GROUP BY CartItems.Id, CartItems.ProductID, CartItems.ItemQty, CartItems.ItemPrice", conn);
            insertIntoOrderItems.Parameters.AddWithValue("@ParamCartID", cartID);

            SqlCommand deleteCartItems = new SqlCommand("DELETE CartItems WHERE CartID = @ParamCartID", conn);
            deleteCartItems.Parameters.AddWithValue("@ParamCartID", cartID);


            insertIntoOrders.ExecuteNonQuery();
            insertIntoOrderItems.ExecuteNonQuery();
            deleteCartItems.ExecuteNonQuery();

            conn.Close();
        }
    }
}