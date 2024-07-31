<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>OOTB 로그인</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="author" content="Phoenixcoded" />

    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css" />

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
            cursor: pointer;
        }

        .social-login button {
            width: 100px;
            text-decoration: none;
            color: black;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            background-color: white;
            border: none;
        }

        .action-button {
            width: 40px;
            text-decoration: none;
            color: black;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
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
            <a href="/myapp"><img src="resources/assets/images/browser/LOGO.png" alt="logo"></a>
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
                <img src="resources/assets/images/browser/kakao.png" alt="Kakao Login" title="Kakao Login" id="kakao-login-btn"><br><br>
                <button type="submit">LOGIN</button>
            </div>
            <div>
                <img src="resources/assets/images/browser/google.png" alt="Google Login" title="Google Login" id="google-login-img"><br><br>
                <a class="action-button" href="goJoin">JOIN</a>
            </div>
            <div>
                <img src="resources/assets/images/browser/naver.png" alt="Naver Login" title="Naver Login" id="naver-login-btn"><br><br>
                <a class="action-button" href="goFind">FIND</a>
            </div>
        </div>
    </form>
</div>

<!-- 카카오 JavaScript SDK 추가 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- Google Identity Services -->
<script src="https://accounts.google.com/gsi/client" async defer></script>
<!-- 네이버 JavaScript SDK 추가 -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"></script>
<script>
    // 카카오 SDK 초기화
    Kakao.init('d864922acb97f8ecdb6cfe60c4ed81d9'); // 여기에 카카오 JavaScript 키를 넣으세요.

    // 카카오 로그인 버튼 클릭 이벤트 핸들러
    document.getElementById('kakao-login-btn').addEventListener('click', function() {
        Kakao.Auth.login({
            success: function(authObj) {
                console.log(authObj);
                // authObj.access_token을 이용하여 사용자 정보를 가져오거나, 서버로 전송하여 추가 처리
                Kakao.API.request({
                    url: '/v2/user/me',
                    success: function(response) {
                        console.log(response);
                        // 사용자 정보(response)를 이용하여 필요한 로직 추가
                    },
                    fail: function(error) {
                        console.log(error);
                    }
                });
            },
            fail: function(err) {
                alert(JSON.stringify(err));
            }
        });
    });

    // Google 로그인 설정
    function handleCredentialResponse(response) {
        console.log("Encoded JWT ID token: " + response.credential);
        // response.credential을 서버로 전송하여 추가 처리
    }

    window.onload = function () {
        google.accounts.id.initialize({
            client_id: "YOUR_GOOGLE_CLIENT_ID", // 여기에 Google 클라이언트 ID를 넣으세요.
            callback: handleCredentialResponse
        });

        google.accounts.id.renderButton(
            document.getElementById('google-login-img'), // Google 로그인 버튼 요소
            { theme: "outline", size: "large" } // 버튼 스타일 옵션
        );

        // Google 로그인 이미지 클릭 이벤트
        document.getElementById('google-login-img').addEventListener('click', function() {
            google.accounts.id.prompt(); // 로그인 프롬프트 표시
        });

        // 네이버 로그인 설정
        var naverLogin = new naver.LoginWithNaverId({
            clientId: "MguVbik71I9e6sIOQtbZ", // 여기에 네이버 클라이언트 ID를 넣으세요.
            callbackUrl: "YOUR_NAVER_CALLBACK_URL", // 여기에 네이버 콜백 URL을 넣으세요.
            isPopup: true,
            callbackHandle: true
        });

        naverLogin.init();

        // 네이버 로그인 이미지 클릭 이벤트
        document.getElementById('naver-login-btn').addEventListener('click', function() {
            naverLogin.authorize();
        });
    }
</script>
</body>
</html>
