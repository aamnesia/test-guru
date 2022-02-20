document.addEventListener('DOMContentLoaded', function() {
  var password = document.getElementById('user_password');
  var password_confirmation = document.getElementById('user_password_confirmation');

  if (password_confirmation) { password_confirmation.addEventListener('input', matchPasswConf) }
});

function matchPasswConf() {
  var password = document.getElementById('user_password');
  var password_confirmation = document.getElementById('user_password_confirmation');

  if (password_confirmation.value === '') {
    document.querySelector('.octicon-x').classList.add('hide')
    document.querySelector('.octicon-check').classList.add('hide')
  } else if (password.value === password_confirmation.value) {
    document.querySelector('.octicon-check').classList.remove('hide')
    document.querySelector('.octicon-x').classList.add('hide')
  } else {
    document.querySelector('.octicon-x').classList.remove('hide')
    document.querySelector('.octicon-check').classList.add('hide')
  }
}
