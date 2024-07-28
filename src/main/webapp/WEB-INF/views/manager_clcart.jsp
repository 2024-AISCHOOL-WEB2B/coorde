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
    <link rel="stylesheet" href="resources/assets/css/manager_clcart.css">
</head>
<body>
<div class="wrap">
        <div class="logo"><a href="goManager"><img src="resources/assets/images/browser/LOGO.jpg" alt=""></a>
            <div class="CL-CART">CLOSET</div>
        </div>
       
        <div class="container">
            <div class="right">
                <a href="logoutUser"><button class="logout button">LOGOUT</button></a>
                <a href="goManager" class="button">MANAGER</a>
            </div>

            <form id="user-management-form">
                <div class="control-row">
                    <div class="search-container">
                        <input type="text" id="search" placeholder="검색">
                        <button type="button" onclick="searchCL()"><span class="lnr lnr-magnifier"></span></button>
                    </div>
                    
                    <div class="button-container">
                        <button type="button" onclick="deleteSelectedRows()" class="button">DELETE</button>
                    </div>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th class="col-index"></th>
                            <th class="col-name">CL_Name</th>
                            <th class="col-price">
                                <span onclick="resetTableOrder()" class="clickable">Price</span>
                                <span class="sort-arrow" onclick="sortTableByPrice('asc')">⬆</span>
                                <span class="sort-arrow" onclick="sortTableByPrice('desc')">⬇</span>
                            </th>
                            <th class="col-detail">Detail_Category
                                <select id="category-filter" onchange="filterByCategory()">
                                    <option value="">All</option>
                                    <option value="Category1">Category1</option>
                                    <option value="Category2">Category2</option>
                                    <option value="Category3">Category3</option>
                                </select>
                            </th>
                            <th class="col-select">Select</th>
                        </tr>
                    </thead>
                    <tbody id="cl_cart">
                        <tr>
                            <td class="col-index"><input type="text" name="cl_idx" value=""></td>
                            <td class="col-name"><input type="text" name="cl_name" value=""></td>
                            <td class="col-price"><input type="text" name="cl_price" value=""></td>
                            <td class="col-detail"><input type="text" name="cl_cate_detail" value=""></td>
                            <td class="col-select"><input type="checkbox" class="row-checkbox"></td>
                        </tr>
                    </tbody>
                </table>
                <div class="button-container-under">
                    <button type="button" onclick="deleteSelectedRows()" class="button">DELETE</button>
                </div>
            </form>
        </div>
    </div>
    <script>
        let originalOrder = [];
        let priceSortOrder = true; // true: 오름차순, false: 내림차순

        document.addEventListener('DOMContentLoaded', () => {
            const table = document.getElementById('cl_cart');
            originalOrder = Array.from(table.rows);
        });

        function searchCL() {
            const searchValue = document.getElementById('search').value.toLowerCase();
            const rows = document.querySelectorAll('#cl_cart tr');

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

        function sortTableByPrice(order) {
            const table = document.getElementById('cl_cart');
            const rows = Array.from(table.rows);
            const sortedRows = rows.sort((a, b) => {
                const aPrice = parseFloat(a.querySelector('.col-price input').value) || 0;
                const bPrice = parseFloat(b.querySelector('.col-price input').value) || 0;
                return order === 'asc' ? aPrice - bPrice : bPrice - aPrice;
            });
            table.innerHTML = '';
            sortedRows.forEach(row => table.appendChild(row));
        }

        function resetTableOrder() {
            const table = document.getElementById('cl_cart');
            table.innerHTML = '';
            originalOrder.forEach(row => table.appendChild(row));
        }
    </script>
</body>
</html>