class CommentsController < ApplicationController
 	before_filter :authenticate_user!
 	# use this to make sure only signed in users can acees comments
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment].permit(:commenter, :body))
    if current_user
    @comment.user = current_user
end
    if @comment.save
      redirect_to post_path(@post)
    else 
      "gello"
    end
  end

end
