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

Show.create(name: 'Arrow', started_date: "2012-10-10", ended_date: 'present', country: "US", network: 'The CW', status: 'Ended', image: "https://static.episodate.com/images/tv-show/thumbnail/29560.jpg"
)
Show.create(name: 'Lucifer', started_date: "2016-01-25", ended_date: 'present', country: "US", network: 'FOX', status: 'Running', image: "https://static.episodate.com/images/tv-show/thumbnail/43467.com"
)
Show.create(name: 'Supergirl', started_date: "2015-10-26", ended_date: 'present', country: "US", network: 'The CW', status: 'Running', image: "https://static.episodate.com/images/tv-show/thumbnail/43234.jpg"
)


SavedShow.create(rating: 4, watch_date:'2020-05-21', show_id: 1, user_id: 1)
SavedShow.create(rating: 4, watch_date:'2020-05-21', show_id: 2, user_id: 2)
SavedShow.create(rating: 4, watch_date:'2020-05-21', show_id: 3, user_id: 3)


