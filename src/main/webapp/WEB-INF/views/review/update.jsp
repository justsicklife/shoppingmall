<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap"
	rel="stylesheet">

<style>
.form {
	width: 60%;
	height: 300px;
	margin: 0 20%;
	font-size: 16px;
}

.review_content {
	width: 100%;
	height: 300px;
}

* {
	font-family: 'IBM Plex Sans KR', sans-serif;
}

.dir-column {
	flex-direction: column;
}

.form-box {
	width: 60%;
	margin: 0 20%;
}
</style>

<style>
.form {
	width: 60%;
	height: 300px;
	margin: 0 20%;
	font-size: 16px;
}

.review_content {
	width: 100%;
	height: 300px;
}

* {
	font-family: 'IBM Plex Sans KR', sans-serif;
}

.dir-column {
	flex-direction: column;
}

.form-box {
	width: 60%;
	margin: 0 20%;
}
</style>
</head>

<body>
	<%@ include file="/WEB-INF/views/common/navbar.jsp"%>


	<div class="container vh-100 d-flex justify-content-center align-items-center dir-column">
		<div class="form-box">
			<h3>리뷰 작성</h3>
			<hr>
			<form action="/review/update" method="post">
				<input type="hidden" name="product_id" value="${review.product_id}">
			<input type="hidden" name="member_id" value="${review.member_id}">
			<input type="hidden" name="review_id" value="${review.review_id}">
		
			<input name="review_score" id="input-id" type="text" class="rating"
					data-show-caption="false" data-show-clear="false" required
					data-size="sm" value="${review.review_score }">
				<input type="hidden" name="product_id" value="${product_id}">
				<input type="hidden" name="member_id" value="${member_id}">
				<div class="form-group purple-border">
					<textarea class="review_content" name="review_content"
						class="review_content" id="exampleFormControlTextarea1" required
						rows="3">${review.review_content}</textarea>
				</div>
				<div class="d-flex justify-content-center">
					<button type="submit" class="btn btn-outline-warning">작성</button>
					<button type="button" class="btn btn-outline-secondary"
						onclick="history.back();">취소</button>
				</div>
			</form>
		</div>

	</div>
	
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	
	
</body>
<script>
	//initialize with defaults
	$("#input-id").rating({
		'size' : 'sm',
		'step' : "1",
	});
</script>

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