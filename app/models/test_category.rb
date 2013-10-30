class TestCategory < ActiveRecord::Base
  has_ancestry

  default_scope -> { order(:level) }

  scope :childrens, -> { where('ancestry IS NOT ? OR ancestry != ?', nil, '') }

  has_many :tests, dependent: :destroy
end