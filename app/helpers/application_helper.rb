module ApplicationHelper
  def check_category(analysis, category)
    ids = analysis.categories.pluck(:ancestry)
    ids.map { |e| e.to_i }.include?(category.id)
  end

  def check_subcategory(analysis, subcategory)
    analysis.categories.pluck(:id).include?(subcategory.id)
  end

  def get_categories
    TestCategory.roots
  end

  def get_childrens
    TestCategory.childrens.map { |t| [t.full_description, t.id] }
  end

  def get_notices
    Notice.all
  end

  def get_result_for(analysis, test)
    analysis.laboratories.find_by_test_id(test.id) rescue nil
  end

  def get_test_category_roots
    TestCategory.roots.map { |t| [t.description, t.id] }
  end

  def get_user_type
    User::USER_TYPE.map { |ut| [I18n.t(ut, scope: 'user.user_type'), ut] }
  end
end
