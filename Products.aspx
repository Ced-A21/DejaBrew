<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="DejaBrew.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .div-images {
            border-radius: 50%;
            width: 100px;
            height: 100px;
            background-color: orange;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--Placeholder until I decide to make a better category selection. Feel free to add/edit css/html stuffs.--%>
    <div style="margin: 50px">
            <div>
        <a href="#"><img class="div-images" src="images/placeholder.png" />
            Cold drinks
        </a>
    </div>
    <div>
        <a href="#"><img class="div-images" src="images/placeholder.png" />
            Hot drinks
        </a>
    </div>
    <div>
        <a href="#"><img class="div-images" src="images/placeholder.png" />
            Pastries
        </a>
    </div>
    </div>

</asp:Content>
