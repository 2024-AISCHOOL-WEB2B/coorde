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
    <link rel="stylesheet" href="resources/assets/css/managerfaq.css">
</head>
<body>
<div class="wrap">
        <div class="header">
            <h1>OOTB</h1>
        </div>
        <div class="nav">
            <a href="#">CL</a>
            <a href="#">USER</a>
        </div>
        <form action="#">
        <div class="container">
            <div class="sidebar">
                <h2>사용자별 대화내역</h2><br><br>
                <div class="user" onclick="showMessages('user1')">
                    <p>USER 1</p>
                    <p><strong>Q:</strong> <span id="recent-user1"></span></p>
                </div>
                <div class="user" onclick="showMessages('user2')">
                    <p>USER 2</p>
                    <p><strong>Q:</strong> <span id="recent-user2"></span></p>
                </div>
                <div class="user" onclick="showMessages('user3')">
                    <p>USER 3</p>
                    <p><strong>Q:</strong> <span id="recent-user3"></span></p>
                </div>
                <div class="user" onclick="showMessages('user4')">
                    <p>USER 4</p>
                    <p><strong>Q:</strong> <span id="recent-user4"></span></p>
                </div>
            </div>

            <div class="respond">
                <div class="stats" id="stats">
                    <div>총 응답횟수: <span id="total-answered">0</span></div><br>
                    <div>응답 완료: <span id="answered">0</span></div><br>
                    <div>미응답: <span id="unanswered">0</span></div>
                </div>
              
                <div class="chat" id="chat">
                    <!-- 메시지가 여기에 표시됩니다 -->
                </div>
                <div class="response-input">
                    <button onclick="submitResponse()">답변 제출</button>
                </div>
            </div>
        </div>
    </form>
    </div>

    <script>
        
        let currentUser = '';

        const messages = {
            user1: [
                { text: '사이즈를 추천받고 싶어요', answered: false },
                { text: '아이디 비번을 잊어버렸어요', answered: false },
                { text: '사이즈가 변경되요.', answered: false }
            ],
            user2: [
                { text: '테스트 합니다.', answered: false },
                { text: '테스트 문의 두 번째.', answered: false },
                { text: '테스트 문의 세 번째.', answered: false }
            ],
            user3: [
                { text: '회원은 어떻게 하나요?', answered: false },
                { text: '회원가입이 어렵습니다.', answered: false },
                { text: '회원 정보 수정이 어렵습니다.', answered: false }
            ],
            user4: [
                { text: '회원 정보 수정은 어떻게?', answered: false },
                { text: '수정이 안됩니다.', answered: false },
                { text: '정보가 잘못됩니다.', answered: false }
            ]
        };

        function showMessages(user) {
            currentUser = user;
            const chat = document.getElementById('chat');
            chat.innerHTML = ''; // 기존의 메세지 지우기

            messages[user].forEach((message, index) => {
                const messageDiv = document.createElement('div');
                messageDiv.classList.add('message');
                messageDiv.innerHTML = `<p>${message.text}</p>`;
                if (!message.answered) {
                    const responseTextarea = document.createElement('textarea');
                    responseTextarea.setAttribute('placeholder', '답변을 입력하세요');
                    responseTextarea.setAttribute('data-index', index);
                    responseTextarea.classList.add('responseTextarea');
                    messageDiv.appendChild(responseTextarea);
                }
                chat.appendChild(messageDiv); // 새로운 메세지 추가
            });
        }

        function submitResponse() {
            const chat = document.getElementById('chat');
            const textareas = chat.querySelectorAll('.responseTextarea');

            textareas.forEach(textarea => {
                const responseText = textarea.value.trim();
                if (!responseText) return alert('답변을 입력하세요.');

                const index = textarea.getAttribute('data-index');
                messages[currentUser][index].text += ` 답변: ${responseText}`;
                messages[currentUser][index].answered = true;
            });

            showMessages(currentUser);
            updateStats();
        }

        function updateRecentMessages() {
            for (const user in messages) {
                const recentMessage = messages[user][messages[user].length - 1].text;
                document.getElementById(`recent-${user}`).textContent = recentMessage;
            }
        }

        function updateStats() {
            let totalAnswered = 0;
            let totalUnanswered = 0;

            for (const user in messages) {
                messages[user].forEach(message => {
                    if (message.answered) {
                        totalAnswered++;
                    } else {
                        totalUnanswered++;
                    }
                });
            }

            document.getElementById('total-answered').textContent = totalAnswered + totalUnanswered;
            document.getElementById('answered').textContent = totalAnswered;
            document.getElementById('unanswered').textContent = totalUnanswered;
        }

        // 페이지가 로드될 때 최근 메시지와 통계 업데이트
        document.addEventListener('DOMContentLoaded', () => {
            updateRecentMessages();
            updateStats();
        });
    </script>
</body>
</html>