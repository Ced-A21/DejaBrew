<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DejaBrew.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Css/Login_Style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


    <div class="box1">

        <div class="title">
            Sign in or create an account
        </div>

        <div class="subtitle">
            Registered Customers
        </div>

        <div class="box2">

            <div class="error-box" id="20">
                <asp:Label ID="error_text1" runat="server" Text="Sign in unsuccessful" BorderStyle="None" Visible="False" ForeColor="Red" Font-Size="17pt"></asp:Label>
                <asp:Label ID="error_text2" runat="server" Text="<br>The email or password you entered is not valid.<br>Please try again." Visible="False" Font-Size="10pt"></asp:Label>
            </div>

            <div class="input_lbl">
                Email
                <asp:RequiredFieldValidator ID="rfd_email" runat="server" ErrorMessage="*" ControlToValidate="email" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div><asp:TextBox class="input" ID="email" runat="server" MaxLength="50"></asp:TextBox></div>
            <div class="rfd">
                <asp:RegularExpressionValidator ID="reg_email" runat="server" ErrorMessage="Invalid email format" ControlToValidate="email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator></div>

            <div class="input_lbl">
                Password
                <asp:RequiredFieldValidator ID="rfd_pass" runat="server" ErrorMessage="*" ControlToValidate="pass" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            

            <div class="button_case">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:CheckBox class="input_lbl" ID="peek_pass" runat="server" OnCheckedChanged="peek_pass_CheckedChanged" AutoPostBack="True" Text=" Show password" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="pass" />
                    </Triggers>
                </asp:UpdatePanel>

                <asp:UpdatePanel ID="UpdatePanel2" runat="server" ChildrenAsTriggers="False" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:TextBox class="input" ID="pass" runat="server" MaxLength="50" TextMode="Password" OnTextChanged="pass_TextChanged" AutoPostBack="True"></asp:TextBox>
                    </ContentTemplate>
                </asp:UpdatePanel>

                <asp:Button class="button" ID="submit" runat="server" Text="SUBMIT" OnClick="Button1_Click" />
            </div>
        </div>

        <div class="subtitle">
            New Customers
        </div>

        <div class="box3">
            <div class="text">
                   By creating an account with our store, you will be able to move through the checkout process faster, view your orders in your account and more
            </div>
            <div>
                <asp:Button class="signup" ID="signup" runat="server" Text="Create account" CausesValidation="False" OnClick="signup_Click" />
            </div>
        </div>
    </div>
</asp:Content>
