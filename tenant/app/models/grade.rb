class Grade
  include Virtus.model

  attribute :points, Integer
  attribute :comments, String
end

class GradeType < ActiveRecord::Type::Value
  def deserialize(value)
    decoded = ActiveSupport::JSON.decode(value)
    Grade.new(decoded)
  end

  def changed_in_place?(raw_old_value, new_value)
    serialize(new_value) != raw_old_value
  end

  def serialize(value)
    value.to_json
  end
end

