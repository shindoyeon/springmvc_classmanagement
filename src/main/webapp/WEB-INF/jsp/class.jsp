<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%><!DOCTYPE html>
<html lang="ko">
<head>
<title>Class Management</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Lingua project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/styles/bootstrap4/bootstrap.min.css">
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
	href="${pageContext.request.contextPath}/resources/styles/main_styles.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/styles/responsive.css">
<script>
   document.getElementsByTagName("html")[0].className += " js";
</script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/timet_assets/css/common.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/timet_assets/css/style.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/timet_assets/css/container.table.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/timet_assets/css/subjects.css">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

</head>
<body>
	<script>
      var color = 0;
   </script>
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
										<li class=hassubs><a href="home">Home</a></li>
										<ul class="lang_list">
											<li class="active"><a href="#">강의</a></li>
										</ul>
										<ul class="lang_list">
											<li class="hassubs"><a href="subject">과제</a></li>
										</ul>
										<ul class="lang_list">
											<li class="hassubs"><a href="schedule">일정</a></li>
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
										<a class="dropdown" data-toggle="dropdown"
											aria-expanded="true"> <i class="fa fa-user"
											aria-hidden="true"></i></a>

										<ul class="dropdown-menu " style="right: 0; left: auto;">
											<li>
												<div class="blog_category">
													<h5>
														&nbsp&nbsp${loginSuccess.student_ID}님 환영합니다.<br>
														<br>&nbsp&nbsp${loginSuccess.student_Email}
													</h5>
													<div class="home_button trans_200">
														<a href="class">정보수정</a>
													</div>
												</div>
											</li>
										</ul>
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
               <li class="menu_mm"><a href="home">Home</a></li>
               <li class="menu_mm"><a href="#">강의</a></li>
               <li class="menu_mm"><a href="subject">과제</a></li>
               <li class="menu_mm"><a href="schedule">일정</a></li>
            </ul>
         </nav>
      </div>

		<!-- Home -->

		<div class="home">
			<div class="home_background"></div>
			<div class="home_content">
				<div class="container">
					<div class="row">
						<div class="col text-center">
							<h1 class="home_title">시간표</h1>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Regular -->

		<div class="regular">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="regular_content">
							<div class="regular_title"></div>
							<div class="regular_text">
								<div
									class="cd-schedule cd-schedule--loading margin-top--lg margin-bottom--lg js-cd-schedule">
									<div class="cd-schedule__timeline">
										<ul>
											<li><span>09:00</span></li>
											<li><span>09:30</span></li>
											<li><span>10:00</span></li>
											<li><span>10:30</span></li>
											<li><span>11:00</span></li>
											<li><span>11:30</span></li>
											<li><span>12:00</span></li>
											<li><span>12:30</span></li>
											<li><span>13:00</span></li>
											<li><span>13:30</span></li>
											<li><span>14:00</span></li>
											<li><span>14:30</span></li>
											<li><span>15:00</span></li>
											<li><span>15:30</span></li>
											<li><span>16:00</span></li>
											<li><span>16:30</span></li>
											<li><span>17:00</span></li>
											<li><span>17:30</span></li>
											<li><span>18:00</span></li>
										</ul>
									</div>
									<!-- .cd-schedule__timeline -->
									<div class="cd-schedule__events">
										<ul>

											<li class="cd-schedule__group">
												<div class="cd-schedule__top-info">
													<span>월</span>
												</div>
												<ul id="Mon"></ul>
											</li>
											<li class="cd-schedule__group">
												<div class="cd-schedule__top-info">
													<span>화</span>
												</div>
												<ul id="Tue"></ul>
											</li>
											<li class="cd-schedule__group">
												<div class="cd-schedule__top-info">
													<span>수</span>
												</div>
												<ul id="Wed"></ul>
											</li>
											<li class="cd-schedule__group">
												<div class="cd-schedule__top-info">
													<span>목</span>
												</div>
												<ul id="Thu"></ul>
											</li>
											<li class="cd-schedule__group">
												<div class="cd-schedule__top-info">
													<span>금</span>
												</div>
												<ul id="Fri"></ul>
											</li>

											<c:forEach var="timetable" items="${timetable}"
												varStatus="index">
												<script>
                                       var date = [ "월", "화", "수",
                                             "목", "금" ];
                                       var dateId = [ "Mon",
                                             "Tue", "Wed",
                                             "Thu", "Fri" ];

                                       for (var i = 0; i < 5; i++) {
                                          if (date[i] == '${timetable.lec_Day}') {
                                             var ulID = $("#"
                                                   + dateId[i]);
                                             var text = '<li class="cd-schedule__event"  >'
                                                   + '<ul class="status" style="display: block;"></li><li title="삭제" class="del"></li></ul>'
                                                   + '<a data-start="${timetable.lec_Start}" data-end="${timetable.lec_End}"'
                                                   + ' data-content="event-abs-circuit" data-event="event-'
                                                   + ((color++) % 4 + 1)
                                                   + '" href="#" value="${timetable.lec_Day}">'
                                                   + '<em class="cd-schedule__name">${timetable.sub_Name}</em>'
                                                   + '<em class="cd-schedule__name">${timetable.sub_Pfname}</em></a></li>';
                                             ulID.append(text);
                                          }
                                       }
                                    </script>
											</c:forEach>
										</ul>
									</div>
									<div class="cd-schedule-modal">
										<header class="cd-schedule-modal__header">
											<div class="cd-schedule-modal__content">
												<span class="cd-schedule-modal__date"></span>
												<h3 class="cd-schedule-modal__name"></h3>

											</div>

											<div class="cd-schedule-modal__header-bg"></div>
										</header>



										<a href="#0" class="cd-schedule-modal__close text--replace">Close</a>
									</div>

									<div class="cd-schedule__cover-layer"></div>
								</div>
								<!-- .cd-schedule -->

								<div class="row">
									<div class="col text-center">
										<button type="submit" class="form_button trans_200">수업
											목록</button>
										<button id="myBtn" type="submit" class="form_button trans_200">과목
											추가</button>
										<br>
										<form action="/classmanagement/registclass" method="POST"
											accept-charset="UTF-8" id="customsubjects"
											style="display: none; left: 317.333px;">
											<a title="닫기" class="close"></a>
											<h2>새 수업 추가</h2>
											<dl>
												<dt>과목명 (필수)</dt>
												<dd>
													<input type="text" placeholder="예) 경제학입문" maxlength="40"
														class="text" name="sub_Name" />
												</dd>
												<dt>교수명</dt>
												<dd>
													<input type="text" placeholder="예) 홍길동" maxlength="40"
														class="text" name="sub_Pfname" />
												</dd>
												<dt>시간/장소</dt>
												<dd class="timeplaces">
													<input type="hidden" value="월" name="lec_Day" id="lec_Day" />
													<div class="timeplace">
														<ol class="weeks">
															<li class="active">월</li>
															<li>화</li>
															<li>수</li>
															<li>목</li>
															<li>금</li>
														</ol>
														<p>
															<select name="lec_Start" class="starthour"
																id="start_hour">
																<option value="09" selected="selected">09</option>
																<option value="10">10</option>
																<option value="11">11</option>
																<option value="12">12</option>
																<option value="13">13</option>
																<option value="14">14</option>
																<option value="15">15</option>
																<option value="16">16</option>
																<option value="17">17</option>
																<option value="18">18</option>
															</select> <select name="lec_stm" class="startminute"
																id="start_min">
																<option value="00">00</option>
																<option value="05">05</option>
																<option value="10">10</option>
																<option value="15">15</option>
																<option value="20">20</option>
																<option value="25">25</option>
																<option value="30">30</option>
																<option value="35">35</option>
																<option value="40">40</option>
																<option value="45">45</option>
																<option value="50">50</option>
																<option value="55">55</option>
															</select> <span>~</span> <select name="lec_End" class="endhour"
																id="end_hour">
																<option value="09" selected="selected">09</option>
																<option value="10">10</option>
																<option value="11">11</option>
																<option value="12">12</option>
																<option value="13">13</option>
																<option value="14">14</option>
																<option value="15">15</option>
																<option value="16">16</option>
																<option value="17">17</option>
																<option value="18">18</option>
															</select> <select name="lec_enm" class="endminute" id="end_min">
																<option value="00">00</option>
																<option value="05">05</option>
																<option value="10">10</option>
																<option value="15">15</option>
																<option value="20">20</option>
																<option value="25">25</option>
																<option value="30">30</option>
																<option value="35">35</option>
																<option value="40">40</option>
																<option value="45">45</option>
																<option value="50">50</option>
																<option value="55">55</option>
															</select> <input type="text" placeholder="예) 종303"
																class="text place" name="lec_Location" />
														</p>
													</div>
													<a class="new"><strong>+</strong>더 입력</a>
												</dd>
											</dl>
											<div class="clearBothOnly"></div>
											<div class="submit">
												<input type="submit" value="저장" class="button">
											</div>
										</form>
									</div>
								</div>
							</div>
							<br>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- schedule -->
		<script type="text/javascript">
         // timetable 삭제 event
         $(document).ready(function() {
            $(".del").each(function() {
               $(this).click(function() {
                  $(this).addClass("isClicked");
                  $(this).siblings().removeClass("isClicked");
               });
            });
         });
         $(document).on(
               "click",
               ".isClicked",
               function() {
                  var tmp = $(this).parent().parent().children().eq(1);
                  console.log("" + tmp.attr("data-start"));
                  console.log("" + tmp.attr("data-end"));
                  console.log("" + tmp.attr("value"));
                  console.log("" + tmp.children().eq(0).text());
                  console.log("" + tmp.children().eq(1).text());

                  window.location.href = '/classmanagement/delclass'
                        + '?start=' + tmp.attr("data-start") + '&end='
                        + tmp.attr("data-end") + '&day='
                        + tmp.attr("value") + '&name='
                        + tmp.children().eq(0).text() + '&pfname='
                        + tmp.children().eq(1).text();
               });
         // 직접 추가 event
         var modal = document.getElementById('customsubjects');
         var btn = document.getElementById("myBtn");
         var span = document.getElementsByClassName("close")[0];
         var timeplace = document.getElementsByClassName("timeplace");
         $(document).ready(function() {
            $(timeplace).children().eq(0).children().each(function() {
               $(this).click(function() {
                  $(this).addClass("active");
                  $(this).siblings().removeClass("active");
               });
            });
         });
         $(document).on("click", ".active", function() {
            var a = $(this).text();
            document.getElementById("lec_Day").value = "" + a;
            console.log(a);
         });
         btn.onclick = function() {
            modal.style.display = "block";
         }

         // When the user clicks on <span> (x), close the modal
         span.onclick = function() {
            modal.style.display = "none";
         }

         // When the user clicks anywhere outside of the modal, close it
         window.onclick = function(event) {
            if (event.target == modal) {
               modal.style.display = "none";
            }
         }
         //

         //시작 시간
         $(document).ready(
               function() {
                  $("#start_hour").on(
                        "change",
                        function() {
                           console.log($(this).find(
                                 "option[value='" + $(this).val()
                                       + "']").text());
                        });
               });
         $(document).ready(
               function() {
                  $("#start_min").on(
                        "change",
                        function() {
                           console.log($(this).find(
                                 "option[value='" + $(this).val()
                                       + "']").text());
                        });
               });
         // 끝 시간
         $(document).ready(
               function() {
                  $("#end_hour").on(
                        "change",
                        function() {
                           console.log($(this).find(
                                 "option[value='" + $(this).val()
                                       + "']").text());
                        });
               });
         $(document).ready(
               function() {
                  $("#end_min").on(
                        "change",
                        function() {
                           console.log($(this).find(
                                 "option[value='" + $(this).val()
                                       + "']").text());
                        });
               });

         // When the user clicks on the button, open the modal
      </script>

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
	<script src="http://code.jquery.com/jquery-1.11.3.min.js"
		type="text/javascript" charset="utf-8"></script>

	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/styles/bootstrap4/popper.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/styles/bootstrap4/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/easing/easing.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/timet_assets/js/util.js"></script>
	<!-- util functions included in the CodyHouse framework -->
	<script
		src="${pageContext.request.contextPath}/resources/timet_assets/js/main.js"></script>

</body>
</html>