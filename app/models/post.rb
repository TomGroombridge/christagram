class Post < ActiveRecord::Base
  validates_presence_of :title, :message => "should happen once per year"
  after_create :send_new_post_email
  has_many :comments
  has_many :likes
  has_attached_file :image, 
  :styles => { thumb: "300x300^", small: "150x150>" },

  #resize the image first and then crop????

  # :convert_options => { 
  # :thumb => "-gravity Center -crop 1600x1000+0+0 +repage -resize 300x300^" },
  # :default_style => :thumb,
  storage: :s3,
  s3_credentials: {
    access_key_id: 'AKIAJIT2TOCWJOPENM7Q',
    secret_access_key: Rails.application.secrets.s3_secret
  },
  bucket: 'christagram_development'

  # def resize     
  #  geo = Paperclip::Geometry.from_file(image.to_file(:original))
  #  height = (geo.width.to_i * 60)/100
  #  width = geo.width     
  #  "#{width.round}x#{height.round}!"    
  # end  

  belongs_to :user

  has_and_belongs_to_many :tags



  def tag_names
    tags.map { |tag| tag.name }.join(', ')
  end

  def tag_names=(tag_names)
    self.tags = Tag.find_or_create_from_tag_names(tag_names)
  end

  def self.for_tag_or_all(tag_name)
    tag_name ? Tag.find_by(name: tag_name).posts : all
  end

  def send_new_post_email
    PostMailer.new_post(self, user).deliver! if user
  end

  def points
    likes.where(up: true).count
  end

end
