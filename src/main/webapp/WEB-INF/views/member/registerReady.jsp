<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>registerReady</title>
    <style>
        body {
            text-align: center;
            padding: 50px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
        }

        p {
            color: #343a40;
            font-size: 18px;
            margin-bottom: 30px;
        }

        a {
            text-decoration: none;
            margin: 0 10px;
            display: inline-block;
        }

        button {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/navbar.jsp"%>

<!-- <body style="text-align: center; padding: 50px;"> -->

    <p>발송된 이메일로 인증을 하셔야 로그인이 가능합니다.</p>


    <a href="/member/loginPage"><button type="button">로그인 페이지로 돌아가기</button></a>
    <a href="/product/index"><button type="button">메인 페이지로 돌아가기</button></a>
	
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	
</body>
</html>
