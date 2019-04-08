$(function() {
  var reg_not_nil = new RegExp('\\S');
  var reg_mail_address = new RegExp("^[a-zA-Z0-9.!#$%&'*+\/=?^_'{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$");
  var reg_alphanumeric_6characters = new RegExp('[a-zA-Z0-9]{6,128}');
  var reg_prefecture = new RegExp("[1-47]");
  var reg_only_kana = new RegExp("[ ァ-ヺ ]");
  var reg_intger_11_phone_number = new RegExp('0[589]0-?[0-9]{4}-?[0-9]{4}');
  var reg_postal_code = new RegExp('^[0-9]{3}\-[0-9]{4}$');
  var reg_intger_14or16_card_main_number = new RegExp('[0-9]{14,16}');
  var reg_intger_3or4_card_back_number = new RegExp('[0-9]{3,4}');
  var validation = function( test , error ){
    if( test ){
      error.removeClass('active');
    }else{
      error.addClass('active');
    }
  };


  $(document).on('click', '.costom__main', function() {

    var nickname = document.getElementById('user_user_profile_attributes_nickname').value;
    var email = document.getElementById('user_email').value;
    var password = document.getElementById('user_password').value;
    var password_confirmation = document.getElementById('user_confilmation_password').value;
    var last_name = document.getElementById('user_user_profile_attributes_last_name').value;
    var first_name = document.getElementById('user_user_profile_attributes_first_name').value;
    var last_name_kana = document.getElementById('user_user_profile_attributes_last_name_kana').value;
    var first_name_kana = document.getElementById('user_user_profile_attributes_first_name_kana').value;
    var birth_y = document.getElementById('user_user_profile_attributes_birth_y').value;
    var birth_m = document.getElementById('user_user_profile_attributes_birth_m').value;
    var birth_d = document.getElementById('user_user_profile_attributes_birth_d').value;

    var test_nil_nickname = reg_not_nil.test(nickname);
    var test_nil_email = reg_not_nil.test(email);
    var test_fomart_email = reg_mail_address.test(email);
    var test_nil_password = reg_not_nil.test(password);
    var test_fomart_password = reg_alphanumeric_6characters.test(password);
    var test_nil_password_confirmation = reg_not_nil.test(password_confirmation);
    var test_match_password_confirmation = ( password == password_confirmation );
    var test_nil_last_name = reg_not_nil.test(last_name);
    var test_nil_first_name = reg_not_nil.test(first_name);
    var test_nil_last_name_kana = reg_not_nil.test(last_name_kana);
    var test_kana_last_name_kana = reg_only_kana.test(last_name_kana);
    var test_nil_first_name_kana = reg_not_nil.test(first_name_kana);
    var test_kana_first_name_kana = reg_only_kana.test(first_name_kana);
    var test_nil_birth_y = reg_not_nil.test(birth_y);
    var test_nil_birth_m = reg_not_nil.test(birth_m);
    var test_nil_birth_d = reg_not_nil.test(birth_d);

    var test_all_member_information = ( test_nil_nickname && test_nil_email && test_fomart_email && test_nil_password && test_fomart_password && test_nil_password_confirmation && test_match_password_confirmation && test_nil_last_name && test_nil_first_name && test_nil_last_name_kana && test_kana_last_name_kana && test_nil_first_name_kana && test_kana_first_name_kana && test_nil_birth_y && test_nil_birth_m && test_nil_birth_d);

    validation( test_nil_nickname , $('.self-form__nickname__nil'));
    validation( test_nil_email , $('.self-form__email__nil'));
    validation( test_fomart_email , $('.self-form__email__format'));
    validation( test_nil_password_confirmation , $('.self-form__confilmation-password__nil'));
    validation( test_match_password_confirmation , $('.self-form__confilmation-password__match'));
    validation( test_nil_password , $('.self-form__password__nil'));
    validation( test_fomart_password , $('.self-form__password__format'));
    validation( test_nil_last_name , $('.self-form__last-name__nil'));
    validation( test_nil_first_name , $('.self-form__first-name__nil'));
    validation( test_nil_last_name_kana , $('.self-form__last-name-kana__nil'));
    validation( test_kana_last_name_kana , $('.self-form__last-name-kana__kana'));
    validation( test_nil_first_name_kana , $('.self-form__first-name-kana__nil'));
    validation( test_kana_first_name_kana , $('.self-form__first-name-kana__kana'));
    validation( test_nil_birth_y , $('.self-form__birthday__nil'));
    validation( test_nil_birth_m , $('.self-form__birthday__nil'));
    validation( test_nil_birth_d , $('.self-form__birthday__nil'));

    if( test_all_member_information ){
      $('.single-main-container__head__main').removeClass('active');
      $('.right-continer__inner__main').removeClass('active');
      $('.single-main-container__head__phone').addClass('active');
      $('.right-continer__inner__phone').addClass('active');
      document.documentElement.scrollTop = 0;
      $('.progress-twe').css('color','red');
    }
    else {
      document.documentElement.scrollTop = 0;
    }
  });



  $(document).on('click', '.costom__phone', function() {

    var movile_phone = document.getElementById('user_user_profile_attributes_movile_phone').value;

    var test_nil_phone = reg_not_nil.test(movile_phone);
    var test_format_phone = reg_intger_11_phone_number.test(movile_phone);
    var test_all_phone_information = ( test_nil_phone && test_format_phone );

    validation( test_nil_phone , $('.self-form__phone__nil'));
    validation( test_format_phone , $('.self-form__phone__format'));

    if( test_all_phone_information ){
      $('.single-main-container__head__phone').removeClass('active');
      $('.right-continer__inner__phone').removeClass('active');
      $('.single-main-container__head__address').addClass('active');
      $('.right-continer__inner__address').addClass('active');
      document.documentElement.scrollTop = 0;
      $('.progress-three').css('color','red');
    }
    else {
      document.documentElement.scrollTop = 0;
    }
  });


  $(document).on('click', '.costom__address', function() {

    var relative_last_name = document.getElementById('user_address_attributes_relative_last_name').value;
    var relative_first_name = document.getElementById('user_address_attributes_relative_first_name').value;
    var relative_last_name_kana = document.getElementById('user_address_attributes_relative_last_name_kana').value;
    var relative_first_name_kana = document.getElementById('user_address_attributes_relative_first_name_kana').value;
    var postal_code = document.getElementById('user_address_attributes_postal_code').value;
    var prefecture_id = document.getElementById('user_address_attributes_prefecture_id').value;
    var city = document.getElementById('user_address_attributes_city').value;
    var block = document.getElementById('user_address_attributes_block').value;
    var building = document.getElementById('user_address_attributes_building').value;
    var home_phone = document.getElementById('user_address_attributes_home_phone').value;

    var test_nil_relative_last_name = reg_not_nil.test(relative_last_name);
    var test_nil_relative_first_name = reg_not_nil.test(relative_first_name);
    var test_nil_relative_last_name_kana = reg_not_nil.test(relative_last_name_kana);
    var test_kana_relative_last_name_kana = reg_only_kana.test(relative_last_name_kana);
    var test_nil_relative_first_name_kana = reg_not_nil.test(relative_first_name_kana);
    var test_kana_relative_first_name_kana = reg_only_kana.test(relative_first_name_kana);
    var test_nil_postal_code = reg_not_nil.test(postal_code);
    var test_format_postal_code = reg_postal_code.test(postal_code);
    var test_nil_prefecture_id = reg_prefecture.test(prefecture_id);
    var test_nil_city = reg_not_nil.test(city);
    var test_nil_block = reg_not_nil.test(block);

    var test_all_address_information = (test_nil_relative_last_name && test_nil_relative_first_name && test_nil_relative_last_name_kana && test_kana_relative_last_name_kana && test_nil_relative_first_name_kana && test_kana_relative_first_name_kana && test_nil_postal_code && test_format_postal_code && test_nil_prefecture_id && test_nil_city && test_nil_block);

    validation( test_nil_relative_last_name , $('.self-form__relative__last_name__nil'));
    validation( test_nil_relative_first_name , $('.self-form__relative__first_name__nil'));
    validation( test_nil_relative_last_name_kana , $('.self-form__relative__last_name_kana__nil'));
    validation( test_kana_relative_last_name_kana , $('.self-form__relative__last_name_kana__format'));
    validation( test_nil_relative_first_name_kana , $('.self-form__relative__first_name_kana__nil'));
    validation( test_kana_relative_first_name_kana , $('.self-form__relative__first_name_kana__format'));
    validation( test_nil_postal_code , $('.self-form__postal_code__nil'));
    validation( test_format_postal_code , $('.self-form__postal_code__format'));
    validation( test_nil_prefecture_id , $('.self-form__prefecture__nil'));
    validation( test_nil_city , $('.self-form__city__nil'));
    validation( test_nil_block , $('.self-form__block__nil'));

    if( test_all_address_information ){
      $('.single-main-container__head__address').removeClass('active');
      $('.right-continer__inner__address').removeClass('active');
      $('.single-main-container__head__pay').addClass('active');
      $('.right-continer__inner__pay').addClass('active');
      document.documentElement.scrollTop = 0;
      $('.progress-four').css('color','red');
    }
    else {
      document.documentElement.scrollTop = 0;
    }
  });
});





