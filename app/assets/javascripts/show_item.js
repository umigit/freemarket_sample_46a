$(function() {
  $('.item-box__images').hover(function() {
    $('.active').removeClass('active');

    var hoveredIndex = $('.item-box__images').index($(this));

    $('.item-image').eq(hoveredIndex).addClass('active');

  });

  $('.item-box__images').hover(function() {
    $('.owl-dot-inner').removeAttr("id");

    var hoveredIndex = $('.item-box__images').index($(this));
    console.log()

    $('.owl-dot-inner').eq(hoveredIndex).attr('id', 'hover');

  });
});

