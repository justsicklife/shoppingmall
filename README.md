<div align=right>   
  
[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fjustsicklife%2Fshoppingmall&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://hits.seeyoufarm.com)

</div>
<img src="https://capsule-render.vercel.app/api?type=waving&color=0:EEFF00,100:a82da8&height=150&section=header" />


# 쇼핑몰 프로젝트 Readme

---

학원 수료 후 느꼈던 미흡한 부분을 보완하고 다양한 기능을 학습하며 구현 해보고자 했습니다. <br>
쇼핑몰은 웹 개발, 사용자 경험, 다양한 API등을 다루며 풀스택 경험을 쌓을 수 있는 효과적인 주제라고 생각 했습니다.
 

---
<br>

# 사용된 기술 스택

<div>
  <img src="https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=Spring&logoColor=white">
  <img src="https://img.shields.io/badge/ApacheMaven-C71A36?style=for-the-badge&logo=apachemaven&logoColor=white">
  <img src="https://img.shields.io/badge/MyBatis-000000?style=for-the-badge&logo=&logoColor=white">
  <img src="https://img.shields.io/badge/JSTL-071D49?style=for-the-badge&logo=&logoColor=white">
  <img src="https://img.shields.io/badge/oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white">
  <img src="https://img.shields.io/badge/AJAX-02303A?style=for-the-badge&logo=&logoColor=white">
  <img src="https://img.shields.io/badge/FETCH-FF4F8BA?style=for-the-badge&logo=&logoColor=white">
  <img src="https://img.shields.io/badge/bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white">
  <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=white">
  <img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white">
</div>
<br>
<br>

## 팀원 소개 & 담담 기능 소개


- **김성진**
    - 회원 관련 모든 기능 전담, Q&A 게시판
        -   일반 회원 가입/로그인 ( 이메일 인증을 통한 일반 회원 가입 )
        -   API를 이용한 소셜 회원 가입/로그인 ( 네이버, 카카오 )
        -   마이 페이지를 통한 회원 정보 수정
        -   ID 및 Password 찾기
        -   회원 탈퇴
           
        -   회원 문의 CRUD
        -   관리자 문의 내용을 열람/답변/수정
     
          
- **정하형**
    - 상품 추가,보기,리뷰, 채팅방 기능 전담
        - 상품 추가 & 상품 디테일
        - 리뷰 수정/ 삭제
        - 관리자 & 유저 1 : N 채팅기능
          
---
<br>

## 주요기능

[프로젝트 요구사항]

```
1. 회원은 "일반 회원가입" 과 "소셜 회원가입" 중 선택하여 가입할 수 있습니다.
2. "소셜 회원가입"을 이용해 가입한 회원은 소셜 정보를 이용해 회원가입이 가능합니다.
3. "일반 회원가입"을 이용해 이메일 인증 후 가입한 회원은 아이디와 비밀번호를 통해 로그인합니다.
4. 회원은 마이페이지 내에서 본인의 정보를 열람 및 수정할 수 있으며, 탈퇴할 수 있습니다.
5. 관리자는 상품게시를 할수 있습니다. (상품 이름, 상품 설명, 상품 사진 등)
6. 회원은 등록된 상품에 리뷰 와 문의를 할수있습니다.
7. 단 회원의 리뷰는 상품하나당 하나씩 달수있습니다.
8. 관리자는 문의에 답장할수있고 답장을 수정,삭제 할수있습니다.
9. 회원은 관리자와 1:1 상담을 할수있습니다.
10. 관리자는 회원들과 1:N 상담을 할수있습니다.
```

---
<br>

### [회원, Q&A 관련] 김성진

>회원가입
>
1. 회원은 "일반 회원가입"과 "소셜 회원가입" 중 선택하여 가입할 수 있습니다.

2. 소셜 회원가입   
    2-1. 소셜로그인회원의 경우 추가 본인확인 없이 회원가입이 가능합니다.( Naver / Kakao )  
    2-2. 소셜로그인회원의 경우 엑세스토큰 발급을 위한 소셜로그인링크 클릭 시 인증서버로 이동됩니다.  
    2-3. 사용자 필수정보이용 동의 후 엑세스 토큰 발행, 이 토큰을 이용해 Naver( or Kakao )에 사용자 정보를 받아와 회원가입을 진행 합니다.  

3. 일반 회원가입   
    3-1. 일반회원의 경우 이메일 인증 후 회원가입이 가능합니다.(JavaMail)  
    3-2. TempKey 클래스를 실행시켜 ASCII 코드값을 50개 만들어 문자로 변환 후 StringBuffer에 추가하여 인증번호를 생성합니다.  
    3-3. 생성 된 인증 번호는 이메일과 함께 전송되며 DB에 이메일 주소와 인증번호가 저장 됩니다.  
    3-4. '이메일 인증 확인' 버튼 클릭 시 DB에 인증 유/무 칼럼이 업데이트 되고 회원가입이 완료됩니다.  
    3-5. 이메일과 ID/PW는 유효성 검증이 필요하며 비동기 통신으로 진행됩니다.  

>로그인 / 로그아웃
>
1. '소셜로그인'을 이용해 가입한 회원은 네이버or카카오 로그인 정보를 이용해 바로 로그인이 가능합니다.
2. 사용자 소셜로그인 버튼 클릭 시 해당 사용자 이메일주소( SNS ID )를 이용해 DB 조회 합니다.
3. 조회 결과 일치하는 이메일이 있을 경우, 해당 사용자의 회원번호를 반환하며 로그인 합니다.
4. '이메일 인증'을 이용해 가입한 회원은 ID/PW 입력 후 정보 일치 시 로그인이 가능합니다.  
   (이메일 인증을 하지 않고 로그인시 인증 요청 페이지로 이동 합니다.)
5. 사용자의 비밀번호는 bcryptPasswordEncoder 로 암호화 되어 관리됩니다.
6. 세션만료로 로그아웃이 가능합니다.

>회원정보수정 / 탈퇴
>
1. 마이페이지는 로그인 한 사용자만 접근 가능하도록 session 내 회원번호 유무를 확인해 마이페이지를 활성화 합니다.
2. 마이페이지에서 사용자는 이름, 주소, 핸드폰 번호 수정 및 비밀번호를 변경 할 수 있습니다.
3. 회원 탈퇴 시 휴면 계정이 아닌 즉시 탈퇴 되며 DB에서 삭제 됩니다.



>회원 - 문의
>
1. 회원은 각각의 상품 디테일 페이지에서 문의 작성/열람/수정/삭제 합니다.
2. 문의에서는 비밀글 체크, 문의 카테고리 지정, 제목, 내용을 작성/수정 할 수 있습니다.
3. 비밀글은 작성자, 관리자만 열람 할 수 있습니다.
4. 답변여부 상태는 문의글을 열람하지 않고 확인 할 수 있습니다. ( 비로그인도 가능 )
5. 문의를 삭제시 답변이 있을 경우 답변과 함께 삭제 됩니다.

>관리자 - 답변
>
1. 관리자는 회원들의 문의를 열람/답변/수정 만 가능합니다. 
2. 관리자는 모든 비밀글을 열람 할 수 있습니다.



---



### [상품, 상담 관련] **정하형**

> 상품 추가 & 디테일 & 리뷰 & 채팅
> 
1. 상춤 추가  
    1-1. 상품을 추가 할시 모든 항복의 null 여부의 검사를 JS 에서만 검사합니다.   
    1-2. 로그인 정보가 없는 상태에서 추가 페이지로의 접속을 제한합니다. 이는 JSP 단에서 버튼을 보여주지 않으며, JAVA의 인터셉터를 통해 다시 한번 제한합니다   
    1-3. 스마트에디터를 사용해서 textEditor 로 상품의 설명을 작성할수있습니다.  
    1-4. multipart/form-data 를 사용해 클라이언트에서 서버로 파일 전송   
2. 상품 디테일  
    2-1. 상품 디테일에는 상품 사진, 상품 설명, 이름 등등 이 있고 리뷰 작성 문의 작성을 할수 있습니다.  
3. 리뷰 작성,업데이트,삭제  
    3-1. 리뷰를 작성하려면 로그인한 상태에서 작성할수있는데 JSP 단에서 버튼을 보여주지 않으며 JAVA의 인터셉터를 통해 다시 한번 제한합니다.  
    3-2. 리뷰 수정 & 삭제는 리뷰 작성자만이 게시글 수정&삭제 멘뮤에 접근할수있습니다. JSP 에서 비활성화 했지만 JAVA 에서 검사하여 올바르지 않은 접근의 경우에는 로그인 창으로 돌려보냅니다.   
4. 채팅  
    4-1. stomp를 이용해 채팅방을 수신자 송신자를 구분함   
    4-2. 유저가 문자를 보내면 어드민 쪽에서 알림이 옵니다.  
    4-3. 보낸 메시지와 받은 메시지를 구분하여 createElement로 메시지마다 새로운 div를 만들어 출력하여 보여줍니다.  
    4-4. 주고 받은 메시지를 DB에 저장하고, 이전 메시지들을 다시 불러와 출력합니다.  

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:EEFF00,100:a82da8&height=150&section=footer" />
