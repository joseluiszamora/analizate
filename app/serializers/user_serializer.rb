class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :auth_token

  def auth_token
    "#{ object.authentication_token }"
  end
end
