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
		</head>

		<link rel="stylesheet" href="/resources/css/chat/chat_admin.css">

		<body>

			<%@ include file="/WEB-INF/views/common/navbar.jsp" %>
				<input hidden value="${memberId}" id="memberId">
				<div class="container message-box">
					<h3 class=" text-center">admin</h3>
					<div class="messaging">
						<div class="inbox_msg">
							<div class="inbox_people">
								<div class="headind_srch">
									<div class="recent_heading">
										<h4>Recent</h4>
									</div>
								</div>
								<div class="inbox_chat" id="inbox-chat">
								</div>
							</div>
							<div class="mesgs">
								<div class="msg_history" id="msgBox">
								</div>
								<div class="type_msg">
									<div class="input_msg_write">
										<input type="text" class="write_msg" placeholder="Type a message" />
										<button class="msg_send_btn" type="button">
											<i class="fa fa-paper-plane-o" aria-hidden="true"></i>
										</button>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
		</body>
		<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="/resources/js/chat/chat_admin.js"></script>

		</html>