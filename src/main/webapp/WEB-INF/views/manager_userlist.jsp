<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 관리 페이지</title>
    <link rel="stylesheet" href="resources/assets/css/manager_userlist.css">
    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
</head>
<body>
    <div class="wrap">
        <div class="logo"><a href="goManager"><img src="resources/assets/images/browser/LOGO.jpg" alt=""></a>
            <div class="USERLIST">USER</div>
        </div>
       
        <div class="container">
            <div class="right">
                <a href="logoutUser"><button class="logout button">LOGOUT</button></a>
                <a href="goManager" class="button">MANAGER</a>
            </div>

            <form id="user-management-form" action="deleteUsers" method="POST">
                <div class="control-row">
                    <div class="search-container">
                        <input type="text" id="search" placeholder="검색">
                        <button type="button" onclick="searchCL()"><span class="lnr lnr-magnifier"></span></button>
                    </div>
                    
                    <!-- 삭제 버튼을 포함하는 div -->
				    <div class="button-container-under">
				        <!-- 클릭 시 confirmDelete 함수를 호출 -->
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
                            	<!-- 필터링을 위한 드롭다운 메뉴 -->
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
							        <option value="충청북도">충청북도</option>
							        <option value="충청남도">충청남도</option>
							        <option value="전라북도">전라북도</option>
							        <option value="전라남도">전라남도</option>
							        <option value="경상북도">경상북도</option>
							        <option value="경상남도">경상남도</option>
							        <option value="강원특별자치도">강원특별자치도</option>
							        <option value="전북특별자치도">전북특별자치도</option>
							        <option value="제주특별자치도">제주특별자치도</option>
							    </select>
							</th>
                            <th class="col-select">선택</th>
                        </tr>
                    </thead>
                    <tbody id="USERLIST">
                    <!-- 서버에서 받아온 사용자 리스트를 반복문으로 출력 -->
                    <c:forEach var="user" items="${userList}" varStatus="status">
                        <tr>
                            <td class="col-index"><input type="text" name="user_idx" value="${status.index + 1}" readonly></td>
                            <td class="col-id"><input type="text" name="user_id" value="${user.user_id}" readonly></td>
                            <td class="col-name"><input type="text" name="user_name" value="${user.user_name}" readonly></td>
							<td class="col-age"><input type="text" name="user_age" value="${user.userAge}" readonly></td>
                            <td class="col-email"><input type="text" name="user_email" value="" readonly></td>
                            <td class="col-phone"><input type="text" name="user_phone" value="${user.user_phone}" readonly></td>
                            <td class="col-detail"><input type="text" name="user_addr" value="${user.user_addr}" readonly></td>
                            <td class="col-select"><input type="checkbox" name="selectedUsers" value="${user.user_id}" readonly></td>
                        </tr>
					</c:forEach>
                    </tbody>
                </table>
                <!-- 삭제 버튼을 포함하는 div -->
			    <div class="button-container-under">
			        <!-- 클릭 시 confirmDelete 함수를 호출 -->
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
   		// 삭제 버튼을 눌렀을 때 호출되는 함수
        function confirmDelete() {
            // 선택된 체크박스들을 모두 선택
            var selected = document.querySelectorAll("input[name='selectedUsers']:checked");
            
            // 선택된 체크박스가 없으면 경고 메시지를 표시하고 함수를 종료
            if (selected.length === 0) {
                alert('삭제할 항목을 선택해주세요.');
                return false;
            }
            
            // 선택된 체크박스가 있으면 삭제 확인 메시지를 표시
            return confirm('선택한 항목을 삭제하시겠습니까?');
        }
    	 
    	// 페이지가 로드된 후 실행되는 JavaScript 코드
        document.addEventListener("DOMContentLoaded", function() {
            // 서버에서 전달된 플래시 메시지를 가져옵니다.
            var message = "${message}";
            // 메시지가 존재하는 경우 경고창(alert)을 표시합니다.
            if (message) {
                alert(message);
            }
        });

        
     	// 필터링 기능을 구현하는 함수
        function filterByCategory() {
            // 드롭다운에서 선택된 값을 가져와 소문자로 변환하고 공백을 제거
            var filter = document.getElementById("category-filter").value.toLowerCase().trim();
            
            // 사용자 리스트 테이블의 모든 행을 선택
            var rows = document.querySelectorAll("#USERLIST tr");

            // 각 행에 대해 반복 처리
            rows.forEach(function(row) {
                // 현재 행에서 'user_addr' 입력 요소를 찾음
                var addressCell = row.querySelector("td.col-detail input[name='user_addr']");
                if (addressCell) {
                    // 입력 요소의 값을 소문자로 변환하고 공백을 제거
                    var address = addressCell.value.toLowerCase().trim();
                    
                    // 필터 값이 없거나, 주소에 필터 값이 포함되어 있으면 행을 보여줌
                    if (filter === "" || address.includes(filter)) {
                        row.style.display = "";
                    } else {
                        // 필터 값이 주소에 포함되어 있지 않으면 행을 숨김
                        row.style.display = "none";
                    }
                }
            });
        }
    </script>
</body>
</html>


