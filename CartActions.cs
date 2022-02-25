using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace DejaBrew
{
    public class CartActions
    {
        public int cartId { get; set; }
        public void AddToCart(int productID)
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
                SqlCommand updateQty = new SqlCommand("UPDATE CartItems SET ItemQty = ItemQty + 1 WHERE Id = @ParamId; UPDATE CartItems SET ItemPrice = @ParamPrice * ItemQty WHERE Id = @ParamId", conn); // Separate with a semi-colon so the ItemQty update executes first
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
            SqlCommand updateQty = new SqlCommand("UPDATE CartItems SET ItemQty = @ParamSetQty WHERE Id = @ParamId; UPDATE CartItems SET ItemPrice = @ParamPrice * ItemQty WHERE Id = @ParamId", conn);
            updateQty.Parameters.AddWithValue("@ParamSetQty", qty);
            updateQty.Parameters.AddWithValue("@ParamId", cartItemID);
            updateQty.Parameters.AddWithValue("@ParamPrice", price);
            updateQty.ExecuteNonQuery();
            conn.Close();
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
    }
}