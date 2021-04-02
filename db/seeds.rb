# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



  user_name = User.where(name:"Guest")
  user_id = user_name.ids[0]

  @set_guest_family = ["ルフィ","ナミ","ウソップ","ゾロ","ロビン","ブルック","チョッパー","ジンベエ","フランキー","サンジ"]

  @set_guest_family.each do |guest_family|
    Family.create!(
      family_name: guest_family,
      user_id: user_id,
    )
  end

  # @guest_menu_list = ["オムライス","チキン南蛮","カレー","シチュー","ハヤシライス","親子丼","カルボナーラ","唐揚げ","すき焼き","お好み焼き"]
  @guest_menu_list = { "オムライス":"./public/imaage/omurasu.png","チキン南蛮":"./public/imaage/food_chicken_nanban.png","カレー":"./public/imaage/curry.png","シチュー":"./public/imaage/stew.png","ハヤシライス":"./public/imaage/hayashi_rice.png","親子丼":"./public/imaage/food_oyakodon.png","カルボナーラ":"./public/imaage/carbonara.png","唐揚げ":"./public/imaage/food_karaage_cup.png","すき焼き":"./public/imaage/food_sukiyaki.png","お好み焼き":"./public/imaage/okonomiyaki.png" }
  # { first_name: "Yusuke", last_name: "Higaki" }
  @guest_families = Family.where(user_id:user_id)


  @guest_menu_list.each do |guest_menu_list,image|
    @randam_guest_family = @guest_families.offset(rand(3)).first
    MenuList.create!(
      menu_name: guest_menu_list,
      user_id: user_id,
      family_id: @randam_guest_family.id,
      image:File.open(image),
                 )
  end
