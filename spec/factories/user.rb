FactoryGirl.define do

  factory :user do
    nickname                "merukari"
    mail                    "aaa@gmail.com"
    password                "1234567"
    password_confirmation   "1234567"
    last_name               "山田"
    first_name              "和樹"
    last_name_kana          "ヤマダ"
    first_name_kana         "カズキ"
    birth_y                 "1990"
    birth_m                 "1"
    birth_d                 "1"
  end

end
