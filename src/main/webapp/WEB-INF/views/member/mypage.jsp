<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
         <!-- JSTL length를 계산하기 위한 taglib -->
         <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
            <!DOCTYPE html>
            <html lang="ko-kr">

            <head>
               <meta charset="UTF-8">
               <meta name="viewport" content="width=device-width, initial-scale=1.0">
               <link rel="shortcut icon" href="/resources/mimg/movieRating/18.svg" type="">
               <title></title>
               <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
                  integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
                  crossorigin="anonymous">
               <script src="https://kit.fontawesome.com/0cf27f7ac1.js" crossorigin="anonymous"></script>
               <!-- jQuery CDN -->
               <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

               <link rel="preconnect" href="https://fonts.googleapis.com">
               <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
               <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">

               <style>
                  * {
                     font-family: 'IBM Plex Sans KR', sans-serif;
                  }
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
                     flex-direction: column;
                  }

                  body {
                     height: 100vh;
                  }

                  .main_form {
                     width: 400px;
                  }

                  .button_group {
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

                  .addr_input {
                     border: 1px solid #ced4da;
                     padding: .375rem .75rem;
                  }
                  .edit {
                     background: rgba(113, 113, 113, 1) !important;
                     color: white !important;
                  }
                  .change{
                     background: #bdbdbd !important;
                     color: white !important;
                  }
                  .withdraw{
                     background: white !important;
                     border: rgba(113, 113, 113, 1)  1px solid !important;
                     color: rgba(113, 113, 113, 1)  !important;
                  }
               </style>

            </head>

            <body>

               <%@ include file="/WEB-INF/views/common/navbar.jsp" %>


                  <!-- 
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
   </aside> -->


                  <main class="main">
                     <div>

                        <h3>회원 정보</h3>
                        <hr>
                        <form action="/member/updateMypage.do" method="post" id="updateForm" class="main_form form-row">
                           <c:choose>
                              <%-- myPage=컨트롤러 MemberDto result=memberService.myPage(idx); --%>
                                 <%-- user=컨트롤러 model.addAttribute("user", idx); --%>
                                    <c:when test="${myPage.memberIdx == user}">
                                       <input type="hidden" name="memberIdx" value="${myPage.memberIdx}">
                                       <div class="form-group col-md-12 my-3">
                                          <label for="user_id">아이디</label>
                                          <input type="text" readonly class="form-control" id="memberId" name="memberId"
                                             value="${myPage.memberId }" placeholder="아이디">
                                       </div>
                                       <div class="form-group col-md-12 my-3">
                                          <label for="user_email">이메일</label>
                                          <input type="email" readonly class="form-control" id="memberEmail"
                                             name="memberEmail" value="${myPage.memberEmail }" placeholder="이메일">
                                       </div>
                                       <div class="form-group col-md-12 my-3">
                                          <label for="user_name">이름</label>
                                          <input type="text" class="form-control" id="user_name" name="memberName"
                                             value="${myPage.memberName }" value="이름">
                                       </div>
                                       <div class="form-group col-md-12 my-3">
                                          <label for="user_adress">주소</label>
                                          <br>
                                          <input class="addr_input" readonly style="width: 80px;" type="text"
                                             id="user_addrNum" name="memberAdrrNum" value="${myPage.memberAdrrNum }"
                                             required="required">
                                          <a href="#none" onclick="execDaumPostcode()" id="postBtn"
                                             class="btn_none btn_04">우편번호</a>
                                          <br>
                                          <input class="addr_input" readonly style="width: 100%; margin: 5px 0 0;"
                                             placeholder="도로명주소" type="text" id="user_addr1" name="memberAdrrFirst"
                                             value="${myPage.memberAdrrFirst }" required="required">
                                          <br>
                                          <input class="addr_input" style="width: 100%; margin: 5px 0 0;"
                                             placeholder="상세주소" type="text" id="user_addr2" name="memberAdrrSecond"
                                             value="${myPage.memberAdrrSecond }" required="required"
                                             onfocus="this.placeholder = ''" onblur="this.placeholder = '상세주소'">
                                       </div>
                                       <div class="form-group col-md-12 my-3">
                                          <label for="inputEmail4">핸드폰번호</label>
                                          <input class="form-control" type="text" id="user_phonNumber"
                                             name="memberphoneNum" value="${myPage.memberphoneNum }" value="핸드폰번호"
                                             maxlength="14" required="required">
                                       </div>
                                       <div class="button_group">
                                          <button type="submit" class="edit btn" onclick="update(event)">수정하기</button>
                                          <a class="btn change">비밀번호 변경</a>
                                          <a class="withdraw btn" href="/member/memberDeletePage">탈퇴</a>
                                       </div>
                                    </c:when>

                                    <c:otherwise>
                                       존재 하지 않는 회원 입니다.
                                       <br>
                                       로그인을 확인 해주세요.
                                    </c:otherwise>
                           </c:choose>
                        </form>

                     </div>
                  </main>

                  <%@ include file="/WEB-INF/views/common/chat-button.jsp" %>
                     <%@ include file="/WEB-INF/views/common/footer.jsp" %>

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
                  new daum.Postcode({
                     oncomplete: function (data) {
                        document.getElementById('user_addrNum').value = data.zonecode;
                        document.getElementById('user_addr1').value = data.address;
                        document.getElementById('user_addr2').focus();
                     }
                  }).open();
               }

               //수정하기 버튼 클릭
               function update(event) {
                  console.log("수정 버튼 클릭");

                  // 폼 데이터 직렬화
                  var formData = $("#updateForm").serialize();

                  // 폼 제출의 기본 동작 막기
                  event.preventDefault();

                  // AJAX 요청 보내기
                  $.ajax({
                     type: "POST",
                     url: "/member/updateMyPage.do",
                     data: formData,
                     success: function (response) {
                        console.log(formData);
                        if (response === "success") {
                           // 폼 제출 
                           // 컨트롤러에서 바로 저장하기 때문에 form 제출해서 다시 저장 할 필요 없음 ( 두번 실행시 에러 발생 )
                           // document.getElementById("updateForm").submit();

                           alert("개인정보가 수정되었습니다");

                           // 현재 창 리로드
                           location.reload();
                        } else {
                           alert("수정 실패");

                           // 현재 창 리로드
                           location.reload();
                        }
                     },
                     error: function () {
                        alert("서버 오류");
                     }
                  })
               }

            </script>

            </html>