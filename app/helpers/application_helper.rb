module ApplicationHelper
  def get_test_category_roots
    TestCategory.roots.map { |t| [t.description, t.id] }
  end

  def get_user_type
    User::USER_TYPE.map { |ut| [I18n.t(ut, scope: 'user.user_type'), ut] }
  end
end
