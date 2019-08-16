$(document).on('turbolinks:load', function(){

  function appendChild(child) {
    var linkschild = `
                <a data-id="${child.id}" class="category__links-child" href="">${child.name}</a>
                `
    var linksgrand  = `
                      <a data-id="${child.id}" class="category__links-grand" href="">${child.name}</a>
                      `
    if (child.parent_id < 14) {
      var childHtml = $('#child-category')
      childHtml.append(linkschild)
    }else {
      var grandchildHtml = $('#grandchild-category')
      grandchildHtml.append(linksgrand)
    }
  }

  $('.category__links').on('mouseover', function(){
    var obj = $(this).data()
    var select = obj.id
    if (select) {
      $.ajax({
        url: '/categories/search_children',
        type: "GET",
        data: { select: select},
        dataType: 'json',
      })
      .done(function(children){
        $('#child-category').empty();
        children.forEach(function(child){
          appendChild(child)
        })
      })
      .fail(function(child){
        
      })
    }else {
      $('#child-category').empty();
    }
  })
  $(document).on('mouseover', ".category__links-child", function(){
    var obj = $(this).data()
    var select = obj.id
    $.ajax({
      url: '/categories/search_children',
      type: "GET",
      data: { select: select},
      dataType: 'json',
    })
    .done(function(children){
      $('#grandchild-category').empty();
      children.forEach(function(child){
        appendChild(child)
      })
    })
    .fail(function(child){
      
    })
  })
});