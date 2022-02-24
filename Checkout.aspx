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
                <div class="checkoutreturn" onclick="location.href='Home.aspx'">
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
                    Hello World
                </div>
            </div>
            <div>

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
