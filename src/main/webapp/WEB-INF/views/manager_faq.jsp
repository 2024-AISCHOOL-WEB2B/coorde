<%@page import="com.coorde.myapp.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>OOTB 회원 문의</title>
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

    <%    
        User latestFaqList = (User) session.getAttribute("latestFaqList");
        User faqList = (User) session.getAttribute("faqList");
    %>
        <div class="wrap">
        <div class="logo">
            <a href="goManager"><img src="resources/assets/images/browser/LOGO.png" alt=""></a>
            <div class="FAQ">FAQ</div>
        </div>
        <form action="#">
            <div class="container">
                <div class="sidebar">
                    <h2>사용자별 대화내역</h2><br><br>
                    <c:forEach var="faq" items="${latestFaqList}">
					    <div class="user" onclick="showMessages('${faq.user_id}')">
					        <p>${faq.user_name}</p>
					        <p><strong>Q:</strong> <span id="recent-${faq.user_id}">${faq.faq_title}</span></p>
					        <input type="hidden" id="user-${faq.user_id}" value="${faq.user_id}">
					    </div>
					</c:forEach>
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
                </div>
                <div class="right">
                   <a href="logoutUser" class="logout button">LOGOUT</a>
                    <a href="goManagerClcart">CLOSET</a>
                    <a href="goManagerUserList">USER</a>
                </div> 
            </div>
        </form>
    </div>
    <script src="resources/assets/js/vendor-all.min.js"></script>
    <script>
    
   
        let currentUser = '';
        const messages = {};

        <c:forEach var="faq" items="${faqList}">
            if (!messages['${faq.user_id}']) {
                messages['${faq.user_id}'] = [];
            }
            messages['${faq.user_id}'].push({
                text: '${faq.faq_title}', // 질문 제목
                detail: '${faq.faq_detail}', // 질문 상세 내용
                answer: '${faq.faq_answer}',
                answered: '${faq.faq_answer}' !== ''
            });
        </c:forEach>

        function showMessages(user) {
            currentUser = user;
            const chat = document.getElementById('chat');
            chat.innerHTML = ''; // 기존의 메세지 지우기

            if (!messages[user]) {
                console.log(`No messages found for user: \${user}`);
                return;
            }

            messages[user].forEach((message, index) => {
                const messageDiv = document.createElement('div');
                messageDiv.classList.add('message');

                // 질문 제목과 상세 내용 출력
                const questionTitlePara = document.createElement('p');
                const strongTagForTitle = document.createElement('strong');
                strongTagForTitle.textContent = 'Q:';
                questionTitlePara.appendChild(strongTagForTitle);
                questionTitlePara.append(' ' + message.text);
                messageDiv.appendChild(questionTitlePara);

                const questionDetailPara = document.createElement('p');
                questionDetailPara.textContent = message.detail; 
                messageDiv.appendChild(questionDetailPara);

                if (message.answered) {
                    // 이미 답변이 있는 경우
                    const answerPara = document.createElement('p');
                    const strongTagForAnswer = document.createElement('strong');
                    strongTagForAnswer.textContent = '답변:';
                    answerPara.appendChild(strongTagForAnswer);
                    answerPara.append(' ' + message.answer);

                    messageDiv.appendChild(answerPara);
                } else {
                    // 답변을 입력할 수 있는 경우
                    const responseTextarea = document.createElement('textarea');
                    responseTextarea.setAttribute('placeholder', '답변을 입력하세요');
                    responseTextarea.setAttribute('data-index', index);
                    console.log(index);
                    responseTextarea.classList.add('responseTextarea');
                    
                    const responseButton = document.createElement('button');
                    responseButton.textContent = '답변 제출';
                    responseButton.classList.add('responseButton');
                    responseButton.setAttribute('data-index', index);
                    
                    messageDiv.appendChild(responseTextarea);
                    messageDiv.appendChild(responseButton);
                }
                chat.appendChild(messageDiv); // 새로운 메세지 추가
            });
        }
       
        function submitResponse(index) {
        	console.log(`Submitting response for index: ${index}`);
            const chat = document.getElementById('chat');
            const textarea = chat.querySelector(`.responseTextarea[data-index='${index}']`);
            
            if (!textarea) {
                console.error(`Textarea with data-index='${index}' not found.`);
                return;
            }

            const responseText = textarea.value.trim();
            if (!responseText) return alert('답변을 입력하세요.');

            const messageTitle = messages[currentUser][index].text;
            const userId = currentUser;

            console.log(`User ID: ${userId}`);
            console.log(`FAQ Title: ${messageTitle}`);
            console.log(`FAQ Answer: ${responseText}`);

            $.ajax({
                url: './submitAnswer',
                data: {
                    user_id: userId,
                    faq_title: messageTitle,
                    faq_answer: responseText
                },  
                type: 'POST',
                dataType: 'json',
                success: function(result) {
                    if (result.status === "success") {
                        messages[currentUser][index].answer = responseText;
                        messages[currentUser][index].answered = true;

                        showMessages(currentUser);
                        updateStats();
                        updateRecentMessages(); // 최근 메시지 업데이트
                    } else {
                        alert(result.message);
                    }
                },
                error: function() {
                    alert('서버와의 통신에 실패했습니다. 나중에 다시 시도해 주세요.');
                }
            });
        }

        function updateRecentMessages() {
            console.log('Updating recent messages');
            console.log('Messages object:', messages);

            document.querySelectorAll('.user').forEach(userDiv => {
                // user_id를 hidden input에서 가져옵니다
                const userIdField = userDiv.querySelector('input[type="hidden"]');
                if (!userIdField) {
                    console.error('Hidden input field not found in user div');
                    return;
                }
                
                console.log('Hidden input field:', userIdField);
                console.log('Hidden input value:', userIdField.value); // 값 확인
                
                const userId = userIdField.value;
                if (!userId) {
                    console.error('Empty user ID');
                    return;
                }

                console.log("Processing user ID: "+userId);
                
                if (messages[userId]) {
                    // 최근 메시지
                    const recentMessage = messages[userId][messages[userId].length - 1]?.text;
                    console.log(`Recent message for user `+userId+`: `+recentMessage);
                    
                    // 최근 메시지를 표시할 요소를 찾습니다
                    const element = document.getElementById(`recent-`+userId);
                    if (element) {
                        element.textContent = recentMessage || 'No messages';
                    } else {
                        console.error(`Element with ID recent-\${userId} not found`);
                    }
                } else {
                    console.error(`No messages found for user: \${userId}`);
                }
            });
        }

        document.addEventListener('DOMContentLoaded', () => {
            updateRecentMessages();
            updateStats();
        });


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
            
            const totalMessages = totalAnswered + totalUnanswered;

            document.getElementById('total-answered').textContent = totalAnswered + totalUnanswered;
            document.getElementById('answered').textContent = totalAnswered;
            document.getElementById('unanswered').textContent = totalUnanswered;
        }

        // 페이지가 로드될 때 최근 메시지와 통계 업데이트
        document.addEventListener('DOMContentLoaded', () => {
            updateRecentMessages();
            updateStats();
        });
        
        document.getElementById('chat').addEventListener('click', function(e) {
            if (e.target && e.target.classList.contains('responseButton')) {
                const index = e.target.getAttribute('data-index');
                submitResponse(index);
            }
        });
    </script>
</body>
</html>