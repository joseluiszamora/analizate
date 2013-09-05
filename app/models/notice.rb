class Notice < ActiveRecord::Base
	mount_uploader :image, ImagesUploader
end
