<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<!DOCTYPE html>
		<html lang="en">

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>Document</title>
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
				integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
				crossorigin="anonymous">

			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">

			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
				integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
				crossorigin="anonymous" referrerpolicy="no-referrer" />
			<link href="/resources/css/chat/chat_user.css" rel="stylesheet" />

			<link rel="preconnect" href="https://fonts.googleapis.com">
			<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
			<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">

		</head>

		<body>
			<%@ include file="/WEB-INF/views/common/navbar.jsp"%>
		
				<input hidden value="${memberId}" id="memberId">
				<div class="container message-box">
					<h3 class=" text-center">1 : 1 문의</h3> 
					<div class="messaging">
						<div class="inbox_msg">
							<div class="mesgs">
								<div id="msgBox" class="msg_history">
								</div>
								<div class="type_msg">
									<div class="input_msg_write">
										<input readonly type="text" id="input-msg" class="write_msg" placeholder="메시지를 입력하세요" />
										<button class="msg_send_btn" type="button">
											<i class="fa fa-paper-plane-o" aria-hidden="true"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<button class="btn chat_button" id="start-button">1 : 1 문의하기</button>
				</div>
					<%@ include file="/WEB-INF/views/common/footer.jsp"%>
				
		</body>
		<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="/resources/js/chat/chat_user.js"></script>

		<script>

			
		</script>

		</html>