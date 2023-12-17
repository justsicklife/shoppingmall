function submitForm() {
    var form = document.querySelector('form');

    if (form.checkValidity()) {
        // FormData를 사용하여 폼 데이터를 가져옴
        var formData = new FormData(form);
		
		formData.delete("boardSecret");
		
        // 만약 checkbox가 체크되어 있다면 boardSecret 필드를 추가
        if (!document.getElementById('secretChk').checked) {
            formData.append('boardSecret', '0'); // 체크 해제된 경우 0으로 설정
        } else {
            formData.append('boardSecret', '1');
        }
        
        // fetch를 사용하여 비동기적으로 서버에 데이터를 전송
        fetch('/board/inquiryUpdate.do', {
            method: 'POST',
            body: formData
        })
        .then(response => {
            // 서버 응답을 확인하고 필요한 작업을 수행
            if (response.ok) {
                window.opener.location.reload();
                window.close();
            } else {
                alert('서버에서 오류가 발생했습니다.');
            }
        })
        .catch(error => {
            console.error('네트워크 오류:', error);
            alert('네트워크 오류가 발생했습니다.');
        });
    } else {
        alert("입력하지 않은 내용을 확인 해주세요.");
    }
}