class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post].permit(:title, :content))
    if @post.save
      redirect_to '/posts'
    else
      redirect_to '/posts/new'
    end
  end

  def index
    @posts = Post.all
  end

end
