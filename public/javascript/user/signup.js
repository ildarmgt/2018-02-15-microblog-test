// With help from The Art of The Web: http://www.the-art-of-web.com/javascript/validate-password/#box1

function checkForm(form) {
    if (form.username.value == "") {
        document.getElementById("error1").textContent = "Error: Username cannot be blank!";
        form.username.focus();
        return false;
    }
    re = /^\w+$/;
    if (!re.test(form.username.value)) {
        document.getElementById("error2").textContent = "Error: Username must contain only letters, numbers and underscores!";
        form.username.focus();
        return false;
    }

    if (form.pass1.value != "" && form.pass1.value == form.pass2.value) {
        if (form.pass1.value.length < 6) {
            document.getElementById("error3").textContent = "Error: Password must contain at least six characters!";
            form.pass1.focus();
            return false;
        }
        if (form.pass1.value == form.username.value) {
            document.getElementById("error4").textContent = "Error: Password must be different from Username!";
            form.pass1.focus();
            return false;
        }
        re = /[0-9]/;
        if (!re.test(form.pass1.value)) {
            document.getElementById("error5").textContent = "Error: Password must contain at least one number (0-9)!";
            form.pass1.focus();
            return false;
        }
        re = /[a-z]/;
        if (!re.test(form.pass1.value)) {
            document.getElementById("error6").textContent = "Error: Password must contain at least one lowercase letter (a-z)!";
            form.pass1.focus();
            return false;
        }
        re = /[A-Z]/;
        if (!re.test(form.pass1.value)) {
            document.getElementById("error7").textContent = "Error: Password must contain at least one uppercase letter (A-Z)!";
            form.pass1.focus();
            return false;
        }
    } else {
        document.getElementById("error8").textContent = "Error: Please check that you've entered and confirmed your password!!";
        form.pass1.focus();
        return false;
    }
    document.getElementById("good").textContent = "You're good! Welcome!";
    return true;
}