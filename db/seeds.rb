# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# image_path = "#{Rails.root}/path/to/image_file.extension"
# image_file = File.new(image_path)


user = User.create!(username:'MaZaHaKeR', password: 'qwerty', email: "admin@admin.ru")
user2 = User.create!(username:'Ololoev', password: 'qwerty', email: "ololoev@mail.ru")

post = Post.create!(image: File.new("#{Rails.root}/app/assets/images/standart.jpg"),
										caption: "Come caption for post", user_id: user.id)
post2 = Post.create!(image: File.new("#{Rails.root}/app/assets/images/standart.jpg"),
										caption: "Some caption for post la la la la la", user_id: user2.id)

# Image.create(
#   :id => 52,
#   :post_id => post.id,
#   :asset => ActionDispatch::Http::UploadedFile.new(
#     :filename => File.basename(image_file),
#     :tempfile => image_file,
#     # detect the image's mime type with MIME if you can't provide it yourself.
#     :type => MIME::Types.type_for(image_path).first.content_type
#   )
# )