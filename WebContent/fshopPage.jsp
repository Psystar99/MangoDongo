
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="like.*"%>
<%@ page import="review.*"%>
<%@ page import="user.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>MANGOMANGO_change_reviewPage</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Free HTML5 Website Template by FreeHTML5.co" />
<meta name="keywords"
	content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
<meta name="author" content="FreeHTML5.co" />

<meta property="og:title" content="" />
<meta property="og:image" content="" />
<meta property="og:url" content="" />
<meta property="og:site_name" content="" />
<meta property="og:description" content="" />
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />

<link
	href="https://fonts.googleapis.com/css?family=Merriweather:300,400|Montserrat:400,700"
	rel="stylesheet">

<!-- Animate.css -->
<link rel="stylesheet" href="css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="css/icomoon.css">
<!-- Themify Icons-->
<link rel="stylesheet" href="css/themify-icons.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="css/bootstrap.css">

<!-- Owl Carousel  -->
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">

<!-- Theme style  -->
<link rel="stylesheet" href="css/style.css">

<!-- Modernizr JS -->
<script src="js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
   <script src="js/respond.min.js"></script>
   <![endif]-->

<!-- json 받아오기위한 script -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<%int fshopID=  Integer.parseInt(request.getParameter("fshopid"));%>
<script type="text/javascript">
var fshopID="<%=fshopID%>";
//fshop name 출력
$(document).ready(function() { 
   $.getJSON('./json/food.json', function(data) { 
      var name = []; // 받아올 데이터를 저장할 배열 선언
      $.each(data, function(index, item) {
         name.push('<font size=15px;>' + item.Info[fshopID].Name +'</font>');
      });
      $('#name').html(name.join(''));
   }); 
});
   // img 출력
   $(document).ready(function() { 
      $.getJSON('./json/food.json', function(data) { 
         var img = []; // 받아올 데이터를 저장할 배열 선언
         $.each(data, function(index, item) { 
            img.push("<img  class='cafe-image' src ="+ item.Info[fshopID].images+ ">" + '<br>')
         });
         $('#img').html(img.join(''));
      }); 
   });
   
   // info 출력
   $(document).ready(function() { 
      $.getJSON('./json/food.json', function(data) { 
         var info = []; // 받아올 데이터를 저장할 배열 선언
       
         $.each(data, function(index, item) { 
            info.push('음식 종류 : ' + item.Info[fshopID].Category+ '<br>'); 
            info.push('주소 :' + item.Info[fshopID].Address+ '<br>');
            info.push('홈페이지 :' + item.Info[fshopID].homepage+ '<br>');
            info.push('전화번호 :' + item.Info[fshopID].phoneNumber+ '<br>');
            info.push('메뉴' + '<br>' + item.Info[fshopID].detail[0].menu+ '  ' +item.Info[fshopID].detail[0].cost +  '<br>');
            info.push(item.Info[fshopID].detail[1].menu+ '  ' +item.Info[fshopID].detail[1].cost +  '<br>');
            info.push(item.Info[fshopID].detail[2].menu+ '  ' +item.Info[fshopID].detail[2].cost +  '<br>');
            info.push(item.Info[fshopID].detail[3].menu+ '  ' +item.Info[fshopID].detail[3].cost +  '<br>');
            info.push(item.Info[fshopID].detail[4].menu+ '  ' +item.Info[fshopID].detail[4].cost +  '<br>');
         });
      
         $('#info').html(info.join(''));
      }); 
   });
   
   // map 출력
   $(document).ready(function() { 
      $.getJSON('./json/food.json', function(data) { 
         var map = []; // 받아올 데이터를 저장할 배열 선언
         $.each(data, function(index, item) {
            map.push('<div>' + item.Info[fshopID].xposition + ',' + item.Info[fshopID].yposition + '</div>');
         });
      
         $('#map').html(map.join(''));
      }); 
   });
</script>

</head>
<body>
	<%
   String userID = null;
   if(session.getAttribute("userID")!=null){
      userID=(String)session.getAttribute("userID");
   }
   
   %>
	<div class="gtco-loader"></div>
	<nav class="gtco-nav" role="navigation">
		<div class="gtco-container">

			<div class="row">
				<div class="col-sm-2 col-xs-main">
					<a href="mainPage.jsp"><img src="images/logo.png" alt="  "></a>
				</div>
				<div class="col-xs-10 text-right menu-1">
					<ul>
						<li class="active"><a href="index.html"></a></li>
						<div id="right">
							<a href="WC_main.html"><img class="my-small"
								src="images/worldcup.png" alt=""></a>
							<%
                     if(userID==null){
                        
                     %>
							<a href="loginpage.jsp"><img class="my-small"
								src="images/my_icon.png" alt=""></a>

							<%
                     }else{
                           %>

							<a href="logoutaction.jsp"><img class="my-small"
								src="images/logout.png" alt=""></a>
							<%
                            }
                     %>
						</div>
					</ul>
				</div>
			</div>
		</div>
	</nav>
	<hr>
	<!-- TOP footer -->



	<div class="gtco-container">
		<div id="img"></div>
		<br> <br> <br> <font id="name"></font>
		<%ReviewDAO reviewDAO=new ReviewDAO(); %>
		<%double star=reviewDAO.calStar(fshopID); 
          int cal=(int)star;%>

		<%for(int i=0;i<cal;i++){ %>
		<img src="images/Fstar.png">
		<%} %>
		<%for(int i=cal;i<5;i++){ %>
		<img src="images/Estar.png">
		<%} %>
		<%=star %>
		<div class="cafe-icon">
			<a href="writeReviewPage.jsp?fshopID=<%=fshopID%>"><img
				class="icon" src="images/pen.png"></a>
		</div>
		<hr>
		<div id="cafe-info">
			<div id="info"></div>
		</div>

		<div id="cafe-map" align="center">


			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7237c9aa55b84c8dfeefce0eb3f68222"></script>
			<script>
         var fshopID="<%=fshopID%>";
         
         // map 출력
         var map_x = 0; // 받아올 데이터를 저장할 변수 선언
          var map_y = 0;
            $(document).ready(function() { 
               $.getJSON('./json/food.json', function(data) {
                  $.each(data, function(index, item) {
                     map_x = item.Info[fshopID].xposition;
                     map_y = item.Info[fshopID].yposition;
                    
                  });

                  var mapContainer = document.getElementById('cafe-map'); //지도를 담을 영역의 DOM 레퍼런스
                  var mapOption = { //지도를 생성할 때 필요한 기본 옵션
                     center: new kakao.maps.LatLng(map_x, map_y), //지도의 중심좌표.
                     level: 3 //지도의 레벨(확대, 축소 정도)
                  };
                  var map = new kakao.maps.Map(mapContainer, mapOption);

                  //마커가 표시될 위치입니다 
                  var markerPosition  = new kakao.maps.LatLng(map_x, map_y); 

                  //마커를 생성합니다
                  var marker = new kakao.maps.Marker({
                     position: markerPosition
                  });

                  //마커가 지도 위에 표시되도록 설정합니다
                  marker.setMap(map);
                  var iwContent = '<div style="padding:5px;font-size:12px;"><b>해당가게 위치</b></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                  iwPosition = new kakao.maps.LatLng(map_x, map_y); //인포윈도우 표시 위치입니다
                 
                  var infowindow = new kakao.maps.InfoWindow({
                      position : iwPosition, 
                      content : iwContent 
                   });
                  infowindow.open(map, marker); 
              }); 
              
            });
           
     
      </script>
		</div>
		<%ArrayList<Review> list = new ArrayList<Review>();
      list=reviewDAO.getFshopReview(fshopID); 
      int size=list.size();%>

		<font size=15px>리뷰 (<%=size %>)
		</font>
		<hr>

		<%if(size==0){}else{for(int i=size-1;i>=0;i--){ %>
		<div class="cafe-review">
			<img class="user-image"
				src="images/mypage_icon.png"></a>
			<div id="cafe-review-text-box">
				<font size=6px><%=list.get(i).getUserName()%></font>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			
					<% int starc=(int)list.get(i).getStar();
                  for(int x=0;x<starc;x++){ %>
					<img src="images/Fstar.png">
					<%} %>
					<%for(int x=starc;x<5;x++){ %>
					<img src="images/Estar.png">
					<%} %>
			
				<font size=4px style="float:right;"><%=list.get(i).getBbsDate()%></font> <br> <br>
				<div id="cafe-review-text"><%=list.get(i).getBbsContent()%></div>
				<% if((userID!=null)&&(userID.equals(list.get(i).getUserName()))){%><br><br><a href = "deleteReviewAction.jsp?fshopID=<%=fshopID%>"><img class = "change-small" src = "images/cancel.png"></a>
            <a href = "modifyReviewPage.jsp?fshopID=<%=fshopID%>"><img class = "change-small" src = "images/pen.png"></a>
				<%}%>
			</div>
		</div>
		<%}}%>
		<br>
	</div>




	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!— jQuery Easing —>
	<script src="js/jquery.easing.1.3.js"></script>
	<!— Bootstrap —>
	<script src="js/bootstrap.min.js"></script>
	<!— Waypoints —>
	<script src="js/jquery.waypoints.min.js"></script>
	<!— Carousel —>
	<script src="js/owl.carousel.min.js"></script>

	<!— Main —>
	<script src="js/main.js"></script>
</body>

<footer id="gtco-footer" class="gtco-section" role="contentinfo">
	<div class="gtco-container">
		<div class="row row-pb-md">
			<div class="col-md-4 gtco-widget gtco-footer-paragraph">
				<h3>Web Programming Project</h3>
				<p>동국대학교 인근 음식점을 검색하고 관심등록과 리뷰를 작성할 수 있으며 음식점에 관한 정보를 얻을 수 있는
					홈페이지 입니다.</p>
			</div>
			<div class="col-md-4">
				<div class="row">
					<div class="col-md-6 gtco-footer-link"></div>
					<div class="col-md-6 gtco-footer-link">
						<h3>Who makes</h3>
						<ul class="gtco-list-link">
							<li><a href="#">윤희창</a></li>
							<li><a href="#">심정용</a></li>
							<li><a href="#">박소영</a></li>
							<li><a href="#">이원정</a></li>
							<li><a href="#">임성혁</a></li>
							<li><a href="#">여은동</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

</footer>
<!— END footer —>

</div>

</body>
</html>