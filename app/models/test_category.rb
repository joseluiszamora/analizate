class TestCategory < ActiveRecord::Base
  has_ancestry

  default_scope -> { order(:description) }

  scope :childrens, -> { where('ancestry IS NOT ? OR ancestry != ?', nil, '') }

  has_many :tests, dependent: :destroy
end
