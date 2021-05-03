Post.destroy_all
Category.destroy_all
User.destroy_all

admin = User.new(
  :email                 => "admin@first.dog",
  :password              => "123456",
  :password_confirmation => "123456",
  :isadmin               => true
)
admin.save!
puts "Created admin with id #{ admin.id }"

categories = [
  {
	name: "Категория 1",
	description: "Описание категории 1"
  },
	{
		name: "Категория 2",
		description: "Описание категории 2"
	},
]

categories.each do |category|
	category_ = Category.create(category)
	category_.save!
	puts "Create category #{ category_.name } with id #{ category_.id }!"
end

posts = [
{
	name: "собака",
	title: "Шарик",
	content: "Лиза",
  user_id: User.all.ids[0],
  category_id: Category.all.ids[0],
	image: File.open(Rails.root.join('public', 'images', 'picturecat.png'))
},
{
	name: "кошка",
	title: "Пушок",
	content: "Полина",
	user_id: User.all.ids[0],
	category_id: Category.all.ids[1],
	image: File.open(Rails.root.join('public', 'images', 'picturedog.png'))
}
]

puts posts

posts.each do |post|
	post_ = Post.create(post)
  post_.save!
	puts "Created post #{ post_.name } with id #{ post_.id }!"
end
