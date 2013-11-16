class InstitutionSerializer < ActiveModel::Serializer
  attributes :category, :name, :address, :phone, :mail, :web, :desc, :logo

  def logo
    object.image.url(:thumb).to_s
  end
end
