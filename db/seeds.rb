# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{ username: 'user1', password: 'password'}, { username: 'user2', password: 'password' }])
posts = Post.create([{ title: "Something long enough", user_id: 1, body: "Text goes here, I hope." },
                     { title: "This is a title", body: "Yep, this is some text.", user_id: 1 }])
