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


// 값이없으면 -1
let roomIdx = -1;
const userIdx = parseInt($("#memberId").val());

let topicRoom = "/sub/chat/room/";
let topicHistory = "/sub/user/history/";

// 처음 방문 이라면 true, 아니라면 false
let isEmpty = false;

let sockJs;
let stomp;

$(document)
    .ready(
        function () {
            sockJs = new SockJS("/stomp/chat");

            stomp = Stomp.over(sockJs);

            stomp
                .connect(
                    {},
                    function () {
                        stomp.subscribe("/sub/room/find",
                            function (chat) {
                                let data = JSON.parse(chat.body);
                                console.log(data.chatRoomId);
                                if (data.chatRoomId === -1) {
                                    isEmpty = true;
                                } else {
                                    roomIdx = data.chatRoomId;
                                }
                            }

                        )

                        stomp.send("/pub/room/find",
                            {},
                            JSON.stringify({
                                memberId: userIdx
                            })
                        );
                    }
                );

        })

// start button 을 누르면
$("#start-button").on("click", function () {
    $("#input-msg").attr("readonly", false);

    const topicCreate = "/sub/room/create/";

    // url 에 roomIdx 더함
    topicRoom += roomIdx;
    topicHistory += roomIdx;

    // 비어있다면 생성
    if (isEmpty) {
        stomp.subscribe(
            topicCreate,
            function (chat) {
                let data = JSON.parse(chat.body);
                roomIdx = data.chatRoomId;
                topicRoom += data.chatRoomId;
                topicHistory += data.chatRoomId;
            }
        )

        // create 를 구독에게 보냄
        stomp.send("/pub/room/create",
            {},
            JSON.stringify({
                chatRoomId: 0,
                memberId: userIdx
            })
        );

        stomp.send("/pub/chat/list")
    } else {
        console.log(topicHistory);
        stomp.subscribe(
            topicHistory,
            function (chat) {
                let data = JSON.parse(chat.body);
                console.log(data)
                for (let i = 0; i < data.length; i++) {
                    const tag = msgMaker(data[i].chatMessageContent, userIdx, data[i].memberId);
                    $("#msgBox").append(tag);
                }
                $("#msgBox").scrollTop($("#msgBox")[0].scrollHeight);
            }
        )
    }

    // 구독함 
    stomp.subscribe(
        topicRoom,
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
            $("#msgBox").scrollTop($("#msgBox")[0].scrollHeight);
        })

    stomp.send(
        "/pub/user/history",
        {},
        JSON.stringify({
            chatRoomId: roomIdx,
            memberId: userIdx
        })
    )


    $("#start-button").remove();
});

$(".msg_send_btn").on(
    "click",
    function () {
        const write_msg = document
            .querySelector(".write_msg");
        const msg = write_msg.value;

        if (msg === "")
            return

        write_msg.value = "";

        stomp.send("/pub/chat/message", {}, JSON
            .stringify({
                chatRoomId: roomIdx,
                memberId: userIdx,
                chatMessageContent: msg,
            }))
    
        stomp.send("/pub/chat/alarm" , {},
        JSON.stringify({
            chatRoomId : roomIdx
        }));
    })