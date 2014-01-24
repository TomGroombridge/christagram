class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment].permit(:commenter, :body))
    if @comment.save
      redirect_to post_path(@post)
    else 
      "gello"
    end
  end

end
