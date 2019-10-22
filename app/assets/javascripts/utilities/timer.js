
document.addEventListener('turbolinks:load', function() {
  let timerSeconds = document.querySelector('.my_timer');
  if (timerSeconds) {
    let time = timerSeconds.dataset.timeleft;

    let timerId = setInterval(function () { timer_work() }, 1000);

    function timer_work() {
      if (time > 0) {
        time -= 1;
      } else {
        clearInterval(timerId);
        document.getElementById("time_over").click();
      }
      let minutes = (time / 60).toString(10);
      timerSeconds.innerHTML = parseInt(minutes) + ':' + time % 60;
    }
  }
});
