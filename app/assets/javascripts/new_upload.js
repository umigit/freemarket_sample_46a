$(function () {
  let imageCount = 0;
  let imageList = [];


  $(document).on('change', '#item_item_images_attributes_0_image', function () {
    const files = $(this).prop('files');
    manageFiles(files);
  });

  $(document).on('click', '#dropbox', function () {
    $("#item_item_images_attributes_0_image").click();
  });

  $(document).on('click', '.upload-item__container__button__delete', function () {
    const id = $(this).data('id');

    imageList[id] = null;
    imageCount--;
    $("#uploadItem-" + id).empty();
    $("#dropbox").css("display", "block");
  });

  $(document).on('dragover', '#dropbox', function (event) {
    event.stopPropagation();
    event.preventDefault();
  });

  $(document).on('drop', '#dropbox', function (event) {
    event.preventDefault();
    const files = event.originalEvent.dataTransfer.files;
    manageFiles(files);
  });

  $(document).on('click', '#newItemSubmitButton', function (event) {
    event.preventDefault();

    $("#newItemSubmitButton").prop('disabled', true);

    $.ajaxPrefilter(function(options, originalOptions, jqXHR){
      var token;
      if (!options.crossDomain){
        token = $('meta[name="csrf-token"]').attr('content');

        if (token){
          return jqXHR.setRequestHeader('X-CSRF-Token', token);
        }
      }
    });

    let formData = new FormData();

    let images = imageList.filter(function (image) {
      return image != null;
    });
    images.forEach(function (image, index) {
      formData.append(`item[item_images_attributes][${index}][image]`, image);
    });

    if ($("#item_sub_sub_category_id").val()) {
      formData.append("item[category_id]", $("#item_sub_sub_category_id").val());
    }
    else if ($("#item_sub_category_id").val()) {
      formData.append("item[category_id]", $("#item_sub_category_id").val());
    }
    else if ($("#item_category_id").val()) {
      formData.append("item[category_id]", $("#item_category_id").val());
    }
    else {

    }

    formData.append("item[name]", $("#nameField").val());
    formData.append("item[comment]", $("#commentField").val());
    formData.append("item[condition]", $("#item_condition").val());
    formData.append("item[shipping_fee]", $("#item_shipping_fee").val());
    formData.append("item[region_id]", $("#item_region_id").val());
    formData.append("item[days_to_ship]", $("#item_days_to_ship").val());
    formData.append("item[price]", $("#priceField").val());

    $.ajax({
      type: "POST",
      url: "/items",
      data: formData,
      dataType: "json",
      processData: false,
      contentType: false,
    }).then(function () {

    }, function (response) {

    }).then(function () {
      $("#newItemSubmitButton").prop('disabled', false);
    });
  });

  function addPreviewToUploadField(image, index) {
    const html = `<div class="upload-item" id="uploadItem-${index}">
                    <div class="upload-item__container">
                      <figure><img src="${image}" class="upload-item__container__image" id="uploadImage-${index}"/></figure>
                      <div class="upload-item__container__button" id="upButton-${index}">
                        <a class="upload-item__container__button__edit" data-id="${index}">編集</a>
                        <a class="upload-item__container__button__delete" data-id="${index}">削除</a>
                      </div>
                    </div>
                  </div>`

    $("#uploadField").prepend(html);
  }

  function manageFiles(files) {
    const fileLength = files.length;
    imageCount += fileLength;

    for (let i = 0; i < fileLength; i++){
      if (files[i].type !== 'image/jpeg' && files[i].type !== 'image/png') {
        $(".sell-form__image__error").append(`<p>ファイル形式はjpeg、またはpngが使用できます。</p>`);

        return false;
      }
    }

    if (imageCount > 10) {
      imageCount -= fileLength;
      $(".sell-form__image").append(`<p>アップロード出来る画像は10枚までです。</p>`);
      return false;
    }
    else if (imageCount == 10) {
      $("#dropbox").css("display", "none");
    }
    else {
      $("#dropbox").css("display", "block");
    }

    $(".sell-form__image__error").empty();

    for (let i = 0; i < fileLength; i++){
      const reader = new FileReader();

      reader.onload = function () {
        imageList.push(files[i]);
        addPreviewToUploadField(reader.result, imageList.length - 1);
      }

      reader.readAsDataURL(files[i]);
    }
  }
});