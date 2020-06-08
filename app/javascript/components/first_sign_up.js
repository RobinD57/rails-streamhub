const firstSignUp = () => {
  const params = new URLSearchParams(window.location.search)
  const isFirstSignIn = params.get('first_sign_in');
  if (isFirstSignIn) {
    window.addEventListener('load', (event) => {
      $('#modal-window').modal('show')
    });
  }
}

export { firstSignUp }
