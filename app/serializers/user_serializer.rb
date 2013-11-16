class UserSerializer < ActiveModel::Serializer
  attributes :full_name, :email, :phone, :cellular, :address, :specialty_name, :observations, :avatar

  def auth_token
    "#{ object.authentication_token }"
  end

  def observations
   ActionView::Base.full_sanitizer.sanitize object.notes.to_s
  end

  def avatar
    object.image.url(:thumb).to_s
  end
end
