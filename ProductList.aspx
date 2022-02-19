﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="DejaBrew.ProductList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .center {
            margin: auto;
            width: 60%;
            border: 5px solid #FFFF00;
            padding: 10px;
        }
        .center-tb {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="center">
        <asp:ListView ID="ProductListView" runat="server" DataSourceID="DejaBrewDb" RepeatColumns="3" GroupItemCount="3">
            <LayoutTemplate>
                <table width="100%">
                    <tr ID="groupPlaceholder" runat="server">
                    </tr>
                </table>
            </LayoutTemplate>
            <GroupTemplate>
                <tr>
                    <td ID="itemPlaceholder" runat="server">
                    </td>
                </tr>
             </GroupTemplate>
            <ItemTemplate>
                <td class="center-tb">
                    <img src="images/placeholder.png" height="100" width="100"/>
                    <br />
                    <span><asp:Label ID="ProductNameLabel" runat="server" Text='<%# Eval("ProductName") %>' /></span>
                    <br />
                    <span><asp:Label ID="ProductPriceLabel" runat="server" Text='<%# String.Format("{0:C}", Eval("ProductPrice") ) %>' /></span>
                    <br />
                </td>
            </ItemTemplate>
            <GroupSeparatorTemplate>
                <tr runat="server">
                    <td colspan="3"><hr /></td>
                </tr>
            </GroupSeparatorTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="DejaBrewDb" runat="server" ConnectionString="<%$ ConnectionStrings:DejaBrewDb %>" SelectCommand="SELECT [ProductName], [ProductPrice] FROM [Products] WHERE REPLACE([ProductCategory], ' ', '') = @Category">
            <SelectParameters><asp:QueryStringParameter runat="server" name="Category" type="string" querystringfield="ctg" /></SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>