// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){
  $('.toggle_next_element').click(function(event){
    $(this).parent().next('.hideable').slideToggle('slow');
  });
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
});
