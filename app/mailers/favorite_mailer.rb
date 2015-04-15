class FavoriteMailer < ApplicationMailer
  default from: "rachelcolby11@gmail.com"

   def new_comment(user, post, comment)
 
     headers["Message-ID"] = "<comments/#{comment.id}@bloccit-rc.herokuapp.com>"
     headers["In-Reply-To"] = "<post/rachelcolby11+#{post.id}@gmail.com>"
     headers["References"] = "<post/#{post.id}@bloccit-rc.herokuapp.com>"
 
     @user = user
     @post = post
     @comment = comment
 
     mail(to: user.email, subject: "New comment on #{post.title}")
   end

end
