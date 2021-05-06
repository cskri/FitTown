<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminMenu.aspx.cs" Inherits="admin_AdminMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="card" style="background: url(/images/GodMode.jpg) no-repeat center;background-size:cover">
       <svg class="bd-placeholder-img" width="100%" height="400px" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect width="100%" height="400px" fill="#000" fill-opacity="0.4"></rect></svg>
       <div class="container">
          <div class="carousel-caption text-left">
             <h5>Here is your Admin menu</h5>
             <p>WE HAVE GOT GOD CONTROLS!</p>
           </div>
       </div>
    </div>

    <div class="Container d-flex justify-content-center">
        <div class="card mb-2 shadow-sm d-flex justify-content-center">
            <div class="card-header d-flex justify-content-center">
                <span class="headingspan">
                    <asp:Literal ID="CreateClassroomLiteral" Text="Create Room" runat="server"></asp:Literal></span>
            </div>
            <div class="card-body d-flex justify-content-center">
                <ul class="list-unstyled mt-1 mb-1">
                    <li>
                        <asp:Label ID="roomNameLabel" runat="server" Width="100px" Text="Room Name &nbsp"></asp:Label>
                        <asp:TextBox ID="roomNameTextBox" runat="server" Width="114px"></asp:TextBox></li>
                    <li>
                        <asp:Label ID="roomCapacityLabel" runat="server" Width="100px" Text="Capacity &nbsp"></asp:Label>
                        <asp:TextBox ID="roomCapacityTextBox" runat="server" Width="114px"></asp:TextBox>
                    </li>
                </ul>
            </div>
            <div class="card-footer d-flex justify-content-center">
                <ul class="list-unstyled mt-1 mb-1">
                    <li>
                        <asp:Button ID="CreateButton" runat="server" Text="Create Room"
                            OnClick="CreateButton_Click" /></li>
                    <li>
                        <asp:Label ID="resultLabel" runat="server" Text=""></asp:Label></li>
                </ul>
            </div>
        </div>
    </div>



</asp:Content>

