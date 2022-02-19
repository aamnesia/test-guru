document.addEventListener('DOMContentLoaded', function() {
  console.log("3")
  var progressBar = document.getElementById('progress');

  if (progressBar) {
    var questionsCount = progressBar.dataset.questionsCount;
    var questionNumber = progressBar.dataset.questionNumber;


    var progressPercent = questionNumber/questionsCount * 100;

    progressBar.style.width = progressPercent
  }
})
