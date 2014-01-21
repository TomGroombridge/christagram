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

end
