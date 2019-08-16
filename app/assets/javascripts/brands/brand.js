$(document).on('turbolinks:load', function(){
  $('#brand-field').hide()

  $('#item_category_id').on('change', function(){
    $('#brand-field').hide()
  })

  $('#child_id').on('change', function(){
    $('#brand-field').show()
  })
})