$(document).on('turbolinks:load', function(){
  $('#brand-field').hide()

  $('#item_category_id').on('change', function(){
    $('#brand-field').hide()
  })

  $('#grandchild_id').on('change', function(){
    $('#brand-field').show()
  })
})