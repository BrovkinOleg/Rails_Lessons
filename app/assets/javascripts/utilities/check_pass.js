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

  var goodColor = "#00FF00";
  var badColor = "#FF0000";

  if (pass2.value === '')
    pass2.style.backgroundColor = '';
  else if (pass1.value === pass2.value)
    pass2.style.backgroundColor = goodColor;
  else
    pass2.style.backgroundColor = badColor;
}