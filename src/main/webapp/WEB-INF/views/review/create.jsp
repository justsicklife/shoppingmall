<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">

<!-- default styles -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
<link
	href="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-star-rating@4.1.2/css/star-rating.min.css"
	media="all" rel="stylesheet" type="text/css" />

<!-- with v4.1.0 Krajee SVG theme is used as default (and must be loaded as below) - include any of the other theme CSS files as mentioned below (and change the theme property of the plugin) -->
<link
	href="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-star-rating@4.1.2/themes/krajee-svg/theme.css"
	media="all" rel="stylesheet" type="text/css" />

<!-- important mandatory libraries -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-star-rating@4.1.2/js/star-rating.min.js"
	type="text/javascript"></script>

<!-- with v4.1.0 Krajee SVG theme is used as default (and must be loaded as below) - include any of the other theme JS files as mentioned below (and change the theme property of the plugin) -->
<script
	src="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-star-rating@4.1.2/themes/krajee-svg/theme.js"></script>

<!-- optionally if you need translation for your language then include locale file as mentioned below (replace LANG.js with your own locale file) -->
<script
	src="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-star-rating@4.1.2/js/locales/LANG.js"></script>

<style>
.form {
	width: 60%;
	height: 300px;
	margin: 0 20%;
	font-size: 16px;
}

.review_content {
	width: 100%;
}
</style>

</head>

<body>
	<div class="container">
		<form class="form" action="/review/create" method="post">
			<input type="hidden" name="product_id" value="${product_id}">
			<input type="hidden" name="member_id" value="${member_id}">
			<div class="form-group purple-border">
				<textarea class="review_content" name="review_content"
					class="review_content" id="exampleFormControlTextarea1" required
					rows="3">${review.review_content}</textarea>
			</div>
			<input name="review_score" id="input-id" type="text" class="rating"
				data-show-caption="false" data-show-clear="false" required
				data-size="lg" value="5">
			<div class="d-flex justify-content-end">
				<button class="btn btn-primary">제출</button>
			</div>
		</form>
	</div>
</body>
<script>
	//initialize with defaults
	$("#input-id").rating({
		'size' : 'lg',
		'step' : "1",
	});
</script>

<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
	integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
	crossorigin="anonymous"></script>


</html>