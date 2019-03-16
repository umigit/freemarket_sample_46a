$(function () {
  $(document).on('keyup', '#priceField', function () {
    let input = $(this).val() / 1;
    console.log(input);
    if (input < 300 || input > 9999999) {
      $("#chargeField").text("-");
      $("#profitField").text("-");
      return false;
    }

    let charge = parseInt(input / 10);
    $("#chargeField").text("¥" + charge.toLocaleString());

    let profit = input - charge;
    $("#profitField").text("¥" + profit.toLocaleString());
  });
});
