$(document).ready ->
  $('#quantity').on "change keyup input": ->
    converter();

  $('#inverter').click ->
    inverter();

  converter = () ->
    if $('form').attr('action') == '/exchange'
      $.ajax '/exchange',
          type: 'POST'
          dataType: 'json'
          data: {
                  currency: $("#currency").val(),
                  currency_destination: $("#currency_destination").val(),
                  quantity: $("#quantity").val()
                }
          error: (jqXHR, textStatus, errorThrown) ->
            alert textStatus
          success: (data, text, jqXHR) ->
            $('#result').val(data.value)
        return false;

  inverter = () ->
    currency_first = $("#currency").val();
    $("#currency").val($("#currency_destination").val());
    $("#currency_destination").val(currency_first);
    converter();
