# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: 'bob', password: 'password')
User.create(username: 'ashley', password: 'password')
User.create(username: 'lisa', password: 'password')

response = RestClient.get('https://www.episodate.com/api/most-popular?page=1')
  tv_shows_array = JSON.parse(response)["tv_shows"]
  tv_shows_array.each do |show|
    Show.create(name: show["name"], start_date: show["start_date"], end_date: show["end_date"], network: show["network"], country: show["country"], status: show["status"], image_thumbnail_path: show["image_thumbnail_path"]
    )
end

SavedShow.create(rating: 4, show_id: 3, user_id: 1)
SavedShow.create(rating: 4, show_id: 4, user_id: 2)
SavedShow.create(rating: 4, show_id: 2, user_id: 3)


Review.create(spoiler: "true", content: "It was ok. Oliver Queen dies.", saved_show_id: 1)
Review.create(spoiler: "false", content: "Very interesting, but stopped at season 3 cuz I was busy.", saved_show_id: 3)
Review.create(spoiler: "false", content: "Heard it was really good from a friend and so far it is.", saved_show_id: 2)
Review.create(spoiler: "false", content: "The characters are so twisted", saved_show_id: 3)



