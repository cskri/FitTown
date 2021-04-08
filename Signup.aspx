<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Signup.aspx.cs" Inherits="Signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="card" style="background: url(../images/RegisterWorkout.jpg) no-repeat center;background-size:cover">
       <svg class="bd-placeholder-img" width="100%" height="400px" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect width="100%" height="400px" fill="#000" fill-opacity="0.4"></rect></svg>
       <div class="container">
          <div class="carousel-caption text-left">
             <h5>No crazy signup forms!</h5>
             <p>Just choose your membership and create your account!</p>
           </div>
       </div>
    </div>
     <!-- On Page Title -->
        <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
            <h1 class="display-4">Join FitTown today</h1>
            <p class="lead">Our favorable prices are made specially for you! The trainer who wants to maximize value for your money!</p>
        </div>
        
        <!-- Start bootstrap card-deck -->
        <div class="container">
            <div class="card-deck mb-3 text-center">
                <div class="card mb-4 shadow-sm">
                    <div class="card-header">
                        <h4 class="my-0 font-weight-normal">Basic</h4>
                    </div>
                    <div class="card-body">
                        <h1 class="card-title pricing-card-title">99kr <small class="text-muted">/ mo</small></h1>
                        <ul class="list-unstyled mt-3 mb-4">
                            <li>Access for 1 User</li>
                            <li>Unlimited usage of equipment</li>
                            <li>Email support</li>
                        </ul>
                        <a class="btn btn-lg btn-block btn-primary" href="Register.aspx">Get started</a>
                    </div>
                </div>
                <div class="card mb-4 shadow-sm">
                    <div class="card-header">
                        <h4 class="my-0 font-weight-normal">Plus</h4>
                    </div>
                    <div class="card-body">
                        <h1 class="card-title pricing-card-title">199kr <small class="text-muted">/ mo</small></h1>
                        <ul class="list-unstyled mt-3 mb-4">
                            <li>Includes Basic's Benefits</li>
                            <li>50% Discount on supplies</li>
                            <li>Priority email support</li>
                        </ul>
                        <a class="btn btn-lg btn-block btn-primary" href="Register.aspx">Get started</a>
                    </div>
                </div>
                <div class="card mb-4 shadow-sm">
                    <div class="card-header">
                        <h4 class="my-0 font-weight-normal">Prime</h4>
                    </div>
                    <div class="card-body">
                        <h1 class="card-title pricing-card-title">499kr <small class="text-muted">/ mo</small></h1>
                        <ul class="list-unstyled mt-3 mb-4">
                            <li>Includes Plus's Benefits</li>
                            <li>Bring a friend, no additional cost</li>
                            <li>Personal trainer</li>
                        </ul>
                        <a class="btn btn-lg btn-block btn-primary" href="Register.aspx">Get started</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- END bootstrap card-deck -->

        <!-- Sign in -->
        <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
        <h4 class="my-0 font-weight-normal">Already a user? Sign in <a href="Login.aspx">HERE</a> to see your account</h4>
        </div>
        <!-- End Sign In Reference -->
</asp:Content>

