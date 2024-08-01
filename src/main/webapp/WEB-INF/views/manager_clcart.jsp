<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>OOTB 의류 관리</title>
<!-- Meta -->
<meta charset="utf-8">
<meta name="viewport"
    content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<meta name="author" content="Phoenixcoded" />

<link rel="stylesheet"
    href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css" />

<!-- vendor css -->
<link rel="stylesheet" href="resources/assets/css/manager_clcart.css">
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
}

a {
    text-decoration: none;
    color: inherit;
}

button {
    border: none;
    background: none;
    font-size: 20px; /* 크기 조정 */
    cursor: pointer;
}

.logo {
    text-align: center;
    margin-bottom: 20px;
    border-bottom: 1px solid #ddd;
}

.CL-CART {
    font-size: 20px;
    text-align: center;
    flex-grow: 1;
    margin-bottom: 20px;
    margin-top: 20px;
}

.wrap {
    width: 100%;
    overflow: hidden;
}

.container {
    width: 1280px;
    margin: 0 auto;
    overflow: hidden;
}

.right {
    display: flex;
    flex-direction: column;
    align-items: flex-end;
    margin-bottom: 20px;
    text-align: right;
}

.right a, .right button {
    font-size: 16px;
    margin-bottom: 10px;
}

.control-row {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 10px;
}

.search-container {
    display: flex;
    align-items: center;
}

.search-container input {
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ddd;
    border-radius: 5px 0 0 5px;
    outline: none;
}

.search-container button {
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ddd;
    background-color: #f0f0f0;
    border-radius: 0 5px 5px 0;
    cursor: pointer;
}

.button-container {
    display: flex;
    gap: 35px;
}

.button-container-under {
    display: flex;
    gap: 35px;
    justify-content: flex-end; /* 오른쪽 정렬 */
    margin-top: 20px;
}

table {
    width: 100%;
    margin-bottom: 20px;
}

thead th {
    background-color: #f0f0f0;
    padding: 10px;
    position: relative;
}

.clickable {
    cursor: pointer;
}

.sort-arrow {
    cursor: pointer;
    margin-left: 20px;
    font-size: 12px;
}

tbody td {
    padding: 10px;
    border-top: 1px solid #ddd;
    text-align: center; /* 모든 텍스트를 가운데 정렬 */
}

tbody input[type="text"] {
    width: 100%;
    padding: 5px;
    font-size: 16px;
    border: 1px solid #ddd;
    border-radius: 5px;
    text-align: center; /* 입력 텍스트를 가운데 정렬 */
}

.dc-price-input {
    color: red;
}

/* 열 너비를 조절하기 위한 클래스 */
.col-index {
    width: 7%;
}

.col-name {
    width: 35%;
}

.col-price {
    width: 12%;
}

.col-dc-price {
    width: 15%;
}

.col-color {
    width: 10%;
}

.col-detail {
    width: 16%;
}

.col-select {
    width: 5%; /* 최소 너비로 설정 */
}

input {
            border: none;
            outline: none;
        }

</style>
</head>
<body>
    <div class="wrap">
        <div class="logo">
            <a href="goManager"><img
                src="resources/assets/images/browser/LOGO.png" alt="Main LOGO"></a>
            <div class="CL-CART">CLOSET</div>
        </div>

        <div class="container">
            <div class="right">
                <a href="logoutUser"><button class="logout button">LOGOUT</button></a>
                <a href="goManager" class="button">MANAGER</a>
                <a href="goManagerFaq" class="button">FAQ</a>
            </div>

            <form id="user-management-form" action="deleteCloset" method="POST">
                <div class="control-row">
                    <div class="search-container">
                        <input type="text" id="search" placeholder="검색">
                        <button type="button" onclick="searchCL()">
                            <span class="lnr lnr-magnifier"></span>
                        </button>
                    </div>

                    <div class="button-container">
                        <button type="submit"
                            onclick="return confirm('선택한 항목을 삭제하시겠습니까?')">DELETE</button>
                        <button type="button" onclick="editCloset()">EDIT</button>
                    </div>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th class="col-index">번호</th>
                            <th class="col-name">CL_Name</th>
                            <th class="col-price"><span onclick="resetTableOrder()"
                                class="clickable">Price</span> <span class="sort-arrow"
                                onclick="sortTableByPrice('asc')">⬆</span> <span
                                class="sort-arrow" onclick="sortTableByPrice('desc')">⬇</span></th>
                            <th class="col-dc-price"><span
                                onclick="sortTableByDcPrice('asc')" class="clickable">DC_Price</span>
                                <span class="sort-arrow" onclick="sortTableByDcPrice('asc')">⬆</span>
                                <span class="sort-arrow" onclick="sortTableByDcPrice('desc')">⬇</span>
                            </th>
                            <th class="col-color">Color</th>
                            <th class="col-detail">Detail_Category <select
                                id="category-filter" onchange="filterByCategory()">
                                    <option value="All">All</option>
                                    <option value="bs">bs</option>
                                    <option value="bh">bh</option>
                                    <option value="bt">bt</option>
                                    <option value="bl">bl</option>
                                    <option value="bd">bd</option>
                                    <option value="bc">bc</option>
                            </select>
                            </th>
                            <th class="col-select">Select</th>
                        </tr>
                    </thead>
                    <tbody id="cl_cart">
                        <c:forEach var="closet" items="${closetList}" varStatus="status">
                            <tr>
                                <td class="col-index"><input type="text" name="cl_idx"
                                    value="${status.index+1}" readonly></td>
                                <td class="col-name"><input type="text" name="cl_name"
                                    value="${closet.cl_name}" readonly></td>
                                <td class="col-price"><input type="text" name="cl_price"
                                    value="${closet.cl_price}"></td>
                                <td class="col-dc-price"><input type="text"
                                    name="cl_dc_price" value="${closet.cl_dc_price}"
                                    class="dc-price-input"></td>
                                <td class="col-color"><input type="text" name="cl_color"
                                    value="${closet.cl_color}"></td>
                                <td class="col-detail"><input type="text"
                                    name="cl_cate_detail" value="${closet.cl_cate_detail}"></td>
                                <td class="col-select"><input type="checkbox"
                                    name="selectedCloset" value="${closet.cl_idx}"
                                    class="row-checkbox"></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="button-container-under">
                    <button type="submit" onclick="return confirm('선택한 항목을 삭제하시겠습니까?')">DELETE</button>
                    <button type="button" onclick="editCloset()">EDIT</button>
                </div>
            </form>
        </div>
        <c:if test="${not empty message}">
            <div class="alert">${message}</div>
        </c:if>
    </div>
    <script>
        let originalOrder = [];
        let priceSortOrder = true; // true: 오름차순, false: 내림차순
        let dcPriceSortOrder = true; // true: 오름차순, false: 내림차순

        // 페이지 로드 완료 시 실행되는 이벤트 리스너
        document.addEventListener('DOMContentLoaded', () => {
            // 테이블 요소를 가져옴
            const table = document.getElementById('cl_cart');
            // 원본 테이블 순서를 저장
            originalOrder = Array.from(table.rows);
            
            // 검색 입력란에 이벤트 리스너 추가
            // 입력 값이 변경될 때마다 searchCL 함수 실행
            document.getElementById('search').addEventListener('input', searchCL);

            // 카테고리 선택 요소에 이벤트 리스너 추가
            // 카테고리가 변경될 때마다 filterByCategory 함수 실행
            document.getElementById('category-filter').addEventListener('change', filterByCategory);
        });

        function searchCL() {
            const searchValue = document.getElementById('search').value.toLowerCase();
            const categoryFilter = document.getElementById('category-filter');
            const selectedCategory = categoryFilter.value.toLowerCase();
            const rows = document.querySelectorAll('#cl_cart tr');

            rows.forEach(row => {
                const cells = row.getElementsByTagName('td');
                let match = false;
                let categoryMatch = true;

                for (let i = 0; i < cells.length; i++) {
                    const input = cells[i].querySelector('input');
                    if (input) {
                        const inputValue = input.value.toLowerCase();
                        if (inputValue.includes(searchValue)) {
                            match = true;
                        }
                        if (input.name === 'cl_cate_detail' && selectedCategory !== 'all' && inputValue !== selectedCategory) {
                            categoryMatch = false;
                        }
                    }
                }

                if (match && categoryMatch) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        }

        // 가격을 기준으로 테이블을 정렬하는 함수
        function sortTableByPrice(order) {
            const table = document.getElementById('cl_cart');
            const rows = Array.from(table.rows);
            // 가격을 기준으로 행을 정렬
            const sortedRows = rows.sort((a, b) => {
                const aPrice = parseFloat(a.querySelector('.col-price input').value) || 0;
                const bPrice = parseFloat(b.querySelector('.col-price input').value) || 0;
                // order 매개변수에 따라 오름차순 또는 내림차순 정렬
                return order === 'asc' ? aPrice - bPrice : bPrice - aPrice;
            });
            // 정렬된 행을 테이블에 다시 추가
            table.innerHTML = '';
            sortedRows.forEach(row => table.appendChild(row));
        }

        // DC_Price를 기준으로 테이블을 정렬하는 함수
        function sortTableByDcPrice(order) {
            const table = document.getElementById('cl_cart');
            const rows = Array.from(table.rows);
            // DC_Price를 기준으로 행을 정렬
            const sortedRows = rows.sort((a, b) => {
                const aPrice = parseFloat(a.querySelector('.col-dc-price input').value) || 0;
                const bPrice = parseFloat(b.querySelector('.col-dc-price input').value) || 0;
                // order 매개변수에 따라 오름차순 또는 내림차순 정렬
                return order === 'asc' ? aPrice - bPrice : bPrice - aPrice;
            });
            // 정렬된 행을 테이블에 다시 추가
            table.innerHTML = '';
            sortedRows.forEach(row => table.appendChild(row));
        }

        // 테이블을 원래 순서로 되돌리는 함수
        function resetTableOrder() {
            const table = document.getElementById('cl_cart');
            // 테이블 내용을 비우고 원래 순서대로 행을 다시 추가
            table.innerHTML = '';
            originalOrder.forEach(row => table.appendChild(row));
        }
        
        // cl_idx를 기준으로 테이블을 정렬하는 함수
        function sortTableByClIdx() {
            // 테이블 요소를 가져옴
            const table = document.getElementById('cl_cart');
            // 현재 표시된 행만 선택하여 배열로 변환
            const rows = Array.from(table.rows).filter(row => row.style.display !== 'none');
            
            // cl_idx를 기준으로 행을 정렬
            const sortedRows = rows.sort((a, b) => {
                // 각 행의 cl_idx 값을 가져와 숫자로 변환
                const aIdx = parseInt(a.querySelector('.col-index input').value) || 0;
                const bIdx = parseInt(b.querySelector('.col-index input').value) || 0;
                // 오름차순으로 정렬
                return aIdx - bIdx;
            });

            // 정렬된 행을 테이블에 다시 추가
            rows.forEach(row => table.removeChild(row)); // 기존 행 제거
            sortedRows.forEach(row => table.appendChild(row)); // 정렬된 행 추가
        }

        // 카테고리 필터링 및 검색 기능을 수행하는 함수
        function filterByCategory() {
            // 카테고리 필터 요소와 선택된 카테고리 값을 가져옴
            const categoryFilter = document.getElementById('category-filter');
            const selectedCategory = categoryFilter.value.toLowerCase();
            // 검색 입력란의 값을 가져옴
            const searchValue = document.getElementById('search').value.toLowerCase();
            // 테이블의 모든 행을 가져옴
            const rows = document.querySelectorAll('#cl_cart tr');

            // 각 행에 대해 필터링 수행
            rows.forEach(row => {
                const cells = row.getElementsByTagName('td');
                let match = false;
                let categoryMatch = true;

                // 각 셀에 대해 검사
                for (let i = 0; i < cells.length; i++) {
                    const input = cells[i].querySelector('input');
                    if (input) {
                        const inputValue = input.value.toLowerCase();
                        // 검색어와 일치하는지 확인
                        if (inputValue.includes(searchValue)) {
                            match = true;
                        }
                        // 카테고리와 일치하는지 확인
                        if (input.name === 'cl_cate_detail') {
                            if (selectedCategory === 'all' || selectedCategory === inputValue) {
                                categoryMatch = true;
                            } else {
                                categoryMatch = false;
                            }
                        }
                    }
                }

                // 검색어와 카테고리 모두 일치하면 행을 표시, 그렇지 않으면 숨김
                if (match && categoryMatch) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
            
             // 'All' 카테고리가 선택된 경우 cl_idx로 정렬
            if (selectedCategory === 'all') {
                sortTableByClIdx();
            }
        }


        function confirmAndDelete() {
            if (confirm('선택한 항목을 삭제하시겠습니까?')) {
                const selectedClosets = Array.from(document.querySelectorAll('.row-checkbox:checked'))
                    .map(checkbox => checkbox.value);

                if (selectedClosets.length === 0) {
                    alert('삭제할 항목을 선택해주세요.');
                    return;
                }

                $.ajax({
                    url: 'deleteCloset',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify({ selectedClosets }),
                    success: function(response) {
                        if (response.redirected) {
                            window.location.href = response.url;
                        } else if (response.message) {
                            alert(response.message);
                        }
                        location.reload();
                    },
                    error: function() {
                        alert('서버 오류가 발생했습니다.');
                    }
                });
            }
        }

        function editCloset() {
            const table = document.getElementById('cl_cart');
            const rows = Array.from(table.rows);
            const updatedClosets = rows.map(row => {
                return {
                    cl_idx: row.querySelector('input[name="cl_idx"]').value,
                    cl_price: parseInt(row.querySelector('input[name="cl_price"]').value),
                    cl_dc_price: parseInt(row.querySelector('input[name="cl_dc_price"]').value),
                    cl_color: row.querySelector('input[name="cl_color"]').value,
                    cl_cate_detail: row.querySelector('input[name="cl_cate_detail"]').value
                };
            });

            $.ajax({
                url: 'editCloset',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(updatedClosets),
                success: function(response) {
                    if (response.redirected) {
                        window.location.href = response.url;
                    } else if (response.message) {
                        alert(response.message);
                    }
                    location.reload();
                },
                error: function() {
                    alert('서버 오류가 발생했습니다.');
                }
            });
        }
    </script>
</body>
</html>
