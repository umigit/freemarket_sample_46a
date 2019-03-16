$(function () {
  let imageCount = 0;
  let imageList = [];


  $(document).on('change', '#sell-form-upload', function () {
    const files = $(this).prop('files');

    manageFiles(files);
  });

  $(document).on('click', '#dropbox', function () {
    $("#sell-form-upload").click();
  });

  $(document).on('click', '.upload-item__container__button__delete', function () {
    const id = $(this).data('id');
    console.log('delete');
    console.log(id);
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
        imageList.push(reader.result);
        addPreviewToUploadField(reader.result, imageList.length - 1);
      }

      reader.readAsDataURL(files[i]);
    }
  }
});
