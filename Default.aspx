<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- Start Carousel 
        -- Thoughout our webpage i've been putting images for Carousel, Jumbotron, Featurettes etc. as Background images to the element, as well as using SVGs as placeholders for the image. The images will thereby be responsive and follow the page. (IT LOOKS REALLY GOOD!) -->
        <div id="myCarousel1" class="carousel slide mb-5" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#myCarousel1" data-slide-to="0" class="active"></li>
              <li data-target="#myCarousel1" data-slide-to="1" class=""></li>
              <li data-target="#myCarousel1" data-slide-to="2" class=""></li>
            </ol>
            <div class="carousel-inner">
              <div class="carousel-item active" style="background: url(images/gym-large.jpg) no-repeat center;background-size:cover">
                  <svg class="bd-placeholder-img" width="100%" height="400px" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect width="100%" height="400px" fill="#000" fill-opacity="0.4"></rect></svg>
                <div class="container">
                  <div class="carousel-caption text-left">
                    <h5>Welcome to VIA FIT</h5>
                    <p>Our goal is to maximize your perfomance and provide you with a cheap student-friendly gym membership. </p>
                    <p><a class="btn btn-lg btn-primary" href="signup.html" role="button">Sign up today</a></p>
                  </div>
                </div>
              </div>
              <div class="carousel-item" style="background: url(images/gym2-large.jpg) no-repeat center;background-size:cover">
                  <svg class="bd-placeholder-img" width="100%" height="400px" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect width="100%" height="400px" fill="#000" fill-opacity="0.5"></rect></svg>
                <div class="container">
                  <div class="carousel-caption">
                    <h5>Get in shape</h5>
                    <p>All of our equiptment is of the highest quality and our instructors will do their upmost in order to help you get in shape.</p>
                    <p><a class="btn btn-lg btn-primary" href="signup.html" role="button">Sign up today</a></p>
                  </div>
                </div>
              </div>
              <div class="carousel-item" style="background: url(images/gym3-large.jpg) no-repeat center;background-size:cover">
                <svg class="bd-placeholder-img" width="100%" height="400px" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect width="100%" height="400px" fill="#000" fill-opacity="0.4"></rect></svg>
                <div class="container">
                  <div class="carousel-caption text-right">
                    <h5>Various memberships</h5>
                    <p>We have three different memberships to match your exact needs, if you want to train alone, with extra benefits or with a personal trainer of the highest caliber and enthusiasm.</p>
                    <p><a class="btn btn-lg btn-primary" href="signup.html" role="button">Sign up today</a></p>
                  </div>
                </div>
              </div>
            </div>
            <a class="carousel-control-prev" href="#myCarousel1" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#myCarousel1" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
        </div>
        <!-- END Carousel-->
</asp:Content>

