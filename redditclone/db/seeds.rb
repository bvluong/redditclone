# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
user1 = User.create(username:"bryant", password:"password")
user2 = User.create(username:"kevin", password:"password")
user3 = User.create(username:"john", password:"password")
user4 = User.create(username:"david", password:"password")

Sub.destroy_all
sub1 = Sub.create(title: "movies", description:"Subbreddit about movies", user_id: user1.id)
sub2 = Sub.create(title: "funny", description:"Subbreddit about funny", user_id: user2.id)
sub3 = Sub.create(title: "videos", description:"Subbreddit about videos", user_id: user3.id)
sub4 = Sub.create(title: "pizza", description:"Subbreddit about pizza", user_id: user1.id)
sub5 = Sub.create(title: "gif", description:"Subbreddit about gifs", user_id: user4.id)
sub6 = Sub.create(title: "music", description:"Subbreddit about music", user_id: user1.id)
Post.destroy_all
PostSub.destroy_all
post1 = Post.new(title:"first post", content: "Wow this is the first post", user_id: user1.id, sub_ids: [sub1.id, sub2.id, sub3.id])
post2 = Post.new(title:"second post", content: "Wow this is the second post", user_id: user1.id, sub_ids: [sub6.id, sub5.id, sub4.id])
post3 = Post.new(title:"third post", content: "Wow this is the third post", user_id: user2.id, sub_ids: [sub1.id, sub2.id, sub3.id])
post4 = Post.new(title:"asdfasds post", content: "Wow this is the asdfasds post", user_id: user4.id,sub_ids: [sub4.id, sub5.id, sub6.id])
post5 = Post.new(title:"first post", content: "Wow this is the first post", user_id: user3.id, sub_ids: [sub1.id, sub2.id, sub3.id])
# post_sub1= PostSub.create(post_id: 1, sub_id: sub1.id)
# post_sub2= PostSub.create(post_id: 1, sub_id: sub2.id)
# post_sub3= PostSub.create(post_id: 2, sub_id: sub3.id)
# post_sub4= PostSub.create(post_id: 1, sub_id: sub4.id)
# post_sub5= PostSub.create(post_id: 3, sub_id: sub5.id)
# post_sub6= PostSub.create(post_id: 4, sub_id: sub6.id)
# post_sub7= PostSub.create(post_id: 5, sub_id: sub4.id)
# post_sub8= PostSub.create(post_id: 6, sub_id: sub3.id)
# post_sub9= PostSub.create(post_id: 7, sub_id: sub2.id)
post1.save
post2.save
post3.save
post4.save
post5.save
