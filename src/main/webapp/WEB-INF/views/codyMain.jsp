<%@page import="com.trendypeop.myapp.entity.Cody"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>TrendyPeop</title>
<!-- Meta -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="" />
<meta name="keywords" content="">
<meta name="author" content="Phoenixcoded" />

<!-- Favicon icon -->
<link rel="icon" href="resources/assets/images/favicon.png"
	type="image/x-icon">

<!-- vendor css -->
<link rel="stylesheet" href="resources/assets/css/style.css">

</head>

<body class="">

	<%@include file="./nav.jsp"%>

	<!-- [ Main Content ] start -->

	<div class="pcoded-main-container">
		<div class="pcoded-content">
			<!-- [ breadcrumb ] start -->
			<div class="page-header">
				<div class="page-block">
					<div class="row align-items-center">
						<div class="col-md-12">
							<div class="page-header-title">
								<h5 class="m-b-10">Fashion Trend Dashboard</h5>
							</div>
							<ul class="breadcrumb">
								<li class="breadcrumb-item"><a href="goMain">
								<i class="feather icon-home"></i></a></li>
								<li class="breadcrumb-item"><a>TrendyPeop</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- [ breadcrumb ] end -->

			<!-- 컨텐츠 영역 -->
			<div class="card support-bar full">
				<!-- 헤더 -->
				<div class="row">
					<div class="col">
						<h4 class="mt-4">
							<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-arrow-through-heart-fill" viewBox="0 0 16 16">
							<path fill-rule="evenodd" d="M2.854 15.854A.5.5 0 0 1 2 15.5V14H.5a.5.5 0 0 1-.354-.854l1.5-1.5A.5.5 0 0 1 2 11.5h1.793l3.103-3.104a.5.5 0 1 1 .708.708L4.5 12.207V14a.5.5 0 0 1-.146.354l-1.5 1.5ZM16 3.5a.5.5 0 0 1-.854.354L14 2.707l-1.006 1.006c.236.248.44.531.6.845.562 1.096.585 2.517-.213 4.092-.793 1.563-2.395 3.288-5.105 5.08L8 13.912l-.276-.182A23.825 23.825 0 0 1 5.8 12.323L8.31 9.81a1.5 1.5 0 0 0-2.122-2.122L3.657 10.22a8.827 8.827 0 0 1-1.039-1.57c-.798-1.576-.775-2.997-.213-4.093C3.426 2.565 6.18 1.809 8 3.233c1.25-.98 2.944-.928 4.212-.152L13.292 2 12.147.854A.5.5 0 0 1 12.5 0h3a.5.5 0 0 1 .5.5v3Z" />
							</svg>
							Cody Main
						</h4>
					</div>
					<!-- 카테고리 버튼 -->
					<div class="col" style="margin-left: auto; margin-top: auto;">
						<div class="row" id="float">
							<div class="col-sm" style="padding: inherit">
								<div class="btn-group-sm mb-2 mr-2">
									<button class="btn btn-sm btn-outline-primary dropdown-toggle"
										type="button" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false">Look</button>
									<div class="dropdown-menu dropdown-menu-right">
										<a class="dropdown-item" href="filterCodyLook?cody_look=여친룩">여친룩</a>
										<a class="dropdown-item" href="filterCodyLook?cody_look=레이어드룩">레이어드룩</a>
										<a class="dropdown-item" href="filterCodyLook?cody_look=출근룩">출근룩</a>
									</div>
								</div>
							</div>
							<div class="col-sm" style="padding: inherit">
								<div class="btn-group-sm mb-2 mr-2">
									<button class="btn btn-sm btn-outline-primary dropdown-toggle"
										type="button" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false">Style</button>
									<div class="dropdown-menu dropdown-menu-right">
										<a class="dropdown-item" href="filterCodyStyleTag?cody_style_tag=캐주얼">캐주얼</a>
										<a class="dropdown-item" href="filterCodyStyleTag?cody_style_tag=스트릿">스트릿</a>
										<a class="dropdown-item" href="filterCodyStyleTag?cody_style_tag=아메카지">아메카지</a>
										<a class="dropdown-item" href="filterCodyStyleTag?cody_style_tag=비즈니스캐주얼">비즈니스캐주얼</a>
										<a class="dropdown-item" href="filterCodyStyleTag?cody_style_tag=걸리시">걸리시</a>
										<a class="dropdown-item" href="filterCodyStyleTag?cody_style_tag=로맨틱">로맨틱</a>
										<a class="dropdown-item" href="filterCodyStyleTag?cody_style_tag=시크">시크</a>
										<a class="dropdown-item" href="filterCodyStyleTag?cody_style_tag=댄디">댄디</a>
										<a class="dropdown-item" href="filterCodyStyleTag?cody_style_tag=홈웨어">홈웨어</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 이미지 시작 -->
				<div class="row">
					<div class="col">
						<hr>
						<% List<Cody> codyList = (List<Cody>) request.getAttribute("codyList");
		                  
                  		for(int i=0;i<=(codyList.size()/5+1);i++) {
                    	int j = i*5; %>

						<div class="card-deck">
							<c:forEach items="${codyList }" var="c" begin="<%=j %>"
								end="<%=j+4 %>">
								<div class="card" id="max">
									<a href="goCodyDetail?cody_idx=${c.cody_idx }"> <img
										class="img-fluid card-img-top" src="${c.cody_img_url}"
										alt="Card image cap">
									</a>
									<div class="card-body">
										<h5 class="card-title">${c.cody_name }</h5>
									</div>
									<div class="card-footer">
									<% if (loginUser == null) { %>
										<button type="button" class="btn btn-icon btn-outline-primary" onclick="user()">
											<i class="feather icon-heart"></i>
										</button>
										<button type="button" class="btn btn-icon btn-outline-info" onclick="location.href='goCodyDetail?cody_idx=${c.cody_idx }'">
											<i class="feather icon-search"></i>
										</button>
									<% } else { %>
										<button type="button" class="btn btn-icon btn-outline-primary" id="insertCodyHeart" onclick="insertCodyHeart('${c.cody_idx}', '${loginUser.user_id}')">
											<i class="feather icon-heart"></i>
										</button>
										<button type="button" class="btn btn-icon btn-outline-info" onclick="location.href='goCodyDetail?cody_idx=${c.cody_idx }'">
											<i class="feather icon-search"></i>
										</button>
									<% }  %>
									</div>
								</div>
							</c:forEach>
						</div>
						<br><br>
						<% } %>
					</div>
				</div>
				<!-- 이미지 끝 -->
			</div>
			<!-- 컨텐츠 영역 끝 -->
			<button type="button" class="btn btn-icon btn-primary" id="scrollToTopBtn">
				<a href="#" style="color: white;"><i class="feather icon-arrow-up"></i></a>
			</button>
		</div>
	</div>
	
	<script>
		function user() {
			alert("로그인후 사용 가능합니다.")
		}
	</script>
	<!-- [ Main Content ] end -->


	<!-- Required Js -->
	<script src="resources/assets/js/vendor-all.min.js"></script>
	<script src="resources/assets/js/plugins/bootstrap.min.js"></script>
	<script src="resources/assets/js/ripple.js"></script>
	<script src="resources/assets/js/pcoded.min.js"></script>

	<!-- Apex Chart -->
	<script src="resources/assets/js/plugins/apexcharts.min.js"></script>


	<!-- custom-chart js -->
	<script src="resources/assets/js/pages/dashboard-main.js"></script>
	
	<script>
		
	function insertCodyHeart(cody_idx, user_id) {

        //Ajax로 전송
        $.ajax({
            url : './insertCodyHeart',
            data : {
                cody_idx : cody_idx,
                user_id : user_id
            },
            type : 'POST',
            dataType : 'json',
            success : function(result) {
                if (result.success) {
                    pass;
                } 
            }
        }); //End Ajax
    }
	</script>
	
</body>

</html>