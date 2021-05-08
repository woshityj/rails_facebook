# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(email: "yujietan84@gmail.com", name: "Yu Jie", username: "woshityj", password: "password123")
User.create(email: "testing123@gmail.com", name: "Testing123", username: "testing123", password: "password123")

Post.create(post: "This is my first testing post", user_id: 1)
Post.create(post: "This is my second testing post", user_id: 2)

Comment.create(comment: "This is my first testing comment", post_id: 1, user_id: 2)