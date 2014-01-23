class ChargesController < ApplicationController

before_filter :authenticate_user!

	def create
		@post = Post.find params[:post_id]
	  # Amount in cents
	  @amount = 1000

	  customer = Stripe::Customer.create(
	    :email => current_user.email,
	    :card  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Print of' + @post.title,
	    :currency    => 'GBP'
	  )

	  flash[:notice] = 'Payment succeeded'
	  # Order.create(user: current_user, amount: @amount)
	  redirect_to '/posts'
	  #email

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to post_path(@post)
	end
end
