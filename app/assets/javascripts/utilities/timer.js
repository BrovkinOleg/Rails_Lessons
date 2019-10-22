
document.addEventListener('turbolinks:load', function() {
  let timerSeconds = document.querySelector('.timer');
  if (timerSeconds) {
    let time = timerSeconds.dataset.timeleft;

    setInterval(function () {
      if (time > 0) {
        time -= 1;
      } else {
        alert('Время вышло');
        document.querySelector('form').submit();
      }
      let result = parseInt(time / 60) + ':' + time % 60;
      timerSeconds.innerHTML = result;
    }, 1000)
  };
});