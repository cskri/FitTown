<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="card" style="background: url(/images/LoginWorkout.jpg) no-repeat center;background-size:cover">
       <svg class="bd-placeholder-img" width="100%" height="400px" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect width="100%" height="400px" fill="#000" fill-opacity="0.4"></rect></svg>
       <div class="container">
          <div class="carousel-caption text-left">
             <h5>Welcome back!</h5>
             <p>The changing room is ready for you and machines are clean!</p>
           </div>
       </div>
    </div>

    <br />
 
    <div class="Container d-flex justify-content-center">
            <div class="card mb-2 shadow-lg d-flex justify-content-center">
                <div class="card-header d-flex justify-content-center">
                    <h4 class="my-0 font-weight-normal">Sign In</h4>
                </div>
                <div class="card-body d-flex justify-content-center">
                <asp:Login ID="Login1" runat="server"></asp:Login>
                </div>
                <div class="card-footer d-flex justify-content-center">
                <asp:PasswordRecovery ID="PasswordRecovery1" runat="server"></asp:PasswordRecovery>
                </div>
            </div>
    </div>
    <br />
</asp:Content>

