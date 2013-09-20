class Institution < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	scope :hospitals, -> { where(category: 'Hospitales') }
	scope :pharms, -> { where(category: 'Farmacias') }
end