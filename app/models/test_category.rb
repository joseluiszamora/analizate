class TestCategory < ActiveRecord::Base
  has_ancestry

  default_scope order(:description)

  has_many :tests, dependent: :destroy
end
