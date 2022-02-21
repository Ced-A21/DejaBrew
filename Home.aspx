<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="DejaBrew.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="HomeDiv">
        <main>
            <div class="MainHomeDiv">
                <div class="WelcomeText">
                    <h3 class="HomeH3">Welcome!</h3>
                    <div><header class="HomeHeader">Deja Brew</header></div>
                    <div><h2 class="h2Head">Serving only the best coffee in the city</h2></div>
                    <div class="buttons">
                        <div onclick="location.href='Products.aspx'" class="ProductButton" >
                            <a class="Homeabout" href="Products.aspx">Our Products</a>
                        </div>
                        <div class="AboutButton" onclick="location.href='AboutUs.aspx'">
                            <a class="aboutbutton" href="AboutUs.aspx">About Deja Brew</a>
                        </div>
                    </div>
                </div>
                <img class="HomePic" src="Images/coffee1.jpg" />
            </div>
        </main>
        <section>

        </section>
    </div>
</asp:Content>
