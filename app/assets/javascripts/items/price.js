$(document).on('turbolinks:load', function() {
  if('#selling_price' !== ''){
    $('#fee').text('***');
    $('#sales_profit').text('***');
  }
  var input = $('#selling_price').val();
  if( 300 <= input && input <= 9999999){
    var num = Math.floor(input/10);
    var Num = num.toLocaleString()
    var num2 = (input -num);
    var Num2 = num2.toLocaleString()
    $('#fee').text(Num);
    $('#sales_profit').text(Num2);
  }
  $('#selling_price').on('keyup', function(e){
    e.preventDefault();
    var input = $('#selling_price').val();
    if( 300 <= input && input <= 9999999){
      var num = Math.floor(input/10);
      var Num = num.toLocaleString()
      var num2 = (input -num);
      var Num2 = num2.toLocaleString()
      $('#fee').text(Num);
      $('#sales_profit').text(Num2);
    }else{
      $('#fee').text('***');
      $('#sales_profit').text('***');
    }
  })
})