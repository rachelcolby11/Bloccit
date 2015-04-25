class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comments = @post.comments

    @comment = current_user.comments.build( comment_params )
    @comment.post = @post
    @new_comment = Comment.new

    authorize @comment

    @comment.save

    respond_to do |format|
      format.html
      format.js
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