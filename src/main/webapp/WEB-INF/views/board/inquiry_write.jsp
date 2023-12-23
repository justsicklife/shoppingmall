<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- important mandatory libraries -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link
	href="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-star-rating@4.1.2/css/star-rating.min.css"
	media="all" rel="stylesheet" type="text/css" />

<link
	href="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-star-rating@4.1.2/themes/krajee-svg/theme.css"
	media="all" rel="stylesheet" type="text/css" />

<script
	src="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-star-rating@4.1.2/js/star-rating.min.js"
	type="text/javascript"></script>

<!-- with v4.1.0 Krajee SVG theme is used as default (and must be loaded as below) - include any of the other theme JS files as mentioned below (and change the theme property of the plugin) -->
<script
	src="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-star-rating@4.1.2/themes/krajee-svg/theme.js"></script>

<!-- optionally if you need translation for your language then include locale file as mentioned below (replace LANG.js with your own locale file) -->
<script
	src="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-star-rating@4.1.2/js/locales/LANG.js"></script>


<link rel="stylesheet" href="/resources/css/product/detail/detail.css">

<!-- chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style> 
	.secret{
		margin-right: 10px; 
	}
</style>

</head>

<body>

	<main class="container py-5" style="min-height: 730px;">
		<!-- 작성 -->
		<h3>상품 문의</h3>
		<hr>
		<br>
		<form action="/board/insert.do" method="post" >
			<input type="hidden" name="boardProductNum" value="${productId}"/>
			<div class="row">
				<div class="col-3 mb-3">
					<select class="form-select" id="category" name="boardCategory" required="required">
						<option disabled>문의 선택</option>
						<option value="배송">배송</option>
						<option value="상품 문의">상품 문의</option>
						<option value="재입고">재입고</option>
					</select>
				</div>	
				<div class="col-3 mb-3 d-flex align-items-center">
					<label for="secret" class="secret">비밀글</label>
					<input type="checkbox" name="boardSecret" id="secretChk" value="1">
				</div>
				<P>클레임(교환/환불/취소)관련 문의는 마이페이지 > 1:1 문의에서 문의 바랍니다.</P>
			</div>
			<div class="input-group mb-3">
				<input type="text" class="form-control" name="boardTitle" maxlength="33"
					id="title" placeholder="제목을 입력하세요" required="required">
			</div>
			<div id="write" class="mb-3 justify-content-center" style="background-color:#fff;">
				<textarea name="boardContent" id="editorTxt" class="form-control" rows="13"
					cols="10" placeholder="내용을 입력하세요" required="required"></textarea>
			</div>
			<div class="row">
				<div class="col text-center">
					<button type="button" class="btn btn-outline-warning" onclick="submitForm()">작성</button>
					<button type="button" class="btn btn-outline-secondary"
						onclick="window.opener.location.reload(); window.close();">취소</button>
				</div>
			</div>
		</form>

	</main>

</body>

<script src="/resources/js/board/inquiry_write.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
	integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
	crossorigin="anonymous"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
	integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
	crossorigin="anonymous"></script>

<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
	integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
	crossorigin="anonymous"></script>

</html>