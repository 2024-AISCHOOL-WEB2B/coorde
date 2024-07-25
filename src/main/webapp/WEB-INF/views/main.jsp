<%@page import="com.coorde.myapp.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<% User loginUser = (User) session.getAttribute("loginUser"); %>

<div class="wrap">
        <div class="contents">
           <header>
                <div class="logo">
                    <img src="/images/LOGO.jpg" alt="logo">
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
                    <img src="resources/assets/images/browser/top.png" alt="Top">
                </div>
                <div class="category bottom">
                    <img src="resources/assets/images/browser/bottom.png" alt="Bottom">
                </div>
            </div>

            <div class="product-list">
                <div class="product-item">
                    <img src="images/product1.jpg" alt="Product 1">
                    <div class="product-info">
                        <span>제품 1 설명</span>
                        <span class="price">가격 정보</span>
                    </div>
                </div>
                <div class="product-item">
                    <img src="images/product2.jpg" alt="Product 2">
                    <div class="product-info">
                        <span>제품 2 설명</span>
                        <span class="price">가격 정보</span>
                    </div>
                </div>
                <div class="product-item">
                    <img src="images/product3.jpg" alt="Product 3">
                    <div class="product-info">
                        <span>제품 3 설명</span>
                        <span class="price">가격 정보</span>
                    </div>
                </div>
                <div class="product-item">
                    <img src="images/product4.jpg" alt="Product 4">
                    <div class="product-info">
                        <span>제품 4 설명</span>
                        <span class="price">가격 정보</span>
                    </div>
                </div>
                <div class="product-item">
                    <img src="images/product5.jpg" alt="Product 5">
                    <div class="product-info">
                        <span>제품 5 설명</span>
                        <span class="price">가격 정보</span>
                    </div>
                </div>
                <div class="product-item">
                    <img src="images/product6.jpg" alt="Product 6">
                    <div class="product-info">
                        <span>제품 6 설명</span>
                        <span class="price">가격 정보</span>
                    </div>
                </div>
                <div class="product-item">
                    <img src="images/product7.jpg" alt="Product 7">
                    <div class="product-info">
                        <span>제품 7 설명</span>
                        <span class="price">가격 정보</span>
                    </div>
                </div>
                <div class="product-item">
                    <img src="images/product8.jpg" alt="Product 8">
                    <div class="product-info">
                        <span>제품 8 설명</span>
                        <span class="price">가격 정보</span>
                    </div>
                </div>
                <div class="product-item">
                    <img src="images/product9.jpg" alt="Product 9">
                    <div class="product-info">
                        <span>제품 9 설명</span>
                        <span class="price">가격 정보</span>
                    </div>
                </div>
                <div class="product-item">
                    <img src="images/product10.jpg" alt="Product 10">
                    <div class="product-info">
                        <span>제품 10 설명</span>
                        <span class="price">가격 정보</span>
                    </div>
                </div>
                <div class="product-item">
                    <img src="images/product11.jpg" alt="Product 11">
                    <div class="product-info">
                        <span>제품 11 설명</span>
                        <span class="price">가격 정보</span>
                    </div>
                </div>
                <div class="product-item">
                    <img src="images/product12.jpg" alt="Product 12">
                    <div class="product-info">
                        <span>제품 12 설명</span>
                        <span class="price">가격 정보</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>