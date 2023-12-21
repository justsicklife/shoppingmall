// 약관동의 체크박스
function toggleAllCheckboxes() {
    console.log("전체 선택 클릭");

    // 전체 선택 체크박스
    const selectAllCheckbox = document.getElementById("all_check_box");

    // 개별 체크박스들
    const individualCheckboxes = document.getElementsByClassName("individualCheckbox");

    // 개별 체크박스 중 하나라도 체크되지 않으면 전체 선택 체크박스도 해제
    let allChecked = true;
    for (let i = 0; i < individualCheckboxes.length; i++) {
        console.log("전체 체크");
        individualCheckboxes[i].checked = selectAllCheckbox.checked;
        if (!individualCheckboxes[i].checked) {
            allChecked = false;
        }
    }

    // 전체 선택 체크박스의 상태 설정
    selectAllCheckbox.checked = allChecked;
}

// 개별 체크박스 클릭 시
function handleIndividualCheckboxClick() {
    // 전체 선택 체크박스
    const selectAllCheckbox = document.getElementById("all_check_box");

    // 개별 체크박스들
    const individualCheckboxes = document.getElementsByClassName("individualCheckbox");

    // 개별 체크박스 중 하나라도 체크해제되면 전체 선택 체크박스도 해제
    let allChecked = true;
    for (let i = 0; i < individualCheckboxes.length; i++) {
        if (!individualCheckboxes[i].checked) {
            allChecked = false;
            break; // 하나라도 체크가 해제되면 더이상 확인할 필요가 없음
        }
    }

    // 전체 선택 체크박스의 상태 설정
    selectAllCheckbox.checked = allChecked;
}

// 개별 체크박스에 이벤트 리스너 등록
document.addEventListener("DOMContentLoaded", function () {
    const individualCheckboxes = document.getElementsByClassName("individualCheckbox");
    for (let i = 0; i < individualCheckboxes.length; i++) {
        individualCheckboxes[i].addEventListener("click", handleIndividualCheckboxClick);
    }
});

//비밀번호 유효성 검사
function validatePassword() {
    // 비밀번호 정책
    // 대,소문자 1개이상, 특수문자 1개 이상, 6자리 이상 20자리 이하
    const passwordRegex = /^(?=.*[a-zA-Z])(?=.*[@$!%*?&\#])[A-Za-z\d@$!%*?&\#]{8,20}$/;
    // 입력한 비밀번호 값을 가져옴
    const password = document.getElementById("password").value;

    // 비밀번호 정책 메시지 출력하는 id 불러옴
    const msg = document.getElementById("pwdMsg");

    //비밀번호 == 비밀번호 확인 검사
    const passwordChk = document.getElementById("passwordChk").value;
    const pwdChkMsg = document.getElementById("pwdChkMsg");

    //test : 자바스크립트에 내장 된 함수. 정규식이 맞는지 검사

    if (passwordRegex.test(password)) {
        msg.innerHTML = "사용 가능한 비밀번호 입니다.";
        msg.style.color = "green";
    } else {
        msg.innerHTML = "패스워드 정책에 맞지 않습니다.";
        msg.style.color = "red";
    }


    if (password === passwordChk) {
        pwdChkMsg.innerHTML = "패스워드가 동일합니다.";
        pwdChkMsg.style.color = "green";
    } else if(password !== passwordChk && passwordChk == ""){
        pwdChkMsg.innerHTML = "";
    } else {
        pwdChkMsg.innerHTML = "패스워드가 동일하지 않습니다.";
        pwdChkMsg.style.color = "red";
    }


    if(password == ""){
        msg.innerHTML = "(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자)";
        msg.style.color = "black";
        pwdChkMsg.innerHTML = "";
    }
}

//우편번호 검색
function execDaumPostcode() {
    new daum.Postcode( {
      oncomplete: function( data ) {
        document.getElementById( 'addrNum' ).value = data.zonecode;
        document.getElementById( 'addr1' ).value = data.address;
        document.getElementById( 'addr2' ).focus();
      }
    } ).open();
  }

// 이메일, 아이디 중복 확인 + 이메일 인증 + 회원가입 AJAX
function join(event) {
    // 폼 제출의 기본 동작 막기
    event.preventDefault();

    console.log("가입 버튼 클릭됨!");

    // 약관 동의 전체 선택 체크박스
    const selectAllCheckbox = document.getElementById("all_check_box");

    //이메일 부분
    // const user_email = document.getElementById("user_email").value;
    const str_email01 = $("#str_email01").val();
    const str_email02 = $("#str_email02").val();
    const emailChkMsg = $("#emailChkMsg");
    //test@test 가능
    const emailRegex = /^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
    // 두 이메일 부분을 합친 값을 만듭니다.
    const user_email = str_email01 + "@" + str_email02;


    //id 부분 (idChkMsg만 자바스크립트 한 이유는 가끔 발생하는 jquery버그)
    const user_id = $("#user_id").val();
    const idChkMsg = document.getElementById("idChkMsg");
    const idRegex = /^(?=.*[a-zA-Z])[a-zA-Z0-9]{8,16}$/;


    // 비밀번호 부분
    const password = $("#password").val();
    const passwordChk = $("#passwordChk").val();
    const pwdChkMsg = $("#pwdChkMsg");
    const passwordRegex = /^(?=.*[a-zA-Z])(?=.*[@$!%*?&\#])[A-Za-z\d@$!%*?&\#]{8,20}$/;

    // 생년월일 부분
    const birthDate = $("input[type='date']").val();

    // 휴대전화 부분
    const phone = $("input[type='text'][maxlength='14']").val();

    // 성별 부분
    const gender = $("input[type='radio'][name='memberGender']:checked").val();

    // 이름 부분
    const name = $("#user_name").val();

    // 주소 부분
    const address1 = $("#addr1").val();
    const address2 = $("#addr2").val();


    // test = 자바스크립트에서 제공하는 함수
    if (!emailRegex.test(user_email)) {
        console.log("이메일 형식이 맞지 않습니다.");
        emailChkMsg.html("이메일 형식이 맞지 않습니다.").css("color", "red");
    }else{
        console.log("이메일 형식 맞음");
        emailChkMsg.html("");
    }

    if (!idRegex.test(user_id)) {
        console.log("아이디 생성 조건을 만족하지 않습니다.");
        idChkMsg.innerHTML = "아이디 생성 조건을 만족하지 않습니다.";
        idChkMsg.style.color = "red";
        // idChkMsg.html("아이디 생성 조건을 만족하지 않습니다.").css("color", "red");
    }else{
        console.log("아이디 형식 맞음");
        idChkMsg.innerHTML = "";
        // idChkMsg.html("");
    }
    
    if (!birthDate || !phone || !gender || !address1 || !address2 ||!name) {
        alert("필수 입력 항목을 입력해주세요.");
    } else if (!passwordRegex.test(password)) {
        alert("비밀번호 형식이 맞지 않습니다.");
    } else if (password !== passwordChk) {
        alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
    } else if(!selectAllCheckbox.checked){
        console.log("약관 동의 안함");
        alert("이용약관 및 개인정보수집 및 이용, 쇼핑정보 수신에 동의 해주세요");
    }


    //ajax
    if (emailRegex.test(user_email) && idRegex.test(user_id) && selectAllCheckbox.checked 
        && passwordRegex.test(password) && password === passwordChk && birthDate
        && phone && gender && address1 && address2 && name) {
        // alert("필수 항목 모두 입력 완료, ajax 실행");
        console.log("필수 항목 모두 입력 완료, ajax 실행");
        $.ajax({
            type: "POST",
            url: "/member/checkMember.do",
            data: {
                id: user_id,
                email: user_email
            },
            success: function (memberChk) {
                if (memberChk === "success") {
                    // alert("메일함을 확인 후 인증 버튼을 눌러주세요");

                    // 폼 제출
                    document.getElementById("submitForm").submit();
                } else if (memberChk === "emailFailed")  {
                    console.log("이메일 중복");
                    alert("이미 사용 중인 이메일 입니다.");
                    emailChkMsg.html("이미 사용 중인 이메일 입니다.").css("color", "red");
                } else if (memberChk === "idFailed")  {
                    console.log("아이디 중복");
                    alert("이미 사용 중인 아이디 입니다.");
                    idChkMsg.innerHTML = "이미 사용 중인 아이디 입니다.";
                    idChkMsg.style.color = "red";
                } else if (memberChk === "failed")  {
                    console.log("이메일, 아이디 중복");
                    alert("아이디, 이메일을 확인 해주세요.");
                    idChkMsg.innerHTML = "이미 사용 중인 아이디 입니다.";
                    idChkMsg.style.color = "red";
                    emailChkMsg.html("이미 사용 중인 이메일 입니다.").css("color", "red");
                } 
            },
            error: function () {
                console.log("아이디 및 이메일 중복 확인 Ajax 오류");
            }
        });
    }else{
        console.log("ajax 조건 불일치")
    }
}
