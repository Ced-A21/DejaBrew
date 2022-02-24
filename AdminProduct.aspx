<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminProduct.aspx.cs" Inherits="DejaBrew.AdminProduct" %>
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
        Welcome to the Product Manager!
        <br />
        <%--Create New Product--%>
        <asp:Button ID="BtnCreateNewProd" runat="server" Text="Create New Product" OnClick="BtnShowDiv_Click" CausesValidation="False" />
        <div class="hide" id="DivCreateNewProd" runat="server">
            <label class="form-label">Product Name </label>
            <span>
                <asp:TextBox ID="TBProdName" runat="server" ValidationGroup="VLDNewProd"></asp:TextBox>
                <asp:RequiredFieldValidator ID="VLDProdName" runat="server" ErrorMessage="Product Name is required" Display="Dynamic" ValidationGroup="VLDNewProd" ControlToValidate="TBProdName" ForeColor="Red"></asp:RequiredFieldValidator>
            </span>
            
            <label class="form-label">Product Category </label>
            <span><asp:DropDownList ID="DropNewProdCateg" runat="server">
                <asp:ListItem>Hot Drinks</asp:ListItem>
                <asp:ListItem>Cold Drinks</asp:ListItem>
                <asp:ListItem>Pastries</asp:ListItem>
                <asp:ListItem>Frappuccino</asp:ListItem>
            </asp:DropDownList></span>

            <label class="form-label">Product Price </label>
            <span>
                <asp:TextBox ID="TBNewProdPrice" runat="server" ValidationGroup="VLDNewProd"></asp:TextBox>
                <asp:RequiredFieldValidator ID="VLDProdPrice" runat="server" ErrorMessage="Product Price is required" ValidationGroup="VLDNewProd" Display="Dynamic" ControlToValidate="TBNewProdPrice" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="VLDProdPrice1" runat="server" ErrorMessage="5 to 10,000 only" ControlToValidate="TBNewProdPrice" Display="Dynamic" Type="Currency" ValidationGroup="VLDNewProd" MaximumValue="10000" MinimumValue="50" ForeColor="Red"></asp:RangeValidator>
            </span>

            <label class="form-label">Product Stock </label>
            <span>
                <asp:TextBox ID="TBNewProdStock" runat="server" TextMode="Number" min="1" max="500" ValidationGroup="VLDNewProd"></asp:TextBox>
                <asp:RequiredFieldValidator ID="VLDProdStock" runat="server" ErrorMessage="Product Stock is required" ValidationGroup="VLDNewProd" Display="Dynamic" ControlToValidate="TBNewProdStock" ForeColor="Red"></asp:RequiredFieldValidator>
            </span>

            <asp:Button ID="BtnSaveNewProd" runat="server" Text="Save New Product" ValidationGroup="VLDNewProd" OnClick="BtnSaveNewProd_Click" />
            <asp:Button ID="BtnClearNewProd" runat="server" Text="Clear Product Information" OnClick="BtnClearNewProd_Click" />
        </div>

        <%--Update Product--%>
        <asp:Button ID="BtnUpdateNewProd" runat="server" Text="Update Product Information" OnClick="BtnShowDiv_Click" CausesValidation="False" ValidationGroup="VLDUpdateProd" />
        <div class="hide" id="DivUpdateProd" runat="server">
            <label>Select the product that you want to edit</label>
            <asp:GridView ID="GridUpProdList" runat="server" DataSourceID="DejaBrewDb" AllowSorting="True" CellPadding="3" Width="100%" ForeColor="#333333" HorizontalAlign="Justify" OnSelectedIndexChanged="GridUpProdList_SelectedIndexChanged">
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
            <asp:SqlDataSource ID="DejaBrewDb" runat="server" ConnectionString="<%$ ConnectionStrings:DejaBrewDb %>" SelectCommand="SELECT * FROM [Products]"></asp:SqlDataSource>

            <label class="form-label">Product Name </label>
            <span>
                <asp:TextBox ID="TBUpProdName" runat="server" ValidationGroup="VLDUpdateProd"></asp:TextBox>
                <asp:RequiredFieldValidator ID="VLDUpProdName" runat="server" ErrorMessage="Product Name is required" Display="Dynamic" ValidationGroup="VLDUpdateProd" ControlToValidate="TBUpProdName" ForeColor="Red"></asp:RequiredFieldValidator>
            </span>

            <label class="form-label">Product Category </label>
            <span><asp:DropDownList ID="DropProdCateg" runat="server">
                <asp:ListItem>Hot Drinks</asp:ListItem>
                <asp:ListItem>Cold Drinks</asp:ListItem>
                <asp:ListItem>Pastries</asp:ListItem>
                <asp:ListItem>Frappuccino</asp:ListItem>
            </asp:DropDownList></span>

            <label class="form-label">Product Price </label>
            <span>
                <asp:TextBox ID="TBUpProdPrice" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="VLDUpProdPrice" runat="server" ErrorMessage="Product Price is required" Display="Dynamic" ValidationGroup="VLDUpdateProd" ControlToValidate="TBUpProdPrice" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="VLDUpProdPrice1" runat="server" ErrorMessage="5 to 10,000 only" ControlToValidate="TBUpProdPrice" Display="Dynamic" Type="Currency" ValidationGroup="VLDUpdateProd" MaximumValue="10000" MinimumValue="5" ForeColor="Red"></asp:RangeValidator>
            </span>

            <label class="form-label">Product Status </label>
            <span>
                <asp:RadioButtonList ID="ProdStat" runat="server">
                    <asp:ListItem Value="Enabled">Enabled</asp:ListItem>
                    <asp:ListItem Value="Disabled">Disabled</asp:ListItem>
                </asp:RadioButtonList>
            </span>

            <asp:Button ID="BtnUpdateProd" runat="server" Text="Update Product Information" ValidationGroup="VLDUpdateProd" OnClick="BtnUpdateProd_Click" />
            <asp:Button ID="BtnClearUpProd" runat="server" Text="Reset Product Information" CausesValidation="False" OnClick="BtnClearUpProd_Click" />
        </div>

        <%--Change Product Status--%>
<%--        <asp:Button ID="BtnChangeProdStatus" runat="server" Text="Change Product Status" OnClick="BtnShowDiv_Click" />
        <div class="show" id="DivChangeProdStat" runat="server">
            <label>Select the product that you want to edit</label>
            <asp:GridView ID="GridChangeProdStat" runat="server" DataSourceID="DejaBrewDb" AllowSorting="True" CellPadding="3" Width="100%" ForeColor="#333333" HorizontalAlign="Justify">
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DejaBrewDb %>" SelectCommand="SELECT * FROM [Products]"></asp:SqlDataSource>

            <label class="form-label">Product Status </label>
            <span>
                <asp:RadioButton ID="RBEnabledStat" runat="server" GroupName="ProdStat" Text="Enabled" />
                <asp:RadioButton ID="RBDisabledStat" runat="server" GroupName="ProdStat" Text="Disabled" />
            </span>

            <asp:Button ID="BtnSaveStatus" runat="server" Text="Save Status" OnClick="BtnSaveStatus_Click" />
            <asp:Button ID="BtnClearStatus" runat="server" Text="Clear" />
        </div>--%>
    </div>
</asp:Content>
