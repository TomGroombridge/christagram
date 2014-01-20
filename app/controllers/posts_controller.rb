class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post].permit(:title, :content, :image))
    if @post.save
      redirect_to '/posts'
    else
      redirect_to '/posts/new'
    end
  end

  def index
    @posts = Post.all
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def show
    @post=Post.find(params[:id])
  end

  def edit
    @post=Post.find(params[:id])
  end

  def update
    @post = Post.find params[:id]
    @post.update params[:post].permit(:title, :content, :image)

    redirect_to '/posts'
  end


end
