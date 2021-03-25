<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
            <h1 class="display-4">Sign In</h1>
        </div>
    <br />
    <div class="Container" style="vertical-align:central">
            <div class="card mb-10 shadow-lg text-center">
                <asp:Login ID="Login1" runat="server"></asp:Login>
            </div>
    </div>
    <br />
</asp:Content>

