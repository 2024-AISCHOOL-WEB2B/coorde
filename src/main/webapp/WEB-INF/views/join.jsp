<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>OOTB 회원가입</title>
<!-- Meta -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<meta name="author" content="Phoenixcoded" />

<link rel="stylesheet"
	href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css" />

<style>
input {
	border: none;
	outline: none;
}
@import url('https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400..700&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400..700&family=Yellowtail&display=swap');

body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    font-family: Arial, sans-serif;
    margin: 0;
    background-color: white;
    color: black;
}
.container {
    text-align: center;
    display: flex;
    flex-direction: column;
    align-items: center;
}
header {
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 20px;
    background-color: #fff;
    border-bottom: 1px solid #ddd;
}

.logo {
    text-align: center;
}
form {
    display: inline-block;
    text-align: left;
    margin-right: 100px;
    margin-top: 20px;
}
.form-group {
    margin-bottom: 15px;
    position: relative;
}
.form-group label {
    display: inline-block;
    width: 100px;
    text-align: right;
    margin-right: 10px;
}
.form-group input[type="text"],
.form-group input[type="password"] {
    width: 200px;
    border: none;
    border-bottom: 1px solid black;
    padding: 5px;
    background-color: white;
}
/* .form-group .search-icon {
    position: absolute;
    right: 0;
    top: 0;
    bottom: 0;
    margin: auto;
} */
.form-group .search-icon {
    cursor: pointer;
}
.form-group input[type="submit"] {
    width: 100%;
    padding: 10px 20px;
    background-color: white;
    color: black;
    border: 1px solid black;
    cursor: pointer;
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
}
.join-button {
    margin-top: 20px;
    margin-left: 60px;
}
.join-button button {
    background-color: white;
    color: black; /* 텍스트 색상은 검정으로 설정 */
    border: none;
    padding: 10px 20px; /* 버튼 여백 설정 (선택 사항) */
    font-size: 16px; /* 버튼 텍스트 크기 설정 (선택 사항) */
    cursor: pointer; /* 마우스를 올렸을 때 커서가 포인터로 변경 */
    display: block;
    margin: 0 auto;
}

/* 버튼에 마우스를 올렸을 때 효과 (선택 사항) */
.join-button button:hover {
    background-color: #f0f0f0;
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



</style>

</head>
<body>
	<div class="container">
		<header>
			<div class="logo">
				<a href="/myapp"><img
					src="resources/assets/images/browser/LOGO.png" alt="logo"></a>
			</div>
		</header>
		<form id="signUpForm">
			<div class="form-group">
				<label for="id">ID</label> <input type="text" id="id" name="user_id" />
				<span class="search-icon" type="button" id="idCheckBtn"><span
					class="lnr lnr-magnifier"></span></span> <span id="idCheckResult"></span>
			</div>
			<div class="form-group">
				<label for="pw">PW</label> <input type="password" id="pw"
					name="user_pw" />
			</div>
			<div class="form-group">
				<label for="verify-pw">VERIFY PW</label> <input type="password"
					id="verify-pw" name="verify-pw" />
			</div>
			<div class="form-group">
				<label for="name">NAME</label> <input type="text" id="name"
					name="user_name" />
			</div>
			<div class="form-group">
				<label for="email">EMAIL</label> <input type="text" id="email"
					name="user_email" /> <span class="validation-icon"></span>
			</div>
			<div class="form-group">
				<label for="birth">BIRTH</label> <input type="text" id="birth"
					name="user_birth" placeholder="YYYY-MM-DD" maxlength="10" />
			</div>
			<div class="form-group">
				<label for="phone">PHONE</label> <input type="text" id="phone"
					name="user_phone" placeholder="010-XXXX-XXXX" maxlength="13" /> <span
					id="phoneCheckResult"></span>
			</div>
			<div class="form-group">
				<label for="height">HEIGHT</label> <input type="text" id="height"
					name="user_hei" />
			</div>
			<div class="form-group">
				<label for="weight">WEIGHT</label> <input type="text" id="weight"
					name="user_wei" />
			</div>
			<div class="form-group">
				<label for="address">ADDRESS</label> <input type="text" id="address"
					name="user_addr"> <span class="search-icon"
					onclick="openModal()"><span class="lnr lnr-magnifier"></span></span>
			</div>
			<div class="join-button">
				<button id="submitBtn" type="button">Sign up</button>
			</div>

		</form>
	</div>
	<div id="addressModal" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeModal('addressModal')">&times;</span>
			<h2>주소 찾기</h2>
			<div id="daumPostcode" style="width: 500px; height: 500px;"></div>
		</div>
	</div>


	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- Query 라이브러리를 로드합니다. 이 라이브러리는 JavaScript를 더 쉽게 사용할 수 있게 해줍니다. -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
//모달 열기
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

//생년월일 형식 지정 함수
function formatBirthDate() {
    var input = $(this);
    var value = input.val();
    value = value.replace(/[^\d-]/g, '');
    
    if (value.length > 4 && value.charAt(4) !== '-') {
        value = value.slice(0, 4) + '-' + value.slice(4);
    }
    if (value.length > 7 && value.charAt(7) !== '-') {
        value = value.slice(0, 7) + '-' + value.slice(7);
    }
    
    input.val(value);

    if (value.length === 10) {
        if (!isValidDate(value)) {
            alert('올바르지 않은 날짜입니다. 다시 입력해주세요.');
            input.val('').focus();
        }
    }
}

function isValidDate(dateString) {
    // YYYY-MM-DD 형식인지 확인
    if(!/^\d{4}-\d{2}-\d{2}$/.test(dateString)) return false;

    // 문자열을 Date 객체로 변환
    var parts = dateString.split("-");
    var year = parseInt(parts[0], 10);
    var month = parseInt(parts[1], 10) - 1;
    var day = parseInt(parts[2], 10);
    var date = new Date(year, month, day);

    // 입력된 년, 월, 일이 유효한지 확인
    return date.getFullYear() === year && date.getMonth() === month && date.getDate() === day;
}

//이메일 유효성을 검사하는 함수
function isValidEmail(email) {
    var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
    return emailRegex.test(email);
}

function isValidPassword(password) {
    // 최소 8자 이상, 최소 하나의 숫자, 하나의 영문자, 하나의 특수문자를 포함하는지 확인하는 정규 표현식
    var passwordRegex = /^(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*()_+]).{8,}$/;
    return passwordRegex.test(password);
}

function isValidHeight(height) {
    var heightRegex = /^[0-9]+$/;
    return heightRegex.test(height);
}

function isValidWeight(weight) {
    var weightRegex = /^[0-9]+$/;
    return weightRegex.test(weight);
}



// 문서가 완전히 로드된 후에 실행될 코드를 정의합니다.
$(document).ready(function() {
    // ID 중복 체크를 수행하는 함수입니다.
    function checkUserId(callback) {
        // 'id' 입력 필드의 값을 가져옵니다.
        var userId = $('#id').val();
        
        // ID가 비어있는지 확인합니다.
        if(userId.trim() === '') {
            alert('ID를 입력해주세요.'); // 경고 메시지를 표시합니다.
            $('#id').focus(); // ID 입력 필드에 포커스를 줍니다.
            callback(false); // 콜백 함수에 false를 전달하여 유효하지 않음을 알립니다.
            return;
        }
        
        // 정규 표현식을 사용하여 ID가 영문자와 숫자로만 이루어져 있는지 확인합니다.
        if(!/^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]+$/.test(userId)) {
            alert('아이디는 영어와 숫자가 모두 포함되어 있는 값으로 입력해주세요.');
            $('#id').focus();
            callback(false);
            return;
        }
        
        // AJAX를 사용하여 서버에 ID 중복 체크를 요청합니다.
        $.ajax({
            url: 'checkUserId', // 요청을 보낼 서버의 URL
            type: 'POST', // HTTP 요청 방식
            data: { userId: userId }, // 서버로 보낼 데이터
            success: function(response) { // 요청이 성공했을 때 실행될 함수
                if(response === 'available') {
                    // ID가 사용 가능한 경우
                    callback(true);
                } else if(response === 'unavailable') {
                    // ID가 이미 사용 중인 경우
                    alert('이미 사용중인 아이디입니다.'); // 알림창으로 메시지 표시
                    callback(false);
                } else {
                    // 기타 오류 상황
                    alert('잘못된 아이디 형식입니다.');
                    callback(false);
                }
            },
            error: function(xhr, status, error) { // 요청이 실패했을 때 실행될 함수
                console.error('AJAX 오류:', status, error);
                alert('서버 오류가 발생했습니다. 잠시 후 다시 시도해주세요.');
                callback(false);
            }
        });
    }

    // 폼의 전체 유효성을 검사하는 함수입니다.
    function validateForm(callback) {
        var isValid = true;
        var firstEmptyField = null;
        
        // 폼 내의 모든 입력 필드를 검사합니다.
        $('#signUpForm input').each(function() {
            if ($(this).val().trim() === '') {
                isValid = false;
                if (!firstEmptyField) {
                    firstEmptyField = $(this);
                }
                $(this).addClass('error'); // 빈 필드에 'error' 클래스를 추가합니다.
            } else {
                $(this).removeClass('error');
            }
        });
        
        // 빈 필드가 있으면 사용자에게 알립니다.
        if (!isValid) {
            var fieldName = firstEmptyField.prev('label').text();
            alert(fieldName + ' 필드를 입력해주세요.');
            firstEmptyField.focus();
            callback(false);
            return;
        }
        
        var nameRegex;
        var userName = $('#name').val();

        if (/^[a-zA-Z\s]+$/.test(userName)) {
            // 영어 (알파벳 및 공백 포함)
            nameRegex = /^[a-zA-Z\s]+$/;
            if (!nameRegex.test(userName)) {
                alert('이름은 알파벳과 공백만 입력 가능합니다.');
                $('#name').addClass('error').focus();
                callback(false);
                return;
            }
        } else if (/^[가-힣]+$/.test(userName)) {
            // 한글 (공백 포함하지 않음)
            nameRegex = /^[가-힣]+$/;
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

        // 유효성 검사를 통과한 경우
        $('#name').removeClass('error');
        
        
        // 비밀번호와 비밀번호 확인 필드의 값이 일치하는지 확인합니다.
        var password = $('#pw').val();
        var verifyPassword = $('#verify-pw').val();
        // 비밀번호 유효성 검사
        if (!isValidPassword(password)) {
            alert('비밀번호는 숫자, 영문자, 특수문자를 모두 포함하여 8자 이상이어야 합니다.');
            $('#pw').addClass('error').focus();
            return;
        }

        if (password !== verifyPassword) {
            alert('비밀번호를 확인해주세요.');
            $('#verify-pw').addClass('error').focus();
            callback(false);
            return;
        } else {
            $('#pw, #verify-pw').removeClass('error');
        }
        
        // 전화번호가 올바른 형식인지 확인합니다.
        var phoneRegex = /^010-\d{4}-\d{4}$/;
        var phone = $('#phone').val();
        if (!phoneRegex.test(phone)) {
            alert('올바른 전화번호 형식이 아닙니다.');
            $('#phone').focus();
            callback(false);
            return;
        }
        
     	// 이메일 유효성 검사
        var email = $('#email').val();
        if (!isValidEmail(email)) {
            alert('유효한 이메일 주소를 입력해주세요.');
            $('#email').focus();
            callback(false);
            return;
        }
        
        var height = $('#height').val();
        var weight = $('#weight').val();

        if (!isValidHeight(height)) {
            alert('키는 숫자로만 입력해주세요.');
            $('#height').addClass('error').focus();
            return;
        }

        if (!isValidWeight(weight)) {
            alert('몸무게는 숫자로만 입력해주세요.');
            $('#weight').addClass('error').focus();
            return;
        }

        
     	// ID 중복 체크를 수행합니다.
        checkUserId(function(isValidId) {
            if (isValidId) {
                callback(true);
            } else {
                $('#id').focus();
                callback(false);
            }
        });
    }

   



    // ID 중복 체크 버튼 클릭 시 실행될 이벤트 핸들러입니다.
    $('#idCheckBtn').click(function() {
        checkUserId(function(isValid) {
            if (isValid) {
                alert('사용 가능한 아이디입니다.');
            }
            // isValid가 false일 경우, checkUserId 함수 내에서 이미 alert를 띄웠으므로 여기서는 추가 작업이 필요 없습니다.
        });
    });

    // 생년월일 입력 필드의 입력 이벤트 핸들러입니다.
   $('#birth').on('input', function(e) {
    var input = $(this);
    var value = input.val();
    // 숫자와 하이픈만 남기고 모든 문자를 제거합니다.
    value = value.replace(/[^\d-]/g, '');
    
    // YYYY-MM-DD 형식으로 자동으로 하이픈을 추가합니다.
    if (value.length > 4 && value.charAt(4) !== '-') {
        value = value.slice(0, 4) + '-' + value.slice(4);
    }
    if (value.length > 7 && value.charAt(7) !== '-') {
        value = value.slice(0, 7) + '-' + value.slice(7);
    }
    
    input.val(value); // 변환된 값을 다시 입력 필드에 설정합니다.

    // 입력이 완료되었을 때 (길이가 10인 경우) 유효성을 검사합니다.
    if (value.length === 10) {
        if (!isValidDate(value)) {
            alert('올바르지 않은 날짜입니다. 다시 입력해주세요.');
            input.val(''); // 입력 필드를 비웁니다.
            input.focus(); // 입력 필드에 포커스를 줍니다.
        }
    }
});

    // 폼 제출 시 생년월일 형식을 변경하는 이벤트 핸들러입니다.
    $('form').on('submit', function(e) {
        var birthInput = $('#birth');
        // 하이픈을 모두 제거하여 YYYYMMDD 형식으로 변경합니다.
        var birthValue = birthInput.val().replace(/-/g, '');
        birthInput.val(birthValue);
    });

    // 전화번호 입력 필드의 입력 이벤트 핸들러입니다.
    $('#phone').on('input', function(e) {
        var input = $(this);
        var value = input.val().replace(/[^0-9]/g, ''); // 숫자만 남깁니다.
        
        // 010-XXXX-XXXX 형식으로 자동으로 하이픈을 추가합니다.
        if(value.length > 3 && value.length <= 7) {
            value = value.slice(0,3) + "-" + value.slice(3);
        } else if(value.length > 7) {
            value = value.slice(0,3) + "-" + value.slice(3,7) + "-" + value.slice(7);
        }
        
        input.val(value); // 변환된 값을 다시 입력 필드에 설정합니다.
        
     	// 전화번호 중복 체크를 수행합니다.
        if (value.length === 13) {
            $.ajax({
                url: 'checkPhone',
                type: 'POST',
                data: { userPhone: value },
                success: function(response) {
                    if (response.status === 'unavailable') {
                    	alert('이미 등록된 번호입니다.');
                        $('#submitBtn').prop('disabled', true);
                    } else if (response.status === 'available') {
                        $('#phoneCheckResult').text('');
                        $('#submitBtn').prop('disabled', false);
                    } else {
                        alert('잘못된 번호 형식입니다.');
                        callback(false);
                    }
                }
            });
        } else {
            $('#phoneCheckResult').text('');
            $('#submitBtn').prop('disabled', false);
        }
    });
    
    
    
    
    
    
    // 추가ㅣ
  //이메일 입력 필드 유효성 검사 및 아이콘 표시 함수
    function validateEmail() {
        var email = $(this).val();
        var $validationIcon = $(this).siblings('.validation-icon');
        
        if (email.trim() === '') {
            $validationIcon.hide();
            return;
        }

        if (isValidEmail(email)) {
            $validationIcon.removeClass('invalid').addClass('valid').show();
            $(this).removeClass('error');
        } else {
            $validationIcon.removeClass('valid').addClass('invalid').show();
            $(this).addClass('error');
        }
    }

    $('#submitBtn').click(function(e) {
        e.preventDefault(); 

        validateForm(function(isValid) {
            if (isValid) {
                $.ajax({
                    url: 'http://localhost:5000/predict',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify({
                        weight: $('#weight').val(),
                        height: $('#height').val()
                    }),
                    success: function(response) {
                        console.log('서버 응답:', response);

                        $.ajax({
                            url: 'signUp',
                            type: 'POST',
                            contentType: 'application/json',
                            data: JSON.stringify({
                                user_id: $('#id').val(),
                                user_pw: $('#pw').val(),
                                user_name: $('#name').val(),
                                user_birth: $('#birth').val().replace(/-/g, ''),
                                user_phone: $('#phone').val().replace(/-/g, ''),
                                user_hei: $('#height').val(),
                                user_wei: $('#weight').val(),
                                user_addr: $('#address').val(),
                                user_email: $('#email').val(),
                                user_arm: response.arm,
                                user_top: response.top,
                                user_sh: response.shoulder,
                                user_ch: response.chest,
                                user_waist: response.waist,
                                user_thighs: response.thigh,
                                user_bot: response.bottom,
                                user_hem: response.hem
                            }),
                            success: function(signUpResponse) {
                                console.log('회원 가입 성공:', signUpResponse);
                                
                                // 회원 가입 성공 후 리다이렉션을 처리합니다.
                                if (typeof signUpResponse === 'string') {
                                	let signUpResponse = "http://localhost:8081/myapp/";
                                    try {
                                        new URL(signUpResponse); 
                                        window.location.href = signUpResponse; 
                                    } catch (e) {
                                        console.error('유효하지 않은 리다이렉트 URL:', signUpResponse);
                                    }
                                } else {
                                    // 기타 처리
                                    $('#submitBtn').closest('form').submit();
                                }
                            },
                            error: function(xhr, status, error) {
                                console.error('회원 가입 에러 발생:', error);
                            }
                        });
                    },
                    error: function(xhr, status, error) {
                        console.error('에러 발생:', error);
                    }
                });
            }
        });
    });
    
    
    
    
    
    
    
    
    
});




</script>

</body>
</html>