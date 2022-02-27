<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="DejaBrew.UserProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Css/UserProfile_Style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="box1">

        <div class="title">
            My Profile
        </div>

        <div class="box2">
            <div class="lbl">
                First Name
                <asp:RequiredFieldValidator ID="rfd_fname" runat="server" ErrorMessage="*" ControlToValidate="fname" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div>
                <asp:TextBox class="input" ID="fname" runat="server" MaxLength="50"></asp:TextBox>
            </div>
            <div class="lbl">
                Last Name
                <asp:RequiredFieldValidator ID="rfd_lname" runat="server" ErrorMessage="*" ControlToValidate="lname" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div>
                <asp:TextBox class="input" ID="lname" runat="server" MaxLength="50"></asp:TextBox>
            </div>
            <div class="lbl">
                Mobile
                <asp:RequiredFieldValidator ID="rfd_mobile" runat="server" ErrorMessage="*" ControlToValidate="mobile" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div>
                <asp:TextBox class="input" ID="mobile" runat="server" MaxLength="10"></asp:TextBox>
                <asp:RangeValidator class="rfd-lbl" ID="range_mobile" runat="server" ErrorMessage="Must be 10 digits" ControlToValidate="mobile" ForeColor="Red" MaximumValue="9999999999" MinimumValue="0000000000" Display="Dynamic"></asp:RangeValidator>
            </div>
            <div class="lbl">
                Email
                <asp:RequiredFieldValidator ID="rfd_email" runat="server" ErrorMessage="*" ControlToValidate="email" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div>
                <asp:TextBox class="input" ID="email" runat="server" MaxLength="50"></asp:TextBox>
                <asp:RegularExpressionValidator class="rfd-lbl" ID="reg_email" runat="server" ErrorMessage="Invalid email format" ControlToValidate="email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>


            <div class="button-case">
                <asp:Button class="button" ID="change_pass" runat="server" Text="Change Password" CausesValidation="False" OnClick="change_pass_Click" />
                <asp:Button class="button" ID="change_save" runat="server" Text="Save Changes" OnClick="change_save_Click" />
            </div>
        </div>
            
    </div>
</asp:Content>
