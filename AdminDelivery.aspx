﻿<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminDelivery.aspx.cs" Inherits="DejaBrew.AdminDelivery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 78px;
        }
        .auto-style2 {
            margin-left: 38px;
        }
        .auto-style3 {
            height: 25px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <br />
    <asp:GridView ID="Grid_Delivery" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlData_Delivery" AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnSelectedIndexChanged="Grid_Delivery_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="OrderTotal" HeaderText="OrderTotal" SortExpression="OrderTotal" />
            <asp:BoundField DataField="DeliveryDate" HeaderText="DeliveryDate" SortExpression="DeliveryDate" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlData_Delivery" runat="server" ConnectionString="<%$ ConnectionStrings:DejaBrewDb %>" SelectCommand="SELECT [Id], [OrderTotal], [DeliveryDate] FROM [Orders]"></asp:SqlDataSource>
    <br />
&nbsp;<strong><asp:Label ID="Label_ID" runat="server" Text="Order ID:"></asp:Label>
    </strong>
    <asp:TextBox ID="TextBox_ID" runat="server" CssClass="auto-style1" readonly="true"></asp:TextBox>
    <br />
&nbsp;<strong><asp:Label ID="Label_Date" runat="server" Text="Delivery Date:"></asp:Label>
    </strong>
    <asp:TextBox ID="TextBox_Date" runat="server" CssClass="auto-style2"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="Button_Update" runat="server" Text="Update Delivery Date" Height="40px" OnClick="Button_Update_Click" Width="250px" />
    <br />
    <asp:Button ID="Button_Undelivered" runat="server" Height="40px" Text="View Undelivered Orders" Width="250px" OnClick="Button_Undelivered_Click" />
    <br />
&nbsp;<br />
        <asp:GridView ID="Grid_Undelivered" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <br />
        <table class="HomePic">
            <tr>
                <td class="auto-style3"></td>
                <td class="auto-style3"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Panel ID="Panel1" runat="server">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DejaBrewDb %>" DeleteCommand="DELETE FROM [Orders] WHERE [Id] = @original_Id AND [OrderTotal] = @original_OrderTotal AND [CompletionDate] = @original_CompletionDate AND (([DeliveryDate] = @original_DeliveryDate) OR ([DeliveryDate] IS NULL AND @original_DeliveryDate IS NULL)) AND [DeliveryStatus] = @original_DeliveryStatus AND (([CartID] = @original_CartID) OR ([CartID] IS NULL AND @original_CartID IS NULL))" InsertCommand="INSERT INTO [Orders] ([OrderTotal], [CompletionDate], [DeliveryDate], [DeliveryStatus], [CartID]) VALUES (@OrderTotal, @CompletionDate, @DeliveryDate, @DeliveryStatus, @CartID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Orders] ORDER BY [Id]" UpdateCommand="UPDATE [Orders] SET [OrderTotal] = @OrderTotal, [CompletionDate] = @CompletionDate, [DeliveryDate] = @DeliveryDate, [DeliveryStatus] = @DeliveryStatus, [CartID] = @CartID WHERE [Id] = @original_Id AND [OrderTotal] = @original_OrderTotal AND [CompletionDate] = @original_CompletionDate AND (([DeliveryDate] = @original_DeliveryDate) OR ([DeliveryDate] IS NULL AND @original_DeliveryDate IS NULL)) AND [DeliveryStatus] = @original_DeliveryStatus AND (([CartID] = @original_CartID) OR ([CartID] IS NULL AND @original_CartID IS NULL))">
                            <DeleteParameters>
                                <asp:Parameter Name="original_Id" Type="Int32" />
                                <asp:Parameter Name="original_OrderTotal" Type="Decimal" />
                                <asp:Parameter Name="original_CompletionDate" Type="DateTime" />
                                <asp:Parameter Name="original_DeliveryDate" Type="DateTime" />
                                <asp:Parameter Name="original_DeliveryStatus" Type="String" />
                                <asp:Parameter Name="original_CartID" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="OrderTotal" Type="Decimal" />
                                <asp:Parameter Name="CompletionDate" Type="DateTime" />
                                <asp:Parameter Name="DeliveryDate" Type="DateTime" />
                                <asp:Parameter Name="DeliveryStatus" Type="String" />
                                <asp:Parameter Name="CartID" Type="Int32" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="OrderTotal" Type="Decimal" />
                                <asp:Parameter Name="CompletionDate" Type="DateTime" />
                                <asp:Parameter Name="DeliveryDate" Type="DateTime" />
                                <asp:Parameter Name="DeliveryStatus" Type="String" />
                                <asp:Parameter Name="CartID" Type="Int32" />
                                <asp:Parameter Name="original_Id" Type="Int32" />
                                <asp:Parameter Name="original_OrderTotal" Type="Decimal" />
                                <asp:Parameter Name="original_CompletionDate" Type="DateTime" />
                                <asp:Parameter Name="original_DeliveryDate" Type="DateTime" />
                                <asp:Parameter Name="original_DeliveryStatus" Type="String" />
                                <asp:Parameter Name="original_CartID" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                                <asp:BoundField DataField="OrderTotal" HeaderText="OrderTotal" SortExpression="OrderTotal" />
                                <asp:BoundField DataField="CompletionDate" HeaderText="CompletionDate" SortExpression="CompletionDate" />
                                <asp:BoundField DataField="DeliveryDate" HeaderText="DeliveryDate" SortExpression="DeliveryDate" />
                                <asp:BoundField DataField="DeliveryStatus" HeaderText="DeliveryStatus" SortExpression="DeliveryStatus" />
                                <asp:BoundField DataField="CartID" HeaderText="CartID" SortExpression="CartID" />
                            </Columns>
                        </asp:GridView>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <br />
    <br />
    </center>
</asp:Content>