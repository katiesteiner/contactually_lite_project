var showAll = function(){
  $(".firstName").each(function(){
    $(this).parent().fadeIn();
  })
};

var internationalCheck = function(){
  var phoneNumbers = $("#contacts .phone");
  $.each(phoneNumbers, function(index, phoneNumber) {
    if ($(phoneNumber).text().startsWith(0)) {
      $(phoneNumber).parent('tr').fadeIn();
    } else {
      $(phoneNumber).parent('tr').fadeOut();
    }
  });
};

$(document).ready(function(){
  $(".all").click(function(){
    showAll();
  });
  $(".international").click(function(){
    internationalCheck();
    $(this).toggleClass("active_button");
  });
});