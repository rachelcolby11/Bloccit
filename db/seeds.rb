 require 'faker'
 
  # Create Users
 5.times do
   user = User.new(
     name:     Faker::Name.name,
     email:    Faker::Internet.email,
     password: Faker::Lorem.characters(10)
   )
   user.skip_confirmation!
   user.save!
 end

 users = User.all
 
 # Note: by calling `User.new` instead of `create`,
 # we create an instance of User which isn't immediately saved to the database.
 
 # The `skip_confirmation!` method sets the `confirmed_at` attribute
 # to avoid triggering an confirmation email when the User is saved.
 
 # The `save` method then saves this User to the database.
 
 # Create Posts
 50.times do
   Post.create!(
        user:   users.sample,
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end
 posts = Post.all

 # post = Post.where(title: "My unique title").first
 # unless post
 #   post = Post.create!(
 #      user: users.sample,
 #    title: "My unique title",
 #    body: "My unique body"
 #   )
 # end
 
 # Create Comments
 100.times do
   Comment.create!(
       # user: users.sample,   # we have not yet associated Users with Comments
     post: posts.sample,
     body: Faker::Lorem.paragraph
   )
 end

  # comment = post.comments.where(body: "This is my comment from the seed").first
  # unless comment    
  #   Comment.create(post: post, body: "This is my comment from the seed")
  # end

 user = User.first
 user.skip_reconfirmation!
 user.update_attributes!(
   email: 'rachiec189@hotmail.com',
   password: 'helloworld'
 )
 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
