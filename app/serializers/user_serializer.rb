class UserSerializer < ActiveModel::Serializer
  attributes :full_name, :email, :phone, :cellular, :address, :specialty_name, :observations, :avatar_base64

  def auth_token
    "#{ object.authentication_token }"
  end

  def observations
   ActionView::Base.full_sanitizer.sanitize object.notes.to_s
  end

  def avatar_base64
    begin
      img = File.open(object.image.thumb.path) { |io| io.read }
      Base64.encode64(img).to_s
    rescue Exception => msg
      # none
    end
  end
end
