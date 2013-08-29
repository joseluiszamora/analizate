class InstitutionSerializer < ActiveModel::Serializer
  attributes :id, :category, :name, :address, :desc, :phone, :mail, :web
end
