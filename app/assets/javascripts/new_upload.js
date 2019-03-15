$(function () {
  $(document).on('change', '#sell-form-upload', function () {
    const files = $(this).prop('files');
    const fileLength = files.length;

    if (fileLength > 10) {
      return false;
    }

    for (let i = 0; i < fileLength; i++){
      const reader = new FileReader();

      reader.onload = function () {
        addPreviewToUploadField(reader.result, i);
      }

      reader.readAsDataURL(files[i]);
    }
  });

  $(document).on('click', '#dropbox', function () {
    $("#sell-form-upload").click();
  });

  function addPreviewToUploadField(image, index) {
    const html = `<div class="upload-item" id="uploadItem-${index}">
                    <figure><img src="${image}" class="upload-item__image" id="uploadImage-${index}"/></figure>
                    <div class="upload-item__button" id="upButton-${index}">
                      <a class="upload-item__button__edit" data-id="${index}">編集</a>
                      <a class="upload-item__button__delete" data-id="${index}">削除</a>
                    </div>
                  </div>`

    $("#uploadField").prepend(html);
  }
});
