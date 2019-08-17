$(document).on('turbolinks:load', function(){
  var clothesIds = ["14","15","16","17","18","20","29","30","33","34","35","38","43","45"]
  $('.size-field').hide()

  function appendSize(size) {
    var option = `
                <option value="${size.id}">${size.name}</option>
                `
    var html = $('#size-form')
    html.append(option)
  }

  $('#item_category_id').change(function(){
    $('#size-form').empty()
    $('.size-field').hide()
  })

  $('#grandchild_id').change(function(){
    var select = $('#child_id').val()
    var result = $.inArray(select, clothesIds)
    if (select == 19 || select == 36) {
      $.ajax({
        url: '/sizes/shoes_size',
        type: "GET",
        dataType: 'json',
      })
      .done(function(shoesSize){
        $('.size-field').show()
        $('#size-form').empty()
        shoesSize.size.forEach(function(size){
          appendSize(size)
        })
      })
      .fail(function(){
        console.log("fail")
      })

    }else if (result != -1 ) {
      debugger
      $.ajax({
        url: '/sizes/clothes_size',
        type: "GET",
        dataType: 'json',
      })
      .done(function(clothesSize){
        $('.size-field').show()
        $('#size-form').empty()
        clothesSize.size.forEach(function(size){
          appendSize(size)
        })
      })
      .fail(function(clothesSize){
        console.log("fail")
      })
    } else {
      $('#size-form').empty()
      $('.size-field').hide()
    }
  })
})