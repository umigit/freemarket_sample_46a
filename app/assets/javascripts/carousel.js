$(document).on('turbolinks:load', function () {
  $(".carousel").slick({
    dots: true,
    autoplay: true,
    autoplaySpeed: 2000,
  });

  $(".slider").slick({
    arrows: false,
    infinite: false,
  });

  let timer;
  let index;
  let currentItem = $(".thumbnail__item:first");
  let beforeItem = currentItem;
  $(".thumbnail__item").on('mouseenter', function () {

    index = $(this).data('index');
    currentItem = $(this);
    console.log(index);
    console.log('enter');
    clearInterval(timer);
    timer = setInterval(function () {
      $(".slider").slick("slickGoTo", index, false);
      beforeItem.removeClass("current");
      currentItem.addClass("current");
      beforeItem = currentItem;
      console.log(index);
    }, 500);
  });

  $(".thumbnail").on('mouseleave', function () {
    console.log('leave');
    clearInterval(timer);
  });
});
