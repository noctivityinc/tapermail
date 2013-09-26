var TPR = {}

TPR.common = {
    init: function () {

      $('header a[href="' + location.pathname + '"]').parent().addClass('active');

      $('#fbLoginButton').click(function(event) {
        event.preventDefault();
        $('.spinner').show()

        fb_status(function() {
          fb_login();
        });
      });

      $('#share_twitter_window').click(function(ev) {
        var height, left, opts, top, url, width;
        ev.preventDefault();
        width = 575;
        height = 400;
        left = ($(window).width() - width) / 2;
        top = ($(window).height() - height) / 2;
        url = this.href;
        opts = 'status=1' + ',width=' + width + ',height=' + height + ',top=' + top + ',left=' + left;
        return window.open(url, 'twitter', opts);
      });

    }
};

function isBadIE () {
  return ($('html').hasClass('ie6') || $('html').hasClass('ie7') || $('html').hasClass('ie8'))
}

function fb_login () {
  FB.login(function(response) {
      if (response.authResponse) {
          fb_fetch();
      } else {
        // need to do something here if they dont let us in.  for now redirecting to manual login
        location.href = '/users/sign_up'
      } 
    }, {scope: 'email, publish_stream'});
}

function fb_status (cb) {
  FB.getLoginStatus(function(response) {
      if (response.status === 'connected') {
        // connected
        fb_fetch();
      } else {
        cb.call(this);
      }
  });
}

function fb_fetch () {
  FB.api('/me', {fields: "id,first_name,last_name,email,picture"}, function(response) {
    var url = $('#fbLoginButton').data('post-url');
        $.post(url, response, function (data) {
          location.href = data.url
        }, 'json')
    });
}

