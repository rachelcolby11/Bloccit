 require 'rails_helper'
 
 describe User do
 
   include TestFactories
 
   describe "#favorited(post)" do

      before do
       @user = authenticated_user
       @post = associated_post
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
 end