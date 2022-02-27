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
        public int cartId { get; set; }

        public string GetCartID()
        {
            HttpContext.Current.Session["cartID"] = HttpContext.Current.Session["userID"];
            return HttpContext.Current.Session["cartID"].ToString();
        }
        public void AddCartItem(int productID)
        {
            cartId = 1; // Test, replace once cart is tied to an account

            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\DejaBrew.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
            conn.Open();
            SqlCommand getCartItem = new SqlCommand("SELECT Id, ProductID, CartID, ItemQty, ItemPrice FROM CartItems WHERE CartID = 1 AND ProductID = @ParamProductID", conn); // Test, use cart table when card is tied to an account
            getCartItem.Parameters.AddWithValue("@ParamProductID", productID);
            var cartItem = getCartItem.ExecuteReader();
            cartItem.Read();

            //Find price per product
            SqlCommand findPrice = new SqlCommand("SELECT ProductPrice FROM Products WHERE Id = @ParamProdID", conn);
            findPrice.Parameters.AddWithValue("@ParamProdID", productID);
            decimal? price = findPrice.ExecuteScalar() as decimal?;

            if (!cartItem.HasRows)
            {
                // Then add cart item
                SqlCommand addCartItem = new SqlCommand("INSERT INTO CartItems(ProductID, CartID, ItemQty, ItemPrice)" +
                    "VALUES(@ParamProductId, @ParamCartID, @ParamItemQty, @ParamItemPrice)", conn);
                addCartItem.Parameters.AddWithValue("@ParamProductID", productID);
                addCartItem.Parameters.AddWithValue("@ParamCartID", cartId);
                addCartItem.Parameters.AddWithValue("@ParamItemQty", 1);
                addCartItem.Parameters.AddWithValue("@ParamItemPrice", price);
                addCartItem.ExecuteNonQuery();
            }
            else
            {
                // Increment ItemQty and update product price
                SqlCommand updateQty = new SqlCommand("UPDATE CartItems SET ItemQty = ItemQty + 1 WHERE Id = @ParamId;" +
                    "UPDATE CartItems SET ItemPrice = @ParamPrice * ItemQty WHERE Id = @ParamId;", conn);
                    /*"UPDATE Products SET ProductStock = ProductStock - 1 FROM Products INNER JOIN CartItems ON Products.Id = CartItems.ProductID", conn);*/ // Separate with a semi-colon so the ItemQty update executes first
                updateQty.Parameters.AddWithValue("@ParamId", Convert.ToInt32(cartItem[0]));
                updateQty.Parameters.AddWithValue("ParamPrice", price);
                updateQty.ExecuteNonQuery();
            }
            conn.Close();
        }

        public void RemoveCartItem(int cartItemID)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\DejaBrew.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
            conn.Open();
            SqlCommand removeCartItem = new SqlCommand("DELETE FROM CartItems WHERE Id = @ParamCartItemID", conn);
            removeCartItem.Parameters.AddWithValue("@ParamCartItemID", cartItemID);
            removeCartItem.ExecuteNonQuery();
            conn.Close();
        }

        public void ChangeQuantity(int cartItemID, int qty, decimal price)
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
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\DejaBrew.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
            conn.Open();
            SqlCommand getTotal = new SqlCommand("SELECT SUM(ItemPrice) FROM CartItems WHERE CartID = @ParamCartID", conn);
            getTotal.Parameters.AddWithValue("@ParamCartID", 1);
            decimal? total = decimal.Zero;
            total = getTotal.ExecuteScalar() as decimal?;
            return total ?? decimal.Zero;
        }
        public int GetStock(int cartItemID)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\DejaBrew.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
            conn.Open();
            SqlCommand getStock = new SqlCommand("SELECT ProductStock FROM Products JOIN CartItems ON Products.Id = CartItems.ProductID WHERE CartItems.Id = @ParamCartItemID", conn);
            getStock.Parameters.AddWithValue("@ParamCartItemID", cartItemID);
            int stock = (int)getStock.ExecuteScalar();
            return stock;
        }
        public SqlDataReader GetCartItems()
        {
            cartId = 1; // Test, replace once cart is tied to an account

            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\DejaBrew.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
            conn.Open();
            SqlCommand getCartItem = new SqlCommand("SELECT CartItems.Id, Products.ProductPrice, Products.ProductName, ItemQty, ItemPrice FROM CartItems INNER JOIN Products ON CartItems.ProductID = Products.Id WHERE CartID = 1", conn); // Test, use cart table when card is tied to an account
            var cartItems = getCartItem.ExecuteReader();
            return cartItems;
        }

        public void CheckoutCart()
        {
            cartId = 1;
            DateTime myDateTime = DateTime.Now;
            string completionDate = myDateTime.ToString("yyyy-MM-dd HH:mm:ss.fff");

            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\DejaBrew.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
            conn.Open();
            SqlCommand checkoutCart = new SqlCommand("INSERT INTO Orders(CartID, OrderTotal, CompletionDate)" +
                    "SELECT Id, CartTotal, @ParamCompletion FROM ShoppingCarts WHERE Id = @ParamCartID;" +
                    "INSERT INTO OrderItems(Id, ProductID, OrderID, ItemQty, ItemPrice)" +
                    "SELECT Id, ProductID, CartID, ItemQty, ItemPrice FROM CartItems WHERE CartID = @ParamCartID;" +
                    "DELETE CartItems WHERE CartID = @ParamCartID;" +
                    "DELETE ShoppingCarts WHERE Id = @ParamCartID", conn);
            checkoutCart.Parameters.AddWithValue("@ParamCartID", cartId);
            checkoutCart.Parameters.AddWithValue("@ParamCompletion", completionDate);
            checkoutCart.ExecuteNonQuery();
            conn.Close();
        }
    }
}