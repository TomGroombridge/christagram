class LikesController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		Like.create(up: params[:up], post: @post)

		redirect_to '/posts'
	end
end
