﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="DejaBrew.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="CartDiv" style="min-height:80vh;">
        <asp:GridView ID="GridCart" runat="server" CellPadding="3" Width="100%" ForeColor="#333333" HorizontalAlign="Justify" CssClass="NoRec" DataKeyNames="Id, ProductPrice" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" OnRowDeleting="GridCart_RowDeleting">
            <EmptyDataTemplate>No Record Available</EmptyDataTemplate>  
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:boundfield datafield="ProductName" headertext="Product Name"/>
                <asp:TemplateField headertext="Quantity">
                    <ItemTemplate>
                        <asp:TextBox ID="qty" Width="40" runat="server" min="1" max="100" Text='<%# Eval("ItemQty") %>' TextMode="Number" OnTextChanged="qty_TextChanged" AutoPostBack="true"></asp:TextBox> 
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:boundfield datafield="ItemPrice" headertext="Price" DataFormatString="{0:F2}"/>
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#FF8303" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <div id="DivCheckoutBtn" class="hide" runat="server">
            <asp:Button ID="Button1" runat="server" CssClass="CheckOut" Text="Proceed to Checkout" PostBackUrl="~/Checkout.aspx" />
        </div>
    </div>
</asp:Content>
