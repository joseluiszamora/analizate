class Institution < ActiveRecord::Base
	scope :hospitals, -> { where(category: 'Hospitales') }
	scope :pharms, -> { where(category: 'Farmacias') }
end
