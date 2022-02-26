<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ProductCategory.aspx.cs" Inherits="DejaBrew.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--Placeholder until I decide to make a better category selection. Feel free to add/edit css/html stuffs.--%>
    <div class="ProductCatContainer">
        <main class="CategoryImgHeader">
            <div>
                <div class="ProductHeader">
                    <header>Check out our products!</header>
                </div>
            </div>
        </main>
        <section class="Categories">
            <div class="HotandCold">
                <img class="ColdDrinks" src="Images/Untitled.jpg" onclick="location.href='/ProductList.aspx?ctg=ColdDrinks'" />
                <img class="HotDrinks" src="Images/hot.jpg" onclick="location.href='/ProductList.aspx?ctg=HotDrinks'"/>
            </div>
            <div class="frappeandPastry">
                <img class="Pastry" src="Images/pastrie.jpg" onclick="location.href='/ProductList.aspx?ctg=Pastries'"/>
                <img class="frappes" src="Images/frappe.jpg" onclick="location.href='/ProductList.aspx?ctg=Frappuccino'"/>
            </div>
        </section>
    </div>

</asp:Content>
