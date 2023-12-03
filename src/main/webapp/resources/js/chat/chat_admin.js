function listMaker(chatRoomId,memberId) {
    let str = `<div class='chat_list' id='chat-${chatRoomId}' onclick='changeRoom(${chatRoomId})'>
    <div class='chat_people'>
    <div class='chat_img'>
    <img src='https://ptetutorials.com/images/user-profile.png' alt='sunil'>
    </div>
    <div class='chat_ib'>
    <h5>${chatRoomId } <span class='chat_date'>${memberId}</span></h5>
    <p>글제목</p></div></div></div>`;
    return str;
}

let sockJs;
let stomp;

let curRoomIdx = -1;
const userIdx = parseInt($("#memberId").val());

let subscribedSet = new Set();

$(document).ready(
    function () {
        // stomp와 연결하기 위한 거
        sockJs = new SockJS("/stomp/chat");

        stomp = Stomp.over(sockJs);

        stomp.connect(
            {},
            function () {
                stomp.subscribe("/sub/chat/list",
                    function (chat) {
                        let data = JSON.parse(chat.body);
                        for (let i = 0; i < data.length; i++) {
                            $("#inbox-chat").append(listMaker(data[i].chatRoomId,data[i].memberId));
                        }
                    })

                stomp.send("/pub/chat/list")
                
            });

    }
)


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

function changeRoom(roomIdx) {


    // 룸번호가 없는게 아니고 룸이 같다면
    if (curRoomIdx !== -1) {
        if (curRoomIdx === roomIdx) {
            return
        } else {
            $("#msgBox").empty();
        }
    }

    $("#chat-" + roomIdx).addClass("active_chat");
    $("#chat-" + curRoomIdx).removeClass("active_chat");

    curRoomIdx = roomIdx;

    const topicRoom = "/sub/chat/room/" + curRoomIdx;


    if (!subscribedSet.has(topicRoom)) {

        stomp.subscribe(
            topicRoom,
            function (chat) {
                let data = JSON.parse(chat.body);
                const tag = msgMaker(data.chatMessageContent, userIdx, data.memberId)
                $("#msgBox").append(tag);
                $("#msgBox").scrollTop($("#msgBox")[0].scrollHeight);
            }
        )
        subscribedSet.add(topicRoom);
    } else {
        console.log("이미 있는" + topicRoom + " 입니다")
    }

    const topicHistory = "/sub/admin/history/" + curRoomIdx;

    if (!subscribedSet.has(topicHistory)) {
        stomp.subscribe(
            topicHistory,
            function (chat) {
                let data = JSON.parse(chat.body);
                console.log(data);
                for (let i = 0; i < data.length; i++) {
                    const tag = msgMaker(data[i].chatMessageContent, userIdx, data[i].memberId);
                    $("#msgBox").append(tag);
                }
                $("#msgBox").scrollTop($("#msgBox")[0].scrollHeight);
            }
        )
        subscribedSet.add(topicHistory);
    } else {
        console.log("이미 있는" + topicHistory + " 입니다.");
    }


    stomp.send(
        "/pub/admin/history",
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