<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="DejaBrew.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="OrderDiv" style="min-height:80vh;">
        <div style="flex-direction:column;">
            <div class="HeaderDiv" style="height:8vh;">
                <header class="OrderHeader">
                    ORDER STATUS
                </header>
            </div>
            <div class="InnerStats">
                <asp:GridView ID="GridOrder" runat="server" CssClass="OrderGrid">
<%--                    <Columns>
                        <asp:boundfield datafield="CartID" headertext="Order ID Number" ItemStyle-CssClass="OrderIDHead">
                            <ItemStyle CssClass="OrderIDHead"></ItemStyle>
                        </asp:boundfield>
                        <asp:boundfield datafield="OrderTotal" headertext="Amount to pay" ItemStyle-CssClass="OrderQty">
                            <ItemStyle CssClass="OrderQty"></ItemStyle>
                        </asp:boundfield>
                        <asp:boundfield datafield="DeliveryStatus" headertext="Status" ItemStyle-CssClass="OrderStats">
                            <ItemStyle CssClass="OrderStats"></ItemStyle>
                        </asp:boundfield>
                        <asp:boundfield datafield="CompletionDate" headertext="Order Placed" ItemStyle-CssClass="DatePlaced">
                            <ItemStyle CssClass="DatePlaced"></ItemStyle>
                        </asp:boundfield>
                        <asp:boundfield datafield="DeliveryDate" headertext="Order Recieved" ItemStyle-CssClass="DateReceived">
                            <ItemStyle CssClass="DateReceived"></ItemStyle>
                        </asp:boundfield>
                    </Columns>--%>
                </asp:GridView>
                    <div>

                        <asp:Label ID="Label4" runat="server" Text="Location:"></asp:Label>

                    &nbsp;
                        <asp:Label ID="Label9" runat="server" Text="Fantasy World"></asp:Label>

                    </div>
                
            </div>
        </div>
    </div>
</asp:Content>
