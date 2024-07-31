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
<title>OOTB</title>
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
    
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400..700&display=swap');
        
        * {
            margin: 0;
            padding: 0;
        }
        a {
            text-decoration: none;
            color: inherit;
            
        }

        .wrap {
            width: 100%;
            overflow: hidden;
        }
        .contents {
            width: 1280px;
            margin: 50px auto;
            overflow: hidden;
        }

        body {
            font-family: Arial, sans-serif;
        }

        header {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            background-color: #fff;
            border-bottom: 1px solid #ddd;
        }

        .logo {
            text-align: center;
        }


        .banner-wrapper {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-top: 20px;
        }


        .main-banner {
            flex-grow: 1;
            text-align: center;
            box-sizing: border-box;
        }

       .main-banner img {
            max-width: 100%;
            height: auto;
            margin-right: -105px;
        }

      .right {
            font-size: 16px;
            margin-left: 20px;
            top: -130px;
            position: relative;
            margin-right: 20PX;
        }

        .categories {
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #fff;
            margin-bottom: 20px;
        }

        .category {
            text-align: center;
            margin: 0 5px;
            padding: 0;
        }

        .category img {
            max-width: 100%;
            height: auto;
        }

        .category span {
            display: block;
            margin-top: 10px;
            font-size: 18px;
            font-weight: bold;
        }

        .product img {
            width: 100%;
            height: auto;
        }

        .product-info {
            padding: 10px 0;
        }

        .product-info span {
            display: block;
            font-size: 14px;
        }

        .price {
            color: red;
            font-weight: bold;
        }

        .product-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .product-item {
            flex: 0 1 calc(20% - 10px); /* 20%로 변경하여 한 줄에 5개 아이템이 나오도록 설정 */
            box-sizing: border-box;
            margin: 5px;
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }

        .product-item img {
            max-width: 100%;
            height: 70%;
        }
        
        .discount_price, .discount_percentage{
        color : red;
        }
        
        .original_price{

    	color: grey;
    	text-decoration: line-through;
		}
		
		input {
            border: none;
            outline: none;
        }
        
    </style>
    
    
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
                    <a href="/myapp"><img src="resources/assets/images/browser/LOGO.png" alt="logo"></a>
                </div>
            </header>

            <div class="banner-wrapper">
                
                <div class="main-banner">
                    <img src="resources/assets/images/browser/banner.png" alt="Main Banner">
                </div>
                <% if(loginUser != null){ %>
                <div class="right">
                    <a href="logoutUser">LOGOUT</a><br><br>
                    <a href="gomyPage">MYPAGE</a>
                </div>
                <% } else { %>
                <div class="right">
                    <a href="gologin">&ensp;LOGIN</a><br>
                </div>
                <% } %>
            </div>

            <div class="categories">
             <% if(loginUser != null){ %>
                <div class="category top">
                    <a href="goCloset?cl_cate=t&user_id=${loginUser.user_id}"><img src="resources/assets/images/browser/top.png" alt="Top"></a>
                </div>
                <div class="category bottom">
                   <a href="goCloset?cl_cate=b&user_id=${loginUser.user_id}"><img src="resources/assets/images/browser/bottom.png" alt="Bottom"></a>
                </div>
                <% } else { %>
                <div class="category top">
                    <a href="goCloset?cl_cate=t"><img src="resources/assets/images/browser/top.png" alt="Top"></a>
                </div>
                <div class="category bottom">
                   <a href="goCloset?cl_cate=b"><img src="resources/assets/images/browser/bottom.png" alt="Bottom"></a>
                </div>
                <% } %>
            </div>

            <div class="product-list">

               <c:forEach items="${clothList}" var="c" begin="0" end="9" varStatus="status">

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