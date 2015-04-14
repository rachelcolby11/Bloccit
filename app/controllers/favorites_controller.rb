class FavoritesController < ApplicationController
    def create
     @post = Post.find(params[:post_id])
     @favorite = current_user.favorites.build(post: @post)
     authorize @favorite

     if @favorite.save 
       flash[:notice] = "\"#{@post.title}\" was favorited."
       redirect_to [@post.topic, @post]
     else
       flash[:error] = "There was an error favoriting the post. Please try again."
       redirect_to [@post.topic, @post]
     end
    end

  def destroy
    @post = Post.find(params[:post_id])
    @favorite = current_user.favorites.find_by_post_id(@post.id)
    #@favorite = Post.find(favorite.where(params[:user_id]))
    #favorite = @post.favorites.where(post_id: @post.id).first
    authorize @favorite

   if @favorite.destroy
       flash[:notice] = "\"#{@post.title}\" was unfavorited."
       redirect_to [@post.topic, @post]
   else
      flash[:error] = "There was an error. Please try again."
      redirect_to [@post.topic, @post]   
    end
 end

end
