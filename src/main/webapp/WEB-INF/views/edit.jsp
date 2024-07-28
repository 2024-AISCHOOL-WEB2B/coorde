<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.coorde.myapp.entity.User"%>
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
    <link rel="stylesheet" href="resources/assets/css/edit.css">
</head>
<body>

<% User loginUser = (User) session.getAttribute("loginUser"); %>

<div class="container">
        <div class="logo"><a href="/myapp"><img src="resources/assets/images/browser/LOGO.jpg" alt=""></div></a>
        <form>
            <div class="form-group">
                <label for="name">NAME</label>
                <input type="text" id="name" name="user_name">
            </div>
            <div class="form-group">
                <label for="phone">PHONE</label>
                <input type="text" id="phone" name="user_phone">
            </div>
            <div class="form-group">
                <label for="height">HEIGHT</label>
                <input type="text" id="height" name="user_hei">
            </div>  
            <div class="form-group">
                <label for="weight">WEIGHT</label>
                <input type="text" id="weight" name="user_wei">
            </div>
            <div class="form-group">
                <label for="address">ADDRESS</label>
                <input type="text" id="address" name="user_addr">
                <span class="search-icon" onclick="openModal()"><span class="lnr lnr-magnifier"></span></span>
            </div>
            <div class="form-group2">
                <label for="detail-address">DETAIL ADDRESS</label>
                <input type="text" id="detail-address" name="detail-address">
            </div>
            <div class="actions">
                <button type="button"><a href="/">EDIT</a></button>
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
                    // 검색 결과 데이터 활용
                    document.getElementById('address').value = data.address;
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
    
	       
        
    
    </script>
</body>
</html>