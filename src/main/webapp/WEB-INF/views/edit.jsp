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
        <div class="title">OOTB</div>
        <form>
            <div class="title">OOTB</div>
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
                <span class="search-icon"><span class="lnr lnr-magnifier"></span></span>
            </div>
            <div class="form-group2">
                <label for="detail-address">DETAIL ADDRESS</label>
                <input type="text" id="detail-address" name="detail-address">
            </div>
            <div class="actions">
                <button><a href="/">EDIT</a></button>
            </div>
        </form>
        <div class="actions">
            <a href="gomyPage">MY PAGE</a>
        </div>
    </div>

    <script>
        function editProfile() {
            // Add edit profile functionality here
            alert("Edit profile clicked");
        }

        function logout() {
            // Add logout functionality here
            alert("Logout clicked");
        }

        function myPage() {
            // Add my page functionality here
            alert("My page clicked");
        }
    </script>

</body>
</html>