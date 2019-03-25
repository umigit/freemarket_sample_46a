
  function onSuccess(googleUser) {
    console.log('Logged in as: ' + googleUser.getBasicProfile().getName());
  }
  function onFailure(error) {
    console.log(error);
  }
  function renderButton() {
    gapi.signin2.render('my-signin2', {
      'scope': 'profile email',
      'width': 320,
      'height': 50,
      'longtitle': true,
      'onsuccess': onSuccess,
      'onfailure': onFailure
    });
  }
