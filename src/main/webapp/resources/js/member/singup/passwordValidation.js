function submitForm(event) {
    event.preventDefault();

    // 여기에 회원가입 로직을 추가하세요.
    // AJAX 또는 fetch를 사용하여 서버로 데이터를 전송할 수 있습니다.
    // 예를 들어, fetch('/api/signup', { method: 'POST', body: new FormData(event.target) })
    //     .then(response => response.json())
    //     .then(data => console.log(data))
    //     .catch(error => console.error('Error:', error));
}

var password = document.getElementById("password")
  , confirm_password = document.getElementById("confirmPassword");

function validatePassword(){
  if(password.value != confirm_password.value) {
    confirm_password.setCustomValidity("비밀번호가 일치 하지 않습니다.");
  } else {
    confirm_password.setCustomValidity(''); // 오류가 없으면 메시지를 빈 문자열로 설정해야한다. 오류 메시지가 비어 있지 않은 한 양식은 유효성 검사를 통과하지 않고 제출되지 않는다.
  }
}

password.onchange = validatePassword;
confirm_password.onkeyup = validatePassword;

