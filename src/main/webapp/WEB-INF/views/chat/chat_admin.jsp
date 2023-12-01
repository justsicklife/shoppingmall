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
								<div class="inbox_chat">
									<c:forEach var="chatRoom" items="${chatRoomList}">
										<div class="chat_list" data-id="${chatRoom.chatRoomId}"
											onclick='changeRoom("${chatRoom.chatRoomId}")'>
											<div class="chat_people">
												<div class="chat_img">
													<img src="https://ptetutorials.com/images/user-profile.png"
														alt="sunil">
												</div>
												<div class="chat_ib">
													<h5>
														${chatRoom.chatRoomId } <span
															class="chat_date">${chatRoom.memberId}</span>
													</h5>
													<p>글제목</p>
												</div>
											</div>
										</div>
									</c:forEach>

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
		<script>

			let sockJs;
			let stomp;

			let subscribedSet = new Set();

			$(document).ready(
				function () {
					// stomp와 연결하기 위한 거
					sockJs = new SockJS("/stomp/chat");

					stomp = Stomp.over(sockJs);

					stomp.connect(
						{},
						function () {

						});

				}
			)


			let curRoomIdx = -1;
			const userIdx = "${memberId}";

			function msgMaker(msg, userIdx, memberId) {
				let str = "";
				if (userIdx != memberId) {
					str += "<div class='incoming_msg'>";
					str += "<div class='incoming_msg_img'>";
					str += "<img width='21px' height='21px' src='https://ptetutorials.com/images/user-profile.png' alt='sunil'>"
					str += "</div>"
					str += "<div class='received_msg'>"
					str += "<div class='received_withd_msg'>";
					str += "<p>"
					str += msg;
					str += "</p>"
					str += "<span class='time_date'> 11:01 AM | June 9</span>";
					str += "</div>"
					str += "</div>"
					str += "</div>";
				} else {
					str += "<div class='outgoing_msg'>"
					str += "<div class='sent_msg'>"
					str += "<p>"
					str += msg;
					str += "</p>"
					str += "<span class='time_date'> 11:01 AM | June 9</span>"
					str += "</div>"
					str += "</div>";
				}
				return str;

			}

			function  changeRoom(roomIdx) {


				// 룸번호가 없는게 아니고 룸이 같다면
				if (curRoomIdx !== -1) {
					if (curRoomIdx === roomIdx) {
						return
					} else {
						console.log("aaa");
						$("#msgBox").empty();
					}
				}

				curRoomIdx = roomIdx;

				const topicRoom = "/sub/chat/room/" + curRoomIdx;


				if (!subscribedSet.has(topicRoom)) {

					stomp.subscribe(
						topicRoom,
						function (chat) {
							let data = JSON.parse(chat.body);
							console.log(data);
							const tag = msgMaker(data.chatMessageContent, userIdx, data.memberId)
							$("#msgBox").append(tag);
							$("#msgBox").scrollTop($("#msgBox").height());
						}
					)
					subscribedSet.add(topicRoom);
				} else {
					console.log("이미 있는" + topicRoom + " 입니다")
				}

				const topicHistory = "/sub/chat/history/" + curRoomIdx;

				if (!subscribedSet.has(topicHistory)) {
					stomp.subscribe(
						topicHistory,
						function (chat) {
							let data = JSON.parse(chat.body);
							for (let i = 0; i < data.length; i++) {
								const tag = msgMaker(data[i].chatMessageContent, userIdx, data[i].memberId);
								$("#msgBox").append(tag);
							}
							$("#msgBox").scrollTop($("#msgBox").height());
						}
					)
					subscribedSet.add(topicHistory);
				} else {
					console.log("이미 있는" + topicHistory + " 입니다.");
				}

				stomp
					.send(
						"/pub/chat/enter",
						{},
						JSON
							.stringify({
								chatRoomId: curRoomIdx,
								memberId: userIdx,
								chatMessageContent: "방문했습니다."
							})
							
							);

				stomp.send(
					"/pub/chat/history",
					{},
					JSON.stringify({
						chatRoomId: curRoomIdx,
						memberId: userIdx
					})
				)
			}


			const msg_send_btn = document.querySelector(".msg_send_btn");

			msg_send_btn.addEventListener("click", () => {
				const write_msg = document.querySelector(".write_msg");
				if (write_msg === "")
					return
				const msg = write_msg.value;

				write_msg.value = "";

				stomp.send(
					"/pub/chat/message",
					{},
					JSON.stringify({
						chatRoomId: curRoomIdx,
						memberId: userIdx,
						chatMessageContent: msg,
					})
				)
			})

		</script>

		</html>