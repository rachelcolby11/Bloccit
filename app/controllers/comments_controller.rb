class CommentsController < ApplicationController

  def create 
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    authorize @comment
    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "There was an error saving the comment. Please try again"
      render @post
    end
  end

  def destroy
     @post = Post.find(params[:post_id])
     @comment = @post.comments.find(params[:id])
 
     authorize @comment
     @comment.destroy

     respond_to do |format|
      format.html
      format.js
      end
   end

  def comment_params
    params.require(:comment).permit(:body)
  end

end