// need to put in password check

// need to put in password and copy match check

// need to put in a js submit button that checks the above 2

var FORM_CREATE = document.getElementsByClassName('main-setting-form')[0];
var BTN_CREATE_SUBMIT = document.getElementsByClassName('main-settings-apply')[0];
var TXT_CREATE_PASS1 = document.getElementsByClassName('main-setting-pass1')[0];
var TXT_CREATE_PASS2 = document.getElementsByClassName('main-setting-pass2')[0];
var LBL_CREATE_ERROR = document.getElementsByClassName('main-settings-error')[0];

BTN_CREATE_SUBMIT.addEventListener('click', submitOnClick);

function submitOnClick () {
  // check if same
  let isSame = (TXT_CREATE_PASS1.value === TXT_CREATE_PASS2.value) && (TXT_CREATE_PASS1.value);
  if (!isSame) {
    LBL_CREATE_ERROR.innerHTML = 'Passwords do not match!';
  }
  // check if at least one number
  let re = /[0-9]/;
  let isPass;
  if (!re.test(TXT_CREATE_PASS1.value)) {
    isPass = false;
    LBL_CREATE_ERROR.innerHTML = 'Password must contain at least one number (0-9)!';
    TXT_CREATE_PASS1.focus();
  } else {
    isPass = true;
  }

  // submit form if both tests pass
  if (isPass && isSame) {
    FORM_CREATE.submit();
  }
}
