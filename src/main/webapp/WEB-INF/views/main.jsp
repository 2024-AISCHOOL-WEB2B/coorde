<%@page import="com.coorde.myapp.entity.Closet"%>
<%@page import="java.util.List"%>
<%@page import="com.coorde.myapp.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>Coorde</title>
<!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <meta name="author" content="Phoenixcoded" />

   <link
      rel="stylesheet"
      href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css"
    />

    <!-- vendor css -->
    <link rel="stylesheet" href="resources/assets/css/main.css">
</head>
<body>

<% User loginUser = (User) session.getAttribute("loginUser"); 
	List<Closet> clothList = (List<Closet>) request.getAttribute("clothList");
	int index = 0;
%>

<div class="wrap">
        <div class="contents">
           <header>
                <div class="logo">
                    <a href="/myapp"><img src="resources/assets/images/browser/LOGO.jpg" alt="logo"></a>
                </div>
            </header>

            <div class="banner-wrapper">
                <form action="#" method="post">
                <div class="filters">
                    <label for="height">HEIGHT</label>
                    <input type="text" id="height" name="user_hei">
                    <label for="weight">WEIGHT</label>
                    <input type="text" id="weight" name="user_wei">
                    <button>Submit</button>
                </div>
            </form>
                <div class="main-banner">
                    <img src="resources/assets/images/browser/banner.png" alt="Main Banner">
                </div>
                <% if(loginUser != null){ %>
                <div class="right">
                    <a href="logoutUser">LOGOUT</a><br><br>
                    <a href="gomyPage">MY PAGE</a>
                </div>
                <% } else { %>
                <div class="right">
                    <a href="gologin">LOGIN</a><br>
                </div>
                <% } %>
            </div>

            <div class="categories">
                <div class="category top">
                    <a href="goCloset?cl_cate=t"><img src="resources/assets/images/browser/top.png" alt="Top"></a>
                </div>
                <div class="category bottom">
                   <a href="goCloset?cl_cate=b"><img src="resources/assets/images/browser/bottom.png" alt="Bottom"></a>
                </div>
            </div>

            <div class="product-list">
            	<c:forEach items="${clothList}" var="c" begin="0" end="11" varStatus="status">
                <div class="product-item">
                    <img src="${c.cl_imgurl}" alt="${c.cl_name}">
                    <div class="product-info">
                        <span>${c.cl_name}</span>
                        	<%if(clothList.get(index).getCl_price() == 0) { %>
								<span class="discount_price">${c.cl_dc_price}원</span> <br>
								<span class="original_price">할인 없음</span> 
							<% }else { %>
								<span class="discount_price">${c.cl_dc_price}원</span><br> 
								<span class="original_price">${c.cl_price}원</span> 
								<span class="discount_percentage"> <fmt:formatNumber value="${(c.cl_price - c.cl_dc_price) / c.cl_price}" type="percent" /> SALE </span>
							<%} %>
                    </div>
                </div>
                <% index++; %>
                </c:forEach>
            </div>
        </div>
    </div>

</body>
</html>