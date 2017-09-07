$(document).on "ajax:beforeSend", "#emails-form", ()->
  $("#email-info").html "Se está procesando tu petición"
$(document).on "ajax:success", "#emails-form", (e,data,estado,xhr)->
  $(this).slideUp()
  $("#email-info").html "Ya estás en la fila de las invitaciones beta"
$(document).on "ajax:error", "#emails-form", (e,data,estado,xhr)->
  $("#email-info").html data.responseJSON.email[0]