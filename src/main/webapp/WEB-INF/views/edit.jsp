<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.coorde.myapp.entity.User"%>
<!DOCTYPE html>
<html>
<head>
<title>OOTB 정보수정</title>
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
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400..700&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400..700&family=Yellowtail&display=swap');

        * {
            margin: 0;
            padding: 0;
        }
        a {
            text-decoration: none;
            color: inherit;
        }


body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100%;
    font-family: Arial, sans-serif;
}
.container {
    text-align: center;
}


.logo{
    margin-bottom: 20px ;
}

.form-group {
    margin: 20px 0;
    text-align: center;
}

.form-group2 input {
    border: none;
    border-bottom: 1px solid black;
    padding: 5px;
    width: 200px;
    margin-right: 80px;
    text-align: center;
}


.form-group input {
    border: none;
    border-bottom: 1px solid black;
    padding: 5px;
    width: 200px;
    text-align: center;
}

.form-group#detail-address-group {
    margin-left: 50px;
}

.form-group .search-icon {
    cursor: pointer;
}
.actions {
    margin: 30px 0 ;
    font-size: 20px;
    display: flex;
    justify-content: center;
    gap: 20px; /* 링크 사이의 간격을 설정 */
}

.actions button, .actions a {
    background: none;
    border: none;
    color: black;
    cursor: pointer;
    font-size: 20px;
    padding: 10px; /* 간격을 더 추가하고 싶다면 패딩을 추가 */
}


/* 수평 정렬 */
.form-group-horizontal {
    display: flex;
    justify-content: center;
    gap: 20px;
    align-items: center;
}

/* 모달 스타일 */
.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgb(0,0,0);
    background-color: rgba(0,0,0,0.4);
}

.modal-content {
    background-color: #fefefe;
    margin: 10% auto;
    padding: 10px;
    border: 1px solid #888;
    width: 80%;
    max-width: 500px;
    text-align: left; /* 모달 내용 왼쪽 정렬 */
}

.modal-title {
    text-align: center; /* 제목 가운데 정렬 */
}

.modalbackcolor{
    background: whitesmoke;
}

.subtitle{
    background-color: whitesmoke;
    font-size: 25px;
    font-weight: bold;
    margin-bottom: 20px;
}

.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}

#leaveModal .form-group label {
    display: block;
    margin-bottom: 20px;
    font-weight: bold;
}

#leaveModal .form-group input[type="text"],
#leaveModal .form-group input[type="password"] {
    padding: 10px;
    margin-bottom: 20px;
    border: 1px solid #ddd;
    border-radius: 5px;
}

#leaveModal .form-group div {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
}

#leaveModal .form-group div label {
    margin-bottom: 10px;
}
    </style>
</head>
<body>

<% User loginUser = (User) session.getAttribute("loginUser"); %>

<div class="container">
        <div class="logo"><a href="/myapp"><img src="resources/assets/images/browser/LOGO.png" alt=""></div></a>
        <form id="editForm" action="/myapp/updateUser" method="post">
	        <div class="form-group">
			    <label for="name">NAME</label>
			    <input type="text" id="name" name="user_name" value="${loginUser.user_name}" 
			           pattern="[A-Za-z ]+" title="문자와 공백만 입력 가능합니다" required>
			</div>
	        <div class="form-group">
			    <label for="phone">PHONE</label>
			    <input type="tel" id="phone" name="user_phone" value="${loginUser.user_phone}"
			           pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" 
			           title="전화번호는 000-0000-0000 형식으로 입력해주세요"
			           required>
			</div>
	        <div class="form-group">
			    <label for="email">EMAIL</label>
			    <input type="tel" id="email" name="user_email" value="${loginUser.user_email}"
			           pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
           			   title="유효한 이메일 주소를 입력해주세요 (예: example@domain.com)"
			           required>
			</div>
	        <div class="form-group">
			    <label for="height">HEIGHT</label>
			    <input type="number" id="height" name="user_hei" value="${loginUser.user_hei}"
			           step="1" min="1" max="300" required
			           title="정수만 입력해주세요 (1-300)"
			           placeholder="정수만 입력 (cm)">
			</div>
			<div class="form-group">
			    <label for="weight">WEIGHT</label>
			    <input type="number" id="weight" name="user_wei" value="${loginUser.user_wei}"
			           step="1" min="1" max="500" required
			           title="정수만 입력해주세요 (1-500)"
			           placeholder="정수만 입력 (kg)">
			</div>
	        <div class="form-group">
			    <label for="address">ADDRESS</label>
			    <input type="text" id="address" name="user_addr" value="${loginUser.user_addr}">
			    <span class="search-icon" onclick="openModal()"><span class="lnr lnr-magnifier"></span></span>
			</div>
	        <div class="actions">
	            <input type="hidden" id="confirmPassword" name="confirmPassword">
    			<button type="button" onclick="confirmAndSubmit()">EDIT</button>
	        </div>
	    </form>
        <div class="actions">
            <a href="logoutUser">LOGOUT</a>
            <a href="gomyPage">MYPAGE</a>
            <button type="button" onclick="openLeaveModal()">LEAVE</button>
        </div>
    </div>

    <div id="addressModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('addressModal')">&times;</span>
            <h2>주소 찾기</h2>
            <div id="daumPostcode" style="width:500px;height:500px;"></div>
        </div>
    </div>

    <div id="leaveModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('leaveModal')">&times;</span>
            <h2 class="modal-title">회원정보 탈퇴신청</h2><br>
            <form id="leaveForm" onsubmit="handleSubmit(event)">
			    <div class="modalbackcolor">
			        <div class="form-group-horizontal">
			            <div class="form-group">
			                <label for="leave-pw">PW</label>
			                <input type="password" id="leave-pw" name="leave_pw" class="center-text">
			            </div>
			            <div class="form-group">
			                <label for="pw-verify">PW VERIFY</label>
			                <input type="password" id="pw-verify" name="pw_verify" class="center-text">
			            </div>
			        </div>
			    </div>
			    <div class="form-group">
			        <label class="subtitle">탈퇴 사유</label>
			        <div>
			            <label><input type="radio" name="reason" value="rejoin"> 탈퇴 후 재가입</label>
			            <label><input type="radio" name="reason" value="dissatisfaction"> 배송 불만</label>
			            <label><input type="radio" name="reason" value="variety"> 상품의 다양성/가격 품질 불만</label>
			            <label><input type="radio" name="reason" value="site-usage"> 사이트 이용 불편</label>
			            <label><input type="radio" name="reason" value="infrequent"> 이용 빈도 낮음</label>
			        </div>
			    </div>
			    <div class="actions">
			        <button type="submit" id="leaveButton">회원탈퇴</button>
			        <button type="button" onclick="closeModal('leaveModal')">취소하기</button>
			    </div>
			</form>		
        </div>
    </div>

    <a href=""></a>

    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        // 모달 열기
        function openModal() {
            document.getElementById('addressModal').style.display = 'block';
            openDaumPostcode();
        }

        // 모달 닫기
        function closeModal(modalId) {
            document.getElementById(modalId).style.display = 'none';
        }

        // 카카오 주소 검색 API 호출
        function openDaumPostcode() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		            var addr = data.address;
		            document.getElementById("address").value = addr;
		            document.getElementById("address").focus();
		            closeModal('addressModal');
		        }
		    }).embed(document.getElementById('daumPostcode'));
		}
        
        // 탈퇴 모달 열기
        function openLeaveModal() {
            document.getElementById('leaveModal').style.display = 'block';
        }

        // 탈퇴 완료 알림창 표시 및 페이지 이동
       	function handleSubmit(event) {
		    // 기본 폼 제출 동작을 중단
		    event.preventDefault();
		
		    // 입력된 비밀번호와 비밀번호 확인 값을 가져옴
		    var pw = document.getElementById('leave-pw').value;
		    var pwVerify = document.getElementById('pw-verify').value;
		
		    // 비밀번호와 비밀번호 확인이 일치하는지 검사
		    if (pw !== pwVerify) {
		        alert('비밀번호가 일치하지 않습니다.');
		        return;
		    }
		
		    // 사용자에게 최종 확인
		    if (confirm('정말로 탈퇴하시겠습니까?')) {
		        // AJAX를 사용하여 서버에 비동기 요청
		        $.ajax({
		            url: '/myapp/deleteUser',  // 요청을 보낼 서버의 URL
		            type: 'POST',              // HTTP 메서드
		            data: { password: pw },    // 서버로 전송할 데이터
		            
		            // 요청 성공 시 실행될 콜백 함수
		            success: function(result) {
		                if (result === "success") {
		                    // 탈퇴 성공 시
		                    alert('탈퇴가 완료되었습니다.');
		                    window.location.href = '/myapp';  // 메인 페이지로 리다이렉트
		                } else {
		                    // 서버에서 실패 응답을 받았을 때
		                    alert('탈퇴 처리 중 오류가 발생했습니다.');
		                }
		            },
		            
		            // 요청 실패 시 실행될 콜백 함수
		            error: function(xhr, status, error) {
		                // 오류 정보를 콘솔에 출력 (디버깅용)
		                console.error('AJAX 오류:', status, error);
		                // 사용자에게 오류 메시지 표시
		                alert('서버와의 통신 중 오류가 발생했습니다.');
		            }
		        });
		    }
		}
        
       	function confirmAndSubmit() {
       	    var password = prompt("비밀번호를 입력하세요:");
       	    if (password != null && password != "") {
       	        document.getElementById('confirmPassword').value = password;
       	        
       	        $.ajax({
       	            url: '/myapp/updateUser',
       	            type: 'POST',
       	            data: $('#editForm').serialize(),
       	            success: function(response) {
       	                if(response.status === "success") {
       	                    alert("프로필이 성공적으로 업데이트되었습니다.");
       	                    window.location.href = '/myapp/goEdit'; // 페이지를 새로고침하는 대신 편집 페이지로 리다이렉트
       	                } else {
       	                    alert("업데이트 실패: " + response.message);
       	                }
       	            },
       	            error: function() {
       	                alert("서버 오류가 발생했습니다.");
       	            }
       	        });
       	    }
       	}
    
    </script>
</body>
</html>