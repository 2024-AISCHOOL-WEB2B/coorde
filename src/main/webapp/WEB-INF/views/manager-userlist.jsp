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
    <link rel="stylesheet" href="resources/assets/css/manager-userlist.css">
</head>
<body>
<div class="wrap">
        <div class="container">
            <h1 class="title">OOTB</h1>
            <div class="manager"><a href="manager.html">MANAGER</a></div>
            <form id="user-management-form">
                <div class="search-container">
                    <input type="text" id="search" placeholder="검색">
                    <button type="button" onclick="searchUser()"><span class="lnr lnr-magnifier"></span></button>
                </div>
                <div class="add-button-container">
                    <button type="button" onclick="addRow()">ADD</button>
                </div>
                <div class="US">USER-LIST</div>
                <table>
                    <thead>
                        <tr>
                            <th>Email</th>
                            <th>Name</th>
                            <th>Phone</th>
                            <th>Address</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody id="user-list">
                        <tr>
                            <td><input type="text" name="email" value=""></td>
                            <td><input type="text" name="name" value=""></td>
                            <td><input type="text" name="phone" value=""></td>
                            <td><input type="text" name="address" value=""></td>
                            <td><button type="button" onclick="deleteUser(this)">Delete</button></td>
                        </tr>
                        <tr>
                            <td><input type="text" name="email" value=""></td>
                            <td><input type="text" name="name" value=""></td>
                            <td><input type="text" name="phone" value=""></td>
                            <td><input type="text" name="address" value=""></td>
                            <td><button type="button" onclick="deleteUser(this)">Delete</button></td>
                        </tr>
                        <tr>
                            <td><input type="text" name="email" value=""></td>
                            <td><input type="text" name="name" value=""></td>
                            <td><input type="text" name="phone" value=""></td>
                            <td><input type="text" name="address" value=""></td>
                            <td><button type="button" onclick="deleteUser(this)">Delete</button></td>
                        </tr>
                        <tr>
                            <td><input type="text" name="email" value=""></td>
                            <td><input type="text" name="name" value=""></td>
                            <td><input type="text" name="phone" value=""></td>
                            <td><input type="text" name="address" value=""></td>
                            <td><button type="button" onclick="deleteUser(this)">Delete</button></td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
    <script>
        function searchUser() {
            const searchValue = document.getElementById('search').value.toLowerCase();
            const rows = document.querySelectorAll('#user-list tr');
            
            rows.forEach(row => {
                const cells = row.getElementsByTagName('td');
                let match = false;
                for (let i = 0; i < cells.length - 1; i++) { // 마지막 열 제외
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

        function deleteUser(button) {
            const row = button.parentNode.parentNode;
            row.parentNode.removeChild(row);
        }

        function addRow() {
            const table = document.getElementById('user-list');
            const newRow = document.createElement('tr');

            newRow.innerHTML = `
                <td><input type="text" name="email" value=""></td>
                <td><input type="text" name="name" value=""></td>
                <td><input type="text" name="phone" value=""></td>
                <td><input type="text" name="address" value=""></td>
                <td><button type="button" onclick="deleteUser(this)">Delete</button></td>
            `;

            table.appendChild(newRow);
        }
    </script>

</body>
</html>