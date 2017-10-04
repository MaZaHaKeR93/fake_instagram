# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# image_path = "#{Rails.root}/path/to/image_file.extension"
# image_file = File.new(image_path)


real_user = User.create!(username:'MaZaHaKeR', password: 'qwerty', email: "admin@admin.ru")
real_user2 = User.create!(username:'Ololoev', password: 'qwerty', email: "ololoev@mail.ru")

post_for_user = Post.create!(image: File.new("#{Rails.root}/app/assets/images/standart.jpg"),
										caption: "Come caption for post", user_id: real_user.id)
post2_for_user = Post.create!(image: File.new("#{Rails.root}/app/assets/images/standart.jpg"),
										caption: "Some caption for post la la la la la", user_id: real_user2.id)


5.times do
	user = User.create!(username: Faker::Name.unique.first_name, 
											password: Faker::Internet.password, 
											email: Faker::Internet.unique.safe_email,
											bio: Faker::Lorem.sentence)
	4.times do
		post = Post.create!(image: File.new("#{Rails.root}/app/assets/images/standart.jpg"),
												caption: Faker::Lorem.sentence, 
												user_id: user.id)
		3.times do
			comment = Comment.create!(content: Faker::Lorem.sentence, 
																user_id: user.id, 
																post_id: post.id)
		end
		2.times do 
			comment_real_user = Comment.create!(content: Faker::Lorem.sentence, 
															user_id: real_user.id, 
															post_id: post.id)
			comment_real_user2 = Comment.create!(content: Faker::Lorem.sentence, 
															user_id: real_user2.id, 
															post_id: post.id)
		end
		
	end
end