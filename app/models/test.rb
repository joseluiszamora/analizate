class Test < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  
  belongs_to :test_category

  has_many :laboratories, dependent: :destroy
  has_many :analyses, through: :laboratories, dependent: :destroy

  default_scope { order(:level) } 

  def test_category_description
    test_category.present? ? test_category.description : ''
  end

  def test_category_category
  	test_category.present? ? test_category.category : ''
  end
end