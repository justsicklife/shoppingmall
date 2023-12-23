// 문의하기 클릭
function openWrite(id){
    window.open("/board/enrollForm.do?product_id=" + id, "_blank", "width=800, height=900");
}

// 관리자 답변 클릭
function openAnswer(boardQuestionNum, memberId ,productId) {
    console.log('boardQuestionNum:', boardQuestionNum);
    console.log('memberId:', memberId);
    console.log(productId);
    // 새 창 열기
    const newWindow =  window.open(`/board/answerForm.do?boardQuestionNum=${boardQuestionNum}&MemberId=${memberId}&boardProductNum=${productId}`, "_blank", "width=800, height=600");

    // 새 창이 로드되었을 때의 이벤트 리스너 등록
    newWindow.onload = function () {
        // 새 창에서 부모 창으로 값을 전달
        newWindow.document.getElementById('boardQuestionNum').value = boardQuestionNum;
        newWindow.document.getElementById('memberId').value = memberId;
    };
}

// 유저 문의 수정 클릭
function openEdit(boardQuestionNum) {
    // 새 창 열기
    const newWindow = window.open(`/board/inquiryEdit.do?boardQuestionNum=${boardQuestionNum}`, "_blank", "width=800, height=900");

    // 새 창이 로드되었을 때의 이벤트 리스너 등록
    newWindow.onload = function () {
        // 새 창에서 부모 창으로 값을 전달
        newWindow.document.getElementById('boardQuestionNum').value = boardQuestionNum;
    };
}

//관리자 답변 수정 클릭
function openAnswerEdit(boardQuestionNum, memberId,productId){
    console.log('productId : ' + productId);
    // 새 창 열기
    const newWindow =  window.open(`/board/answerEditForm.do?boardQuestionNum=${boardQuestionNum}&MemberId=${memberId}&boardProductNum=${productId}`, "_blank", "width=800, height=600");

    // 새 창이 로드되었을 때의 이벤트 리스너 등록
    newWindow.onload = function () {
        // 새 창에서 부모 창으로 값을 전달
        newWindow.document.getElementById('boardQuestionNum').value = boardQuestionNum;
        newWindow.document.getElementById('memberId').value = memberId;
    };
}

// 문의 내용 및 답변 토글 
function toggleRow(questionNum, itemScrectChk, itemMemberId, loggedInMemberId) {
var hiddenRow = document.getElementById('hidden-' + questionNum);
var answerRow = document.getElementById('answer-' + questionNum);

console.log("itemMemberId : " + itemMemberId);
console.log("loggedInMemberId : " + loggedInMemberId);
console.log("itemScrectChk : " + itemScrectChk);

if (itemMemberId === loggedInMemberId || loggedInMemberId === 'admin') {
    console.log('작성자 인증');
        if (hiddenRow.style.display === 'none') {
            hiddenRow.style.display = 'table-row';
            if (answerRow === null) {
                console.log("답변 글 없음");
            } else if (answerRow.style.display === 'none') {
                answerRow.style.display = 'table-row';
            }
        } else {
            hiddenRow.style.display = 'none';
            if (answerRow === null) {
                console.log("답변 글 없음");
            } else if (answerRow.style.display === 'table-row') {
                answerRow.style.display = 'none';
            }
        }
    } else if (itemMemberId !== loggedInMemberId && itemScrectChk === '0'){
        console.log('작성자 아님, 비밀글 아님');
        if (hiddenRow.style.display === 'none') {
            hiddenRow.style.display = 'table-row';
            if (answerRow === null) {
                console.log("답변 글 없음");
            } else if (answerRow.style.display === 'none') {
                answerRow.style.display = 'table-row';
            }
        } else {
            hiddenRow.style.display = 'none';
            if (answerRow === null) {
                console.log("답변 글 없음");
            } else if (answerRow.style.display === 'table-row') {
                answerRow.style.display = 'none';
            }
        }
    } else if (itemMemberId !== loggedInMemberId && itemScrectChk === '1'){
        console.log('작성자 아님, 비밀글');
        alert('비밀글은 작성자만 볼 수 있습니다.'); 
    } 
}

function deleteInquiry(boardQuestionNum,productId) {
    if (confirm('정말로 삭제하시겠습니까?')) {
        fetch('/board/inquiryDelete.do', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ boardQuestionNum }),
        })
        .then(response => {
            if (response.ok) {
                // 서버에서 응답이 성공인 경우, 필요한 작업을 수행합니다.
                window.location.href = '/product/detail?product_id=' +productId; // 성공 시 페이지 리다이렉션
            } else {
                // 에러 케이스를 처리합니다.
                console.error('문의 삭제 실패');
            }
        })
        .catch(error => {
            console.error('삭제 요청 중 오류 발생:', error);
        });
    }
}