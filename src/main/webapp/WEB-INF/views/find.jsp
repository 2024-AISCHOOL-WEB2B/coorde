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
    <link rel="stylesheet" href="resources/assets/css/find.css">
</head>
<body>
<div class="container">
        <div class="header">OOTB</div>
        <div class="top-nav">
            <a href="gologin">LOGIN</a>
        </div>
        <p>FIND</p>
        <div class="forms-container">
            <div class="form-box">
                <form id="id-find-form" action="idFind" method="post">
                    <label for="name">NAME<input type="text" id="user_name" name="user_name"></label>
                    <label for="birth">BIRTH<input type="text" id="user_birth" name="user_birth"></label>
                    <label for="phone">PHONE<input type="text" id="user_phone" name="user_phone"></label>
                    <button class="submit-btn">ID FIND</button>
                </form>
            </div>
            <%
			    String findId = (String) request.getAttribute("findId");
			%>
            <div class="form-box">
                <form id="pw-find-form" action="pwFind" method="post">
                    <label for="id">ID<input type="text" id="user_id" name="user_id"></label>
                    <label for="name-pw">NAME<input type="text" id="name-pw" name="user_name"></label>
                    <label for="birth-pw">BIRTH<input type="text" id="birth-pw" name="user_birth"></label>
                    <label for="phone-pw">PHONE<input type="text" id="phone-pw" name="user_phone"></label>
                    <button class="submit-btn">PW FIND</button>
                </form>
            </div>
            <%
			    String findPw = (String) request.getAttribute("findPw");
			%>
        </div>
    </div>

    <script>
		window.onload = function() {
		    var findId = '<%= findId %>';
		    if (findId && findId.trim().length > 0) {
		        alert("찾은 ID: " + findId);
		    } else {
		        alert("ID를 찾을 수 없습니다.");
		    }
		};
		window.onload = function() {
		    var findPw = '<%= findPw %>';
		    if (findPw && findPw.trim().length > 0) {
		        alert("찾은 PW: " + findPw);
		    } else {
		        alert("ID를 찾을 수 없습니다.");
		    }
		};

        function formatBirthDate(birth) {
            // 19961205 -> 1996-12-05
            if (birth.length === 8) {
                return birth.slice(0, 4) + '-' + birth.slice(4, 6) + '-' + birth.slice(6);
            }
            return birth;
        }

        function formatPhoneNumber(phone) {
            // 01050903484-> 010-5090-3484
            if (phone.length === 11) {
                return phone.slice(0, 3) + '-' + phone.slice(3, 7) + '-' + phone.slice(7);
            }
            return phone;
        }

    </script>

</body>
</html>