class PatientSerializer < ActiveModel::Serializer
  attributes :id, :name, :first_name, :last_name

  def name
    "#{ object.name.presence } #{ object.last_name.presence }".strip
  end

  def first_name
    "#{ object.name.presence }".strip
  end
end
