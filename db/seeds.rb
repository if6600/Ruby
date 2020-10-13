Post.destroy_all
puts "Destroyed everything you touch"
posts = [
{
	name: "New Album",
	title: "The Bad Seeds",
	author: "Nick Cave",
	content: "Tracklist"
},
{
	name: "Old Album",
	title: "The Bad Seeds Old",
	author: "Nick Cave Old Too",
	content: "Some Old Tracklist"
}
]

posts.each do |post|
	postik = Post.create(post)
	puts "Some magic just create a #{ postik.name } with id #{ postik.id }!"
end
