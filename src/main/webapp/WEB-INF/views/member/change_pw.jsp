<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 변경</title>
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
                        <h3 class="text-center">비밀번호 찾기</h3>
                    </div>
                    <div class="card-body">
                        <c:if test="${empty memberIdx}">
                            <div style="text-align: center; margin-top: 20px;">
                                <h2 style="font-size: 24px;">가입된 아이디가 없습니다.</h2>
                            </div>
                            <div class="mt-3 text-center">
                                <a href="javascript:history.go(-1);">이전 페이지로 돌아가기</a>
                                <br>
                            </div>
                        </c:if>
                    
                        <c:if test="${not empty memberIdx}">
                            <form action="/member/changePw.do" method="post" onsubmit="return validateForm()">
                                <input type="hidden" name="memberIdx" value="${memberIdx}">
                                <div class="mb-3">
                                    <label for="newPassword" class="form-label">새 비밀번호 (영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자)</label>
                                    <input type="password" class="form-control" id="newPassword" name="memberPassword" required>
                                </div>
                                <div class="mb-3">
                                    <label for="newPasswordChk" class="form-label">비밀번호 확인</label>
                                    <input type="password" class="form-control" id="newPasswordChk" name="memberPasswordChk" required>
                                </div>
                                <div class="d-grid">
                                    <button class="btn btn-primary" type="submit">비밀번호 변경</button>
                                </div>
                            </form>
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
<script>
    function validateForm() {
        var newPassword = document.getElementById("newPassword").value;
        var newPasswordChk = document.getElementById("newPasswordChk").value;

        var passwordRegex = /^(?=.*[a-zA-Z])(?=.*[@$!%*?&\#])[A-Za-z\d@$!%*?&\#]{8,20}$/;

        if (newPassword.match(passwordRegex) && newPassword === newPasswordChk) {
            alert("비밀번호 변경 완료");
            return true;
        } else {
            alert("비밀번호를 확인해주세요");
            return false;
        }
    }
</script>         
</html>
