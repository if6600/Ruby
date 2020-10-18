Post.destroy_all
puts "Destroyed everything you touch"
posts = [
{
	name: "New Album",
	title: "The Bad Seeds",
	author: "Nick Cave",
	content: "Tracklist",
	image: File.open(Rails.root.join('public', 'images', 'pic-1.png'))
},
{
	name: "Old Album",
	title: "The Bad Seeds Old",
	author: "Nick Cave Old Too",
	content: "Some Old Tracklist",
	image: open("https://in-sound.ru/upload/iblock/d85/d859aa8387fd5fcd7a933be2af91066b.jpg")
}
]

posts.each do |post|
	postik = Post.create(post)
	puts "Some magic just create a #{ postik.name } with id #{ postik.id }!"
end
