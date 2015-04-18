class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

    validates :body, length: { minimum: 5 }, presence: true
    validates :post, presence: true
    validates :user, presence: true

   after_create :send_favorite_emails
 
   private
 
   def send_favorite_emails
     post.favorites.each do |favorite|
        if should_receive_update_for?(favorite)
          Rails.logger.debug ">>>> sending email"
         FavoriteMailer.new_comment(favorite.user, self.post, self).deliver_now
       end
     end
   end
 
   def should_receive_update_for?(favorite)
     success = (user_id != favorite.user_id) && favorite.user.email_favorites?
     Rails.logger.debug ">>>>> Should i send the email: #{success}"
     success
   end

end
