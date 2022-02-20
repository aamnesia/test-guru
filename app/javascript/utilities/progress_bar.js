document.addEventListener('DOMContentLoaded', function() {
  var progressBar = document.getElementById('progress');

  if (progressBar) {
    var questionsCount = progressBar.dataset.questionsCount;
    var questionNumber = progressBar.dataset.questionNumber;


    var progressPercent = questionNumber/questionsCount * 100;

    progressBar.style.width = progressPercent + '%'
  }
})
