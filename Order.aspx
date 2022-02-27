<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="DejaBrew.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="OrderDiv" style="min-height:80vh;">
        <div style="flex-direction:column;">
            <div class="HeaderDiv" style="height:8vh;">
                <header class="OrderHeader">
                    ORDER STATUS
                </header>
            </div>
            <div class="InnerStats">
                <asp:GridView ID="GridOrder" runat="server" CssClass="OrderGrid">
                </asp:GridView>
<%--                    <div>
                        <asp:Label ID="Label4" runat="server" Text="Location:"></asp:Label>
                    &nbsp;
                        <asp:Label ID="Label9" runat="server" Text="Fantasy World"></asp:Label>
                    </div>--%>
                
            </div>
        </div>
    </div>
</asp:Content>
