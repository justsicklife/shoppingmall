<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>registerAuth</title>
</head>
<body style="text-align: center; padding: 50px;">

    <h1><%= request.getParameter("memberId") %>님, 쇼핑몰 프로젝트에 회원가입 해주셔서 감사합니다!</h1>

    <p><%= request.getParameter("memberEmail") %>으로 메일을 보냈습니다.</p>
    <p>메일 확인 후 인증 버튼을 눌러주세요.</p>
    <br>
    <a href="/member/loginPage"><button type="button">로그인 페이지로 돌아가기</button></a>
</body>
</html>
