<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="DejaBrew.Signup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Css/Signup_Style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>



    <div class="case">

        <div class="title">
            Create an account
        </div>
        <div class="subtitle">
            Please confirm that all the information is correct. <br />The company will not be liable if delivery information does not match.
        </div>


        <div class="box1">
                <div class="box2">
                    <div class="lbl">User Details</div>
                    <div class="lbl_input">
                        First Name
                        <asp:RequiredFieldValidator class="rfd" ID="rfd_fname" runat="server" ErrorMessage="*" ControlToValidate="fname">*</asp:RequiredFieldValidator>
                    </div> 
                    <div><asp:TextBox class="textbox" ID="fname" runat="server" placeholder="John" MaxLength="50"></asp:TextBox></div>
                    <div class="lbl">Login & Contact Details</div>
                    <div class="lbl_input">
                        Email
                        <asp:RequiredFieldValidator class="rfd" ID="rfd_email" runat="server" ErrorMessage="*" ControlToValidate="email"></asp:RequiredFieldValidator>
                    </div>
                    <div><asp:TextBox class="textbox" ID="email" runat="server" placeholder="example@email.com" MaxLength="50"></asp:TextBox></div>
                    <div><asp:RegularExpressionValidator class="rfd_text rfd" ID="rfd_email_expression" runat="server" ErrorMessage="Invalid email format" ControlToValidate="email" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></div>
                    <div class="lbl_input">
                        Password
                        <asp:RequiredFieldValidator class="rfd" ID="rfd_pass" runat="server" ErrorMessage="*" ControlToValidate="pass"></asp:RequiredFieldValidator>
                    </div>
                    <div>
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <asp:CheckBox class="checkbox" ID="pass_peek" runat="server" AutoPostBack="True" OnCheckedChanged="pass_peek_CheckedChanged" Text=" Show password" />
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="pass_peek" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                    <div>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="False" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:TextBox class="textbox" ID="pass" runat="server" textmode="password" ValidationGroup="vg" OnTextChanged="pass_TextChanged" AutoPostBack="True" MaxLength="50"></asp:TextBox>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <asp:ValidationSummary class="rfd_text rfd" ID="ValidationSummary1" runat="server" ValidationGroup="vg" DisplayMode="List" />
                                <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="8 - 50 characters" ControlToValidate="pass" OnServerValidate="CustomValidator1_ServerValidate1" ValidationGroup="vg" ValidateEmptyText="True" Display="None"></asp:CustomValidator>
                                <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="At least one capital letter" ControlToValidate="pass" Display="None" OnServerValidate="CustomValidator2_ServerValidate" ValidationGroup="vg" ValidateEmptyText="True"></asp:CustomValidator>
                                <asp:CustomValidator ID="CustomValidator3" runat="server" ErrorMessage="At least one lowercase letter" ControlToValidate="pass" Display="None" OnServerValidate="CustomValidator3_ServerValidate" ValidateEmptyText="True" ValidationGroup="vg"></asp:CustomValidator>
                                <asp:CustomValidator ID="CustomValidator4" runat="server" ErrorMessage="At least one  number" Display="None" OnServerValidate="CustomValidator4_ServerValidate" ValidateEmptyText="True" ValidationGroup="vg"></asp:CustomValidator>
                                <asp:CustomValidator ID="CustomValidator5" runat="server" ErrorMessage="At least one special character" ControlToValidate="pass" Display="None" OnServerValidate="CustomValidator5_ServerValidate" ValidateEmptyText="True" ValidationGroup="vg"></asp:CustomValidator>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="pass" EventName="TextChanged"/>
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
            


                <div class="box3">
                    <div><br /></div>
                    <div class="lbl_input">
                        Last Name
                        <asp:RequiredFieldValidator class="rfd" ID="rfd_lname" runat="server" ErrorMessage="*" ControlToValidate="lname"></asp:RequiredFieldValidator>
                    </div> 
                    <div><asp:TextBox class="textbox" ID="lname" runat="server" placeholder="Doe" MaxLength="50"></asp:TextBox></div>
                    <div><br /></div>
                    <div class="lbl_input">
                        Mobile
                        <asp:RequiredFieldValidator class="rfd" ID="rfd_mobile" runat="server" ErrorMessage="*" ControlToValidate="mobile"></asp:RequiredFieldValidator>
                    </div>
                    <div><asp:TextBox class="textbox" ID="mobile" runat="server" placeholder="906******5" MaxLength="10"></asp:TextBox></div>
                    <div><asp:RangeValidator class="rfd_text rfd" ID="rfd_mobile_range" runat="server" ErrorMessage="Invalid mobile format" ControlToValidate="mobile" MaximumValue="9999999999" MinimumValue="7777777777"></asp:RangeValidator></div>
                    <div class="lbl_input">
                        Confirm Password
                        <asp:RequiredFieldValidator class="rfd" ID="rfd_conpass" runat="server" ErrorMessage="*" ControlToValidate="conpass"></asp:RequiredFieldValidator>
                    </div>
                    <div>
                        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                            <ContentTemplate>
                                <asp:CheckBox class="checkbox" ID="conpass_peek" runat="server" AutoPostBack="True" Text=" Show password" OnCheckedChanged="conpass_peek_CheckedChanged" />
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="conpass_peek" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                    <div>
                        <asp:UpdatePanel ID="UpdatePanel5" runat="server" ChildrenAsTriggers="False" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:TextBox class="textbox" ID="conpass" runat="server" textmode="password" OnTextChanged="pass_TextChanged" AutoPostBack="True" MaxLength="50"></asp:TextBox>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div><asp:CompareValidator class="rfd_text rfd" ID="rfd_conpass_compare" runat="server" ErrorMessage="Passwords don't match" ControlToCompare="pass" ControlToValidate="conpass"></asp:CompareValidator></div>
                </div>

                <div class="box4">
                    <div><asp:CheckBox class="checkbox" ID="agree" runat="server" ForeColor="Red"/> I have fully read, understood, and agree to the <a href="/Home.aspx">Data Privacy</a>, <a href="/Home.aspx">Terms & Conditions</a> of Dejabrew.</div>
                    <div class="button_case"><asp:Button class="button" ID="clear" runat="server" Text="CLEAR" CausesValidation="False" OnClick="clear_Click" ValidateRequestMode="Disabled" /><asp:Button class="button" ID="submit" runat="server" Text="SUBMIT" OnClick="submit_Click" /></div>

          </div> 
    </div>














</asp:Content>
