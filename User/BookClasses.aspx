<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BookClasses.aspx.cs" Inherits="BookClasses" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="card" style="background: url(/images/ClassesWorkout.jpg) no-repeat center;background-size:cover">
       <svg class="bd-placeholder-img" width="100%" height="400px" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect width="100%" height="400px" fill="#000" fill-opacity="0.4"></rect></svg>
       <div class="container">
          <div class="carousel-caption text-left">
             <h5>Get together in a class!</h5>
             <p>Signing up for some of our many classes will help you get motivated and live your dream!</p>
           </div>
       </div>
    </div>

    <div class="Container d-flex justify-content-center">
            <div class="card mb-2 shadow-lg d-flex justify-content-center">
                <div class="card-header d-flex justify-content-center">
                    <h4 class="my-0 font-weight-normal">Book a class</h4>
                </div>
                <div class="card-body d-flex justify-content-center">
                    <ul class="list-unstyled mt-1 mb-1">
                        <li>
                            <asp:Label ID="userLabel" runat="server" Width="60px" Text="User: "></asp:Label>
                            <asp:LoginName ID="userLoginName" Width="120px" runat="server" />
                        </li>
                        <li>
                            <asp:Label ID="classLabel" runat="server" Width="60px" Text="Class: "></asp:Label>
                            <asp:DropDownList ID="classDropDownList" runat="server" Width="500px">
                            </asp:DropDownList>
                        </li>
                        
                    </ul>   
                </div>

                <div class="card-footer d-flex justify-content-center">
                    <ul class="list-unstyled mt-1 mb-1">
                        <li><asp:Button ID="BookingButton" runat="server" Text="Sign me up!" OnClick="BookingButton_Click" /></li>
                        <li><asp:Label ID="resultLabel" runat="server" Text=""></asp:Label></li>
                    </ul>   
                    
                </div>
            </div>
    </div>

</asp:Content>

