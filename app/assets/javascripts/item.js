$(document).on('turbolinks:load', function() {
  var dropzone = $('.dropzone-area');
  var images = [];
  var inputs = [];
  var input_area = $('.input_area');
  var preview = $('#preview');
  $(document).on('change', 'input[type="file"].newpage__box__upload__drop--span', function(){
    var file = $(this).prop('files')[0];
    var reader = new FileReader();
    inputs.push($(this));
    var img = $(`<div class= "img_view"><img></div>`);
    reader.onload = function(e) {
      var btn_wrapper = $('<div class="btn_wrapper"><div class="btn edit">編集</div><div class="btn delete">削除</div></div>');
      img.append(btn_wrapper);
      img.find('img').attr({
        src: e.target.result
      })
    }
    reader.readAsDataURL(file);
    images.push(img);

    $('#preview').empty();
    $.each(images, function(index, image){
      image.attr('data-image', index);
      preview.append(image);

      preview.css({
        'width': `125px * ${images.length}`,
      });
      $('img').css({
        'width': `115px`,
      });
      dropzone.css({
        'width': `calc(100% - (125px * ${images.length}))`
      })

      if(images.length == 5){
        dropzone.css({
          'display': 'none'
        })
      }

      var new_image = $(`<input multiple= "multiple" name="item[images][]" class="newpage__box__upload__drop--span input-default" data-image= ${images.length} type="file" id="upload-image${images.length}">`);
      input_area.prepend(new_image);
      $(`#upload-image${images.length - 1}`).hide();
    });
    $(document).on('click', '.delete', function(){
      var target_image = $(this).parent().parent();
      $.each(inputs, function(index, input){
        if ($(this).data('image') == target_image.data('image')){
          $(this).remove();
          target_image.remove();
          var num = $(this).data('image');
          images.splice(num, 1);
          inputs.splice(num, 1);

          dropzone.css({
            'display': 'block',
            'width': `calc(100% - (125px * ${images.length}))`
          });

          if(inputs.length == 0){
            $('input[type="file"].newpage__box__upload__drop--span').attr({
              'data-image': 0
            })
          }
        }
      })
    })
  });
});
