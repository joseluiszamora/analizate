class Laboratory < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  
  belongs_to :analysis
  belongs_to :test
end
