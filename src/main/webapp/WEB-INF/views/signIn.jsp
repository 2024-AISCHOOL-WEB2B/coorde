<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>TrendyPeop</title>
<!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="" />
    <meta name="keywords" content="">
    <meta name="author" content="Phoenixcoded" />
    <!-- Favicon icon -->
    <link rel="icon" href="resources/assets/images/favicon.png" type="image/x-icon">

    <!-- vendor css -->
    <link rel="stylesheet" href="resources/assets/css/style.css">
</head>
<body>
<!-- [ auth-signup ] start -->
<div class="auth-wrapper">
	<div class="auth-content">
		<div class="card">
			<div class="row align-items-center text-center">
				<div class="col-md-12">
					<div class="card-body">
						<form action="userSelect" method="post">
							<img src="resources/assets/images/로고_누끼(160X23).png" alt="" class="img-fluid mb-4">
							<h4 class="mb-4 f-w-400">로그인</h4>
							<div class="form-group mb-3">
								<label class="floating-label" for="Userid">UserID</label>
								<input type="text" class="form-control" name="user_id" id="user_id" placeholder="">
							</div>
							<div class="form-group mb-4">
								<label class="floating-label" for="Password">Password</label>
								<input type="password" class="form-control" name="user_pw" id="user_pw" placeholder="">
							</div>
							<br><br>
							<button class="btn btn-block btn-primary mb-4">Signin</button>
							<p class="mb-0 text-muted">아직 계정이 없으신가요? <a href="signUp" class="f-w-400">Signup</a></p>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- [ auth-signup ] end -->

<!-- Required Js -->
<script src="resources/assets/js/vendor-all.min.js"></script>
<script src="resources/assets/js/plugins/bootstrap.min.js"></script>
<script src="resources/assets/js/ripple.js"></script>
<script src="resources/assets/js/pcoded.min.js"></script>



</body>
</html>