class LikesController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		Like.create(up: params[:up], post: @post)
		
		WebsocketRails[:likes].trigger 'new', { id: @post.id, points: @post.points }

		redirect_to '/posts'
	end
end
