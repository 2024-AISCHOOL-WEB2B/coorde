<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Coordy</title>
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
		<div class="logo">OOTB</div>
		<form action="signUp" method="post">
			<div class="form-group">
				<label for="id">ID</label> <input type="text" id="id" name="user_id" />
				<span class="lnr lnr-magnifier"></span>
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
				<label for="birth">BIRTH</label> <input type="text" id="birth"
					name="user_birth" />
			</div>
			<div class="form-group">
				<label for="phone">PHONE</label> <input type="text" id="phone"
					name="user_phone" />
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
				<label for="address">ADDRESS</label> <input type="text" id="address"
					name="user_addr" /> <span class="lnr lnr-magnifier"></span>
			</div>
			<div class="form-group">
				<label for="detail-address">DETAIL ADDRESS</label> <input
					type="text" id="detail-address" name="user_detail_address" />
			</div>
			<div class="join-button">
				<button>Sign up</button>
			</div>
		</form>
	</div>
	
	
	<script type="text/javascript">
		function signUpSuccess(user_wei, user_hei) {
			$.ajax({
				url : '/predict',
				type : 'POST',
				data : {
					weight : user_wei,
					height : user_hei
				},
				success : function(response) {
					console.log('서버 응답:', response);
				},
				error : function(xhr, status, error) {
					console.error('에러 발생:', error);
				}
			});
		}
		
		document.addEventListener('DOMContentLoaded', function() {
		    const submitBtn = document.getElementById('submitBtn');
		    submitBtn.addEventListener('click', function() {
		        const userWeight = document.getElementById('weight').value;
		        const userHeight = document.getElementById('height').value;
		        signUpSuccess(userWeight, userHeight);
		    });
		});

		
	</script>


</body>
</html>