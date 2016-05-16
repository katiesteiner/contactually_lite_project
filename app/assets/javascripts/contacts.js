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

var alphaCheck = function() {
  var $table = $('#contacts');
  var $tableBody = $table.find('tbody');
  var rows, sortedRows;
  function sortRows(a, b){
    if ( $(a).find('td:nth-child(3)').text() > $(b).find('td:nth-child(3)').text() ) {
      return 1;
    }
    if ( $(a).find('td:nth-child(3)').text() < $(b).find('td:nth-child(3)').text() ) {
      return -1;
    }
      return 0;
    }
    //get the rows from the table
  rows = $tableBody.find('tr');

    //sort the rows as "sortedrows"
  sortedRows = rows.sort(sortRows);

    //replace the old rows with the new rows
  $tableBody.remove('tr');
  $tableBody.append(sortedRows);      
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
  $(".alpha").click(function(){
    alphaCheck();
    $(this).toggleClass("active_button");
  });
});

