$(function () {

  $('#collapse1').on('shown.bs.collapse', function () {
    console.log("Change time to views");
    document.getElementById('visit_input').name = "";
    document.getElementById('visit_input').required = false;
    document.getElementById('time_input').name = "message[time_remains]";
    document.getElementById('time_input').required = true;
  })


  $('#collapse2').on('shown.bs.collapse', function () {
    document.getElementById('time_input').name = "";
    document.getElementById('time_input').required = false;
    document.getElementById('visit_input').name = "message[visits_remains]";
    document.getElementById('visit_input').required = true;
  })

  $('#collapse1').on('hidden.bs.collapse', function () {
    $(this)
      .find('input')
        .val('')
        .end;
  })

  $('#collapse2').on('hidden.bs.collapse', function () {
    $(this)
      .find('input')
        .val('')
        .end;
  })

});


// document.getElementsByName('message[visits_remains]').value = 5;
