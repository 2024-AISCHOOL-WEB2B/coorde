<%@page import="com.coorde.myapp.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Coordy</title>
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
    <link rel="stylesheet" href="resources/assets/css/top.css">
</head>
<body>

<% User loginUser = (User) session.getAttribute("loginUser"); %>

    <div class="wrap">
        <div class="container">
            <div class="logo">
                <a href="/myapp"><img src="resources/assets/images/browser/LOGO.jpg" alt=""></a>
            </div>
            <div class="TorB">
                <a href="goTop">TOP</a> / <a href="goBot">BOTTOM</a>
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
                        </div>
                    </div>
                    <div class="dropdown">
                        <button class="dropbtn" id="categoryButton">카테고리</button>
                        <div class="dropdown-content">
                            <button onclick="resetFilter('category')">카테고리</button>
                            <button onclick="filterProductsByCategory('반소매 티셔츠', 'half_t_shirt')">반소매 티셔츠</button>
                            <button onclick="filterProductsByCategory('셔츠', 'shirt')">셔츠</button>
                            <button onclick="filterProductsByCategory('스포츠 상의', 'sports_top')">스포츠 상의</button>
                            <button onclick="filterProductsByCategory('민소매', 'no_arm')">민소매</button>
                            <button onclick="filterProductsByCategory('카라티셔츠', 'collar_t_shirt')">카라티셔츠</button>
                            <button onclick="filterProductsByCategory('긴소매', 'long_arm')">긴소매</button>
                            <button onclick="filterProductsByCategory('후드', 'hood_t_shirt')">후드</button>
                            <button onclick="filterProductsByCategory('맨투맨', 'man_2_man')">맨투맨</button>
                        </div>
                    </div>
                    <div class="right">
                       <% if(loginUser != null){ %>
		                <div class="right">
		                    <a href="logoutUser">LOGOUT</a>
		                    <a href="gomyPage">MY PAGE</a>
		                </div>
		                <% } else { %>
		                <div class="right">
		                    <a href="gologin">LOGIN</a><br>
		                </div>
		                <% } %>
                    </div>
                </div>
            </div>

            <div class="main-content">
                <div class="filter">
                    <div class="fit">
                        <label>
                            REGULAR
                            <input type="radio" name="user_fit" value="regular">
                        </label>
                        <label>
                            OVERFIT
                            <input type="radio" name="user_fit" value="overfit">
                        </label>
                    </div>
                    <label>
                        HEIGHT
                        <input type="text" name="user_hei">
                    </label>
                    <label>
                        WEIGHT
                        <input type="text" name="user_wei">
                    </label>
                    <label>
                        총장
                        <input type="text" name="user_top">
                    </label>
                    <label>
                        가슴
                        <input type="text" name="user_ch">
                    </label>
                    <label>
                        어깨
                        <input type="text" name="user_sh">
                    </label>
                    <label>
                        팔
                        <input type="text" name="user_arm">
                    </label>
                    <button class="submit-btn" onclick="filterBySize()">SEARCH</button>
                </div>
                <div class="products" id="productContainer">
                    <div class="product" data-category="man_2_man" data-color="navy" data-size="S,M,L">
                        <img src="https://image.msscdn.net/thumbnails/images/goods_img/20230412/3226625/3226625_16824877115126_big.jpg?w=1200" alt="Product 1">
                        <p class="name">어반 오버 맨투맨 (2color)</p>
                        <p class="price"><span class="discount_price">34,970원</span><br><span class="original_price">53,800원</span> <span class="discount_percentage">35% SALE</span></p>
                        <div class="cart-icon"><span class="lnr lnr-cart"></span></div>
                        <div class="size-display">S M L</div>
                    </div>
                </div>
            </div>
            <footer class="pagination">
                <a href="#">&#171;</a>
                <a href="#">1</a>
                <a href="#">2</a>
                <a href="#">&#187;</a>
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