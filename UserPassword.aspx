<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserPassword.aspx.cs" Inherits="DejaBrew.UserPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Css/UserPassword_Style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="box1">

        <div class="title">
            Change Password
        </div>
        

        <div class="box2">
            
            <div class="input-lbl">
                Password
                <asp:RequiredFieldValidator ID="rfd_pass" runat="server" ErrorMessage="*" ControlToValidate="pass" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:CheckBox class="checkbox" ID="peek_pass" runat="server" Text=" Show password" AutoPostBack="True" OnCheckedChanged="peek_pass_CheckedChanged" />
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server" ChildrenAsTriggers="False" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:TextBox class="input" ID="pass" runat="server" AutoPostBack="True" TextMode="Password" OnTextChanged="pass_TextChanged"></asp:TextBox>
                    <asp:Label ID="invalid_pass" runat="server" Text="Invalid password" ForeColor="Red" Visible="False"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>


            <div class="input-lbl">
                New Password
                <asp:RequiredFieldValidator ID="rfd_newpass" runat="server" ErrorMessage="*" ControlToValidate="newpass" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                <ContentTemplate>
                    <asp:CheckBox class="checkbox" ID="peek_newpass" runat="server" Text=" Show password" AutoPostBack="True" OnCheckedChanged="peek_newpass_CheckedChanged" />
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdatePanel ID="UpdatePanel4" runat="server" ChildrenAsTriggers="False" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:TextBox class="input" ID="newpass" runat="server" AutoPostBack="True" TextMode="Password" OnTextChanged="newpass_TextChanged"></asp:TextBox>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                <ContentTemplate>
                    <asp:ValidationSummary class="rfd_text rfd" ID="ValidationSummary1" runat="server" ValidationGroup="vg" DisplayMode="List" ForeColor="Red" />
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="8 - 50 characters" ControlToValidate="newpass" OnServerValidate="CustomValidator1_ServerValidate1" ValidationGroup="vg" ValidateEmptyText="True" Display="None"></asp:CustomValidator>
                    <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="At least one capital letter" ControlToValidate="newpass" Display="None" OnServerValidate="CustomValidator2_ServerValidate" ValidationGroup="vg" ValidateEmptyText="True"></asp:CustomValidator>
                    <asp:CustomValidator ID="CustomValidator3" runat="server" ErrorMessage="At least one lowercase letter" ControlToValidate="newpass" Display="None" OnServerValidate="CustomValidator3_ServerValidate" ValidateEmptyText="True" ValidationGroup="vg"></asp:CustomValidator>
                    <asp:CustomValidator ID="CustomValidator4" runat="server" ErrorMessage="At least one  number" Display="None" OnServerValidate="CustomValidator4_ServerValidate" ValidateEmptyText="True" ValidationGroup="vg" ControlToValidate="newpass"></asp:CustomValidator>
                    <asp:CustomValidator ID="CustomValidator5" runat="server" ErrorMessage="At least one special character" ControlToValidate="newpass" Display="None" OnServerValidate="CustomValidator5_ServerValidate" ValidateEmptyText="True" ValidationGroup="vg"></asp:CustomValidator>                            
                </ContentTemplate>
            </asp:UpdatePanel>

            






            <div class="input-lbl">
                Confirm Password
                <asp:RequiredFieldValidator ID="rfd_conpass" runat="server" ErrorMessage="*" ControlToValidate="conpass" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                <ContentTemplate>
                    <asp:CheckBox class="checkbox" ID="peek_conpass" runat="server" Text=" Show password" AutoPostBack="True" OnCheckedChanged="peek_conpass_CheckedChanged"/>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdatePanel ID="UpdatePanel6" runat="server" ChildrenAsTriggers="False" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:TextBox class="input" ID="conpass" runat="server" AutoPostBack="True" TextMode="Password" OnTextChanged="conpass_TextChanged"></asp:TextBox>
                    <asp:CompareValidator class="rfd" ID="rfd_compare" runat="server" ErrorMessage="Passwords don't match" ForeColor="Red" ControlToCompare="newpass" ControlToValidate="conpass"></asp:CompareValidator>
                </ContentTemplate>
            </asp:UpdatePanel>



            <div class="button-case">
                <div><asp:Button class="button" ID="cancel" runat="server" Text="Cancel" CausesValidation="False" OnClick="cancel_Click" /></div>
                <div><asp:Button class="button" ID="save" runat="server" Text="Save" OnClick="save_Click" /></div>
                
            </div>
            

        </div>




    </div>
</asp:Content>
