let sockJs;
let stomp;

// 값이 업으면 -1
let curRoomIdx = -1;
const userIdx = parseInt($("#memberId").val());

// subscribe 를 set 에 넣어놓고 중복되는 subscribe 를 실행안되게한다
let subscribedSet = new Set();

// 시작하면
$(document).ready(
    function () {
        // stomp와 연결하기 위한 거
        sockJs = new SockJS("/stomp/chat");

        stomp = Stomp.over(sockJs);

        // stomp 연결
        stomp.connect(
            {},
            function () {
                // 처음에 채팅 목록 subscribe
                stomp.subscribe("/sub/chat/list",
                    function (chat) {
                        let data = JSON.parse(chat.body);
                        console.log(document.getElementById("inbox-chat"));
                        $("#inbox-chat").empty();
                        for (let i = 0; i < data.length; i++) {
                            $("#inbox-chat").append(listMaker(data[i].chatRoomId, data[i].memberId, data[i].chatRoomTitle,curRoomIdx));
                            console.log(data[i]);
                        }
                    })

                // 알람
                stomp.subscribe("/sub/chat/alarm",
                    function (chat) {
                        let data = JSON.parse(chat.body);
                        console.log(data.chatRoomId);
                        $("#chat-"+data.chatRoomId).addClass("alram");
                    })

                // 채팅창 send 보냄
                stomp.send("/pub/chat/list")
            });
    }
)

// 채팅방 목록 태그 만들어주는거
function listMaker(chatRoomId, memberId, chatRoomTitle,curRoomIdx) {
    console.log(chatRoomId, curRoomIdx);
    let str = `<div class='chat_list ${curRoomIdx === chatRoomId ? "active_chat" : ""}' id='chat-${chatRoomId}' onclick='changeRoom(${chatRoomId})'>
    <div class='chat_people'>
    <div class='chat_img'>
    <img src='https://ptetutorials.com/images/user-profile.png' alt='sunil'>
    </div>
    <div class='chat_ib'>
    <h5>${chatRoomId} <span class='chat_date'>${memberId}</span></h5>
    <p>${chatRoomTitle}</p></div></div></div>`;
    return str;
}

// 메세지 태그 만들어주는거
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
        str += chatMessageDate
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
        str += chatMessageDate
        str += "</span>"
        str += "</div>"
        str += "</div>";
    }
    return str;

}

// 방변겅시 나오는 이벤트
function changeRoom(roomIdx) {
    // 룸번호가 없는게 아니고 룸이 같다면
    if (curRoomIdx !== -1) {
        if (curRoomIdx === roomIdx) {
            return
        } else {
            $("#msgBox").empty();
        }
    }

    // 전에 지정된 방에 calss 삭제 시켜주는거
    $("#chat-" + roomIdx).addClass("active_chat");
    // 현재 선택된 방에 class 넣어주는거
    $("#chat-" + curRoomIdx).removeClass("active_chat");

    $("#chat-" + curRoomIdx).removeClass("alram");

    curRoomIdx = roomIdx;

    // subscribe 주소
    const topicRoom = "/sub/chat/room/" + curRoomIdx;

    // 같은 subscribe 가 없다면
    if (!subscribedSet.has(topicRoom)) {
        // 구독 추가
        stomp.subscribe(
            topicRoom,
            function (chat) {
                let data = JSON.parse(chat.body);
                const tag = msgMaker(data.chatMessageContent, userIdx,data.chatMessageDate, data.memberId)
                
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
                for (let i = 0; i < data.length; i++) {
                    const tag = msgMaker(data[i].chatMessageContent, userIdx, data[i].chatMessageDate,data[i].memberId);
                    $("#msgBox").append(tag);
                }
                // 스크롤 맨아래로 
                $("#msgBox").scrollTop($("#msgBox")[0].scrollHeight);
            }
        )
        subscribedSet.add(topicHistory);
    } else {
        console.log("이미 있는" + topicHistory + " 입니다.");
    }

    // 어드민의 채팅내역에 대한 정보를 구독 한사람에게 보내준다. 
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

// 메세지 전송버튼을 누르면 
msg_send_btn.addEventListener("click", () => {
    const write_msg = document.querySelector(".write_msg");
    if (write_msg === "")
        return
    const msg = write_msg.value;

    write_msg.value = "";

    let nowDate = `${new Date().getFullYear()}:${new Date().getMonth()}:${new Date().getHours()}:${new Date().getMinutes()}`;


    // 메세지를 구독한 분에게 전달해준다 JSON 형태로
    stomp.send(
        "/pub/chat/message",
        {},
        JSON.stringify({
            chatRoomId: curRoomIdx,
            memberId: userIdx,
            chatMessageContent: msg,
            chatMessageDate: nowDate,
        })
    )
})