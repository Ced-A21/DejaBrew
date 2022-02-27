<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminCollection.aspx.cs" Inherits="DejaBrew.AdminCollection" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 32px;
            width: 607px;
        }
        .auto-style2 {
            width: 420px;
        }
        .auto-style3 {
            height: 32px;
            width: 420px;
        }
        .AdminColDiv{
            display:flex;
            justify-content:center;
        }
        .GetColBtn, .TotalColBtn{
            background-color:black;
        }
        .GetColBtn:hover, .TotalColBtn:hover{
            cursor:pointer;
            Background-color:	#343434;
        }
        .auto-style4 {
            height: 25px;
        }
        .auto-style5 {
            height: 25px;
            width: 420px;
        }
        .auto-style6 {
            width: 607px;
        }
        .auto-style7 {
            height: 25px;
            width: 607px;
        }
        .auto-style8 {
            width: 420px;
            height: 64px;
        }
        .auto-style9 {
            width: 607px;
            height: 64px;
        }
        .auto-style11 {
            width: 420px;
            height: 36px;
        }
        .auto-style12 {
            height: 36px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div style="padding:15px;">



    <table class="AdminColDiv">
        <tr>
            <td colspan="2" style="font-size: x-large; font-weight: bold; color: #000000; font-family: 'Franklin Gothic Heavy';">ORDER DETAILS</td>
        </tr>
        <tr>
            <td class="auto-style3">ID</td>
            <td class="auto-style1">
                <asp:TextBox ID="TextBox2" runat="server" Font-Size="Medium" Width="200px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Order Total</td>
            <td class="auto-style6">
                <asp:TextBox ID="TextBox3" runat="server" Font-Size="Medium" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Completion Date</td>
            <td class="auto-style6">
                <asp:TextBox ID="TextBox4" runat="server" Font-Size="Medium" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Delivery Date</td>
            <td class="auto-style6">
                <asp:TextBox ID="TextBox5" runat="server" Font-Size="Medium" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                Delivery Status</td>
            <td class="auto-style6">
                <asp:TextBox ID="TextBox6" runat="server" Font-Size="Medium" Width="200px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
        </tr>
        <tr>
            <td class="auto-style2">Cart ID</td>
            <td class="auto-style6">
                <asp:TextBox ID="TextBox7" runat="server" Font-Size="Medium" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Panel ID="Panel4" runat="server">
                </asp:Panel>
                <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView4_SelectedIndexChanged">
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DejaBrewDb %>" DeleteCommand="DELETE FROM [Orders] WHERE [Id] = @original_Id AND [OrderTotal] = @original_OrderTotal AND [CompletionDate] = @original_CompletionDate AND (([DeliveryDate] = @original_DeliveryDate) OR ([DeliveryDate] IS NULL AND @original_DeliveryDate IS NULL)) AND [DeliveryStatus] = @original_DeliveryStatus AND (([CartID] = @original_CartID) OR ([CartID] IS NULL AND @original_CartID IS NULL))" InsertCommand="INSERT INTO [Orders] ([OrderTotal], [CompletionDate], [DeliveryDate], [DeliveryStatus], [CartID]) VALUES (@OrderTotal, @CompletionDate, @DeliveryDate, @DeliveryStatus, @CartID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Orders] ORDER BY [DeliveryStatus], [CompletionDate]" UpdateCommand="UPDATE [Orders] SET [OrderTotal] = @OrderTotal, [CompletionDate] = @CompletionDate, [DeliveryDate] = @DeliveryDate, [DeliveryStatus] = @DeliveryStatus, [CartID] = @CartID WHERE [Id] = @original_Id AND [OrderTotal] = @original_OrderTotal AND [CompletionDate] = @original_CompletionDate AND (([DeliveryDate] = @original_DeliveryDate) OR ([DeliveryDate] IS NULL AND @original_DeliveryDate IS NULL)) AND [DeliveryStatus] = @original_DeliveryStatus AND (([CartID] = @original_CartID) OR ([CartID] IS NULL AND @original_CartID IS NULL))">
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
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="font-size: x-large; font-weight: bold; color: #000000; font-family: 'Franklin Gothic Heavy';">
                SALES</td>
        </tr>
        <tr>
            <td class="auto-style2">
                Refresh Table</td>
            <td class="auto-style6">
                <asp:Button ID="Button3" runat="server"  Font-Bold="True" ForeColor="White" Height="27px" Text="REFRESH" Width="100px" class="TotalColBtn" OnClick="Button3_Click"/>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                &nbsp;</td>
            <td class="auto-style6">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                Date</td>
            <td class="auto-style6">
                <asp:TextBox ID="TextBox15" runat="server" Font-Size="Medium" Width="200px" TextMode="date"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button11" runat="server"  Font-Bold="True" ForeColor="White" Height="27px" Text="GET" Width="100px" class="TotalColBtn" OnClick="Button11_Click"/>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                Daily Sales</td>
            <td class="auto-style7">
                <asp:TextBox ID="TextBox14" runat="server" Font-Size="Medium" Width="200px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button12" runat="server" OnClick="Button12_Click" Text="TOTAL" BackColor="Black" Font-Bold="True" ForeColor="White" Width="100px" />
            </td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style4">
            </td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style4">
                <asp:Panel ID="Panel1" runat="server">
                    <asp:GridView ID="GridView1" runat="server">
                    </asp:GridView>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">
                Date</td>
            <td class="auto-style9">
                <asp:TextBox ID="TextBox10" runat="server" Font-Size="Medium" Width="200px" TextMode="Date"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp; to&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox11" runat="server" Font-Size="Medium" Width="200px" TextMode="Date"></asp:TextBox>
&nbsp;
                <asp:Button ID="Button6" runat="server"  Font-Bold="True" ForeColor="White" Height="27px" Text="GET" Width="100px" class="TotalColBtn" OnClick="Button6_Click"/>
            &nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td class="auto-style11">
                Monthly Sale</td>
            <td class="auto-style12">
                <asp:TextBox ID="TextBox12" runat="server" Font-Size="Medium" Width="200px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button7" runat="server"  Font-Bold="True" ForeColor="White" Height="27px" Text="TOTAL" Width="100px" class="TotalColBtn" OnClick="Button7_Click"/>
            &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style4">
            </td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style4">
                <asp:Panel ID="Panel2" runat="server">
                    <asp:GridView ID="GridView2" runat="server">
                    </asp:GridView>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style4">
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Date</td>
            <td>
                <asp:TextBox ID="TextBox16" runat="server" Font-Size="Medium" Width="200px" TextMode="date"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button15" runat="server" OnClick="Button15_Click" Text="GET" BackColor="Black" Font-Bold="True" ForeColor="White" Height="27px" Width="100px" />
            </td>
        </tr>
        <tr>
            <td>
                Total Sales</td>
            <td>
                <asp:TextBox ID="TextBox17" runat="server" Font-Size="Medium" Width="200px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button16" runat="server" OnClick="Button16_Click" Text="TOTAL" BackColor="Black" Font-Bold="True" ForeColor="White" Height="27px" Width="100px" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Panel ID="Panel3" runat="server">
                    <asp:GridView ID="GridView3" runat="server">
                    </asp:GridView>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
    </table>



</div>












</asp:Content>
