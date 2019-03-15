$(function () {

  $(document).on('change', '#item_category_id', function () {
    const id = $(this).val();

    $.ajax({
      type: "get",
      url: "/items/category",
      data: { id: id },
      dataType: "json",
    })
    .then(
      function (response) {
        const prompt = `<option value="">---</option>`;

        $("#item_sub_category_id").html(prompt);
        $("#item_sub_sub_category_id").html(prompt);

        $("#sell-form-sub_category").css("display", "block");
        $("#sell-form-sub_sub_category").css("display", "none");

        response.forEach(function (category) {

          const item = `<option value="${category.id}">${category.name}</option>`;

          $("#item_sub_category_id").append(item);
        });
      },
      function (response) {

      }
    );
  });

  $(document).on('change', '#item_sub_category_id', function () {
    const id = $(this).val();

    $.ajax({
      type: "get",
      url: "/items/category",
      data: { id: id },
      dataType: "json",
    })
    .then(
      function (response) {
        const prompt = `<option value="">---</option>`;
        $("#item_sub_sub_category_id").html(prompt);
        $("#sell-form-sub_sub_category").css("display", "block");

        response.forEach(function (category) {

          const item = `<option value="${category.id}">${category.name}</option>`;
          $("#item_sub_sub_category_id").append(item);
        });
      },
      function (response) {

      }
    );
  });
});
