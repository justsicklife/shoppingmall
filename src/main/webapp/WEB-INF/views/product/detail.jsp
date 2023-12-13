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

</head>

<body>


	<%@ include file="/WEB-INF/views/common/navbar.jsp"%>


	<!-- Product section-->
	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
				<div class="col-md-6">
					<div>
						<c:forTokens var="image" items="${product.product_image_group }"
							delims=",">
							<img class="main-image" src="${image}" />
						</c:forTokens>
					</div>
				</div>
				<div class="col-md-6">
					<h1 class="display-5 fw-bolder">${product.product_name }</h1>

					<div class="fs-5">
						<span>가격 : </span> <span>${product.product_price}</span>
					</div>

					<select name="" id="color">
						<c:forTokens var="color" items="${ product.product_color_group}"
							delims=",">
							<option value="${color}">${color}</option>
						</c:forTokens>
					</select> <select name="" id="size">
						<c:forTokens var="size" items="${ product.product_size_group}"
							delims=",">
							<option value="${size}">${size }</option>
						</c:forTokens>
					</select>

					<div class="d-flex">
						<button class="btn btn-outline-dark flex-shrink-0" type="button">찜하기</button>
						<button class="btn btn-outline-dark flex-shrink-0" type="button">장바구니</button>
						<button class="btn btn-outline-dark flex-shrink-0" type="button">
							<i class="bi-cart-fill me-1"></i> Add to cart
						</button>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<ul class="d-flex list-link">
				<li class="li-link"><a class="link" href="#info"> info </a></li>
				<li class="li-link"><a class="link"> guide </a></li>
				<li class="li-link"><a href="#review" class="link"> reviews
				</a></li>
				<li class="li-link"><a class="link"> q&a </a></li>
			</ul>
		</div>
	</section>

	<section class="py-5" id="info">
		<h1 class="d-flex justify-content-center text-uppercase">Info</h1>
		<div
			class="container px-4 px-lg-5 my-5 d-flex justify-content-center flex-wrap gap-5">
			${product.product_info }</div>
	</section>

	<div class="py-5 container">

		<div class="score-box ">
			<div class="score-box-2 d-flex align-items-center">
				<div>
					<h1>45</h1>
				</div>
				<canvas style="width: 100%; height: 100%;" class="score-chart"
					id="myChart"></canvas>
			</div>
			<div class="review-button-box text-end d-flex justify-content-end">
				<button class="review-button">후기게시판</button>
				<c:if test="${empty reviewCurUser}">
					<button class="review-save">
						<a
							href="/review/create?member_id=${member_id}&product_id=${product.product_id}">후기작성
						</a>
					</button>
				</c:if>
			</div>
		</div>
	</div>

	<script>
		const ctx = document.getElementById('myChart').getContext('2d');
		const myChart = new Chart(ctx,
				{
					type : 'bar',
					plugins : {
						legend : {
							position : 'right',
						},
						title : {
							display : true,
							text : 'Chart.js Horizontal Bar Chart'
						}
					},
					data : {
						labels : [ '5 Starts', '4 Starts', '3 Starts',
								'2 Starts', '1 Starts' ],
						datasets : [ {
							data : [ 12, 100, 3, 5, 2, 3 ],
							backgroundColor : [ 'rgba(113, 113, 113, 1)',
									'rgba(113, 113, 113, 1)',
									'rgba(113, 113, 113, 1)',
									'rgba(113, 113, 113, 1)',
									'rgba(113, 113, 113, 1)' ],
							borderWidth : 1
						} ]
					},
					options : {
						indexAxis : 'y',
						responsive : false,
						plugins : {
							legend : {
								display : false
							}
						}
					}
				});
	</script>



	<div id="review" class="container mt-5">

		<div class="review-box">

			<div class="col-md-12">
				<c:if test="${not empty reviewCurUser}">
					<div
						class="headings d-flex justify-content-between align-items-center mb-3">
						<h5>내가 작성한 댓글</h5>
					</div>
					<div class="card p-3">
						<div class="d-flex justify-content-between align-items-center">
							<div class="user d-flex flex-row align-items-center">
								<input name="review_score" id="input-id" type="text" class="rating" readonly data-size="sm" value="${reviewCurUser.review_score }">
							</div>
							<small> ${reviewCurUser.review_open_date} </small>
						</div>
						<div class="mt-2 px-4">${reviewCurUser.review_content }</div>
						<div class="d-flex justify-content-end">
							<button>
								<a href="/review/update?review_id=${reviewCurUser.review_id}"> 수정
								</a>
							</button>
							<form action="/review/delete" method="post">
								<input type="hidden" name="review_id"
									value="${reviewCurUser.review_id }" /> <input type="hidden"
									name="product_id" value="${reviewCurUser.product_id }" />
								<button>삭제</button>
							</form>
						</div>
					</div>
				</c:if>

				<div
					class="headings d-flex justify-content-between align-items-center mb-3">
					<h5>작성된 리뷰 ${reviewListCount }</h5>
				</div>
				<c:forEach var="review" items="${reviewList}">
					<div class="card p-3 mb-3">
						<div class="d-flex justify-content-between align-items-center">
							<div class="user d-flex flex-row align-items-center">
								<input name="review_score" id="input-id" type="text" class="rating" readonly data-size="sm" value="${review.review_score }">
							</div>
							<small> ${review.review_open_date} </small>
						</div>
						<div class="mt-2 px-4">${review.review_content }</div>
					</div>
				</c:forEach>

			</div>
			<ul>
				<c:choose>
					<c:when test="${reviewPi.currentPage eq 1 }">
						<li class="page-item">
							<a class="page-link" href="#" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:when>
					<c:otherwise>
					<li class="page-item">
							<a class="page-link" href="detail?cpage=${reviewPi.currentPage-1 }&product_id=${product.product_id}" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:otherwise>
				</c:choose>
				<c:forEach var="p" begin="${reviewPi.startPage}" end="${reviewPi.endPage}">
					<li class="page-item">
						<a class="page-link" href="detail?cpage=${p }&product_id=${product.product_id}">${ p}</a>
					</li>
				</c:forEach>
				
				<c:choose>
					<c:when test="${reviewPi.currentPage eq reviewPi.maxPage }">
						<li class="page-item">
							<a class="page-link" href="#" aria-label="Previous">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:when>
					<c:otherwise>
					<li class="page-item">
							<a class="page-link" href="detail?cpage=${reviewPi.currentPage+1 }&product_id=${product.product_id}" aria-label="Previous">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>

	<!-- q&a 게시판 -->

	<section class="container py-5">
		<div class="table-container text-end">
			<table class="table">
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
						<th scope="col">조회</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td>배송 문의</td>
						<td>정**</td>
						<td>2023-10-11</td>
						<td>1</td>
					</tr>
				</tbody>
			</table>
			<button class="qa-button">문의 하기</button>
		</div>
	</section>

	<%@ include file="/WEB-INF/views/common/chat-button.jsp"%>


</body>

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

<script>
	//initialize with defaults
	$("#input-id").rating({
		'size' : 'lg',
		'step' : "1"
		
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