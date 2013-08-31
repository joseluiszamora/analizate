class Test < ActiveRecord::Base
  belongs_to :test_category

  has_many :analysis_tests, dependent: :destroy
  has_many :analysis_categories, through: :analysis_tests, dependent: :destroy

  def test_category_description
    test_category.present? ? test_category.description : ''
  end
end
