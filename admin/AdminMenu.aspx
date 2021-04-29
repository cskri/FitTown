<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminMenu.aspx.cs" Inherits="admin_AdminMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="Container d-flex justify-content-center">
        <div class="card mb-2 shadow-sm d-flex justify-content-center">
            <div class="card-header d-flex justify-content-center">
                <span class="headingspan">
                    <asp:Literal ID="CreateClassroomLiteral" Text="Create Room" runat="server"></asp:Literal></span>
            </div>
            <div class="card-body d-flex justify-content-center">
                <ul class="list-unstyled mt-1 mb-1">
                    <li>
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="roomNameLabel" runat="server" Width="100px" Text="Room Name"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="roomNameTextBox" runat="server" Width="114px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="roomCapacityLabel" runat="server" Width="100px" Text="Capacity"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID ="roomCapacityTextBox" runat="server" Width="114px"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td colspan="2">
                                    <br />
                                    <asp:Button ID="CreateButton" runat="server" Text="Create Room"
                                        OnClick="CreateButton_Click" />
                                </td>
                            </tr>
                        </table>

                        <br />
                        <br />

                        <asp:Label ID="resultLabel" runat="server" Text=""></asp:Label></li>

                </ul>
            </div>
        </div>
    </div>



</asp:Content>

