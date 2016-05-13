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

var extensionCheck = function(){
  var phoneNumbers = $("#contacts .phone");
  $.each(phoneNumbers, function(index, phoneNumber) {
    if ($(phoneNumber).text().includes("x")) {
      $(phoneNumber).parent('tr').fadeIn();
    } else {
      $(phoneNumber).parent('tr').fadeOut();
    }
  });
};

var comCheck = function(){
  var comEmail = $("#contacts .email");
  $.each(comEmail, function(index, comEmail) {
    if ($(comEmail).text().includes("com")) {
      $(comEmail).parent('tr').fadeIn();
    } else {
      $(comEmail).parent('tr').fadeOut();
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
  $(".extensions").click(function(){
    extensionCheck();
    $(this).toggleClass("active_button");
  });
  $(".com").click(function(){
    comCheck();
    $(this).toggleClass("active_button");
  });
});