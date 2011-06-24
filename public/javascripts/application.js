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
  
  var defaultDateTime = new Date();
  defaultDateTime.setHours(17, 0);
  
  function setDateTimePicker(){
    $('#due_date').datetimepicker({
      stepMinute: 15,
      minuteMax: 45,
      ampm: true
    });
    var dueDateTime = $('#task_due').val();
    var dueDate = new Date();
    if(dueDateTime.length > 1){
      var dueDateTimeSplit = $('#task_due').val().split(' ');
      var dueDateSplit = dueDateTimeSplit[0].split('-');
      var year = dueDateSplit[0];
      var month = dueDateSplit[1];
      month = month - 1;
      var date = dueDateSplit [2];
      var dueTimeSplit = dueDateTimeSplit[1].split(':');
      var hour = dueTimeSplit[0];
      hour = hour - 6;
      var minute = dueTimeSplit[1];
      dueDate.setFullYear(year);
      dueDate.setMonth(month);
      dueDate.setDate(date);
      dueDate.setHours(hour);
      dueDate.setMinutes(minute);
    }
    $('#due_date').datetimepicker('setDate', (dueDate));
    $('#include_due_date').click(function(){
      $('#task_submit').click(function(){
        $('#task_due').val($('#due_date').datetimepicker('getDate'));
      });
    });
  };
  
  setDateTimePicker();
  

  /* Add effects to messages in header */
  
  $('#messages').effect('slide').delay(5000).fadeOut(2000);
  
});
