class Post < ActiveRecord::Base
  has_attached_file :image, 
  :styles => { thumb: "300x300>" },
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
      tag_name.downcase.gsub(/[^a-z]/, '')
      Tag.find_or_create_by(name: tag_name)
    end
  end

  def self.for_tag_or_all(tag_name)
    tag_name ? Tag.find_by(name: tag_name).posts : all
    

  end

end
