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
	href="${pageContext.request.contextPath}/resources/styles/responsive.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/timet_assets/css/common.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/timet_assets/css/style.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/timet_assets/css/container.table.css?ver=1">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/timet_assets/css/subjects.css">
<link
	href='${pageContext.request.contextPath}/resources/calendar/css/fullcalendar.css'
	rel='stylesheet' />
<link
	href='${pageContext.request.contextPath}/resources/calendar/css/fullcalendar.print.css'
	rel='stylesheet' media='print' />
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/calendar/js/jquery-ui.custom.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/calendar/js/fullcalendar.js?ver=1"
	type="text/javascript"></script>
<style>
body {
	margin-top: 40px;
	text-align: center;
	font-size: 14px;
	font-family: "Helvetica Nueue", Arial, Verdana, sans-serif;
	background-color: #FFFFFF;
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

.form_button {
	width: 15%;
	height: 45px;
	background: #2e21df;
	color: #FFFFFF;
	text-transform: uppercase;
	letter-spacing: 0.3em;
	font-family: 'Montserrat', sans-serif;
	font-size: 15px;
	font-weight: 700;
	border: none;
	outline: none;
	cursor: pointer;
	border-radius: 3px;
	margin-top: 5px;
}

.form_button:hover {
	box-shadow: 0px 10px 40px rgba(0, 0, 0, 0.3);
}

.form_button:focus {
	outline: none;
}

.trans_200 {
	-webkit-transition: all 200ms ease;
	-moz-transition: all 200ms ease;
	-ms-transition: all 200ms ease;
	-o-transition: all 200ms ease;
	transition: all 200ms ease;
}
</style>

</head>

<body>
	<script>
var tmp = new Array();

var schedule_Type = ["과제" ,"중간" , "기말"];
var subjectList = [];
var colorList = ["chill","info","important","success","do","yeon","jin","young"];
var result = [];
var index=0;
var schedule_Data = new Array();
</script>
	<c:forEach var="schedule" items="${schedule}" varStatus="status">
		<script>tmp.push("${schedule.sub_Name}");</script>
	</c:forEach>
	<script>
	$.each(tmp,function(key, value){ 
		if($.inArray(value, subjectList) === -1) 
			subjectList.push(value);
	});
	</script>
	<c:forEach var="schedule" items="${schedule}" varStatus="status">
		<script type="text/javascript">
		/*
		 * 	데이터 설정. 
		 */
		 for(index=0;index<subjectList.length;index++)
		 {
			 if(subjectList[index]=="${schedule.sub_Name}")
			 {
				 break;
			 }
		 }
		 var st = "${schedule.schedule_End}";
		 var months = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
		 var ss = st.substring(4,7);
		 for(var a=0;a<12;a++){
		        if(ss == months[a])
		        {
		        	ss = a;
		        }
		 }
		schedule_Data.push({
			"title" : "${schedule.schedule_Name}" ,
			"start" : "${schedule.schedule_Start}",
			"end" : new Date(st.substring(11,16), ss*1, (st.substring(8,10)*1 + 1),0,0),
			"allDay" : false,
			"className" : colorList[index],
			"name" : "${schedule.sub_Name}",
			"type" : "${schedule.schedule_Type}",
			});
	</script>
	</c:forEach>
	<script>

var btn = document.getElementById("myBtn");
var span = document.getElementsByClassName("close");


	$(document).ready(
			function() {
				var date = new Date();
				var d = date.getDate();
				var m = date.getMonth();
				var y = date.getFullYear();

				/*  className colors

				className: default(transparent), important(red), chill(pink), success(green), info(blue)

				 */

				/* initialize the external events
				-----------------------------------------------------------------*/

				$('#external-events div.external-event').each(function() {

					// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
					// it doesn't need to have a start or end
					var eventObject = {
						title : $.trim($(this).text())
					// use the element's text as the event title
					};

					// store the Event Object in the DOM element so we can get to it later
					$(this).data('eventObject', eventObject);

					// make the event draggable using jQuery UI
					$(this).draggable({
						zIndex : 999,
						revert : true, // will cause the event to go back to its
						revertDuration : 0
					//  original position after the drag
					});

				});
				
			

				/* initialize the calendar
				-----------------------------------------------------------------*/

				var calendar = $('#calendar').fullCalendar(
						{
							header : {
								left : 'title',
								center : 'agendaDay,agendaWeek,month',
								right : 'prev,next today'
							},
							editable : true,
							firstDay : 1, //  1(Monday) this can be changed to 0(Sunday) for the USA system
							selectable : true,
							defaultView : 'month',

							axisFormat : 'h:mm',
							columnFormat : {
								month : 'ddd', // Mon
								week : 'ddd d', // Mon 7
								day : 'dddd M/d', // Monday 9/7
								agendaDay : 'dddd d'
							},
							titleFormat : {
								month : 'MMMM yyyy', // September 2009
								week : "MMMM yyyy", // September 2009
								day : 'MMMM yyyy' // Tuesday, Sep 8, 2009
							},
							allDaySlot : false,
							selectHelper : true,
							select : function(start, end, allDay) {
								//modal 관련
								var modal = document.getElementById('customsubjects');
								var btn = document.getElementById("myBtn");
								var span = document.getElementsByClassName("close")[0];
								
								modal.style.display = "block";
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
								
								document.getElementById("schedulestart").value=""+start;
								document.getElementById("scheduleend").value=""+end;
								console.log("schedule_Start" + document.getElementById("schedulestart").value);
								console.log("schedule_End" + document.getElementById("scheduleend").value);
								//var title = prompt('일정을 입력해주세요:');
								//var subject = prompt('과목을 입력해주세요:');
								/*
								if (title != null) {
									calendar.fullCalendar('renderEvent', {
										title : title,
										start : start,
										end : end,
										allDay : allDay,
										className : subject
									}, true // make the event "stick"
									);
									console.log(title + " " + subject + " "
											+ start + " " + end + " " + allDay
											+ " ");
									
								                  

								                  window.location.href = '/classmanagement/in_schedule'
								                        + '?title=' + title + '&subject='
								                        + subject + '&start='
								                        +start + '&end='
								                        + end ;
								               
								}
								*/
								calendar.fullCalendar('unselect');
							},
							droppable : false, // this allows things to be dropped onto the calendar !!!
							drop : function(date, allDay) { // this function is called when something is dropped

								// retrieve the dropped element's stored Event Object
								var originalEventObject = $(this).data(
										'eventObject');
								// we need to copy it, so that multiple events don't have a reference to the same object
								var copiedEventObject = $.extend({},
										originalEventObject);

								// assign it the date that was reported
								copiedEventObject.start = date;
								copiedEventObject.allDay = allDay;

								// render the event on the calendar
								// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
								$('#calendar').fullCalendar('renderEvent',
										copiedEventObject, true);

								// is the "remove after drop" checkbox checked?
								if ($('#drop-remove').is(':checked')) {
									// if so, remove the element from the "Draggable Events" list
									$(this).remove();
									console.log("DDD");
								}

							},

							events : schedule_Data
						});
				
						var scheduleIn = document.getElementsByClassName("fc-event-inner");
						$(scheduleIn).each(function() {
						      $(this).click(function() {
						         $(this).addClass("active");
						         $(this).siblings().removeClass("active");
						      });
						   });
			
						$(document).on("click", ".active", function() {
							var baseline = $(this).children().eq(0).children();
							
							var schedule_start = baseline.eq(0).attr("data");
							var schedule_end = baseline.eq(1).attr("data");
							var schedule_type = baseline.eq(2).attr("data");
							var subject_name = baseline.eq(3).attr("data");
							var schedule_title = baseline.eq(4).attr("data");
							
							//console.log(schedule_start + " " + schedule_end + " " + schedule_type + " " + subject_name + " " + schedule_title);
					
						});

				});
</script>
	<div id='wrap'>
		<div id='calendar'></div>
		<div style='clear: both'></div>
	</div>
	<form action="/classmanagement/in_schedule" method="POST"
		accept-charset="UTF-8" id="customsubjects"
		style="display: none; left: 317.333px;" onsubmit="return checkForm()">
		<a title="닫기" class="close"></a>
		<h2>새 일정 추가</h2>
		<dl>
			<dt>T i t l e</dt>
			<dd>
				<input type="hidden" value="" name="schedule_start"
					id="schedulestart" /> <input type="hidden" value=""
					name="schedule_end" id="scheduleend" /> <input type="text"
					class="text" name="schedule_Name" id="schedule_Name" />
			</dd>
			<dt>과목/대분류</dt>
			<dd class="timeplaces">
				<div class="timeplace">
					<p>
						<select name="sub_name" class="starthour" id="subname">
							<c:forEach var="course" items="${course}" varStatus="status">
								<option value="${course.sub_Name}">${course.sub_Name}</option>
							</c:forEach>

						</select> <select name="schedule_Type" class="endhour" id="type">
							<option value="과제" selected="selected">과제</option>
							<option value="시험">시험</option>
							<option value="시험">휴강</option>
						</select>
					</p>
				</div>
			</dd>
		</dl>
		<div class="submit">
			<input type="submit" value="저장" class="button">
		</div>
	</form>
	<br>
	<button id="myBtn" onclick="location.href='schedule' " type="submit"
		class="form_button trans_200">확인</button>
	<br>
	<br>
	<br>
	<br>
	<script>
		$('#subname').children().eq(0).attr("selected","selected");
		function checkForm() {
		    var userId = document.getElementById("schedule_Name");
		    // 아이디 입력 유무 체크
		    if(userId.value == '' || userId.value == null) {
		        window.alert("제목을 입력하세요");
		        userId.focus();
		        userId.select();
		        return false;
		    }
		    return true;
		}
	</script>



</body>
</html>