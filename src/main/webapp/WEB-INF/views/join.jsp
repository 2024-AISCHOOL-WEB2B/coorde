<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Coorde</title>
<!-- Meta -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<meta name="author" content="Phoenixcoded" />

<link rel="stylesheet"
	href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css" />

<!-- vendor css -->
<link rel="stylesheet" href="resources/assets/css/join.css">
</head>
<body>
	<div class="container">
		<header>
            <div class="logo">
                <a href="/myapp"><img src="resources/assets/images/browser/LOGO.jpg" alt="logo"></a>
            </div>
        </header>
		<form action="signUp" method="post" id="signUpForm">
			<div class="form-group">
			    <label for="id">ID</label>
			    <input type="text" id="id" name="user_id" />
			    <span class="search-icon" type="button" id="idCheckBtn"><span class="lnr lnr-magnifier"></span></span>
			    <span id="idCheckResult"></span>
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
				<label for="email">EMAIL</label> <input type="text" id="email" name="user_email" />
				<span class="validation-icon"></span>
			</div>
			<div class="form-group">
			    <label for="birth">BIRTH</label>
			    <input type="text" id="birth" name="user_birth" placeholder="YYYY-MM-DD" maxlength="10" />
			</div>
			<div class="form-group">
			    <label for="phone">PHONE</label>
			    <input type="text" id="phone" name="user_phone" placeholder="010-XXXX-XXXX" maxlength="13" />
			    <span id="phoneCheckResult"></span>
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
			    <label for="address">ADDRESS</label>
			    <input type="text" id="address" name="user_addr">
			    <span class="search-icon" onclick="openModal()"><span class="lnr lnr-magnifier"></span></span>
			</div>
			<div class="join-button">
				<button type="button" id="submitBtn">SIGN UP</button>
			</div>
			
		</form>
	</div>
	<div id="addressModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('addressModal')">&times;</span>
            <h2>주소 찾기</h2>
            <div id="daumPostcode" style="width:500px;height:500px;"></div>
        </div>
    </div>
	
    
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- Query 라이브러리를 로드합니다. 이 라이브러리는 JavaScript를 더 쉽게 사용할 수 있게 해줍니다. -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
        if(!/^[a-zA-Z0-9]+$/.test(userId)) {
            alert('아이디는 영어와 숫자로만 입력해주세요.');
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
        
        // 비밀번호와 비밀번호 확인 필드의 값이 일치하는지 확인합니다.
        var password = $('#pw').val();
        var verifyPassword = $('#verify-pw').val();
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

    // 제출 버튼 클릭 시 실행될 이벤트 핸들러입니다.
    $('#submitBtn').click(function(e) {
        e.preventDefault(); // 기본 동작 방지
        validateForm(function(isValid) {
            if (isValid) {
                $('#signUpForm').submit();
            }
        });
    });

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
});
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



</script>

</body>
</html>