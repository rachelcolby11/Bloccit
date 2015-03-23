 require 'faker'
 
 # Create Posts
 50.times do
   Post.create!(
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end
 posts = Post.all

 post = Post.where(title: "My unique title").first
 unless post
   post = Post.create!(
    title: "My unique title",
    body: "My unique body"
   )
 end
 
 # Create Comments
 100.times do
   Comment.create!(
     post: posts.sample,
     body: Faker::Lorem.paragraph
   )
 end

  comment = post.comments.where(body: "This is my comment from the seed").first
  unless comment    
    Comment.create(post: post, body: "This is my comment from the seed")
  end

 #create ads
 50.times do
   Advertisement.create!(
     title:  Faker::Lorem.sentence,
     copy:   Faker::Lorem.paragraph
   )
 end
 ads = Advertisement.all

 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
