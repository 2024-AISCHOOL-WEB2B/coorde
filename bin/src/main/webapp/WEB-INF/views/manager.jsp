<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>OOTB MANAGER</title>
<!-- Meta -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<meta name="author" content="Phoenixcoded" />

<link rel="stylesheet"
	href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css" />

<!-- vendor css -->
<link rel="stylesheet" href="resources/assets/css/manager.css">

<style>
input {
	border: none;
	outline: none;
}
</style>


</head>
<body>
	<div class="wrap">
		<div class="contents">
			<header>
				<div class="logo">
					<a href="goManager"><img
						src="resources/assets/images/browser/LOGO.png" alt="logo"></a>
				</div>
			</header>

			<div class="banner-wrapper">
				<div class="main-banner">
					<img src="resources/assets/images/browser/banner.png"
						alt="Main Banner">
				</div>
				<div class="right">
					<a href="logoutUser"><button class="logout">LOGOUT</button></a> <a
						href="goManagerClcart">CLOSET</a> <a href="goManagerUserList">USER</a>
					<a href="goManagerFaq">FAQ </a>
				</div>
			</div>

			<div class="categories">
				<div class="category top">
					<a href="goCloset?cl_cate=t"><img
						src="resources/assets/images/browser/top.png" alt="Top"></a>
				</div>
				<div class="category bottom">
					<a href="goCloset?cl_cate=b"><img
						src="resources/assets/images/browser/bottom.png" alt="Bottom"></a>
				</div>
			</div>

		</div>
	</div>
</body>
</html>