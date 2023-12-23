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
                  .box {
                     width: 50%;
                  }
                  .withdraw_info {
                     background: #e9ecef;
                     width: 600px;
                     border-bottom: 1px solid rgb(33, 37, 41);
                     border-top: 1px solid rgb(33, 37, 41);
                     padding: 15px;
                  }
                  .member_id,.member_password{
                     width: 40% !important;
                  }
                  .withdraw_info p:first-child {
                     font-weight: bold;
                  }
                  .content{
                     padding-bottom: 0px;
                     margin-bottom:0px;
                  }
                  .withdraw_button{
                     background: rgb(113, 113, 113) !important;
                     color: white !important;
                  }
                  .cancer_button {
                     background-color: rgb(189, 189, 189) !important;
                     color: white !important;
                  }
               </style>
            </head>

            <body>

               <%@ include file="/WEB-INF/views/common/navbar.jsp" %>


                  <main class="main">
                     <section class="vh-100 container flex-column d-flex align-items-center justify-content-center">
                        <div class="box">

                           <div style="margin-top: 20px;">
                              <h2 style="font-size: 24px;">회원탈퇴</h2>
                           </div>
                           <hr style="width: 600px;">
                           <div class="w3-content w3-container w3-margin-top">
                              <div class="w3-container w3-card-4">
                                 <form action="/member/memberDelete.do" method="post" id="deleteForm">
                                    <p>
                                       <label class="control-label" for="memberId">아이디</label>
                                       <input class="member_id form-control" type="text" id="memberId" name="memberId"
                                          value="${memberId}" readonly="readonly" />
                                    </p>

                                    <p>
                                       <label class="control-label" for="memberPassword">패스워드</label>
                                       <input class="member_password form-control" type="password" id="memberPassword"
                                          name="memberPassword" placeholder="비밀번호:" required />
                                    </p>
                                    <div class="withdraw_info">
                                       <p>
                                          회원탈퇴 완료 시 해당 계정의 모든 정보가 삭제되어 복구가 불가능합니다.
                                       </p>
                                       <p>
                                          - 해당 계정의 모든 정보가 삭제되며 복구가 불가능합니다.
                                       </p>
                                       <p class="content">
                                          - 회원탈퇴 신청 즉시 모든 서비스가 정지되며, 회원 전용 서비스의 이용이 불가능합니다.
                                       </p>
                                    </div>
                                    <p class="text-center pt-4" style="width: 600px;">
                                       <button class="btn withdraw_button" type="submit" id="submit"
                                          onclick="deleteMember(event)">회원탈퇴</button>
                                       <button class="btn cancer_button" type="button" onclick="history.go(-1);">취소</button>
                                    </p>
                                 </form>
                              </div>
                           </div>
                        </div>

                     </section>
                  </main>

                  <%@ include file="/WEB-INF/views/common/chat-button.jsp" %>
                     <%@ include file="/WEB-INF/views/common/footer.jsp" %>


            </body>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
               integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
               crossorigin="anonymous"></script>

            <script src="https://code.jquery.com/jquery-latest.min.js"></script>
            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
            <script src="/resources/js/member/singup/singup.js"></script>

            <script>

               //회원탈퇴 버튼 클릭
               function deleteMember(event) {
                  console.log("회원탈퇴 버튼 클릭");

                  var memberPassword = $("#memberPassword").val();
                  var memberId = $("#memberId").val();

                  // 폼 제출의 기본 동작 막기
                  event.preventDefault();

                  // AJAX 요청 보내기
                  $.ajax({
                     type: "POST",
                     url: "/member/memberDelete.do",
                     data: {
                        memberPassword: memberPassword,
                        memberId: memberId
                     },
                     success: function (response) {
                        console.log(memberPassword);
                        if (response === "success") {
                           // 폼 제출 
                           // 컨트롤러에서 바로 저장하기 때문에 form 제출해서 다시 저장 할 필요 없음 ( 두번 실행시 에러 발생 )
                           // document.getElementById("deleteForm").submit();

                           alert("정상적으로 탈퇴 되었습니다.");


                           // 탈퇴 성공 시 editMyPage로 리다이렉트
                           window.location.href = "/product/index";

                        } else {
                           alert("탈퇴에 실패 하였습니다.");

                           history.go(-1);
                        }
                     },
                     error: function () {
                        alert("서버 오류");
                     }
                  })
               }

            </script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
               integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
               crossorigin="anonymous"></script>
            <script src="https://code.jquery.com/jquery-latest.min.js"></script>
            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

            </html>