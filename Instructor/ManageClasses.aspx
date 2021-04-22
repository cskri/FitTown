<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageClasses.aspx.cs" Inherits="Instructor_ManageClasses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src="/Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="/Scripts/jquery.dynDateTime.min.js" type="text/javascript"></script>
<script src="/Scripts/calendar-en.min.js" type="text/javascript"></script>
<link href="/Styles/calendar-blue.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=TextBox1.ClientID %>").dynDateTime({
            showsTime: true,
            ifFormat: "%Y/%m/%d %H:%M",
            daFormat: "%l;%M %p, %e %m, %Y",
            align: "BR",
            electric: false,
            singleClick: false,
            displayArea: ".siblings('.dtcDisplayArea')",
            button: ".next()"
        });
    });
</script>
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
                        <li><b>Date & Time:</b>
                           <asp:TextBox ID="TextBox1" runat="server" ReadOnly = "true"></asp:TextBox>
                            <img src="calender.png" />
                            <asp:Button ID="btnSave" runat="server" Text="Save" onclick="btnSave_Click" />
                        </li>
                        <li><b>Room:</b>
                            <asp:DropDownList ID="Rooms" runat="server"></asp:DropDownList>
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

