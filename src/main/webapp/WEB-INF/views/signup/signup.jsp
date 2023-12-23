<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko-kr">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="/resources/mimg/movieRating/18.svg" type="">
	<title>Movivimvap</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://kit.fontawesome.com/0cf27f7ac1.js" crossorigin="anonymous"></script>

	<!-- sweetAlert2 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<!-- Alert Script -->
	<script src="../../../resources/js/common/alert.js"></script>
	<style>
		.table-head {
			padding: 10px 0 10px 8px;
			width: 20%;
			background: #f9f9f9 !important;
			vertical-align: middle;
			font-weight: normal;
			letter-spacing: 0.5px;
			text-align: center;
		}

		.table-row {
			height: 40px;
		}

		.table {
			width: 100%;
		}

		.table-column {
			width: 70%;
			text-align: left;
			vertical-align: middle;
		}

		.navbar-top {
			background: rgba(253, 253, 253, 0.3);
		}

		.nav-link {
			color: black !important;
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

		.container-table {
			padding-top: 100px;
		}

		.star {
			padding: 0 7px;
			color: orange;
			font-size: 1.5rem;
		}




		.check-box {
			background: #F9F9F9;
		}

		.check-box-header {
			font-size: 12px;
			padding-bottom: 15px;
		}

		.check-box-contents {
			background: white;
			border: 1px solid #ececec;
			height: 100px;
			overflow-y: scroll;
		}

		.check-box-footer {
			text-align: right;
		}

		.join {
			padding-top: 30px;
			text-align: center;
		}

		.join-button {
			padding: 10px 100px;
			border: 1px solid #dab799;
			background: #dab799;
			box-sizing: border-box;
			color: white;
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
	<%@ include file="/WEB-INF/views/common/navbar.jsp"%>


	<form action="/member/signup.do" method="post" id="submitForm" class="needs-validation">
		<div class="container container-table">
			<div class="d-flex justify-content-end">
				<span class="star">*</span> 필수 입력 사항
			</div>
			<table class="table">
				<tr class="table-row">
					<th class="table-head">아이디 <span class="star">*</span></th>
					<td class="table-column bg-white">
						<input type="text" name="memberId" id="user_id" required="required">
						<span id="idChkMsg">(영문 또는 영문 + 숫자의 조합, 8~16자)</span>
					</td>
				</tr>
				<tr class="table-row">
					<th class="table-head">비밀번호 <span class="star">*</span></th>
					<td class="table-column bg-white">
						<input type="password" name="memberPassword" id="password" onkeyup="validatePassword()" required="required">
						<span id="pwdMsg">(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자)</span>
					</td>
				</tr>
				<tr class="table-row">
					<th class="table-head">비밀번호 확인 <span class="star">*</span></th>
					<td class="table-column bg-white">
						<input type="password" name="memberPasswordChk" id="passwordChk" onkeyup="validatePassword()" required="required">
						<span id="pwdChkMsg"></span>
					</td>
				</tr>
				<tr class="table-row">
					<th class="table-head">이름 <span class="star">*</span></th>
					<td class="table-column bg-white">
						<input type="text" name="memberName" id="user_name" required="required">
					</td>
				</tr>
				<tr class="table-row">
					<th class="table-head">주소 <span class="star">*</span></th>
					<td class="table-column bg-white">
						<input readonly style="width: 80px;" type="text" name="memberAdrrNum" id="addrNum" required="required">
						<a href="#none" onclick="execDaumPostcode()" id="postBtn" class="btn_none btn_04">우편번호</a>
						<br>
						<input readonly style="width: 270px; margin: 5px 0 0;" placeholder="도로명주소" type="text" name="memberAdrrFirst" id="addr1" required="required" >
						<br>
						<input style="width: 270px; margin: 5px 0 0;" placeholder="상세주소" type="text" name="memberAdrrSecond" id="addr2" required="required" onfocus="this.placeholder = ''" onblur="this.placeholder = '상세주소'" >
					</td>
				</tr>
				<tr class="table-row">
					<th class="table-head">휴대전화 <span class="star">*</span></th>
					<td class="table-column bg-white">
						<input style="width: 270px;" name="memberphoneNum" type="text" oninput="oninputPhone(this)"
							maxlength="14" required="required">
					</td>
				</tr>
				<tr class="table-row">
					<th class="table-head">이메일 <span class="star">*</span></th>
					<td class="table-column bg-white">
						<input type="text" name="emailPrefix" id="str_email01" style="width:100px" required="required"> @
						<input type="text" name="emailSuffix" id="str_email02" style="width:100px;" required="required">
						<select style="width:100px;margin-right:10px" name="selectEmail" id="selectEmail">
							<option value="1" selected>직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="nate.com">nate.com</option>
							<option value="yahoo.co.kr">yahoo.co.kr</option>
							<option value="empas.com">empas.com</option>
							<option value="dreamwiz.com">dreamwiz.com</option>
							<option value="freechal.com">freechal.com</option>
							<option value="lycos.co.kr">lycos.co.kr</option>
							<option value="korea.com">korea.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="hanmir.com">hanmir.com</option>
							<option value="paran.com">paran.com</option>
						</select>
						<span id="emailChkMsg"></span>
					</td>
				</tr>
				<tr class="table-row">
					<th class="table-head">성별 <span class="star">*</span></th>
					<td class="table-column bg-white">
						<label for="man">남자</label>
						<input type="radio" name="memberGender" id="man" value="남" required="required">
						<label for="woman">여성</label>
						<input type="radio" name="memberGender" id="woman" value="여" required="required">
					</td>
				</tr>
				<tr class="table-row">
					<th class="table-head">생년월일 <span class="star">*</span></th>
					<td class="table-column bg-white">
						<input type="date" name="memberBirthday" required="required" />
					</td>
				</tr>
			</table>
		</div>

		<div class="container mt-5 py-5">
			<div class="check-box">
				<div class="top-check-box">
					<p>
						<input type="checkbox" id="all_check_box" onclick="toggleAllCheckboxes()"> 
						<label for="all_check_box">이용약관 및 개인정보수집 및 이용, 쇼핑정보 수신(필수)에 모두 동의합니다.
						</label>
					</p>
				</div>
				<div class="middle-check-box">
					<div class="p-5 check-box">
						<div class="check-box-header">[필수] 이용약관 동의</div>
						<div class="check-box-contents">

						</div>
						<div class="check-box-footer">
							이용약관에 동의 하십니까?
							<input type="checkbox" id="check-box-1" class="individualCheckbox">
							<label for="check-box-1">동의함</label>
						</div>
					</div>
				</div>
				<div class="middle-check-box">
					<div class="p-5 check-box">
						<div class="check-box-header">[필수] 이용약관 동의</div>
						<div class="check-box-contents">

						</div>
						<div class="check-box-footer">
							이용약관에 동의 하십니까?
							<input type="checkbox" id="check-box-2" class="individualCheckbox">
							<label for="check-box-2">동의함</label>
						</div>
					</div>
				</div>
				<div class="middle-check-box">
					<div class="p-5 check-box">
						<div class="check-box-header">[필수] 이용약관 동의</div>
						<div class="check-box-contents">

						</div>
						<div class="check-box-footer">
							이용약관에 동의 하십니까?
							<input type="checkbox" id="check-box-3" class="individualCheckbox">
							<label for="check-box-3">동의함</label>
						</div>
					</div>
				</div>
			</div>
			<div class="join">
				<button id="submitBtn" type="submit" onclick="join(event)" class="join-button">회원가입</button>
			</div>
		</div>
	</form>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/member/singup/singup.js"></script>
<script>
	  //이메일 선택
	  $('#selectEmail').change(function(){
        $("#selectEmail option:selected").each(function () {
             
             if($(this).val()== '1'){ //직접입력일 경우
                  $("#str_email02").val('');                        //값 초기화
                  $("#str_email02").prop("readonly",false); //활성화
             }else{ //직접입력이 아닐경우
                  $("#str_email02").val($(this).text());      //선택값 입력
                  $("#str_email02").prop("readonly",true); //비활성화
             }
        });
     });
</script>
</html>