class PostsController < ApplicationController

  
  def new
    @post = Post.new
  end

  def create 
    @post = Post.new(params[:post].permit(:title, :content, :image, :tag_names))
    @post.user = current_user
    if @post.save
      redirect_to '/posts'
    else
      render 'new'
    end
  end

  def index
    redirect_to welcome_index_path if !current_user 
    @posts = Post.for_tag_or_all(params[:tag_id]).order('created_at DESC')
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

  private

  def fetch_post
    @post = Post.find(params[:id])
  end


end
