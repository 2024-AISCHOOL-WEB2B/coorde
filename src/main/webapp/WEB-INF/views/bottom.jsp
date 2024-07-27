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
    <link rel="stylesheet" href="resources/assets/css/bottom.css">
</head>
<body>
   <div class="wrap">
        <div class="container">
            <div class="logo">
                <img src="resources/assets/images/browser/LOGO.jpg" alt="">
            </div>
            <div class="TorB">
                <a href="/top.html">TOP</a> / <a href="/bottom.html">BOTTOM</a>
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
                            <button onclick="filterProductsByCategory('스포츠하의', 'sport_pants')">스포츠하의</button>
                            <button onclick="filterProductsByCategory('반바지', 'half_pants')">반바지</button>
                            <button onclick="filterProductsByCategory('트레이닝 바지', 'training_pants')">트레이닝 바지</button>
                            <button onclick="filterProductsByCategory('슬렉스 바지', 'slacks_pants')">슬렉스 바지</button>
                            <button onclick="filterProductsByCategory('데님 바지', 'denim_pants')">데님 바지</button>
                            <button onclick="filterProductsByCategory('코튼 바지', 'cotton_pants')">코튼 바지</button>
                        </div>
                    </div>
                    <div class="right">
                        <a href="#" class="right">LOGOUT</a>
                        <a href="#" class="right">MYPAGE</a>
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
                        <input type="text" name="user_bot">
                    </label>
                    <label>
                        허리
                        <input type="text" name="user_waist">
                    </label>
                    <label>
                        허벅지
                        <input type="text" name="user_thighs">
                    </label>
                    <label>
                        종아리
                        <input type="text" name="user_calf">
                    </label>
                    <button class="submit-btn" onclick="filterBySize()">SEARCH</button>
                </div>
                <div class="products" id="productContainer">
                    <div class="product" data-category="denim_pants" data-color="lightblue">
                        <a href="https://example.com/product1">
                            <img src="https://image.msscdn.net/images/goods_img/20240523/4149670/4149670_17164526388049_500.jpg" alt="Product 1">
                        </a>
                        <p class="name">섬머데님와이드팬츠</p>
                        <p class="price"><span class="discount_price">34,970원</span><br><span class="original_price">53,800원</span> <span class="discount_percentage">35% SALE</span></p>
                        <div class="cart-icon"><span class="lnr lnr-cart"></span></div>
                        <div class="size-display">S M L</div>
                    </div>
                    <div class="product" data-category="denim_pants" data-color="darkblue">
                        <a href="https://example.com/product2">
                            <img src="https://image.msscdn.net/images/goods_img/20231003/3600309/3600309_16974227567297_500.jpg" alt="Product 2">
                        </a>
                        <p class="name">도밍고 데님팬츠</p>
                        <p class="price"><span class="discount_price">39,200원</span><br><span class="original_price">49,000원</span> <span class="discount_percentage">20% SALE</span></p>
                        <div class="cart-icon"><span class="lnr lnr-cart"></span></div>
                        <div class="size-display">S M L</div>
                    </div>
                    <div class="product" data-category="training_pants" data-color="gray">
                        <a href="https://example.com/product3">
                            <img src="https://image.msscdn.net/images/goods_img/20200818/1551840/1551840_1_500.jpg" alt="Product 3">
                        </a>
                        <p class="name">Deep One Tuck Sweat Pants</p>
                        <p class="price"><span class="discount_price">39,200원</span><br><span class="original_price">49,000원</span> <span class="discount_percentage">20% SALE</span></p>
                        <div class="cart-icon"><span class="lnr lnr-cart"></span></div>
                        <div class="size-display">S M L</div>
                    </div>
                    <div class="product" data-category="slacks_pants" data-color="black">
                        <a href="https://example.com/product4">
                            <img src="https://image.msscdn.net/images/goods_img/20190910/1149329/1149329_16760172077751_500.jpg" alt="Product 4">
                        </a>
                        <p class="name">세미 와이드 히든 밴딩 슬랙스</p>
                        <p class="price"><span class="discount_price">39,200원</span><br><span class="original_price">49,000원</span> <span class="discount_percentage">20% SALE</span></p>
                        <div class="cart-icon"><span class="lnr lnr-cart"></span></div>
                        <div class="size-display">S M L</div>
                    </div>
                    <div class="product" data-category="half_pants" data-color="green">
                        <a href="https://example.com/product5">
                            <img src="https://image.msscdn.net/images/goods_img/20220914/2791916/2791916_4_500.jpg" alt="Product 5">
                        </a>
                        <p class="name">포시즌 시그니처 스트레치 쇼츠</p>
                        <p class="price"><span class="discount_price">39,200원</span><br><span class="original_price">49,000원</span> <span class="discount_percentage">20% SALE</span></p>
                        <div class="cart-icon"><span class="lnr lnr-cart"></span></div>
                        <div class="size-display">S M L</div>
                    </div>
                    <div class="product" data-category="sport_pants" data-color="white">
                        <a href="https://example.com/product6">
                            <img src="https://image.msscdn.net/images/goods_img/20230330/3194331/3194331_16801573090614_500.jpg" alt="Product 6">
                        </a>
                        <p class="name">테니스 에센셜 쇼츠 WHITE</p>
                        <p class="price"><span class="discount_price">39,200원</span><br><span class="original_price">49,000원</span> <span class="discount_percentage">20% SALE</span></p>
                        <div class="cart-icon"><span class="lnr lnr-cart"></span></div>
                        <div class="size-display">S M L</div>
                    </div>
                    <div class="product" data-category="half_pants" data-color="blue">
                        <a href="https://example.com/product7">
                            <img src="https://image.msscdn.net/images/goods_img/20240410/4042324/4042324_17127367859497_500.jpg" alt="Product 7">
                        </a>
                        <p class="name">와이드 6부 버뮤다 반바지[블루]</p>
                        <p class="price"><span class="discount_price">39,200원</span><br><span class="original_price">49,000원</span> <span class="discount_percentage">20% SALE</span></p>
                        <div class="cart-icon"><span class="lnr lnr-cart"></span></div>
                        <div class="size-display">S M L</div>
                    </div>
                    <div class="product" data-category="cotton_pants" data-color="beige">
                        <a href="https://example.com/product8">
                            <img src="https://image.msscdn.net/images/goods_img/20220817/2720343/2720343_1_500.jpg" alt="Product 8">
                        </a>
                        <p class="name">xp123 슬로건 밴딩 코튼 팬츠(BEIGE)</p>
                        <p class="price"><span class="discount_price">39,200원</span><br><span class="original_price">49,000원</span> <span class="discount_percentage">20% SALE</span></p>
                        <div class="cart-icon"><span class="lnr lnr-cart"></span></div>
                        <div class="size-display">S M L</div>
                    </div>
                    <div class="product" data-category="training_pants" data-color="skyblue">
                        <a href="https://example.com/product9">
                            <img src="https://image.msscdn.net/images/goods_img/20240304/3920294/3920294_17095397391064_500.jpg" alt="Product 9">
                        </a>
                        <p class="name">핀턱 스트레이트 팬츠</p>
                        <p class="price"><span class="discount_price">39,200원</span><br><span class="original_price">49,000원</span> <span class="discount_percentage">20% SALE</span></p>
                        <div class="cart-icon"><span class="lnr lnr-cart"></span></div>
                        <div class="size-display">S M L</div>
                    </div>
                    <div class="product" data-category="slacks_pants" data-color="navy">
                        <a href="https://example.com/product10">
                            <img src="https://image.msscdn.net/images/goods_img/20200219/1312038/1312038_2_500.jpg" alt="Product 10">
                        </a>
                        <p class="name">라이트웨이트 세미 와이드 히든 밴딩 슬랙스</p>
                        <p class="price"><span class="discount_price">39,200원</span><br><span class="original_price">49,000원</span> <span class="discount_percentage">20% SALE</span></p>
                        <div class="cart-icon"><span class="lnr lnr-cart"></span></div>
                        <div class="size-display">S M L</div>
                    </div>
                    <div class="product" data-category="cotton_pants" data-color="ivory">
                        <a href="https://example.com/product11">
                            <img src="https://image.msscdn.net/images/goods_img/20230310/3138551/3138551_17113268505797_500.jpg" alt="Product 11">
                        </a>
                        <p class="name">린넨라이크 세미와이드 밴딩 팬츠</p>
                        <p class="price"><span class="discount_price">39,200원</span><br><span class="original_price">49,000원</span> <span class="discount_percentage">20% SALE</span></p>
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
                    const priceA = parseInt(a.querySelector('.price .discount_price').textContent.replace('원', '').replace(',', ''));
                    const priceB = parseInt(b.querySelector('.price .discount_price').textContent.replace('원', '').replace(',', ''));
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