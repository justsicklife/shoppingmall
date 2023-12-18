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


</head>

<body>

   <%@ include file="/WEB-INF/views/common/navbar.jsp"%>


   <main class="main">
      <section id="container">
         <div style="text-align: center; margin-top: 20px;">
            <h2 style="font-size: 24px;">회원탈퇴</h2>
         </div>

         <div class="w3-content w3-container w3-margin-top">
            <div class="w3-container w3-card-4">
               <form action="/member/memberDelete.do" method="post" id="deleteForm">
                  <p>
                     <label class="control-label" for="memberId">아이디</label>
                     <input class="form-control" type="text" id="memberId" name="memberId" value="${memberId}" readonly="readonly" />
                  </p>

                  <p>
                     <label class="control-label" for="memberPassword">패스워드</label>
                     <input class="form-control" type="password" id="memberPassword" name="memberPassword" placeholder="비밀번호:" required />
                  </p>

                  <p class="w3-center">
                     <button class="btn btn-success" type="submit" id="submit" onclick="deleteMember(event)">회원탈퇴</button>
                     <button type="button" onclick="history.go(-1);">취소</button>
                  </p>
               </form>
            </div>
         </div>

      </section>
   </main>

   <%@ include file="/WEB-INF/views/common/chat-button.jsp"%>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
   crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/member/singup/singup.js"></script>

<script>

//회원탈퇴 버튼 클릭
function deleteMember(event){
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
         memberPassword : memberPassword,
         memberId : memberId
      },
      success: function(response) {
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
      error: function() {
         alert("서버 오류");
      }
   })
}

</script>

</html>