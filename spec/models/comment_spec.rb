require 'rails_helper'
 
 describe Comment do
 
   include TestFactories
 
   describe "after_create" do
 
     before do
       @post = associated_post
       @user = authenticated_user(email_favorites: true)
       @commenter = authenticated_user
       @comment = Comment.new(body: 'My comment is really great', post: @post, user_id: @commenter)
     end
 
      context "with user's permission" do

     it "sends an email to users who have favorited the post" do
       favorite = @user.favorites.create(post: @post)
       Rails.logger.info ">>>> Favorite: #{favorite.inspect}"
 
       allow( FavoriteMailer )
         .to receive(:new_comment)
         .with(@user, @post, @comment)
         .and_return( double(deliver_now: true) )

         expect( FavoriteMailer )
           .to receive(:new_comment)
 
      result = @comment.save
      Rails.logger.info ">>>>> #{result}"
      result
     end
 
     it "does not send emails to users who haven't" do
       expect( FavoriteMailer )
         .not_to receive(:new_comment)
 
       @comment.save
     end
   end

   context "without permission" do

    before { @user.update_attribute(:email_favorites, false) }

    it "does not send emails, even to users who have favorited" do
      @user.favorites.where(post: @post).create

      expect( FavoriteMailer )
        .not_to receive(:new_comment)

      @comment.save
      end
    end

   end
 end