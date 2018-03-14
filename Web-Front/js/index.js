$(document).ready(function () {
  $('.carousel').carousel();
  /*$('#myTab a').on('click', function (e) {
    e.preventDefault();
    $(this).tab('show')
  });*/
  // $('.carousel').carousel('pause');
  // $('.form-register-account').css({display :'none', visibility: 'hidden'});
  const form_register =  $('.form-register-account');
  const form_login =  $('.form-login-account');
  const page_text_header_login =  $('.page-header.text-center h1');
  $('.myAccount').click(function (e) {
    $('.accountList').toggleClass('activeAccountList');
  });

  /*--------------show hide form login/register*/
  $('.btn-show-login-form').click(function (e) {
    e.preventDefault();
    form_register.fadeOut(100, function () {
      form_login.fadeIn(200, function () {
      });
      page_text_header_login.html('Login Now');
    });
  });
  $('.btn-show-register-form').click(function (e) {
    e.preventDefault();
    form_login.fadeOut(100, function () {
      form_register.css({display :'block', visibility: 'visible'});
      form_register.fadeIn(200, function () {

      });
      page_text_header_login.html('CREATE AN ACCOUNT');
    });
  });
  /*--------------------end show hide form login/register*/

});
