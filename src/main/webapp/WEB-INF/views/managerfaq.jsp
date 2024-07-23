<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Coordy</title>
    <!-- Meta -->
    <meta charset="EUC-KR">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="author" content="Phoenixcoded" />
    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css" />
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
                <h2>����ں� ��ȭ����</h2><br><br>
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
                    <div>�� ����Ƚ��: <span id="total-answered">0</span></div><br>
                    <div>���� �Ϸ�: <span id="answered">0</span></div><br>
                    <div>������: <span id="unanswered">0</span></div>
                </div>
              
                <div class="chat" id="chat">
                    <!-- �޽����� ���⿡ ǥ�õ˴ϴ� -->
                </div>
                <div class="response-input">
                    <button onclick="submitResponse()">�亯 ����</button>
                </div>
            </div>
        </div>
    </form>
    </div>

    <script>
        
        let currentUser = '';

        const messages = {
            user1: [
                { text: '����� ��õ�ް� �;��', answered: false },
                { text: '���̵� ����� �ؾ���Ⱦ��', answered: false },
                { text: '����� ����ǿ�.', answered: false }
            ],
            user2: [
                { text: '�׽�Ʈ �մϴ�.', answered: false },
                { text: '�׽�Ʈ ���� �� ��°.', answered: false },
                { text: '�׽�Ʈ ���� �� ��°.', answered: false }
            ],
            user3: [
                { text: 'ȸ���� ��� �ϳ���?', answered: false },
                { text: 'ȸ�������� ��ƽ��ϴ�.', answered: false },
                { text: 'ȸ�� ���� ������ ��ƽ��ϴ�.', answered: false }
            ],
            user4: [
                { text: 'ȸ�� ���� ������ ���?', answered: false },
                { text: '������ �ȵ˴ϴ�.', answered: false },
                { text: '������ �߸��˴ϴ�.', answered: false }
            ]
        };

        function showMessages(user) {
            currentUser = user;
            const chat = document.getElementById('chat');
            chat.innerHTML = ''; // ������ �޼��� �����

            messages[user].forEach((message, index) => {
                const messageDiv = document.createElement('div');
                messageDiv.classList.add('message');
                messageDiv.innerHTML = `<p>${message.text}</p>`;
                if (!message.answered) {
                    const responseTextarea = document.createElement('textarea');
                    responseTextarea.setAttribute('placeholder', '�亯�� �Է��ϼ���');
                    responseTextarea.setAttribute('data-index', index);
                    responseTextarea.classList.add('responseTextarea');
                    messageDiv.appendChild(responseTextarea);
                }
                chat.appendChild(messageDiv); // ���ο� �޼��� �߰�
            });
        }

        function submitResponse() {
            const chat = document.getElementById('chat');
            const textareas = chat.querySelectorAll('.responseTextarea');

            textareas.forEach(textarea => {
                const responseText = textarea.value.trim();
                if (!responseText) return alert('�亯�� �Է��ϼ���.');

                const index = textarea.getAttribute('data-index');
                messages[currentUser][index].text += ` �亯: ${responseText}`;
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

        // �������� �ε�� �� �ֱ� �޽����� ��� ������Ʈ
        document.addEventListener('DOMContentLoaded', () => {
            updateRecentMessages();
            updateStats();
        });
    </script>
</body>
</html>
