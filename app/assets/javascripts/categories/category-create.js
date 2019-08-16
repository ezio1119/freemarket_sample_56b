$(document).on('turbolinks:load', function(){

  $('#child_id').hide()
  $('#grandchild_id').hide()
  function appendChild(child) {
    var option = `
                <option value="${child.id}">${child.name}</option>
                `
    var select = $('#child_id')
    select.append(option)
  }

  function appendGrandchild(grandchild) {
    var option = `
                <option value="${grandchild.id}">${grandchild.name}</option>
                `
    var select = $('#grandchild_id')
    select.append(option)
  }

  $('#item_category_id').change(function(){
    var select = $('#item_category_id').val()
    $.ajax({
      url: '/categories/search_children',
      type: "GET",
      data: { select: select },
      dataType: 'json',
    })
    .done(function(children){
      $('#child_id').show()
      $('#child_id').empty()
      children.forEach(function(child){
        appendChild(child)
      })
    })
    .fail(function(children){
      console.log("fail")
    })
    $('#child_id').change(function(){
      var select = $('#child_id').val()
      $.ajax({
        url: '/categories/search_children',
        type: "GET",
        data: { select: select },
        dataType: 'json',
      })
      .done(function(grandchildren){
        $('#grandchild_id').show()
        $('#grandchild_id').empty()
        grandchildren.forEach(function(grandchildren){
          appendGrandchild(grandchildren)
        })
      })
      .fail(function(grandchildren){
        console.log("fail")
      })
    })
  })
})