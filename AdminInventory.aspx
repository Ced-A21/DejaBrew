<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminInventory.aspx.cs" Inherits="DejaBrew.AdminInventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-label {
            float: left;
            margin-right: 10px;
            width: 200px;
            text-align: right;
        }
        span {
            display: block;
            overflow: hidden;
            padding: 0 4px 0 6px;
        }
        .show {
            display: block
        }
        .hide {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin: 10px;">
        Welcome to the Inventory Manager!
        <br />
        <%--Add Product Stock--%>
        <asp:Button ID="BtnAddStock" runat="server" Text="Add Stock" OnClick="BtnShowDiv_Click" CausesValidation="False" ValidationGroup="VLDAddStock" />
        <div class="hide" id="DivAddProdStock" runat="server">
            <label>Select the product where you want to edit stock</label>
            <asp:GridView ID="GridProdList" runat="server" DataSourceID="DejaBrewDb" AllowSorting="True" CellPadding="3" Width="100%" ForeColor="#333333" HorizontalAlign="Justify" OnSelectedIndexChanged="GridProdList_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            <asp:SqlDataSource ID="DejaBrewDb" runat="server" ConnectionString="<%$ ConnectionStrings:DejaBrewDb %>" SelectCommand="SELECT Id, ProductName, ProductStock FROM [Products]"></asp:SqlDataSource>

            <label class="form-label">Current Available Stock </label>
            <span>
                <asp:TextBox ID="TBStock" runat="server" ValidationGroup="VLDAddStock" min="1" max="1000" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="VLDStock" runat="server" ErrorMessage="Product Stock is required" Display="Dynamic" ValidationGroup="VLDAddStock" ControlToValidate="TBStock" ForeColor="Red"></asp:RequiredFieldValidator>
            </span>

            <asp:Button ID="BtnAddToStock" runat="server" Text="Update Stock" ValidationGroup="VLDAddStock" OnClick="BtnAddToStock_Click" />
        </div>
    </div>
</asp:Content>
