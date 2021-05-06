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
    <div class="card" style="background: url(/images/ManageClass.jpg) no-repeat center;background-size:cover">
       <svg class="bd-placeholder-img" width="100%" height="400px" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect width="100%" height="400px" fill="#000" fill-opacity="0.4"></rect></svg>
       <div class="container">
          <div class="carousel-caption text-left">
             <h5>Hey there <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>!</h5>
              
             <p>Create some classes for our customers!</p>
           </div>
       </div>
    </div>

    <div class="Container d-flex justify-content-center">
        <div class="card-deck mb-3 text-center">
            <div class="card mb-2 shadow-sm d-flex justify-content-center" style="min-width:400px;">
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

                    </ul>
                </div>
                <div class="card-footer d-flex justify-content-center">
                    <ul class="list-unstyled mt-1 mb-1">
                        <li>
                            <asp:Button ID="ConfirmButton" runat="server" Text="Confirm Class" OnClick="ConfirmButton_Click" />
                        </li>
                        <li>
                            <asp:Label ID="resultLabel" runat="server" Text=""></asp:Label>
                        </li>
                    </ul>
                </div>
            </div>

        <div class="card mb-2 shadow-sm d-flex justify-content-center" style="min-width: 600px;">
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

                    <asp:Label ID="deleteClassLabel" runat="server" Text="No class selected &nbsp  "></asp:Label>
                    <asp:Button ID="DeleteButton" runat="server" Text="Delete Class" OnClick="DeleteButton_Click" />
                </div>
            </div>
            <div class="card mb-2 shadow-sm d-flex justify-content-center" style="min-width: 350px;">
                <div class="card-header d-flex justify-content-center">  
                    <h4 class="my-0 font-weight-normal">Manage Class Attendants</h4>            
                </div>

                <div class="card-header d-flex justify-content-center">
                        <asp:Label ID="chosenClassLabel" runat="server" Text="0" Visible="false"></asp:Label>
                        <b>Choose a Class to manage attendants: </b>
                        <asp:LoginView ID="LoginView4" runat="server">
                            <RoleGroups>
                                <asp:RoleGroup Roles="Instructor">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="chooseClassList" runat="server" Width="120px" OnSelectedIndexChanged="chooseClassList_SelectedIndexChanged"
                                            DataSourceID="SqlDataSource2" DataTextField="Id" DataValueField="Id" AutoPostBack="true" >
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
                                        <asp:DropDownList ID="chooseClassList" runat="server" Width="120px" OnSelectedIndexChanged="chooseClassList_SelectedIndexChanged" AutoPostBack="true"
                                            DataSourceID="SqlDataSource2" DataTextField="Id" DataValueField="Id" >
                                        </asp:DropDownList>

                                        <!-- SQL statement that retrieves all rooms from the database -->
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>"
                                            SelectCommand="SELECT [Id] FROM [Classes]"></asp:SqlDataSource>
                                    </ContentTemplate>
                                </asp:RoleGroup>
                            </RoleGroups>
                        </asp:LoginView>
                 </div>   
                    <div class="card-body d-flex justify-content-center">
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" AllowPaging="true"
                                    OnPageIndexChanging="OnPaging2" PageSize="10" AutoGenerateSelectButton="true" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                                    <Columns>
                                        <asp:BoundField ItemStyle-Width="100px" DataField="Id" HeaderText="Booking Id" />
                                        <asp:BoundField ItemStyle-Width="100px" DataField="UserName" HeaderText="Atendee Name" />
                                        <asp:BoundField ItemStyle-Width="100px" DataField="ClassId" HeaderText="Class ID" />
                                    </Columns>
                                    <SelectedRowStyle BackColor="LightGrey"
                                        ForeColor="DarkBlue"
                                        Font-Bold="true" />
                                </asp:GridView></div>


                <div class="card-footer d-flex justify-content-center">
                            <asp:Label ID="AtendeeLabel" runat="server" Text="No one selected &nbsp  "></asp:Label>
                            <asp:Button ID="RemoveAtendee" runat="server" Text="Remove Atendee" OnClick="RemoveButton_Click" />
                </div>
            </div>
    
        </div>
    </div>
</asp:Content>

