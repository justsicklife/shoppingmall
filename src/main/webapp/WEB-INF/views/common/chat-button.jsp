
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
.chat-button {
	padding: 15px;
	border-radius: 50%;
	border: 1px dashed;
}

.chat-box {
	position: fixed;
	left: 95%;
	top: 95%;
	transform: translate(-50%, -50%);
}
</style>
</head>
<body>

	<div class="chat-box">
		<c:choose>
			<c:when test="${sessionScope.memberId eq 'admin'}">
				<a href="/chat/admin">
					<button class="chat-button">
						<i class="fa-regular fa-comments"></i>
					</button>
				</a>
			</c:when>
			<c:when test="${sessionScope.memberId  ne 'admin' && sessionScope.memberId ne null }">
			<a href="/chat/user">
				<button class="chat-button">
					<i class="fa-regular fa-comments"></i>
				</button>
			</a>
		</c:when>
		</c:choose>
	</div>
</body>
</html>