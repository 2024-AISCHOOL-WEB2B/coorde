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
<meta http-equiv="Cache-Control" content="no-store, no-cache, must-revalidate, max-age=0">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<meta name="author" content="Phoenixcoded" />

<link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css" />

<!-- vendor css -->
<style>

.actions {
    display: flex;
    justify-content: center;
}

.actions button {
    background: none;
    border: none;
    color: black;
    cursor: pointer;
    font-size: 20px;
    padding: 10px;
    justify-content: center;
}
#passwordModal .modal-content {
    background-color: #fefefe;
    margin: 10% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
    max-width: 500px;
}

#passwordModal .modal-title {
    text-align: center;
    font-size: 24px;
    font-weight: bold;
}

#passwordModal .modalbackcolor {
    background: whitesmoke;
    padding: 20px;
    margin-bottom: 20px;
}

#passwordModal .form-group {
    text-align: center;  /* 폼 그룹 전체는 중앙 정렬 유지 */
}

#passwordModal .form-group label {
    display: block;
    margin-bottom: 10px;
    font-weight: bold;
}

#passwordModal .form-group input[type="password"] {
    width: 90%;  /* 너비를 조금 줄임 */
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    margin-left: 10px;  /* 왼쪽 마진을 10px로 설정 */
    text-align: left;  /* 텍스트를 왼쪽 정렬 */
}

#passwordModal .actions {
    text-align: center;
    margin-top: 20px;
}

#passwordModal .actions button {
    background: none;
    border: none;
    color: black;
    cursor: pointer;
    font-size: 18px;
    padding: 10px 20px;
    margin: 0 10px;
}

#passwordModal .actions button:hover {
    text-decoration: underline;
}

* {
    margin: 0;
    padding: 0;
}

a {
    text-decoration: none;
    color: inherit;
}

input {
    border: none;
    outline: none;
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

.logo {
    margin-bottom: 20px;
}

.form-group {
    margin: 20px 0;
    text-align: center;
}

.form-group input {
    border: none;
    border-bottom: 1px solid black;
    padding: 5px;
    width: 200px;
    text-align: center;
}

.form-group-horizontal {
    display: flex;
    justify-content: center;
    gap: 50px;
    flex-wrap: wrap;
}

.left-group, .right-group, .left-group2, .right-group2 {
    display: flex;
    flex-direction: column;
    text-align: left;
}

.column {
    display: flex;
    flex-direction: column;
    gap: 10px;
}

.edit-actions  {
    margin: 30px 0;
    font-size: 20px;
    display: flex;
    justify-content: center;
    gap: 20px;
   
    
}

.edit-actions  button{
   background: none;
    border: none;
    color: black;
    cursor: pointer;
    font-size: 20px;
    padding: 10px;
    
}


.link-actions {
    margin: 30px 0;
    font-size: 20px;
    display: flex;
    justify-content: center;
    gap: 20px;
     margin-right:20px
}

.link-actions button, .link-actions a {
    background: none;
    border: none;
    color: black;
    cursor: pointer;
    font-size: 20px;
    padding: 10px;
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

.modalbackcolor {
    background: whitesmoke;
}

.subtitle {
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
    <div class="logo"><a href="/myapp"><img src="resources/assets/images/browser/LOGO.png" alt=""></a></div>
    <form id="editForm" action="/myapp/updateUser" method="post">
        <div class="form-group-horizontal">
            <div class="column">
                <div class="left-group">
                    <div class="form-group">
                        <label for="name">NAME</label>
                        <input type="text" id="name" name="user_name" value="${loginUser.user_name}" required>
                    </div>
                    <div class="form-group">
                        <label for="phone">PHONE</label>
                        <input type="tel" id="phone" name="user_phone" value="${loginUser.user_phone}" required>
                        <span id="phoneCheckResult"></span>
                    </div>
                    <div class="form-group">
                        <label for="email">EMAIL</label>
                        <input type="email" id="email" name="user_email" value="${loginUser.user_email}"
                               pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
                               title="유효한 이메일 주소를 입력해주세요 (예: example@domain.com)" required>
                    </div>
                    <div class="form-group">
                        <label for="address">ADDRESS</label>
                        <input type="text" id="address" name="user_addr" value="${loginUser.user_addr}">
                        <span class="search-icon" onclick="openModal()"><span class="lnr lnr-magnifier"></span></span>
                    </div>
                </div>
                
            </div>
            
            <div class="left-group2">
                    <div class="form-group">
                        <label for="height">HEIGHT</label>
                        <input type="number" id="height" name="user_hei" value="${loginUser.user_hei}" step="1" min="1" max="300" required title="정수만 입력해주세요 (1-300)" placeholder="정수만 입력 (cm)">
                    </div>
                    <div class="form-group">
                        <label for="weight">WEIGHT</label>
                        <input type="number" id="weight" name="user_wei" value="${loginUser.user_wei}" step="1" min="1" max="500" required title="정수만 입력해주세요 (1-500)" placeholder="정수만 입력 (kg)">
                    </div>
                </div>
            
            <div class="column">
                <div class="right-group">
                    <div class="form-group">
                        <label for="top">TOP</label>
                        <input type="text" id="top" name="user_top" value="${loginUser.user_top}" required>
                    </div>
                    <div class="form-group">
                        <label for="sh">SHOULDER</label>
                        <input type="text" id="sh" name="user_sh" value="${loginUser.user_sh}" required>
                    </div>
                    <div class="form-group">
                        <label for="ch">CHEST</label>
                        <input type="text" id="ch" name="user_ch" value="${loginUser.user_ch}" required>
                    </div>
                    <div class="form-group">
                        <label for="arm">ARM</label>
                        <input type="text" id="arm" name="user_arm" value="${loginUser.user_arm}" required>
                    </div>
                </div>
                
            </div>
            
            <div class="right-group2">
                    <div class="form-group">
                        <label for="bottom">BOTTOM</label>
                        <input type="text" id="bot" name="user_bot" value="${loginUser.user_bot}" required>
                    </div>
                    <div class="form-group">
                        <label for="waist">WAIST</label>
                        <input type="text" id="waist" name="user_waist" value="${loginUser.user_waist}" required>
                    </div>
                    <div class="form-group">
                        <label for="thighs">THIGHS</label>
                        <input type="text" id="thighs" name="user_thighs" value="${loginUser.user_thighs}" required>
                    </div>
                    <div class="form-group">
                        <label for="hem">HEM</label>
                        <input type="text" id="hem" name="user_hem" value="${loginUser.user_hem}" required>
                    </div>
                </div>
            
        </div>
         <div class="edit-actions">
        <input type="hidden" id="confirmPassword" name="confirmPassword">
        <button type="button" onclick="confirmAndSubmit()">EDIT</button>
    </div>

    </form>
     <div class="link-actions">
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

<!-- 비밀번호 확인 모달 -->
<div id="passwordModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal('passwordModal')">&times;</span>
        <h2 class="modal-title">비밀번호 확인</h2><br>
        <div class="modalbackcolor">
            <div class="form-group">
                <label for="confirmPasswordInput">비밀번호</label>
                <input type="password" id="confirmPasswordInput" name="confirmPasswordInput" class="center-text">
            </div>
        </div>
        <div class="actions">
            <button type="button" onclick="submitWithPassword()">확인</button>
            <button type="button" onclick="closeModal('passwordModal')">취소</button>
        </div>
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
    openModal('passwordModal');
}

function submitWithPassword() {
    var password = document.getElementById('confirmPasswordInput').value;
    if (password != null && password != "") {
        document.getElementById('confirmPassword').value = password;
        
        var formData = $('#editForm').serialize();
        console.log("Form data:", formData);  // 요청 데이터 로깅

        $.ajax({
            url: '/myapp/updateUser',
            type: 'POST',
            data: formData,
            dataType: 'json',
            success: function(response) {
                console.log("Response:", response);  // 응답 로깅
                if(response.status === "success") {
                    alert(response.message);
                    updatePageFields(response.updatedUser);
                } else {
                    alert("업데이트 실패: " + response.message);
                }
            },
            error: function(xhr, status, error) {
                console.error("AJAX Error:", status, error);
                console.log("Response Text:", xhr.responseText);
                alert("서버 오류가 발생했습니다.");
            }
        });
    }
    closeModal('passwordModal');
}

function updatePageFields(updatedUser) {
    $('#name').val(updatedUser.user_name);
    $('#phone').val(updatedUser.user_phone);
    $('#email').val(updatedUser.user_email);
    $('#height').val(updatedUser.user_hei);
    $('#weight').val(updatedUser.user_wei);
    $('#address').val(updatedUser.user_addr);
    // 필요한 다른 필드들도 여기에 추가
}

function openModal(modalId) {
    document.getElementById(modalId).style.display = 'block';
}

function closeModal(modalId) {
    document.getElementById(modalId).style.display = 'none';
    if (modalId === 'passwordModal') {
        document.getElementById('confirmPasswordInput').value = ''; // 입력 필드 초기화
    }
}

// ESC 키로 모달 닫기
window.addEventListener('keydown', function(event) {
    if (event.key === 'Escape') {
        closeModal('passwordModal');
    }
});

function validateName(callback) {
    var userName = $('#name').val().trim();
    
    if (/^[a-zA-Z\s]+$/.test(userName)) {
        // 영어 (알파벳 및 공백 포함)
        var nameRegex = /^[a-zA-Z\s]+$/;
        if (!nameRegex.test(userName)) {
            alert('이름은 알파벳과 공백만 입력 가능합니다.');
            $('#name').addClass('error').focus();
            callback(false);
            return;
        }
    } else if (/^[가-힣]+$/.test(userName)) {
        // 한글 (공백 포함하지 않음)
        var nameRegex = /^[가-힣]+$/;
        if (!nameRegex.test(userName)) {
            alert('한글일때는 공백 입력이 불가능합니다.');
            $('#name').addClass('error').focus();
            callback(false);
            return;
        }
    } else {
        // 그 외의 문자가 포함된 경우
        alert('이름은 영어 또는 한글로 입력해주세요.');
        $('#name').addClass('error').focus();
        callback(false);
        return;
    }
    
    $('#name').removeClass('error');
    callback(true);
}

// 폼 제출 이벤트에 이 함수를 연결
$('#editForm').submit(function(e) {
    e.preventDefault();
    validateName(function(isValid) {
        if (isValid) {
            // 여기서 confirmAndSubmit 함수를 호출하거나 폼을 제출합니다.
            confirmAndSubmit();
        }
    });
});

// 전화번호 입력 필드의 입력 이벤트 핸들러입니다.
$('#phone').on('input', function(e) {
    var input = $(this);
    var value = input.val().replace(/[^0-9]/g, ''); // 숫자만 남깁니다.

    // 11자리로 제한
    if (value.length > 11) {
        value = value.slice(0, 11);
    }

    input.val(value); // 변환된 값을 다시 입력 필드에 설정합니다.

    // 전화번호 유효성 검사 및 중복 체크를 수행합니다.
    if (value.length === 11) {
        if (!value.startsWith('010')) {
            $('#submitBtn').prop('disabled', true);
        } else {
            $.ajax({
                url: '/myapp/checkPhone',
                type: 'POST',
                data: { userPhone: value },
                success: function(response) {
                    if (response.status === 'unavailable') {
                        $('#submitBtn').prop('disabled', true);
                    } else if (response.status === 'available') {
                        $('#submitBtn').prop('disabled', false);
                    }
                }
            });
        }
    } else {
        $('#phoneCheckResult').text('');
        $('#submitBtn').prop('disabled', false);
    }
});

function validatePhone(callback) {
    var phone = $('#phone').val();
    var phoneRegex = /^010\d{8}$/;
    if (!phoneRegex.test(phone)) {
        alert('올바른 전화번호 형식이 아닙니다. 010으로 시작하는 11자리 숫자여야 합니다.');
        $('#phone').focus();
        callback(false);
        return;
    }
    callback(true);
}

// 폼 제출 이벤트에 이 함수를 연결
$('#editForm').submit(function(e) {
    e.preventDefault();
    validatePhone(function(isValid) {
        if (isValid) {
            confirmAndSubmit();
        }
    });
});

$(document).ready(function() {
    $.ajax({
        url: '/myapp/getCurrentUser',
        type: 'GET',
        dataType: 'json',
        success: function(response) {
            updatePageFields(response);
        },
        error: function(xhr, status, error) {
            console.error("Error fetching current user data:", error);
        }
    });
});
</script>
</body>
</html>