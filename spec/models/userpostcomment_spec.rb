require 'rails_helper'
 
 describe User_with_Post_and_Comment do
 
   include FactoryGirl
 
  before do 
    create(:user_with_post_and_comment)
  end

  it "creates a user" do
    expect(user).to eq true
  end

  it "creates a post" do
    expect(post).to eq true
  end

  it "creates comment" do
    expect(comment).to eq true
  end

end