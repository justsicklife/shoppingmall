<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- JSTL length를 계산하기 위한 taglib -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko-kr">

<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="shortcut icon" href="/resources/mimg/movieRating/18.svg" type="">
   <title></title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
   <script src="https://kit.fontawesome.com/0cf27f7ac1.js" crossorigin="anonymous"></script>
   <!-- jQuery CDN -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

   <style>
      .nav-link-left,
      .nav-link-right {
         color: black;
         text-decoration: none;
         cursor: pointer;
      }

      .nav-item {
         padding: 10px;
      }

      .category-button,
      .community-button {
         color: #dadada;
         cursor: pointer;
      }

      .sidebar-button-active {
         color: #bababa;
      }

      .sidebar-link {
         color: #666;
         text-decoration: none;
      }

      .sidebar-link:hover {
         color: #b9b9b9;
      }

      .sidebar-body {
         color: #fefdfe;
      }

      .product-group {
         padding: 0 150px;
         gap: 50px;
      }

      /* searchbar */
      .search-bar {
         width: 220px;
         height: 27px;
         border-radius: 5px;
         border: solid 1px rgba(0, 0, 0, 0.3);
         display: flex;
         /* justify-content: center; */
         align-items: center;
         z-index: 1;
         opacity: 1;
      }

      .search-bar__input {
         width: 50px;
         border: none;
         text-align: center;
         margin-left: 10px;
         overflow: auto;
         z-index: -1;
         font-size: 15px;
         flex: 1 0 0;
         text-align: left;
      }

      .search-bar__input:focus {
         outline: none;
         width: 300px;
         text-align: left;
      }

      .fa-search {
         font-size: 15px;
      }




      .aside {
         position: absolute;
         top: 100px;
         width: 200px;
      }

      .aside_header {
         padding: 30px;
      }

      .aside_list {
         padding: 30px;
      }

      .aside_li {
         margin-bottom: 10px;
         text-align: center;
      }

      .main {
         display: flex;
         justify-content: center;
         align-items: center;
         height: inherit;
      }

      body {
         height: 100vh;
      }

      .main_form{
         width: 400px;
      }
      .button_group{
         display: flex;
         justify-content: center;
      }

      .btn_04 {
			display: inline-block;
			padding: 0 8px;
			height: 30px;
			font-size: 12px;
			font-weight: normal;
			letter-spacing: 0.5px;
			vertical-align: top;
			box-sizing: border-box;
			border-radius: 2px;
		}

		.btn_none {
			background: #bdbdbd;
			color: #fff;
			font-size: 12px;
			line-height: 30px;
			font-weight: 400;
			letter-spacing: 1px;
			text-transform: uppercase;
			border-radius: 4px;
			text-decoration-line: none;
		}
   </style>

</head>

<body>

   <nav class="navbar fixed-top">
      <div class="container-fluid">
         <div>
            <nav class="navbar navbar-expand-lg navbar-light ">
               <div class="container-fluid">
                  <a class="navbar-brand" href="#">쇼핑몰</a>
                  <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                     data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false"
                     aria-label="Toggle navigation">
                     <span class="navbar-toggler-icon"></span>
                  </button>
                  <div class="collapse navbar-collapse" id="navbarScroll">
                     <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll"
                        style="-bs-scroll-height: 100px;">
                        <li class="nav-item"><a class="nav-link-left" href="#">
                              상품 </a></li>
                        <li class="nav-item"><a class="nav-link-left" href="#">outerm</a>
                        </li>
                        <li class="nav-item"><a class="nav-link-left" href="#" tabindex="-1"
                              aria-disabled="true">top</a></li>
                        <li class="nav-item"><a class="nav-link-left" href="#" tabindex="-1"
                              aria-disabled="true">bottom</a></li>
                        <li class="nav-item"><a class="nav-link-left" href="#" tabindex="-1"
                              aria-disabled="true">shoes</a></li>
                        <li class="nav-item"><a class="nav-link-left" href="#" tabindex="-1"
                              aria-disabled="true">acc</a></li>
                     </ul>
                  </div>
               </div>
            </nav>
         </div>

         <div class="d-flex">
            <form class="d-flex">
               <div class="search-bar">
                  <input class="search-bar__input" type="search" /> <i class="fas fa-search"></i>
               </div>
            </form>
            <div class="d-flex align-items-center">
               <div class="px-2">
                  <a class="nav-link-right">
                     login
                  </a>
               </div>
               <div class="px-2">
                  <a class="nav-link-right">
                     order
                  </a>
               </div>
               <div class="px-2">
                  <a class="nav-link-right">
                     basket
                  </a>
               </div>
            </div>
            <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas"
               data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
               <span class="navbar-toggler-icon"> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                     fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
                     <path fill-rule="evenodd"
                        d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z" />
                  </svg>
               </span>
            </button>
         </div>
      </div>
      <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
         <div class="offcanvas-header">
            <h5 class="offcanvas-title" id="offcanvasNavbarLabel">Offcanvas</h5>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
         </div>
         <div class="offcanvas-body sidebar-body p-5">
            <div>
               <div class="row">
                  <div class="col-6">
                     <h5 class="text-uppercase category-button sidebar-button-active" id="category_button">
                        category</h5>
                  </div>
                  <div class="col-6">
                     <h5 class="text-uppercase community-button" id="community_button">
                        community</h5>
                  </div>
               </div>
               <div class="row pt-5">
                  <ul class="col-6 list-unstyled" id="category_display">
                     <li class="mt-2"><a class="sidebar-link" href="#"> 상품 </a></li>
                     <li class="mt-2"><a class="sidebar-link" href="#">
                           outerm </a></li>
                     <li class="mt-2"><a class="sidebar-link" href="#"> top </a>
                     </li>
                     <li class="mt-2"><a class="sidebar-link" href="#">
                           bottom </a></li>
                     <li class="mt-2"><a class="sidebar-link" href="#"> shoes
                        </a></li>
                     <li class="mt-2"><a class="sidebar-link" href="#"> acc </a>
                     </li>
                  </ul>
                  <ul class="col-6 list-unstyled d-none" id="community_display">
                     <li class="mt-2"><a class="sidebar-link" href="#">
                           Notice </a></li>
                     <li class="mt-2"><a class="sidebar-link" href="#"> Q&A </a>
                     </li>
                     <li class="mt-2"><a class="sidebar-link" href="#">
                           Review </a></li>
                     <li class="mt-2"><a class="sidebar-link" href="#"> Chat
                        </a></li>
                  </ul>
               </div>
            </div>
         </div>
      </div>
   </nav>



   <aside class="aside">
      <div class="aside_header">
         <h3>마이페이지</h3>
      </div>
      <div class="aside_list">
         <div class="aside_ul">
            <div class="aside_li">
               <a href="">
                  계정정보
               </a>
            </div>
            <div class="aside_li">
               <a href="">
                  채팅
               </a>
            </div>
         </div>
      </div>
   </aside>


   <main class="main">
      <form action="/member/updateMypage.do" method="post" class="main_form form-row">
         <c:choose>
            <%-- myPage =  컨트롤러 MemberDto result = memberService.myPage(memberIdx); --%>
            <%-- user = 컨트롤러 model.addAttribute("user", idx); --%>
				<c:when test="${myPage.memberIdx == user}">
               <input type="hidden" name="memberIdx" value="${myPage.memberIdx}">
               <div class="form-group col-md-12">
                  <label for="user_id">아이디</label>
                  <input type="text"  readonly class="form-control"  id="user_id" name="memberId" value="${myPage.memberId }" placeholder="아이디">
               </div>
               <div class="form-group col-md-12">
                  <label for="user_email">이메일</label>
                  <input type="email" readonly class="form-control" id="user_email" name="memberEmail" value="${myPage.memberEmail }" placeholder="이메일">
               </div>
               <div class="form-group col-md-12">
                  <label for="user_name">이름</label>
                  <input type="text" class="form-control" id="user_name" name="memberName" value="${myPage.memberName }" value="이름">
               </div>
               <div class="form-group col-md-12">
                  <input readonly style="width: 80px;" type="text" id="user_addrNum" name="memberAdrrNum" value="${myPage.memberAdrrNum }" required="required">
                  <a href="#none" onclick="execDaumPostcode()" id="postBtn" class="btn_none btn_04">우편번호</a>
                  <br>
                  <input readonly style="width: 270px; margin: 5px 0 0;" placeholder="도로명주소" type="text" id="user_addr1" name="memberAdrrFirst" value="${myPage.memberAdrrFirst }" required="required" >
                  <br>
                  <input style="width: 270px; margin: 5px 0 0;" placeholder="상세주소" type="text" id="user_addr2" name="memberAdrrSecond" value="${myPage.memberAdrrSecond }" required="required" onfocus="this.placeholder = ''" onblur="this.placeholder = '상세주소'" >
               </div>
               <div class="form-group col-md-12">
                  <label for="inputEmail4">핸드폰번호</label>
                  <input class="form-control" type="text" id="user_phonNumber" name="memberphoneNum" value="${myPage.memberphoneNum }" value="핸드폰번호" maxlength="14" required="required">
               </div>
               <div class="button_group">
                  <button type="submit">수정하기</button> 
                  <button> <a href="">비밀번호 변경</a></button>
                  <button>탈퇴</button>
               </div>
            </c:when>

            <c:otherwise>
                    존재 하지 않는 회원 입니다.
                    <br>
                    로그인을 확인 해주세요.
            </c:otherwise>
         </c:choose>
      </form>
   </main>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
   crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/member/singup/singup.js"></script>
<script>
   //우편번호 검색
function execDaumPostcode() {
    new daum.Postcode( {
      oncomplete: function( data ) {
        document.getElementById( 'user_addrNum' ).value = data.zonecode;
        document.getElementById( 'user_addr1' ).value = data.address;
        document.getElementById( 'user_addr2' ).focus();
      }
    } ).open();
  }
</script>
</html>