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

		</head>

		<body>

			<%@ include file="/WEB-INF/views/common/navbar.jsp" %>


				<div class="container message-box">
					<h3 class=" text-center">Messaging</h3>
					<div class="messaging">
						<div class="inbox_msg">
							<div class="mesgs">
								<div id="msgBox" class="msg_history">
									<c:forEach var="chatMessage" items="${chatMessageList}">
										<c:choose>
											<c:when test="${chatMessage.memberId eq memberId }">
												<div class="incoming_msg">
													<div class="incoming_msg_img">
														<img src="https://ptetutorials.com/images/user-profile.png"
															alt="sunil">
													</div>
													<div class="received_msg">
														<div class="received_withd_msg">
															<p>${chatMessage.chatMessageContent}</p>
															<span class="time_date"> 11:01 AM | June 9</span>
														</div>
													</div>
												</div>

											</c:when>
											<c:otherwise>
												<div class="outgoing_msg">
													<div class="sent_msg">
														<p>${chatMessage.chatMessageContent}</p>
														<span class="time_date"> 11:01 AM | June 9</span>
													</div>
												</div>
											</c:otherwise>
										</c:choose>
									</c:forEach>

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

		<script>
			$(document)
				.ready(
					function () {
						let sockJs = new SockJS("/stomp/chat");

						let stomp = Stomp.over(sockJs);

						const roomIdx = "${chatRoomId}";
						const userIdx = "${memberId}";

						stomp
							.connect(
								{},
								function () {
									console.log("STOMP Connection");

									stomp
										.subscribe(
											"/sub/chat/room/"
											+ roomIdx,
											function (chat) {
												let data = JSON.parse(chat.body);
												let str = "";
												if (userIdx != data.memberId) {
													str += "<div class='incoming_msg'>";
													str += "<div class='incoming_msg_img'>";
													str += "<img width='21px' height='21px' src='https://ptetutorials.com/images/user-profile.png' alt='sunil'>"
													str += "</div>"
													str += "<div class='received_msg'>"
													str += "<div class='received_withd_msg'>";
													str += "<p>"
													str += data.chatMessageContent;
													str += "</p>"
													str += "<span class='time_date'> 11:01 AM | June 9</span>";
													str += "</div>"
													str += "</div>"
													str += "</div>";
												} else {
													str += "<div class='outgoing_msg'>"
													str += "<div class='sent_msg'>"
													str += "<p>"
													str += data.chatMessageContent;
													str += "</p>"
													str += "<span class='time_date'> 11:01 AM | June 9</span>"
													str += "</div>"
													str += "</div>";
												}

												$(".msg_history").append(str);
												$("#msgBox").scrollTop($("#msgBox").height());
											})

									stomp
										.send(
											"/pub/chat/enter",
											{},
											JSON
												.stringify({
													chatRoomId: roomIdx,
													// chatMessageId: 1,
													memberId: userIdx,
													chatMessageContent: "방문했습니다."
												}));
								})

						$(".msg_send_btn").on(
							"click",
							function () {
								let msg_box = document
									.getElementById(".msg_history");
								const write_msg = document
									.querySelector(".write_msg");
								const msg = write_msg.value;

								write_msg.value = "";

								stomp.send("/pub/chat/message", {}, JSON
									.stringify({
										chatRoomId: roomIdx,
										memberId: userIdx,
										chatMessageContent: msg,
									}))
							})
					})
		</script>

		</html>