<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="generalError.aspx.cs" Inherits="errorMessages_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h3>
        An error occured.<br /> <br />

        If you would like to return to the home page click here <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Default.aspx" runat="server">home page</asp:HyperLink>.
    </h3>
</asp:Content>

