<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="DejaBrew.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .div-images {
            border-radius: 50%;
            width: 100px;
            height: 100px;
            background-color: #FF8303;
            vertical-align: middle;
        }
        .div-container {
            margin-top: 40px;
        }
        .div-button {
            border-radius: 80px;
            border: 3px solid #A35709;
            width: 250px;
            height: auto;
            padding: 10px;
            margin-bottom: 15px;
        }
        a {
            text-decoration: none;
            color: black;
            font-weight: bolder;
        }
        a:hover {
            color: #FF8303;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--Placeholder until I decide to make a better category selection. Feel free to add/edit css/html stuffs.--%>
    <div class="div-container" style="text-align:left; padding-left: 45%; min-height:80vh;">
        <div class="div-button">
            <a href="/ProductList.aspx?ctg=ColdDrinks">
                <img class="div-images" src="images/placeholder.png" />
                &emsp;Cold drinks
            </a>
        </div>
        <div class="div-button">
            <a href="/ProductList.aspx?ctg=HotDrinks"><img class="div-images" src="images/placeholder.png" />
                &emsp;Hot drinks
            </a>
        </div>
        <div class="div-button">
            <a href="/ProductList.aspx?ctg=Pastries"><img class="div-images" src="images/placeholder.png" />
                &emsp;Pastries
            </a>
        </div>
        <div class="div-button">
            <a href="/ProductList.aspx?ctg=Frappuccino"><img class="div-images" src="images/placeholder.png" />
                &emsp;Frappuccino
            </a>
        </div>
    </div>

</asp:Content>
