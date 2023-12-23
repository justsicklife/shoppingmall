<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
        crossorigin="anonymous">
</head>

<body>
	<%@ include file="/WEB-INF/views/common/navbar.jsp"%>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h3 class="text-center">아이디 찾기</h3>
                    </div>
                    <div class="card-body">
                        <c:if test="${empty memberId}">
                            <div style="text-align: center; margin-top: 20px;">
                                <h2 style="font-size: 24px;">가입된 아이디가 없습니다.</h2>
                            </div>
                            <div class="mt-3 text-center">
                                <a href="javascript:history.go(-1);">이전 페이지로 돌아가기</a>
                                <br>
                            </div>
                        </c:if>
                        <c:if test="${not empty memberId}">
                            <div style="text-align: center; margin-top: 20px;">
                                <h2 style="font-size: 24px;">고객님께서 가입하신 아이디는</h2>
                            </div>
                            <div style="text-align: center;">
                                <div>
                                    <br>
                                    <h5>${memberId}</h5>
                                    <br>
                                    <p>
                                        <h2 style="font-size: 24px;">입니다</h2>
                                        <!-- <button type="button" onclick="history.go(-3);">로그인</button> -->
                                    </p>
                                </div>
                            </div>
                            <div class="mt-3 text-center">
                                <a href="/member/loginPage">로그인으로 돌아가기</a>
                                <br>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
    
</body>

</html>
