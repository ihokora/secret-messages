$(function () {

  $('#collapse1').on('shown.bs.collapse', function () {
    document.getElementById('visit-input').name = "";
    document.getElementById('visit-input').required = false;
    document.getElementById('time-input').name = "message[time_remains]";
    document.getElementById('time-input').required = true;
  })

  $('#collapse2').on('shown.bs.collapse', function () {
    document.getElementById('time-input').name = "";
    document.getElementById('time-input').required = false;
    document.getElementById('visit-input').name = "message[visits_remains]";
    document.getElementById('visit-input').required = true;
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



