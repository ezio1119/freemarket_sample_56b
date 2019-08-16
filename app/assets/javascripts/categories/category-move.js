$(document).on('turbolinks:load', function(){
  $('.cate').hide()
  $('#categories').mouseover(function(){
    $('.category').show()
  })
  $('.category').mouseover(function(){
    $('#child-category').show()
    $('#grandchild-category').hide()
  })
  $('#child-category').mouseover(function(){
    $('#grandchild-category').show()
  })
  $('.main').on('mouseover', function(){
    $('.cate').hide()
  })
})