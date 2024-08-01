<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
    <title>OOTB 회원 관리</title>
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
            font-size: 20px;
            cursor: pointer;
        }
        .logo {
            text-align: center;
            margin-bottom: 20px;
            border-bottom: 1px solid #ddd;
        }
        .USERLIST {
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
        .right a,
        .right button {
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
            justify-content: flex-end;
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
            text-align: center;
        }
        tbody input[type="text"] {
            width: 100%;
            padding: 5px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 5px;
            text-align: center;
        }
        .dc-price-input {
            color: red;
        }
        .col-index {
            width: 5%;
        }
        .col_id {
            width: 10%;
        }
        .col-name {
            width: 10%;
        }
        .col-age {
            width: 10%;
        }
        .col-email {
            width: 20%;
        }
        .col-phone {
            width: 15%;
        }
        .col-detail {
            width: 25%;
        }
        .col-select {
            width: 5%;
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
            <a href="goManager"><img src="resources/assets/images/browser/LOGO.png" alt=""></a>
            <div class="USERLIST">USER</div>
        </div>
        <div class="container">
            <div class="right">
                <a href="logoutUser"><button class="logout button">LOGOUT</button></a>
                <a href="goManager" class="button">MANAGER</a>
                <a href="goManagerFaq" class="button">FAQ</a>
            </div>
            <form id="user-management-form" action="deleteUsers" method="POST">
                <div class="control-row">
                    <div class="search-container">
                        <input type="text" id="search" placeholder="검색" onkeyup="handleSearchKey(event)">
                        <button type="button" onclick="searchCL()"><span class="lnr lnr-magnifier"></span></button>
                    </div>
                    <div class="button-container-under">
                        <button type="submit" onclick="return confirmDelete()">DELETE</button>
                    </div>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th class="col-index">번호</th>
                            <th class="col-id">ID</th>
                            <th class="col-name">이름</th>
                            <th class="col-age">
                                <span onclick="resetTableOrder()" class="clickable">나이</span>
                                <span class="sort-arrow" onclick="sortTableByage('asc')">⬆</span>
                                <span class="sort-arrow" onclick="sortTableByage('desc')">⬇</span>
                            </th>
                            <th class="col-email">이메일</th>
                            <th class="col-phone">핸드폰</th>
                            <th class="col-detail">주소
                                <select id="category-filter" onchange="filterByCategory()">
                                    <option value="">All</option>
                                    <option value="서울">서울</option>
                                    <option value="부산">부산</option>
                                    <option value="인천">인천</option>
                                    <option value="대구">대구</option>
                                    <option value="대전">대전</option>
                                    <option value="광주">광주</option>
                                    <option value="울산">울산</option>
                                    <option value="세종">세종</option>
                                    <option value="경기도">경기도</option>
                                    <option value="충북">충청북도</option>
                                    <option value="충남">충청남도</option>
                                    <option value="전남">전라남도</option>
                                    <option value="경북">경상북도</option>
                                    <option value="경남">경상남도</option>
                                    <option value="강원특별자치도">강원특별자치도</option>
                                    <option value="전북특별자치도">전북특별자치도</option>
                                    <option value="제주특별자치도">제주특별자치도</option>
                                </select>
                            </th>
                            <th class="col-select">선택</th>
                        </tr>
                    </thead>
                     <tbody id="USERLIST">
                        <c:forEach var="user" items="${userList}" varStatus="status">
                            <tr>
                                <td class="col-index"><input type="text" name="user_idx" value="${status.index + 1}" readonly></td>
                                <td class="col-id"><input type="text" name="user_id" value="${user.user_id}" readonly></td>
                                <td class="col-name"><input type="text" name="user_name" value="${user.user_name}" readonly></td>
                                <td class="col-age"><input type="text" name="user_age" value="${user.userAge}" readonly></td>
                                <td class="col-email"><input type="text" name="user_email" value="${user.user_email}" readonly></td>
                                <td class="col-phone"><input type="text" name="user_phone" class="phone-number" value="${user.user_phone}" readonly></td>
                                <td class="col-detail"><input type="text" name="user_addr" value="${user.user_addr}" readonly></td>
                                <td class="col-select"><input type="checkbox" name="selectedUsers" value="${user.user_id}" readonly></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="button-container-under">
                    <button type="submit" onclick="return confirmDelete()">DELETE</button>
                </div>
            </form>
        </div>
        <c:if test="${not empty message}">
            <div class="alert">${message}</div>
        </c:if>
    </div>
    <script>
        let originalOrder = [];
        let ageSortOrder = true;

        document.addEventListener('DOMContentLoaded', () => {
            const table = document.getElementById('USERLIST');
            originalOrder = Array.from(table.rows);
            formatPhoneNumbers();
        });

        function formatPhoneNumbers() {
            const phoneInputs = document.querySelectorAll('.phone-number');
            phoneInputs.forEach(input => {
                input.value = phoneFormatter(input.value);
            });
        }

        function phoneFormatter(num) {
            if (num.length === 11) {
                return num.slice(0, 3) + '-xxxx-' + num.slice(7);
            }
            return num; // 기본 포맷팅 실패 시 원래 번호 반환
        }

        function searchCL() {
            const searchValue = document.getElementById('search').value.toLowerCase();
            const rows = document.querySelectorAll('#USERLIST tr');

            rows.forEach(row => {
                const cells = row.getElementsByTagName('td');
                let match = false;
                for (let i = 0; i < cells.length; i++) {
                    const input = cells[i].querySelector('input');
                    if (input && input.value.toLowerCase().includes(searchValue)) {
                        match = true;
                        break;
                    }
                }
                if (match) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        }

        function handleSearchKey(event) {
            if (event.key === 'Enter') {
                searchCL();
            }
        }

        function sortTableByage(order) {
            const table = document.getElementById('USERLIST');
            const rows = Array.from(table.rows);
            const sortedRows = rows.sort((a, b) => {
                const aage = parseFloat(a.querySelector('.col-age input').value) || 0;
                const bage = parseFloat(b.querySelector('.col-age input').value) || 0;
                return order === 'asc' ? aage - bage : bage - aage;
            });
            table.innerHTML = '';
            sortedRows.forEach(row => table.appendChild(row));
        }

        function resetTableOrder() {
            const table = document.getElementById('USERLIST');
            table.innerHTML = '';
            originalOrder.forEach(row => table.appendChild(row));
        }

        function confirmDelete() {
            var selected = document.querySelectorAll("input[name='selectedUsers']:checked");
            if (selected.length === 0) {
                alert('삭제할 항목을 선택해주세요.');
                return false;
            }
            return confirm('선택한 항목을 삭제하시겠습니까?');
        }

        document.addEventListener("DOMContentLoaded", function() {
            var message = "${message}";
            if (message) {
                alert(message);
            }
        });

        function filterByCategory() {
            var filter = document.getElementById("category-filter").value.toLowerCase().trim();
            var rows = document.querySelectorAll("#USERLIST tr");

            rows.forEach(function(row) {
                var addressCell = row.querySelector("td.col-detail input[name='user_addr']");
                if (addressCell) {
                    var address = addressCell.value.toLowerCase().trim();
                    if (filter === "" || address.includes(filter)) {
                        row.style.display = "";
                    } else {
                        row.style.display = "none";
                    }
                }
            });
        }
    </script>
</body>
</html>
