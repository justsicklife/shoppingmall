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

<style>
.nav-link-left, .nav-link-right {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.nav-item {
	padding: 10px;
}

.category-button, .community-button {
	color: #dadada;
	cursor: pointer;
}

.sidebar-button-active {
	color: #bababa;
}

.sidebar-link {
	color: #666;
	text-decoration: none;
}

.sidebar-link:hover {
	color: #b9b9b9;
}

.sidebar-body {
	color: #fefdfe;
}

.product-group {
	padding: 0 150px;
	gap: 50px;
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
</style>
</head>
<body>
	<nav class="navbar fixed-top">
		<div class="container-fluid">
			<div>
				<nav class="navbar navbar-expand-lg navbar-light ">
					<div class="container-fluid">
						<a class="navbar-brand" href="#">쇼핑몰</a>
						<button class="navbar-toggler" type="button"
							data-bs-toggle="collapse" data-bs-target="#navbarScroll"
							aria-controls="navbarScroll" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarScroll">
							<ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll"
								style="-bs-scroll-height: 100px;">
								<li class="nav-item"><a class="nav-link-left" href="#">
										상품 </a></li>
								<li class="nav-item"><a class="nav-link-left" href="#">outerm</a>
								</li>
								<li class="nav-item"><a class="nav-link-left" href="#"
									tabindex="-1" aria-disabled="true">top</a></li>
								<li class="nav-item"><a class="nav-link-left" href="#"
									tabindex="-1" aria-disabled="true">bottom</a></li>
								<li class="nav-item"><a class="nav-link-left" href="#"
									tabindex="-1" aria-disabled="true">shoes</a></li>
								<li class="nav-item"><a class="nav-link-left" href="#"
									tabindex="-1" aria-disabled="true">acc</a></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>

			<div class="d-flex">
				<form class="d-flex">
					<div class="search-bar">
						<input class="search-bar__input" type="search" /> <i
							class="fas fa-search"></i>
					</div>
				</form>
				<div class="d-flex align-items-center">
					<div class="px-2">
						<c:choose>
							<c:when
								test="${sessionScope.sessionMemberIdx eq null && sessionScope.memberIdx eq null}">
								<a href="/member/loginPage" class="nav-link-right"> login </a>
							</c:when>
							<c:otherwise>
								<a href="/member/logout.do" class="nav-link-right">logout</a>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="px-2">
						<a class="nav-link-right"> order </a>
					</div>
					<div class="px-2">
						<a class="nav-link-right"> basket </a>
					</div>
				</div>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
					aria-controls="offcanvasNavbar">
					<span class="navbar-toggler-icon"> <svg
							xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
								d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z" />
                        </svg>
					</span>
				</button>
			</div>
		</div>
		<div class="offcanvas offcanvas-end" tabindex="-1"
			id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
			<div class="offcanvas-header">
				<h5 class="offcanvas-title" id="offcanvasNavbarLabel">Offcanvas</h5>
				<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
					aria-label="Close"></button>
			</div>
			<div class="offcanvas-body sidebar-body p-5">
				<div>
					<div class="row">
						<div class="col-6">
							<h5 class="text-uppercase category-button sidebar-button-active"
								id="category_button">category</h5>
						</div>
						<div class="col-6">
							<h5 class="text-uppercase community-button" id="community_button">
								community</h5>
						</div>
					</div>
					<div class="row pt-5">
						<ul class="col-6 list-unstyled" id="category_display">
							<li class="mt-2"><a class="sidebar-link" href="#"> 상품 </a></li>
							<li class="mt-2"><a class="sidebar-link" href="#">
									outerm </a></li>
							<li class="mt-2"><a class="sidebar-link" href="#"> top </a>
							</li>
							<li class="mt-2"><a class="sidebar-link" href="#">
									bottom </a></li>
							<li class="mt-2"><a class="sidebar-link" href="#"> shoes
							</a></li>
							<li class="mt-2"><a class="sidebar-link" href="#"> acc </a>
							</li>
						</ul>
						<ul class="col-6 list-unstyled d-none" id="community_display">
							<li class="mt-2"><a class="sidebar-link" href="#">
									Notice </a></li>
							<li class="mt-2"><a class="sidebar-link" href="#"> Q&A </a>
							</li>
							<li class="mt-2"><a class="sidebar-link" href="#">
									Review </a>
							</li>
							<li class="mt-2">
							<c:choose>
								<c:when test="${ sessionScope.memberId == 'admin'}">
									<a href="/chat/admin" class="sidebar-link" href="#"> Chat
								</c:when>
								<c:otherwise>
									<a href="/chat/user" class="sidebar-link" href="#"> Chat
								</c:otherwise>
							</c:choose>
							</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</nav>

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

const category_button = document.querySelector("#category_button");
const community_button = document.querySelector("#community_button");

const category_display = document.querySelector("#category_display");
const community_display = document.querySelector("#community_display");

category_button.addEventListener("click", () => {
    category_display.classList.remove("d-none");
    community_display.classList.add("d-none");

    category_button.classList.add("sidebar-button-active");
    community_button.classList.remove("sidebar-button-active");
})

community_button.addEventListener("click", () => {
    category_display.classList.add("d-none");
    community_display.classList.remove("d-none");

    category_button.classList.remove("sidebar-button-active");
    community_button.classList.add("sidebar-button-active");
})

</script>
</html>
