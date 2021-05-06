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
             <h5>Hey there <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>!</h5>
              
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
                           <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            <img src="calender.png" />
                            
                        </li>
                        <li><b>Room:</b>
                            <asp:DropDownList ID="roomDropDownList" runat="server" Width="120px"
                                DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Name">
                            </asp:DropDownList>

                            <!-- SQL statement that retrieves all rooms from the database -->
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>"
                                SelectCommand="SELECT [Name] FROM [Rooms]">
                            </asp:SqlDataSource>
                        </li>
                        <li>
                            <br />
                        </li>
                        <li>
                            <asp:Button ID="ConfirmButton" runat="server" Text="Confirm Class" OnClick="ConfirmButton_Click" />
                        </li>
                        <li>
                            <asp:Label ID="resultLabel" runat="server" Text=""></asp:Label>
                        </li>

                    </ul>
                </div>
                <div class="card-footer d-flex justify-content-center">
                </div>
            </div>

        <div class="card mb-2 shadow-sm d-flex justify-content-center">
                <div class="card-header d-flex justify-content-center">
                    <asp:LoginView ID="LoginView2" runat="server">
                    <RoleGroups>
                        <asp:RoleGroup Roles="Instructor">
                            <ContentTemplate>
                               <h4 class="my-0 font-weight-normal">Classes that you are teaching</h4>
                            </ContentTemplate>
                        </asp:RoleGroup>
                        <asp:RoleGroup Roles="admin">
                            <ContentTemplate>
                                <h4 class="my-0 font-weight-normal">Manage all classes</h4>
                            </ContentTemplate>
                        </asp:RoleGroup>
                    </RoleGroups>
                </asp:LoginView>
                </div>
                <div class="card-body d-flex justify-content-center">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" AllowPaging="true"
                        OnPageIndexChanging="OnPaging" PageSize="10">
                        <Columns>
                            <asp:BoundField ItemStyle-Width="150px" DataField="Id" HeaderText="Class ID" />
                            <asp:BoundField ItemStyle-Width="150px" DataField="Name" HeaderText="Class Name" />
                            <asp:BoundField ItemStyle-Width="150px" DataField="Room" HeaderText="Room" />
                            <asp:BoundField ItemStyle-Width="150px" DataField="Date" HeaderText="Date" />
                            <asp:BoundField ItemStyle-Width="150px" DataField="MaxParticipants" HeaderText="Maximum Participants" />
                            <asp:BoundField ItemStyle-Width="150px" DataField="Instructor" HeaderText="Assigned Instructor" />
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="card-footer d-flex justify-content-center">
                    <asp:LoginView ID="LoginView1" runat="server">
                    <RoleGroups>
                        <asp:RoleGroup Roles="Instructor">
                            <ContentTemplate>
                               Delete a class from Class ID: <nbrsp /><asp:DropDownList ID="deleteClassList" runat="server" Width="120px"
                                DataSourceID="SqlDataSource2" DataTextField="Id" DataValueField="Id">
                            </asp:DropDownList>

                            <!-- SQL statement that retrieves all rooms from the database -->
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                SelectCommand="SELECT [Id] FROM [Classes] WHERE ([Instructor] = @Instructor)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="Label1" Name="Instructor" PropertyName="Text" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            </ContentTemplate>
                        </asp:RoleGroup>

                        <asp:RoleGroup Roles="admin">
                            <ContentTemplate>
                              Delete a class from Class ID: <nbrsp /> <asp:DropDownList ID="deleteClassList" runat="server" Width="120px"
                                DataSourceID="SqlDataSource2" DataTextField="Id" DataValueField="Id">
                            </asp:DropDownList>

                            <!-- SQL statement that retrieves all rooms from the database -->
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>"
                                SelectCommand="SELECT [Id] FROM [Classes]">
                            </asp:SqlDataSource>
                            </ContentTemplate>
                        </asp:RoleGroup>
                    </RoleGroups>
                </asp:LoginView>
                    <asp:Button ID="DeleteButton" runat="server" Text="Delete Class" OnClick="DeleteButton_Click" />
                </div>
            </div>
    </div>
</asp:Content>

