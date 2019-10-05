document.addEventListener('turbolinks:load', function() {

  var control = document.getElementById('progressbar');

  if (control) { showCurrentProgress(control) }
});

function showCurrentProgress(control) {
  var questionNumber = control.dataset.questionNumber;
  var countOfQuestions = control.dataset.countOfQuestions;
  var level = ((100 * questionNumber) / countOfQuestions);
  control.value = level.toString();
}
