document.addEventListener('DOMContentLoaded', function () {
  var timer = document.getElementById('timer')

  if (timer) { start(timer) }
})

function start() {
  var initialTime = timer.dataset.initialTime
  var passageTime = timer.dataset.passageTime * 60
  var elapsedTime = Math.trunc(Date.now() / 1000) - initialTime
  var remainingTime = passageTime - elapsedTime

  if (elapsedTime >= passageTime) {
    document.querySelector('.test-passage-form').submit()
    return
  }

  var minutes = Math.trunc(remainingTime / 60)
  var seconds = remainingTime - (minutes * 60)

  if (seconds < 10) { seconds = '0' + seconds }

  if (minutes < 10) { minutes = '0' + minutes }

  timer.textContent = minutes + ':' + seconds

  setTimeout(start, 1000, timer)
}
