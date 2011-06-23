// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){
  
  /* Use live clock in header */
  
  function liveClock(){
    var currentDateTime = new Date();
    var month = currentDateTime.getMonth();
    month = month + 1;
    var date = currentDateTime.getDate();
    var hours = currentDateTime.getHours();
    var ampm = '';
    ampm = (hours >= 12) ? 'PM' : 'AM';
    hours = (hours > 12) ? hours - 12 : hours;
    hours = (hours == 0) ? hours + 12 : hours;
    var minutes = currentDateTime.getMinutes();
    minutes = (minutes < 10) ? '0' + minutes : minutes;
    var dateString = month + '/' + date;
    var timeString = hours + ':' + minutes + ' <span class="subtle">' + ampm + '</span>';
    $('#date').html(dateString);
    $('#clock').html(timeString);
  };
  setInterval(liveClock, 1000);
  
  /* Enable .toggle_next_element to hide/show next .hideable */
  
  $('.toggle_next_element').click(function(event){
    $(this).parent().next('.hideable').slideToggle('slow');
  });
  
  /* Use datetimepicker for task form */
  
  $('#due_date').datetimepicker({
    stepMinute: 15,
    minuteMax: 45,
    ampm: true
  });
  
  var defaultDate = new Date();
  defaultDate.setHours(17,0);
  $('#due_date').datetimepicker('setDate', (defaultDate));
  $('#include_due_date').click(function(){
    $('#task_submit').click(function(){
      $('#task_due').val($('#due_date').datetimepicker('getDate'));
    });
  });
  
  /* Add effects to messages in header */
  
  $('#messages').effect('slide').delay(5000).fadeOut(2000);
  
});
