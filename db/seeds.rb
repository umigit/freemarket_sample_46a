require 'csv'

if Rails.env.development?
  User.create(email: "test@gmail.com", password: "11111111")

  CSV.foreach('db/categories.csv', headers: true) do |row|
    Category.create(id: row['id'], created_at: row['created_at'], updated_at: row['updated_at'], name: row['name'], parent_id: row['parent_id'])
  end

  CSV.foreach('db/brands.csv', headers: true) do |row|
    Brand.create(id: row['id'], created_at: row['created_at'], updated_at: row['updated_at'], name: row['name'], parent_id: row['parent_id'])
  end

  CSV.foreach('db/items.csv', headers: true) do |row|
    Item.create(id: row['id'], name: row['name'], comment: row['comment'], created_at: row['created_at'], updated_at: row['upadated_at'], category_id: row['category_id'], prefecture_id: row['prefecture_id'], user_id: row['user_id'], brand_id: row['brand_id'], days_to_ship: row['days_to_ship'], price: row['price'], condition: row['condition'], sales_condition: row['sales_condition'], shipping_fee: row['shipping_fee'])
  end

  CSV.foreach('db/item_images.csv', headers: true) do |row|
    ItemImage.create!(id: row['id'], created_at: row['created_at'], updated_at: row['updated_at'], item_id: row['item_id'], image: open("#{Rails.root}/public" + row['image']))
  end
elsif Rails.env.test?
else
  User.create(email: "test@gmail.com", password: "11111111")

  CSV.foreach('db/categories.csv', headers: true) do |row|
    Category.create(id: row['id'], created_at: row['created_at'], updated_at: row['updated_at'], name: row['name'], parent_id: row['parent_id'])
  end

  CSV.foreach('db/brands.csv', headers: true) do |row|
    Brand.create(id: row['id'], created_at: row['created_at'], updated_at: row['updated_at'], name: row['name'], parent_id: row['parent_id'])
  end
end
