$(document).ready(function () {
  $('.carousel').carousel();
  // $('.carousel').carousel('pause');
  $('.myAccount').click(function (e) {
    $('.accountList').toggleClass('activeAccountList');

  });
});
