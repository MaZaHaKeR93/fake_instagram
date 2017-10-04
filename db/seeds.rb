# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# image_path = "#{Rails.root}/path/to/image_file.extension"
# image_file = File.new(image_path)


# user = User.create!(username:'MaZaHaKeR', password: 'qwerty', email: "admin@admin.ru")
# user2 = User.create!(username:'Ololoev', password: 'qwerty', email: "ololoev@mail.ru")

# post = Post.create!(image: File.new("#{Rails.root}/app/assets/images/standart.jpg"),
# 										caption: "Come caption for post", user_id: user.id)
# post2 = Post.create!(image: File.new("#{Rails.root}/app/assets/images/standart.jpg"),
# 										caption: "Some caption for post la la la la la", user_id: user2.id)


5.times do
	user = User.create!(username: Faker::Name.name, 
											password: Faker::Internet.password, 
											email: Faker::Internet.unique.safe_email)
	5.times do
		post = Post.create!(image: File.new("#{Rails.root}/app/assets/images/standart.jpg"),
												caption: Faker::Lorem.sentence, user_id: user.id)
	end
end