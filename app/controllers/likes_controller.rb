class LikesController < ApplicationController

	before_filter :authenticate_user!

	def create
		@post = Post.find(params[:post_id])
		like = Like.new(up: params[:up], post: @post)

		if like.save
			WebsocketRails[:likes].trigger 'new', { id: @post.id, points: @post.points }
		end

		redirect_to '/posts'
	end

end
