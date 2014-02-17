class PostMailer < ActionMailer::Base
  default from: "chris@christagram.com"

  def new_post(post, user)
    @post = post
    mail to: user.email, subject: "Thanks for the post!"
  end

end
