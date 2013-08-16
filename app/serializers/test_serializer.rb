class TestSerializer < ActiveModel::Serializer
  attributes :id, :parameter, :result, :unit, :reference_values, :test_type, :description, :image
  has_one :test_category
end
