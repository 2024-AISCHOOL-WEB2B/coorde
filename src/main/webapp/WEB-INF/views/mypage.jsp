<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.coorde.myapp.entity.User"%>
<%@page import="com.coorde.myapp.entity.Closet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<script>
        var contextPath = "${pageContext.request.contextPath}";
    </script>
<link rel="stylesheet"
	href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>OOTB 위시리스트</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400..700&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400..700&family=Yellowtail&display=swap')
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.wrap {
	width: 100%;
}

a {
	text-decoration: none;
	color: inherit;
}

.container {
	width: 1280px;
	margin: 0 auto;
	text-align: center;
}

.logo img {
	margin-bottom: 20px;
}

button {
	border: none;
	background: none;
	cursor: pointer;
	font-size: 16px;
}

.right {
	font-size: 20px;
	display: flex;
	flex-direction: column;
	align-items: center;
	text-align: center;
	position: absolute;
	right: -150px;
	top: 50px;
	margin-right: 50px;
}

.right a {
	display: block;
	margin-bottom: 10px;
	line-height: 1.5;
}

.nav {
	margin-bottom: 20px;
	border-bottom: 1px solid #ccc;
	height: 50px;
	font-size: 20px;
	position: relative;
	display: flex;
	align-items: center;
	justify-content: space-between; /* 좌우 정렬을 위해 추가 */
}

.nav .wishlist-title {
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
}

.header-buttons {
	display: flex;
	align-items: center;
	position: absolute;
	right: 0;
	top: 25px;
}

.dropdown {
	position: relative;
	display: inline-block;
	top: -26px;
}

#dropdownButton {
	z-index: 5;
}

#colorSortButton {
	z-index: 4;
}

#categoryButton {
	z-index: 3;
	width: 150px;
}

/* 드롭다운 버튼의 사이즈를 조정하려면 */
.dropbtn {
	color: black;
	font-size: 20px; /* 글자 크기를 조정합니다. */
	border: none;
	cursor: pointer;
	width: 120px; /* 너비를 원하는 크기로 조정합니다. */
	height: 60px; /* 높이를 원하는 크기로 조정합니다. */
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 150px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
	left: 50%;
	transform: translateX(-50%);
	text-align: center;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown-content button {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	width: 100%; /* 이 값을 원하는 너비로 변경합니다. */
	height: 50px; /* 이 값을 원하는 높이로 변경합니다. */
	border: none;
	background: none;
	cursor: pointer;
	text-align: center;
}

.dropdown-content button:hover {
	background-color: #f1f1f1;
}

.wishlist {
	padding: 20px 0;
}

.products {
	display: flex;
	flex-wrap: wrap;
	justify-content: flex-start;
	gap: 20px;
	margin-bottom: 20px;
}

.product {
	width: calc(20% - 16px); /* 5개의 상품이 한 줄에 들어가도록 설정 */
	margin-bottom: 20px;
	display: flex;
	flex-direction: column;
	align-items: center;
	transition: background-color 0.3s, opacity 0.3s;
	position: relative;
}

.product-checkbox {
	position: absolute;
	top: 45px;
	left: 12px;
	transform: scale(2.5);
}

.product-name {
	margin-bottom: 10px;
	font-weight: bold;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	width: 100%;
	display: inline-block;
	text-align: center;
}

.product img {
	width: 100%;
	height: auto;
	object-fit: cover;
	cursor: pointer;
}

.product-name.readonly {
	user-select: none;
	pointer-events: none;
}

.product-info {
	margin-top: 5px;
	text-align: center;
}

.price-container {
	display: flex;
	justify-content: center;
	align-items: center;
}

.product-info .original-price {
	margin: 5px 10px 5px 0;
	color: gray;
	text-decoration: line-through;
}

.product-info .discount-rate {
	margin: 2px 0;
	color: red;
}

.product-info .discounted-price {
	margin: 2px 0;
	color: red;
}

.icon {
	font-size: 20px;
	cursor: pointer;
	border: none;
	padding: 0;
}

.faq {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-top: 80px;
}

.faq a {
	text-decoration: none;
	color: inherit;
}

.faq button {
	padding: 10px;
	border: none;
	cursor: pointer;
	transition: background-color 0.3s;
	background: white;
}

.usage-info {
	border: 1px solid #000;
	padding: 10px;
	text-align: left;
	margin: 5px 0;
}

.usage-info h2 {
	margin-bottom: 10px;
}

.usage-info p {
	margin-bottom: 5px;
	margin-left: 5px;
}

.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.5);
}

.modal-content {
	background-color: #fff;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	max-width: 600px;
	text-align: center;
}

.modal img {
	width: 100px;
	height: 100px;
}

.modal .product-info {
	margin-bottom: 20px;
}

.modal table {
	width: 100%;
	margin-bottom: 20px;
}

.modal table th, .modal table td {
	padding: 10px;
	text-align: center;
}

.modal table th {
	background-color: #f2f2f2;
}

#modal-img {
	margin-left: 17px;
}

#modal-product-name {
	margin-left: 17px;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.submit-button {
	background-color: rgb(215, 215, 215);
	color: black;
	padding: 10px 20px;
	border: none;
	cursor: pointer;
	font-size: 16px;
	border-radius: 10px;
}

.submit-button:hover {
	background-color: grey;
}

.modal-content .product-info p#modal-product-price {
	color: red;
}

.rating {
	display: flex;
	justify-content: center;
	margin-bottom: 10px;
}

.star {
	font-size: 24px;
	cursor: pointer;
	color: #ddd;
	transition: color 0.3s;
}

.star:hover, .star.selected, .star.hover {
	color: gold;
}

.nav-links {
	display: flex;
	gap: 20px;
}

input {
	border: none;
	outline: none;
}
</style>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<c:if test="${not empty message}">
		<script>
        alert('${message}');
    </script>
	</c:if>
	<% User loginUser = (User) session.getAttribute("loginUser"); %>
	<div class="wrap">
		<div class="container">
			<div class="logo">
				<a href="/myapp"><img
					src="resources/assets/images/browser/LOGO.png" alt=""></a>
			</div>
			<div class="nav">
				<div class="nav-links">
					<a href="goCloset?cl_cate=t&user_id=${loginUser.user_id}">TOP</a> /
					<a href="goCloset?cl_cate=b&user_id=${loginUser.user_id}">BOTTOM</a>
				</div>
				<div class="wishlist-title">WISH LIST</div>
				<div class="header-buttons">
					<div class="dropdown">
						<button class="dropbtn" id="dropdownButton">정렬</button>
						<div class="dropdown-content">
							<button onclick="resetSort()">정렬</button>
							<button onclick="sortProducts('가격 낮은순', '가격순_오름차순')">가격
								낮은순</button>
							<button onclick="sortProducts('가격 높은순', '가격순_내림차순')">가격
								높은순</button>
							<button onclick="sortProducts('별점순', '별점순')">별점순</button>
						</div>
					</div>
					<div class="dropdown">
						<button class="dropbtn" id="colorSortButton">색상</button>
						<div class="dropdown-content">
							<button onclick="resetFilter('color')">색상</button>
							<button onclick="filterProductsByColor('검정', 'black')">검정</button>
							<button onclick="filterProductsByColor('흰색', 'white')">흰색</button>
							<button onclick="filterProductsByColor('네이비', 'navy')">네이비</button>
							<button onclick="filterProductsByColor('라이트그레이', 'lightgray')">라이트그레이</button>
							<button onclick="filterProductsByColor('다크그레이', 'darkgray')">다크그레이</button>
							<button onclick="filterProductsByColor('회색', 'gray')">회색</button>
							<button onclick="filterProductsByColor('파란색', 'blue')">파란색</button>
							<button onclick="filterProductsByColor('아이보리', 'ivory')">아이보리</button>
							<button onclick="filterProductsByColor('스카이블루', 'skyblue')">스카이블루</button>
							<button onclick="filterProductsByColor('베이지', 'beige')">베이지</button>
							<button onclick="filterProductsByColor('녹색', 'green')">녹색</button>
							<button onclick="filterProductsByColor('데님', 'denim')">데님</button>
							<button onclick="filterProductsByColor('연청', 'lightblue')">연청</button>
							<button onclick="filterProductsByColor('중청', 'midblue')">중청</button>
							<button onclick="filterProductsByColor('진청', 'deepblue')">진청</button>
							<button onclick="filterProductsByColor('흑청', 'darkblue')">흑청</button>
						</div>
					</div>
					<div class="dropdown">
						<button class="dropbtn" id="categoryButton">카테고리</button>
						<div class="dropdown-content">
							<button onclick="resetFilter('category')">카테고리</button>
							<button onclick="filterProductsByCategory('스포츠하의', 'bs')">스포츠하의</button>
							<button onclick="filterProductsByCategory('반바지', 'bh')">반바지</button>
							<button onclick="filterProductsByCategory('트레이닝 바지', 'bt')">트레이닝
								바지</button>
							<button onclick="filterProductsByCategory('슬렉스 바지', 'bl')">슬렉스
								바지</button>
							<button onclick="filterProductsByCategory('데님 바지', 'bd')">데님
								바지</button>
							<button onclick="filterProductsByCategory('코튼 바지', 'bc')">코튼
								바지</button>
							<button onclick="filterProductsByCategory('반소매 티셔츠', 'th')">반소매
								티셔츠</button>
							<button onclick="filterProductsByCategory('셔츠', 'tt')">셔츠</button>
							<button onclick="filterProductsByCategory('스포츠 상의', 'ts')">스포츠
								상의</button>
							<button onclick="filterProductsByCategory('민소매', 'tn')">민소매</button>
							<button onclick="filterProductsByCategory('카라티셔츠', 'tc')">카라티셔츠</button>
							<button onclick="filterProductsByCategory('긴소매', 'tl')">긴소매</button>
							<button onclick="filterProductsByCategory('후드', 'td')">후드</button>
							<button onclick="filterProductsByCategory('맨투맨', 'tm')">맨투맨</button>
						</div>
					</div>
					<div class="right">
						<a href="logoutUser">LOGOUT</a> <a href="goEdit">EDIT</a>
					</div>
				</div>
			</div>
			<form action="">
				<div class="products">
					<%
                    List<Closet> wishListItems = (List<Closet>)request.getAttribute("wishListItems");
                    if(wishListItems != null && !wishListItems.isEmpty()) {
                    %>
					<c:forEach items="${wishListItems}" var="item">
						<div class="product" data-color="${item.cl_color}"
							data-category="${item.cl_cate}" data-product-id="${item.cl_idx}"
							data-category-detail="${item.cl_cate_detail}">
							<input type="checkbox" class="product-checkbox">
							<p class="product-name readonly">${item.cl_name}</p>
							<a href="${item.cl_url}"><img src="${item.cl_imgurl}"
								alt="${item.cl_name}"></a>
							<div class="product-info">
								<div class="price-container">
									<p class="original-price">${item.cl_price}원</p>
								</div>
								<p class="discounted-price">
									할인가: ${item.cl_dc_price}원
									<button class="modal-button">
										<span class="lnr lnr-thumbs-up"></span>
									</button>
								</p>
							</div>
						</div>
					</c:forEach>
					<%
                    } else {
                    %>
					<p>위시리스트가 비어있습니다.</p>
					<%
                    }
                    %>
				</div>
				<div class="faq">
					<a href="goFaq">FAQ</a>
					<button id="delete-button" type="button">DELETE</button>
				</div>
			</form>

			<div class="usage-info">
				<h2>이용안내</h2>
				<p>- 체크 버튼을 클릭 후 DELETE 버튼을 누르면 목록에서 삭제됩니다.</p>
				<p>- 회원가입시와 동일한 이용방법으로 제공되는 정보를 관리하실 수 있습니다.</p>
				<p>- 정확한 회원 정보를 통해 정확한 안내와 주문처리를 위해 등록된 정보를 확인해 주십시오.</p>
			</div>
		</div>
	</div>
	<div id="myModal" class="modal">
		<div class="modal-content" onclick="event.stopPropagation();">
			<span class="close" onclick="closeModal()">&times;</span>
			<div class="product-info">
				<p id="modal-product-name" class="readonly"></p>
				<img id="modal-img" src="" alt="Product Image">
				<div class="rating">
					<span class="star" data-value="1">&#9733;</span> <span class="star"
						data-value="2">&#9733;</span> <span class="star" data-value="3">&#9733;</span>
					<span class="star" data-value="4">&#9733;</span> <span class="star"
						data-value="5">&#9733;</span>
				</div>
				<p id="modal-product-price"></p>
			</div>
			<table>
				<thead>
					<tr>
						<th></th>
						<th>작아요</th>
						<th>적당해요</th>
						<th>커요</th>
					</tr>
				</thead>
				<tbody>
					<!-- 여기에 동적으로 내용이 생성됩니다 -->
				</tbody>
			</table>
			<button class="submit-button" onclick="submitModal()">저장</button>
		</div>
		<div id="filterResult" style="margin-top: 10px;"></div>
	</div>
	<script>
        let originalProductsOrder = [];
        document.addEventListener('DOMContentLoaded', function() {
            document.querySelectorAll('.modal-button').forEach(button => {
                button.addEventListener('click', function(event) {
                    event.preventDefault();
                    event.stopPropagation();
                    showModal(this.closest('.product'));
                });
            });
        });
        let selectedColor = 'all';
        let selectedCategory = 'all';
        function changeDropdownText(elementId, text) {
            document.getElementById(elementId).innerText = text;
        }
        function hideDropdown(dropdown) {
            dropdown.style.display = 'none';
        }
        function showDropdown(dropdown) {
            dropdown.style.display = 'block';
        }
        function sortProducts(displayText, criteria) {
            changeDropdownText('dropdownButton', displayText);
            const productContainer = document.querySelector('.products');
            const products = Array.from(productContainer.getElementsByClassName('product'));
            
            if (criteria === '가격순_오름차순') {
                products.sort((a, b) => {
                    const priceA = parseInt(a.querySelector('.discounted-price').textContent.replace(/[^0-9]/g, ''));
                    const priceB = parseInt(b.querySelector('.discounted-price').textContent.replace(/[^0-9]/g, ''));
                    return priceA - priceB;
                });
            } else if (criteria === '가격순_내림차순') {
                products.sort((a, b) => {
                    const priceA = parseInt(a.querySelector('.discounted-price').textContent.replace(/[^0-9]/g, ''));
                    const priceB = parseInt(b.querySelector('.discounted-price').textContent.replace(/[^0-9]/g, ''));
                    return priceB - priceA;
                });
            } else if (criteria === '별점순') {
                products.sort((a, b) => {
                    const ratingA = parseInt(a.getAttribute('data-rating')) || 0;
                    const ratingB = parseInt(b.getAttribute('data-rating')) || 0;
                    return ratingB - ratingA;
                });
            }
            
            products.forEach(product => productContainer.appendChild(product));
            hideDropdown(document.querySelector('#dropdownButton').nextElementSibling);
        }
        function resetSort() {
            changeDropdownText('dropdownButton', '정렬');
            const productContainer = document.querySelector('.products');
            originalProductsOrder.forEach(product => productContainer.appendChild(product));
            hideDropdown(document.querySelector('#dropdownButton').nextElementSibling);
        }
        function filterProducts() {
            const productContainer = document.querySelector('.products');
            const products = Array.from(productContainer.getElementsByClassName('product'));
            products.forEach(product => {
                const productColor = product.getAttribute('data-color');
                const productCategory = product.getAttribute('data-category-detail');
                const matchesColor = (selectedColor === 'all' || productColor === selectedColor);
                const matchesCategory = (selectedCategory === 'all' || productCategory === selectedCategory);
                if (matchesColor && matchesCategory) {
                    product.style.display = 'flex';
                } else {
                    product.style.display = 'none';
                }
            });
            
            // 필터링 결과 표시
            const visibleProducts = products.filter(p => p.style.display !== 'none');
            document.getElementById('filterResult').textContent = `${visibleProducts.length}개의 상품이 표시됨`;
        }

        function resetAllFilters() {
            selectedColor = 'all';
            selectedCategory = 'all';
            changeDropdownText('colorSortButton', '색상');
            changeDropdownText('categoryButton', '카테고리');
            filterProducts();
        }
        function filterProductsByColor(displayText, color) {
            changeDropdownText('colorSortButton', displayText);
            selectedColor = color;
            filterProducts();
            hideDropdown(document.querySelector('#colorSortButton').nextElementSibling);
        }
        function filterProductsByCategory(displayText, category) {
            changeDropdownText('categoryButton', displayText);
            selectedCategory = category;
            filterProducts();
            hideDropdown(document.querySelector('#categoryButton').nextElementSibling);
        }
        function resetFilter(type) {
            if (type === 'color') {
                changeDropdownText('colorSortButton', '색상');
                selectedColor = 'all';
                hideDropdown(document.querySelector('#colorSortButton').nextElementSibling);
            } else if (type === 'category') {
                changeDropdownText('categoryButton', '카테고리');
                selectedCategory = 'all';
                hideDropdown(document.querySelector('#categoryButton').nextElementSibling);
            }
            filterProducts();
        }
        document.querySelectorAll('.dropbtn').forEach(button => {
            button.addEventListener('click', function(event) {
                event.stopPropagation(); // Prevent event bubbling
                const dropdown = this.nextElementSibling;
                if (dropdown.style.display === 'block') {
                    hideDropdown(dropdown);
                } else {
                    showDropdown(dropdown);
                }
            });
        });
        document.addEventListener('click', function(event) {
            if (!event.target.matches('.dropbtn')) {
                document.querySelectorAll('.dropdown-content').forEach(dropdown => {
                    hideDropdown(dropdown);
                });
            }
        });
        let savedRatings = {}; // 제품별로 저장된 별점 값을 저장할 객체
        function formatPrice(price) {
            return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원';
        }
        function showModal(productElement) {
            event.preventDefault();
            event.stopPropagation();
            console.log('showModal called');
            const modal = document.getElementById('myModal');
            const productName = productElement.querySelector('.product-name').textContent;
            const productPrice = productElement.querySelector('.discounted-price').textContent;
            const productImgSrc = productElement.querySelector('img').src;
            const productCategory = productElement.getAttribute('data-category');

            document.getElementById('modal-product-name').textContent = productName;
            document.getElementById('modal-product-price').textContent = productPrice;
            document.getElementById('modal-img').src = productImgSrc;

            // 모달 내용 동적 생성
            const tbody = modal.querySelector('tbody');
            tbody.innerHTML = generateModalContent(productCategory);

            modal.style.display = 'block';

            setTimeout(() => {
                modal.addEventListener('click', function(e) {
                    if (e.target === modal) {
                        closeModal();
                    }
                });
            }, 100);
        }
        
        function generateModalContent(category) {
            if (category === 't') {
                return `
                    <tr>
                        <td>총장</td>
                        <td><input type="radio" id="top-small" name="cl_top" value="small"><label for="top-small"></label></td>
                        <td><input type="radio" id="top-medium" name="cl_top" value="medium"><label for="top-medium"></label></td>
                        <td><input type="radio" id="top-large" name="cl_top" value="large"><label for="top-large"></label></td>
                    </tr>
                    <tr>
                        <td>어깨</td>
                        <td><input type="radio" id="shoulder-small" name="cl_sh" value="small"><label for="shoulder-small"></label></td>
                        <td><input type="radio" id="shoulder-medium" name="cl_sh" value="medium"><label for="shoulder-medium"></label></td>
                        <td><input type="radio" id="shoulder-large" name="cl_sh" value="large"><label for="shoulder-large"></label></td>
                    </tr>
                    <tr>
                        <td>가슴</td>
                        <td><input type="radio" id="chest-small" name="cl_ch" value="small"><label for="chest-small"></label></td>
                        <td><input type="radio" id="chest-medium" name="cl_ch" value="medium"><label for="chest-medium"></label></td>
                        <td><input type="radio" id="chest-large" name="cl_ch" value="large"><label for="chest-large"></label></td>
                    </tr>
                    <tr>
                        <td>팔</td>
                        <td><input type="radio" id="arm-small" name="cl_arm" value="small"><label for="arm-small"></label></td>
                        <td><input type="radio" id="arm-medium" name="cl_arm" value="medium"><label for="arm-medium"></label></td>
                        <td><input type="radio" id="arm-large" name="cl_arm" value="large"><label for="arm-large"></label></td>
                    </tr>
                `;
            } else if (category === 'b') {
                return `
                    <tr>
                        <td>총장</td>
                        <td><input type="radio" id="bot-small" name="cl_bot" value="small"><label for="bot-small"></label></td>
                        <td><input type="radio" id="bot-medium" name="cl_bot" value="medium"><label for="bot-medium"></label></td>
                        <td><input type="radio" id="bot-large" name="cl_bot" value="large"><label for="bot-large"></label></td>
                    </tr>
                    <tr>
                        <td>허리</td>
                        <td><input type="radio" id="waist-small" name="cl_waist" value="small"><label for="waist-small"></label></td>
                        <td><input type="radio" id="waist-medium" name="cl_waist" value="medium"><label for="waist-medium"></label></td>
                        <td><input type="radio" id="waist-large" name="cl_waist" value="large"><label for="waist-large"></label></td>
                    </tr>
                    <tr>
                        <td>허벅지</td>
                        <td><input type="radio" id="thighs-small" name="cl_thighs" value="small"><label for="thighs-small"></label></td>
                        <td><input type="radio" id="thighs-medium" name="cl_thighs" value="medium"><label for="thighs-medium"></label></td>
                        <td><input type="radio" id="thighs-large" name="cl_thighs" value="large"><label for="thighs-large"></label></td>
                    </tr>
                    <tr>
                        <td>밑단</td>
                        <td><input type="radio" id="hem-small" name="cl_hem" value="small"><label for="hem-small"></label></td>
                        <td><input type="radio" id="hem-medium" name="cl_hem" value="medium"><label for="hem-medium"></label></td>
                        <td><input type="radio" id="hem-large" name="cl_hem" value="large"><label for="hem-large"></label></td>
                    </tr>
                `;
            } else {
                return '<tr><td colspan="4">카테고리 정보가 없습니다.</td></tr>';
            }
        }

        function closeModal() {
            event.stopPropagation(); // 이벤트 전파 중지
            document.getElementById('myModal').style.display = 'none';
        }

        document.querySelectorAll('.star').forEach(star => {
            star.addEventListener('click', function() {
                const value = this.getAttribute('data-value');
                const productName = document.getElementById('modal-product-name').innerText;
                savedRatings[productName] = value; // 별점 저장
                document.querySelectorAll('.star').forEach(s => {
                    s.classList.remove('selected', 'hover');
                    if (s.getAttribute('data-value') <= value) {
                        s.classList.add('selected');
                    }
                });
            });
            // ... (mouseover와 mouseout 이벤트 리스너)
        });
        function closeModal() {
            document.getElementById('myModal').style.display = 'none';
        }
        function submitModal() {
            const productName = document.getElementById('modal-product-name').innerText;
            const rating = savedRatings[productName] || 0;
            const productId = document.querySelector('.product[data-product-id]').getAttribute('data-product-id');
            
            // 사이즈 정보 수집
            const sizeInfo = {};
            const radioButtons = document.querySelectorAll('.modal-content input[type="radio"]:checked');
            radioButtons.forEach(radio => {
                sizeInfo[radio.name] = radio.value;
            });

            // AJAX 요청
            $.ajax({
                url: './updateUserMeasurements',
                method: 'POST',
                data: JSON.stringify({
                    cl_idx: productId,
                    review_star: rating,
                    sizeInfo: sizeInfo
                }),
                contentType: 'application/json',
                dataType: 'json',
                success: function(response) {
                    if (response.success) {
                        alert('저장되었습니다.');
                        // 필요한 경우 UI 업데이트
                        const productElement = document.querySelector(`.product[data-product-id="${productId}"]`);
                        if (productElement) {
                            productElement.setAttribute('data-rating', rating);
                        }
                    } else {
                        alert('저장에 실패했습니다.');
                    }
                    closeModal();
                },
                error: function() {
                    alert('서버 오류가 발생했습니다.');
                    closeModal();
                }
            });
        }
        document.getElementById('delete-button').addEventListener('click', function() {
            const checkedProducts = document.querySelectorAll('.product-checkbox:checked');
            
            if (checkedProducts.length === 0) {
                alert('삭제할 상품을 선택해주세요.');
                return;
            }

            if (confirm('선택한 상품을 위시리스트에서 삭제하시겠습니까?')) {
                const productIds = Array.from(checkedProducts).map(checkbox => 
                    checkbox.closest('.product').getAttribute('data-product-id')
                );

                const form = document.createElement('form');
                form.method = 'POST';
                form.action = 'deleteWishlistItems';

                const input = document.createElement('input');
                input.type = 'hidden';
                input.name = 'productIds';
                input.value = productIds.join(',');

                form.appendChild(input);
                document.body.appendChild(form);
                form.submit();
            }
        });
        function updateModalProductName(element) {
            const productName = element.innerText;
            document.getElementById('modal-product-name').innerText = productName;
        }
        document.querySelectorAll('.star').forEach(star => {
            star.addEventListener('click', function() {
                const value = this.getAttribute('data-value');
                const productName = document.getElementById('modal-product-name').innerText;
                savedRatings[productName] = value; // 별점 저장

                document.querySelectorAll('.star').forEach(s => {
                    s.classList.remove('selected', 'hover');
                    if (s.getAttribute('data-value') <= value) {
                        s.classList.add('selected');
                    }
                });

                alert('별점 ' + value + '점을 선택하셨습니다.');
                console.log('Selected star value:', value); // 추가된 부분
            });

            star.addEventListener('mouseover', function() {
                const value = this.getAttribute('data-value');
                document.querySelectorAll('.star').forEach(s => {
                    s.classList.remove('hover');
                    if (s.getAttribute('data-value') <= value) {
                        s.classList.add('hover');
                    }
                });
            });

            star.addEventListener('mouseout', function() {
                document.querySelectorAll('.star').forEach(s => {
                    s.classList.remove('hover');
                });
            });
        });

        
        document.getElementById('myModal').addEventListener('click', function(event) {
            if (event.target === this) {
                closeModal();
            }
        });

    
    </script>
</body>
</html>
