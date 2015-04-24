 require 'rails_helper'
 
 describe User do
 
   include FactoryGirl
 
   describe "#favorited(post)" do

      before do
       @user = create(:user)
       @post = create(:post)
     end

     it "returns `nil` if the user has not favorited the post" do
      expect( @user.favorites.find_by_post_id(@post.id) ).to be_nil
     end
 
     it "returns the appropriate favorite if it exists" do
      @user.favorites.create(post: @post)
      expect( @user.favorites.last ).to eq(@user.favorites.find_by_post_id(@post.id))
     end

     it "returns `nil` if the user has favorited another post" do
      new_post = Post.create(title: 'Other post', body: 'Post bodies must be pretty long.')
      @user.favorites.create(post: new_post)
      expect( @user.favorites.find_by_post_id(@post.id) ).to be_nil
     end
   end

    describe ".top_rated" do
 
      before do 
       @user = create(:user_with_post_and_comment)
       @post = @user.posts.first
       @comment = @user.comments.first     
 
       @user2 = create(:user)
       post = create(:post, user: @user2)
       2.times { create(:comment, user: @user2, post: post) }
     end
 
     it "returns users ordered by comments + posts" do
       expect( User.top_rated ).to eq([@user2, @user])
     end
 
     it "stores a `posts_count` on user" do
       users = User.top_rated
       expect( users.first.posts_count ).to eq(1)
     end
 
     it "stores a `comments_count` on user" do
       users = User.top_rated
       expect( users.first.comments_count ).to eq(2)
     end
   end
 end