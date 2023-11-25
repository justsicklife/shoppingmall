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
	</style>

</head>

<body>

	<div class="container container-table">
		<div class="d-flex justify-content-end">
			<span class="star">*</span> 필수 입력 사항
		</div>
		<table class="table">
			<tr class="table-row">
				<th class="table-head">아이디 <span class="star">*</span></th>
				<td class="table-column bg-white">
					<input type="text" name="" id="">
					(영문소문자/숫자, 4~16자)
				</td>
			</tr>
			<tr class="table-row">
				<th class="table-head">비밀번호 <span class="star">*</span></th>
				<td class="table-column bg-white">
					<input type="text" name="" id="">
					(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자)
				</td>
			</tr>
			<tr class="table-row">
				<th class="table-head">비밀번호 확인 <span class="star">*</span></th>
				<td class="table-column bg-white">
					<input type="text" name="" id="">
				</td>
			</tr>
			<tr class="table-row">
				<th class="table-head">주소 <span class="star">*</span></th>
				<td class="table-column bg-white">
					<input type="text" name="" id="">
				</td>
			</tr>
			<tr class="table-row">
				<th class="table-head">휴대전화 <span class="star">*</span></th>
				<td class="table-column bg-white">
					<input style="width: 250px;" type="text" class="form-control" oninput="oninputPhone(this)"
						maxlength="14">
				</td>
			</tr>
			<tr class="table-row">
				<th class="table-head">이메일 <span class="star">*</span></th>
				<td class="table-column bg-white">
					<input style="width: 250px;" type="email" class="form-control" maxlength="14">
				</td>
			</tr>
			<tr class="table-row">
				<th class="table-head">성별 <span class="star">*</span></th>
				<td class="table-column bg-white">

					<label for="man">남자</label>
					<input type="radio" name="sex" id="man">
					<label for="woman">여성</label>
					<input type="radio" name="sex" id="woman">
				</td>
			</tr>
			<tr class="table-row">
				<th class="table-head">생년월일 <span class="star">*</span></th>
				<td class="table-column bg-white">
					<label>생일</label>
					<input type="date" />
				</td>
			</tr>
		</table>
	</div>

	<div class="container mt-5">
		<div class="check-box">
			<div class="top-check-box">
				<p>
					<input type="checkbox" id="all_check_box"> <label for="all_check_box">이용약관 및 개인정보수집 및 이용, 쇼핑정보
						수신(선택)에 모두 동의합니다.
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
						<input type="checkbox" id="check-box-1" />
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
						<input type="checkbox" id="check-box-1" />
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
						<input type="checkbox" id="check-box-1" />
						<label for="check-box-1">동의함</label>
					</div>
				</div>
			</div>
		</div>
		<div class="join">
			<button class="join-button">회원가입</button>
		</div>
	</div>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	function oninputPhone(target) {
		target.value = target.value
			.replace(/[^0-9]/g, '')
			.replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
	}
</script>

</html>