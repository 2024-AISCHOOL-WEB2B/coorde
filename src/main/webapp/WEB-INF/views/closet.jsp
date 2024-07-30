<%@page import="com.coorde.myapp.entity.Closet"%>
<%@page import="java.util.List"%>
<%@page import="com.coorde.myapp.entity.User"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<title>OOTB CLOSET</title>

<!-- Meta -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="author" content="Phoenixcoded" />
<link rel="stylesheet"
	href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css" />
<!-- vendor css -->

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
	margin-left: 20px;
	margin-bottom: 40px;
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
	position: relative;
	top: 30px;
	right: 20px;
}

.right a {
	display: block;
	margin-bottom: 10px;
	line-height: 1.5;
}

.TorB {
	border-bottom: 1px solid #ccc;
	height: 50px;
	font-size: 20px;
	position: relative;
	margin-top: -20px; /* 기존 margin-top 값에서 20px 위로 이동 */
}

.header-buttons {
	display: flex;
	align-items: center;
	position: absolute;
	right: 0;
	z-index: 9999;
	top: 15px;
}

.dropdown {
	position: relative;
	display: inline-block;
	top: -26px;
}

/* 드롭다운 버튼의 사이즈를 조정하려면 */
.dropbtn {
	color: black;
	font-size: 20px; /* 글자 크기를 조정합니다. */
	border: none;
	cursor: pointer;
	width: 140px; /* 너비를 원하는 크기로 조정합니다. */
	height: 60px; /* 높이를 원하는 크기로 조정합니다. */
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 140px;
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

.filter {
	width: 150px;
	margin-right: 20px;
	flex-direction: column;
	display: flex;
}

.filter label {
	display: block;
	margin-bottom: 10px;
}

.filter input[type="radio"] {
	margin-right: 10px;
}

.filter label:nth-child(2) input[type="radio"] {
	margin-left: 7.5px;
}

.fit {
	margin-bottom: 30px;
	margin-left: 15px;
}

.filter input[type="text"] {
	display: block;
	width: 100%;
	border: none;
	border-bottom: 1px solid #000;
	margin-top: 5px;
	margin-bottom: 15px;
	text-align: center;
}

.main-content {
	display: flex;
	margin-top: 40px;
}

.submit-btn {
	align-self: center;
	width: 70px;
	height: 30px;
	border-radius: 15px;
	background-color: white;
	border-style: none;
	cursor: pointer;
	font-size: 20px;
	margin-right: 10px;
}

.products {
	display: flex;
	flex-wrap: wrap;
	gap: 10px;
	width: 70%;
	margin-left: 30px;
}

.product {
	width: calc(33.33% - 10px);
	text-align: center;
	position: relative;
	z-index: 1;
	margin-top: 30px;
}

.product-header {
	display: flex;
	align-items: center;
	justify-content: center; /* 수정된 부분: 가운데 정렬 */
	margin-bottom: 10px;
	height: 30px;
	overflow: hidden;
}

.size-display {
	color: red;
	padding: 5px;
	font-size: 14px;
	font-weight: bold;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	max-width: 150px; /* 최대 너비를 설정하여 ... 처리 */
	text-align: center; /* 수정된 부분: 가운데 정렬 */
}

.rating-number {
	font-size: 14px;
	color: #555;
	text-align: center; /* 수정된 부분: 가운데 정렬 */
}

.cart-icon {
	font-size: 24px;
	cursor: pointer;
	text-align: center; /* 수정된 부분: 가운데 정렬 */
}

.product img {
	width: 100%;
	height: 300px; /* 고정된 높이 값을 설정합니다 */
	object-fit: cover; /* 이미지가 고정된 크기에 맞게 잘리거나 늘어나지 않게 합니다 */
}

.price {
	font-size: 16px;
}

.discount_price {
	color: red;
	font-weight: bold;
}

.original_price {
	color: gray;
	text-decoration: line-through;
}

.discount_percentage {
	color: red;
	font-size: 14px;
	margin-left: 10px;
}

.pagination {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 20px;
	margin-left: 40px;
}

.pagination a {
	margin: 0 5px;
	text-decoration: none;
	color: #000;
}

.pagination a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>


	<%
    User loginUser = (User) session.getAttribute("loginUser");
    List<Closet> filteredclothList = (List<Closet>) request.getAttribute("filteredclothList");
    List<Closet> clothList = (List<Closet>) request.getAttribute("clothList");

    %>


	<div class="wrap">
		<div class="container">
			<div class="logo">
				<a href="/myapp"><img
					src="resources/assets/images/browser/LOGO.jpg" alt=""></a>
			</div>
			<div class="TorB">
				<a href="goCloset?cl_cate=t">TOP</a> / <a href="goCloset?cl_cate=b">BOTTOM</a>
				<div class="header-buttons">
					<div class="dropdown">
						<button class="dropbtn" id="dropdownButton">정렬</button>
						<div class="dropdown-content">
							<button onclick="resetSort()">정렬</button>
							<button onclick="sortProducts('가격순', '가격순')">가격순</button>
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
							<%if(clothList.get(0).getCl_cate().equals("b")) { %>
							<button onclick="filterProductsByColor('데님', 'denim')">데님</button>
							<button onclick="filterProductsByColor('연청', 'lightblue')">연청</button>
							<button onclick="filterProductsByColor('중청', 'midblue')">중청</button>
							<button onclick="filterProductsByColor('진청', 'deepblue')">진청</button>
							<button onclick="filterProductsByColor('흑청', 'darkblue')">흑청</button>
							<%} %>
						</div>
					</div>
					<div class="dropdown">
						<button class="dropbtn" id="categoryButton">카테고리</button>
						<div class="dropdown-content">
							<button onclick="resetFilter('category')">카테고리</button>
							<%if(clothList.get(0).getCl_cate().equals("t")) { %>
							<button
								onclick="filterProductsByCategory('반소매 티셔츠', 'half_t_shirt')">반소매
								티셔츠</button>
							<button onclick="filterProductsByCategory('셔츠', 'shirt')">셔츠</button>
							<button
								onclick="filterProductsByCategory('스포츠 상의', 'sports_top')">스포츠
								상의</button>
							<button onclick="filterProductsByCategory('민소매', 'no_arm')">민소매</button>
							<button
								onclick="filterProductsByCategory('카라티셔츠', 'collar_t_shirt')">카라티셔츠</button>
							<button onclick="filterProductsByCategory('긴소매', 'long_arm')">긴소매</button>
							<button onclick="filterProductsByCategory('후드', 'hood_t_shirt')">후드</button>
							<button onclick="filterProductsByCategory('맨투맨', 'man_2_man')">맨투맨</button>
							<%} else{ %>
							<button
								onclick="filterProductsByCategory('스포츠하의', 'sport_pants')">스포츠하의</button>
							<button onclick="filterProductsByCategory('반바지', 'half_pants')">반바지</button>
							<button
								onclick="filterProductsByCategory('트레이닝 바지', 'training_pants')">트레이닝
								바지</button>
							<button
								onclick="filterProductsByCategory('슬렉스 바지', 'slacks_pants')">슬렉스
								바지</button>
							<button
								onclick="filterProductsByCategory('데님 바지', 'denim_pants')">데님
								바지</button>
							<button
								onclick="filterProductsByCategory('코튼 바지', 'cotton_pants')">코튼
								바지</button>
							<%} %>
						</div>
					</div>
					<div class="right">
						<%
                        if (loginUser != null) {
                        %>
						<div class="right">
							<a href="logoutUser">LOGOUT</a> <a href="gomyPage">MY PAGE</a>
						</div>
						<%
                        } else {
                        %>
						<div class="right">
							<a href="gologin">LOGIN</a><br>
						</div>
						<%
                        }
                        %>
					</div>
				</div>
			</div>

			<div class="main-content">
				<div class="filter">
					<div class="fit">
						<label> REGULAR <input type="radio" name="user_fit"
							value="regular" checked>
						</label> <label> OVERFIT <input type="radio" name="user_fit"
							value="overfit">
						</label>
					</div>
					<label> HEIGHT <input type="text" name="user_hei">
					</label> <label> WEIGHT <input type="text" name="user_wei">

						<% 
                    
                    int top = 0;
                    int ch = 0;
                    int sh = 0;
                    int arm = 0;
                    int bot = 0;
                    int waist = 0;
                    int thighs = 0;
                    int hem = 0;
                    
                    if(loginUser != null){
                        top = loginUser.getUser_top();
                        ch = loginUser.getUser_ch();
                        sh = loginUser.getUser_sh();
                        arm = loginUser.getUser_arm();
                        bot = loginUser.getUser_bot();
                        waist = loginUser.getUser_waist();
                        thighs = loginUser.getUser_thighs();
                        hem = loginUser.getUser_hem();
                    }%> <% if(clothList.get(0).getCl_cate().equals("t")) { %>
						<label> 상의 총장 <input type="text" name="user_top"
							placeholder="<%= top %>"></label> <label> 가슴 단면 <input
							type="text" name="user_ch" placeholder="<%= ch %>"></label> <label>
							어깨 너비 <input type="text" name="user_sh" placeholder="<%= sh %>">
					</label> <label> 팔 길이 <input type="text" name="user_arm"
							placeholder="<%= arm %>"></label> <% } else { %> <label> 하의
							총장 <input type="text" name="user_bot" placeholder="<%= bot %>">
					</label> <label> 허리 단면 <input type="text" name="user_waist"
							placeholder="<%= waist %>"></label> <label> 허벅지 단면 <input
							type="text" name="user_thighs" placeholder="<%= thighs %>"></label>
						<label> 밑단 단면 <input type="text" name="user_hem"
							placeholder="<%= hem %>"></label> <% } %>

					</label>
					<button class="submit-btn" onclick="filterBySize()">SEARCH</button>
				</div>
				<div class="products" id="productContainer">


					<%  int index = 0;%>
					<c:forEach items="${clothList}" var="c" begin="0" end="29"
						varStatus="status">
						<div class="product" data-category="${c.cl_cate_detail}"
							data-color="${c.cl_color}" data-index="${index}">

							<div class="product-header">
								<div class="cart-icon">
									<span class="lnr lnr-cart"></span>
								</div>
								<div class="size-display">띠바 별점 기능 씨바 띠바</div>
								<div class="rating-number">
									평점: <span id="rating-value-${c.cl_idx}">0</span>
								</div>
							</div>

							<a href="${c.cl_url}"> <img src="${c.cl_imgurl}"
								alt="${c.cl_name}" height="300">
							</a>
							<p class="name">${c.cl_name}</p>
							<p class="price">
								<%if(clothList.get(index).getCl_price() == 0) { %>
								<span class="discount_price">${c.cl_dc_price}원</span> <br>
								<span class="original_price">할인 없음</span>
								<% }else { %>
								<span class="discount_price">${c.cl_dc_price}원</span><br> <span
									class="original_price">${c.cl_price}원</span> <span
									class="discount_percentage"> <fmt:formatNumber
										value="${(c.cl_price - c.cl_dc_price) / c.cl_price}"
										type="percent" /> SALE
								</span>
								<%} %>

							</p>

						</div>
						<% index++; %>
					</c:forEach>

					<c:choose>
						<c:when
							test="${filteredclothList != null and filteredclothList.size() > 0}">
							<c:forEach items="${filteredclothList}" var="c" begin="0"
								end="29" varStatus="status">
								<div class="product" data-category="${c.cl_cate_detail}"
									data-color="${c.cl_color}">

									<div class="product-header">
										<div class="cart-icon">
											<span class="lnr lnr-cart"></span>
										</div>
										<div class="size-display">띠바 별점 기능 씨바 띠바</div>
										<div class="rating-number">
											평점: <span id="rating-value-${c.cl_idx}">0</span>
										</div>
									</div>

									<a href="${c.cl_url}"> <img src="${c.cl_imgurl}"
										alt="${c.cl_name}"></a>
									<p class="name">${c.cl_name}</p>
									<p class="price">
										<c:choose>
											<c:when test="${c.cl_price == 0}">
												<span class="discount_price">${c.cl_dc_price}원</span>
												<br>
												<span class="original_price">할인 없음</span>
											</c:when>
											<c:otherwise>
												<span class="discount_price">${c.cl_dc_price}원</span>
												<br>
												<span class="original_price">${c.cl_price}원</span>
												<span class="discount_percentage"> <fmt:formatNumber
														value="${(c.cl_price - c.cl_dc_price) / c.cl_price}"
														type="percent" /> SALE
												</span>
											</c:otherwise>
										</c:choose>
									</p>

								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:forEach items="${clothList}" var="c" begin="0" end="29"
								varStatus="status">
								<div class="product" data-category="${c.cl_cate_detail}"
									data-color="${c.cl_color}">
									<div class="product-header">
										<div class="cart-icon">
											<span class="lnr lnr-cart"></span>
										</div>
										<div class="size-display">띠바 별점 기능 씨바 띠바</div>
										<div class="rating-number">
											평점: <span id="rating-value-${c.cl_idx}">0</span>
										</div>
									</div>
									<a href="${c.cl_url}"> <img src="${c.cl_imgurl}"
										alt="${c.cl_name}"></a>
									<p class="name">${c.cl_name}</p>
									<p class="price">
										<c:choose>
											<c:when test="${c.cl_price == 0}">
												<span class="discount_price">${c.cl_dc_price}원</span>
												<br>
												<span class="original_price">할인 없음</span>
											</c:when>
											<c:otherwise>
												<span class="discount_price">${c.cl_dc_price}원</span>
												<br>
												<span class="original_price">${c.cl_price}원</span>
												<span class="discount_percentage"> <fmt:formatNumber
														value="${(c.cl_price - c.cl_dc_price) / c.cl_price}"
														type="percent" /> SALE
												</span>
											</c:otherwise>
										</c:choose>
									</p>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>



				</div>
			</div>
			<footer class="pagination">
				<a href="#">&#171;</a> <a href="#">1</a> <a href="#">2</a> <a
					href="#">&#187;</a>
			</footer>
		</div>
	</div>
   <script src="resources/assets/js/vendor-all.min.js"></script>
	<script>
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
            const productContainer = document.getElementById('productContainer');
            const products = Array.from(productContainer.getElementsByClassName('product'));

            if (criteria === '가격순') {
                products.sort((a, b) => {
                    const priceA = parseInt(a.querySelector('.discount_price').textContent.replace('원', '').replace(',', ''));
                    const priceB = parseInt(b.querySelector('.discount_price').textContent.replace('원', '').replace(',', ''));
                    return priceA - priceB;
                });
            }
            // 다른 정렬 기준 추가 가능
            else if (criteria === '인기순') {
                // 인기순 정렬 로직 추가
            } else if (criteria === '별점순') {
                // 별점순 정렬 로직 추가
            }

            products.forEach(product => productContainer.appendChild(product));
            hideDropdown(document.querySelector('#dropdownButton').nextElementSibling);
        }

        function filterProducts() {
            const productContainer = document.getElementById('productContainer');
            const products = Array.from(productContainer.getElementsByClassName('product'));

            products.forEach(product => {
                const productColor = product.getAttribute('data-color');
                const productCategory = product.getAttribute('data-category');
                const matchesColor = (selectedColor === 'all' || productColor === selectedColor);
                const matchesCategory = (selectedCategory === 'all' || productCategory === selectedCategory);

                if (matchesColor && matchesCategory) {
                    product.style.display = 'block';
                } else {
                    product.style.display = 'none';
                }
            });
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

        function resetSort() {
            changeDropdownText('dropdownButton', '정렬');
            const productContainer = document.getElementById('productContainer');
            const products = Array.from(productContainer.getElementsByClassName('product'));
            products.sort((a, b) => a.dataset.index - b.dataset.index);
            products.forEach(product => productContainer.appendChild(product));
            hideDropdown(document.querySelector('#dropdownButton').nextElementSibling);
        }

        function resetFilter(type) {
            if (type === 'color') {
                changeDropdownText('colorSortButton', '색상');
                selectedColor = 'all';
            } else if (type === 'category') {
                changeDropdownText('categoryButton', '카테고리');
                selectedCategory = 'all';
            }
            filterProducts();
            hideDropdown(document.querySelector(#${type}SortButton).nextElementSibling);
        }

        function filterBySize() {
            const selectedSize = document.querySelector('.filter input[name="user_top"]').value.toUpperCase();
            const products = document.querySelectorAll('.product');

            products.forEach(product => {
                const sizes = product.getAttribute('data-size').split(',');
                if (sizes.includes(selectedSize)) {
                    product.querySelector('.size-display').textContent = selectedSize;
                } else {
                    product.querySelector('.size-display').textContent = '';
                }
            });
        }

        document.querySelectorAll('.dropbtn').forEach(button => {
            button.addEventListener('click', function(event) {
                event.stopPropagation();
                const dropdown = this.nextElementSibling;
                if (dropdown.style.display === 'block') {
                    hideDropdown(dropdown);
                } else {
                    showDropdown(dropdown);
                }
            });
        });

        window.onclick = function(event) {
            if (!event.target.matches('.dropbtn')) {
                document.querySelectorAll('.dropdown-content').forEach(dropdown => {
                    hideDropdown(dropdown);
                });
            }
        }
        function closetToWish(cl_idx, user_id) {

            $.ajax({
                url : './closetToWish',
                data : {
                   cl_idx : cl_idx,
                    user_id : user_id
                },
                type : 'POST',
                dataType : 'json',
                success : function(result) {
                    if (result.success) {
                        pass;
                    } 
                }
            });
        }

        // Rating submission functionality
        document.querySelectorAll('.rating input[type="radio"]').forEach(radio => {
            radio.addEventListener('change', function() {
                const ratingValue = this.value;
                const productId = this.name.split('-')[1];

                fetch('/submitRating', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        productId: productId,
                        rating: ratingValue
                    })
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        alert('Rating submitted successfully');
                        // 업데이트된 평점을 표시
                        document.getElementById('rating-value-' + productId).innerText = data.newRating;
                    } else {
                        alert('Failed to submit rating');
                    }
                });
            });
        });

    </script>
</body>
</html>