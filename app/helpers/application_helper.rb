module ApplicationHelper
  def check_category(analysis, category)
    ac = analysis.categories.first
    ac.present? && ac.parent_id == category.id
  end

  def check_subcategory(analysis, subcategory)
    sc = analysis.categories.first
    sc.present? && sc.id == subcategory.id
  end

  def get_categories
    TestCategory.roots
  end

  def get_childrens
    TestCategory.childrens.map { |t| [t.full_description, t.id] }
  end

  def get_test_category_roots
    TestCategory.roots.map { |t| [t.description, t.id] }
  end

  def get_user_type
    User::USER_TYPE.map { |ut| [I18n.t(ut, scope: 'user.user_type'), ut] }
  end
end
