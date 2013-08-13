class Test < ActiveRecord::Base
  belongs_to :test_category

  def test_category_description
    test_category.present? ? test_category.description : ''
  end
end
