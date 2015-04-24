 FactoryGirl.define do
   factory :post do
     title "Post Title"
     body "Post bodies must be pretty long."
     user
     topic { Topic.create(name: 'Topic name') }
   end

    factory :comment do
     body "This is a new comment."
     user
     post
   end

    factory :user do
     name "Grace Hopper"
     sequence(:email, 100) { |n| "person#{n}@example.com" }
     password "helloworld"
     password_confirmation "helloworld"
     confirmed_at Time.now

   factory :user_with_post_and_comment, class: User do
      transient do
      posts_count 1
      comments_count 1
      end
    end
    #user = build(:user)

    after(:create) do |user, post, comment|
      create_list(:post, user: user)
      create_list(:comment, user: user)

      #post = create(post: {post.create(:user, topic { Topic.create(name: 'Topic name') })
      #comment = comment.create(:user, :post)
    end
    end
  end



# Define the factory within the factory :user definition, 
# so you don't have to repeat most of the attribute definitions.

# Because of the direction of associations, 
# comments and posts have user IDs, not the other way around. 
# Therefore, use an after(:build).

# Use the user_with_post_and_comment factory in your users specs.
