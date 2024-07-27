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
    <link rel="stylesheet" href="resources/assets/css/edit.css">
</head>
<body>
<div class="container">
        <div class="logo"><img src="resources/assets/images/browser/LOGO.jpg" alt=""></div>
        <form>
            <div class="form-group">
                <label for="name">NAME</label>
                <input type="text" id="name" name="user_name">
            </div>
            <div class="form-group">
                <label for="phone">PHONE</label>
                <input type="text" id="phone" name="user_phone">
            </div>
            <div class="form-group">
                <label for="height">HEIGHT</label>
                <input type="text" id="height" name="user_hei">
            </div>  
            <div class="form-group">
                <label for="weight">WEIGHT</label>
                <input type="text" id="weight" name="user_wei">
            </div>
            <div class="form-group">
                <label for="address">ADDRESS</label>
                <input type="text" id="address" name="user_addr">
                <span class="search-icon" onclick="openModal()"><span class="lnr lnr-magnifier"></span></span>
            </div>
            <div class="form-group2">
                <label for="detail-address">DETAIL ADDRESS</label>
                <input type="text" id="detail-address" name="detail-address">
            </div>
            <div class="actions">
                <button type="button"><a href="/">EDIT</a></button>
            </div>
        </form>
        <div class="actions">
            <a href="/main.html">LOGOUT</a>
            <a href="/mypage.html">MYPAGE</a>
            <button type="button" onclick="openLeaveModal()">LEAVE</button>
        </div>
    </div>

    <div id="addressModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('addressModal')">&times;</span>
            <h2>주소 찾기</h2>
            <div id="daumPostcode" style="width:500px;height:500px;"></div>
        </div>
    </div>

    <div id="leaveModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('leaveModal')">&times;</span>
            <h2 class="modal-title">회원정보 탈퇴신청</h2><br>
            <form id="leaveForm" onsubmit="handleSubmit(event)">
                <div class="modalbackcolor">
                    <div class="form-group-horizontal">
                        <div class="form-group">
                            <label for="leave-pw">PW</label>
                            <input type="password" id="leave-pw" name="leave_pw" class="center-text">
                        </div>
                        <div class="form-group">
                            <label for="pw-verify">PW VERIFY</label>
                            <input type="password" id="pw-verify" name="pw_verify" class="center-text">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="subtitle">탈퇴 사유</label>
                    <div>
                        <label><input type="radio" name="reason" value="rejoin"> 탈퇴 후 재가입</label>
                        <label><input type="radio" name="reason" value="dissatisfaction"> 배송 불만</label>
                        <label><input type="radio" name="reason" value="variety"> 상품의 다양성/가격 품질 불만</label>
                        <label><input type="radio" name="reason" value="site-usage"> 사이트 이용 불편</label>
                        <label><input type="radio" name="reason" value="infrequent"> 이용 빈도 낮음</label>
                    </div>
                </div>
                <div class="actions">
                    <button type="submit">회원탈퇴</button>
                    <button type="button" onclick="closeModal('leaveModal')">취소하기</button>
                </div>
            </form>
        </div>
    </div>

    <a href=""></a>

    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        // 모달 열기
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
                    // 검색 결과 데이터 활용
                    document.getElementById('address').value = data.address;
                    closeModal('addressModal');
                }
            }).embed(document.getElementById('daumPostcode'));
        }

        // 탈퇴 모달 열기
        function openLeaveModal() {
            document.getElementById('leaveModal').style.display = 'block';
        }

        // 탈퇴 완료 알림창 표시 및 페이지 이동
        function handleSubmit(event) {
            event.preventDefault();
            var pw = document.getElementById('leave-pw').value;
            var pwVerify = document.getElementById('pw-verify').value;
            
            if (pw !== pwVerify) {
                alert('비밀번호가 일치하지 않습니다.');
                return;
            }
            
            alert('탈퇴가 완료되었습니다.');
            window.location.href = '/main.html'; // 원하는 주소로 변경
        }
    </script>
</body>
</html>