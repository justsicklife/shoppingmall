function msgMaker(msg, userIdx, chatMessageDate,memberId) {
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
        str += "<span class='time_date'>"
        str+= chatMessageDate;
        str += "</span>";
        str += "</div>"
        str += "</div>"
        str += "</div>";
    } else {
        str += "<div class='outgoing_msg'>"
        str += "<div class='sent_msg'>"
        str += "<p>"
        str += msg;
        str += "</p>"
        str += "<span class='time_date'>"
        str += chatMessageDate;
        str += "</span>"
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

                        $.ajax({
                            type:"post",
                            url:"/chat/find",
                            data: {
                                memberId:userIdx,
                            },
                            success: function(data) {
                                console.log(data);
                                if (data.chatRoomId === -1) {
                                    isEmpty = true;
                                } else {
                                    roomIdx = data.chatRoomId;
                                    $("#chat-title").remove();
                                }
                            }
                        });
                    }
                );

        })

// start button 을 누르면
$("#start-button").on("click", function () {
    $("#input-msg").attr("readonly", false);

    // 비어있다면 생성
    if (isEmpty) {

        $.ajax({
            url:"/chat/create",
            type:"post",
            data: {
                chatRoomId:0,
                memberId:userIdx,
                chatRoomTitle: $("#chat-title").val() === "" ? "대화방" : $("#chat-title").val(),
            },
            success: function(data) {
                roomIdx = data.chatRoomId;
                topicRoom += data.chatRoomId;
                topicHistory += data.chatRoomId;
                console.log(topicRoom,topicHistory)
            },
            async:false,
        })

        stomp.send("/pub/chat/list")
    } else {
        // url 에 roomIdx 더함
        topicRoom += roomIdx;
        topicHistory += roomIdx;

        console.log(topicHistory);
        stomp.subscribe(
            topicHistory,
            function (chat) {
                let data = JSON.parse(chat.body);
                console.log(data)
                for (let i = 0; i < data.length; i++) {
                    const tag = msgMaker(data[i].chatMessageContent, userIdx,data[i].chatMessageDate, data[i].memberId);
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
                str += "<span class='time_date'>"
                str +=  data.chatMessageDate
                str += "</span>";
                str += "</div>"
                str += "</div>"
                str += "</div>";
            } else {
                str += "<div class='outgoing_msg'>"
                str += "<div class='sent_msg'>"
                str += "<p>"
                str += data.chatMessageContent;
                str += "</p>"
                str += "<span class='time_date'>"
                str += data.chatMessageDate;
                str += "</span>"
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
    $("#chat-title").remove();
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

        let nowDate = `${new Date().getFullYear()}:${new Date().getMonth()}:${new Date().getHours()}:${new Date().getMinutes()}`;

        console.log(nowDate);

        stomp.send("/pub/chat/message", {}, JSON
            .stringify({
                chatRoomId: roomIdx,
                memberId: userIdx,
                chatMessageContent: msg,
                chatMessageDate: nowDate,
            }))
    
        stomp.send("/pub/chat/alarm" , {},
        JSON.stringify({
            chatRoomId : roomIdx
        }));
    })