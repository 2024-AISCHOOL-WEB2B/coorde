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
    <link rel="stylesheet" href="resources/assets/css/login.css">
</head>
<body>
<div class="container">
        <div class="title">OOTB</div>
        <form action="/login" method="post">
            <div class="form-group">
                <label for="id">ID</label>
                <input type="text" id="id" name="id" required>
            </div>
            <div class="form-group">
                <label for="pw">PW</label>
                <input type="password" id="pw" name="pw" required>
            </div>
            <div class="social-login">
                <div>
                    <img src="resources/assets/images/browser/kakao.png" alt="Kakao Login" title="Kakao Login"><br><br>
                    <a class="action-button" href="/loginafter.html">LOGIN</a>
                </div>
                <div>
                    <img src="resources/assets/images/browser/google.png" alt="Google Login" title="Google Login"><br><br>
                    <a class="action-button" href="/join.html">JOIN</a>
                </div>
                <div>
                    <img src="resources/assets/images/browser/naver.png" alt="Naver Login" title="Naver Login"><br><br>
                    <a class="action-button" href="javascript:find()">FIND</a>
                </div>
            </div>
        </form>
    </div>

    <script>
        function login() {
            alert("Login clicked");
        }

        function join() {
            alert("Join clicked");
        }

        function find() {
            alert("Find clicked");
        }
    </script>
</body>
</html>