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
        .auto-style10 {
            height: 177px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div style="padding:15px;">



    <table class="AdminColDiv">
        <tr>
            <td colspan="2" style="font-size: x-large; font-weight: bold; color: #000000">ORDER DETAILS</td>
        </tr>
        <tr>
            <td class="auto-style3">ID</td>
            <td class="auto-style1">
                <asp:TextBox ID="TextBox2" runat="server" Font-Size="Medium" Width="200px"></asp:TextBox>
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
            <td colspan="2" class="auto-style4">
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                Date</td>
            <td class="auto-style6">
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="DeliveryDate" DataValueField="DeliveryDate" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button4" runat="server"  Font-Bold="True" ForeColor="White" Height="27px" Text="GET" Width="100px" class="TotalColBtn"/>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                Daily Sales</td>
            <td class="auto-style7">
                <asp:TextBox ID="TextBox8" runat="server" Font-Size="Medium" Width="200px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button8" runat="server"  Font-Bold="True" ForeColor="White" Height="27px" Text="TOTAL" Width="100px" class="TotalColBtn" OnClick="Button8_Click"/>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                Total Sale</td>
            <td class="auto-style7">
                <asp:TextBox ID="TextBox9" runat="server" Font-Size="Medium" Width="200px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button5" runat="server"  Font-Bold="True" ForeColor="White" Height="27px" Text="TOTAL" Width="100px" class="TotalColBtn" OnClick="Button5_Click"/>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
            </td>
            <td class="auto-style7">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">
                Date</td>
            <td class="auto-style9">
                <asp:TextBox ID="TextBox10" runat="server" Font-Size="Medium" Width="200px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp; to&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox11" runat="server" Font-Size="Medium" Width="200px"></asp:TextBox>
&nbsp;
                <asp:Button ID="Button6" runat="server"  Font-Bold="True" ForeColor="White" Height="27px" Text="GET" Width="100px" class="TotalColBtn"/>
            &nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td>
                Monthly Sale</td>
            <td>
                <asp:TextBox ID="TextBox12" runat="server" Font-Size="Medium" Width="200px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button7" runat="server"  Font-Bold="True" ForeColor="White" Height="27px" Text="TOTAL" Width="100px" class="TotalColBtn"/>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style4">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DejaBrewDb %>" SelectCommand="SELECT DISTINCT [DeliveryDate] FROM [Orders] "></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Panel ID="Panel1" runat="server">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="OrderTotal" HeaderText="OrderTotal" SortExpression="OrderTotal" DataFormatString="{0:F2}" />
                            <asp:BoundField DataField="CompletionDate" HeaderText="CompletionDate" SortExpression="CompletionDate" DataFormatString="{0:MM/dd/yyyy}" />
                            <asp:BoundField DataField="DeliveryDate" HeaderText="DeliveryDate" SortExpression="DeliveryDate" DataFormatString="{0:MM/dd/yyyy}"/>
                                <asp:BoundField DataField="DeliveryStatus" HeaderText="DeliveryStatus" SortExpression="DeliveryStatus" />
                            <asp:BoundField DataField="CartID" HeaderText="CartID" SortExpression="CartID" />
                           
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DejaBrewDb %>" SelectCommand="SELECT * FROM [Orders]"></asp:SqlDataSource>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style10">
                <asp:Panel ID="Panel2" runat="server">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource3">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="OrderTotal" HeaderText="OrderTotal" SortExpression="OrderTotal" />
                            <asp:BoundField DataField="CompletionDate" HeaderText="CompletionDate" SortExpression="CompletionDate" />
                            <asp:BoundField DataField="DeliveryDate" HeaderText="DeliveryDate" SortExpression="DeliveryDate" />
                            <asp:BoundField DataField="DeliveryStatus" HeaderText="DeliveryStatus" SortExpression="DeliveryStatus" />
                            <asp:BoundField DataField="CartID" HeaderText="CartID" SortExpression="CartID" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DejaBrewDb %>" SelectCommand="SELECT * FROM [Orders] WHERE ([DeliveryDate] = @DeliveryDate)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="DeliveryDate" PropertyName="SelectedValue" Type="DateTime" />
                        </SelectParameters>
                    </asp:SqlDataSource>
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
        <tr>
            <td colspan="2">
                &nbsp;</td>
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
