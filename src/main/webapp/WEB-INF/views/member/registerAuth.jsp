<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>registerAuth</title>
    <style>
        body {
            text-align: center;
            padding: 50px;
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
        }

        h1 {
            color: #333;
            background-color: #ffc107;
            padding: 10px;
            border-radius: 5px;
        }

        p {
            color: #555;
            margin-top: 10px;
        }

        a {
            text-decoration: none;
            color: #fff;
        }

        button {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/navbar.jsp"%>

<!-- <body style="text-align: center; padding: 50px;"> -->

    <h1><%= request.getParameter("memberId") %>님, 쇼핑몰 프로젝트에 회원가입 해주셔서 감사합니다!</h1>

    <p><%= request.getParameter("memberEmail") %>으로 메일을 보냈습니다.</p>
    <p>메일 확인 후 인증 버튼을 눌러주세요.</p>
    <br>
    <a href="/member/loginPage"><button type="button">로그인 페이지로 돌아가기</button></a>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

</body>
</html>
