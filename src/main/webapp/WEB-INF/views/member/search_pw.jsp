<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
        crossorigin="anonymous">
</head>

<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h3 class="text-center">비밀번호 찾기</h3>
                    </div>
                    <div class="card-body">
                        <form action="/member/findPw.do" method="post">
                            <div class="mb-3">
                                <label for="id" class="form-label">아이디</label>
                                <input type="id" class="form-control" id="memberId" name="memberId" required>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">이메일</label>
                                <input type="email" class="form-control" id="memberEmail" name="memberEmail" required>
                            </div>
                            <div class="d-grid">
                                <button class="btn btn-primary" type="submit">비밀번호 재설정</button>
                            </div>
                        </form>
                        <div class="mt-3 text-center">
                            <a href="/member/loginPage">로그인으로 돌아가기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
