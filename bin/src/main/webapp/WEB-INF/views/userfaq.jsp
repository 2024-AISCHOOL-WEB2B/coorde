<%@ page import="com.coorde.myapp.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OOTB 문의 사항</title>

    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400..700&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400..700&family=Yellowtail&display=swap');
         * { margin: 0; padding: 0; }

        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            margin: 0;
            padding: 0;
        }

        .wrap {
            display: flex;
            justify-content: center;
            align-items: center;
            box-sizing: border-box;
        }

        .container {
            width: 1280px;
            margin: 50px auto;
            overflow: hidden;
            background-color: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-left: 300px;
            font-family: "Yellowtail", cursive;
        }

        .header h1 {
            font-size: 60px;
            margin: 0;
        }

        .nav {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
            padding: 10px;
        }

        .nav a {
            text-decoration: none;
            color: black;
        }

        .faq-section {
            margin: 20px 0;
        }

        .faq-section h2 {
            font-size: 20px;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        .faq-item {
            display: flex;
            padding: 10px 0;
            border-bottom: 1px solid #eee;
        }

        .faq-item p {
            margin: 0;
        }

        .faq-item span {
            font-size: 12px;
            color: #a8a2a2;
        }

        .buttons {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin: 20px 0;
        }

        .btn {
            padding: 10px 20px;
            margin: 5px;
            background-color: lightgray;
            border: none;
            cursor: pointer;
            border-radius: 10px;
        }

        .btn.active {
            background-color: gray;
            color: white;
        }

        .btn:hover {
            background-color: #ddd;
        }

        .inquiry {
            margin: 20px 0;
            text-align: center;
        }

        .inquiry p {
            font-size: 14px;
            color: #666;
            margin-bottom: 10px;
        }

        textarea {
            width: 97%;
            height: 100px;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            resize: none;
        }
        }

        .inquiry-buttons {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-left: 580px;
        }

        .inquiry-btn {
            background-color: black;
            color: white;
            border: none;
            padding: 10px;
            font-size: 16px;
            border-radius: 20px;
            cursor: pointer;
            width: 10%;
        }

        .inquiry-btn:nth-child(2) {
            margin-left: 30px;
        }

        .inquiry-btn:hover {
            background-color: #333;
        }

        .QNA {
            text-align: center;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
        }

        .modal-content {
            background-color: #fff;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 800px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            font-family: Arial, sans-serif;
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

        .modal-body {
            padding: 20px;
        }

        .inquiry-detail {
            padding: 15px;
            border-bottom: 1px solid #ddd;
            margin-bottom: 20px;
            background-color: #f8f8f8;
            border-radius: 10px;
        }

        .inquiry-detail p {
            margin: 5px 0;
        }

        .response {
            padding: 15px;
            border: 1px solid #f00;
            border-radius: 10px;
            background-color: #fff;
        }

        .response-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }

 
        .response-title {
            font-size: 18px;
            font-weight: bold;
        }

        .response-date {
            font-size: 12px;
            color: #888;
        }

        .response-content {
            padding-left: 25px;
            font-size: 14px;
        }

        .modal-footer {
            display: flex;
            justify-content: flex-end;
            padding: 10px 0;
        }

        .modal-footer .btn {
            margin-left: 10px;
            background-color: #000;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }

        .modal-footer .btn:hover {
            background-color: #333;
        }
        
        #inquiry-title {
            text-align: center;
            margin: 10px 50px 20px;
            border-radius:5px;
			border: 1px solid #ddd;
			height:40px;
        }
        
         input {
            border: none;
            outline: none;
        }
    </style>
</head>
<body>
    <%    
        User userfaqList = (User) session.getAttribute("userfaqList");
    %>
    <div class="wrap">
        <div class="container">
            <div class="header">
                <a href="/myapp"><img alt="LOGO" src="resources/assets/images/browser/LOGO.png"></a>
            </div>
            <div class="faq-section">
                <div class="nav">
                    <a href="logoutUser">LOGOUT</a><br> 
                    <a href="gomyPage">MYPAGE</a>
                </div>
                <div>
                    <h2><span class="lnr lnr-magnifier"></span>자주하는 질문</h2>
                </div>
                <div class="faq-item">
                    <p>주문은 어떻게 하나요?<br><br> <span>답변: 아직 준비중입니다.</span></p>
                </div>
                <div class="faq-item">
                    <p>회원 정보를 수정하고 싶습니다.<br><br> <span>답변: EDIT 화면에서 진행하시면 됩니다.</span></p>
                </div>
                <div class="faq-item">
                    <p>사이즈 추천을 받고 싶습니다.<br><br> <span>답변: 회원가입시 정보를 입력하고 상세페이지,리뷰에 추가로 입력해주시면 됩니다.</span></p>
                </div>
                <div class="faq-item">
                    <p>회원과 비회원의 차이를 알고 싶습니다.<br><br> <span>답변: 비회원은 키와 몸무게만 가지고 옷을 추천 드리고 있습니다.
                        <br> 회원은 키와 몸무게, 다양한 신체 사이즈의 정보를 기입할 수 있습니다. </span></p>
                </div>
                <div class="faq-item">
                    <p>아이디 비밀번호가 기억나지 않아요.<br><br> <span>답변: FIND를 통해 찾으시면 됩니다. </span></p>
                </div>
            </div>
            <div class="buttons">
                <button class="btn" type="button" onclick="toggleButton(this, 'm')">회원정보</button>
                <button class="btn" type="button" onclick="toggleButton(this, 'p')">상품확인</button>
                <button class="btn" type="button" onclick="toggleButton(this, 's')">서비스</button>
            </div>
            <div class="inquiry">
                <p>접수된 문의는 순차적으로 답변을 드리고 있습니다. 문의 내용을 상세히 기재해 주셔야 정확한 답변이 가능합니다</p>
                <input type="text" id="inquiry-title" placeholder="문의 제목을 입력하세요">
                <textarea id="inquiry-text" placeholder="문의 내용을 입력하세요"></textarea>
            </div>
            <div class="QNA">
                <button class="inquiry-btn" type="button" onclick="openModal()">1:1문의확인</button>
                <button class="inquiry-btn" onclick="submitInquiry()">문의하기</button>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <div class="modal-body" id="modal-body">
                <!-- 문의 내용이 여기에 표시됩니다 -->
            </div>
            <div class="modal-footer">
                <button class="btn" onclick="closeModal()">닫기</button>
            </div>
        </div>
    </div>
    <script src="resources/assets/js/vendor-all.min.js"></script>
    <script>
        let inquiryText = '';
        let selectedOption = '';
        let buttons = []; // 버튼들을 저장할 배열

        function selectOption(option) {
            selectedOption = option;
        }

        function toggleButton(button, option) {
            // 버튼이 처음 클릭되면 배열에 추가
            if (buttons.length === 0) {
                buttons.push(button);
            }

            // 현재 활성화된 버튼이 아닌 모든 버튼의 active 클래스를 제거
            buttons.forEach(btn => {
                if (btn !== button) {
                    btn.classList.remove('active');
                }
            });

            // 버튼의 active 클래스를 토글합니다.
            button.classList.toggle('active');

            // 버튼이 active 상태인지 확인합니다.
            if (button.classList.contains('active')) {
                selectedOption = option;

                // 배열에 현재 버튼 추가
                if (!buttons.includes(button)) {
                    buttons.push(button);
                }
            } else {
                selectedOption = '';
                // 배열에서 현재 버튼 제거
                buttons = buttons.filter(btn => btn !== button);
            }
        }

        function submitInquiry() {
            const inquiryText = document.getElementById('inquiry-text').value;
            const title = document.getElementById('inquiry-title').value;
            const option = selectedOption; 
            
            if (selectedOption === '') {
                alert('옵션을 선택하세요.');
                return;
            }
            if (inquiryText.trim() === '') {
                alert('문의 내용을 입력하세요.');
                return;
            }

            $.ajax({
                url: './submitFaq',
                data: {
                    faq_title: title,
                    faq_detail: inquiryText,
                    faq_cate: option,
                },
                type: 'POST',
                dataType: 'json',
                success: function(response) {
                    if (response.status === 'success') {
                        alert('문의가 성공적으로 접수되었습니다.');
                        // 필요 시 폼 초기화
                        document.getElementById('inquiry-title').value = '';
                        document.getElementById('inquiry-text').value = '';
                        selectedOption = '';
                        buttons.forEach(btn => btn.classList.remove('active'));
                        buttons = [];
                    } else {
                        alert('문의 접수에 실패했습니다. 다시 시도해 주세요.');
                    }
                },
                error: function() {
                    alert('서버와의 통신에 실패했습니다. 나중에 다시 시도해 주세요.');
                }
            });
        }

        function openModal() {
            const inquiryText = document.getElementById('inquiry-text').value;
            const readableOption = selectedOption === 'm' ? '회원정보' : selectedOption === 'p' ? '상품확인' : selectedOption === 's' ? '서비스' : '';
            document.getElementById('modal-body').innerHTML = `
                <div class="inquiry-detail">
                    <p><strong>\${readableOption} 관련 문의</strong></p>
                    <p>아이디: 사용자 아이디</p>
                    <p>문의 유형: \${readableOption}</p>
                    <p>문의 날짜: \${new Date().toISOString().split('T')[0]}</p>
                    <p>문의 내용: \${inquiryText}</p>
                </div>
                <div class="response">
                    <div class="response-header">
                        <span class="response-title">답변 내용</span>
                        <span class="response-date">답변 날짜: \${new Date().toISOString().split('T')[0]}</span>
                    </div>
                    <div class="response-content">
                        <p>여기에 답변 내용을 작성합니다.</p>
                    </div>
                </div>
            `;
            document.getElementById('myModal').style.display = 'block';
        }

        function closeModal() {
            document.getElementById('myModal').style.display = 'none';
        }

        // 모달 창 외부 클릭 시 닫기
        window.onclick = function(event) {
            if (event.target == document.getElementById('myModal')) {
                closeModal();
            }
        }
    </script>
</body>
</html>
