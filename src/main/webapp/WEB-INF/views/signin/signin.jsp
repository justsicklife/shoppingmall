<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>

        .btn-login {
            font-size: 0.9rem;
            letter-spacing: 0.05rem;
            padding: 0.75rem 1rem;
        }


        .btn-naver,.btn-kakao {
            border:none;
            background: none;
        }
        img {
            width: 64px;
            height: 64px;
            border-radius: 10%;
        }
        .siniin-link{
            gap: 15px;
        }
        .link{
            text-decoration: none;
            cursor: pointer;
        }

    </style>
        <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
     integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">

</head>
<!-- This snippet uses Font Awesome 5 Free as a dependency. You can download it at fontawesome.io! -->

<body>
    <div class="container">
        <div class="row">
            <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                <div class="card border-0 shadow rounded-3 my-5">
                    <div class="card-body p-4 p-sm-5">
                        <h5 class="card-title text-center mb-5 fw-light fs-5">Sign In</h5>
                        <form action="/member/login.do" method="post">
                            <div class="form-floating mb-3">
                                <input type="id" class="form-control" id="floatingInput" name="memberId"
                                    placeholder="ID">
                                <label for="floatingInput">ID</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="password" class="form-control" id="floatingPassword" name="memberPassword"
                                    placeholder="Password">
                                <label for="floatingPassword">Password</label>
                            </div>

                            <div class="d-flex justify-content-center mb-3 siniin-link">
                                <a href="/member/searchId" class="link">아이디 찾기</a> 
                                <a href="/member/searchPw" class="link">비밀번호 찾기</a>
                            </div>
                            <div class="d-grid">
                                <button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit">Sign in</button>
                            </div>
                            <hr class="my-4">
                            <div class="d-flex justify-content-center">
                                <button class="btn-naver" type="submit">
                                   <img src="https://i.namu.wiki/i/p_1IEyQ8rYenO9YgAFp_LHIAW46kn6DXT0VKmZ_jKNijvYth9DieYZuJX_E_H_4GkCER_sVKhMqSyQYoW94JKA.svg">
                                </button>
                                <button class="btn-kakao" type="submit">
                                    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/KakaoTalk_logo.svg/600px-KakaoTalk_logo.svg.png">
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
    // loginError 속성이 있는지 확인
    var loginError = '${loginError}';
    
    // 로그인 실패 시 알림 표시
    if (loginError) {
        alert("아이디와 비밀번호를 확인 해주세요.");
    }
</script>
</html>