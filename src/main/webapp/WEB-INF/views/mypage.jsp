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
    <link rel="stylesheet" href="resources/assets/css/mypage.css">
</head>
<body>
   <div class="wrap">
        <div class="container">
            <div class="logo">
                <img src="resources/assets/images/browser/LOGO.jpg" alt="OOTB 로고">
            </div>
            <div class="nav">
                WISH LIST
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
                        <a href="/main.html">LOGOUT</a>
                        <a href="/edit.html">EDIT</a>
                    </div>
                </div>
            </div>
            <form action="">
                <div class="products">
                    <!-- Example of one product -->
                    <div class="product" data-color="black" data-category="sports_pants" data-rating="0">
                        <input type="checkbox" class="product-checkbox">
                        <p class="product-name" contenteditable="true" oninput="updateModalProductName(this)">맨투맨</p>
                        <a href="#"><img src="https://image.msscdn.net/thumbnails/images/goods_img/20230412/3226625/3226625_16824877115126_big.jpg?w=1200" alt="Product 1"></a>
                        <div class="product-info">
                            <div class="price-container">
                                <p class="original-price">50,000원</p>
                                <p class="discount-rate">할인율: 10%</p>
                            </div>
                            <p class="discounted-price">할인가: 100 <button class="modal-button" onclick="showModal(this.closest('.product'))">
                                <span class="lnr lnr-thumbs-up"></span>
                            </button></p>
                        </div>
                    </div>
                    <div class="product" data-color="black" data-category="sports_pants" data-rating="0">
                        <input type="checkbox" class="product-checkbox">
                        <p class="product-name" contenteditable="true" oninput="updateModalProductName(this)">스포츠</p>
                        <a href="#"><img src="https://image.msscdn.net/thumbnails/images/goods_img/20230412/3226625/3226625_16824877115126_big.jpg?w=1200" alt="Product 1"></a>
                        <div class="product-info">
                            <div class="price-container">
                                <p class="original-price">50,000원</p>
                                <p class="discount-rate">할인율: 10%</p>
                            </div>
                            <p class="discounted-price">할인가: 200 <button class="modal-button" onclick="showModal(this.closest('.product'))">
                                <span class="lnr lnr-thumbs-up"></span>
                            </button></p>
                        </div>
                    </div>
                    <div class="product" data-color="black" data-category="sports_pants" data-rating="0">
                        <input type="checkbox" class="product-checkbox">
                        <p class="product-name" contenteditable="true" oninput="updateModalProductName(this)">공부</p>
                        <a href="#"><img src="https://image.msscdn.net/thumbnails/images/goods_img/20230412/3226625/3226625_16824877115126_big.jpg?w=1200" alt="Product 1"></a>
                        <div class="product-info">
                            <div class="price-container">
                                <p class="original-price">50,000원</p>
                                <p class="discount-rate">할인율: 10%</p>
                            </div>
                            <p class="discounted-price">할인가: 300 <button class="modal-button" onclick="showModal(this.closest('.product'))">
                                <span class="lnr lnr-thumbs-up"></span>
                            </button></p>
                        </div>
                    </div>
                    <div class="product" data-color="black" data-category="sports_pants" data-rating="0">
                        <input type="checkbox" class="product-checkbox">
                        <p class="product-name" contenteditable="true" oninput="updateModalProductName(this)">인생</p>
                        <a href="#"><img src="https://image.msscdn.net/thumbnails/images/goods_img/20230412/3226625/3226625_16824877115126_big.jpg?w=1200" alt="Product 1"></a>
                        <div class="product-info">
                            <div class="price-container">
                                <p class="original-price">50,000원</p>
                                <p class="discount-rate">할인율: 10%</p>
                            </div>
                            <p class="discounted-price">할인가: 400 <button class="modal-button" onclick="showModal(this.closest('.product'))">
                                <span class="lnr lnr-thumbs-up"></span>
                            </button></p>
                        </div>
                    </div>
                    <!-- 동일한 구조의 제품 추가 -->
                </div>
                <div class="faq">
                    <a href="#">FAQ</a>
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
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <div class="product-info">
                <p id="modal-product-name"></p>
                <img id="modal-img" src="" alt="Product Image">
                <div class="rating">
                    <span class="star" data-value="1">&#9733;</span>
                    <span class="star" data-value="2">&#9733;</span>
                    <span class="star" data-value="3">&#9733;</span>
                    <span class="star" data-value="4">&#9733;</span>
                    <span class="star" data-value="5">&#9733;</span>
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
                    <tr>
                        <td>총장</td>
                        <td><input type="radio" id="length-small" name="cl_size" value="small"><label for="length-small"></label></td>
                        <td><input type="radio" id="length-medium" name="cl_size" value="medium"><label for="length-medium"></label></td>
                        <td><input type="radio" id="length-large" name="cl_size" value="large"><label for="length-large"></label></td>
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
                </tbody>
            </table>
            <button class="submit-button" onclick="submitModal()">저장</button>
        </div>
    </div>
    <script>
        let originalProductsOrder = [];
        document.addEventListener('DOMContentLoaded', (event) => {
            originalProductsOrder = Array.from(document.querySelector('.products').children);
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
            if (criteria === '가격순') {
                products.sort((a, b) => {
                    const priceA = parseInt(a.querySelector('.original-price').textContent.replace(/[^0-9]/g, ''));
                    const priceB = parseInt(b.querySelector('.original-price').textContent.replace(/[^0-9]/g, ''));
                    return priceA - priceB;
                });
            } else if (criteria === '별점순') {
                products.sort((a, b) => {
                    const ratingA = parseInt(a.getAttribute('data-rating'));
                    const ratingB = parseInt(b.getAttribute('data-rating'));
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
        window.onclick = function(event) {
            if (!event.target.matches('.dropbtn')) {
                document.querySelectorAll('.dropdown-content').forEach(dropdown => {
                    hideDropdown(dropdown);
                });
            }
        }
        let savedRatings = {}; // 제품별로 저장된 별점 값을 저장할 객체
        function formatPrice(price) {
            return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원';
        }
        function showModal(productElement) {
            const productName = productElement.querySelector('.product-name').innerText;
            const originalPrice = parseInt(productElement.querySelector('.original-price').innerText.replace(/[^0-9]/g, ''));
            const discountRate = parseInt(productElement.querySelector('.discount-rate').innerText.replace(/[^0-9]/g, ''));
            const productImgSrc = productElement.querySelector('img').src;
            const discountedPrice = formatPrice((originalPrice * (1 - discountRate / 100)).toFixed(0));
            document.getElementById('modal-product-name').innerText = productName;
            document.getElementById('modal-product-price').innerText = discountedPrice;
            document.getElementById('modal-img').src = productImgSrc;
            document.getElementById('myModal').style.display = 'block';
            // 모달 내부의 클릭 이벤트가 전파되지 않도록 설정
            document.querySelector('.modal-content').addEventListener('click', function(event) {
                event.stopPropagation();
            });
            // 별점 초기화 및 저장된 별점 표시
            document.querySelectorAll('.star').forEach(star => {
                star.classList.remove('selected', 'hover');
                if (savedRatings[productName] && star.getAttribute('data-value') <= savedRatings[productName]) {
                    star.classList.add('selected');
                }
            });
        }
        function closeModal() {
            document.getElementById('myModal').style.display = 'none';
        }
        function submitModal() {
            const productName = document.getElementById('modal-product-name').innerText;
            const rating = savedRatings[productName] || 0;
            const productElements = document.querySelectorAll('.product');
            productElements.forEach(productElement => {
                const nameElement = productElement.querySelector('.product-name');
                if (nameElement.innerText === productName) {
                    productElement.setAttribute('data-rating', rating);
                }
            });
            alert(`저장되었습니다. 별점: ${rating || '선택되지 않음'}`);
            closeModal();
        }
        window.onclick = function(event) {
            if (event.target == document.getElementById('myModal')) {
                closeModal();
            }
        }
        document.getElementById('delete-button').addEventListener('click', function() {
            const deleteButton = document.getElementById('delete-button');
            deleteButton.style.backgroundColor = 'blue';
            setTimeout(() => {
                deleteButton.style.backgroundColor = '';
            }, 50);
            const checkboxes = document.querySelectorAll('.product-checkbox');
            checkboxes.forEach(checkbox => {
                if (checkbox.checked) {
                    const productName = checkbox.closest('.product').querySelector('.product-name').innerText;
                    delete savedRatings[productName]; // 제품이 삭제될 때 별점 데이터도 삭제
                    checkbox.closest('.product').remove();
                }
            });
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
                alert(`별점 ${value}점을 선택하셨습니다.`);
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
                document.querySelectorAll('.star').forEach(s => s.classList.remove('hover'));
            });
        });

    
    </script>
</body>
</html>