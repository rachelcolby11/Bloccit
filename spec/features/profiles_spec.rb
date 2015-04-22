 require 'rails_helper'

  include Warden::Test::Helpers
  Warden.test_mode!
 
 describe "Visiting profiles" do
 
   include FactoryGirl
 
   before do
     @user = create(:user) 
     @post = create(:post, user: @user) 
     @comment = create(:comment, user: @user, post: @post) 
     
  end
 
   describe "not signed in" do
 
     it "shows profile" do
       visit user_path(@user)
       expect(current_path).to eq(user_path(@user))

       expect( page ).to have_content(@user.name)
       expect( page ).to have_content(@post.title)
       expect( page ).to have_content(@comment.body)
     end
   end

   describe "signed in" do
 
    before do
      user = @user
      login_as(user, :scope => :user)
    end

     it "shows profile" do
       visit user_path(@user)
       expect(current_path).to eq(user_path(@user))

       expect( page ).to have_content(@user.name)
       expect( page ).to have_content(@post.title)
       expect( page ).to have_content(@comment.body)
     end
   end

 end

RSpec.configure do |config|
  config.after :each do
    Warden.test_reset!
  end
end