var showAll = function(){
  $(".firstName").each(function(){
    $(this).parent().fadeIn();
  });
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
  $('.alpha').click(function(e) {
    var $sort = this;
    var $table = $('#contacts .email');
    var $tableTr = $('tr #"contact-<%= contact.id %>"',$table);
      $tableTr.sort(function(a, b){
        var keyA = $(a).text();
        var keyB = $(b).text();
        if($($sort).hasClass('alpha')){
          return (keyA > keyB) ? 1 : 0;
        } 
      });
      $.each($tableTr, function(index, row){
        $table.append(row);
      });
     e.preventDefault();
   });
});

