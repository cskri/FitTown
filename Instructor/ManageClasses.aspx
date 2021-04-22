<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageClasses.aspx.cs" Inherits="Instructor_ManageClasses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="card" style="background: url(/images/ClassesWorkout.jpg) no-repeat center;background-size:cover">
       <svg class="bd-placeholder-img" width="100%" height="400px" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect width="100%" height="400px" fill="#000" fill-opacity="0.4"></rect></svg>
       <div class="container">
          <div class="carousel-caption text-left">
             <h5>Hey there Instructor!</h5>
             <p>Create some classes for our customers!</p>
           </div>
       </div>
    </div>

    <div class="Container d-flex justify-content-center">
            <div class="card mb-2 shadow-sm d-flex justify-content-center">
                <div class="card-header d-flex justify-content-center">
                    <h4 class="my-0 font-weight-normal">Create new Classes</h4>
                </div>
                <div class="card-body d-flex justify-content-center">
                    <ul class="list-unstyled mt-1 mb-1">
                        <li><b>Class Name:</b>
                            <asp:TextBox ID="ClassName" runat="server"></asp:TextBox>
                        </li>
                        <li><b>Room:</b>
                            <asp:TextBox ID="ClassRoom" runat="server"></asp:TextBox>
                        </li>
                        <li><b>Date & Time:</b>
                           <asp:TextBox ID="DateTime" runat="server"></asp:TextBox>
                        </li>
                        <li><b>Maximum Participants:</b>
                           <asp:TextBox ID="MaxParticipants" runat="server"></asp:TextBox>
                        </li>
                        <li>
                            <br />
                        </li>
                        <li>
                            <asp:Button ID="ConfirmButton" runat="server" Text="Confirm Class" OnClick="ConfirmButton_Click" />
                        </li>
                        <li>
                            <asp:Label ID="ConfirmLabel" runat="server" Text=""></asp:Label>
                        </li>

                    </ul>
                </div>
                <div class="card-footer d-flex justify-content-center">
                </div>
            </div>

        <div class="card mb-2 shadow-sm d-flex justify-content-center">
                <div class="card-header d-flex justify-content-center">
                    <h4 class="my-0 font-weight-normal">Classes that you are teaching</h4>
                </div>
                <div class="card-body d-flex justify-content-center">
                    
                </div>
                <div class="card-footer d-flex justify-content-center">
                </div>
            </div>
    </div>
</asp:Content>

