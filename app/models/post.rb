class Post < ActiveRecord::Base
  has_attached_file :image, :styles => { thumb: "300x300>" }
end
