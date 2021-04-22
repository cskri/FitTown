<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Instructors.aspx.cs" Inherits="Instructors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="card" style="background: url(/images/InstructorsWorkout.jpg) no-repeat center;background-size:cover">
       <svg class="bd-placeholder-img" width="100%" height="400px" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect width="100%" height="400px" fill="#000" fill-opacity="0.4"></rect></svg>
       <div class="container">
          <div class="carousel-caption text-left">
             <h5>Take a look at our Instructors!</h5>
             <p>We take great pride in helping you to be the best version of yourself!</p>
           </div>
       </div>
    </div>

    <h2 style="text-align:center">Our Team</h2>

    <div class="container">
            <div class="card-deck mb-3 text-center">
                <div class="card mb-4 shadow-sm">
                    <div class="card-header">
                        <img src="/images/instructor2.jpg" alt="Jane" style="width:100%"/>
                    </div>
                    <div class="card-body">
                            <h2>Jane Henricks</h2>
                            <p class="title">Instructor</p>
                            <p>My passion in life has allways been fitness. Ever since i was 15 i have been going to the gym, over the years i became really friendly 
                                with my gym community and ever since that experiance i have always wanted to become an instructor. <br />
                                I mainly instruct spinning as you can see on the photo.</p>
                            <p>jane@example.com</p>
                            
                        
                    </div>
                    <div class="card-footer">
                            <a href="mailto:jane@example.com" class="button">Contact</a>
                    </div>
                </div>
                <div class="card mb-4 shadow-sm">
                    <div class="card-header">
                        <img src="/images/Instructor1.jpg" alt="Mike" style="width:100%"/>
                    </div>
                    <div class="card-body">
                            <h2>Mike Ross</h2>
                            <p class="title">Instructor</p>
                            <p>If you need anything within powerlifting i am your guy. My main focus is heavy lifting for semi 
                                professional athlete, i will help you reach your goals and dreams. if you have any questions please contact me.</p>
                            <p>mike@example.com</p>
                            
                        
                    </div>
                    <div class="card-footer">
                            <a href="mailto:Mike@example.com" class="button">Contact</a>
                    </div>
                </div>
                <div class="card mb-4 shadow-sm">
                    <div class="card-header">
                         <img src="/images/instructor3.jpg" alt="Anne" style="width:100%"/>
                    </div>
                    <div class="card-body">
                            <h2>Anne Poulsen</h2>
                            <p class="title">Personal trainer</p>
                            <p>Traning has always been a great passion for me, and now i have the chance to share my passion with 
                                everyone. If you are looking for a dedicated personal trainer please contact me.
                            </p>
                            <p>Anne@example.com</p>
                            
                        
                    </div>
                    <div class="card-footer">
                            <a href="mailto:Anne@example.com" class="button">Contact</a>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>

