<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
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
    margin-top: -20px;
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

.dropbtn {
    color: black;
    font-size: 20px;
    border: none;
    cursor: pointer;
    width: 140px;
    height: 60px;
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
    width: 100%;
    height: 50px;
    border: none;
    background: none;
    cursor: pointer;
    text-align: center;
    font-size:16px
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
    justify-content: space-between;
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
    max-width: 150px;
    text-align: center;
    flex: 1;
    margin-left:20px
}

.rating-number {
    font-size: 16px;
    color: #555;
    text-align: right;

    
}

.cart-icon {
    font-size: 20px;
    cursor: pointer;
    text-align: center;
}

#closetToWishlist {
   font-size:30px
}


.product img {
    width: 100%;
    height: 300px;
    object-fit: cover;
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

input {
    border: none;
    outline: none;
}
</style>

</head>
<body>


	<%
    User loginUser = (User) session.getAttribute("loginUser");
    List<Closet> filteredclothList = (List<Closet>) request.getAttribute("filteredclothList");
    List<Closet> clothList = (List<Closet>) request.getAttribute("clothList");

    // Display list initialization
    List<Closet> displayList = (filteredclothList != null && !filteredclothList.isEmpty()) ? filteredclothList : clothList;
    
    Map<Integer, Closet> uniqueClosets = new HashMap<>();

    for (Closet closet : displayList) {
        uniqueClosets.put(closet.getCl_idx(), closet);
    }

    // 중복이 제거된 리스트
    List<Closet> filteredDisplayList = new ArrayList<>(uniqueClosets.values());
%>
	<script type="text/javascript">
        var loginUser = <%= (loginUser != null ? "{ userId: '" + loginUser.getUser_id() + "' }" : "null") %>;
    </script>

	<div class="wrap">
		<div class="container">
			<div class="logo">
				<a href="/myapp"><img
					src="resources/assets/images/browser/LOGO.png" alt=""></a>
			</div>
			<div class="TorB">
				<a href="goCloset?cl_cate=t">TOP</a> / <a href="goCloset?cl_cate=b">BOTTOM</a>
				<div class="header-buttons">
					<div class="dropdown">
						<button class="dropbtn" id="dropdownButton">정렬</button>
						<div class="dropdown-content">
							<button onclick="resetSort()">정렬</button>
							<button onclick="sortProducts('높은 가격순', 'asc')">높은 가격순</button>
							<button onclick="sortProducts('낮은 가격순', 'desc')">낮은 가격순</button>
							<button onclick="sortProducts('rating', 'desc')">별점순</button>
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
						<button class="dropbtn" id="categorySortButton">카테고리</button>
						<div class="dropdown-content">
							<button onclick="resetFilter('category')">카테고리</button>
							<%if(clothList.get(0).getCl_cate().equals("t")) { %>

							<button onclick="filterProductsByCategory('반소매 티셔츠', 'th')">반소매 티셔츠</button>
							<button onclick="filterProductsByCategory('셔츠', 'tt')">셔츠</button>
							<button
								onclick="filterProductsByCategory('스포츠 상의', 'ts')">스포츠
								상의</button>
							<button onclick="filterProductsByCategory('민소매', 'tn')">민소매</button>
							<button
								onclick="filterProductsByCategory('카라티셔츠', 'tc')">카라티셔츠</button>
							<button onclick="filterProductsByCategory('긴소매', 'tl')">긴소매</button>
							<button onclick="filterProductsByCategory('후드', 'td')">후드</button>
							<button onclick="filterProductsByCategory('맨투맨', 'tm')">맨투맨</button>
							<%} else{ %>
							<button
								onclick="filterProductsByCategory('스포츠하의', 'bs')">스포츠하의</button>
							<button onclick="filterProductsByCategory('반바지', 'bh')">반바지</button>
							<button
								onclick="filterProductsByCategory('트레이닝 바지', 'bt')">트레이닝
								바지</button>
							<button
								onclick="filterProductsByCategory('슬렉스 바지', 'bl')">슬렉스
								바지</button>
							<button
								onclick="filterProductsByCategory('데님 바지', 'bd')">데님
								바지</button>
							<button
								onclick="filterProductsByCategory('코튼 바지', 'bc')">코튼
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
					<label> HEIGHT <input type="text" name="user_hei" value="<%= loginUser != null ? loginUser.getUser_hei() : "" %>">
					</label> 
					<label> WEIGHT <input type="text" name="user_wei" value="<%= loginUser != null ? loginUser.getUser_wei() : "" %>">
					</label>
					<% 
					int top = 0;
					int ch = 0;
					int sh = 0;
					int arm = 0;
					int bot = 0;
					int waist = 0;
					int thighs = 0;
					int hem = 0;
					
					if (loginUser != null) {
					    top = loginUser.getUser_top();
					    ch = loginUser.getUser_ch();
					    sh = loginUser.getUser_sh();
					    arm = loginUser.getUser_arm();
					    bot = loginUser.getUser_bot();
					    waist = loginUser.getUser_waist();
					    thighs = loginUser.getUser_thighs();
					    hem = loginUser.getUser_hem();
					}
					%>
					
					<% if(clothList.get(0).getCl_cate().equals("t")) { %>
					    <label> 상의 총장 <input type="text" name="user_top" value="<%= top %>"></label>
					    <label> 가슴 단면 <input type="text" name="user_ch" value="<%= ch %>"></label>
					    <label> 어깨 너비 <input type="text" name="user_sh" value="<%= sh %>"></label>
					    <label> 팔 길이 <input type="text" name="user_arm" value="<%= arm %>"></label>
					<% } else { %>
					    <label> 하의 총장 <input type="text" name="user_bot" value="<%= bot %>"></label>
					    <label> 허리 단면 <input type="text" name="user_waist" value="<%= waist %>"></label>
					    <label> 허벅지 단면 <input type="text" name="user_thighs" value="<%= thighs %>"></label>
					    <label> 밑단 단면 <input type="text" name="user_hem" value="<%= hem %>"></label>
					<% } %>
					
					<button class="submit-btn" onclick="filterBySize()">SEARCH</button>
				</div>
				<div class="products" id="productContainer">

					<% if (filteredDisplayList != null && !filteredDisplayList.isEmpty()) { %>
				        <% for (Closet closet : filteredDisplayList) { %>
				            <div class="product">
				                <div class="product-header">
				                    <div class="cart-icon">
				                        <% if (loginUser != null) { %>
										    <button class="lnr lnr-cart" id="closetToWishlist" onclick="closetToWishList('<%= closet.getCl_idx() %>', '<%= loginUser.getUser_id() %>')"></button>
										<% } else { %>
										    <button class="lnr lnr-cart" id="closetToWishlist" disabled></button>
										<% } %>
				                    </div>
				                    <div class="size-display"><%= closet.getCl_size() %></div>
				                    <div class="rating-number">
				                        평점: <span id="rating-value-${closet.getReview_star()}">0</span>
				                    </div>
				                </div>
				                <a href="<%= closet.getCl_url() %>"> <img src="<%= closet.getCl_imgurl() %>" alt="<%= closet.getCl_name() %>"></a>
				                <p class="name"><%= closet.getCl_name() %></p>
				                <div class="price">
				                    <c:choose>
				                        <c:when test="<%= closet.getCl_price() == 0 %>">
				                            <span class="discount_price"><%= closet.getCl_dc_price() %>원</span>
				                            <br>
				                            <span class="original_price">할인 없음</span>
				                        </c:when>
				                        <c:otherwise>
				                            <span class="discount_price"><%= closet.getCl_dc_price() %>원</span>
				                            <br>
				                            <span class="original_price"><%= closet.getCl_price() %>원</span>
				                            <span class="discount_percentage">
											    <fmt:formatNumber value="<%= ((double)(closet.getCl_price() - closet.getCl_dc_price()) / closet.getCl_price()) %>" type="percent" /> SALE
											</span>
				                        </c:otherwise>
				                    </c:choose>
				                </div>
				            </div>
				        <% } %>
				    <% } else { %>
				        <div class="no-products">상품이 없습니다.</div>
				    <% } %>
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
	let currentSort = '';
    let currentColor = '';
    let currentCategory = '';

    function resetSort() {
        currentSort = '';
        fetchFilteredAndSortedData();
    }

    function sortProducts(sortType, sortOrder) {
        currentSort = sortType + ',' + sortOrder;
        fetchFilteredAndSortedData();
    }

    function resetFilter(filterType) {
        if (filterType === 'color') {
            currentColor = '';
        } else if (filterType === 'category') {
            currentCategory = '';
        }
        fetchFilteredAndSortedData();
    }

    function filterProductsByColor(colorName, colorCode) {
        currentColor = colorCode;
        fetchFilteredAndSortedData();
    }

    function filterProductsByCategory(categoryName, categoryCode) {
        currentCategory = categoryCode;
        fetchFilteredAndSortedData();
    }
    
    

    async function fetchFilteredAndSortedData() {
        const urlParams = new URLSearchParams(window.location.search);
        const cl_cate = urlParams.get('cl_cate');
        console.log("test fetchFilteredAndSortedData");

        if (!cl_cate) {
            console.error("cl_cate parameter is missing or invalid.");
            return;
        }

        try {
            console.log("test async");
            const requestBody = {
                cl_cate: cl_cate,
                sort: currentSort || '', 
                color: currentColor || '',
                category: currentCategory || ''
            };
            console.log('Request Body:', requestBody);

            const response = await fetch('./filterCloset', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(requestBody)
            });

            console.log("test before response");
            if (response.ok) {
                console.log("test response ok");
                const data = await response.json();
                let html = '';

                if (data.length > 0) {

                	function formatPercentage(value) {
                        return new Intl.NumberFormat('ko-KR', { style: 'percent', minimumFractionDigits: 0 }).format(value);
                    }
                	
                    data.forEach(closet => {
                    	const discountPercentage = (closet.cl_price - closet.cl_dc_price) / closet.cl_price;
                        const formattedDiscountPercentage = formatPercentage(discountPercentage);
                        
                        html += '<div class="product" data-id="' + closet.cl_idx + '">';
                        html += '<div class="product-header">';
                        html += '<div class="cart-icon">';
                        if (loginUser) {
                            html += '<button class="lnr lnr-cart" id="closetToWishlist" onclick="closetToWishList(\'' + closet.cl_idx + '\', \'' + loginUser.userId + '\')"></button>';
                        } else {
                            html += '<button class="lnr lnr-cart" id="closetToWishlist" disabled></button>';
                        }
                        html += '</div>';
                        html += '<div class="size-display">' + closet.cl_size + '</div>';
                        html += '<div class="rating-number">평점: <span id="rating-value-' + closet.review_star + '">0</span></div>';
                        html += '</div>';
                        html += '<a href="' + closet.cl_url + '"><img src="' + closet.cl_imgurl + '" alt="' + closet.cl_name + '"></a>';
                        html += '<p class="name">' + closet.cl_name + '</p>';
                        html += '<div class="price">';
                        if (closet.cl_price == 0) {
                            html += '<span class="discount_price">' + closet.cl_dc_price + '원</span><br>';
                            html += '<span class="original_price">할인 없음</span>';
                        } else {
                            html += '<span class="discount_price">' + closet.cl_dc_price + '원</span><br>';
                            html += '<span class="original_price">' + closet.cl_price + '원</span>';
                            html += '<span class="discount_percentage">' + formattedDiscountPercentage + ' SALE</span>';
                        }
                        html += '</div>';
                        html += '</div>';
                    });
                } else {
                    html = '<div class="no-products">상품이 없습니다.</div>';
                }

                document.getElementById('productContainer').innerHTML = html;
            } else {
                console.error('Failed to fetch data:', response.statusText);
            }
        } catch (error) {
            console.error('Error fetching data:', error);
        }
    }

    function closetToWishList(cl_idx, user_id) {
        $.ajax({
            url: './closetToWish',
            data: {
                cl_idx: cl_idx,
                user_id: user_id
            },
            type: 'POST',
            dataType: 'json',
            success: function(result) {
                if (result.success) {
                    // Handle success case
                }
            }
        });
    }

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
                    document.getElementById('rating-value-' + productId).innerText = data.newRating;
                } else {
                    alert('Failed to submit rating');
                }
            });
        });
    });
    
    function filterBySize() {
    	var user_hei = document.querySelector('input[name="user_hei"]').value;
        var user_wei = document.querySelector('input[name="user_wei"]').value;
        
        predictBodySize(user_hei, user_wei)
    	//추후 추가예정
    }
    
    function predictBodySize(user_hei, user_wei) {
    	console.log(user_hei)
    	console.log(user_wei)
	    $.ajax({
	        url: 'http://localhost:5000/predict',
	        data: JSON.stringify({
	            weight: user_wei,
	            height: user_hei
	        }),
	        type: 'POST',
	        contentType: 'application/json',
	        dataType: 'json',
	        success: function(response) {

                    var clCate = '<%= clothList.get(0).getCl_cate() %>'; 

                    if (clCate === "t") {
                        $('input[name="user_top"]').val(response.top);
                        $('input[name="user_ch"]').val(response.chest);
                        $('input[name="user_sh"]').val(response.shoulder);
                        $('input[name="user_arm"]').val(response.arm);
                    } else {
                        $('input[name="user_bot"]').val(response.bottom);
                        $('input[name="user_waist"]').val(response.waist);
                        $('input[name="user_thighs"]').val(response.thigh);
                        $('input[name="user_hem"]').val(response.hem);
                    }

	        },
	        error: function(xhr, status, error) {
	            console.error("AJAX error:", status, error);
	        }
	    });
	}
    
    
    </script>
</body>
</html>