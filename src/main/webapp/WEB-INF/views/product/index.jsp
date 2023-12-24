<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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


<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap')
	;

body {
	font-family: "Poppins", sans-serif;
	color: #444444;
}

a, a:hover {
	text-decoration: none;
	color: inherit;
}

.section-products {
	padding: 80px 0 54px;
}

.section-products .header {
	margin-bottom: 50px;
}

.section-products .header h3 {
	font-size: 1rem;
	color: #fe302f;
	font-weight: 500;
}

.section-products .header h2 {
	font-size: 2.2rem;
	font-weight: 400;
	color: #444444;
}

.section-products .single-product {
	margin-bottom: 26px;
}

.section-products .single-product .part-1 {
	position: relative;
	height: 290px;
	max-height: 290px;
	margin-bottom: 20px;
	overflow: hidden;
}

.section-products .single-product .part-1::before {
	position: absolute;
	content: "";
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: -1;
	transition: all 0.3s;
}

.section-products .single-product:hover .part-1::before {
	transform: scale(1.2, 1.2) rotate(5deg);
}

.section-products .single-product .part-1 .discount, .section-products .single-product .part-1 .new
	{
	position: absolute;
	top: 15px;
	left: 20px;
	color: #ffffff;
	background-color: #fe302f;
	padding: 2px 8px;
	text-transform: uppercase;
	font-size: 0.85rem;
}

.section-products .single-product .part-1 .new {
	left: 0;
	background-color: #444444;
}

.section-products .single-product .part-1 ul {
	position: absolute;
	bottom: -41px;
	left: 20px;
	margin: 0;
	padding: 0;
	list-style: none;
	opacity: 0;
	transition: bottom 0.5s, opacity 0.5s;
}

.section-products .single-product:hover .part-1 ul {
	bottom: 30px;
	opacity: 1;
}

.section-products .single-product .part-1 ul li {
	display: inline-block;
	margin-right: 4px;
}

.section-products .single-product .part-1 ul li a {
	display: inline-block;
	width: 40px;
	height: 40px;
	line-height: 40px;
	background-color: #ffffff;
	color: #444444;
	text-align: center;
	box-shadow: 0 2px 20px rgb(50 50 50/ 10%);
	transition: color 0.2s;
}

.section-products .single-product .part-1 ul li a:hover {
	color: #fe302f;
}

.section-products .single-product .part-2 .product-title {
	font-size: 1.7rem;
	font-weight: bold;
	text-align: center;
}

.section-products .single-product .part-2 .product-old-price {
	position: relative;
	padding: 0 7px;
	margin-right: 2px;
	opacity: 0.6;
}

.section-products .single-product .part-2 .product-old-price::after {
	position: absolute;
	content: "";
	top: 50%;
	left: 0;
	width: 100%;
	height: 1px;
	background-color: #444444;
	transform: translateY(-50%);
}
.product_box,.product_box:hover,.product_box:visited{
	text-decoration: none;
	color: black;
}
.product-price{
	text-align: center;
	font-size: 1rem;
}
.product_explain{
	text-align: center;
	color: rgba(113, 113, 113, 1);
}
.slide_box{
	margin-top: 55px;
}
.slide_item img {
	height: 500px;
}
</style>

</head>

<body>
	<%@ include file="/WEB-INF/views/common/navbar.jsp"%>

	<div id="carouselExampleFade" class="slide_box carousel slide carousel-fade"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item slide_item active">
				<img src="https://cheatkey.speedgabia.com/jpeg/cheesePC.jpg"
					class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item slide_item" >
				<img src="https://cheatkey.speedgabia.com/jpeg/pomelPC.jpg"
					class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item slide_item" >
				<img src="https://cheatkey.speedgabia.com/jpeg/bumaterPC.jpg"
					class="d-block w-100" alt="...">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleFade" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleFade" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
	<section class="section-products">
		<div class="container">
			<div class="row justify-content-center text-center">
				<div class="col-md-8 col-lg-6">
					<div class="header">
						<h3>아우터</h3>
						<h2>인기 상품</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<c:forEach var="item" items="${outer}">
					<div class="col-md-6 col-lg-4 col-xl-3">
						<div id="product-1" class="single-product">
							<a class="product_box" href="/product/detail?product_id=${item.product_id }">
								<div class="part-1">
									<img class="w-100 h-100" src="${item.product_image }" />
								</div>
								<div class="part-2">
									<h2 class="product-title">${item.product_name }</h2>
									<h5 class="product_explain">${item.product_content}</h5>
									<h4 class="product-price">가격 : ${item.product_price } 원</h4>
								</div>
							</a>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
		<div class="container">
			<div class="row justify-content-center text-center">
				<div class="col-md-8 col-lg-6">
					<div class="header">
						<h3>상의</h3>
						<h2>인기 상품</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<!-- Single Product -->
				<c:forEach var="item" items="${top}">
					<div class="col-md-6 col-lg-4 col-xl-3">
						<div id="product-1" class="single-product">
							<a class="product_box" href="/product/detail?product_id=${item.product_id }">
								<div class="part-1">
									<img class="w-100 h-100" src="${item.product_image }" />
								</div>
								<div class="part-2">
									<h3 class="product-title">${item.product_name }</h3>
									<h5 class="product_explain">${item.product_content}</h5>

									<h4 class="product-price">가격 : ${item.product_price } 원</h4>
								</div>
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="container">
			<div class="row justify-content-center text-center">
				<div class="col-md-8 col-lg-6">
					<div class="header">
						<h3>하의</h3>
						<h2>인기 상품</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<!-- Single Product -->
				<c:forEach var="item" items="${bottom}">
					<div class="col-md-6 col-lg-4 col-xl-3">
						<div id="product-1" class="single-product">
							<a class="product_box" href="/product/detail?product_id=${item.product_id }">
								<div class="part-1">
									<img class="w-100 h-100" src="${item.product_image }" />
								</div>
								<div class="part-2">
									<h3 class="product-title">${item.product_name }</h3>
									<h5 class="product_explain">${item.product_content}</h5>

									<h4 class="product-price">가격 : ${item.product_price } 원</h4>
								</div>
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="container">
			<div class="row justify-content-center text-center">
				<div class="col-md-8 col-lg-6">
					<div class="header">
						<h3>신발</h3>
						<h2>인기 상품</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<!-- Single Product -->
				<c:forEach var="item" items="${shoes}">
					<div class="col-md-6 col-lg-4 col-xl-3">
						<div id="product-1" class="single-product">
							<a class="product_box" href="/product/detail?product_id=${item.product_id }">
								<div class="part-1">
									<img class="w-100 h-100" src="${item.product_image }" />
								</div>
								<div class="part-2">
									<h3 class="product-title">${item.product_name }</h3>
									<h5 class="product_explain">${item.product_content}</h5>

									<h4 class="product-price">가격 : ${item.product_price } 원</h4>
								</div>
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>

	<%@ include file="/WEB-INF/views/common/chat-button.jsp"%>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>


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


</html>