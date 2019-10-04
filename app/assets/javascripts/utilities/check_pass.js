document.addEventListener('turbolinks:load', function()
{
  var passwordConfirmation = document.getElementById("user_password_confirmation");

  if (passwordConfirmation)
    passwordConfirmation.addEventListener('input', comparePassword);
})

function comparePassword()
{
  var pass1 = document.getElementById("user_password");
  var pass2 = document.getElementById("user_password_confirmation");

  if (pass2.value === '') {
    pass2.classList.remove('red_bg');
    pass2.classList.remove('green_bg');
  }
  else if (pass1.value === pass2.value) {
    pass2.classList.remove('red_bg');
    pass2.classList.add('green_bg');
  }
  else {
    pass2.classList.remove('green_bg');
    pass2.classList.add('red_bg');
  }
}