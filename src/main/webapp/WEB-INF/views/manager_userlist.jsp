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
    <link rel="stylesheet" href="resources/assets/css/manager_userlist.css">
</head>
<body>
<div class="wrap">
        <div class="logo"><img src="resources/assets/images/browser/LOGO.jpg" alt="">
            <div class="USERLIST">USER</div>
        </div>
       
        <div class="container">
            <div class="right">
                <a href="/main.html"><button class="logout button">LOGOUT</button></a>
                <a href="manager.html" class="button">MANAGER</a>
            </div>

            <form id="user-management-form">
                <div class="control-row">
                    <div class="search-container">
                        <input type="text" id="search" placeholder="검색">
                        <button type="button" onclick="searchCL()"><span class="lnr lnr-magnifier"></span></button>
                    </div>
                    
                    <div class="button-container">
                        <button type="button" onclick="addRow()" class="button">ADD</button>
                        <button type="button" onclick="deleteSelectedRows()" class="button">DELETE</button>
                    </div>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th class="col-index"></th>
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
                                    <option value="인천광역시">인천광역시</option>
                                    <option value="광주광역시">광주광역시</option>
                                    <option value="부산광역시">부산광역시</option>
                                </select>
                            </th>
                            <th class="col-select">선택</th>
                        </tr>
                    </thead>
                    <tbody id="USERLIST">
                        <tr>
                            <td class="col-index"><input type="text" name="user_idx" value=""></td>
                            <td class="col-name"><input type="text" name="user_name" value=""></td>
                            <td class="col-age"><input type="text" name="user_age" value=""></td>
                            <td class="col-email"><input type="text" name="user_email" value=""></td>
                            <td class="col-phone"><input type="text" name="user_phone" value=""></td>
                            <td class="col-detail"><input type="text" name="user_addr" value=""></td>
                            <td class="col-select"><input type="checkbox" class="row-checkbox"></td>
                        </tr>
                    </tbody>
                </table>
                <div class="button-container-under">
                    <button type="button" onclick="addRow()" class="button">ADD</button>
                    <button type="button" onclick="deleteSelectedRows()" class="button">DELETE</button>
                </div>
            </form>
        </div>
    </div>
    <script>
        let originalOrder = [];
        let ageSortOrder = true; // true: 오름차순, false: 내림차순

        document.addEventListener('DOMContentLoaded', () => {
            const table = document.getElementById('USERLIST');
            originalOrder = Array.from(table.rows);
        });

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

        function addRow() {
            const table = document.getElementById('USERLIST');
            const newRow = document.createElement('tr');

            newRow.innerHTML = `
                <td class="col-index"><input type="text" name="user_idx" value=""></td>
                <td class="col-name"><input type="text" name="user_name" value=""></td>
                <td class="col-age"><input type="text" name="user_age" value=""></td>
                <td class="col-email"><input type="text" name="user_email" value=""></td>
                <td class="col-phone"><input type="text" name="user_phone" value=""></td>
                <td class="col-detail"><input type="text" name="user_addr" value=""></td>
                <td class="col-select"><input type="checkbox" class="row-checkbox"></td>
            `;

            table.appendChild(newRow);
            originalOrder.push(newRow);
        }

        function deleteSelectedRows() {
            const checkboxes = document.querySelectorAll('.row-checkbox:checked');
            checkboxes.forEach(checkbox => {
                const row = checkbox.closest('tr');
                const index = originalOrder.indexOf(row);
                if (index > -1) {
                    originalOrder.splice(index, 1);
                }
                row.remove();
            });
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

        function filterByCategory() {
            const filterValue = document.getElementById('category-filter').value.toLowerCase();
            const rows = document.querySelectorAll('#USERLIST tr');

            rows.forEach(row => {
                const category = row.querySelector('.col-detail input').value.toLowerCase();
                if (filterValue === '' || category.includes(filterValue)) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        }
    </script>
</body>
</html>