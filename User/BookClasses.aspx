<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BookClasses.aspx.cs" Inherits="BookClasses" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="card" style="background: url(/images/BookClass.jpg) no-repeat center;background-size:cover">
       <svg class="bd-placeholder-img" width="100%" height="400px" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect width="100%" height="400px" fill="#000" fill-opacity="0.4"></rect></svg>
       <div class="container">
          <div class="carousel-caption text-left">
             <h5>Get together in a class!</h5>
              <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
             <p>Signing up for some of our many classes will help you get motivated and live your dream!</p>
           </div>
       </div>
    </div>

    <div class="Container d-flex justify-content-center">
        <div class="card-deck mb-3 text-center">
            <div class="card mb-2 shadow-lg d-flex justify-content-center" style="min-width:600px;">
                <div class="card-header d-flex justify-content-center">
                    <h4 class="my-0 font-weight-normal">Book a class</h4>
                </div>
                <div class="card-body d-flex justify-content-center">
                    <ul class="list-unstyled mt-1 mb-1">
                        <li>
                            <asp:Label ID="userLabel" runat="server" Text="User: "></asp:Label>
                            <asp:LoginName ID="userLoginName" runat="server" />
                        </li>
                        <li>
                            <asp:Label ID="classLabel" runat="server" Text="Class: "></asp:Label>
                            <asp:DropDownList ID="classDropDownList" runat="server" Width="500px">
                            </asp:DropDownList>
                        </li>
                        <asp:LoginView ID="LoginView1" runat="server">
                            <RoleGroups>
                                <asp:RoleGroup Roles="Prime">
                                    <ContentTemplate>
                                        <li>
                                            <br />
                                        </li>
                                        <li>
                                            <h5>You are a Prime Member! Your benefits allow you to bring a friend!</h5>
                                        </li>
                                        <li>
                                            <h6>Sign up twice for the same class to bring your friend!</h6>
                                        </li>
                                    </ContentTemplate>
                                </asp:RoleGroup>
                            </RoleGroups>
                        </asp:LoginView>
                        
                        
                    </ul>   
                </div>

                <div class="card-footer d-flex justify-content-center">
                    <ul class="list-unstyled mt-1 mb-1">
                        <li><asp:Button ID="BookingButton" runat="server" Text="Sign me up!" OnClick="BookingButton_Click" /></li>
                        <li><asp:Label ID="resultLabel" runat="server" Text=""></asp:Label></li>
                    </ul>   
                    
                </div>
            </div>
            <div class="card mb-2 shadow-lg d-flex justify-content-center" style="min-width:600px;">
                <div class="card-header d-flex justify-content-center">
                    <h4 class="my-0 font-weight-normal">Classes that you are signed up for</h4>
                </div>
                <div class="card-body d-flex justify-content-center">
                     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" AllowPaging="true"
                        OnPageIndexChanging="OnPaging" PageSize="10" AutoGenerateSelectButton="true" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField ItemStyle-Width="100px" DataField="Id" HeaderText="Class ID" />
                            <asp:BoundField ItemStyle-Width="100px" DataField="Name" HeaderText="Class Name" />
                            <asp:BoundField ItemStyle-Width="100px" DataField="Room" HeaderText="Room" />
                            <asp:BoundField ItemStyle-Width="150px" DataField="Date" HeaderText="Date" />
                            <asp:BoundField ItemStyle-Width="100px" DataField="MaxParticipants" HeaderText="Maximum Participants" />
                            <asp:BoundField ItemStyle-Width="150px" DataField="Instructor" HeaderText="Assigned Instructor" />
                        </Columns>
                         <SelectedRowStyle BackColor="LightGrey"
                                        ForeColor="DarkBlue"
                                        Font-Bold="true" />
                    </asp:GridView> 
                </div>

                <div class="card-footer d-flex justify-content-center">
                    
                    <asp:Label ID="UnassignLabel" runat="server" Text="No Class Selected &nbsp"></asp:Label>
                    <asp:Button ID="UnassignButton" runat="server" Text="Unassign from class" OnClick="UnassignButton_Click" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>

