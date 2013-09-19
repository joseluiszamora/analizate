class Notice < ActiveRecord::Base
  mount_uploader :image, ImageUploader
end
