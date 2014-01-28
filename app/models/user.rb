class User < ActiveRecord::Base
	has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end


  def self.find_for_facebook_oauth(auth)
    where(auth.slice(:uid)).first_or_initialize.tap do |user|
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]

      user.save!
    end
  end

end