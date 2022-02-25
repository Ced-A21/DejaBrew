<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminCollection.aspx.cs" Inherits="DejaBrew.AdminCollection" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 32px;
        }
        .auto-style2 {
            width: 420px;
        }
        .auto-style3 {
            height: 32px;
            width: 420px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div style="padding:15px">



    <table class="HomePic">
        <tr>
            <td colspan="2" style="font-size: x-large; font-weight: bold; color: #000000">ORDER DETAILS</td>
        </tr>
        <tr>
            <td class="auto-style2">Date</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Font-Size="Medium" Width="200px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" BackColor="Black" Font-Bold="True" ForeColor="White" Height="27px" Text="GET" Width="100px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style3">ID</td>
            <td class="auto-style1">
                <asp:TextBox ID="TextBox2" runat="server" Font-Size="Medium" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Product</td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server" Font-Size="Medium" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Quantity</td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server" Font-Size="Medium" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Price</td>
            <td>
                <asp:TextBox ID="TextBox5" runat="server" Font-Size="Medium" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label6" runat="server" Font-Size="Medium" Text="Total Price"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox6" runat="server" Font-Size="Medium" Width="200px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" BackColor="Black" Font-Bold="True" ForeColor="White" Height="27px" Text="TOTAL" Width="100px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridView1" runat="server" BackColor="White" ForeColor="Black" Width="1414px">
                    <HeaderStyle BackColor="#666666" ForeColor="White" />
                </asp:GridView>
            </td>
        </tr>
    </table>



</div>












</asp:Content>
