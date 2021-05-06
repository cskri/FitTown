<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Account.aspx.cs" Inherits="Account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="card" style="background: url(/images/AccountWorkout.jpeg) no-repeat center;background-size:cover">
       <svg class="bd-placeholder-img" width="100%" height="400px" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect width="100%" height="400px" fill="#000" fill-opacity="0.4"></rect></svg>
       <div class="container">
          <div class="carousel-caption text-left">
             <h5>Welcome back <asp:LoginName ID="LoginName1" runat="server" />, we are happy to see you!</h5>
             <p>Here you can see your membership, classes and change your password</p>
           </div>
       </div>
    </div>

    <br />
    
    <div class="Container d-flex justify-content-center">
            <div class="card mb-2 shadow-sm d-flex justify-content-center">
                <div class="card-header d-flex justify-content-center">
                    <h4 class="my-0 font-weight-normal">Your Account</h4>
                </div>
                <div class="card-body d-flex justify-content-center">
                    <ul class="list-unstyled mt-1 mb-1">
                            <li><b>Username:</b> <asp:LoginName ID="LoginName3" runat="server" /></li>
                            <li><b>Membership type:</b> <asp:Label id="Msg" ForeColor="maroon" runat="server" /> </li>
                            <li><b><asp:Label id="PriceLabel" runat="server" Text="Membership Price: " /></b> <asp:Label id="Price" ForeColor="maroon" runat="server" /> </li>
                            <li><b><asp:Label id="MembershipLabel" runat="server" Text="Change Membership: "/></b> <asp:DropDownList ID="RoleList" runat="server" AutoPostBack="True">
                                </asp:DropDownList></li>
                            <li><br /></li>
                            <li><asp:Button ID="ConfirmButton" runat="server" Text="Confirm Change" OnClick="ConfirmButton_Click" /></li>
                            <li><asp:Label ID="ConfirmLabel" runat="server" Text=""></asp:Label></li>
                        </ul>
                </div>
                <div class="card-footer d-flex justify-content-center">
                    <asp:ChangePassword ID="ChangePassword1" runat="server"></asp:ChangePassword>
                </div>
            </div>
    </div>
</asp:Content>

