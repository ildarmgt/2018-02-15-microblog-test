var FORM_CREATE = document.getElementsByClassName('form_create_user')[0];
var BTN_CREATE_SUBMIT = document.getElementsByClassName('form_create_user__submit')[0];
var TXT_CREATE_PASS1 = document.getElementsByClassName('form_create_user__pass1')[0];
var TXT_CREATE_PASS2 = document.getElementsByClassName('form_create_user__pass2')[0];
var LBL_CREATE_ERROR = document.getElementsByClassName('form_create_user__error')[0];

BTN_CREATE_SUBMIT.addEventListener('click', submit_on_click);

function submit_on_click () {
  // check if same
  let isSame = (TXT_CREATE_PASS1.value == TXT_CREATE_PASS2.value);
  if (!isSame) {
    LBL_CREATE_ERROR.innerHTML = 'Passwords do not match!';
  }

  if (!TXT_CREATE_PASS1.value) {
    LBL_CREATE_ERROR.innerHTML = 'Passwords can\'t be blank';
  }

  // check if at least one number
  let re = /[0-9]/;
  if (!re.test(TXT_CREATE_PASS1.value)) {
    let isPass = false;
    LBL_CREATE_ERROR.innerHTML = 'Password must contain at least one number (0-9)!';
    TXT_CREATE_PASS1.focus();
  } else {
    let isPass = true;
  }

  // submit form if both tests pass
  if (isPass && isSame && !!TXT_CREATE_PASS1.value) {
    FORM_CREATE.submit();
  }
}