<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/member/singin/singin.css">
    <title>로그인</title>
</head>
<body>
    <div class="login-container">
        <h2>로그인</h2>
        <form id="loginForm" onsubmit="submitForm(event)">
            <label for="username">사용자명:</label>
            <input type="text" id="username" name="username" required>
			<div>
			</div>
            <label for="password">비밀번호:</label>
            <input type="password" id="password" name="password" required>

            <button type="submit">로그인</button>
        </form>
        <div class="singup">
        	<a href="/member/singup">회원가입</a>
        </div>
    </div>

</body>
</html>
