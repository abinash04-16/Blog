class Blog < ApplicationRecord
	mount_uploader :image, BlogUploader
	belongs_to :user
	has_many :comments
end
