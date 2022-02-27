<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="DejaBrew.WebForm5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" type="text/css" href="DB_Styles.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;1,200&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Cormorant+Garamond:ital,wght@1,700&family=Oswald&family=Pacifico&family=Redressed&family=Roboto+Serif&family=Ultra&display=swap" rel="stylesheet" />
    <title>DejaBrew Coffee Company</title>
</head>
<body>
    <div class="CheckoutCenterDiv">
        <form id="form1" runat="server">
        <div class="navgtn">
            <nav class="Checkoutnav">
                <div class="checkoutreturn" onclick="location.href='Cart.aspx'">
                    <h1 class="clickHome">
                        < Home
                    </h1>
                </div>
                <div class="Checkoutpic">
                    <header>
                        <img class="Logopic" src="Images/DB_Logo_1.png" />
                    </header>
                </div>
            </nav>
        </div>
        <div class="CheckoutHeader">
            SECURE CHECKOUT
        </div>
        <div class="DivContainers">
            <div class="LeftContainer">
                <div class="Shipping">
                    <header class="ShippingTitle"> SHIPPING</header>
                </div>
                <div class="innerShipping">
                    <div class="LabelFname">
                        <asp:Label ID="Label1" runat="server" Text="First Name:"></asp:Label>
                    </div>
                    <div>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="txtName"></asp:TextBox>
                    </div>
                    <div class="LName">
                        <asp:Label ID="Label2" runat="server" Text="Last Name:"></asp:Label>
                    </div>
                    <div>
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="txtLName"></asp:TextBox>
                    </div>
                    <div class="EmailLabel">
                        <asp:Label ID="Label3" runat="server" Text="E-mail:"></asp:Label>
                    </div>
                    <div>
                        <asp:TextBox ID="TextBox3" runat="server" CssClass="EmailTXT"></asp:TextBox>
                    </div>
                    <div class="MobileLabel">
                        <asp:Label ID="Label4" runat="server" Text="Mobile Number:"></asp:Label>
                    </div>
                    <div>
                        <asp:TextBox ID="TextBox4" runat="server" CssClass="MobileTxt"></asp:TextBox>
                    </div>
                    <div class="AddressLabel">
                        <asp:Label ID="Label5" runat="server" Text="Address Line:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox5" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
                    <div>
                        <asp:TextBox ID="TextBox5" runat="server" CssClass="AddressTxt"></asp:TextBox>
                    </div>
                    <div class="MunicipalityLabel">
                        <asp:Label ID="Label6" runat="server" Text="Municipality:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox6" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
                    <div>
                        <asp:TextBox ID="TextBox6" runat="server" CssClass="MuniTxt"></asp:TextBox>
                    </div>
                    <div class="ProvLBL">
                        <asp:Label ID="Label7" runat="server" Text="Province:"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox8" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </div>
                    <div>
                        <asp:TextBox ID="TextBox7" runat="server" CssClass="ProvTxt"></asp:TextBox>
                    </div>
                    <div class="ZipLbl">                       
                        <asp:Label ID="Label8" runat="server" Text="Zip Code:"></asp:Label>                    
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox8" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox8" ErrorMessage="RangeValidator" ForeColor="Red" MaximumValue="9810" MinimumValue="1051">Please enter a valid zip code</asp:RangeValidator>
                    </div>
                    <div>
                        <asp:TextBox ID="TextBox8" runat="server" CssClass="ZipTXT"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="rightContainer">
                <div class="Summary">
                    <header class="SummaryTitle">SUMMARY</header>
                </div>
                <div class="innerSummary">
                    <div class="itemsAdded">

                        <asp:GridView CssClass="CheckoutGrid" ID="GridCheckout" runat="server" AutoGenerateColumns="False" GridLines="None">
                            <Columns>
                                <asp:boundfield datafield="ItemQty" headertext="Item Quantity" ItemStyle-CssClass="QuantityPadding">
<ItemStyle CssClass="QuantityPadding"></ItemStyle>
                                </asp:boundfield>
                                <asp:boundfield datafield="ProductName" headertext="Product Name" ItemStyle-CssClass="ProdPadding">
<ItemStyle CssClass="ProdPadding"></ItemStyle>
                                </asp:boundfield>
                                <asp:boundfield datafield="ItemPrice" headertext="Price" DataFormatString="{0:F2}" ItemStyle-CssClass="ItemPadding">
<ItemStyle CssClass="ItemPadding"></ItemStyle>
                                </asp:boundfield>
                            </Columns>
                        </asp:GridView>

                    </div>
                    <div class="Total">
                        <asp:Label  ID="Label9" runat="server" Text="Total: "></asp:Label>
                        <asp:Label  ID="Label10" runat="server" Text="₱ 0.00"></asp:Label>
                    </div>
                    <div class="Btns">
                        <asp:Button ID="Button1" runat="server" CssClass="CheckoutBtn" Text="Checkout" OnClick="Button1_Click"/>
                        <asp:Button ID="Button2" runat="server" CssClass="CancelBtn" Text="Cancel" CausesValidation="False" OnClick="Button2_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
    </div>
    <div class="FooterDiv">
        <div class="divFooter">
        <footer>
            <ul class="SocialMedia">
                <li>
                    <a href="#">
                        <i class="fa-brands fa-facebook"></i>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fa-brands fa-instagram"></i>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fa-brands fa-twitter"></i>
                    </a>
                </li>
            </ul>
            <ul class="InfoUL">
                <li>
                    <a href="#">Info</a><span> • </span><a href="#">Support</a><span> • </span><a href="#">Marketing</a>
                </li>
            </ul>
            <ul class="Terms">
                <li>
                    <a href="#">Terms of use</a><span> • </span><a href ="#">Privacy Policy</a>
                </li>
            </ul>
        </footer>
        <div class="FooterP">
            <p>@2022 Copyright: DejaBrew Coffee Co.</p>
        </div>
        </div>
    </div>
</body>
</html>
