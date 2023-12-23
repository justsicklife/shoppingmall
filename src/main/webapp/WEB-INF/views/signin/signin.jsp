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
        .txt_c {
            margin: 10px;
        }

        .sns_login_form {
            width: 100%;
        }

        .btn-kakao {
            background-color: #FFEB00 !important;
            background-image: url(https://vendor-cdn.imweb.me/images/kakao_icon.png);
            background-size: 20px;
            background-position: 12px 49%;
            background-repeat: no-repeat;
            color: #3c1e1e !important;
            border-color: #FFEB00 !important;
            font-size: 14px;
            display: block !important;
            padding: 10px 25px 10px 25px;
            width: 100%;
            text-align: center;
            border-radius: 6px;
        }

        .btn-naver {
            background-color: #27d34a !important;
            border-color: #27d34a !important;
            background-image:
                url(https://vendor-cdn.imweb.me/images/naver_login2x.png);
            background-size: 16px;
            background-position: 15px 50%;
            background-repeat: no-repeat;
            color: #fff !important;
            font-size: 14px;
            display: block !important;
            padding: 10px 25px 10px 25px;
            width: 100%;
            text-align: center;
            border-radius: 6px;
            padding: 10px 25px 10px 25px;
            width: 100%;
        }
        .icon {
            font-size: 2rem;
            color: gray;
        }

        .title{
            font-size: 2rem;
            font-weight: bold;
            font-family: 'IBM Plex Sans KR', sans-serif;
        }
        .signup{
            margin: 10px;
            background: gray;
            border-radius: 5px;
            text-align: center;
            padding-bottom: 5px;
        }
        .signup > div {
            color: white;
        }
    </style>
<!-- 네이버 로그인 연동 api start -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">

<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
     integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">

</head>
<!-- This snippet uses Font Awesome 5 Free as a dependency. You can download it at fontawesome.io! -->

<body>
    <div class="container">
        <div class="row vh-100 align-content-center">
            <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                <div class="d-flex align-content-center justify-content-end">
                    <a href="/product/index" >
                        <i class="fa-solid fa-house icon"></i>
                    </a>
                </div>
                <div class="card border-0 shadow rounded-3 my-2">
                    <div class="card-body p-4 p-sm-5">
                        <h3 class="card-title text-center title mb-5 fw-bold">쇼핑몰 프로젝트</h3>
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
                                <button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit">로그인</button>
                            </div>
                            <hr class="my-4">
                            <div class="sns_login_form">

								<a class="d-block signup" href="/member/signupPage.do">
                                    <div class="btn">회원가입</div>
                                </a>
                                <p class="txt_c">
                                    <a class="btn btn-kakao" id="custom-login-btn" href="https://kauth.kakao.com/oauth/authorize?client_id=f50e884d53d77ca3295d6fb79fda096c&redirect_uri=http://localhost/member/kakaoLogin&response_type=code">카카오로 시작하기</a>
                                </p>
                                <p class="txt_c">
                                    <a class="btn btn-naver" href="https://nid.naver.com/oauth2.0/authorize?response_type=code&redirect_uri=http://localhost/member/naverLogin&client_id=QOej8ZdoC6TIOyLYsN6p">네이버로 시작하기</a>
                                </p>
                                <!-- <button class="btn-naver" type="submit">
                                   <img src="https://i.namu.wiki/i/p_1IEyQ8rYenO9YgAFp_LHIAW46kn6DXT0VKmZ_jKNijvYth9DieYZuJX_E_H_4GkCER_sVKhMqSyQYoW94JKA.svg">
                                </button>
                                <button class="btn-kakao" type="submit">
                                    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/KakaoTalk_logo.svg/600px-KakaoTalk_logo.svg.png">
                                </button> -->
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