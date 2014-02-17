class Like < ActiveRecord::Base
  belongs_to :post
  # validates :post_id, uniqueness: { scope: :user_id, message: 'lol' }
end
