<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Class Management</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Lingua project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
   href="${pageContext.request.contextPath}/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css"
   rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/styles/main_styles.css?ver=1">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/styles/responsive.css">
<link
   href='${pageContext.request.contextPath}/resources/calendar/css/fullcalendar.css'
   rel='stylesheet' />
<link
   href='${pageContext.request.contextPath}/resources/calendar/css/fullcalendar.print.css'
   rel='stylesheet' media='print' />
<script
   src="${pageContext.request.contextPath}/resources/calendar/js/jquery-ui.custom.min.js"
   type="text/javascript"></script>
<script
   src="${pageContext.request.contextPath}/resources/calendar/js/fullcalendar.js"
   type="text/javascript"></script>
   <!-- jQuery -->

   <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
           integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
           crossorigin="anonymous"></script>

   <!-- Bootstrap CSS -->

   <link rel="stylesheet"
         href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
         integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
         crossorigin="anonymous">
<style>
body {
   margin-top: 40px;
   text-align: center;
   font-size: 14px;
   font-family: "Helvetica Nueue", Arial, Verdana, sans-serif;
   background-color: #DDDDDD;
}

#wrap {
   width: 1100px;
   margin: 0 auto;
}

#external-events {
   float: left;
   width: 150px;
   padding: 0 10px;
   text-align: left;
}

#external-events h4 {
   font-size: 16px;
   margin-top: 0;
   padding-top: 1em;
}

.external-event { /* try to mimick the look of a real event */
   margin: 10px 0;
   padding: 2px 4px;
   background: #3366CC;
   color: #fff;
   font-size: .85em;
   cursor: pointer;
}

#external-events p {
   margin: 1.5em 0;
   font-size: 11px;
   color: #666;
}

#external-events p input {
   margin: 0;
   vertical-align: middle;
}

#calendar {
   /*       float: right; */
   margin: 0 auto;
   width: 900px;
   background-color: #FFFFFF;
   border-radius: 6px;
   box-shadow: 0 1px 2px #C3C3C3;
}
</style>

</head>

<body>

   <div class="super_container">
      <!-- Header -->
      <header class="header">
         <!-- Top Bar -->
         <div class="top_bar">
            <div class="top_bar_container">
               <div class="container">
                  <div class="row">
                     <div class="col">
                        <div
                           class="top_bar_content d-flex flex-row align-items-center justify-content-start">
                           <div class="top_bar_right ml-auto">

                              <!-- Social -->
                              <div class="top_bar_social">
                                 <span class="top_bar_title social_title"><a
                                    href="logout">Logout</a></span>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>

         <!-- Header Content -->
         <div class="header_container">
            <div class="container">
               <div class="row">
                  <div class="col">
                     <div
                        class="header_content d-flex flex-row align-items-center justify-content-start">
                        <div class="logo_container mr-auto">
                           <a href="home">
                              <div class="logo_text">Class Management</div>
                           </a>
                        </div>
                        <nav class="main_nav_contaner">
                           <ul class="main_nav">
                              <li class="hassubs"><a href="home">Home</a></li>
                              <ul class="lang_list">
                                 <li class="hassubs"><a href="class">강의</a></li>
                              </ul>
                              <ul class="lang_list">
                                 <li class="hassubs"><a href="subject">과제</a></li>
                              </ul>
                              <ul class="lang_list">
                                 <li class="active"><a href="#">일정</a></li>
                              </ul>
                              
                           </ul>
                        </nav>
                        <div class="header_content_right ml-auto text-right">
                           <div class="header_search">
                              <div class="search_form_container">
                                 <form action="#" id="search_form"
                                    class="search_form trans_400">
                                    <input type="search" class="header_search_input trans_400"
                                       placeholder="Type for Search" required="required">
                                    <div class="search_button">
                                       <i class="fa fa-search" aria-hidden="true"></i>
                                    </div>
                                 </form>
                              </div>
                           </div>

                           <!-- Hamburger -->

                           <div class="user">
                              <a href="#"><i class="fa fa-user" aria-hidden="true"></i></a>
                           </div>
                           <div class="hamburger menu_mm">
                              <i class="fa fa-bars menu_mm" aria-hidden="true"></i>
                           </div>
                        </div>

                     </div>
                  </div>
               </div>
            </div>
         </div>
      </header>

      <!-- Menu -->

      <div
         class="menu d-flex flex-column align-items-end justify-content-start text-right menu_mm trans_400">
         <div class="menu_close_container">
            <div class="menu_close">
               <div></div>
               <div></div>
            </div>
         </div>
         <div class="search">
            <form action="#" class="header_search_form menu_mm">
               <input type="search" class="search_input menu_mm"
                  placeholder="Search" required="required">
               <button
                  class="header_search_button d-flex flex-column align-items-center justify-content-center menu_mm">
                  <i class="fa fa-search menu_mm" aria-hidden="true"></i>
               </button>
            </form>
         </div>
         <nav class="menu_nav">
            <ul class="menu_mm">
               <li class="menu_mm"><a href="index.html">Home</a></li>
               <li class="menu_mm"><a href="courses.html">Courses</a></li>
               <li class="menu_mm"><a href="instructors.html">Instructors</a></li>
               <li class="menu_mm"><a href="#">Events</a></li>
               <li class="menu_mm"><a href="blog.html">Blog</a></li>
               <li class="menu_mm"><a href="contact.html">Contact</a></li>
            </ul>
         </nav>
         <div class="menu_extra">
            <div class="menu_phone">
               <span class="menu_title">phone:</span>+44 300 303 0266
            </div>
            <div class="menu_social">
               <span class="menu_title">follow us</span>
               <ul>
                  <li><a href="#"><i class="fa fa-facebook"
                        aria-hidden="true"></i></a></li>
                  <li><a href="#"><i class="fa fa-instagram"
                        aria-hidden="true"></i></a></li>
                  <li><a href="#"><i class="fa fa-twitter"
                        aria-hidden="true"></i></a></li>
               </ul>
            </div>
         </div>
      </div>

      <!-- Home -->
        

      <!-- Events -->

      <div class="events">
         <div class="container">

            <br> <br> <br> <br><br><br>
            <c:forEach var="ExamEvent" items="${ExamEvent}" varStatus="index"
               begin="0" end="0">
               <h4 class="section_title text-center">다음에 다가올 시험은
                  ${ExamEvent.schedule_Name}(이름) , ${ExamEvent.sub_Name}(과목)입니다.</h4>
            </c:forEach>
            <c:forEach var="TaskEvent" items="${TaskEvent}" varStatus="index"
               begin="0" end="0">
               <h4 class="section_title text-center">다음에 다가올 과제는 ${TaskEvent.schedule_Name}(이름) ,
                  ${TaskEvent.sub_Name}(과목)입니다.</h4>
            </c:forEach>
            <c:forEach var="OffDayEvent" items="${OffDayEvent}"
               varStatus="index" begin="0" end="1">
               <h4 class="section_title text-center">다음에 다가올 휴강은 ${OffDayEvent.schedule_Name}(이름) ,
                  ${OffDayEvent.sub_Name}(과목)입니다.</h4>
            </c:forEach>
            <br> <br> <br> <br>
            <button id="myBtn" onclick="location.href='calendar' " type="submit"
               class="form_button trans_200">일정 추가</button>
<br> <br> <br> <br><br> <br>
         </div>
      </div>

      <!-- Blog -->




      <!-- Footer -->

      <footer class="footer">
         <div class="footer_body">
            <div class="container">
               <div class="row">

                  <!-- Newsletter -->
                  <div class="col-lg-3 footer_col">
                     <div
                        class="newsletter_container d-flex flex-column align-items-start justify-content-end">
                        <div class="footer_logo mb-auto">
                           <a href="#">Class Management</a>
                        </div>
                        <form action="#" id="newsletter_form" class="newsletter_form">
                           <input type="email" class="newsletter_input"
                              placeholder="Email" required="required">
                           <button class="newsletter_button">
                              <i class="fa fa-long-arrow-right" aria-hidden="true"></i>
                           </button>
                        </form>
                     </div>
                  </div>

                  <!-- About -->
                  <div class="col-lg-2 offset-lg-3 footer_col">
                     <div>
                        <div class="footer_title">A</div>
                        <ul class="footer_list">
                           <li><a href="#">Courses</a></li>
                           <li><a href="#">Team</a></li>
                        </ul>
                     </div>
                  </div>

                  <!-- Help & Support -->
                  <div class="col-lg-2 footer_col">
                     <div class="footer_title">B &amp;</div>
                     <ul class="footer_list">
                        <li><a href="#">Discussions</a></li>
                        <li><a href="#">Troubleshooting</a></li>
                     </ul>
                  </div>

                  <!-- Privacy -->
                  <div class="col-lg-2 footer_col clearfix">
                     <div>
                        <div class="footer_title">C &amp;</div>
                        <ul class="footer_list">
                           <li><a href="#">Community Guidelines</a></li>
                        </ul>
                     </div>
                  </div>

               </div>
            </div>
         </div>
         <div class="copyright">
            <div class="container">
               <div class="row">
                  <div class="col">
                     <div
                        class="copyright_content d-flex flex-md-row flex-column align-items-md-center align-items-start justify-content-start">
                        <div class="cr">
                           <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                           <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        </div>
                        <div class="cr_right ml-md-auto"></div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </footer>


   </div>

   <script
      src="${pageContext.request.contextPath}/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
   <script
      src="${pageContext.request.contextPath}/resources/plugins/easing/easing.js"></script>
</body>
</html>