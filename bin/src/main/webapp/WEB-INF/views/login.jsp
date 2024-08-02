<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>OOTB 로그인</title>
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
            height: 100vh;
            font-family: Arial, sans-serif;
        }

        .container {
            text-align: center;
        }
        
        header {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            background-color: #fff;
            border-bottom: 1px solid #ddd;
            margin-bottom: 20px;
        }

        .logo {
            text-align: center;
        }

        .title {
            font-size: 70px;
            font-weight: bold;
            margin-bottom: 70px;
            font-family: "Yellowtail", cursive;
        }

        .form-group {
            margin: 10px 0 30px;
        }

        .form-group input {
            border: none;
            border-bottom: 1px solid black;
            padding: 5px;
            width: 200px;
        }

        .social-login {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
            gap: 40px;
        }

        .social-login div {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .social-login img {
            width: 40px;
            height: 40px;
            margin-bottom: 10px;
        }

  
        .social-login button{width: 80px;
            width: 100px;
            text-decoration: none;
            color : black;
            padding: 10px 20px; /* 버튼 여백 설정 (선택 사항) */
            font-size: 16px; /* 버튼 텍스트 크기 설정 (선택 사항) */
            cursor: pointer; /* 마우스를 올렸을 때 커서가 포인터로 변경 */
            background-color: white;
            border: none;
        }

        .action-button {
            width: 40px;
            text-decoration: none;
            color : black;
            padding: 10px 20px; /* 버튼 여백 설정 (선택 사항) */
            font-size: 16px; /* 버튼 텍스트 크기 설정 (선택 사항) */
            cursor: pointer; /* 마우스를 올렸을 때 커서가 포인터로 변경 */
        }
        
            input {
            border: none;
            outline: none;
        }
    </style>
</head>
<body>
<div class="container">
        <header>
            <div class="logo">
                <a href="/myapp"><img src="resources/assets/images/browser/LOGO.jpg" alt="logo"></a>
            </div>
        </header>
        <form action="userlogin" method="post">
             <div class="form-group">
		        <label for="id">ID</label>
		        <input type="text" id="id" name="user_id" required>
		    </div>
		    <div class="form-group">
		        <label for="pw">PW</label>
		        <input type="password" id="pw" name="user_pw" required>
		    </div>
            <div class="social-login">
                <div>
                    <img src="resources/assets/images/browser/kakao.png" alt="Kakao Login" title="Kakao Login"><br><br>
                    <button type="submit">LOGIN</button>
                </div>
                <div>
                    <img src="resources/assets/images/browser/google.png" alt="Google Login" title="Google Login"><br><br>
                    <a class="action-button" href="goJoin">JOIN</a>
                </div>
                <div>
                    <img src="resources/assets/images/browser/naver.png" alt="Naver Login" title="Naver Login"><br><br>
                    <a class="action-button" href="goFind">FIND</a>
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