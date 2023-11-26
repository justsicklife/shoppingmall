<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/member/singup/singup.css">
    <title>회원가입</title>
</head>
<body>
    <div class="signup-container">
        <h2>회원가입</h2>
        <form id="signupForm" onsubmit="submitForm(event)">
            <label for="username">사용자명:</label>
            <input type="text" id="username" name="username" required>

            <label for="email">이메일:</label>
            <input type="email" id="email" name="email" required>
			<div>이메일 중복</div>
			
			
            <label for="password">비밀번호:</label>
            <input type="password" id="password" name="password" required>

            <label for="confirmPassword">비밀번호 확인:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required>

            <button type="submit">가입하기</button>
        </form>
        <div class="singin">
        	<a href="/member/singin">로그인</a>
        </div>
    </div>

    <script src="/resources/js/member/singup/passwordValidation.js"></script>
</body>
</html>
