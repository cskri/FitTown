<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
         <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <div class="card" style="background: url(/images/AboutWorkout.jpg) no-repeat center;background-size:cover">
       <svg class="bd-placeholder-img" width="100%" height="400px" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect width="100%" height="400px" fill="#000" fill-opacity="0.4"></rect></svg>
       <div class="container">
          <div class="carousel-caption text-left">
             <h5>Gettin' fit since 2021!</h5>
             <p>Read about our vision, mission and history!</p>
           </div>
       </div>
    </div>

    <div class="aboutus">
  <div class="container-fluid text-center">
  <h2>SERVICES</h2>
  <h4>What we offer</h4>
  <br>
  <div class="row">
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-heart"></span>
      <h4>Well Being</h4>
      <p>Lorem ipsum dolor sit amet..</p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-usd"></span>
      <h4>Cheap Membership</h4>
      <p>Lorem ipsum dolor sit amet..</p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-refresh"></span>
      <h4>Around the clock fitness</h4>
      <p>Lorem ipsum dolor sit amet..</p>
    </div>
    </div>
    <br><br>
  <div class="row">
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-scale"></span>
      <h4>Weight loss programs</h4>
      <p>Lorem ipsum dolor sit amet..</p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-plus"></span>
      <h4>Improved health</h4>
      <p>Lorem ipsum dolor sit amet..</p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-user"></span>
      <h4>Countless Instructors!</h4>
      <p>Lorem ipsum dolor sit amet..</p>
    </div>
  </div>
</div>
        </div>

</asp:Content>

