# encoding: utf-8
class InstitutionSerializer < ActiveModel::Serializer
  attributes :category, :name, :address, :phone, :mail, :web, :desc, :logo_base64

  def logo_base64
    begin
      img = File.open(object.image.thumb.path) { |io| io.read }
      Base64.encode64(img).to_s
    rescue Exception => msg
      # none
    end
  end
end
