<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>비밀번호 찾기</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">

    </head>
    <style>
        * {
            font-family: 'IBM Plex Sans KR', sans-serif;
        }

        .find_pw_link:hover,
        .find_pw_link:visited,
        .find_pw_link:active {
            color: #0d6efd;

        }

        .find_pw_link {
            color: #0d6efd;
            text-decoration: none;
        }
    </style>

    <body>
        <%@ include file="/WEB-INF/views/common/navbar.jsp" %>

            <div class="container">
                <div class="row justify-content-center vh-100 align-items-center">
                    <div class="col-md-5">
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
                                        <input type="email" class="form-control" id="memberEmail" name="memberEmail"
                                            required>
                                    </div>
                                    <div class="d-grid">
                                        <button class="btn btn-primary" type="submit">비밀번호 재설정</button>
                                    </div>
                                </form>
                                <div class="mt-3 text-center">
                                    <a class="find_pw_link" href="/member/loginPage">로그인으로 돌아가기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%@ include file="/WEB-INF/views/common/footer.jsp" %>

    </body>

    </html>