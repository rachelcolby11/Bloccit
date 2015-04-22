require 'rails_helper'
 
 describe Comment do
 
   include FactoryGirl
 
   describe "after_create" do
 
     before do
       @post = create(:post)
       @user = create(:user, email_favorites: true)
       @commenter = create(:user)
       @comment = build(:comment, post: @post, user_id: @commenter.id)
     end
 
      context "with user's permission" do

     it "sends an email to users who have favorited the post" do
       favorite = @post.favorites.create(user: @user)
 
       allow( FavoriteMailer )
         .to receive(:new_comment)
         .with(@user, @post, @comment)
         .and_return( double(deliver_now: true) )

         expect( FavoriteMailer )
           .to receive(:new_comment)
 
      result = @comment.save
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