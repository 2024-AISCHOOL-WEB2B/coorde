<%@page import="com.coorde.myapp.entity.Closet"%>
<%@page import="java.util.List"%>
<%@page import="com.coorde.myapp.entity.User"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>Coordy</title>
<!-- Meta -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<meta name="author" content="Phoenixcoded" />

<link rel="stylesheet"
	href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css" />

<!-- vendor css -->
<link rel="stylesheet" href="resources/assets/css/top.css">
</head>
<body>

	<%
	User loginUser = (User) session.getAttribute("loginUser");
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
								<button onclick="filterProductsByCategory('반소매 티셔츠', 'half_t_shirt')">반소매 티셔츠</button>
								<button onclick="filterProductsByCategory('셔츠', 'shirt')">셔츠</button>
								<button onclick="filterProductsByCategory('스포츠 상의', 'sports_top')">스포츠 상의</button>
								<button onclick="filterProductsByCategory('민소매', 'no_arm')">민소매</button>
								<button onclick="filterProductsByCategory('카라티셔츠', 'collar_t_shirt')">카라티셔츠</button>
								<button onclick="filterProductsByCategory('긴소매', 'long_arm')">긴소매</button>
								<button onclick="filterProductsByCategory('후드', 'hood_t_shirt')">후드</button>
								<button onclick="filterProductsByCategory('맨투맨', 'man_2_man')">맨투맨</button>
							<%} else{ %>
	                            <button onclick="filterProductsByCategory('스포츠하의', 'sport_pants')">스포츠하의</button>
	                            <button onclick="filterProductsByCategory('반바지', 'half_pants')">반바지</button>
	                            <button onclick="filterProductsByCategory('트레이닝 바지', 'training_pants')">트레이닝 바지</button>
	                            <button onclick="filterProductsByCategory('슬렉스 바지', 'slacks_pants')">슬렉스 바지</button>
	                            <button onclick="filterProductsByCategory('데님 바지', 'denim_pants')">데님 바지</button>
	                            <button onclick="filterProductsByCategory('코튼 바지', 'cotton_pants')">코튼 바지</button>
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
					}%>
					<% if(clothList.get(0).getCl_cate().equals("t")) { %>
						</label> <label> 상체 총장 <input type="text" name="user_top" placeholder="<%= top %>">
						</label> <label> 가슴 넓이 <input type="text" name="user_ch" placeholder="<%= ch %>">
						</label> <label> 어깨 넓이 <input type="text" name="user_sh" placeholder="<%= sh %>">
						</label> <label> 팔 길이 <input type="text" name="user_arm" placeholder="<%= arm %>">
					<%}else{ %>
						</label> <label> 하체 총장 <input type="text" name="user_bot" placeholder="<%= bot %>">
						</label> <label> 허리 둘레 <input type="text" name="user_waist" placeholder="<%= waist %>">
						</label> <label> 허벅지 둘레 <input type="text" name="user_thighs" placeholder="<%= thighs %>">
						</label> <label> 종아리 둘레 <input type="text" name="user_hem" placeholder="<%= hem %>">
					<%} %>
					
					</label>
					<button class="submit-btn" onclick="filterBySize()">SEARCH</button>
				</div>
				<div class="products" id="productContainer">

					<% 	int index = 0;%>
					<c:forEach items="${clothList}" var="c" begin="0" end="29" varStatus="status">
						<div class="product" data-category="${c.cl_cate_detail}"
							data-color="${c.cl_color}">
							<a href="${c.cl_url}"> <img src="${c.cl_imgurl}"
								alt="${c.cl_name}">
							</a>
							<p class="name">${c.cl_name}</p>
							<p class="price">
							<%if(clothList.get(index).getCl_price() == 0) { %>
								<span class="discount_price">${c.cl_dc_price}원</span> <br>
								<span class="original_price">할인 없음</span> 
							<% }else { %>
								<span class="discount_price">${c.cl_dc_price}원</span><br> 
								<span class="original_price">${c.cl_price}원</span> 
								<span class="discount_percentage"> <fmt:formatNumber value="${(c.cl_price - c.cl_dc_price) / c.cl_price}" type="percent" /> SALE </span>
							<%} %>
							
							
							</p>
							<div class="cart-icon">
								<span class="lnr lnr-cart"></span>
							</div>
							<div class="size-display">S M L</div>
						</div>
						<% index++; %>
					</c:forEach>


				</div>
			</div>
			<footer class="pagination">
				<a href="#">&#171;</a> <a href="#">1</a> <a href="#">2</a> <a
					href="#">&#187;</a>
			</footer>
		</div>
	</div>

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
            hideDropdown(document.querySelector(`#${type}SortButton`).nextElementSibling);
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


        
    </script>
</body>
</html>