$(function () {
  let imageCount = 0;
  let imageList = [];


  $(document).on('change', '#sell-form-upload', function () {
    const files = $(this).prop('files');
    const fileLength = files.length;
    imageCount += fileLength;

    if (imageCount > 10) {
      imageCount -= fileLength;
      return false;
    }

    for (let i = 0; i < fileLength; i++){
      const reader = new FileReader();

      reader.onload = function () {
        imageList.push(reader.result);
        addPreviewToUploadField(reader.result, imageList.length - 1);
      }

      reader.readAsDataURL(files[i]);
    }
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
});
