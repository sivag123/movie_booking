# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Show.create([{show_time: "10:00:00"}, {show_time: "13:00:00"}, {show_time: "16:00:00"}, {show_time: "19:00:00"}])
kabali_movie = Movie.create(name: "Kabali", language: 2, currency: 1, ticket_fee: 120, crew_info:"Hero: RajniKanth")
dhoni_movie = Movie.create(name: "M S Dhoni", language: 1, currency: 1, ticket_fee: 150, crew_info: "Hero:Sushant singh rajput")
cinepolis = Theater.create(name: "Cinepolis", city: "Pune", state: "maharashtra", country: "India", show_ids: "1,2,3,4")
sathyam = Theater.create(name: "Sathyam", city: "Chennai", state: "Tamilnadu", country: "India", show_ids: "1,2,3,4")
MovieScreen.create(movie_id: kabali_movie.id, theater_id: sathyam.id, show_id: 1, show_date: "2016-10-10", total_seats: 100, booked_seats: 0, remaining_seats: 100)
MovieScreen.create(movie_id: dhoni_movie.id, theater_id: cinepolis.id, show_id: 1, show_date: "2016-10-10", total_seats: 100, booked_seats: 0, remaining_seats: 100)
