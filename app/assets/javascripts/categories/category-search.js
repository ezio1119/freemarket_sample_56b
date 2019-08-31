$(document).on('turbolinks:load', function(){

  function appendChild(child) {
    var linkschild = `
                <a data-id="${child.id}" class="contents-bar__point__category__links-child" href="/categories/${child.id}">${child.name}</a>
                `
    var linksgrand  = `
                      <a data-id="${child.id}" class="contents-bar__point__category__links-grand" href="/categories/${child.id}">${child.name}</a>
                      `
    if (child.parent_id < 14) {
      var childHtml = $('#child-category')
      childHtml.append(linkschild)
    }else {
      var grandchildHtml = $('#grandchild-category')
      grandchildHtml.append(linksgrand)
    }
  }

  $('.contents-bar__point__category__links').on('mouseover', function(){
    var obj = $(this).data()
    var select = obj.id
    $('#child-category').empty();
    if (select) {
      $.ajax({
        url: '/categories/search_children',
        type: "GET",
        data: { select: select},
        dataType: 'json',
      })
      .done(function(children){
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
  $(document).on('mouseover', ".contents-bar__point__category__links-child", function(){
    var obj = $(this).data()
    var select = obj.id
    $('#grandchild-category').empty();
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