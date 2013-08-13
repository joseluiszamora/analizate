class TestCategory < ActiveRecord::Base
  has_ancestry

  has_many :tests, dependent: :destroy
end
