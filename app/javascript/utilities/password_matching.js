document.addEventListener('turbolinks:load', function() {
  password = document.getElementById('user_password');
  password_confirmation = document.getElementById('user_password_confirmation');

  if (password_confirmation) { password_confirmation.addEventListener('input', matchPasswConf) }
});

function matchPasswConf() {
  if (password.value && password_confirmation.value) {
    if (password.value === password_confirmation.value) {
      document.querySelector('.octicon-check').classList.remove('hide')
      document.querySelector('.octicon-x').classList.add('hide')
    } else {
      document.querySelector('.octicon-x').classList.remove('hide')
      document.querySelector('.octicon-check').classList.add('hide')
    }
  } else {
  document.querySelector('.octicon-x').classList.add('hide')
  document.querySelector('.octicon-check').classList.add('hide')
  }
}
