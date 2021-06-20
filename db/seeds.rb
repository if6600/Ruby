Post.destroy_all
Promo.destroy_all
Category.destroy_all
User.destroy_all

admin = User.new(
  :email => "admin@first.dog",
  :username => "Admin",
  :password => "123456",
  :password_confirmation => "123456",
  :isadmin => true
)
admin.save!
puts "Created admin with id #{ admin.id }"

categories = [
  {
    name: "Коты",
    description: "Категория о котах"
  },
  {
    name: "Собаки",
    description: "Категория о собаках"
  },
]

categories.each do |category|
  category_ = Category.create(category)
  category_.save!
  puts "Created category #{ category_.name } with id #{ category_.id }!"
end

posts = [
  {
    title: "Шарик",
    content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    is_published: true,
    user_id: User.all.ids[0],
    category_id: Category.all.ids[1],
    image: File.open(Rails.root.join('public', 'images', 'picturedog.png')),
    tag_list: %w[собаки помощь приют]
  },
  {
    title: "Пушок",
    content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    is_published: true,
    user_id: User.all.ids[0],
    category_id: Category.all.ids[0],
    image: File.open(Rails.root.join('public', 'images', 'picturecat.png')),
    tag_list: %w[коты тег1]
  }
]

puts posts

posts.each do |post|
  post_ = Post.create(post)
  post_.save!
  puts "Created post #{ post_.title } with id #{ post_.id }!"
end

promos = [
  {
    title: "Новость 1",
    content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
    user_id: User.all.ids[0],
    image: File.open(Rails.root.join('public', 'images', 'promo1.jpg')),
  tag_list: %w[новости тег2]
  },
  {
    title: "Новость 2",
    content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    user_id: User.all.ids[0],
    image: File.open(Rails.root.join('public', 'images', 'promo2.jpg'))
  },
  {
    title: "Новость 3",
    content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    user_id: User.all.ids[0],
    image: File.open(Rails.root.join('public', 'images', 'promo3.jpg'))
  },
  {
    title: "Новость 4",
    content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    user_id: User.all.ids[0],
    image: File.open(Rails.root.join('public', 'images', 'promo2.jpg'))
  },
  {
    title: "Новость 5",
    content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    user_id: User.all.ids[0],
    image: File.open(Rails.root.join('public', 'images', 'promo1.jpg')),
    tag_list: %w[новости тег4 собаки]
  }
]

promos.each do |promo|
  promo_ = Promo.create(promo)
  promo_.save!
  puts "Created promo #{ promo_.title } with id #{ promo_.id }!"
end
