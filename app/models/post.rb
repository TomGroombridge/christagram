class Post < ActiveRecord::Base
  has_attached_file :image, 
  :styles => { thumb: " ", small: "150x150>" },
  :convert_options => { 
  :thumb => "-gravity Center -crop 500x500+0+0 +repage -resize 300x300^" },
  :default_style => :thumb,
  storage: :s3,
  s3_credentials: {
    access_key_id: 'AKIAJIT2TOCWJOPENM7Q',
    secret_access_key: Rails.application.secrets.s3_secret
  },
  bucket: 'christagram_development'

  belongs_to :user

  has_and_belongs_to_many :tags

  def tag_names
    tags.map { |tag| tag.name }.join(', ')
  end

  def tag_names=(tag_names)
    self.tags = tag_names.downcase.split(', ').map do |tag_name|
      Tag.find_or_create_by(name: tag_name)
    end
  end

end
